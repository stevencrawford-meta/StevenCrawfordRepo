% Function to compute SI-SDR
% Steven Crawford - Acoustic Research Engineer - ART-SI - Meta October 2022
% Reference: SDR – HALF-BAKED OR WELL DONE? by Le Roux et. al
% https://www.jonathanleroux.org/pdf/LeRoux2019ICASSP05sdr.pdf

function si_sdr = computeSI_SDR(cleanRef,processedEst)
    % compute reference signal energy 
    ref_energy = sum(cleanRef .^ 2);
    % compute the optimal scaling factor alpha 
    alpha = dot(processedEst',cleanRef) / ref_energy;
    % compute the orthogonal projection of the estimate
    e_tar = alpha * cleanRef;
    % compute the residual distortion 
    e_res = processedEst - e_tar;
    % compute SI-SDR
    si_sdr = 10*log10(norm(e_tar)^2 / norm(e_res)^2);
end