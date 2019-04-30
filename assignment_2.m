%assignment 2
%Task 1
clear all
close all
clc
%%
%parameters
len=1000;%length of the bit stream
fs=10; %sampling frequency in Hz

%%
%generate bit_stream
data=randi([0,1],len,1)';
encoded_stream=(-1).^data;

%Transmit bit stream
Tx_Data=Transmit(encoded_stream,fs,len);
%%
%Plot data

Tx_sinc=Tx_Data(1,1:end);
Tx_Rcos5=Tx_Data(2,1:end);
Tx_Rcos1=Tx_Data(3,1:end);

Tx_sinc_reshape = reshape(Tx_sinc,fs*2,len*fs/20).';
Tx_Rcos5_reshape = reshape(Tx_Rcos5,fs*2,len*fs/20).';
Tx_Rcos1_reshape = reshape(Tx_Rcos1,fs*2,len*fs/20).';

%%

close all;

figure;
plot([0:1/fs:1.99],real(Tx_sinc_reshape).','b');   
title('Eye diagram with Sinc filter');
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_sinc) max(Tx_sinc)])
grid on

figure;
plot([0:1/fs:1.99],real(Tx_Rcos5_reshape).','b');  
title('Eye diagram with alpha=0.5') 
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_Rcos5) max(Tx_Rcos5) ])
grid on

figure;
plot([0:1/fs:1.99],real(Tx_Rcos1_reshape).','b');  
title('Eye diagram with alpha=1') 
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_Rcos1) max(Tx_Rcos1) ])
grid on

%%
%Task 2
gamma=10;
Es=1;

%get the variance of the noise
N0=(10^(0.1*gamma)/Es)^-1;
%Generate AWG noise
AWGN=normrnd(0,sqrt(N0/2),[1,len*fs]);

%sinc+noise
Tx_sinc_N=Tx_sinc+AWGN;
Tx_Rcos5_N=Tx_Rcos5+AWGN;
Tx_Rcos1_N=Tx_Rcos1+AWGN;

%%
%plot data
Tx_sinc_N_reshape = reshape(Tx_sinc_N,fs*2,len*fs/20).';
Tx_Rcos5_N_reshape = reshape(Tx_Rcos5_N,fs*2,len*fs/20).';
Tx_Rcos1_N_reshape = reshape(Tx_Rcos1_N,fs*2,len*fs/20).';

figure;
plot([0:1/fs:1.99],real(Tx_sinc_N_reshape).','b');   
title('Eye diagram with Sinc filter (When AWGN present)');
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_sinc_N) max(Tx_sinc_N)])
grid on

figure;
plot([0:1/fs:1.99],real(Tx_Rcos5_N_reshape).','b');  
title('Eye diagram with alpha=0.5 (When AWGN present)') 
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_Rcos5_N) max(Tx_Rcos5_N) ])
grid on

figure;
plot([0:1/fs:1.99],real(Tx_Rcos1_N_reshape).','b');  
title('Eye diagram with alpha=1 (When AWGN present)') 
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_Rcos1_N) max(Tx_Rcos1_N) ])
grid on

%%
%Task 3

%encoded data with 4-PAM technique
encoded_data=