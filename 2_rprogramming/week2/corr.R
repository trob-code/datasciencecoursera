corr <- function(directory, threshold = 0)
{
    obssize <- complete(directory)
    thresholdIds <- obssize[obssize$nobs > threshold, 1]
    
    if(length(thresholdIds) != 0)
    {
        files <- file.path(directory, paste0(sprintf("%03d", thresholdIds), ".csv"))
        tables <- lapply(files, read.csv)
        alldata <- do.call(rbind, tables)
        
        sapply(tables, function(x) {cor(x = x$"sulfate", y = x$"nitrate", use="complete")})
    }
    else
    {
        numeric(0)
    }
}

