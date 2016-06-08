
# filling a list

microbenchmark(
  {total_population1 <- c()
  for (i in 1:nrow(state.x77)) {
    total_population1 <- c(total_population1, state.x77[i,1])
  }}
)
# 60 microseconds

microbenchmark({
  total_population2 <- c()
  for (i in 1:nrow(state.x77)) {
    total_population2 <- append(total_population2, state.x77[i,1])
  }}
)
# 100 microseconds

microbenchmark({
  total_population3 <- rep(NA, 50)
  for (i in 1:nrow(state.x77)) {
    total_population3[i] <- state.x77[i,1]
  }}
)
# 90 microseconds


# ifelse
set.seed(32)

x <- runif(1e6, -1, 1)

microbenchmark({
  posneg1 <- ifelse(x > 0, "Positive", "Negative")
})
# 250 milliseconds

microbenchmark({
  posneg2 <- rep(NA, length(x))
  posneg2[x > 0] <- "Positive"
  posneg2[x < 0] <- "Negative"
})
# 30 milliseconds

microbenchmark({
  posneg3 <- rep(NA, length(x))
  for (i in 1:length(x)) {
    if (x[i] > 0) posneg2[i] <- "Positive"
    else posneg3 <- "Negative"
  }
})
# does not run

# while loop test
index <- 0
while (index < 8) {
  index <- index + 1
  if (index %% 2 == 0) next
  print(index)
}


# column mean test
set.seed(157)
m <- matrix(c(rnorm(30, 0), rnorm(30, 2),
              rnorm(30, 5)), nrow = 30, ncol = 3)

microbenchmark({
  method1 <- rep(NA, ncol(m))
  method1 <- apply(m, 2, mean)
})
# 30 microseconds

microbenchmark({
  method2 <- rep(NA, ncol(m))
  method2 <- colMeans(m)
})
# 5 microseconds

microbenchmark({
  method3 <- rep(NA, ncol(m))
  for (i in 1:ncol(m)) {
    method3[i] = mean(m[,i])
  }
})
# 16 microseconds

microbenchmark({
  method4 <- rep(NA, ncol(m))
  for (i in 1:ncol(m)) {
    colsum <- 0
    for (j in 1:nrow(m)) {
      colsum <- colsum + m[j,i]
    }
    method4[i] = colsum / ncol(m)
  }
})
# 40 microseconds


# function definition
sum_of_squares <- function(a, b) {
  a^2 + b^2
}
sum_of_squares(3, 4)

