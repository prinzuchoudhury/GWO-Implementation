function o=my_simulate_2_inputs(W,B,x1,x2,Hno)
%Hno=50;
h=zeros(1,Hno);

for i=1:Hno
    h(i)=My_sigmoid(x1*W(i)+x2*W(Hno+i)+B(i));
end

sum=0;
for j=1:Hno
    sum=sum+(h(j)*W(2*Hno+j));
end
sum=sum+B(Hno+1);
o=My_sigmoid(sum);