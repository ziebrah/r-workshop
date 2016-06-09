

# make a scatterplot of concentration vs uptake for CO2
ggplot(data = CO2) +
  geom_point(aes(x = conc, y = uptake))

# color by plant
ggplot(data = CO2) +
  geom_point(aes(x = conc, y = uptake, color = Plant))

# connect points with lines
ggplot(data = CO2, aes(x = conc, y = uptake, color = Plant)) +
  geom_point() +
  geom_line()

# ??
ggplot(data = CO2, aes(x = conc, y = uptake, color = Plant)) +
  geom_point() +
  geom_line(aes(linetype = Type))