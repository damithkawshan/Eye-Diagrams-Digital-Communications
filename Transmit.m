function Tx_data = Transmitter( encoded_stream,fs,len )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%%
%sinc filter
sincNum = sin(pi*[-fs:1/fs:fs]); % numerator of the sinc function
sincDen = (pi*[-fs:1/fs:fs]); % denominator of the sinc function
sincDenZero = find(abs(sincDen) < 10^-10);
sincOp = sincNum./sincDen;
sincOp(sincDenZero) = 1; % sin(pix/(pix) =1 for x =0

% raised cosine filter with alpha = 0.5
alpha = 0.5;
cosNum = cos(alpha*pi*[-fs:1/fs:fs]);
cosDen = (1-(2*alpha*[-fs:1/fs:fs]).^2);
cosDenZero = find(abs(cosDen)<10^-10);
cosOp = cosNum./cosDen;
cosOp(cosDenZero) = pi/4;
Rcos5=sincOp.*cosOp;

% raised cosine filter with alpha =1
alpha = 1;
cosNum = cos(alpha*pi*[-fs:1/fs:fs]);
cosDen = (1-(2*alpha*[-fs:1/fs:fs]).^2);
cosDenZero = find(abs(cosDen)<10^-10);
cosOp = cosNum./cosDen;
cosOp(cosDenZero) = pi/4; 
Rcos1=sincOp.*cosOp;
%%
%obtain transmitting signal with three different filters
upsampled_data=reshape([encoded_stream;zeros(fs-1,length(encoded_stream))],1,len*fs);
Tx_sinc=conv(upsampled_data,sincOp);
Tx_Rcos5=conv(upsampled_data,Rcos5);
Tx_Rcos1=conv(upsampled_data,Rcos1);


% taking only the first 10000 samples 
Tx_sinc = Tx_sinc([1:10000]);
Tx_Rcos5 = Tx_Rcos5([1:10000]);
Tx_Rcos1 = Tx_Rcos1([1:10000]);

Tx_data=[Tx_sinc;Tx_Rcos5;Tx_Rcos1];

end

