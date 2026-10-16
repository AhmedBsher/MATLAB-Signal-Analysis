% Case 5: 10 harmonics, different amplitudes, w = 10, 20... 100 rad/s
dt = 0.005;
t = 0:dt:20;
N_samples = length(t);

x = zeros(1, N_samples);

% Loop to add harmonics with decreasing amplitudes
for i = 1:10
    w = i * 10;
    A = 11 - i; % Amplitudes will be 10, 9, 8... 1
    x = x + A*sin(w*t);
end

subplot(2,1,1)
plot(t, x)
grid on
xlabel('Time (sec)')
ylabel('Amplitude')
title('Time Domain')
axis([0 10 -35 35])

% FFT Calculation
fs = 1/dt;
f = (0:N_samples-1)*(fs/N_samples);
w_axis = f * 2 * pi;

xt = fft(x);
xf = (abs(xt)*2)/N_samples;

subplot(2,1,2)
plot(w_axis, xf)
grid on
xlabel('Angular Frequency (rad/sec)')
ylabel('Amplitude')
title('Frequency Spectrum')
axis([0 120 0 11])