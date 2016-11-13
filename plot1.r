##Reading the data and adjusting the date format
data<- read.table("household_power_consumption.txt", header=T,sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

power <- data[data$Date=="2007-2-1" | data$Date =="2007-2-2",]
globalActivePower <- as.numeric(as.character(power$Global_active_power))


##Plotting Histogram
hist(globalActivePower,col="red",breaks=11, xlab="Global Active Power (kilowatts)", 
     ylab="Frequency",main="Global Active Power")

dev.copy(png,file="plot1.png",height=480, width=480)
dev.off()