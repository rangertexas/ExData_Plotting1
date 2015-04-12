#Load Data
data<-read.table ("household_power_consumption.txt",header = TRUE,sep = ";",dec = ".",na.strings = "?")
#convert Date column
data$Date<-strptime(data$Date,format = "%d/%m/%Y")
#subset Data
data1<-data[(data$Date)>="2007-02-01" & data$Date<="2007-02-02",]
data1$timeline<-as.POSIXct(paste(data1$Date, data1$Time), format="%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_ALL","C")
#create plot without points
png(filename = "plot2.png",width=480,height=480)
with(data1,{
  plot(timeline,Global_active_power,ylab = "Global Active Power (kilowatts)",xlab = "",pch =NA_integer_)
#Add lines to plot
lines(timeline,Global_active_power)
})
dev.off()