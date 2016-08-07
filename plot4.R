## Read CSV file
power_data<-read.csv("./CourseProject1_EDA/household_power_consumption.txt", header=T,sep = ';', na.strings = "?")
##change format of the date
power_data$Date<-as.Date(power_data$Date,format="%d/%m/%Y")
## Subset the data and convert dates
date_subset<-subset(power_data, subset =(Date >="2007-02-01" & Date <= "2007-02-02"))
rm(power_data)
datetime<-paste(as.Date(date_subset$Date),date_subset$Time)
date_subset$Datetime<-as.POSIXct(datetime)
##Plot 3 and save as png file with hight 480 and width 480
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(date_subset$Datetime,date_subset$Global_active_power, type="l", xlab="",
      ylab="Global Active Power")
plot(date_subset$Datetime,date_subset$Voltage, type="l", xlab="DateTime",
     ylab="Voltage")
plot(date_subset$Datetime,date_subset$Sub_metering_1, type="l", xlab="",ylab="Energy Sub Metering")
lines(date_subset$Datetime,date_subset$Sub_metering_2, col="red")
lines(date_subset$Datetime,date_subset$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), lty=1,lwd=2,
       legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), bty="n", cex=.5)
plot(date_subset$Datetime,date_subset$Global_reactive_power, type="l", xlab="DateTime",
     ylab="Global_Reactive_Power")
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()