% Solving a Classification Problem using KNN
% Script written by Murali Raghu Babu B
%

%importing training data from files.
train=importdata('odtrain');
trainl=importdata('odtrainlabel');

%importing testing data from files.
test=importdata('odtest');
testl=importdata('odtestlabel');

%vector to hold accuracy for various KNN classifiers based on varying K
percent=zeros(20,1);

for k=1:20
    %training a KNN classifier with nearest neighbors parameter defined by
    mdl = fitcknn(train,trainl,'NumNeighbors',k);
    
    %pedicting labels on test data
    label = predict(mdl,test);
    
    %calculating accuracy
    compare=(testl==label);
    s=numel(compare);
    compare=sum(compare);    
    percent(k) = (compare/s)*100;  
end

    %plotting accuracy of classification versus performance of the KNN classifiers based on K
    figure1 = figure;
    t=[1:1:20];
    t=t';

    title('{\bf Accuracy of Classification using KNN- varying K}');
    xlabel('Value of K- nearest neighbors') ;
    ylabel('percentage of correct classification');
    axis([0 20 90 100]); hold on;
    plot(t,percent,'-rx'); hold on;
    legend('Using KNN');

    saveas(figure1,'optdigitKNN.jpg') ; %saving the figure as a jpeg image
