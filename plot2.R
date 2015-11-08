# As only data from the dates 2007-02-01 to 2007-02-02 are going to be used, 
# the data from the begining till the last date are read, so that  an excesive 
# use of system memory is avoided

data <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors = F,dec=".",na.strings="?",nrow=69517,col.names =c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Now a subset of the first read data are set to be used hereinafter
subset.data <- data[min(which(data$Date=="1/2/2007")):max(which(data$Date=="2/2/2007")),]

# The first two columns are pasted to be converted to a date/time class
subset.data$Time <- paste(subset.data$Date,subset.data$Time,sep=" ")

subset.data$Time <- strptime(subset.data$Time, format="%d/%m/%Y %H:%M:%S")



# Open png device. Create 'plot2.png', an empty file in the working directory
png(file ="plot2.png",units = "px",width = 480, height = 480,bg = "transparent") 

# Create plot and send to a file
plot(subset.data$Time,subset.data$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(subset.data$Time,subset.data$Global_active_power)

# Close the 'png' file device
dev.off() 

# Now you can view the file 'plot2.png' on your computer.




#The next code must be executed to change the language of the X-label (ju, vi, sáb -> Thu, Fri, Sat)
## preserve the existing locale
#my_locale <- Sys.getlocale("LC_ALL")

## change locale to English
#Sys.setlocale("LC_ALL", "English")

## restore locale
#Sys.setlocale("LC_ALL", my_locale)vv