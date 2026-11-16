function digital_processing_project
freq = 1;
len = 1;
% Create a UI figure window
fig = uifigure('Name', 'Simple UI with Button', ...
    'Position', [100 100 400 300]);

freqLbl = uilabel(fig, ...
    'Text', sprintf('Frequency: %.1f', freq), ...
    'Position', [150 220 120 30], ...
    'FontSize', 14);

lenLbl = uilabel(fig, ...
    'Text', sprintf('Length: %.1f', len), ...
    'Position', [150 200 120 30], ...
    'FontSize', 14);

btn = uibutton(fig, 'push', ...
    'Text', 'Press Me', ...
    'Position', [150 150 100 40], ...
    'FontSize', 14);

sld = uislider(fig, ...
    'Position', [150 100 100 1], ...
    'Limits', [1 1000], ...
    'Value', freq);

sld2 = uislider(fig, ...
    'Position', [150 60 100 1], ...
    'limits', [1 10], ...
    'Value', len);

% Link slider movement to a callback function
sld.ValueChangingFcn = @(src, event) updateFreq(src, event, freqLbl);

sld2.ValueChangingFcn = @(src, event) updateLen(src, event, lenLbl);

% Assign callback function to button
btn.ButtonPushedFcn = @(src, event) buttonCallback(sld.Value, sld2.Value);
end

function updateFreq(src, event, label)
currentVal = event.Value;
label.Text = sprintf("Frequency: %.1f", currentVal);
end

function updateLen(src, event, label)
currentVal = event.Value;
label.Text = sprintf("Length: %.1f", currentVal);
end

% Callback function for button press
function buttonCallback(freq, len)
fs = 44100;
t = 0:1/fs:len; 

tone = sin(2*pi*freq*t);
sound(tone, fs);
end