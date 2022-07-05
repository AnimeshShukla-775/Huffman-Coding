clear 
clc
close all
Prob=input('Enter probabilities- ')%input the probbabilities
Prob=transpose(Prob);

Mq=min(Prob);
for k=1:1:length(Prob)
    for j=1:1:length(Prob)
        if(Prob(j)==Prob(k))Prob(j)=Prob(j)+Mq/10000*j;
        end
    end
end

ProbSorted=flipud(sort(Prob));
Res=zeros(length(ProbSorted),1);

length(ProbSorted);
for k=1:1:length(ProbSorted)
    k;condition=0;Cnt=1;
        ProbSorted=flipud(sort(Prob));
        pq=ProbSorted;
        while(condition==0)
            %Splits the array pq into two halves of as close equal
            %probabilities as possible
            for t=1:1:length(pq)
                a1=sum(pq(1:t));
                b1=sum(pq(t+1:end));
                c1(t)=(a1-b1);
            end

            c1=abs(c1);
            [y,t]=min(c1);
            Result1=pq(1:t);
            Sz1=t;%stores the size of one half
            Result2=pq(t+1:length(pq));
            Sz2=length(pq)-t;%stores the size of other half
            
            clear find1
            clear find2
            Search1=find(Result1==ProbSorted(k));
            Search2=find(Result2==ProbSorted(k));
            sf1=size(Search1);
            sf2=size(Search2);
            
            %after division 2 is put in the first half elements and 1 is stored in
            %the seond half elements. The reason why 2 is taken instead of
            %0 is mentioned below
            if(sf1(1,1)>0)
                %2 was taken to store in place of 0 beause all the leading
                %zeros like 0,001,000,etc would not be able to be stored as
                %is and thus there would be no leading zeros in the answer
      
                if  (Cnt==1) b(k)=2;
                    else b(k)=b(k)*10+2;
                end
                if(Sz1==1)
                    condition=1;
                    Res(k)=b(k);
                else
                    clear pq
                    pq=Result1;
                end
            elseif(sf2(1,1)>0)
                if  (Cnt==1)b(k)=1;
                    else b(k)=b(k)*10+1;
                end
                
                if(Sz2==1)
                    condition=1;
                    Res(k)=b(k);
                else
                    clear pq
                    pq=Result2;
                end
            end
        Cnt=Cnt+1;    
        end
end
str_res='';%stores the final result
%this loop stores the result after converting the '2's that where taken
%in place of '0's to '0's
for k=1:1:length(Res)
    %changes the number from integer to string and replaces 2 with 0
    %storing the result in 't2o' variable
    tmp=num2str(Res(k));
    Cnt=length(tmp);
    for k=1:1:Cnt
        if(tmp(k)=='2')t2o(k)='0';
            else t2o(k)='1';
        end
    end

    t2o(Cnt+1)=':';
    %adds up all the ShannonFano Codes in the final string
    if (k==1) str_res=t2o;
        else str_res=strcat(str_res,t2o);
    end
end
str_res(end)=''