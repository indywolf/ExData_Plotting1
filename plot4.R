## First read in data file and subset out rows that we are interested in

rawData <- read.csv("household_power_consumption.txt", sep=";", 
                    colClasses = c("character", "character", "numeric","numeric", "numeric", 
                                   "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
reduced <- subset(rawData, Date == '1/2/2007' | Date == '2/2/2007')

## make new date/time field
reduced$Date <- as.Date(reduced$Date, format="%d/%m/%Y")
reduced$DateTime <- as.POSIXct(paste(as.Date(reduced$Date), reduced$Time))

## plot time
par(mfrow = c(2,2))
with(reduced,  {
  plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active Power", xlab = "")
  
  plot(Voltage ~ DateTime, type = "l", ylab = "Voltage", xlab = "datetime")
  
  plot(Sub_metering_1 ~ DateTime, xlab="", ylab="Energy sub metering", type="l")
  lines(Sub_metering_2 ~ DateTime, col = 'Red')
  lines(Sub_metering_3 ~ DateTime, col = 'Blue')
  legend("topright", cex=.5, col = c("black", "red", "blue"), lty=1, lwd=2, 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
  plot(Global_reactive_power ~ DateTime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})


## copy out to png
dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!