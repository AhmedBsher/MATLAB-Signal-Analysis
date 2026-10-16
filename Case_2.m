% Case 2: Two harmonics, equal amplitudes, very close frequencies
dt = 0.005;
t = 0:dt:20;

A1 = 2;
A2 = 2;
w1 = 50;
w2 = 52; 

x1 = A1*sin(w1*t);
x2 = A2*sin(w2*t);
x = x1 + x2;

subplot(2,1,1)
plot(t, x)
grid on
xlabel('Time (sec)')
ylabel('Amplitude')
title('Time Domain')
axis([0 10 -5 5])

% FFT Calculation
fs = 1/dt;
N = length(t);
f = (0:N-1)*(fs/N);
w_axis = f * 2 * pi;

xt = fft(x);
xf = (abs(xt)*2)/N;

subplot(2,1,2)
plot(w_axis, xf)
grid on
xlabel('Angular Frequency (rad/sec)')
ylabel('Amplitude')
title('Frequency Spectrum')
axis([40 60 0 2.5])