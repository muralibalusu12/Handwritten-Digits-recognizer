% Solving a Classification Problem using Neural Networks
% Script written by Murali Raghu Babu B
%

%importing training data from files.
traind=importdata('odtrain');
traindl=importdata('odtrainlabel2');
traindl2=importdata('odtrainlabel');    %labels as vectors containing binary values

%importing testing data from files.
test=importdata('odtest');
testl=importdata('odtestlabel2');
testl2=importdata('odtestlabel');       %labels as vectors containing binary values

% Creating a Pattern Recognition Network
hiddenlayer=[10 10];
mlp=patternnet(hiddenlayer);

%Division of Data for Training, Validation, Testing
%divideFcnn is dividerand (default)
mlp.divideParam.trainRatio = 70/100;            
mlp.divideParam.valRatio = 15/100;
mlp.divideParam.testRatio = 15/100;


% Training the Network
[mlp, tr]=train(mlp,traind',traindl');

% testing the network
labels=mlp(test');

[m n]=size(labels);
newlabel=zeros(n,1);

for i=1:n
    max=labels(1,i);
    maxi=1;
    for j=1:m
        if(max<labels(j,i))
            max=labels(j,i);
            maxi=j;       
        end
    end
   newlabel(i)=maxi-1;
end

compare=(testl2==newlabel);
s=numel(compare);
compare=sum(compare);    
percent = (compare/s)*100;
    

% Plots
% Uncomment these lines to enable various plots.
figure, plotperform(tr)
figure, plottrainstate(tr)
figure, plotconfusion(t,y)
%figure, plotroc(t,y)
%figure, ploterrhist(e)

