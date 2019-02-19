#download and unzip the file in current working directory
#require()
#read data(date=2007-02-01 and 2007-02-02)
  f<-"household_power_consumption.txt"
  data <-read.table(f,skip=66637,nrows =2880,sep=";",
                    col.names=names(read.table(f,sep=";",header = T,nrows = 1)))
#Change data and time format
  data$Time<-strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
  data$Date<-as.Date(data$Date,"%d/%m/%Y")
#Plot the figure1
  png(filename = "plot1.png")
  hist(data$Global_active_power, xlab ="Global Active Power (kilowatts)",
       ylab = "Frequency",main ="Global Active Power",col = "red" )
  dev.off()