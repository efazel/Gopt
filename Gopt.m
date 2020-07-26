%%%% Gopt Function %%%%
% Author: Ehsan Fazel (Concordia University)
% This version: June 2019


function [OptG,cntr,bic,Indx] = Gopt(data,gmax,replic)
% Gopt Summary:
% Gopt computes the optimal number of clusters based on the information
% criterion presented in Manresa and Bonhomme (2016) without covariates.
% The function runs the MATLAB Kmeans function to get the clusters

% The function needs a panel of T by N of data (data) and a specified max 
% number of clusters (Gmax), and number of replications (replic) eg. 100,
% 1000.
T = size(data,1);
N = size(data,2);
K = 0;

if gmax > N
   error('Error. Gmax cannot be more than variables')
else

panel = data';
for g=2:gmax
    rng(1); %set the initial points
    [idx,C,sumd] = kmeans(panel,g,'Replicates',replic); 
    idx2{1,g-1} = idx;
    centroids{1,g-1} = C;
    finalobj(1,g-1) = sum(sumd); 
end
sigma2 = finalobj(1,gmax-1)/((N*T)-(gmax*T)-N-K);
BIC = zeros(gmax-1,1);
for d =1:gmax-1
          BIC(d,1)= (finalobj(1,d)/(N*T))+(sigma2*log(N*T)*(((d+1)*T)+N+K))/(N*T); 
end
[m,I] = min(BIC);
OptG = I + 1;
cntr = centroids{1,I};
Indx = idx2{gmax-1};
bic = m;
fprintf('Optimal number of clusters: \n')
OptG
end     
end

