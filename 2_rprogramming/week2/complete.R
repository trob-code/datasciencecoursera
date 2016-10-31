complete <- function(directory, id = 1:332)
{
    files <- file.path(directory, paste0(sprintf("%03d", id), ".csv"))
    tables <- lapply(files, read.csv)
    
    data.frame(id, nobs = sapply(tables, function (x) {nrow(x[complete.cases(x),])}))
}