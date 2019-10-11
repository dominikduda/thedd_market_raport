if (!"pacman" %in% installed.packages()) {
  install.packages("pacman")
}

require(pacman)

p_load(
  magrittr,
  xts
)

p_load_gh(
  "dominikduda/candlePlotter"
)
