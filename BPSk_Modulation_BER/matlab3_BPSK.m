clear all;
Nbits=20000;
%%bitstream
bits=randi([0,1],1,Nbits);
%%BPSK symbols
symbols=bits*2-1;
%% noise generation
noise=randn(1,Nbits);
%% reciever
BER=[];
for var=[0.1 ,0.1259, 0.1585, 0.1995, 0.2512, 0.3162 ,0.3981, 0.5012, 0.6310, 0.7943,1]
signal=symbols+ sqrt(var).*noise;
%%detection & demodulation

Rsymb(find(signal>=0))=1;
Rsymb(find(signal<0))=0;
ber=sum(bits~=Rsymb)/Nbits;
BER=[BER ber];
end

var=[0.1,0.1259, 0.1585, 0.1995, 0.2512, 0.3162,0.3981, 0.5012, 0.6310, 0.7943,1]
SNR=10*log10(1./var);
semilogy(SNR,BER);
  
