function [ x, y ] = RIVETtransform(lat,lon);

% function to convert from lat & lon (decimal degrees, negative longitude)
% to RIVET x,y (meters)
%
% function [ x y ] = FRFtransform(lat,lon);
%
% J. Thomson, 1/2011
 
latoffset = 34.527896; 
lonoffset = -77.338232;

declination = 9; % CCW from True North
% RIVET coor has +x = 158 M, thus...
rotation = 90-158+declination; % deg CCW from True north

radius = 6371*cos(deg2rad(latoffset));

north = 1000*deg2km( lat - latoffset );
east = 1000*deg2km(lonoffset - lon , radius );

x = east .* cos(deg2rad(rotation))   -   north .* sin (deg2rad(rotation));;

y = east .* sin(deg2rad(rotation))   +   north .* cos (deg2rad(rotation));

x = - x;
