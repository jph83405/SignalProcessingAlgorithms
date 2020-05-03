% bass-treble equalizer

w = linspace(-pi,pi,128);
% read in audio file
filename = 'Dvorak_String_Quartet_12.mp3';
[x,fs] = audioread(filename);

% play music before
% first ten seconds
Ns = 10*fs;
x = x(1:Ns);
player1 = audioplayer(x,fs);
%playblocking(player1);

% plot Hlp
alpha = 0;
top_multiplier = 1 - alpha;
bot_multiplier = 2;
b = [1,1].*top_multiplier;
a = [1,-alpha].*bot_multiplier;
hlp = freqz(b,a,w); % b and a are the vectors of polynomial coefficients
figure();
plot(w,abs(hlp));

% set parameters
cf = 500; % crossover frequency
wc = 2*pi*cf;
alpha = (-cos(wc)+sqrt(4-4*cos(wc)^2))/(2*cos(wc)); % what is alpha for a given frequenc alpha?
G1 = 5; % bass gain
G2 = 5; % treble gain

% Low pass shelving filter
b=[1-alpha,1-alpha].*G1; % fill in the filter coefficients
a=[2,-2*alpha];
y1 = filter(b,a,x);

% zplane, and impulse response, and frequency response 
Hsl = freqz(b,a,w);
figure();
plot(w,abs(Hsl));
title('Frequency response of low-pass shelving filter');

figure();
zplane(b,a);
figure();
impz(b,a);

% plot frequency response of high pass filter

% High pass shelving filter
b=[1+alpha,-1-alpha].*G2;
a=[2,-2*alpha];
y2 = filter(b,a,y1);

% frequency response, zplane, and impulse response, for high pass shelving
% filter
Hs2 = freqz(b,a,w);
figure();
plot(w,abs(Hs2));
title('Frequency response of high-pass shelving filter');

figure();
zplane(b,a);
figure();
impz(b,a);

% plot frequency response of both shelving filters on same axis
figure()
plot(w,Hsl);
hold all;
plot(w,Hs2);


% play output

player2 = audioplayer(y2,fs);
playblocking(player2);