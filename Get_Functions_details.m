
function o=MLP_Diabetes(solution)
load Diabetes.txt
 x=Diabetes;
 %I2=x(1:150,1:4);
 H2=x(1:699,2:11);
 for iii=1:699
     for jjj=1:10
         H2(iii,jjj)=((H2(iii,jjj)-1)/9);
     end
 end
 I2=H2(1:699,1:9);
 
 T=H2(1:699,10);
 Hno=19;
 dim=11*19;


        for ww=1:10*Hno
            W(ww)=solution(1,ww);
        end
        for bb=10*Hno+1:dim
            B(bb-(10*Hno))=solution(1,bb);
        end
        fitness=0;
        for pp=1:599
            actualvalue=my_simulate(9,Hno,1,W,B,I2(pp,:));

            fitness=fitness+(T(pp)-actualvalue)^2;

        end
        fitness=fitness/599;
        o=fitness;

end


