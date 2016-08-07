## Read CSV file
power_data<-read.csv("./CourseProject1_EDA/household_power_consumption.txt", header=T,sep = ';', na.strings = "?")
##change format of the date
power_data$Date<-as.Date(power_data$Date,format="%d/%m/%Y")
## Subset the data and convert dates
date_subset<-subset(power_data, subset =(Date >="2007-02-01" & Date <= "2007-02-02"))
rm(power_data)
datetime<-paste(as.Date(date_subset$Date),date_subset$Time)
date_subset$Datetime<-as.POSIXct(datetime)
##Plot 2 and save as png file with hight 480 and width 480
plot(date_subset$Datetime,date_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()

