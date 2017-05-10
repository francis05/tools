function output = DrawLoss(logName,figureName)
% Author: Xinyu OU
% Data: 2016-3-8
% Load caffe training log and draw the Loss and Accuracy
% train_vgg16.sh |& tee VGG16_output.log
%

    if nargin < 1
        output = ExtractLog();
    else
        output = ExtractLog(logName);
    end
    
    %figureName = 'VGG16 Training';
    
    x = 0 : length(output.TrainLoss)-1;
    y = (0 : length(output.TestLoss) - 1) * (length(output.TrainLoss)-1)/(length(output.TestLoss)-1);
    plot(y, output.TestLoss,'g');
    hold on;
    [hAx, ~, hLine2] = plotyy(x, output.TrainLoss, y, output.TestAccuracy);

    title(figureName);
    xlabel(['iter (max_iter=', num2str(output.max_iter), ')']);
    ylabel(hAx(1), 'Accuracy', 'color', 'k')
    ylabel(hAx(2), 'Loss', 'color', 'k');
    set(hLine2, 'linestyle','-', 'LineWidth', 2);
     
    legend('Test Loss', 'Train Loss', 'Test Accuracy', 'Location', 'Best');
end

function output = ExtractLog(logName)
% Read Caffe log file and extract the training loss, test loss and test accuracy

    if nargin < 1
        logName = 'VGG16_output.log';
    end
    
    fid = fopen(logName, 'r');

    count = 1;
    while ~feof(fid)
        tline{count} = fgetl(fid);
        count = count + 1;
    end
    
    countTestAccuracy = 0;
    countTestLoss = 0;
    countTrainLoss = 0;
    for i = 5 : length(tline)
        % Base solver
        k = strfind(tline{i}, 'test_interval');
        if (k)
            output.test_iterval = str2double(tline{i}(k + 15 : length(tline{i})));
        end
        k = strfind(tline{i}, 'base_lr');
        if (k)
            output.base_lr = str2double(tline{i}(k + 10 : length(tline{i})));
        end
        k = strfind(tline{i}, 'max_iter');
        if (k)
            output.max_iter = str2double(tline{i}(k + 10 : length(tline{i})));
        end
        k = strfind(tline{i}, 'stepsize');
        if (k)
            output.lr_stepsize = str2double(tline{i}(k + 10 : length(tline{i})));
        end
        
        % First find the test accuracy and loss
        k = strfind(tline{i}, 'Test net output');
        if (k)
            k = strfind(tline{i}, 'accuracy');
            if (k)
                output.TestAccuracy(countTestAccuracy + 1) = str2double(tline{i}(k + 11 : length(tline{i})));
                countTestAccuracy = countTestAccuracy + 1;
            end
            
            k = strfind(tline{i}, 'loss');
            if(k)
                output.TestLoss(countTestLoss + 1) = str2double(tline{i}(k(1) + 7 : k(1) + 13));
                countTestLoss = countTestLoss + 1;
            end
        end
        
        % First find the train loss
        k = strfind(tline{i}, 'Iteration');
        if (k)
            k = strfind(tline{i}, 'loss');
            if (k)
                output.TrainLoss(countTrainLoss + 1) = str2double(tline{i}(k + 7 : length(tline{i})));
                countTrainLoss = countTrainLoss + 1;   
            end
        end        
    end 
end

