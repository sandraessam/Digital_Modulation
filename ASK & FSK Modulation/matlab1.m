sig=randi([0,1],1,10);
subplot(5,1,1);
stem(sig);
sig=reshape(repmat(sig,100,1),1,[]);
title('Input signal');
sig1=sig+1;
t=linspace(0,10,1000);
subplot(5,1,2);
fc=sin(2*pi*4*t);
plot(t,fc);
title('Carrier Signal');
modulated_sig=sig1.*fc;
t=linspace(0,10,1000);
subplot(5,1,3);
plot(t,modulated_sig);
title('ASK Modulated signal');
%figure(2)
c1=sin(2*pi*4*t);
%subplot(3,1,1);
%plot(t,c1);
%subplot(3,1,2);
%plot(t,sig);
c2=sin(2*pi*9*t);
for i=0:999
    if sig(i+1)==0
        msk(i+1)=c1(i+1);
   else
        msk(i+1)=c2(i+1);
    end
end 
subplot(5,1,4);
plot(t,msk);
title('MSK Modulated signal');
positive_signal=abs(modulated_sig);
filtered_sig=intdump(positive_signal,100);
demodulated_sig=floor(filtered_sig);
subplot(5,1,5);
stem(demodulated_sig);
title('demodulated sig');