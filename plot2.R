#loading data
data<-read.delim("household_power_consumption.txt",sep=";")
data<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
#making the plot
windows()
png(filename = "Plot2.png", width = 480, height = 480, units = "px")
datetime<- strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime,as.numeric(data[,3]),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

