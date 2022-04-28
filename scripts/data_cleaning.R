#### Preamble ####
# Purpose: Clean the survey data downloaded from [...UPDATE ME!!!!!]
# Author: Rohan Alexander [CHANGE THIS TO YOUR NAME!!!!]
# Data: 3 January 2021
# Contact: rohan.alexander@utoronto.ca [PROBABLY CHANGE THIS ALSO!!!!]
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
library(dplyr)
library(ggplot2)
# Read in the raw data. 

listings_details <- readr::read_csv("~/Downloads/final/inputs/data/listings_details.csv"
)
# Just keep some variables that may be of interest (change 
# this depending on your interests)
names(listings_details)

listings_price <- readr::read_csv("~/Downloads/final/inputs/data/listings.csv"
)
names(listings_price)


listings_details <- select (listings_details,id,name,neighbourhood_group_cleansed,neighbourhood_cleansed,property_type,room_type,
                    number_of_reviews,review_scores_rating,review_scores_accuracy,review_scores_cleanliness,review_scores_checkin,
                    review_scores_communication,review_scores_location,review_scores_value,bedrooms,beds)

listings_price <- select (listings_price,id,price)


raw_data <- merge(listings_details,listings_price,by="id")

raw_data <- na.omit(raw_data)

raw_data <- raw_data |> filter(price > 0)


Q <- quantile(raw_data$price, probs=c(.25, .75), na.rm = FALSE)
iqr <- IQR(raw_data$price)
up <-  Q[2]+1.5*iqr
low<- Q[1]-1.5*iqr 
up
low

raw_data <- raw_data |> filter(price<=350)
raw_data

write.csv(raw_data,"~/Downloads/final/inputs/data/raw_data.csv", row.names = FALSE)





         