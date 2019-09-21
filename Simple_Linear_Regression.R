data= read.csv("dataset.csv")
dataset1 = data.frame(data$Total.HH,data$Total.Ind)


library(caTools)
set.seed(123)
split= sample.split(dataset1$data.Total.Ind, SplitRatio = .70)
training = subset(dataset1, split==TRUE)
test = subset(dataset1, split== FALSE)


regressor = lm(formula = data.Total.Ind ~ data.Total.HH,
               data = training)
y_predict = predict(regressor, newdata = test)
View(y_predict)
#summary(regressor)

#ploting training line 

library(ggplot2)
ggplot()+
  geom_point(aes(x = training$data.Total.Ind, y = training$data.Total.HH ),
             colour = 'red')+
  geom_line(aes(x = training$data.Total.Ind, y =predict(regressor, newdata = training)),
            colour = 'blue')+
  ggtitle(" Individual vs Household")+
  xlab("Individual")+
  ylab("Household")



#test line 
ggplot()+
  geom_point(aes(x = test$data.Total.Ind, y = test$data.Total.HH ),
             colour = 'red')+
  geom_line(aes(x = test$data.Total.Ind, y =predict(regressor, newdata = test)),
            colour = 'blue')+
  ggtitle(" Individual vs Household")+
  xlab("Individual")+
  ylab("Household")
