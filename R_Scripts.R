setwd("/Users/manojkumar/Desktop/Manojkumar_Drive/Projects/Data Science Projects/Kaggle/USA mass shooting")

data <- read.csv("Mass Shootings Dataset.csv")
print(data)
summary(data)
class(data)


USzip <- read.csv("free-zipcode-database.csv")
print(data)
print(subset(USzip,USzip$Zipcode == 42461))


data$Latitude[is.na(data$Latitude)] <- 0
data$Longitude[is.na(data$Longitude)] <- 0


#install.packages("ggmap")
#install.packages("zipcode")
library("ggmap")
library("zipcode")
data("zipcode")

zipcode$latitude
print(subset(zipcode,round(zipcode$latitude,2) == 38.84))


data$zip_code <- do.call(rbind,lapply(1:nrow(data), function(i)revgeocode(as.numeric(data[i,11:12]))))
print(data$zip_code)
