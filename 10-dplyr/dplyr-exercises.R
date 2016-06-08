require(dplyr)

# filter practice -------------

# flights that left on st patrick's day
paddys_flights <- flights %>% filter(month == 3, day == 17)

# flights destined for ORD
ord_flights <- flights %>% filter(dest == "ORD")

# flights destined for ORD and operated by united airlines
ord_ua_flights <- ord_flights %>% filter(carrier == "UA")

# flights with flight distance more than 2000 miles or that were in the air
# more than 5 hours
long_flights <- ord_flights %>% filter(air_time > 300 | distance > 2000)


# more dplyr practice
speed <- flights %>%
  mutate(avg_speed = distance / (air_time/60)) %>%
  select(tailnum, avg_speed)

by_tailnum <- speed %>% group_by(tailnum)
avg_speed <- summarize(by_tailnum, count = n(),
                       avg_speed = mean(avg_speed, na.rm = TRUE)) %>%
  arrange(desc(avg_speed))

# aka
avg_speed <- flights %>%
  mutate(avg_speed = distance / (air_time/60)) %>%
  select(tailnum, avg_speed) %>%
  group_by(tailnum) %>%
  summarize(count = n(), avg_speed = mean(avg_speed, na.rm = TRUE)) %>%
  arrange(desc(avg_speed))

# create df containing carrier and avg departure delay
carrier_dep_delays <- flights %>%
  group_by(carrier) %>%
  summarize(avg_delay = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(avg_delay)

