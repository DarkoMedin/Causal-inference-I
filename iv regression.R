#Load the libraries
install.packages('mlbench')
install.packages('AER')
library(mlbench)
library(AER)
library(ggplot2)


#Load the dataset and store data
data("PimaIndiansDiabetes")
data=PimaIndiansDiabetes

#Boplot visualization
boxplot(data$glucose)
boxplot(data$insulin)
boxplot(data$pressure)

#Instrumental variable regression models - pressure as dependent
#Insulin used as instrument 
ivmodel1 <- ivreg(pressure~glucose | insulin, data = data)
summary(iv_model_g1, diagnostics=TRUE)



#Create a  reciprocal instrumental variable regression model - pressure
#glucose  used as instrument 
ivmodel2 <- ivreg(pressure ~ insulin | glucose, data = data)
summary(iv_model_p2, diagnostics=TRUE)

#ggplot visualization
ggplot(data =data, aes(x = insulin, y = glucose)) + 
  geom_point(color='red') +
  geom_smooth(method = "lm", se = TRUE)




