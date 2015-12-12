## First read in data file and subset out rows that we are interested in

rawData <- read.csv("household_power_consumption.txt", sep=";", 
                    colClasses = c("character", "character", "numeric","numeric", "numeric", 
                                   "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
reduced <- subset(rawData, Date == '1/2/2007' | Date == '2/2/2007')

## plot time
hist(reduced$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

## copy out to png
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!