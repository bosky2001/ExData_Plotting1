#loading data
data<-read.delim("household_power_consumption.txt",sep=";")
data<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
#making the histogram
windows()
png(filename = "Plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(data[,3]),xlab="Global Active Power(kilowatts)",col="red")#[,3] is the column we use, we can also use data$Global_active_power
dev.ofF()
