

microbenchmark(
  {total_population1 <- c()
  for (i in 1:nrow(state.x77)) {
    total_population1 <- c(total_population1, state.x77[i,1])
  }}
)

microbenchmark({
  total_population2 <- c()
  for (i in 1:nrow(state.x77)) {
    total_population2 <- append(total_population2, state.x77[i,1])
  }}
)

microbenchmark({
  total_population3 <- rep(NA, 50)
  for (i in 1:nrow(state.x77)) {
    total_population3[i] <- state.x77[i,1]
  }}
)



set.seed(32)

x <- runif(1e6, -1, 1)

microbenchmark({
  posneg1 <- ifelse(x > 0, "Positive", "Negative")
})

microbenchmark({
  posneg2 <- rep(NA, length(x))
  posneg2[x > 0] <- "Positive"
  posneg2[x < 0] <- "Negative"
})

microbenchmark({
  posneg3 <- rep(NA, length(x))
  for (i in 1:length(x)) {
    if (x[i] > 0) posneg2[i] <- "Positive"
    else posneg3 <- "Negative"
  }
})

