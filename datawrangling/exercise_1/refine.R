data = read.csv("/Users/samkhan/dev/projects/r/springboard/datawrangling/exercise_1/refine_original.csv")

data$company <- ifelse(substring(data$company, 1, 1) == "P", "philips", ifelse(substring(data$company,1,1) == "p", "philips", ifelse(substring(data$company,1,1) == "A", "akzo", ifelse(substring(data$company,1,1) == "a", "akzo", ifelse(substring(data$company,1,1) == "V", "van houten", ifelse(substring(data$company,1,1) == "v", "van houten", ifelse(substring(data$company,1,1) == "U", "unilever", ifelse(substring(data$company,1,1) == "u", "unilever", ifelse(substring(data$company,1,1) == "f", "philips", data$company )))))))))

data <- transform(data, product_code = str_split_fixed(data$Product.code...number, "-", 2)[,1], product_number = str_split_fixed(data$Product.code...number, "-", 2)[,2])[-2]

data$product_category <- ifelse(data$product_code == "p", "Smartphone", ifelse(data$product_code == "v", "TV", ifelse(data$product_code == "x", "Laptop", ifelse(data$product_code == "q", "Tablet", data$product_code))))

data$full_address <- paste(data$address, data$city, data$country, sep=", ")

data$company_akzo       <- ifelse(data$company == "akzo", 1, 0)
data$company_vanhouten  <- ifelse(data$company == "van houten", 1, 0)
data$company_unilever   <- ifelse(data$company == "unilever", 1, 0)
data$company_philips    <- ifelse(data$company == "philips", 1, 0)

data$product_smartphone <- ifelse(data$product_category == "Smartphone", 1, 0)
data$product_tv         <- ifelse(data$product_category == "TV", 1, 0)
data$product_laptop     <- ifelse(data$product_category == "Laptop", 1, 0)
data$product_tablet     <- ifelse(data$product_category == "Tablet", 1, 0)

write.table(data, "/Users/samkhan/dev/projects/r/springboard/datawrangling/exercise_1/refine_clean.csv", sep=",")
