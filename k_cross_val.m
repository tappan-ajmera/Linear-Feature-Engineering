function [avg_test_err,avg_train_err] = k_cross_val(x,y,K)

%Function to perform k cross validation

N = size(x,1);

chunk_size = floor(N/K);

Rtrain = 0;
Rtest = 0;

for k=1:K
    test_start = 1+(k-1)*chunk_size;
    test_end = k*chunk_size;
    
    who_test= test_start:test_end;
    who_train = [1:test_start-1 test_end+1:K*chunk_size];
      
    x_train  = x(who_train, :);
    y_train = y(who_train);
    
    x_test  = x(who_test, :);
    y_test = y(who_test,:);
    
    w  = lin_solve(x_train,y_train);
    
    y_train_pred = w'*x_train';
    y_pred = w'*x_test';
    Rtest(k) = norm(y_test-y_pred').^2;
    Rtrain(k) = norm(y_train - y_train_pred').^2;
    
end

avg_test_err = sum(Rtest)/K;
avg_train_err = sum(Rtrain)/K;












    