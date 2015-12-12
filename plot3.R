## First read in data file and subset out rows that we are interested in

rawData <- read.csv("household_power_consumption.txt", sep=";", 
                    colClasses = c("character", "character", "numeric","numeric", "numeric", 
                                   "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
reduced <- subset(rawData, Date == '1/2/2007' | Date == '2/2/2007')

## make new date/time field
reduced$Date <- as.Date(reduced$Date, format="%d/%m/%Y")
reduced$DateTime <- as.POSIXct(paste(as.Date(reduced$Date), reduced$Time))

## plot time
with(reduced,  {plot(Sub_metering_1 ~ DateTime, xlab="", ylab="Global Active Power (kilowatts)", type="l")
                lines(Sub_metering_2 ~ DateTime, col = 'Red')
                lines(Sub_metering_3 ~ DateTime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## copy out to png
dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!