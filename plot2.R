plot2 <- function(){

  require(datasets)
  
  #Definition of important dates
  dates <- factor(c("01/02/2007","02/02/2007"));
  dates <- as.Date(dates,format="%d/%m/%Y");  
  
  # Read data
  data1 <- read.table("household_power_consumption.txt", header = T,sep=";",na.strings="?", colClasses = c(rep("character", 2),"numeric",rep("NULL", 6)));
  data1$newDate <- as.Date(data1$Date,format="%d/%m/%Y");
  
  #Select the dates 
  data2 <- subset(data1, newDate >= dates[1] & newDate <= dates[2]);
  
  #Definition of the x-axis
  data2$DateTime <- paste(data2$Date,data2$Time,sep=" ");
  x <- strptime(data2$DateTime,format="%d/%m/%Y %H:%M:%S");

  #Plot the figure
  png(filename="plot2.png",width = 480, height = 480, units = "px");
  Sys.setlocale("LC_TIME", "C")
  plot(x,data2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="");
  dev.off();
}
