clc;
clear all;
p=input('Enter value of probabilty- ')

len=length(p);
HCodes=cell(1,len);
%last and second last elements in each column are changed accordingly to 2 and 3 respectively
ProbMatrix=zeros(len,len);
ProbTemp=p;
%we traverse each column and find min and second min element. Change them
%accordingly as mentioned above. 
for k=1:len-1
    [~ ,l]=sort(ProbTemp);
    ProbMatrix(l(1),k)=2;
    ProbMatrix(l(2),k)=3;
%After changing we change the probability
%of the minimum to 5 and that of second minimum to sum of (min + second min)
    ProbTemp(l(2))=ProbTemp(l(2))+ProbTemp(l(1));
    ProbTemp(l(1))=5;
end

k=len-1;
Rws=find(ProbMatrix(:,k)==2);
HCodes(Rws)=strcat(HCodes(Rws),'1');
Rws=find(ProbMatrix(:,k)==3);
HCodes(Rws)=strcat(HCodes(Rws),'0');
%calcculating and storing in the HUffman Codes. We traverse each row in
%search for element marked 3 which is related to 2. then give the element
%marked 3 a '0' and that marked 2 a '1'
for k=len-2:-1:1
    R1=find(ProbMatrix(:,k)==3);
    R0=find(ProbMatrix(:,k)==2);
    HCodes(R0)=strcat(HCodes(R1),'1');
    HCodes(R1)=strcat(HCodes(R1),'0');
end
HCodes