#Load Data
data<-read.table ("household_power_consumption.txt",header = TRUE,sep = ";",dec = ".",na.strings = "?")
#convert Date column
data$Date<-strptime(data$Date,format = "%d/%m/%Y")
#subset Data
data1<-data[(data$Date)>="2007-02-01" & data$Date<="2007-02-02",]
#create plot
png(filename = "plot1.png",width=480,height=480)
with(data1,{
  hist(Global_active_power,main ="Global Active Power",xlab = "Global Active Power (kilowatts)",col = 2)
})
dev.off()