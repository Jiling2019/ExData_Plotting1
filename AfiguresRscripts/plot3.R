#download and unzip the file in current working directory
#require()
#read data(date=2007-02-01 and 2007-02-02)
  f<-"household_power_consumption.txt"
  data <-read.table(f,skip=66637,nrows =2880,sep=";",
                  col.names=names(read.table(f,sep=";",header = T,nrows = 1)))
#Change data and time format
  data$Time<-strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
  data$Date<-as.Date(data$Date,"%d/%m/%Y")
#Plot the figure3
  png(filename = "plot3.png")
  plot(data$Time,data$Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering")
  lines(data$Time,data$Sub_metering_1)
  lines(data$Time,data$Sub_metering_2,col="red")
  lines(data$Time,data$Sub_metering_3,col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
  dev.off()