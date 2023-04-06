
library(tidyverse)
library(datasets)
head(iris)
summary(iris$Species)

# Basic plots
head(iris)
summary(iris$Species)
par(mfrow=c(1,1))

hist(iris$Sepal.Width)

plot(x = iris$Petal.Length, y = iris$Petal.Width,
        pch = 1, col = "blue", xlab = "Petal Uzunlugu", ylab = "Petal Genisligi",
     main = "Iris Petal Olculeri")




ggplot(iris) +
  geom_histogram(aes(Sepal.Width),bins = 20) 

ggplot(iris,aes(x = Species,y =Sepal.Width)) +
  geom_boxplot(aes(fill = Species)) +
  scale_fill_manual(values = c('dodgerblue1','greenyellow',
                               'firebrick'))

ggplot(iris) +
  geom_point(aes(x = Sepal.Length, 
                 y = Sepal.Width,shape=Species,colour = Species)) +
  scale_color_manual(values = c('dodgerblue1','greenyellow','firebrick')) +
  geom_smooth(mapping = aes(x = Sepal.Length, y = Sepal.Width, colour = Species),method = "lm")


model_1 <- lm(data = iris, Sepal.Width ~ Sepal.Length)

summary(model_1)

model_2 <- lm(data = iris, Sepal.Width ~ Sepal.Length + Petal.Length)

summary(model_2)

model_3 <- lm(data = iris, Sepal.Width ~ Sepal.Length + Petal.Length + Species )



#testing for normality
qqnorm(iris$Sepal.Width)
qqline(iris$Sepal.Width,lty=2)
shapiro.test(iris$Sepal.Width)
shapiro.test(iris$Sepal.Length)
qqnorm(iris$Sepal.Length)
qqline(iris$Sepal.Length)
hist(log(iris$Sepal.Length))

# testing for skewness and kurtosis (optional)
library(moments)
hist(iris$Sepal.Width)
hist(iris$Sepal.Length)
skewness(iris$Sepal.Length)
skewness(iris$Sepal.Width)
kurtosis(iris$Sepal.Width)
kurtosis(iris$Sepal.Length)

#Test for skewness
skewness(iris$Sepal.Width)/sqrt(6/length(iris$Sepal.Width))
1-pt(1.58,149)


# comparing two samples
virginica <- filter(iris,Species == 'virginica')
versicolor <- filter(iris, Species == 'versicolor')

# Variance test
var.test(virginica$Sepal.Width,versicolor$Sepal.Width)

t.test(virginica$Sepal.Width,versicolor$Sepal.Width)



# Load rep_data
rep_data <- read_csv("data/rep_data_son.csv")



# Exercises

#1 Define the data as species ~ body temperature with boxplots, 

#2 Take only;  Species, Sex, Body_temp and Substrate

#3 Look at how the data conform to normality, include histograms

#4 Test the difference between groups with t test

t.test(rep_data$Body_length ~ rep_data$Species)



