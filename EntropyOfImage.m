%reading the image
A=imread('C:\\Users\\anime\\Desktop\\image.jpg');
%imhist
counts =imhist(A);
p=0;
res=0;
sum=0;%for storing the total number of pixel values
J=entropy(A)%inbuilt function to calculate the entropy
%this function is used only to verify the results
for n= 1:length(counts)%traverses the counts variable 
    %that stores the imhist data
    sum=sum +counts(n,1);
end
for n= 1:length(counts)
    p=counts(n,1)/sum;%normalises the counts of pixels
    %stores the normalised value for the particular pixel value
    if p~=0%to check if p!=0 (p will be zero only if there are no pixels for that value)
        
        res=res-(p*log2(p));%calculates entropy
    end
end
res
