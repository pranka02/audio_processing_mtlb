function plot_spectrogram(x_t, win_size, hop_size, win_type, fs, nfft) 

if strcmp(win_type,'rect')
    win =rectwin(win_size);
elseif strcmp(win_type,'black')
    win = blackman(win_size);
else 
    win = hamming(win_size);
end
N = nfft/ hop_size;
[s,f,t]=spectrogram(x_t,win,hop_size,fs,nfft);
c=20*log(abs(s));
tt = t.*(N*length(x_t)/(length(t)*fs*(N-1)));
imagesc(t,f,c)

set(gca,'ydir','normal'); 
title('Spectrogram')
xlabel('Time(seconds)') % x-axis label
ylabel('Frequency(Hz)') % y-axis label
colorbar
end

