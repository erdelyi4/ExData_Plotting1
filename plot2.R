## load some useful libraries
library(data.table)

## read in data
rawPowerData <- fread("household_power_consumption.txt",colClasses=c("char","char,","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## filter the data for the required time perio
filtPowerData <- subset(rawPowerData, Date == "1/2/2007" | Date == "2/2/2007")

## free up some memory
rm(rawPowerData)

## create the png file
png(file="plot2.png",width=480,height=480,units="px",bg="white")

##calculate days of week
timeadd <- strptime(paste(filtPowerData[,Date],filtPowerData[,Time]),"%d/%m/%Y %H:%M:%S")

## creating the plot
plot(timeadd,filtPowerData[,Global_active_power],type="l",main="",xlab="",ylab="Global Active Power (kilowatts)")

## change the plot output from png back to default
dev.off()