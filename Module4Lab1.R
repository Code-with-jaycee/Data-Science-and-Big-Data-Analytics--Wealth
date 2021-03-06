# Module Four: Lab 1
# from "Data Science and Big Data Analytics" 
#
ls()
###################################################
## Step 0: Getting started with R 
###################################################
setwd("C:/Users/jaycee/Desktop/Data-Science-and-Big-Data-Analytics--Wealth")
lab1 <- read.table("lab1_01.txt", sep="|", header=TRUE)
lab2 <- read.table("lab1_02.txt", sep="|", header=TRUE) 


colnames(lab1)

ls()
rm(lab2)
ls()
ds <- lab1
ds

colnames(ds)

colnames(ds) <- c("serialno", "income", "rooms")

summary(ds$income)

range(ds$income)
sd(ds$income)

var(ds$income)

plot(density(ds$income))


summary(ds$rooms)

range(ds$rooms)

sd(ds$rooms)

plot(as.factor(ds$rooms))
(m <- mean(ds$income, trim = 0.10))

summary(m)

ds <- subset(ds, ds$income >= 10000 & ds$income < 1000000)
summary(ds)

quantile(ds$income, seq(from=0, to=1, length=11))
summary(ds$income)

summary(ds$income, ds$rooms)
breaks <- c(0, 23000, 52000, 82000, 250000, 999999)

breaks
labels <- c("Poverty", "LowerMid", "UpperMind", "Wealthy", "Rich")

wealth <- cut(ds$income,breaks, labels)
ds <- cbind(ds, wealth)
head(ds)

wt <- table(wealth)
percent <- wt/sum(wt) * 100
wt

percent
plot(wt)
nt <- table(wealth, ds$rooms)
print(nt)

plot(nt)
rm(wealth, breaks, labels)

ls()
save(ds, wt, nt, file = "Census.Rdata")
ls()
library(MASS)


with(ds, {hist(income, main="Distribution of Household Income", freq=FALSE) })


logincome = log10(ds$income)
hist(logincome, main = "Distribution of Household Income", freq = FALSE)

lines(density(ds$income), lty=2, lwd=2)

with(ds, cor(income, rooms))



n = length(ds$income)
with(ds, cor(runif(n), rooms))


boxplot(income ~ as.factor(rooms), data=ds, range=0, outline=F, log="y", xlab = "# rooms", ylab = "Income")


boxplot(rooms ~ wealth, data = ds, main="Room by Wealth", xlab = "Category", ylab="# rooms")












# look at some data values 

head(lab1, n=10)
tail(lab2, n=10)

# lets look in more detail 


summary(lab1)

# and remove some extraneous variables (columns)

nlab1 <- lab1[,2:3]

# what did we get? 



dim(nlab1)
typeof(nlab1)
class(nlab1)

# what does summary() say now? 


summary(nlab1)

# same correlation values or different? 

cor(nlab1)

# clean up and save

rm(lab1) 
lab1 <- nlab1
save(lab1, lab2, file="Labs.Rdata")
rm(lab1, lab2)
ls()      # make sure they?re not in the workspace




###################################################
## Step 1: scalars and strings
###################################################

n <- 1  # scalar
s <- "Columbus, Ohio"   # string 

###################################################
## Step 2: vectors of strings and numbers
################################################### 

levels <- c("Worst", "Bad", "Mediocre", "Good", "Awesome")
ratings <- c("Worst", "Worst", "Bad", "Bad", "Good", "Bad", "Bad") 
critics <- c("Siskel", "Ebert", "Rowen", "Martin")
movies <- c("The Undefeated", "Snakes on a Plane", "Encino Man", "Casablanca")
attendance <- c(15, 350,175, 400)
reviewers <- c("Siskel", "Siskel", "Ebert", "Ebert", "Rowan", "Martin", "Rowan")

###################################################
## Step 3: factors and lists
###################################################
f <- factor(ratings, levels)  

fl <- list(ratings=ratings, critics=critics, 
           movies=movies, attendance=attendance)

###################################################
## Step 4: Matrices, Tables, and Data Frames
###################################################

mdat <- matrix(c(1,2,3, 11,12,13), nrow = 2, ncol=3, byrow=TRUE,
               dimnames = list(c("row1", "row2"),
                               c("C1", "C2", "C3")))

t <- table(ratings, reviewers)  

###################################################
## Step 5: Defining a Function
###################################################

std <- function(x) sd(x)   # defining a function 
v <- c(1:100)              # create a test vector
std(v)

tellme <- function(x) { 
  p1 <- paste("Type of", x, " is",typeof(x),sep=" ")
  print(p1)
  p2 <- paste("Class of", x, "is", class(x), sep=" ")
  print(p2)
  p3 <- paste("String rep of ",x," is", str(x), sep=" ")
  print(p3)
  p4 <- paste("Names for ", x, "is", names(x), sep=" ")
  print(p4)
  invisible()
}
tellme(t)

###################################################
## End 
###################################################
