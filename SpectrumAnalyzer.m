function maxfreq = SpectrumAnalyzer(InputArray,Fs)
Yaxis=abs(fftshift(fft(InputArray)));
Yaxis=Yaxis.*Yaxis;

v=size(Yaxis);
if v(1)==1 
 V=size(Yaxis,2);
 Xaxis=-Fs/2+Fs/V:Fs/V:(Fs/2);
else
  V=v(1); 
  Xaxis=-Fs/2+Fs/V:Fs/V:(Fs/2);
  Xaxis=Xaxis.';
end
Xaxis = Xaxis + Fs/2;
Yaxis=10*log10(Yaxis*4/(V.*V));
plot(Xaxis,Yaxis)
xlabel('Frequency (Hz)')
ylabel('Power (dB)')

[~,maxindex] = max(Yaxis);
maxfreq = Xaxis(maxindex);