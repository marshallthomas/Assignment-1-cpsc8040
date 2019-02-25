#Caleb Thomas, caleb8, assignment_1 for class 8040
#This takes you to the correct folder.  
setwd("assignment_1")
getwd()
# this is the code for question 1
# This produces a line graph showing the change in the unemployment percentage over time
nojobs<-read.csv(file="unemployment1948_2010.csv", header=TRUE, sep=",")
plot(nojobs$Year, nojobs$Value, type = "l", xlab = "Time", ylab = "Unemployment percentage", main = "Unemployment Over Time")


# this is the code for question 2
# this produces a bar plot showing the birth rates across all of the countries.  
births<-read.csv(file="birth-rate.csv", header=TRUE, sep=",")
barplot(births$X2008, names = births$Country, las = "2", xlab = "Country", ylab = "birth rate in 2008", main = "birth rate ")



# this is the code for question 3
# It produces a scatter plot that compares the murder and burglary rates per population 
# and shows the reader at trend fo how the population affects both of these statistics.  
crime<-read.csv(file="crimeRatesByState2005.csv", header=TRUE, sep=",")
#I'm setting the first value (the united states) to zero to erase it from the data, because since 
#it is an aggregate data of the rest of the information, it is a hilarious outlier and will skew the data and kepe the graph
#from showing the customer/viewer what they're supposed to actually be retaining from looking at the graph.  

#I'm also adjusting the population and murder rates to make a neater graph that more easily conveys all of the informaiton 
#to the reader.  
crime$population <- crime$population/100000
crime$population[1]=0
crime$state[1]= " "
crime$murder[1] = 0
crime$murder= crime$murder*100
crime$burglary[1] = 0
require(graphics)
scatter.smooth(crime$population, crime$murder, pch = 22, xlab = "population of each state per 100,000", ylab = "crime statistics per capita", main = "crime statistics per state", col = "blue", ylim=c(0, 1200), lpars= list(col= "blue"))
par(new = "T")
scatter.smooth(crime$population, crime$burglary, pch = 6, col = "red", xlab = "population of each state per 100,000", ylab = "crime statistics per capita", lpars = list(col = "red"))
legend(235, 1200, legend = c("murders per 10,000k","burglaries per 100k"), col = c("blue", "red"), pch = c(22, 6), bg = "white")

       