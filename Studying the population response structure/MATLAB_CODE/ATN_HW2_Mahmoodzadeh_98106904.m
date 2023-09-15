%% HW #2_Aliakbar Mahmoodzadeh_ Student No: 98106904

%% Part1 

%%
clear; clc; close all;
load UnitsData.mat

window = 0.08;
num_units_to_plot = 10;
random_units = randperm(length(Unit), num_units_to_plot);

for unit_idx = 1:num_units_to_plot
    unit_number = random_units(unit_idx);
    u_Trl = Unit(unit_number).Trls;
    for cnd_cnt = 1:1:6
        u_cnd = Unit(unit_number).Cnd(cnd_cnt);
        u_cndi = u_cnd.TrialIdx;
        for trials_cnt = 1:1:length(u_cndi)
            trial_num = u_cndi(trials_cnt);
            cnt = 1;
            u_Trli = u_Trl(trial_num);
            u_Trli = u_Trli{1};
            for t = -1.2:window:2 - window
                n(cnd_cnt, trials_cnt, cnt) = length(find(u_Trli > t)) + ...
                    length(find(u_Trli < t + window)) - length(u_Trli);
                n(cnd_cnt, trials_cnt, cnt) = n(cnd_cnt, trials_cnt, cnt)...
                    / window;
                cnt = cnt + 1;
            end
        end
    end
    PSTH = mean(n, 2);  %averaging across all trials

    time = -1.2:window:2 - window;
    %% 
    figure(unit_idx);
    subplot(3, 1, 1);
    for i = 1:1:6
        plot(time, PSTH(i, :))
        hold on;
    end
grid on; grid minor;
    title(['Unit ', num2str(unit_number), ' PSTH - 6 conditions'], 'interpreter', 'latex');
    xlabel('time (sec)', 'interpreter', 'latex');
    ylabel('Firing Rate', 'interpreter', 'latex');
    line([0 0], ylim, 'LineStyle', '--', 'Color', 'k', 'LineWidth', 1.5);
line([0.3 0.3], ylim, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 1.5);
line([0.9 0.9], ylim, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 1.5);
text(0.05, max(ylim), 'Cue', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.35, max(ylim), 'Delay', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.95, max(ylim), 'Target', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
    legend('Condition 1', 'Condition 2', 'Condition 3', 'Condition 4', ...
        'Condition 5', 'Condition 6', 'interpreter', 'latex');

    subplot(3, 1, 2);
    plot(time, mean(PSTH([1, 3, 5], :)))
    hold on;
    plot(time, mean(PSTH([2, 4, 6], :)))
   grid on; grid minor; 
    title(['Unit ', num2str(unit_number), 'PSTH - Location'], 'interpreter', 'latex');
    xlabel('time (sec)', 'interpreter', 'latex');
    ylabel('Firing Rate', 'interpreter', 'latex');
    line([0 0], ylim, 'LineStyle', '--', 'Color', 'k', 'LineWidth', 1.5);
line([0.3 0.3], ylim, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 1.5);
line([0.9 0.9], ylim, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 1.5);
text(0.05, max(ylim), 'Cue', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.35, max(ylim), 'Delay', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.95, max(ylim), 'Target', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
legend('Location -1', 'Location 1', 'interpreter', 'latex');

    subplot(3, 1, 3);
    plot(time, mean(PSTH([1, 2], :)))
    hold on;
    plot(time, mean(PSTH([3, 4], :)))
    hold on;
    plot(time, mean(PSTH([5, 6], :)))
   grid on; grid minor;
    title(['Unit ', num2str(unit_number), ' PSTH - Rewards'], 'interpreter', 'latex');
    xlabel('time (sec)', 'interpreter', 'latex');
    ylabel('Firing Rate', 'interpreter', 'latex');
    line([0 0], ylim, 'LineStyle', '--', 'Color', 'k', 'LineWidth', 1.5);
line([0.3 0.3], ylim, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 1.5);
line([0.9 0.9], ylim, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 1.5);
text(0.05, max(ylim), 'Cue', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.35, max(ylim), 'Delay', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.95, max(ylim), 'Target', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
 legend('Reward 3', 'Reward 6', 'Reward 9', 'interpreter', 'latex');
end



%%  ======*** BAR chart ***====


%%
clear; clc; close all;
load UnitsData.mat

window = 0.06;
num_units_to_plot = 5;
random_units = randperm(length(Unit), num_units_to_plot);

for unit_idx = 1:num_units_to_plot
    unit_number = random_units(unit_idx);
    u_Trl = Unit(unit_number).Trls;
    for cnd_cnt = 1:1:6
        u_cnd = Unit(unit_number).Cnd(cnd_cnt);
        u_cndi = u_cnd.TrialIdx;
        for trials_cnt = 1:1:length(u_cndi)
            trial_num = u_cndi(trials_cnt);
            cnt = 1;
            u_Trli = u_Trl(trial_num);
            u_Trli = u_Trli{1};
            for t = -1.2:window:2 - window
                n(cnd_cnt, trials_cnt, cnt) = length(find(u_Trli > t)) + ...
                    length(find(u_Trli < t + window)) - length(u_Trli);
                n(cnd_cnt, trials_cnt, cnt) = n(cnd_cnt, trials_cnt, cnt)...
                    / window;
                cnt = cnt + 1;
            end
        end
    end
    PSTH = mean(n, 2);  %averaging across all trials

    time = -1.2:window:2 - window;
    %% 
    figure(unit_idx);
    subplot(3, 1, 1);
    bar(time, squeeze(PSTH(1:6, :)))
grid on; grid minor;
    title(['Unit ', num2str(unit_number), ' PSTH - 6 conditions'], 'interpreter', 'latex');
    xlabel('time (sec)', 'interpreter', 'latex');
    ylabel('Firing Rate', 'interpreter', 'latex');
    line([0 0], ylim, 'LineStyle', '--', 'Color', 'k', 'LineWidth', 1.5);
line([0.3 0.3], ylim, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 1.5);
line([0.9 0.9], ylim, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 1.5);
text(0.05, max(ylim), 'Cue', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.35, max(ylim), 'Delay', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.95, max(ylim), 'Target', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
    legend('Condition 1', 'Condition 2', 'Condition 3', 'Condition 4', ...
        'Condition 5', 'Condition 6', 'interpreter', 'latex');


    subplot(3, 1, 2);
    bar(time, [mean(PSTH([1, 3, 5], :)); mean(PSTH([2, 4, 6], :))]')
   grid on; grid minor; 
    title(['Unit ', num2str(unit_number), 'PSTH - Location'], 'interpreter', 'latex');
    xlabel('time (sec)', 'interpreter', 'latex');
    ylabel('Firing Rate', 'interpreter', 'latex');
    line([0 0], ylim, 'LineStyle', '--', 'Color', 'k', 'LineWidth', 1.5);
line([0.3 0.3], ylim, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 1.5);
line([0.9 0.9], ylim, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 1.5);
text(0.05, max(ylim), 'Cue', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.35, max(ylim), 'Delay', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.95, max(ylim), 'Target', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
legend('Location -1', 'Location 1', 'interpreter', 'latex');

    subplot(3, 1, 3);
    bar(time, [mean(PSTH([1, 2], :)); mean(PSTH([3, 4], :)); mean(PSTH([5, 6], :))]')
    grid on; grid minor;
    title(['Unit ', num2str(unit_number), ' PSTH - Rewards'], 'interpreter', 'latex');
    xlabel('time (sec)', 'interpreter', 'latex');
    ylabel('Firing Rate', 'interpreter', 'latex');
    line([0 0], ylim, 'LineStyle', '--', 'Color', 'k', 'LineWidth', 1.5);
line([0.3 0.3], ylim, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 1.5);
line([0.9 0.9], ylim, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 1.5);
text(0.05, max(ylim), 'Cue', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.35, max(ylim), 'Delay', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.95, max(ylim), 'Target', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
 legend('Reward 3', 'Reward 6', 'Reward 9', 'interpreter', 'latex');
end

%% step 1: Averaging
clear; clc; close all;
load UnitsData.mat

window = 0.08;
total_units = length(Unit);

for unit_number = 1:1:total_units
    u_Trl = Unit(unit_number).Trls;
    for cnd_cnt = 1:1:6
        u_cnd = Unit(unit_number).Cnd(cnd_cnt);
        u_cndi = u_cnd.TrialIdx;
        for trials_cnt = 1:1:length(u_cndi)
            trial_num = u_cndi(trials_cnt);
            cnt = 1;
            u_Trli = u_Trl(trial_num);
            u_Trli = u_Trli{1};
            for t = -1.2:window:(2 - window)
                n(cnd_cnt, trials_cnt, cnt) = length(find(u_Trli > t & u_Trli <= t + window));
                n(cnd_cnt, trials_cnt, cnt) = n(cnd_cnt, trials_cnt, cnt)...
                    / window;
                cnt = cnt + 1;
            end
        end
    end
    PSTH(:, :, unit_number) = mean(n, 2);  %averaging across all trials  
end
PSTH = mean(PSTH, 3);
time = -1.2:window:(2 - window);

% Plotting
figure;
for i = 1:1:6
    plot(time, squeeze(PSTH(i, :)))
    hold on;
end
grid on; grid minor;
    title(['Average PSTH - 6 conditions'], 'interpreter', 'latex');
    xlabel('time (sec)', 'interpreter', 'latex');
    ylabel('Firing Rate', 'interpreter', 'latex');
    line([0 0], ylim, 'LineStyle', '--', 'Color', 'k', 'LineWidth', 1.5);
line([0.3 0.3], ylim, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 1.5);
line([0.9 0.9], ylim, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 1.5);
text(0.05, max(ylim), 'Cue', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.35, max(ylim), 'Delay', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.95, max(ylim), 'Target', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
    legend('Condition 1', 'Condition 2', 'Condition 3', 'Condition 4', ...
        'Condition 5', 'Condition 6', 'interpreter', 'latex');




%% === **** Calculate mean PSTH for directions and rewards **** ===

direction1 = mean(PSTH([1, 3, 5], :));
direction2 = mean(PSTH([2, 4, 6], :));

reward3 = mean(PSTH([1, 2], :));
reward6 = mean(PSTH([3, 4], :));
reward9 = mean(PSTH([5, 6], :));

% Plotting
figure;

% Plot for all conditions
figure;
for i = 1:1:6
    plot(time, squeeze(PSTH(i, :)))
    hold on;
end
grid on; grid minor;
    title(['Average PSTH - 6 conditions'], 'interpreter', 'latex');
    xlabel('time (sec)', 'interpreter', 'latex');
    ylabel('Firing Rate', 'interpreter', 'latex');
    line([0 0], ylim, 'LineStyle', '--', 'Color', 'k', 'LineWidth', 1.5);
line([0.3 0.3], ylim, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 1.5);
line([0.9 0.9], ylim, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 1.5);
text(0.05, max(ylim), 'Cue', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.35, max(ylim), 'Delay', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.95, max(ylim), 'Target', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
    legend('Condition 1', 'Condition 2', 'Condition 3', 'Condition 4', ...
        'Condition 5', 'Condition 6', 'interpreter', 'latex');
    
% Plot for directions
figure;
plot(time, direction1);
hold on;
plot(time, direction2);
grid on; grid minor; 
    title([' Average PSTH - Location'], 'interpreter', 'latex');
    xlabel('time (sec)', 'interpreter', 'latex');
    ylabel('Firing Rate', 'interpreter', 'latex');
    line([0 0], ylim, 'LineStyle', '--', 'Color', 'k', 'LineWidth', 1.5);
line([0.3 0.3], ylim, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 1.5);
line([0.9 0.9], ylim, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 1.5);
text(0.05, max(ylim), 'Cue', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.35, max(ylim), 'Delay', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.95, max(ylim), 'Target', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
legend('Location -1', 'Location 1', 'interpreter', 'latex');


% Plot for rewards
figure;
plot(time, reward3);
hold on;
plot(time, reward6);
hold on;
plot(time, reward9);
grid on; grid minor;
    title(['Average PSTH - Rewards'], 'interpreter', 'latex');
    xlabel('time (sec)', 'interpreter', 'latex');
    ylabel('Firing Rate', 'interpreter', 'latex');
    line([0 0], ylim, 'LineStyle', '--', 'Color', 'k', 'LineWidth', 1.5);
line([0.3 0.3], ylim, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 1.5);
line([0.9 0.9], ylim, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 1.5);
text(0.05, max(ylim), 'Cue', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.35, max(ylim), 'Delay', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.95, max(ylim), 'Target', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
 legend('Reward 3', 'Reward 6', 'Reward 9', 'interpreter', 'latex');
 
 
 
 %% ==== *** Bar Chart Plotting *** ====
 
figure;

% Bar chart for all conditions
figure;
bar(time, squeeze(PSTH(1:6, :))')
grid on; grid minor;
    title(['Average PSTH - 6 conditions'], 'interpreter', 'latex');
    xlabel('time (sec)', 'interpreter', 'latex');
    ylabel('Firing Rate', 'interpreter', 'latex');
    line([0 0], ylim, 'LineStyle', '--', 'Color', 'k', 'LineWidth', 1.5);
line([0.3 0.3], ylim, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 1.5);
line([0.9 0.9], ylim, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 1.5);
text(0.05, max(ylim), 'Cue', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.35, max(ylim), 'Delay', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.95, max(ylim), 'Target', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
    legend('Condition 1', 'Condition 2', 'Condition 3', 'Condition 4', ...
        'Condition 5', 'Condition 6', 'interpreter', 'latex');

% Bar chart for directions
figure;
bar(time, [direction1; direction2]')
grid on; grid minor; 
    title([' Average PSTH - Location'], 'interpreter', 'latex');
    xlabel('time (sec)', 'interpreter', 'latex');
    ylabel('Firing Rate', 'interpreter', 'latex');
    line([0 0], ylim, 'LineStyle', '--', 'Color', 'k', 'LineWidth', 1.5);
line([0.3 0.3], ylim, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 1.5);
line([0.9 0.9], ylim, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 1.5);
text(0.05, max(ylim), 'Cue', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.35, max(ylim), 'Delay', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.95, max(ylim), 'Target', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
legend('Location -1', 'Location 1', 'interpreter', 'latex');


% Bar chart for rewards
figure;
bar(time, [reward3; reward6; reward9]')
grid on; grid minor;
    title(['Average PSTH - Rewards'], 'interpreter', 'latex');
    xlabel('time (sec)', 'interpreter', 'latex');
    ylabel('Firing Rate', 'interpreter', 'latex');
    line([0 0], ylim, 'LineStyle', '--', 'Color', 'k', 'LineWidth', 1.5);
line([0.3 0.3], ylim, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 1.5);
line([0.9 0.9], ylim, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 1.5);
text(0.05, max(ylim), 'Cue', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.35, max(ylim), 'Delay', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
text(0.95, max(ylim), 'Target', 'FontSize', 12, 'VerticalAlignment', 'top', 'interpreter', 'latex');
 legend('Reward 3', 'Reward 6', 'Reward 9', 'interpreter', 'latex');
 
 %% ===*** Step2 ***===
 load UnitsData.mat;

n = 481;
nbins = 60; 
moveAVG = 9;
t = linspace(-1.2,2,nbins);





NUM = [12,172];
[~,psth1,cnd1] = PSTH_F(Unit,NUM(1),nbins,moveAVG);
[~,psth2,cnd2] = PSTH_F(Unit,NUM(2),nbins,moveAVG);

t_vec = [10,23,28,35,40,50,55,60];
for i = 1:8
    subplot(2,4,i)
    t = t_vec(i);
    x = psth1([cnd1{4}],t);
    y = psth2([cnd2{4}],t);
    scatter(x,y,'b','filled')
    hold on
    center = [mean(x),mean(y)];
    stdev = [std(x),std(y)];
    h = plotEllipses(center,stdev);
    h.EdgeColor = 'b'; 
    h.LineWidth = 2; 
    h.FaceColor = [0 0 0 .3]; %4th value is undocumented: transparency
    axis equal
    
    hold on
    x = psth1([cnd1{5}],t);
    y = psth2([cnd2{5}],t);
    scatter(x,y,'r','filled')
	legend("Condition 4", "Condition 5", 'interpreter', 'latex');
    hold on
    center = [mean(x),mean(y)];
    stdev = [std(x),std(y)];
    h = plotEllipses(center,stdev);
    h.EdgeColor = 'r'; 
    h.LineWidth = 2; 
    h.FaceColor = [0 0 1 .3];
    axis equal
    title("t = " + num2str(t*3.2/60-1.2), 'interpreter', 'latex')
    grid on;
    sgtitle("Units number "+num2str(NUM(1))+" and "+num2str(NUM(2)), 'interpreter', 'latex')
    xlabel("Unit "+num2str(NUM(1))+" ", 'interpreter', 'latex')
    ylabel("Unit "+num2str(NUM(2))+" ", 'interpreter', 'latex')
end
%% Step2 - Calculate the P-Value
clear all; close all; clc;
load UnitsData.mat;

n = 481;
nbins = 60;
moveAVG = 0;
t = linspace(-1.2,2,nbins);

p_thresholds = [0.05, 0.5, 0.005];
signif = cell(1, length(p_thresholds));
pValVec = cell(1, length(p_thresholds));
tables = cell(1, length(p_thresholds));

for i = 1:n
    [~, psthAll, cnd] = myPSTH(Unit, i, nbins, moveAVG);
    y = zeros(length(cnd), 1);
    reward = [3 3 6 6 9 9];
    for j = 1:6
        y(cnd{j}) = reward(j);
    end
    mdl = fitglm(psthAll, y);
    pVal = coefTest(mdl);
    
    for p_idx = 1:length(p_thresholds)
        if (pVal < p_thresholds(p_idx))
            signif{p_idx} = [signif{p_idx}, i];
            pValVec{p_idx} = [pValVec{p_idx}, pVal];
        end
    end
end

% Create tables for each p-value threshold
for p_idx = 1:length(p_thresholds)
    tables{p_idx} = table(signif{p_idx}', pValVec{p_idx}', 'VariableNames', {'Unit', 'P_value'});
end

% Display the tables
for p_idx = 1:length(p_thresholds)
    disp(['P-value threshold: ', num2str(p_thresholds(p_idx))]);
    disp(tables{p_idx});
end


% Create and display tables for each p-value threshold
for p_idx = 1:length(p_thresholds)
    tables{p_idx} = table(signif{p_idx}', pValVec{p_idx}', 'VariableNames', {'Unit', 'P_value'});
    
    % Display table in a figure
    fig = figure('Name', ['P-value threshold: ', num2str(p_thresholds(p_idx))], 'Position', [100, 100, 350, 400], 'MenuBar', 'none', 'ToolBar', 'none');
    t = uitable('Parent', fig, 'Data', table2cell(tables{p_idx}), 'ColumnName', {'Unit', 'P-value'}, 'RowName', [], 'Position', [20 20 310 360]);
end

%% Step - 3 

%% step 3: Average over all trials
clear; clc; close all;
load UnitsData.mat

window = 0.08;
for unit_num = 1: 1: 481
    u_Trl = Unit(unit_num).Trls;
    for trial_num = 1: 1: 192
        u_Trli = u_Trl{trial_num, 1};
        cnt = 1; 
        for t = -1.2: window: 2 - window
                n(trial_num, cnt) = length(find(u_Trli > t)) + ...
                    length(find(u_Trli < t + window)) - length(u_Trli);
                n(trial_num, cnt) = n(trial_num, cnt) / window;
                cnt = cnt + 1;
        end
    end
    PSTH(unit_num, :) = mean(n, 1); %averaging across all trials
end
[coeffs, score] = pca(PSTH');
figure;
subplot(2, 1, 1);
plot(score(:,1), score(:,2), '-o');
title(' Average of Population activity in 2D', ...
    'interpreter', 'latex');
grid on
grid minor;
subplot(2, 1, 2);
plot3(score(:,1), score(:,2), score(:, 3), '-o');
title('  Average of Population activity in 3D', ...
    'interpreter', 'latex');   
grid on;
grid minor;
%% Step - 4

clc; close all; clear;
load UnitsData.mat

window = 0.08;
for unit_num = 1: 1: 481
    u_Trl = Unit(unit_num).Trls;
    for trial_num = 1: 1: 192
        u_Trli = u_Trl{trial_num, 1};
        cnt = 1; 
        for t = -1.2: window: 2 - window
                n(trial_num, cnt) = length(find(u_Trli > t)) + ...
                    length(find(u_Trli < t + window)) - length(u_Trli);
                n(trial_num, cnt) = n(trial_num, cnt) / window;
                cnt = cnt + 1;
        end
    end
    PSTH(unit_num, :) = mean(n, 1); %averaging across all trials
end
[coeffs, score] = pca(PSTH');


% PSTH = permute(surrTensor, [3 1 2]);
% sgtitle('PCA on surrogated data by CFR algorithm', 'interpreter', 'latex');


PSTH = permute(surrTensor, [3 1 2]);


stimOnset = 15;
% Reward 3
PSTH3 = cat(1, PSTH(1, :, :), PSTH(2, :, :));
PSTH3 = mean(PSTH3, 1);
PSTH3 = reshape(PSTH3(1, :, :), [size(PSTH, 2) size(PSTH, 3)]);
PSTH3 = PSTH3([stimOnset: end], :);

% Reward 6
PSTH6 = cat(1, PSTH(3, :, :), PSTH(4, :, :));
PSTH6 = mean(PSTH6, 1);
PSTH6 = reshape(PSTH6(1, :, :), [size(PSTH, 2) size(PSTH, 3)]);
PSTH6 = PSTH6([stimOnset: end], :);

% Reward 9
PSTH9 = cat(1, PSTH(5, :, :), PSTH(6, :, :));
PSTH9 = mean(PSTH9, 1);
PSTH9 = reshape(PSTH9(1, :, :), [size(PSTH, 2) size(PSTH, 3)]);
PSTH9 = PSTH9([stimOnset: end], :);

[coeffs3, score3, latent3] = pca(PSTH3);
[coeffs6, score6, latent6] = pca(PSTH6);
[coeffs9, score9, latent9] = pca(PSTH9);

subplot(2, 3, 1);
plot(score3(:, 1), score3(:, 2), '-o');
grid on;
title('Population activity for Reward = 3 conditions (2D)', 'interpreter', 'latex');
subplot(2, 3, 2);
plot(score6(:, 1), score6(:, 2), '-o');
grid on;
title('Population activity for Reward = 6 conditions (2D)', 'interpreter', 'latex');
subplot(2, 3, 3);
plot(score9(:, 1), score9(:, 2), '-o');
grid on;
title('Population activity for Reward = 9 conditions (2D)', 'interpreter', 'latex');

subplot(2, 3, 4);
plot3(score3(:, 1), score3(:, 2), score3(:, 3), '-o');
grid on;
title('Population activity for Reward = 3 conditions (3D)', 'interpreter', 'latex');
subplot(2, 3, 5);
plot3(score6(:, 1), score6(:, 2), score6(:, 3), '-o');
grid on;
title('Population activity for Reward = 6 conditions (3D)', 'interpreter', 'latex');
subplot(2, 3, 6);
plot3(score9(:, 1), score9(:, 2), score9(:, 3), '-o');
grid on;
title('Population activity for Reward = 9 conditions (3D)', 'interpreter', 'latex');

%% Shuffling



%% === Functions ====
function [psth,psthAll,cnd] = PSTH_F(Unit,Unit_Num,nbins,moveAVG)
    trialsCell = Unit(Unit_Num).Trls;

    h = zeros(size(trialsCell,1),nbins);
    for i = 1:size(trialsCell,1)
        temp = trialsCell(i);
        temp = cell2mat(temp)';
        h(i,:) = hist(temp,nbins);
    end
    psthAll = h/(3.2/nbins);
    % Conditions
    Cnd =  Unit(12).Cnd;
    cnd1 = Cnd(1).TrialIdx;
    cnd2 = Cnd(2).TrialIdx;
    cnd3 = Cnd(3).TrialIdx;
    cnd4 = Cnd(4).TrialIdx;
    cnd5 = Cnd(5).TrialIdx;
    cnd6 = Cnd(6).TrialIdx;
    cnd = {cnd1,cnd2,cnd3,cnd4,cnd5,cnd6};

    % PSTH for 6 CNDs
    psth = zeros(6,nbins);
    for i = 1:6
        psth(i,:) = mean(h(cnd{i},:),1);
    end
    psth = psth/(3.2/nbins); % Changing unit to Hz
    if moveAVG ~= 0
        psth = movmean(psth,moveAVG,2);
        psthAll = movmean(psthAll,moveAVG,2);
    end
end
function h = plotEllipses(cnt,rads,axh) % not written by me
    if nargin < 3 || isempty(axh)
       axh = gca();  
    end
    % Compute the lower, left corner of the rectangle.
    llc = cnt(:)-rads(:);
    % Compute the width and height
    wh = rads(:)*2; 
    % Draw rectangle 
    h = rectangle(axh,'Position',[llc(:).',wh(:).'],'Curvature',[1,1]); 
end

 