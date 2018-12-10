function maxfreq = SpectrumAnalyzer(signal,fs)
% Calculate FFT
N = length(signal);
X_mags = abs(fft(signal));
bin_vals = 0 : N-1;
fax_Hz = bin_vals * fs / N;
N_2 = ceil(N/2);
xaxis = fax_Hz(2:N_2);
yaxis = 20*log10(X_mags(2:N_2));

% Plot FFT
semilogx(xaxis, yaxis)
xlabel('Frequency (Hz)')
ylabel('Power (dB)');
title({'Single-sided Power spectrum' ...
    ' (Frequency in shown on a log scale)'});
axis tight

% Determine and return frequency at maximum value
[~,maxindex] = max(yaxis);
maxfreq = xaxis(maxindex);
end