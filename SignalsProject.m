%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Joseph Taylor, Thomas Tawadros
% EECE 3620 - Signals & Systems
% Software Project
% 12/5/18
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Preallocate space for arrays
voltage = [0 0.1 0.5 1 1.5 2 3 4 5 6 7 8 9 10];
avgcurrent1 = zeros(14,1);
avgcurrent2 = zeros(14,1);
maxfreq1 = zeros(14,1);
maxfreq2 = zeros(14,1);

% Load device 1 data
if exist('device1','var') == 0
    device1 = zeros(14,130001);
    for i=1:1:14
        device1(i,:) = load(['Device-1/CURRENT-',num2str(voltage(i),'%.1f'),'V.dat']);
    end
end

% Load device 2 data
if exist('device2','var') == 0
    device2 = zeros(14,130001);
    for i=1:1:14
        device2(i,:) = load(['Device-2/CURRENT-',num2str(voltage(i),'%.1f'),'V.dat']);
    end
end

% Graph current versus frequency for device 1
figure
for i=1:1:14
    avgcurrent1(i) = mean(device1(i,:));
    subplot(5,3,i)
    maxfreq1(i) = SpectrumAnalyzer(device1(i,:),1E15);
    title(['Current vs. Frequency for Device 1 at ',num2str(voltage(i)),' Volts'])
end

% Graph current versus frequency for device 2
figure
for i=1:1:14
    avgcurrent2(i) = mean(device2(i,:));
    subplot(5,3,i)
    maxfreq2(i) = SpectrumAnalyzer(device2(i,:),1E15);
    title(['Current vs. Frequency for Device 2 at ',num2str(voltage(i)),' Volts'])
end

% Graph average current versus voltage for both devices
figure
plot(voltage, avgcurrent1, 'k-*', voltage, avgcurrent2, 'b-*');
title('Average Current vs. Voltage (I-V Curve) for Devices 1 and 2')
xlabel('Voltage (V)')
ylabel('Average Current (A/m)')
legend('Device 1', 'Device 2','Location','north')

% Graph frequency at max versus voltage for both devices
figure
plot(voltage, maxfreq1, 'k-', voltage, maxfreq2, 'b-');
title('Frequency of Maximum vs. Voltage for Devices 1 and 2')
xlabel('Voltage (V)')
ylabel('Frequency (Hz)')
legend('Device 1', 'Device 2','Location','north')