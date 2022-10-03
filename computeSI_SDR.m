% Function to compute SI-SDR
% Steven Crawford - Acoustic Research Engineer - ART-SI - Meta October 2022
% Reference: SDR – HALF-BAKED OR WELL DONE? by Le Roux et. al
% https://www.jonathanleroux.org/pdf/LeRoux2019ICASSP05sdr.pdf

function si_sdr = computeSI_SDR(cleanReference,processedEstimate)
    % compute reference signal energy 
    refSigEnergy = sum(cleanReference .^ 2);
    % compute the optimal scaling factor alpha 
    alpha = sum(cleanReference .* processedEstimate) / refSigEnergy;
    % compute the orthogonal projection of the estimate
    e_target = alpha * cleanReference;
    % compute the residual distortion 
    e_res = processedEstimate - e_target;
    % compute SI-SDR
    si_sdr = 10*log10((sum(e_target .^ 2)) / (sum(e_res .^ 2)));
end