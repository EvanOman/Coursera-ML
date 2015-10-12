rng(1)

x = 10*randn(1,25) + 2;
y = 10*rand(1,25) + 2;

% Generatate theta0 and theta1 values
[theta1, theta2] = meshgrid(-5:.05:5, -5:.05:5);

J = zeros(size(theta1,1), size(theta1,1));

JF = @(x,y,th1,th2) (1/2*numel(x)) * sum( ((th1 + th2 * x) - y).^2);

for i = 1:size(theta1,1)
	for j = 1:size(theta1,1)
		th1 = theta1(i,j);
		th2 = theta2(i,j);
		J(i,j) = JF(x,y,th1,th2);
	end
end



figure(2)
surf(theta1, theta2, J)

% Finds the coordinates of the minimal element of J
[M, I] = min(J(:));
[I_row, I_col] = ind2sub(size(J), I);

th1 = theta1(I_row, I_col);
th2 = theta2(I_row, I_col);

fprintf('The smallest value occurs at (%d, %d) with value %d\n', th1, th2, M);

xP = min(x):.1:max(x);
yP = th1 + xP * th2;

figure(1)
plot(x, y, 'ro', xP, yP, 'b-')