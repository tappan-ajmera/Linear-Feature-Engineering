function w_bar = lin_solve(X,Y)

%Solve the matrix linearly to get w

s = X'*Y;

m = X'*X;

w_bar = m\s;
