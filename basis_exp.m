function poly=basis_exp(x,order)

%basis expansion

poly=ones(size(x,1),1);
for k =1:order
    poly=[poly x.^k];
end
