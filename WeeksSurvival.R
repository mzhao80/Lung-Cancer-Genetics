library(readxl)
data <- read_excel("Documents/weeksSurvival.xlsx", 
    col_types = c("skip", "skip", "numeric", 
        "text", "text", "text", "text", "text", 
        "numeric", "text", "text", "text", 
        "text", "text"))
set.seed(100)
train <- sample(nrow(data), 0.7*nrow(data), replace = FALSE)
TrainSet <- data[train,]
ValidSet <- data[-train,]
TrainSet <- as.data.frame(TrainSet)
for (i in c(2:6, 8:12)) {
  TrainSet[, i] <- as.factor(TrainSet[, i])
}
library(randomForest)
rSample = TrainSet[sample(nrow(TrainSet), 2000), ]
model1 <- randomForest(Survival ~ ., data = rSample, ntree = 1000, mtry=6, importance = TRUE)
model1