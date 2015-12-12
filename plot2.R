## First read in data file and subset out rows that we are interested in

rawData <- read.csv("household_power_consumption.txt", sep=";", 
                    colClasses = c("character", "character", "numeric","numeric", "numeric", 
                                   "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
reduced <- subset(rawData, Date == '1/2/2007' | Date == '2/2/2007')

## make new date/time field
reduced$Date <- as.Date(reduced$Date, format="%d/%m/%Y")
reduced$DateTime <- as.POSIXct(paste(as.Date(reduced$Date), reduced$Time))

## plot time
plot(reduced$Global_active_power ~ reduced$DateTime, xlab="", ylab="Global Active Power (kilowatts)", type="l")

## copy out to png
dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!