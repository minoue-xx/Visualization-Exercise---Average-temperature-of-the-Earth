% Copyright (c) 2023 Michio Inoue.
% This is a function to setup the figure for temperature plot.

function [handle_fig,handle_axes,handle_year] = setUpFigure(handle_fig)

handle_fig.Color = 'black';
handle_axes = axes(Parent=handle_fig);
handle_axes.Color = 'none';

height = 4.5;

tmp = datetime(0,1:12,1);
tmp.Format = 'MMM';
% cordinate
theta = linspace(0,2*pi,13);
theta(end) = [];
rho = 3.8; % radius
[xgrid,ygrid] = pol2cart(-theta+pi/2,rho); % theta = 0 は x 軸と並行で反時計回り

% Insert text
text(xgrid-0.25,ygrid,string(char(tmp))',Color=[1,1,1],...
    FontSize=16,Tag="delete");

thetacircle = linspace(0,2*pi,100); % +pi/2
[xgrid1,ygrid1] = pol2cart(thetacircle,1);
[xgrid2,ygrid2] = pol2cart(thetacircle,2);
[xgrid3,ygrid3] = pol2cart(thetacircle,3);
line(xgrid1,ygrid1,height*ones(size(xgrid1)),Color = 'white',LineWidth = 2,Tag="delete");
line(xgrid2,ygrid2,height*ones(size(xgrid2)),Color = 'white',LineWidth = 2,Tag="delete");
line(xgrid3,ygrid3,height*ones(size(xgrid3)),Color = 'white',LineWidth = 2,Tag="delete");

text(0,1,height,"-1^\circ C",Color=[1,1,1],...
    HorizontalAlignment="center",VerticalAlignment="middle",...
    BackgroundColor='k',Interpreter='tex',Tag="delete");
text(0,2,height,"0^\circ C",Color=[1,1,1],...
    HorizontalAlignment="center",VerticalAlignment="middle",...
    BackgroundColor='k',Interpreter='tex',Tag="delete");
text(0,3,height,"+1^\circ C",Color=[1,1,1],...
    HorizontalAlignment="center",VerticalAlignment="middle",...
    BackgroundColor='k',Interpreter='tex',Tag="delete");

axis equal off

handle_year = text(0,0,0,"2023",...
    HorizontalAlignment='center', ...
    VerticalAlignment='middle',FontSize=28,...
    FontWeight='bold',Color=[1,1,1],...
    Tag="delete");

% Fix the view
colormap(turbo)
handle_axes.CLim = [1.1, 3.5]; % min(temperature), max(temperatures)
handle_axes.XLim = [-4.5,4.5];
handle_axes.YLim = [-4.5,4.5];
handle_axes.ZLim = [-4.5,4.5];

end
