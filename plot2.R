setwd("C:/Users/Samyak/Desktop/Academics/Coursera/Data_Science_JHU_4/Week_1")
png("plot2.png", width=480, height=480)
data_full <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE
                      ,comment.char="", quote='\"')
data1 <- subset(data_full, Date == "1/2/2007"|Date == "2/2/2007")

#Preprocessing for conversion to POSIXct format
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)


with(data1, 
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab=""))
## type l means a line plot without points marked

dev.off()