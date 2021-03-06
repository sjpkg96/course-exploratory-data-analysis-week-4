library(ggplot2)
library(dplyr)
##Set working directory
setwd("C:/Users/Dell/Desktop/AS2017373/1/peerassinment/peer ass")
## Step 1: read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Step 2: obtain the subsets to plot
baltimore <- subset (NEI, fips == "24510")
total.PM25yr <- tapply(baltimore$Emissions, baltimore$year, sum)

## Step 3: plot prepare to plot to png
png("plot2.png")
plot(names(total.PM25yr), total.PM25yr, type = "l", xlab="Year", ylab= expression("Total" ~ PM[2.5] ~ "Emissions (tons)"), main=expression("Total for Baltimore City" ~ PM[2.5] ~ "Emissions by Year"), col = "blue")
dev.off()     

## Step 4: plot to markdown file
plot(names(total.PM25yr), total.PM25yr, type = "l", xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions (tons)"), main=expression("Total for Baltimore City" ~ PM[2.5] ~ "Emissions by Year"), col="blue")
