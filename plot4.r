##Reading the data and adjusting the date format
data<- read.table("household_power_consumption.txt", header=T,sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

power <- data[data$Date=="2007-2-1" | data$Date =="2007-2-2",]
globalActivePower <- as.numeric(as.character(power$Global_active_power))

#Reformat Variables
datetime <- paste(power$Date, power$Time)
power$Datetime <- as.POSIXct(datetime)
power$Sub_metering_1<-as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2<-as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3<-as.numeric(as.character(power$Sub_metering_3))
power$Voltage<-as.numeric(as.character(power$Voltage))
power$Global_reactive_power<-as.numeric(as.character(power$Global_reactive_power))


par(mfrow=c(2,2),mar=c(4,4,2,1))

#1
plot(globalActivePower~power$Datetime, type="l",
     ylab="Global Active Power", xlab="")

#2
plot(power$Voltage~power$Datetime, type="l",
     ylab="Voltage", xlab="datetime")

#3
plot(power$Datetime,power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power$Datetime,power$Sub_metering_2,col="red")
lines(power$Datetime,power$Sub_metering_3,col="blue")

legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1",
                    "Sub_metering_2","Sub_metering_3"),lty=1, lwd=2, bty="n",cex=0.5)

#4
plot(power$Global_reactive_power~power$Datetime, type="l", 
     ylab="Global_reactive_power",xlab="datetime")




dev.copy(png,file="plot4.png",height=480, width=480)
dev.off()