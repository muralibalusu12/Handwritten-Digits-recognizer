% Solving a Classification Problem using an Ensemble of Decision Trees
% Script written by Murali Raghu Babu B
%

%importing training data from files.
train=importdata('odtrain');
trainl=importdata('odtrainlabel');

%importing testing data from files.
test=importdata('odtest');
testl=importdata('odtestlabel');

% Ensemble of ' Decision Trees '
tree = templateTree('Prune','on','MergeLeaves','on','MinLeaf',1);

%vector to hold accuracy for various ensemble of classifiers based on
%varying K - no of classifiers

percent=zeros(50,1);

for k=1:50
    %training an ensemble of classifiers with no. of classifiers defined by K
    ensemble=fitensemble(traind,traindl,'AdaBoostM2',10*k,tree);
    
    %pedicting labels on test data
    labels=predict(ensemble,test);
    
    %calculating accuracy
    compare=(testl==labels);
    s=numel(compare);
    compare=sum(compare);    
    percent(k) = (compare/s)*100;
    display(k);
end

    %plotting accuracy of classification versus performance of the KNN classifiers based on K
    figure1 = figure;
    t=[10:10:500];
    t=t';

     title('{\bf Accuracy of Classification using Ensemble- varying no of classifiers}');
     xlabel('Value of K- no of Classifiers') ;
     ylabel('percentage of correct classification');
     axis([0 500 0 100]); hold on;
     plot(t,percent,'-rx'); hold on;
     legend('Using Ensemble Decision Trees');

     saveas(figure1,'optdigitEnsemble.jpg') ; %saving the figure as a jpeg image