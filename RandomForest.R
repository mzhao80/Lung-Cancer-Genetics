export3 <- read.csv(file = "Documents/export3.csv")
data <- export3[, c(-1,-3)] #removing tumor id and year of birth
set.seed(100)
train <- sample(nrow(data), 0.7*nrow(data), replace = FALSE)
data2 <- as.matrix(data)
TrainSet <- data2[train,]
ValidSet <- data2[-train,]
TrainSet <- as.data.frame(TrainSet)
for (i in c(1:7, 9:13)) {
  TrainSet[, i] <- as.factor(TrainSet[, i])
}

TrainSet[, 8] <- as.numeric(TrainSet[, 8])
library(randomForest)
rSample = TrainSet[sample(nrow(TrainSet), 2000), ]
model1 <- randomForest(Death ~ ., data = rSample, ntree = 1000, mtry=10, importance = TRUE)
model1