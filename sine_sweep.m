%This program implements a sine sweep function

function x_t =sine_sweep(f_min,f_max,fs ,duration, a)
N = duration*fs;
f = logspace(log(f_min),log(f_max),N);
inst_freq = f.*(2*pi/fs);
phase = cumsum(inst_freq);
x_t = a.*sin(phase);
audiowrite('sine_sweep.wav',x_t,fs)
end