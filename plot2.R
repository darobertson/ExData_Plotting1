## Read in the data, with headings

totaldata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")


## Convert Date column to data format

totaldata[,1]=as.Date(totaldata$Date,"%d/%m/%Y")


## Identify rows that correspond to the correct date range 

plotdata=subset(totaldata,totaldata$Date %in% as.Date(c("2007-02-01","2007-02-02")))



## Combine Date and Time columns to a single timestamp 

plotdata$DateTime <- as.POSIXct(paste(plotdata$Date, plotdata$Time), format="%Y-%m-%d %H:%M:%S")



## Convert metrics to numeric

plotdata[,3]=as.numeric(plotdata[,3])
plotdata[,4]=as.numeric(plotdata[,4])
plotdata[,5]=as.numeric(plotdata[,5])
plotdata[,6]=as.numeric(plotdata[,6])
plotdata[,7]=as.numeric(plotdata[,7])
plotdata[,8]=as.numeric(plotdata[,8])
plotdata[,9]=as.numeric(plotdata[,9])


## Call png device and set pixels
png(file="plot2.png",width=480,height=480)


## Create the plot
plot(plotdata$DateTime, plotdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")


## Close the device (file)
dev.off()