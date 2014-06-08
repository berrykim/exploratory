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

# draw plot 3

png("plot3.png")

plot(mydata$sec, as.numeric(mydata$Sub_metering_1), type="l",
     ylab="Energy sub metering", xlab="")
lines(mydata$sec, as.numeric(mydata$Sub_metering_2), type="l", col="red")
lines(mydata$sec, as.numeric(mydata$Sub_metering_3), type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend=names(mydata)[7:9])

dev.off()
