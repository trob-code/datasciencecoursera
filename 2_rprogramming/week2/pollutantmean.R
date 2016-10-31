pollutantmean <- function(directory, pollutant, id = 1:332)
{
    files <- file.path(directory, paste0(sprintf("%03d", id), ".csv"))
    tables <- lapply(files, read.csv)
    alldata <- do.call(rbind, tables)
    
    mean(alldata[[pollutant]], na.rm = TRUE)
}