plot4 <- function(){

  require(datasets)
  
  #Definition of important dates
  dates <- factor(c("01/02/2007","02/02/2007"));
  dates <- as.Date(dates,format="%d/%m/%Y");  
  
  # Read data
  data1 <- read.table("household_power_consumption.txt", header = T,sep=";",na.strings="?", colClasses = c(rep("character",2),rep("numeric",7)));
  data1$newDate <- as.Date(data1$Date,format="%d/%m/%Y");
  
  #Select the dates 
  data2 <- subset(data1, newDate >= dates[1] & newDate <= dates[2]);
    
  #Definition of the x-axis
  data2$DateTime <- paste(data2$Date,data2$Time,sep=" ");
  x <- strptime(data2$DateTime,format="%d/%m/%Y %H:%M:%S"); 
  
  #A matrix of figures
  png(filename="plot4.png",width = 480, height = 480, units = "px");
  par(mfrow = c(2, 2))
  Sys.setlocale("LC_TIME", "C")
 
  #Global active power
  plot(x,data2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="");
 
  #Voltage
  plot(x,data2$Voltage,type="l",ylab="Voltage",xlab="datetime");
  
  #Sub_metering
  g_range <- range(data2$Sub_metering_1,data2$Sub_metering_2,data2$Sub_metering_3);
  plot(x,data2$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="",ylim=g_range);
  lines(x,data2$Sub_metering_2, col="red")
  lines(x,data2$Sub_metering_3, col="blue")  
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"),cex=0.8)
   
  #Global_reactive_power
  plot(x,data2$Global_reactive_power,type="l",ylab="Global reactive power",xlab="datetime");
   
  #Close the device
  dev.off();
  
  #Reset the screen parameters
  par(mfrow=c(1,1));
}



resetPar <- function() {
  dev.new()
  op <- par(no.readonly = TRUE)
  dev.off()
  op
}