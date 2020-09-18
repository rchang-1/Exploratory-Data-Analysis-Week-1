setwd("C:/Users/Samyak/Desktop/Academics/Coursera/Data_Science_JHU_4/Week_1")
png("plot3.png", width=480, height=480)

data_full <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE
                      ,comment.char="", quote='\"')
data1 <- subset(data_full, Date == "1/2/2007"|Date == "2/2/2007")

#Preprocessing for conversion to POSIXct format
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

with(data1, {
  plot(Sub_metering_1~Datetime, type="n",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_1~Datetime,col='Black')
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()