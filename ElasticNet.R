library(readr)
dataset <- read_csv("Downloads/weeksSurvival.csv", 
    col_types = cols(Birth = col_skip(), 
        Year = col_skip()))
library(caret)
library(glmnet)
set.seed(42)
cv_5 = trainControl(method = "cv", number = 5)
training <- sample(nrow(dataset), 0.7*nrow(dataset), replace = FALSE)

data_elnet = train(
  Survival ~ ., data = dataset, subset= training,
  method = "glmnet",
  trControl = cv_5, na.action = na.exclude
)