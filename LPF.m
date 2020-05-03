alpha = .5;
top_multiplier = 1 - alpha;
bot_multiplier = 2;
b = [1,1].*top_multiplier;
a = [1,-alpha].*bot_multiplier;
L=1000;
dw=2*pi/L;
w = -pi:dw:pi-dw;
h = freqz(b,a,w);
plot(w,abs(h))
