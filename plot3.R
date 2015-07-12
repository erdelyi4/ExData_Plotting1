## load some useful libraries
library(data.table)

## read in data
rawPowerData <- fread("household_power_consumption.txt",colClasses=c("char","char,","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## filter the data for the required time perio
filtPowerData <- subset(rawPowerData, Date == "1/2/2007" | Date == "2/2/2007")

## free up some memory
rm(rawPowerData)

## create the png file
png(file="plot3.png",width=480,height=480,units="px",bg="white")

##calculate days of week
timeadd <- strptime(paste(filtPowerData[,Date],filtPowerData[,Time]),"%d/%m/%Y %H:%M:%S")

##plot the data
plot(timeadd,filtPowerData[,Sub_metering_1],type="l",ylab="Energy Sub Metering",xlab="")
points(timeadd,filtPowerData[,Sub_metering_2],type="l",col="red")
points(timeadd,filtPowerData[,Sub_metering_3],type="l",col="blue")
legend("topright",lwd=2, col=c("black","red","blue"),legend=c(colnames(filtPowerData)[7:9]))

## change the plot output from png back to default
dev.off()