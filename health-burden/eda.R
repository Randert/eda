# Exploratory data analysis (see readme for more detail)
# Feel free to follow these steps, or complete your own EDA

# Set up (install packages if you don't have them)
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(vioinplot)
setwd('~/Documents/info-370/eda/health-burden/')
risk.data <- read.csv('./data/prepped/risk-data.csv', stringsAsFactors = FALSE) 

######################
### Data Structure ###
######################

## Using a variety of functions, investigate the structure of your data, such as:

# Dimensions, column names, structure, summaries, etc.
#number of rows
nrow(risk.data)
#number of columns
ncol(risk.data)
#shows column names
colnames(risk.data)
#prints out column names with data type
str(risk.data)

# Replacing missing values...?
#Sets NA equal to zero
risk.data[is.na(risk.data)] <- 0

###########################
### Univariate Analysis ###
###########################

## Using a variety of approaches, investigate the structure each (risk column) individually


# Summarize data
summary(risk.data)

 
# Create histograms, violin plots, boxplots
hist(risk.data$pop)
boxplot(risk.data$pop)

hist(risk.data$alcohol.use)
boxplot(risk.data$alcohol.use)

hist(risk.data$drug.use)
boxplot(risk.data$drug.use)

hist(risk.data$high.meat)
boxplot(risk.data$high.meat)

hist(risk.data$low.exercise)
boxplot(risk.data$low.exercise)

hist(risk.data$smoking)
boxplot(risk.data$smoking)

####################################
### Univariate Analysis (by age) ###
####################################

# Investiage how each risk-variable varies by **age group**

grouped.data <- function(risk.data) {
  c(min = min(risk.data), max = max(risk.data), 
    mean = mean(risk.data), median = median(risk.data), 
    std = sd(risk.data))
}

tapply(risk.data$smoking, risk.data$age, grouped.data)
tapply(risk.data$pop, risk.data$age, grouped.data)
tapply(risk.data$high.meat, risk.data$age, grouped.data)



# Create histograms, violin plots, boxplots. Calculate values as needed. 



####################################
### Univariate Analysis (by sex) ###
####################################

# Investiage how each risk-variable varies by **sex**

# Compare male to female values -- requires reshaping (and dropping population)!


########################################
### Univariate Analysis (by country) ###
########################################

## Investiage how each risk-variable varies by **country**

# Aggregate by country

# Create a choropleth map (see https://plot.ly/r/choropleth-maps/)

###########################
### Bivariate Analysis ####
###########################

# Compare risks-variables to one another (visually)
