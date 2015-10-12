rng(1)

x = randn(1,50);
y = randn(1,50);

% Generatate theta0 and theta1 values
theta = meshgrid(-10:.1:10, -10:.1:10);

J = (1/2*numel(x))* sum((repmat(theta(1,:), numel(x),1)' + theta(2,:)'*x - repmat(y, numel(theta(2,:)),1)).^2,3);

figure(1)
plot(x, y, 'ro')

figure(2)
imagesc(J)