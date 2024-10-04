## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----vign17,warning = FALSE, message = FALSE, eval = F------------------------
#  # install.packages("devtools")
#  devtools::install_github("manueleleonelli/extrememix")

## ----vign16, message = F------------------------------------------------------
library(extrememix)
library(ggplot2)

## ----vign15, out.width="50%", fig.align = "center"----------------------------
data("rainfall")
ggplot(data = data.frame(rainfall), aes(x=rainfall)) +
  geom_histogram(binwidth = 2*length(rainfall)^(-1/3)*IQR(rainfall), colour="black", fill="white") + theme_bw()

## ----vign14,echo = F----------------------------------------------------------
data("rainfall_ggpd")

## ----vign13, eval = F---------------------------------------------------------
#  rainfall_ggpd <- fggpd(rainfall, it = 50000, burn = 10000, thin = 40)
#  rainfall_ggpd

## ----vign12-------------------------------------------------------------------
summary(rainfall_ggpd)

## ----vign11,fig.align = "center", out.width = "50%"---------------------------
check_convergence(rainfall_ggpd)

## ----vign10,eval = F----------------------------------------------------------
#  start <- list(xi = 0.2, sigma = 5, u = quantile(rainfall,0.9),
#                mu = c(4,10), eta = c(1,4), w = c(0.5,0.5))
#  var <- list(xi = 0.001, sigma = 1, u = 2, mu = c(0.1,0.1), w = 0.1)
#  prior <- list(u = c(22,5), mu_mu = c(4,16), mu_eta = c(0.001,0.001),
#                eta_mu = c(1,4), eta_eta = c(0.001,0.001))
#  rainfall_mgpd <- fmgpd(rainfall, k =2, it = 50000, burn = 10000, thin = 40,
#                  start = start, var = var, prior = prior)

## ----vign9, echo = F----------------------------------------------------------
data("rainfall_mgpd")

## ----vign8--------------------------------------------------------------------
rainfall_mgpd
summary(rainfall_mgpd)

## ----vign7, out.width = "50%", fig.align = "center"---------------------------
check_convergence(rainfall_mgpd)

## ----vign6--------------------------------------------------------------------
rbind(c(BIC(rainfall_ggpd),BIC(rainfall_mgpd)),c(DIC(rainfall_ggpd),DIC(rainfall_mgpd)),c(WAIC(rainfall_ggpd),WAIC(rainfall_mgpd)))

## ----vign5, fig.align = "center", out.width = "50%"---------------------------
plot(rainfall_ggpd)

## ----vign4, out.width = "50%",fig.align = "center"----------------------------
pred(rainfall_ggpd)

## ----vign3, out.width = "50%",fig.align = "center"----------------------------
return_level(rainfall_ggpd)
plot(return_level(rainfall_ggpd))

## ----vign2, out.width = "50%",fig.align = "center"----------------------------
ES(rainfall_ggpd, values = 1)
plot(ES(rainfall_ggpd, values = 1))

## ----vign1, out.width= "50%",fig.align = "center"-----------------------------
upper_bound(rainfall_ggpd)
plot(upper_bound(rainfall_ggpd), xlim = c(20,400))

