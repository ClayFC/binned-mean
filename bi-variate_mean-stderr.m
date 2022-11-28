clear all
close all
clc

data = [27,	5;
31, 5;
24, 4]	

interval = 5; % interval in which binned mean will be preformed

for i = 1:(115 - 25)/interval % defines x-axis space for statistical operations to be run
	for j = 1:length(data(:,1)) % defines y-axis space for statistical operations to be run
		if data(j,1) > (i-1)*interval+20 && data(j,1) < i*interval+20
			tmp(j,1:2) = data(j,1:2);
		else
			tmp(j,1:2) = [0,0];
		end
	end
	if isempty(nonzeros(tmp(:,1))) == 0
		m(i,1) = mean(nonzeros(tmp(:,2)));
		s(i,1) = std(nonzeros(tmp(:,2)))/sqrt(length(nonzeros(tmp(:,2))));% Noah McLean, standard error operation
	else
		m(i,1) = 9999;
		s(i,1) = 0;
	end
	x(i,1) = i*interval+20 - interval/2;% shifts binns across x-axis
end

figure % defines plotting parameters
hold on
plot([x'; x'], [(m+s)'; (m-s)'], '-r', 'Color', 'k', 'LineWidth',35) % 2 sig error bars
scatter(data(:,1),data(:,2),30,'m','filled') % controls plotting of dataset
%scatter(x,m,30,'b','filled') % defines center point of standard error
axis([25 85 -20 20]) % defines x and y-axis plot boundaries

numpoints = 100; % points per running average

X1 = (data(:,1));
Y1 = (data(:,2));
[X_sorted, X_order] = sort(X1);
Y_sorted = Y1(X_order,:);
%M = movmedian(Y_sorted,numpoints); % defines running median
%S = movstd(Y_sorted,numpoints); % defines running standard deviation
%plot(X_sorted,M,'color','b','linewidth',4) % executes running median
%plot(X_sorted,M+2*S,'color','k','linewidth',2) % executes upper standard deviation boundary
%plot(X_sorted,M-2*S,'color','k','linewidth',2) % executes lower standard deviation boundary

xlabel('Age (Ma)') % x-axis label
ylabel('eHfT') % y-axis label








