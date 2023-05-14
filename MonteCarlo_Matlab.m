function MonteCarlo_Matlab ()
  rng ( 'default' );

% Parameters for the model
  d = 100;
  g = @ ( x ) log ( (1+ norm ( x )^2)/2 );
  T = 1;
  M = 10^7;
  t = 0;

% Classical Monte Carlo
  tic ;
  MC = 0;
  for m =1: M
    dW = randn (1 , d )* sqrt (T - t );
    MC = MC + exp ( - g ( dW * sqrt (2) ) );
  end
  MC = - log ( MC / M );
  runtime = toc ;

% Output
  disp ([ ' Solution : u (T,0) = ' num2str(g(0)) '; ' ]);
  disp ([ ' Solution : u (0,0) = ' num2str(MC) '; ' ]);
  disp ([ ' Time = ' num2str(runtime) '; ' ]);
end
