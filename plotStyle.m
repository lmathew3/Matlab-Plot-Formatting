function [] = plotStyle(aspectRatio,plotSize,colorScheme,lineWidth,fontWeight,fontStyle)
% [] = plotStyle(aspectRatio,plotSize,colorScheme,lineWidth,fontWeight,fontStyle)
% Function sets default plot styles for plotting
% Author: Logan Mathews
% Inputs:
%   aspectRatio - Default is 'standard' 4:3 aspect ratio
%       'tall' - 3:4 aspect ratio (x/y = 3/4)
%       'square' - Square aspect ratio (x/y = 1)
%       'standard' - 4:3 aspect ratio (x/y = 4/3)
%       'widescreen' - Square aspect ratio (x/y = 16/9)
%   plotSize - Default is 'medium' 1000 px for x
%       'small' - 500 px for x
%       'medium' - 1000 px for x
%       'large' - 1500 px for x
%       'hd' - 1366 px for x
%       'fhd' - 1920 px for x
%       'uhd' - 3840 px for x
%   colorSchemes - Default is 1 (Both color schemes are colorblind friendly
%       1 - Color Scheme 1
%       2 - Color Scheme 2
%   lineWidth - Default is 1.5
%       Any positive number will work
%   fontWeight - Default is 22
%       Any positive number will work
%   fontStyle - Default is 'default'
%       'default' - Matlab default font, Helvetica
%       'classic' - Times New Roman font
%       'modern' - Archivo Narrow Medium font - *not a standard Windows
%           font. Must be installed for all users on the computer. Font
%           avaliable from https://fonts.google.com/specimen/Archivo+Narrow
%       'latex' - Default font for LaTeX, Computer Modern Serif - *not a standard Windows
%           font. Must be installed for all users on the computer. Font
%           avaliable from https://www.fontsquirrel.com/fonts/computer-modern

% Checking for Unspecified inputs, setting defaults.
if nargin<6
    fontStyle = 'default';
end

if nargin<5
    fontWeight = 22;
end

if nargin<4
   lineWidth = 1.5;
end

if nargin<3
    colorScheme = 1;
end

if nargin<2
    plotSize = 'medium';
end

if nargin<1
    aspectRatio = 'standard';
end

% Configuring settings based on inputs, error checking
switch plotSize
    case 'small'
        xSize = 500;
    case 'medium'
        xSize = 800;
    case 'large'
        xSize = 1500;
    case 'hd'
        xSize = 1366;
    case 'fhd'
        xSize = 1920;
    case 'uhd'
        xSize = 3840;
    otherwise
        warning('Unsupported plot size.')
end

switch aspectRatio
    case 'tall'
        ySize = 4/3*xSize;
    case 'square'
        ySize = xSize;
    case 'standard'
        ySize = 3/4*xSize;
    case 'widescreen'
        ySize = 9/16*xSize;
    otherwise
        warning('Unsupported aspect ratio.')
end

if colorScheme ~= 1 && colorScheme ~= 2
       warning('Unsupported color scheme.')
end

if lineWidth <= 0
       warning('Invalid line width. Please enter values greater than 0.')
end

if fontWeight <= 0
       warning('Invalid font size. Please enter values greater than 0.')
end

switch fontStyle
    case 'default'
        fontName = 'Helvetica';
    case 'classic'
        fontName = 'Times New Roman';
    case 'modern'
        fontName = 'Archivo Narrow Medium';
    case 'latex'
        fontName = 'CMU Serif';
    otherwise
        warning('Unsupported font.')
end

% Configuring Plotting Defaults
set(0,'DefaultFigurePosition',[10 40 xSize ySize]);
set(0,'DefaultAxesLineWidth',1.5);
set(0,'DefaultLineLineWidth',lineWidth);
set(0,'DefaultAxesFontSize',20);
set(0,'DefaultAxesFontWeight','demi');
set(0,'DefaultTextFontWeight','demi');
set(0,'DefaultFigurePaperPositionMode','auto')
set(0,'DefaultFigurePaperPositionMode','auto')
set(0,'DefaultTextFontName',fontName);
set(0,'DefaultAxesFontName',fontName);
set(0,'defaultfigurecolor',[1 1 1])
set(0,'DefaultLineMarkerSize',fontWeight);

if colorScheme == 1
    colvect=[...
        245,121,58;...      orange 
        169,90,161;...      purple
        133,192,249;...     sky blue
        15,32,128]/255;     %royal blue
end

if colorScheme == 2
    colvect=[...
       96,26,74;...       purple  
       238,68,47;...      red orange
       99,172,190;...     blue
       230,230,9]/255;    %yellow
end


set(0,'DefaultAxesColorOrder',[0,0,0;1 0 0])
set(0,'DefaultAxesLineStyleOrder',{'-','--',':','-.'})
set(0,'DefaultAxesColorOrder',colvect);

% Test Plotting Code
% t = 1:0.01:5;
% labels = [];
% for n = 1:16
%     x(n,:) = t.*sqrt(n);
% end
% plot(t,x)
% grid on
% xlabel('x')
% ylabel('f(x)')
% title('The Plot')
% legend(labels,'NumColumns',4,'Location','NorthWest')