sig=randi([0,1],1,20);
subplot(3,1,1);
[r,im]=MyQPSK(sig);
r=reshape(repmat(r,100,1),1,[]);
im=reshape(repmat(im,100,1),1,[]);
t=0:0.02:20-0.02;
plot(t,r);
title('real part of input');
Modulated=(1/sqrt(2))*(r.*sin(2*pi*t)+j*im.*cos(2*pi*t));
subplot(3,1,2);
plot(t,im);
title('imaginary part of input')
subplot(3,1,3);
plot(t,Modulated);
title('QPSK')
Demodulated_real =real(Modulated).*sin(2*pi*t);
figure(2)
subplot(4,1,1)
plot(t,r);
title('real part of input')
Demodulated_imag =imag(Modulated).*cos(2*pi*t);
subplot(4,1,2);
plot(t,im);
title('imaginary part of input')
%Demodulated =Demodulated_real+Demodulated_imag;
filteredSigOfrm= intdump(Demodulated_real,100);
dig_real=ceil(filteredSigOfrm);
subplot(4,1,3);
plot(t,ceil(Demodulated_real));
title('real part of demodulated')
filteredSigOfim= intdump(Demodulated_imag,100);
dig_imag=ceil(filteredSigOfim);
subplot(4,1,4);
plot(t,ceil(Demodulated_imag));
title('imaginary part of demodulated')
Recovered(1:2:20)=dig_real;
Recovered(2:2:20)=dig_imag;
check=sum(sig==Recovered);
figure(3)
subplot(2,1,1);
stem(sig);
title('orginal signal')
subplot(2,1,2);
stem(Recovered);
title('Recovered signal')
