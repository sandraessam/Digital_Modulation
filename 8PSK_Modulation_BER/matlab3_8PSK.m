clc
clear all;
len = 20000;                % Number of symbols
M = 8;                     % Modulation order
msg = randi([0 M-1],len,1); % Original signal
txpsk = pskmod(msg,M);    % 8PSK Modulation
signal = awgn(txpsk,20); 
var=[0.1,0.1259, 0.1585, 0.1995, 0.2512, 0.3162,0.3981, 0.5012, 0.6310, 0.7943,1]
SNR=10*log10(1./var);
ber= berawgn(SNR,'psk',M,'nondiff');
hold on
semilogy(SNR,ber,'g');
figure(1);
scatterplot(txpsk);
figure(2);
scatterplot(signal);


