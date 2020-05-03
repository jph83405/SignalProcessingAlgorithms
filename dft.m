function [xk] = dft(x,N,M)
    for k=0:M-1
        x_n = 0;
        for n = 0:N-1
            x2 = x2+x(n+1)*exp(-(1*1i*2*pi*n*k)/M);
        end
        xk(k+1) = x2;
    end
end
        
     