function pred_value = linear_reg()
%Linear regression
traindata = importdata('traindata.txt');
X = traindata(:,1:8);
Y = traindata(:,9);
Xtest = importdata('testinputs.txt');

error = [];
train_err = [];

for P=1:15
    basis_X = basis_exp(X,P);
    [avg_test_err,avg_train_err] = k_cross_val(basis_X, Y,10);
    error = [error avg_test_err];
    train_err = [train_err avg_train_err];
end

P = find(error==min(error(:)));

final_X = basis_exp(X,P);
final_weights = lin_solve(final_X,Y);

final_pred = final_weights'*final_X';
final_error = norm(Y-final_pred').^2;

test_X = basis_exp(Xtest,P);
pred_value = final_weights'*test_X';
disp(P);
disp(avg_train_err/(92.6*9));
disp(error(P)/92);


plot(error(1:7)/92,'b');
title('Test Error for different Polynomial Order');
