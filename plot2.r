##Reading the data and adjusting the date format
data<- read.table("household_power_consumption.txt", header=T,sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

power <- data[data$Date=="2007-2-1" | data$Date =="2007-2-2",]
globalActivePower <- as.numeric(as.character(power$Global_active_power))

#Reformat date and time
datetime <- paste(power$Date, power$Time)
power$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(globalActivePower~power$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png,file="plot2.png",height=480, width=480)
dev.off()