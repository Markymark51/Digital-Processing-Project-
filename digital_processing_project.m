function digital_processing_project
freq = 1;
% Create a UI figure window
fig = uifigure('Name', 'Simple UI with Button', ...
    'Position', [100 100 400 300]);

lbl = uilabel(fig, ...
    'Text', sprintf('Frequency: %.1f', freq), ...
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

% Link slider movement to a callback function
sld.ValueChangingFcn = @(src, event) updateFreq(src, event, lbl);

% Assign callback function to button
btn.ButtonPushedFcn = @(src, event) buttonCallback(sld.Value);
end

function updateFreq(src, event, label)
currentVal = event.Value;
label.Text = sprintf("Frequency: %.1f", currentVal);
end

% Callback function for button press
function buttonCallback(freq)
fs = 44100;
t = 0:1/fs:1; 

tone = sin(2*pi*freq*t);
sound(tone, fs);
end