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

# Fitting the Linear Regression to the dataset
lin_reg = lm(formula = Salary ~ ., data = dataset)

# Fitting the Polynomial Regression to the dataset
dataset$Level2 = dataset$Level ^ 2
dataset$Level3 = dataset$Level ^ 3
dataset$Level4 = dataset$Level ^ 4
dataset$Level5 = dataset$Level ^ 5
poly_reg = lm(formula = Salary ~ ., data = dataset)

# Visualizing the Results of Linear Regression Model
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level , y = predict(lin_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Trith or Bluff(Linear Regression)') +
  xlab('Level') +
  ylab('Salary')

# Visualizing the Results of Polynomial Regression Model
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level , y = predict(poly_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff(Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')

# Predicting a new Result with Linear Regression
y_pred = predict(lin_reg, newdata = data.frame(Level = 6.5))

# Predicting a new Result with Polynomial Regression
y_pred = predict(poly_reg, newdata = data.frame(Level = 6.5,
                                               Level2 = 6.5 ^ 2,
                                               Level3 = 6.5 ^ 3,
                                               Level4 = 6.5 ^ 4,
                                               Level5 = 6.5 ^ 5))











