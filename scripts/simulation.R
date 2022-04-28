
# simulation

raw_data %>% 
  group_by(room_type, neighbourhood_group_cleansed) %>% 
  summarize(sum=n())

p1<-raw_data %>% 
  group_by(room_type, neighbourhood_group_cleansed) %>% 
  summarize(sum=n()) %>% 
  ggplot(aes(x = neighbourhood_group_cleansed, y = sum, group = room_type, fill = room_type)) +
  geom_bar(stat = "identity") + guides(fill = guide_legend(title = "Room Type"),
                                       colour = guide_legend(title = "Borough"))


raw_data %>% 
  group_by(room_type, neighbourhood_group_cleansed) %>% 
  summarize(mean_price = mean(price))

p2<-raw_data %>% 
  group_by(room_type, neighbourhood_group_cleansed) %>% 
  summarize(mean_price = mean(price)) %>% 
  ggplot(aes(x = room_type, y = mean_price, group = neighbourhood_group_cleansed, fill = neighbourhood_group_cleansed)) +
  geom_bar(stat = "identity") + guides(fill = guide_legend(title = "Borough"),
                                       colour = guide_legend(title = "Borough"))

par(mfrow = c(2, 3))
b2 <- boxplot(raw_data$review_scores_accuracy,main = "Accuracy Score",ylab = "Score",col = "orange")
b3 <- boxplot(raw_data$review_scores_cleanliness,main = "Cleanliness Score",ylab = "Score",col = "orange")
b4 <- boxplot(raw_data$review_scores_checkin,main = "Check-in Service Score",ylab = "Score",col = "orange")
b5 <- boxplot(raw_data$review_scores_communication,main = "Communication Score",ylab = "Score",col = "orange")
b6 <- boxplot(raw_data$review_scores_location,main = "Location Score",ylab = "Score",col = "orange")
b7 <- boxplot(raw_data$review_scores_value,main = "Value Score",ylab = "Score",col = "orange")
