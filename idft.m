function [xn] = idft(xk,N,M)
    for k = 0:N-1
        x1 = 0;
        for i = 0:M-1
            x1 = x1 + xk(k+1)*exp((1*j*2*pi*n*k)/M);
        end
        xn(k+1) = x1/M;
    end
end