%% SCRIPT: DEMO
%
%   Demonstration of Fast Graphlet Transform (FGlT)
%


%% CLEAN-UP

clear
close all

%% PARAMETERS
n = 1000000; p = 3;
A = sprand(n,n,p/n);
A = sparse( logical( A+A' ) );
A = A - diag(diag(A));

% load('data/testGraph06.mat') 

%% (BEGIN)

fprintf('\n *** begin %s ***\n\n',mfilename);

%% COMPUTE GRAPHLETS

ticFGlT = tic; fprintf( '...compute graphlets...\n' ); 

Fnet = fglt( A );

fprintf( '   - DONE in %.2f sec\n', toc(ticFGlT) );

%% check against ORCA

G = graph.runOrca(A); 

fprintf('Discrepancy %f\n', norm(G - Fnet, 'fro'))

% [ii,jj] = find(F ~= G);
% 
% ii = unique(ii);
% jj = unique(jj);
% 
% fprintf('Differences in %d verices %d graphlets\n', ...
%   length(ii), length(jj))
% 
% fprintf('FGLT\n')
% util.dispmat(F(ii(1:min(10,length(ii))),:),'%5d')
% 
% fprintf('ORCA\n')
% util.dispmat(G(ii(1:min(10,length(ii))),:),'%5d')
% 
% D = F - G;
% fprintf('diff\n')
% util.dispmat(D(ii(1:min(10,length(ii))),:),'%5d')

% [Draw,Dnet] = graph.graphletFreqFastV2(A);
% fprintf('Discrepancy FGLT raw %f \n', norm(Draw - Fraw, 'fro'))
% fprintf('Discrepancy ORCA net %f \n', norm(G - Fnet, 'fro'))

%% (END)

fprintf('\n *** end %s ***\n\n',mfilename);


%%------------------------------------------------------------
%
% AUTHORS
%
%   Dimitris Floros                         fcdimitr@auth.gr
%
% VERSION       0.1
%
% CHANGELOG 
%
%   0.1 (Aug 18, 2020) - Dimitris
%       * initial implementation
%
% TIMESTAMP     <Aug 19, 2020: 12:31:15 Dimitris>
%
% ------------------------------------------------------------

