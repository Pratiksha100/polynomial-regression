# -*- coding: utf-8 -*-
"""
Created on Wed Nov 20 11:12:01 2019

@author: pratiksha.garode

Model Name: Polynomial Regression
"""

# Date Preprocessing

# Imprting libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing Datasets
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

# Splitting the dataset into training set and testing set
"""from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)
"""

# =============================================================================
# # Feature scaling
# from sklearn.preprocessing import StandardScaler
# sc_X = StandardScaler()
# X_train = sc_X.fit_transform(X_train)
# X_test = sc_X.transform(X_test)
# =============================================================================

# Fitting the Linear Regression Model to the Dataset
from sklearn.linear_model import LinearRegression
lin_reg = LinearRegression()
lin_reg.fit(X, y)

# Fitting the Polynomial Regression to the Dataset
from sklearn.preprocessing import PolynomialFeatures
poly_reg = PolynomialFeatures(degree = 5)
X_poly = poly_reg.fit_transform(X)
lin_reg_2 = LinearRegression()
lin_reg_2.fit(X_poly, y)

# Visualizing the Results of Linear Regression Model
plt.scatter(X, y, color = 'orange')
plt.plot(X, lin_reg.predict(X), color = 'blue')
plt.title('Truth or Bluff(Linear Regression)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()

# Visualizing the Results of Polynomial Regression Model
X_grid = np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape(len(X_grid), 1)
plt.scatter(X, y, color = 'orange')
plt.plot(X_grid, lin_reg_2.predict(poly_reg.fit_transform(X_grid)), color = 'blue')
plt.title('Truth or Bluff(Polynomial Regression)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()

# Predicting a new Result with Linear Regression
lin_reg.predict(np.array(6.5).reshape(1, 1))

# Predicting a new Result with Polynomial Regression
lin_reg_2.predict(poly_reg.fit_transform(np.array(6.5).reshape(1, 1)))







