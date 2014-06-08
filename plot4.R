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

# draw plot 4

png("plot4.png")

par(mfrow=c(2,2), mar=c(4,4,2,1))

plot(mydata$sec, as.numeric(mydata$Global_active_power), type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

plot(mydata$sec, as.numeric(mydata$Voltage), type="l",
     ylab="Voltage", xlab="datetime")

plot(mydata$sec, as.numeric(mydata$Sub_metering_1), type="l",
     ylab="Energy sub metering", xlab="")
lines(mydata$sec, as.numeric(mydata$Sub_metering_2), type="l", col="red")
lines(mydata$sec, as.numeric(mydata$Sub_metering_3), type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend=names(mydata)[7:9])

plot(mydata$sec, as.numeric(mydata$Global_reactive_power), type="l",
     ylab="Global_reactive_power", xlab="datetime")

dev.off()