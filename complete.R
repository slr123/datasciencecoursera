complete <- function(directory, id = 1:332) {
     files <- list.files(directory, full.names = TRUE) #creates a list of files
     df <- data.frame()      #creates an empty data frame
     for (i in id) {
         #loops through the files, rbinding the complete cases together
                 df <- rbind(df, sum(complete.cases(read.csv(files[i]))))
             }
     output <- data.frame(id, df)
     names(output) <- c("id", "nobs")
     output
}