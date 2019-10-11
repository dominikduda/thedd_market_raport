normalizedXts <- function(pathToFile) {
  table <- read.csv(
    file = pathToFile,
    sep = ",",
    header = TRUE
  )
  colnames(table) <- make.names(colnames(table))
  table <- transform(
    table[, -1],
    Local.time = as.POSIXct(table$Local.time, format = "%d.%m.%Y %H:%M:%S.%OS")
  )
  table <- table[c("Open", "High", "Low", "Close", "Local.time")]
  timeSeries <- as.xts(
    table,
    order.by = table$Local.time,
    format = "%d.%m.%Y %H:%M:%S.%OS %Z"
  )
  timeSeries <- timeSeries[, colnames(timeSeries) != "Local.time"]
  return(timeSeries)
}

generateRaport <- function(pathToFile) {
  timeSeries <- normalizedXts(pathToFile)
  browser()
  # figure out why its not working
  xxx <- to.daily(timeSeries, name = NULL, OHLC = TRUE)
}
