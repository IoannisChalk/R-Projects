# Install and load necessary packages
if(!require(palmerpenguins)) install.packages("palmerpenguins")
if(!require(dplyr)) install.packages("dplyr")
if(!require(ggplot2)) install.packages("ggplot2")
if(!require(tidyr)) install.packages("tidyr")
if(!require(skimr)) install.packages("skimr")

library(palmerpenguins)
library(dplyr)
library(ggplot2)
library(tidyr)
library(skimr)

# Load the dataset
data("penguins")

# 1. View the structure of the dataset
str(penguins)

# 2. Clean the data: Remove rows with missing values
penguins_clean <- penguins %>% drop_na()

# 3. Summarize the dataset: Get summary statistics
summary(penguins_clean)

# 4. Filter the data: Filter for Adelie species
adelie_penguins <- penguins_clean %>% filter(species == "Adelie")

# 5. Transform the data: Create a new column combining island and species
penguins_clean <- penguins_clean %>%
  mutate(island_species = paste(island, species, sep = "_"))

# 6. Visualize the data: Scatter plot of bill length vs. flipper length
ggplot(penguins_clean, aes(x = bill_length_mm, y = flipper_length_mm)) +
  geom_point(aes(color = species)) +
  ggtitle("Bill Length vs Flipper Length") +
  xlab("Bill Length (mm)") +
  ylab("Flipper Length (mm)")

# 7. Create a bar plot to visualize species distribution by island
ggplot(penguins_clean, aes(x = island, fill = species)) +
  geom_bar(position = "dodge") +
  ggtitle("Species Distribution by Island") +
  xlab("Island") +
  ylab("Count")

# 8. Create a boxplot to examine the bill depth by species
ggplot(penguins_clean, aes(x = species, y = bill_depth_mm)) +
  geom_boxplot(aes(color = species)) +
  ggtitle("Bill Depth by Species") +
  xlab("Species") +
  ylab("Bill Depth (mm)")

# 9. Save the final cleaned dataset
write.csv(penguins_clean, "penguins_clean.csv")

# End of the project
