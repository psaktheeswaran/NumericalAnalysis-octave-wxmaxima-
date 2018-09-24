%A simple program that demonstrates the 
% application of the NewtonRaphson method
% for multi-dimensional problems.
%*******************************************
%Created by: Mohammad Tawfik
%Email: mohammad.tawfik@gmail.com
%
%Code associated with lecture notes titled:
%Fundamentals of Numerical Analysis
%Published on ResearchGate.net at:
%https://www.researchgate.net/publication/321850359_Fundamentals_of_Numerical_Analysis_Book_Draft
%With DOI: 10.13140/RG.2.2.25680.81925
%Lecture videos are published on the 
%#AcademyOfKnowledge website 
%http://AcademyOfKnowledge.org
%
%With the direct link: 
% https://sites.google.com/academyofknowledge.org/theakweb/engineering-and-science/applied-numerical-analysis
%
%*******************************************

%Clearing the memory
clear all
close all
clc
%Initial guesses
x=0.5;
y=0.5;
%Problem parameters
Epsilon = 1e-3; %Tolerance
MaxIter =20;      %Maximum number of iterations
%Initializing the counter and error 
Counter=0;
Err=1000;
%The search loop
while true 
  Counter=Counter+1;  %Incrementing the counter
  %Evaluating the function 
  % and its derivative at the new solution
  SQT=sqrt(1-(x-1)*(x-1) - (y-1)*(y-1));
  F1=(1-x)/SQT;
  F2=(1-y)/SQT;
  %Evaluatingthe derivatives
  F1x=-(x-1)*(x-1)/(SQT^3)-1/SQT;
  F1y=-(x-1)*(y-1)/(SQT^3);
  F2x=-(x-1)*(y-1)/(SQT^3);
  F2y=-(y-1)*(y-1)/(SQT^3)-1/SQT;
  %Filling The Jacobian Matrix
  JJ=[F1x,F1y;F2x,F2y];
  J1=inv(JJ);
  %Solving for the change
  DeltaX=-J1*[F1;F2];
  %Evaluating the new values
  x=x+DeltaX(1);
  y=y+DeltaX(2);
  %Evaluating the relative error 
  Err=DeltaX'*DeltaX;
  %Checking for termination
  if or(and(F1==0,F2==0),or(Err<Epsilon,Counter>MaxIter))
    break
  end 
end
%Displaying the solution 
Counter
Err
x
y
F1
F2