% Case 6: 10 harmonics, random amplitudes and frequencies
dt = 0.005;
t = 0:dt:20;
N_samples = length(t);

x = zeros(1, N_samples);
rng(1); % Seed for reproducible random numbers

for i = 1:10
    % Random w between 10 and 200, Random A between 1 and 5
    w = 10 + rand() * 190; 
    A = 1 + rand() * 4;
    x = x + A*sin(w*t);
end

subplot(2,1,1)
plot(t, x)
grid on
xlabel('Time (sec)')
ylabel('Amplitude')
title('Time Domain')
axis([0 3 -25 25])

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
axis([0 220 0 6])