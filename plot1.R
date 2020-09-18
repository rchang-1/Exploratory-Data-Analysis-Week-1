setwd("C:/Users/Samyak/Desktop/Academics/Coursera/Data_Science_JHU_4/Week_1")
png("plot1.png", width=480, height=480)
data_full <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE
                      ,comment.char="", quote='\"')
data1 <- subset(data_full, Date == "1/2/2007"|Date == "2/2/2007")
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
