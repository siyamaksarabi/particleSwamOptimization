%% PARTICLE SWARM OPTIMIZATION (2 Dimensions Problem)
%===============================================
%===================================== © siyamak.sarabi@gmail.com 7/5/2013
clear;
close all;
clc;
%===============================================    

%=================PARAMETER DEFINITION==========/
nPar=2000;                     % number of particles
nIter = 150;                   % number of iteration
particles=rand(nPar,2);
v=rand(nPar,1);                % random velocity
opt=[0.5,0.5];                 % Global optimum point, an example
c1=0.01;                       % acceleration coefficients. factor that...
                               % influences the cognitive behaviour
c2=0.1;                        % factor  social behaviour
%===============================================\

%=============Initialization ===================/
%slide=struct([]);
structName = struct('cdata',cell(2,1),'colormap',cell(2,1));
structName = repmat(structName,nIter,1);
part = zeros(nPar,2);
cost = zeros(nPar,1);
COST = zeros(nPar,nIter);
%===============================================\


%===============STARTING THE ALGORITHM==========/

for j=1:nIter
    
    for i=1:1:nPar % CALCULATING THE COST/FITNESS FOR EACH PARTICLE
        cost(i,1)=sqrt((opt(1)-particles(i,1))^2+((opt(2)-particles(i,2))^2));
    end
    COST(:,j)= cost;
    [g_best, n2]=min(COST(:,j));
        
    for u=1:1:nPar % UPDATING THE NEW POSITION FOR EACH PARTICLE
        [p_best, n1]=min(COST(u,:));
    
        v_prim= rand*c1*(particles(n1,1)-particles(u,1))+ rand*c2*(particles(n2,1)-particles(u,1));
        particlex=particles(u,1)+v_prim;
        
        v_prim= rand*c1*(particles(n1,2)-particles(u,2))+ rand*c2*(particles(n2,2)-particles(u,2));
        particley=particles(u,2)+v_prim;
        v(u+1)=v_prim;
        part(u,:)=[particlex particley];
    end
    particles=part;
    subplot(121)    
    plot(particles(:,1),particles(:,2),'ok');% PLOTING THE RESULTS
    hold on
    plot(opt(1),opt(2),'or','linewidth',2)
    hold off
    xlabel('X');
    ylabel('Y');
    axis([0 1 0 1])
    
    sgtitle('Particle Swarm Optimization, two dimention problem','fontsize',12)
    legend([num2str(nPar),' particles'],'Global optimum point')
    grid on;
    subplot(122)
    hold on
    plot(j,g_best,'.k')
    hold off
    xlabel('nIter')
    ylabel('G_{best}')
    set(gcf,'position',[200,200, 900,400])
    xlim([0,nIter])
    grid on
    structName(j) = getframe;
    %display(num2str(j));

end
%movie(structName);

    
    

%===============================================\ END
%======================================= © siyamak.sarabi@gmail.com
