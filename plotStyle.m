function [] = plotStyle(aspectRatio,plotSize,colorScheme,lineWidth,fontWeight,fontStyle)
% [] = plotStyle(aspectRatio,plotSize,colorScheme,lineWidth,fontWeight,fontStyle)
% Function sets default plot styles for plotting
% Author: Logan Mathews
% Inputs:
%   aspectRatio - Default is 'standard' 4:3 aspect ratio
%       'tall' - 3:4 aspect ratio (x/y = 3/4)
%       'square' - Square aspect ratio (x/y = 1)
%       'standard' - 4:3 aspect ratio (x/y = 4/3)
%       'widescreen' - 16:9 aspect ratio (x/y = 16/9)
%   plotSize - Default is 'medium' 1000 px for x
%       'small' - 500 px for x
%       'medium' - 1000 px for x
%       'large' - 1500 px for x
%       'hd' - 1366 px for x
%       'fhd' - 1920 px for x
%       'uhd' - 3840 px for x
%   colorSchemes - Default is 1 
%       1 - Color Scheme 1 (MATLAB Default, 7 colors)
%       2 - Color Scheme 2 (4 colors, colorblind friendly)
%       3 - Color Scheme 3 (4 colors, colorblind friendly)
%       4 - Color Scheme 4 (8 colors)
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

if colorScheme ~= 1 && colorScheme ~= 2 && colorScheme ~= 3 && colorScheme ~= 4
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


switch colorScheme
    case 1 % MATLAB Default
        colvect=[...
            0,0.4470,0.7410;...         blue    
            0.8500,0.3250,0.0980;...    orange
            0.9290,0.6940,0.1250;...    yellow
            0.4940,0.1840,0.5560;...    purple    
            0.4660,0.6740,0.1880;...    green
            0.3010,0.7450,0.9330;...    light blue
            0.6350,0.0780,0.1840];      %red

        set(0,'DefaultAxesColorOrder',colvect);
    case 2 % Colorblind 1
        colvect=[...
            245,121,58;...      orange 
            169,90,161;...      purple
            133,192,249;...     sky blue
            15,32,128]/255;     %royal blue
        set(0,'DefaultAxesColorOrder',colvect);
    case 3 % Colorblind 2
        colvect=[...
           96,26,74;...       purple  
           238,68,47;...      red orange
           99,172,190;...     blue
           230,230,9]/255;    %yellow
       set(0,'DefaultAxesColorOrder',colvect);
    case 4
        colvect=[...
            45,73,121;...       blue    
            204,34,6;...        red
            0,127.5,0;...       green
            117,51,183;...      purple    
            190,153,32;...      yellow
            62,151,190;...      light blue
            240,78,0;...        orange
            198,9,151;...       pink
            ]/255;  % K&M-set, light blue instead of aqua
        set(0,'DefaultAxesColorOrder',colvect);
    otherwise
end

% set(0,'DefaultAxesColorOrder',[0,0,0;1 0 0])
set(0,'DefaultAxesLineStyleOrder',{'-','--',':','-.'})
