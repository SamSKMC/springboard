data = read.csv("/Users/samkhan/dev/projects/r/springboard/datawrangling/exercise_2/titanic_original.csv")

data$embarked[data$embarked==""] <- 'S'

data$age <- ifelse(is.na(data$age), mean(data$age, na.rm = TRUE), data$age)

# Really don't know what to say other than there is the MICE package in R for imputing values

data$boat[data$boat==""] <- NA

# I think it might be useful to fill missing cabin numbers with a value if only for the reason that the absence of data can be informative

# A missing value here means possibly that the unaccounted for passengers were steerage / third class travellers. Anecdotally I would think that 
# if any passenger accommodations were unaccounted for it would not be first / second class travellers

data$has_cabin_number <- ifelse(data$cabin == "", 1, 0)

write.table(data, "/Users/samkhan/dev/projects/r/springboard/datawrangling/exercise_2/titanic_clean.csv", sep=",")


