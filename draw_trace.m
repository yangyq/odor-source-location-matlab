function [ output_args ] = draw_trace( x,y,c ,t)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
close all;
time = size(x,2);
x1 = 300;
x2 = 500;
y1 = 300;
y2 = 500;
for i = t:time
    imagesc(c(x1:x2,y1:y2));
    hold on; 
    if mod(i,10) == 1
        
        plot(x2 - x(i),y2 - y(i),'.','markersize',30,'color','k');
        saveas(1,strcat(strcat('trace',num2str(i)),'.jpg'));
    end

end

