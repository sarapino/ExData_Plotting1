plot1 <- function(){

  require(datasets)
  
  #Definition of important dates
  dates <- factor(c("01/02/2007","02/02/2007"));
  dates <- as.Date(dates,format="%d/%m/%Y");
  
  # Read data
  data1 <- read.table("household_power_consumption.txt", header = T,sep=";",na.strings="?",colClasses = c("character","NULL","numeric",rep("NULL",6)));
  data1$newDate <- as.Date(data1$Date,format="%d/%m/%Y");
  
  #Select the dates 
  data2 <- subset(data1, newDate >= dates[1] & newDate <= dates[2]);
  
  # Plot the histogram
  png(filename="plot1.png",width = 480, height = 480, units = "px");
  hist(data2$Global_active_power,col ="red",xlab="Global Active Power (kilowatts)",main="Global Active Power");
  dev.off();

}