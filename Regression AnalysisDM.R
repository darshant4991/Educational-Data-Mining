DMData <- read.csv("DMDataSet_Cleaned.csv" , stringsAsFactors = TRUE)

str(DMData)

model <- lm(Enrolled.total ~ Applicants.total + Admissions.total + 
              DMData$Total.price.for.students.living.on.campus + 
              DMData$Percent.of.freshmen.receiving.institutional.grant.aid + 
              DMData$Percent.of.freshmen.receiving.any.financial.aid + 
              DMData$Percent.of.freshmen.receiving.other.federal.grant.aid, data=DMData)

summary(model)

par(mfrow=c(2,2))

plot(model)
