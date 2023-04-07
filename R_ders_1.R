
# Nesne tipleri
x <- 1
print(x)

msg <- "Hello"  ## aciklama

msg

# Degerlendirme
x <- 5 
x  # Ekranda x belirir
print(x)

x <- 11:35
x

# Nesne tipi

# Numerik

x <- c(0.76, 1, 3.4, 7.8)

class(x)

#Karakter

msg <- "Merhaba!"

class(msg)

#logical (boolean)

class(TRUE)

class(FALSE)

bool_1 <- c(F,T,F,F,T,T,T)

class(bool_1)

sum(bool_1)

mean(bool_1)

3 > 4

class(3 <= 4)

0.5 == 1/2


# Vektorler

x <- c("Hi",0.5,0.6) #numeric
x <- c(TRUE,FALSE) #logical
x <- c(T,F) #logical
x <- c("a","b","c") ## character
x <- 9:29 ##integer
x <- c(1+0i,2+4i) ##complex

x <- vector("numeric",length = 10)
x


# Farkli nesneleri birlestirmek

y <- c(1.7,"a") ## character
y <- c(TRUE,2) ## numeric
y <- c("a",TRUE) ##character

# Vektor degisimi

x <- 0:6
class(x)

as.numeric(x)
as.logical(x)
as.character(x)

x + 3


# x in tipini degistir

x <- as.character(x)

x

x + 3

x <- c("a","b","c")

as.numeric(x)
as.logical(x)
as.complex(x)




# Erisim

x <- c("a","b","c")


x[1]

x[2:3]

x[4]


# Matrisler

m <- matrix(nrow = 2, ncol= 3)
m
dim(m)
attributes(m)

m <- matrix(1:6,nrow = 2,ncol = 3, byrow = TRUE)
m <- matrix(1:9,nrow=3,ncol= 3)

# Matrise erisim

m[2,3]
m[3,1]

m[1,1:2]
m[,2]


m <- 1:10
m

dim(m) <- c(2,5)
m

# Sutun baglamak
x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

x <- list(1,"a",TRUE,1 + 4i)
x

x <- vector("list",length = 5)

# Faktorler (Kategoriler) 

x <- factor(c("yes","yes","no","yes","no"))
table(x)

unclass(x)

x <- factor(x, levels = c("no","yes"))

x

# Na degerleri (Bos deger)
x <- c(1, 2, NA, 10, 3,1/0,NaN)

is.na(x)

is.nan(x)


# Isimler

x <- 1:3
names(x)

names(x) <- c("A1","B2","C3")

# Naming lists

x <- list("Ankara" = 1, "Adana" = 2, "Izmir" = 3)
x

# Naming Matrices

m <- matrix(1:4,nrow = 2,ncol = 2)
dimnames(m) <- list(c("a","b"),c("c","d"))
colnames(m) <- c("h", "f")
rownames(m) <- c("x", "z")
m

print(m)




# Subsetting

x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x
x[1]
x[[c(1,3)]]


# Veri verceveleri (data frame)
data1 <- data.frame(foo = 1:4,bar = c(TRUE,TRUE,FALSE,FALSE))

data1



market_data <- read.table(file = "data/Market.txt",sep = ";",header = TRUE)

market_data


# Omitting NA

x <- c(1, 2, NA, 4, NA, 5)

na.omit(x)

bad <- is.na(x)
bad
x[!bad]


airquality
bad <- is.na(airquality)
air_new <- airquality[!bad]

x <- 10:16
y <- 20:26
x + y
x/y
x*y


library(tidyverse)

rep_data <- read.table("data/rep_data_son.csv",header = TRUE,sep = ",")
rep_data

rep_data <- read.csv("data/rep_data_son.csv")

head(rep_data,10)
tail(rep_data,8)
names(rep_data)

rep_data$Date
rep_data$Body_length
head(rep_data$Body_length)

summary(rep_data)
summary(rep_data$Date)
summary(rep_data$Sex)
length(rep_data$Species)
mean(rep_data$Body_length)
sd(rep_data$Body_length)

attach(rep_data)
hist(rep_data$Body_length)
Females <- rep_data$Sex == "F"
rep_data[Females,]
rep_data[Females,6]
mean(rep_data[Females,6])
rep_data[Females,"Body_length"]
hist(rep_data[Females,"Body_length"])

summary(rep_data$Species)
Lacerta <- rep_data$Species == "Lacerta_diplochondrodes"
rep_data[Lacerta,"Body_length"]
hist(rep_data[Lacerta,"Body_length"])
Lacerta_body <- rep_data[Lacerta,"Body_length"]
log(Lacerta_body)
hist(log(Lacerta_body))
Lacerta_body/10
hist(log10(Lacerta_body))
boxplot(data = rep_data,Body_length~Species)





##
rep_data
female_data <- filter(rep_data, Sex == "F")
rep_data <- filter(rep_data, Body_length > 350)
new_data <- select(rep_data, Species, Body_length, Body_temp)
new_data <- arrange(new_data,Body_length)

new_data <- rename(new_data, Bl = Body_length, Bt = Body_temp)
new_data <- mutate(new_data, Br = Bt/Bl)
