% Solving a Classification Problem using Decision Trees
% Script written by Murali Raghu Babu B
%

%importing training data from files.
train=importdata('odtrain');
trainl=importdata('odtrainlabel');

%importing testing data from files.
test=importdata('odtest');
testl=importdata('odtestlabel');



    %training a Decision Tree classifier 
    mdl = fitctree(train,trainl);
    
    %pedicting labels on test data
    label = predict(mdl,test);
    
    %calculating accuracy
    compare=(testl==label);
    s=numel(compare);
    compare=sum(compare);    
    percent = (compare/s)*100;  


    