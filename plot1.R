library(ggplot2)
library(dplyr)
getwd()
if(!file.exists("Data for Peer Assessment")) {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",temp)
  unzip(temp)
  unlink(temp)
}
##Set working directory
setwd("C:/Users/Dell/Desktop/AS2017373/1/peerassinment/peer ass")
## Step 1: read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI) # Observe what is inside the dataset
length(NEI$Emissions)

length(NEI$year)
tot.PM25yr <- tapply(NEI$Emissions, NEI$year, sum)

###Step 2: prepare to plot to png
png("plot1.png")
plot(names(tot.PM25yr), tot.PM25yr, type="l", xlab = "Year", ylab = expression
     ("Total" ~ PM[2.5] ~"Emissions (tons)"), main = expression("Total US" ~ 
                                                                  PM[2.5] ~ "Emissions by Year"), col="Purple")
dev.off()
###Step 3: prepare to plot to the markdown file
plot(names(tot.PM25yr), tot.PM25yr, type="l", xlab = "Year", ylab = expression ("Total" ~ PM[2.5] ~"Emissions (tons)"), main = expression("Total US" ~ PM[2.5] ~ "Emissions by Year"), col="Purple")
