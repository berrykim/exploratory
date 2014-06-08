# JOHNS HOPKINS EXPLORATORY DATA ANALASIYS
# PROJECT 1

# download and subset data

if(!file.exists("./data")) {dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./data/household_power_consumption.zip") #Window user
unzip("./data/household_power_consumption.zip", exdir="data")

library(data.table)
data<-fread("./data/household_power_consumption.txt")
mydata<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
rm(data)
mydata<-as.data.frame(mydata)

# draw plot 1

png("plot1.png")

hist(as.numeric(mydata$Global_active_power), col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()

