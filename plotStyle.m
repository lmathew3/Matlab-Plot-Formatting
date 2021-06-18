% plotStyle(varargin)
% Function sets default plot styles for plotting
% Authors: Logan Mathews, additions by Mark Anderson
% Function Overhaul: 18 Jun 2021 - LM
% Copyright (C) 2021 - Logan T Mathews and Mark C Anderson
% ARGUMENTS:
%   'StandardStyle' - Default is set to 'none'
%   'AspectRatio'
%       'tall' - 3:4 aspect ratio (x/y = 3/4)
%       'square' - Square aspect ratio (x/y = 1)
%       'standard' - 4:3 aspect ratio (x/y = 4/3)
%       'widescreen' - 16:9 aspect ratio (x/y = 16/9)
%       'ultrawide' - 21:9 aspect ratio (x/y = 21/9)
%   'PlotSize'
%       'small' - 500 px for x
%       'medium' - 1000 px for x
%       'large' - 1500 px for x
%       'hd' - 1366 px for x
%       'fhd' - 1920 px for x
%       'uhd' - 3840 px for x
%   'ColorScheme'
%       1 or 'MatlabDefault' - MATLAB Default, 7 colors, colorblind friendly
%       2 - 4 colors, colorblind friendly
%       3 - 4 colors, colorblind friendly
%       4 - 8 colors
%       5 or 'TolBright' - Tol Bright, 7 colors, colorblind friendly
%       6 or 'TolVibrant' - Tol Vibrant, 7 colors, colorblind friendly
%       7 or 'TolMuted' - Tol Muted, 7 colors, colorblind friendly
%       8 or 'MatlabClassic' - Classic MATLAB colors, 7 colors
%       9 or 'SonicBoom' - Sonic Boom color scheme, 11 colors   
%   'LineWidth'
%       Any positive number will work
%   'MarkerSize'
%       Any positive number will work
%   'FontSize'
%       Any positive number will work
%   'FontStyle'
%       'default' - Matlab default font, Helvetica
%       'classic' - Times New Roman font
%       'modern' - Archivo Narrow Medium font - *not a standard Windows
%           font. Must be installed for all users on the computer. Font
%           avaliable from https://fonts.google.com/specimen/Archivo+Narrow
%       'sans' - Arial Narrow font
%       'latexserif' - Default font for LaTeX, Computer Modern Serif - 
%           *not a standard Windows font. Must be installed for all users 
%           on the computer. Font avaliable from 
%           https://www.fontsquirrel.com/fonts/computer-modern
%       'latexsans' - Default sans serif font for LaTeX, Computer Modern Sans 
%           Serif *not a standard Windows font. Must be installed for all users 
%           on the computer. Font avaliable from 
%           https://www.fontsquirrel.com/fonts/computer-modern
%   'Orientation'
%       'landscape' - Landscape orientation of page
%       'portrait' - Portrait orientation of page
%   'Units'
%       Units of plot. Default is pixels. If any other is specified, custom
%       width and height fields must be specified.
%       'pixels' - units of pixels
%       'normalized' - normalized coordinates re screen
%       'inches' - units of inches
%       'centimeters' - units of centimeters
%       'points' - units of pt
%       'characters' - units of characters
%   'Width'
%       Width of plot. Must specify numerical width in specified units.
%   'Height'
%       Height of plot. Must specify numerical width in specified units.
%   'LegendLocation'
%       Location of legend. Follows typical MATLAB legend location arguments.
%   'WhichMonitor'
%       Chooses which monitor to display plots on. Enter whole numbers between 1
%       and n, where n is the number of monitors connected.
% Special use case:
%   If you put the argument 'StandardStyle' into the function followed by a
%   name of a specific standard style ('GroupStandard' for the group
%   standard style, the function will default to the specified standard 
%   setting for plots.
%   If the function is run with no arguments the function will default to
%   using the 'GroupStandard' style.
%
function plotStyle(varargin)
    %% Input Parsing
    % Parse inputs and assign default values
    p = inputParser;
    p.addParameter('StandardStyle','none');
    p.addParameter('FontStyle',NaN);
    p.addParameter('FontSize',NaN);
    p.addParameter('LineWidth',NaN);
    p.addParameter('MarkerSize',NaN);
    p.addParameter('ColorScheme',NaN);
    p.addParameter('PlotSize',NaN);
    p.addParameter('AspectRatio',NaN);
    p.addParameter('Orientation',NaN);
    p.addParameter('Units',NaN);
    p.addParameter('Width',NaN);
    p.addParameter('Height',NaN);
    p.addParameter('LegendLocation',NaN);
    p.addParameter('WhichMonitor',1);
    p.parse(varargin{:});
    
    % Assigning optional inputs
    style = lower(p.Results.StandardStyle);
    fontSize = p.Results.FontSize;
    fontStyle = lower(p.Results.FontStyle);
    lineWidth = p.Results.LineWidth;
    markerSize = p.Results.MarkerSize;
    colorScheme = lower(p.Results.ColorScheme);
    plotSize = lower(p.Results.PlotSize);
    aspectRatio = lower(p.Results.AspectRatio);
    orientation = lower(p.Results.Orientation);
    width = p.Results.Width;
    height = p.Results.Height;
    units = lower(p.Results.Units);
    legendLocation = lower(p.Results.LegendLocation);
    whichMonitor = p.Results.WhichMonitor;
    
    %% Assigning Parameters Based on Inputs
    
    switch lower(style)
        case 'matlabdefault' % Default MATLAB figure defaults on startup
            %-- Figures
            units = 'pixels';
            figurePosition = [0 0 560 420];
            figureColor = [1 1 1];

            %-- Axes
            axesColor = [0.15 0.15 0.15];
            axesPosition = NaN;
            axesUnits = NaN;
            axesLineWidth = 1;

            %-- Legends
            legendUnits = 'normalized';
            legendLocation = 'NorthEast';

            %-- Text
            fontName = 'Helvetica';
            fontWeight = 'normal';
            fontSize = 10;

            %-- Lines and Markers
            lineWidth = 0.5;
            markerSize = 6;
            markerFaceColor = 'none';
            lineStyleOrder = '-';

            % Colors   R     G     B
            colvect = [0     0.447 0.741;...    blue    
                       0.850 0.325 0.098;...    orange
                       0.929 0.694 0.125;...    yellow
                       0.494 0.184 0.556;...    purple    
                       0.466 0.674 0.188;...    green
                       0.301 0.745 0.933;...    light blue
                       0.635 0.078 0.184];      %red
        case {'groupstandard','none'} % Group standard style
            %-- Figures
            units = 'inches';
            figurePosition = [2,2,6.5,4];
            figureColor = [1 1 1];

            %-- Axes
            axesPosition = NaN;
            axesUnits = NaN;
            axesLineWidth = 1;
            axesColor = [0 28 84] ./ 256;

            %-- Legends
            legendUnits = 'normalized';
            legendLocation = 'EastOutside';

            %-- Text
            fontName = 'Arial';
            fontWeight = 'normal';
            fontSize = 13;

            %-- Lines and Markers
            lineWidth = 1.5;
            markerSize = 5;
            markerFaceColor = 'none';
            lineStyleOrder = {'-','--',':','-.'};

            % Colors   R   G   B
            colvect = [0   0   0  ;...    blue    
                       230 159 0  ;...    orange
                       86  80  233;...    yellow
                       0   158 115;...    purple    
                       240 228 66 ;...    green
                       0   114 178;...    light blue
                       213 94  0  ;...    this
                       204 121 167]/256;  %red
        case 'sonicboom' % Sonic Boom Group style
            %-- Figures
            units = 'inches';
            figurePosition = [2,2,6.5,4];
            figureColor = [1 1 1];

            %-- Axes
            axesPosition = [0.1000, 0.1250, 0.8500, 0.8150];
            axesUnits = 'Normalized';
            axesLineWidth = 1;
            axesColor = [0 46 93] ./ 256;

            %-- Legends
            legendUnits = 'normalized';
            legendLocation = 'EastOutside';

            %-- Text
            fontName = 'Arial';
            fontWeight = 'normal';
            fontSize = 13;

            %-- Lines and Markers
            lineWidth = 1.5;
            markerSize = 5;
            markerFaceColor = 'none';
            lineStyleOrder = {'-','--'};

            % Colors   R   G   B
            colvect = [0   46  93 ;...        BYU navy
                       256 100 100;...        salmon
                       100 100 256;...        periwinkle
                       100 256 100;...        lime green
                       256 200 0  ;...        gold
                       256 100 256;...        pink
                       100 256 256;...        cyan
                       256 150 0  ;...        orange
                       200 200 200;...        grey
                       150 0   256;...        purple
                       0   0   0  ;...        black
                       ]/256; 
        case 'custom' % Custom, configurable plot style
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
                case 'custom'
                    if isnumeric(width) && isnumeric(height) &&...
                            length(height) == 1 && length(width) == 1
                        xSize = width;
                        ySize = height;
                    elseif isnumeric(width) && (~isnumeric(height) ||...
                        length(height) ~= 1)
                        warning(...
                        ['Invalid height (must be specified for custom size).',...
                        ' Must be a single number.'])
                    elseif isnumeric(height) && (~isnumeric(width) ||...
                        length(width) ~= 1)
                        warning(...
                        ['Invalid width (must be specified for custom size).',...
                        ' Must be a single number.'])
                    else
                        warning(...
                        ['Invalid height and width ',...
                        '(must be specified for custom size).',...
                        ' Both must be a single number'])
                    end
                otherwise
                    if ~isnan(plotSize)
                        warning('Unsupported plot size.')
                    end % if ~isnan(plotSize)
                    xSize = NaN;
            end % switch plotSize
            
            
            if ~strcmp(plotSize,'custom') % Set y size if custom not specified
                switch aspectRatio
                    case 'tall'
                        ySize = 4/3*xSize;
                    case 'square'
                        ySize = xSize;
                    case 'standard'
                        ySize = 3/4*xSize;
                    case 'widescreen'
                        ySize = 9/16*xSize;
                    case 'ultrawide'
                        ySize = 9/21*xSize;
                    otherwise
                        if ~isnan(aspectRatio)
                            warning('Unsupported aspect ratio.')
                            ySize = NaN;
                        end % if ~isnan(aspectRatio)
                        pos = get(0,'DefaultFigurePosition');
                        ySize = pos(4)/pos(3)*xSize;
                    end % switch aspectRatio
            end % switch plotSize

            switch orientation
                case 'landscape'
                case 'portrait'
                    xSizeOld = xSize;
                    xSize = ySize;
                    ySize = xSizeOld;
                    clear xSizeOld;
                otherwise
                    if ~isnan(orientation)
                        warning('Unsupported orientation.')
                    end % if ~isnan(orientation)
            end % switch orientation
            
            if lineWidth <= 0 && ~isnan(lineWidth) % error checking
                warning('Invalid line width. Enter values greater than 0.')
                lineWidth = NaN;
            end % if lineWidth

            if fontSize <= 0 && ~isnan(lineWidth) % error checking
                warning('Invalid font size. Enter values greater than 0.')
                fontSize = NaN;
            end % if fontSize

            if markerSize <= 0 && ~isnan(lineWidth) % error checking
                warning('Invalid marker size. Enter values greater than 0.')
                fontSize = NaN;
            end % if markerSize

            switch fontStyle
                case 'default'
                    fontName = 'Helvetica';
                case 'classic'
                    fontName = 'Times New Roman';
                case 'modern'
                    fontName = 'Archivo Narrow Medium';
                case 'sans'
                    fontName = 'Arial Narrow';
                case 'latexserif'
                    fontName = 'CMU Serif';
                case 'latexsans'
                    fontName = 'CMU Sans';
                otherwise
                    if ~isnan(fontStyle)
                        warning('Unsupported font.')
                    end % if ~isnan(plotSize)
                    fontName = NaN;
            end % switch fontStyle
            
            switch units
                case {'pixels','normalized','inches','centimeters','points',...
                    'characters'}
                otherwise
                    if ~isnan(units)
                        warning('Unsupported units')
                        units = NaN;
                    end
            end % switch units

            switch legendLocation
                case {'north','south','east','west','northeast','northwest',...
                    'southeast','southwest','northoutside','southoutside',...
                    'eastoutside','westoutside','northeastoutside',...
                    'northwestoutside','southeastoutside','southwestoutside',...
                    'best','bestoutside','layout','none'}
                otherwise
                    if ~isnan(legendLocation)
                        warning('Invalid legend location.')
                        legendLocation = NaN;
                    end
            end % switch legendLocation

            switch colorScheme
                case {1,'matlabdefault'} % MATLAB Default
                    % Colors   R     G     B
                    colvect = [0     0.447 0.741;...  blue    
                               0.850 0.325 0.098;...  orange
                               0.929 0.694 0.125;...  yellow
                               0.494 0.184 0.556;...  purple    
                               0.466 0.674 0.188;...  green
                               0.301 0.745 0.933;...  light blue
                               0.635 0.078 0.184;...  red
                               ];
                case 2 % Colorblind 1
                    % Colors   R   G   B
                    colvect = [245 121 58 ;...        orange 
                               169 90  161;...        purple
                               133 192 249;...        sky blue
                               15  32  128;...        royal blue
                               ]/255;  
                case 3 % Colorblind 2
                    % Colors   R   G   B
                    colvect = [96  26  74 ;...        purple  
                               238 68  47 ;...        red orange
                               99  172 190;...        blue
                               230 230 9  ;...        yellow
                               ]/255;
                case 4
                    % Colors   R   G   B
                    colvect = [45  73  121;...        blue    
                               204 34  6  ;...        red
                               0   128 0  ;...        green
                               117 51  183;...        purple    
                               190 153 32 ;...        yellow
                               62  151 190;...        light blue
                               240 78  0  ;...        orange
                               198 9   151;...        pink
                               ]/255;
                case {5,'tolbright'} % Tol Bright
                    % Colors   R   G   B
                    colvect = [68  119 170;...        blue
                               238 102 119;...        red/pink
                               34  136 51 ;...        green
                               204 187 68 ;...        yellow
                               102 204 238;...        cyan
                               170 51  119;...        purple
                               187 187 187;...        grey
                               ]/255;
                case {6,'tolvibrant'} % Tol Vibrant
                    % Colors   R   G   B
                    colvect = [238 119 51 ;...        orange
                               0   119 187;...        blue    
                               51  187 238;...        cyan
                               238 51  119;...        magenta
                               204 51  17 ;...        red
                               0   153 136;...        teal
                               187 187 187;...        grey
                               ]/255; 
                case {7,'tolmuted'} % Tol Muted
                    % Colors   R   G   B
                    colvect = [204 102 119;...        rose
                               51  34  136;...        indigo
                               221 204 119;...        sand
                               17  119 51 ;...        green
                               136 204 238;...        cyan
                               136 34  85 ;...        wine
                               68  170 153;...        teal
                               153 153 51 ;...        olive
                               170 68  153;...        purple
                               221 221 221;...        pale grey
                               ]/255; 
                case {8,'MatlabClassic'} % MATLAB Classic
                    % Colors   R G B
                    colvect = [1 0 0;...              red    
                               0 1 0;...              green
                               0 0 1;...              blue
                               0 1 1;...              cyan
                               1 0 1;...              magenta
                               1 1 0;...              yellow
                               0 0 0;...              black
                               ]; 
                case {9,'sonicboom'} % Sonic Boom
                    % Colors   R   G   B
                    colvect = [0   46  93 ;...        dark blue
                               256 100 100;...        salmon
                               100 100 256;...        periwinkle
                               100 256 100;...        lime green
                               256 200 0  ;...        gold
                               256 100 256;...        pink
                               100 256 256;...        cyan
                               256 150 0  ;...        orange
                               200 200 200;...        grey
                               150 0   256;...        purple
                               0   0   0  ;...        black
                               ]/256; 
                otherwise
                    if ~isnan(colorScheme)
                        warning('Unsupported color scheme')
                    end % ~isnan(colorScheme)
                    colvect = NaN;
            end % switch colorScheme
            
            fontWeight = NaN;
            legendUnits = NaN;
            axesPosition = NaN;
            axesUnits = NaN;
            figurePosition = [0 0 xSize ySize];
            figureColor = [1 1 1];
            axesColor = [0 0 0];
            markerFaceColor = 'none';
            lineStyleOrder = {'-','--',':','.'};
        end % switch style
    
    %% Assign options struct properties based on inputs
    
    %-- Figures
    options.units = units;
    options.figurePosition = figurePosition;
    options.whichMonitor = whichMonitor;
    options.figureColor = figureColor;

    %-- Axes
    options.axesUnits = axesUnits;
    options.axesPosition = axesPosition;
    options.axesColor = axesColor;
    options.axesLineWidth = lineWidth;

    %-- Legends
    options.legendUnits = legendUnits;
    options.legendLocation = legendLocation;

    %-- Text
    options.fontName = fontName;
    options.fontWeight = fontWeight;       
    options.fontSize = fontSize;     
            
    %-- Lines and Markers
    options.lineWidth = lineWidth;
    options.markerSize = markerSize;
    options.markerFaceColor = markerFaceColor;
    options.lineStyleOrder = lineStyleOrder;

    % Colors
    options.colvect = colvect;

    SetPlotDefaults(options) % Call setter function with options struct

    disp('Plot defaults set successfully!')
end % plotStyle

function SetPlotDefaults(options)
% This function sets plot defaults based on properties in the 'options'
% struct passed into the funcion by the plotStyle function.

    %---FIGURES------------------------------------------------------------
    if ~isnan(options.units) % Only change if specified
        set(0,'DefaultFigureUnits',options.units)
    end % ~isnan(options.units)
    
    % Only change if specified
    if all(~isnan(options.figurePosition)) && all(~isnan(options.units)) 
        set(0,'units',options.units)
        MP = get(0,'MonitorPositions');
        assert(options.whichMonitor <= length(MP(:,1)),...
        ['Invalid monitor number. Enter number between 1 and ',...
        num2str(length(MP(:,1)))])
        h = figure('OuterPosition',MP(options.whichMonitor,:));
        pos = h.Position;
        close(h)
        options.figurePosition(1) = pos(1) + pos(3)/2 - options.figurePosition(3)/2;
        options.figurePosition(2) = pos(2) + pos(4)/2 - options.figurePosition(4)/2;
        set(0,'DefaultFigurePosition',options.figurePosition)
    end % ~isnan(options.figurePosition)
    
    if ~isnan(options.figureColor) % Only change if specified
        set(0,'DefaultFigureColor',options.figureColor)
    end % ~isnan(options.figureColor)

    %--AXES----------------------------------------------------------------
    if ~isnan(options.axesUnits) % Only change if specified
        set(0,'DefaultAxesUnits',options.axesUnits)
    end % ~isnan(options.axesUnits)
    
    if ~isnan(options.axesPosition) % Only change if specified
        set(0,'DefaultAxesPosition',options.axesPosition)
    end % ~isnan(options.axesPosition)
    
    if ~isnan(options.lineWidth) % Only change if specified
        set(0,'DefaultAxesLineWidth',options.lineWidth)
    end % ~isnan(options.lineWidth)
    
    if ~isnan(options.axesColor) % Only change if specified
        set(0,'DefaultAxesXColor',options.axesColor)
        set(0,'DefaultAxesYColor',options.axesColor)
        set(0,'DefaultAxesZColor',options.axesColor)
    end % ~isnan(options.axesColor)

    %---LEGENDS------------------------------------------------------------
    if ~isnan(options.legendUnits) % Only change if specified
        set(0,'DefaultLegendUnits',options.legendUnits)
    end % ~isnan(options.legendUnits)
    
    if ~isnan(options.legendLocation) % Only change if specified
        set(0,'DefaultLegendLocation',options.legendLocation)
    end % ~isnan(options.legendLocation)

    %---TEXT---------------------------------------------------------------
    if ~isnan(options.fontName) % Only change if specified
        set(0,'DefaultAxesFontName',options.fontName)
    end % ~isnan(options.fontName)
    
    if ~isnan(options.fontWeight) % Only change if specified
        set(0,'DefaultAxesFontWeight',options.fontWeight)
        set(0,'DefaultTextFontWeight',options.fontWeight)
    end % ~isnan(options.fontWeight)

    if ~isnan(options.fontSize) % Only change if specified
        set(0,'DefaultAxesFontSize',options.fontSize)
        set(0,'DefaultTextFontSize',options.fontSize)
    end % ~isnan(options.fontSize)

    %---LINES-AND-MARKERS--------------------------------------------------
    if ~isnan(options.lineWidth) % Only change if specified
        set(0,'DefaultLineLineWidth',options.lineWidth)
    end % ~isnan(options.lineWidth)
    
    if ~isnan(options.markerSize) % Only change if specified
        set(0,'DefaultLineMarkersize',options.markerSize)
    end % ~isnan(options.markerSize)
        
    set(0,'DefaultAxesLineStyleOrder',options.lineStyleOrder)
    
    if ~isnan(options.colvect) % Only change if specified
        set(0,'DefaultAxesColorOrder',options.colvect)
    end % ~isnan(options.colvect)

    disp('Sonic boom plot defaults set successfully')

end %SetPlotDefaults
