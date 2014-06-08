plot3 <- function(){

  require(datasets)
  
  dates <- factor(c("01/02/2007","02/02/2007"));
  dates <- as.Date(dates,format="%d/%m/%Y");  
  
  # Read data
  data1 <- read.table("household_power_consumption.txt", header = T,sep=";",na.strings="?", colClasses = c(rep("character",2), rep("NULL",4),rep("numeric", 3)));
  data1$newDate <- as.Date(data1$Date,format="%d/%m/%Y");
  
  #Select the dates 
  data2 <- subset(data1, newDate >= dates[1] & newDate <= dates[2]);
  
  #Definition of the x-axis
  data2$DateTime <- paste(data2$Date,data2$Time,sep=" ");
  x <- strptime(data2$DateTime,format="%d/%m/%Y %H:%M:%S");    
  
  # Plot the graph
  png(filename="plot3.png",width = 480, height = 480, units = "px");
  Sys.setlocale("LC_TIME", "C")
  g_range <- range(data2$Sub_metering_1,data2$Sub_metering_2,data2$Sub_metering_3);
  plot(x,data2$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="",ylim=g_range);
  lines(x,data2$Sub_metering_2, col="red")
  lines(x,data2$Sub_metering_3, col="blue")  
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue")) # gives the legend lines the correct color and width
  dev.off();

}
