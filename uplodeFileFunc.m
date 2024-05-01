function uplodeFileFunc(filename, fileType)
    [fileData, sampleRate] = audioread(filename);
    monoData = fileData(:, 1); % Extract the first channel

    windowSize = 512; % Size of the analysis window in samples
    overlap = 256;    % Overlap between consecutive windows in samples
    [s, f, t] = spectrogram(monoData, windowSize, overlap, hamming(windowSize), sampleRate);

    %figure;
    %imagesc(t, f, 10*log10(abs(s))); % Convert to dB scale for better visualization
    %axis xy; % Invert Y-axis to have low frequencies at the bottom
    %xlabel('Time (seconds)');
    %ylabel('Frequency (Hz)');
    %title(['Spectrogram of ', fileType, ' file type']);
    %colorbar; % Add a color bar indicating magnitude

    figure;
    waterfall(t, f, 10*log10(abs(s)));
    view(3); % Change view angle to 3D
    xlabel('Time (seconds)');
    ylabel('Frequency (Hz)');
    zlabel('Magnitude (dB)');
    title(['Waterfall Plot of Spectrogram of ', fileType, ' file type']);
end

