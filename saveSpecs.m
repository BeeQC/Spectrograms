%%Inputs:
%  onset: onset in ms
%  offset: offset in ms

onset = 200;
offset = 300;
saveName = 'yourNameHere.png'; %sets file name

%% Gets spectrogram
[data, fs]=audioread(file); %get song data
data = downsample(data,2);
fs=fs/2;
[S,~,T] = spectrogram(data, 400, 300, [], fs); %get spectrogram data

%%Gets onset/offset info and plots it in grayscale
[~,myStart] = min(abs(T-onset/1000));
[~,myEnd] = min(abs(T-offset/1000)); %ms to seconds

sylData = flipud(abs(S(:,myStart:myEnd))); %syllable window

imwrite(ind2rgb(im2uint8(sylData), pink(128)), saveName)