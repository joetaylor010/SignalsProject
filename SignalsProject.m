%Joseph Taylor, EECE 3620 Signals & Systems, Software Project, 11/7/18

%preallocate space for arrays
avgcurrent1 = zeros(14,1);
avgcurrent2 = zeros(14,1);
voltage = [0 0.1 0.5 1 1.5 2 3 4 5 6 7 8 9 10];

%load device 1 data
device1(1,:) = load('Device-1\CURRENT-0.0V.dat')';
device1(2,:) = load('Device-1\CURRENT-0.1V.dat')';
device1(3,:) = load('Device-1\CURRENT-0.5V.dat')';
device1(4,:) = load('Device-1\CURRENT-1.0V.dat')';
device1(5,:) = load('Device-1\CURRENT-1.5V.dat')';
device1(6,:) = load('Device-1\CURRENT-2.0V.dat')';
device1(7,:) = load('Device-1\CURRENT-3.0V.dat')';
device1(8,:) = load('Device-1\CURRENT-4.0V.dat')';
device1(9,:) = load('Device-1\CURRENT-5.0V.dat')';
device1(10,:) = load('Device-1\CURRENT-6.0V.dat')';
device1(11,:) = load('Device-1\CURRENT-7.0V.dat')';
device1(12,:) = load('Device-1\CURRENT-8.0V.dat')';
device1(13,:) = load('Device-1\CURRENT-9.0V.dat')';
device1(14,:) = load('Device-1\CURRENT-10.0V.dat')';

%load device 2 data
device2(1,:) = load('Device-2\CURRENT-0.0V.dat')';
device2(2,:) = load('Device-2\CURRENT-0.1V.dat')';
device2(3,:) = load('Device-2\CURRENT-0.5V.dat')';
device2(4,:) = load('Device-2\CURRENT-1.0V.dat')';
device2(5,:) = load('Device-2\CURRENT-1.5V.dat')';
device2(6,:) = load('Device-2\CURRENT-2.0V.dat')';
device2(7,:) = load('Device-2\CURRENT-3.0V.dat')';
device2(8,:) = load('Device-2\CURRENT-4.0V.dat')';
device2(9,:) = load('Device-2\CURRENT-5.0V.dat')';
device2(10,:) = load('Device-2\CURRENT-6.0V.dat')';
device2(11,:) = load('Device-2\CURRENT-7.0V.dat')';
device2(12,:) = load('Device-2\CURRENT-8.0V.dat')';
device2(13,:) = load('Device-2\CURRENT-9.0V.dat')';
device2(14,:) = load('Device-2\CURRENT-10.0V.dat')';

% calculate average current for both devices
% graph current vs frequency using fft
% SpectrumAnalyzer has been modified to display +/-500 points from 0 Hz.
for i=1:1:14
    avgcurrent1(i) = mean(device1(i,:));
    avgcurrent2(i) = mean(device2(i,:));
end

%graph average current versus voltage for both devices
figure
plot(voltage, avgcurrent1, 'k-*', voltage, avgcurrent2, 'b-*');
title('Average Current vs. Voltage (I-V Curve) for Devices 1 and 2')
xlabel('Voltage (V)')
ylabel('Average Current (A)')
legend('Device 1', 'Device 2','Location','north')