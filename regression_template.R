# Regression Template

# Polynomial Regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting the Regression Model to the dataset
# Create our regressor here

# Predicting a new Result
y_pred = predict(regressor, newdata = data.frame(Level = 6.5))

# Visualizing the Regression Model Results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level , y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff(Regression Model)') +
  xlab('Level') +
  ylab('Salary')

# Visualizing the Regression Results(for higher resolution and smoother curve)
library(ggplot2)
X_grid = seq(min(dataset$Level), max(dataset$Level), step = 0.1)
ggplot() +
  geom_point(aes(x = X_grid, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level , y = predict(regressor, newdata = data.frame(Level = X_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff(Regression Model)') +
  xlab('Level') +
  ylab('Salary')








