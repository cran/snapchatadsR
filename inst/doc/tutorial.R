## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

load("my_snapchatads_data.RData")

## ----setup--------------------------------------------------------------------
library(snapchatadsR)

library(dplyr)
library(ggplot2)

## ---- eval = FALSE------------------------------------------------------------
#  
#  my_snapchatads_data <-
#    fetch_snapchatads(api_key = "your api key",
#             date_from = Sys.Date()-100,
#             date_to = Sys.Date(),
#             fields = c("campaign", "clicks",
#                        "spend", "impressions", "date"))

## -----------------------------------------------------------------------------
str(my_snapchatads_data)

## -----------------------------------------------------------------------------
ggplot(my_snapchatads_data, aes(y = clicks, fill = campaign)) + geom_boxplot()

## -----------------------------------------------------------------------------
lmod <- glm(clicks ~ campaign, data = my_snapchatads_data, family = "poisson")
summary(lmod)

