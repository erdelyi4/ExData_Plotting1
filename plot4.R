## load some useful libraries
library(data.table)

## read in data
rawPowerData <- fread("household_power_consumption.txt",colClasses=c("char","char,","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## filter the data for the required time perio
filtPowerData <- subset(rawPowerData, Date == "1/2/2007" | Date == "2/2/2007")

## free up some memory
rm(rawPowerData)

## create the png file
png(file="plot4.png",width=480,height=480,units="px",bg="white")

##calculate days of week
timeadd <- strptime(paste(filtPowerData[,Date],filtPowerData[,Time]),"%d/%m/%Y %H:%M:%S")

## plot the data
par(mfcol=c(2,2))

plot(timeadd,filtPowerData[,Global_active_power],type="l",main="",xlab="",ylab="Global Active Power")

plot(timeadd,filtPowerData[,Sub_metering_1],type="l",ylab="Energy Sub Metering",xlab="")
par(new=T)
points(timeadd,filtPowerData[,Sub_metering_2],type="l",col="red")
points(timeadd,filtPowerData[,Sub_metering_3],type="l",col="blue")
legend("topright",cex=0.9,lwd=1, bty="n",col=c("black","red","blue"),legend=c(colnames(filtPowerData)[7:9]))
par(new=F)

plot(timeadd,filtPowerData[,Voltage],type="l",main="",xlab="datetime",ylab="Voltage")

plot(timeadd,filtPowerData[,Global_reactive_power],type="l",main="",xlab="datetime",ylab="Global_reactive_power")

## change the plot output from png back to default
dev.off()