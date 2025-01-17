%  create a channel map file

Nchannels = 32;
connected = true(Nchannels, 1);
chanMap   = [18 5 2 7 23 17 21 19 3 24 1 8 4 22 6 20 26 13 10 15 28 14 30 12 11 32 9 16 31 25 29 27];
chanMap0ind = chanMap - 1;
xcoords   = [zeros(1,8) 200*ones(1,8) 400*ones(1,8) 600*ones(1,8)];
ycoords   = repmat([0 100 200 300 400 500 600 700], 1, 4);
kcoords   = [ones(1,8) 2*ones(1,8) 3*ones(1,8) 4*ones(1,8)]; % grouping of channels (i.e. tetrode groups)

fs = 2.441406250000000e+04; % sampling frequency
save('C:\Users\danie\Documents\GitHub\Kilosort\configFiles\NeuronexusA4x8ChanMap.mat', ...
    'chanMap','connected', 'xcoords', 'ycoords', 'kcoords', 'chanMap0ind', 'fs')

%%

Nchannels = 32;
connected = true(Nchannels, 1);
chanMap   = 1:Nchannels;
chanMap0ind = chanMap - 1;

xcoords   = repmat([1 2 3 4]', 1, Nchannels/4);
xcoords   = xcoords(:);
ycoords   = repmat(1:Nchannels/4, 4, 1);
ycoords   = ycoords(:);
kcoords   = ones(Nchannels,1); % grouping of channels (i.e. tetrode groups)

fs = 25000; % sampling frequency

save('C:\DATA\Spikes\Piroska\chanMap.mat', ...
    'chanMap','connected', 'xcoords', 'ycoords', 'kcoords', 'chanMap0ind', 'fs')
%%

% kcoords is used to forcefully restrict templates to channels in the same
% channel group. An option can be set in the master_file to allow a fraction 
% of all templates to span more channel groups, so that they can capture shared 
% noise across all channels. This option is

% ops.criterionNoiseChannels = 0.2; 

% if this number is less than 1, it will be treated as a fraction of the total number of clusters

% if this number is larger than 1, it will be treated as the "effective
% number" of channel groups at which to set the threshold. So if a template
% occupies more than this many channel groups, it will not be restricted to
% a single channel group. 