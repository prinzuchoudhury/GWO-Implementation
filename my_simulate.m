function o=my_simulate(Ino,Hno,Ono,W,B,x)
h=zeros(1,Hno);
o=zeros(1,Ono);
index=-1;

for i=1:Hno

    index=index+1;    
    ssum=0;
    for j=1:size(x,2)
        ssum= ssum+x(1,j)*W(index*Ino+j);
    end
    h(i)=My_sigmoid(ssum+B(i));
end

k=size(x,2);

for j=1:Hno
    o=o+(h(j)*W(k*Hno+j));
end

for k=1:Ono
    o(k)=My_sigmoid(o(k)+B(Ino+1));
end


