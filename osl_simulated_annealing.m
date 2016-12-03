function [out,xout,yout  ] = ODL_fire( c ,x0,y0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    best = c(x0,y0);
    T = 80;
    alpha = 0.7;
    t_stop = 80;
    t_no_best = 0; 
    x = x0;
    y = y0;
    out = [];
    xout = [];
    yout = [];
    i = 1;
    while(t_no_best < t_stop)
        x1 = x;
        y1 = y;
        while(1)
            rd1 = round(rand() * 5) - 2;
            rd2 = round(rand() * 5) - 2;
            if rd1 == rd2 && rd1 == 0
                continue;
            end
            if x0 + rd1 < 1 || x0 + rd1 > size(c,1) || y0 + rd2 < 1 || y0 + rd2 > size(c,2)
               continue
            end
            x1 = x0 + rd1;
            y1 = y0 + rd2;
            if x1 == x && y1 == y
                continue;
            end
            break;
        end
        if abs(x1 - x) >= abs(y1 - y)
            x1 = x + (x1 - x) / abs(x1 - x);
            y1 = y;
        else
            x1 = x;
            y1 = y + (y1 - y) / abs(y1 - y);
        end
        
        if c(x1,y1) > best
            best = c(x1,y1);
            x0 = x1;
            y0 = y1;
            t_no_best = 0;
        else
            rd = rand();
            if (exp((c(x1,y1) - best) / T)) > rd && c(x1,y1) ~= best
                best = c(x1,y1);
                x0 = x1;
                y0 = y1;
                t_no_best = 0;
            else
                t_no_best = t_no_best + 1;
            end
        end
            T = T * alpha;
            x = x1;
            y = y1;
            out(i) = best;
            xout(i) = x;
            yout(i) = y;
            i = i + 1;
    end

end

