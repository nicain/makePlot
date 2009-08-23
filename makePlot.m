function makePlot(cF,Title,xLabel,yLabel,saveDir,saveName,saveType)

% makePlot.m
%  Created: 23 August 2009
%  Author: Nicholas Cain
%
%  Input Arguments:
%    cF: Figure handle to apply changes to.
%    Title: Title string.
%    xLabel: X-axis string.
%    yLabel: Y-axis string.
%    saveDir: Directory to save output files to.
%    saveName: Name of savedoutput files.
%
%  Output Arguments:
%    None
%
%  Examples:
%    Put the following code examples into a script to see example.
%
%      (1)  % This will plot an example, and save to current directory
%           f=@(x) x.^2
%           x=-2:.01:2;
%           i=1;figure(i);close(i);figure(i);
%           plot(x,f(x));
%           makePlot(gcf,'Example Plot','Abcissa','Ordinate',...
%               pwd,'exampleFigure',{'eps','fig','png'});
%
%      (2)  % This will plot an example, no saving
%           f=@(x) x.^2
%           x=-2:.01:2;
%           i=1;figure(i);close(i);figure(i);
%           plot(x,f(x));
%           makePlot(gcf,'Example Plot','Abcissa','Ordinate')

% Define default font sizes:
titleFontSize=30;
labelFontSize=24;
tickFontSize=20;

% Define default figure position:
scrsz = get(0,'ScreenSize');
figurePosition=[1 scrsz(4) scrsz(3) scrsz(4)];

% Set Current Figure:
figure(cF);

% Arrange x-axis
xlabel(xLabel)
set(get(gca,'XLabel'),'FontSize',labelFontSize);

% Arrange y-axis
ylabel(yLabel)
set(get(gca,'YLabel'),'FontSize',labelFontSize);

% Arrange title:
title(Title)
set(get(gca,'title'),'FontSize',titleFontSize);

% Set tick font size:
set(gca,'FontSize',tickFontSize)

% Make full screen:
set(cF,'WindowStyle','normal')
set(cF,'Position',figurePosition)

if nargin==7
    for i=1:length(saveType)
        saveas(cF,[saveDir,'/',saveName,'.',saveType{i}],saveType{i});
    end
end

return