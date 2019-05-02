# Eye Diagrams-Digital Communications
Plot eye diagrams for BPSK and 4-PAM modulation techniques with and without AWGN 

#### <Transmit.m>

pulse shaping with three different filters and return 3 corrresponding transmit streams.

##### This matlab function requires input arguments:
      1. encoded_data  => modulated data stream (ex: BPSK modulated binary bit stream)
      2. len           => length of the bit stream
      3. fs            => sampling frequency
      
##### returns [3xlen] matrix:
      1.first row     => pulse shaping with sinc funcition
      2.second row    => pulse shaping with raised cosine funcition (alpha = 0.5)
      3.third row     => pulse shaping with raised cosine funcition (alpha = 1.0)
      
 
 #### <assignment_2.m>

main script. intialize parameters and plot data.

#### results
##### BPSK
###### without AWGN 
![Eye diagram with Sinc filter](https://github.com/damithkawshan/Eye-Diagrams-Digital-Communications/blob/master/figures/fig1.jpg)
![Eye diagram with alpha=0.5](https://github.com/damithkawshan/Eye-Diagrams-Digital-Communications/blob/master/figures/fig2.jpg)
![Eye diagram with alpha=1](https://github.com/damithkawshan/Eye-Diagrams-Digital-Communications/blob/master/figures/fig3.jpg)
###### with AWGN

![Eye diagram with Sinc filter](https://github.com/damithkawshan/Eye-Diagrams-Digital-Communications/blob/master/Eye_sinc_AWGN.jpg)
![Eye diagram with alpha=0.5](https://github.com/damithkawshan/Eye-Diagrams-Digital-Communications/blob/master/Eye_Rcos5_AWGN.jpg)
![Eye diagram with alpha=1](https://github.com/damithkawshan/Eye-Diagrams-Digital-Communications/blob/master/Eye_Rcos1_AWGN.jpg)
