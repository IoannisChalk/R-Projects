# Install and load necessary packages
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("skimr")

library(ggplot2)
library(dplyr)
library(tidyr)
library(skimr)

# Load the dataset
data("diamonds")

# 1. View the structure of the dataset
str(diamonds)

# 2. Clean the data: Remove rows with missing values
diamonds_clean <- diamonds %>% drop_na()

# 3. Summarize the dataset: Get summary statistics
summary(diamonds_clean)

# 4. Filter the data: Filter for diamonds with price greater than 5000
diamonds_expensive <- diamonds_clean %>% filter(price > 5000)

# 5. Create a new column: Create a 'price_per_carat' column
diamonds_clean <- diamonds_clean %>%
  mutate(price_per_carat = price / carat)

# 6. Visualize the data: Scatter plot of carat vs. price
ggplot(diamonds_clean, aes(x = carat, y = price)) +
  geom_point(aes(color = cut)) +
  ggtitle("Carat vs Price") +
  xlab("Carat") +
  ylab("Price")

# 7. Create a bar plot to visualize the distribution of diamond cuts
ggplot(diamonds_clean, aes(x = cut, fill = cut)) +
  geom_bar() +
  ggtitle("Distribution of Diamond Cuts") +
  xlab("Cut") +
  ylab("Count")

# 8. Create a boxplot to examine the price distribution by cut
ggplot(diamonds_clean, aes(x = cut, y = price)) +
  geom_boxplot(aes(color = cut)) +
  ggtitle("Price Distribution by Cut") +
  xlab("Cut") +
  ylab("Price")

# 9. Visualize the relationship between carat, price, and cut using facets
ggplot(diamonds_clean, aes(x = carat, y = price)) +
  geom_point(aes(color = cut)) +
  facet_wrap(~ cut) +
  ggtitle("Carat vs Price by Cut") +
  xlab("Carat") +
  ylab("Price")

# 10. Save the final cleaned dataset
write.csv(diamonds_clean, "diamonds_clean.csv")

# End of the project
