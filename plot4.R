#loading data
data<-read.delim("household_power_consumption.txt",sep=";")
data<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
#making the plot
windows()
png(filename = "Plot4.png", width = 480, height = 480, units = "px")
datetime<- strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sm1 <- as.numeric(data$Sub_metering_1)
sm2 <- as.numeric(data$Sub_metering_2)
sm3 <- as.numeric(data$Sub_metering_3)
voltage<-as.numeric(data$Voltage)
par(mfrow = c(2, 2)) 

plot(datetime,as.numeric(data[,3]), type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime,as.numeric(data[,4]), type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()


