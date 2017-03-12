library(shiny)
library(DT)
library(digest)

# Define the fields we want to save from the form
fields <- c("inptNm", "inptCnfrmd", "inptDt", "inptNts")

# Define the storage directory
outputDir <- "responses"

# Save data function
saveData <- function(data) {
  data <- t(data)
  # Create a unique file name
  fileName <- sprintf("%s_%s.csv", as.integer(Sys.time()), digest(data))
  # Write the file to the local system
  write.csv(x = data, file = file.path(outputDir, fileName), row.names = FALSE, quote = TRUE)
}

# Read data function
loadData <- function() {
  # Read all the files into a list
  files <- list.files(outputDir, full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE) 
  # Concatenate all data together into one data.frame
  data <- do.call(rbind, data)
  data
}