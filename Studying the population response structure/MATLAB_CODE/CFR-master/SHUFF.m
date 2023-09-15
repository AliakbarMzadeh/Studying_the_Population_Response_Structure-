clear all; close all; clc;

load UnitsData.mat;

n = 481;
nbins = 60; 
moveAVG = 0;
t = linspace(-1.2,2,nbins);

data = zeros(6,n,nbins);

for i = 1:n
    tmp = myPSTH(Unit,i,nbins,moveAVG);
    for cnd = 1:6
        data(cnd,i,:) = tmp(cnd,:);
    end
end
dataTensor = permute(data,[3 2 1]);

rng('shuffle','twister') % randomize the seed
surrogate_type = 'surrogate-TNC';
model_dim = 6;
times_msk = t>0 & t<2; % select movement-related times
[R2_data] = summarizeLDS(dataTensor(times_msk, :, :), model_dim, false); % function that evaluates the summary statistic of the LDS structure
[targetSigmaT, targetSigmaN, targetSigmaC, M] = extractFeatures(dataTensor);
numSurrogates = 100;
params = [];
params.readout_mode = 2; % select readout mode (eg neuron mode)
params.shfl_mode = 3; % shuffle across tensor mode (eg condition mode)
params.fix_mode = 2; % shuffle per mode (shuffle for each neuron independently)
if strcmp(surrogate_type, 'surrogate-T')
    params.margCov{1} = targetSigmaT;
    params.margCov{2} = [];
    params.margCov{3} = [];
    params.meanTensor = M.T;
elseif strcmp(surrogate_type, 'surrogate-TN')
    params.margCov{1} = targetSigmaT;
    params.margCov{2} = targetSigmaN;
    params.margCov{3} = [];
    params.meanTensor = M.TN;
elseif strcmp(surrogate_type, 'surrogate-TNC')
    params.margCov{1} = targetSigmaT;
    params.margCov{2} = targetSigmaN;
    params.margCov{3} = targetSigmaC;
    params.meanTensor = M.TNC; 
else
    error('please specify a correct surrogate type') 
end
R2_surr = nan(numSurrogates, 1);
for i = 1:numSurrogates
    fprintf('surrogate %d from %d, ', i, numSurrogates)
    [surrTensor] = sampleCFR(dataTensor, params);       
    [R2_surr(i)] = summarizeLDS(surrTensor(times_msk, :, :), model_dim, false);
end