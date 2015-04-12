#Load Data
data<-read.table ("household_power_consumption.txt",header = TRUE,sep = ";",dec = ".",na.strings = "?")
#convert Date column
data$Date<-strptime(data$Date,format = "%d/%m/%Y")
#subset Data
data1<-data[(data$Date)>="2007-02-01" & data$Date<="2007-02-02",]
data1$timeline<-as.POSIXct(paste(data1$Date, data1$Time), format="%Y-%m-%d %H:%M:%S")
#create plot 
png(filename = "plot3.png",width=480,height=480)
with(data1,{
plot(timeline,Sub_metering_1,ylab = "Energy sub metering",xlab = "",pch=NA_integer_)
#Add lines to plot
lines(timeline,Sub_metering_1,col="black")
lines(timeline,Sub_metering_2,col="red")
lines(timeline,Sub_metering_3,col="blue")
#Legend
legend("topright",lwd = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
dev.off()