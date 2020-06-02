
clear all
clc

Runno=1;

SearchAgents_no=200; % Number of search agents

 Function_name='F1'; 

[lb,ub,dim,fobj]=Get_Functions_details(Function_name);


Max_iteration=200; % Maximum numbef of iterations

for i=1:Runno
    [Best_score(i,:),Best_pos(i,:),GWO_cg_curve(i,:)]=GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
    
    
    semilogy((GWO_cg_curve(i,:)),'Color','r')
    hold on
    %semilogy(PSO_cg_curve,'Color','b')
    title('Objective space')
    xlabel('Iteration');
    ylabel('Best score obtained so far');
    
    axis tight
    grid on
    box on
    legend('GWO')
    
end

if Function_name=='F1'
    
    input=  [0 0 0 0 1 1 1 1;0 0 1 1 0 0 1 1;0 1 0 1 0 1 0 1];
    target3=[0 1 1 0 1 0 0 1];
    Hno=7;
    dim = 5*7+1;                      % Dimension of the problem
    
    for i=1:Runno
        Rrate=0;
        W=Best_pos(i,1:4*Hno);
        B=Best_pos(i,4*Hno+1:dim);
        
        for pp=1:8
            actualvalue=my_simulate(3,7,1,W,B,input(:,pp)');
            if(target3(pp)==1)
                if (actualvalue>=0.95)
                    Rrate=Rrate+1;
                end
            end
            if(target3(pp)==0)
                if (actualvalue(1)<0.05)
                    Rrate=Rrate+1;
                end
            end
        end
        
        Final_rate(i)=(Rrate/8)*100;
    end
    
    ['classification rate = ' , num2str(Final_rate(i))]
end


