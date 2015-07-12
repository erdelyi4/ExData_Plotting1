## load some useful libraries
library(data.table)

## read in data
rawPowerData <- fread("household_power_consumption.txt",colClasses=c("char","char,","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## filter the data for the required time perio
filtPowerData <- subset(rawPowerData, Date == "1/2/2007" | Date == "2/2/2007")

## free up some memory
rm(rawPowerData)

## create the png file
png(file="plot1.png",width=480,height=480,units="px",bg="white")

## calculate breakpoints
breakpoints <- seq(floor(min(as.numeric(filtPowerData[,Global_active_power]))),ceiling(max(as.numeric(filtPowerData[,Global_active_power]))),0.5)

## create the histogram
hist(as.numeric(filtPowerData[,Global_active_power]),breaks=breakpoints,freq=TRUE,col = "red",main="Global Active Power",xlab="Global Active Power (kilowatts)",axes=FALSE)

## create the axes
axis(2,seq(0,1200,200))
axis(1,seq(0,6,2))

## change the plot output from png back to default
dev.off()