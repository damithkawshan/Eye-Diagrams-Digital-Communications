%assignment 2
%Task 1
clear all
close all
clc
%%
%input parameters
len=1000;%length of the bit stream
fs=12; %sampling frequency in Hz

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

Tx_sinc_reshape = reshape(Tx_sinc,fs*2,len/2).';
Tx_Rcos5_reshape = reshape(Tx_Rcos5,fs*2,len/2).';
Tx_Rcos1_reshape = reshape(Tx_Rcos1,fs*2,len/2).';

%%
fig1=figure;
plot([0:1/fs:1.99],real(Tx_sinc_reshape).','b');   
title('BPSK Eye diagram with Sinc filter');
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_sinc) max(Tx_sinc)])
grid on
saveas(fig1,'fig1.jpg');

fig2=figure;
plot([0:1/fs:1.99],real(Tx_Rcos5_reshape).','b');  
title('BPSK Eye diagram with alpha=0.5') 
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_Rcos5) max(Tx_Rcos5) ])
grid on
saveas(fig2,'fig2.jpg');

fig3 = figure;
plot([0:1/fs:1.99],real(Tx_Rcos1_reshape).','b');  
title('BPSK Eye diagram with alpha=1') 
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_Rcos1) max(Tx_Rcos1) ])
grid on
saveas(fig3,'fig3.jpg');

%%
%Task 2
gamma=10;
Es=1; %assumed unit noise energy 

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
Tx_sinc_N_reshape = reshape(Tx_sinc_N,fs*2,len/2).';
Tx_Rcos5_N_reshape = reshape(Tx_Rcos5_N,fs*2,len/2).';
Tx_Rcos1_N_reshape = reshape(Tx_Rcos1_N,fs*2,len/2).';

fig4 = figure;
plot([0:1/fs:1.99],real(Tx_sinc_N_reshape).','b');   
title('BPSK  Eye diagram with Sinc filter (When AWGN present)');
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_sinc_N) max(Tx_sinc_N)])
grid on
saveas(fig4,'fig4.jpg');

fig5 = figure;
plot([0:1/fs:1.99],real(Tx_Rcos5_N_reshape).','b');  
title('BPSK  Eye diagram with alpha=0.5 (When AWGN present)') 
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_Rcos5_N) max(Tx_Rcos5_N) ])
grid on
saveas(fig5,'fig5.jpg');

fig6 = figure;
plot([0:1/fs:1.99],real(Tx_Rcos1_N_reshape).','b');  
title('BPSK Eye diagram with alpha=1 (When AWGN present)') 
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_Rcos1_N) max(Tx_Rcos1_N) ])
grid on
saveas(fig6,'fig6.jpg');

%%
%Task 3

%length of data stream
len2=len*2;
data2=randi([0,1],len2,1)';

%reshaping array
data_reshape=[2 1]*reshape(data2,2,len)+1;

%encoded data with 4-PAM technique
PAM4=[-3 -1 1 3];
encoded_stream2=PAM4(data_reshape);

Tx_Data_2=Transmit(encoded_stream2,fs,len);

%%
%Plot data

Tx_sinc_2=Tx_Data_2(1,1:end);
Tx_Rcos5_2=Tx_Data_2(2,1:end);
Tx_Rcos1_2=Tx_Data_2(3,1:end);

Tx_sinc_2_reshape = reshape(Tx_sinc_2,fs*2,len/2).';
Tx_Rcos5_2_reshape = reshape(Tx_Rcos5_2,fs*2,len/2).';
Tx_Rcos1_2_reshape = reshape(Tx_Rcos1_2,fs*2,len/2).';

%%
fig7 = figure;
plot([0:1/fs:1.99],real(Tx_sinc_2_reshape).','b');   
title('4-PAM Eye diagram with Sinc filter');
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_sinc_2) max(Tx_sinc_2)])
grid on
saveas(fig7,'fig7.jpg');

fig8 = figure;
plot([0:1/fs:1.99],real(Tx_Rcos5_2_reshape).','b');  
title('4-PAM Eye diagram with alpha=0.5') 
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_Rcos5_2) max(Tx_Rcos5_2) ])
grid on
saveas(fig8,'fig8.jpg');

fig9 = figure;
plot([0:1/fs:1.99],real(Tx_Rcos1_2_reshape).','b');  
title('4-PAM Eye diagram with alpha=1') 
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_Rcos1_2) max(Tx_Rcos1_2) ])
grid on
saveas(fig9,'fig9.jpg');

%%
%4-PAM with AWGN present

gamma=10;
Es=1; %assumed unit noise energy 

%get the variance of the noise
N0=(10^(0.1*gamma)/Es)^-1;
%Generate AWG noise
AWGN=normrnd(0,sqrt(N0/2),[1,len*fs]);

%sinc+noise
Tx_sinc_2_N=Tx_sinc_2+AWGN;
Tx_Rcos5_2_N=Tx_Rcos5_2+AWGN;
Tx_Rcos1_2_N=Tx_Rcos1_2+AWGN;

%%
%plot data
Tx_sinc_2_N_reshape = reshape(Tx_sinc_2_N,fs*2,len/2).';
Tx_Rcos5_2_N_reshape = reshape(Tx_Rcos5_2_N,fs*2,len/2).';
Tx_Rcos1_2_N_reshape = reshape(Tx_Rcos1_2_N,fs*2,len/2).';

fig10 = figure;
plot([0:1/fs:1.99],real(Tx_sinc_2_N_reshape).','b');   
title('4-PAM  Eye diagram with Sinc filter (When AWGN present)');
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_sinc_2_N) max(Tx_sinc_2_N)])
grid on
saveas(fig10,'fig10.jpg');

fig11 = figure;
plot([0:1/fs:1.99],real(Tx_Rcos5_2_N_reshape).','b');  
title('4-PAM  Eye diagram with alpha=0.5 (When AWGN present)') 
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_Rcos5_2_N) max(Tx_Rcos5_2_N) ])
grid on
saveas(fig11,'fig11.jpg');


fig12 = figure;
plot([0:1/fs:1.99],real(Tx_Rcos1_2_N_reshape).','b');  
title('4-PAM Eye diagram with alpha=1 (When AWGN present)') 
xlabel('Time')
ylabel('Amplitude') 
axis([0 1.99 min(Tx_Rcos1_2_N) max(Tx_Rcos1_2_N) ])
grid on
saveas(fig12,'fig12.jpg');


