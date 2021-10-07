addpath(genpath('C:\Users\danie\OneDrive - Scuola Superiore Sant''Anna\MATLAB\LNE'))
timeCourse = double(mat_sev.RSn1.data);
% recording è la matrice è channels x time
cd('C:\Users\danie\Documents\GitHub\Kilosort');
datI = int16(timeCourse*1e6);

% folder è il foldrer in cui salvi il recordin
% id_animale è il filename
fid = fopen(sprintf('%s\\%s.bin','C:\Users\danie\Documents\GitHub\Kilosort','dig1052'), 'w');
fprintf('SAVING DATA of %s \n','dig1052');
fwrite(fid, datI, 'int16');
% fwrite(fid, timeCourse, 'double');
fclose(fid);

%% plot all channels
figure;
hold on
for i = 1:32
    plot(datI(i,:)+1000*i)
end

%% check .bin file
fid = fopen(sprintf('%s\\%s.bin','C:\Users\danie\Documents\GitHub\Kilosort','dig1052'));
bin_data = fread(fid, '*int16');

figure;
hold on
for i = 1:32
    plot(bin_data(i,:)+1000*i)
end

%%
subplot(2,1,2)
plot(datI(1,:));

plot(datI(2,:))
