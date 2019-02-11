#Find the number of rows before date 2007-02-01
a=grep("31/1/2007",readLines("household_power_consumption.txt"))
skipRow=a[length(a)]

#Find the the line number of the row at the last day of 2007-02-02.
b=grep("3/2/2007",readLines("household_power_consumption.txt"))
lastRow=b[1]-1;

#calculate the number of rows for date 2007-02-01, and 2007-02-02
numberOfRow=lastRow-skipRow

#Read data for 2007-02-01, and 2007-02-02, save in a dataframe called "data"
data=read.table("household_power_consumption.txt",header=FALSE, sep=";", skip=skipRow, nrows=numberOfRow)

#Read the header
header=read.table("household_power_consumption.txt",header=TRUE, sep=";",nrows=1)

#Change the header of the dataframe called "data"
names(data)=names(header)

#plot the figure
png("plot1.png")    
hist(data$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()

