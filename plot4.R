#Load Data
data<-read.table ("household_power_consumption.txt",header = TRUE,sep = ";",dec = ".",na.strings = "?")
#convert Date column
data$Date<-strptime(data$Date,format = "%d/%m/%Y")
#subset Data
data1<-data[(data$Date)>="2007-02-01" & data$Date<="2007-02-02",]
data1$timeline<-as.POSIXct(paste(data1$Date, data1$Time), format="%Y-%m-%d %H:%M:%S")
#create plot 
png(filename = "plot4.png",width=480,height=480)

par(mfrow=(c(2,2)))
with (data1,{
  plot(timeline,Global_active_power,ylab = "Global Active Power",xlab = "",pch =NA_integer_)
  lines(timeline,Global_active_power)
  plot(timeline,Voltage,ylab = "Voltage",xlab = "datetime",pch =NA_integer_)
  lines(timeline,Voltage)
  plot(timeline,Sub_metering_1,ylab = "Energy sub metering",xlab = "",pch=NA_integer_)
  lines(timeline,Sub_metering_1,col="black")
  lines(timeline,Sub_metering_2,col="red")
  lines(timeline,Sub_metering_3,col="blue")
  legend(bty = "n","topright",lwd = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(timeline,Global_reactive_power,xlab = "datetime",pch =NA_integer_)
  lines(timeline,Global_reactive_power)
  
})
dev.off()