corr <- function(directory, threshold = 0) {
        files <- list.files(directory, full.names = TRUE) #creates a list of files
        df <- data.frame()      #creates an empty data frame
        cdf <- complete(directory)
        cdf <- cdf[cdf$nobs >= threshold, ]
        cor_vect <- numeric(0) ## create empty vector
        for (id in cdf$id) {
                #loops through the files, cbinding the correlations together
                df <- read.csv(files[id])
                cor_id <- cor(df[2], df[3], use = "pairwise.complete.obs")
                cor_vect <- cbind(cor_vect, cor_id)
        }
        output <- as.vector(cor_vect)
        output
}