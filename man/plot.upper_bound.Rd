% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R
\name{plot.upper_bound}
\alias{plot.upper_bound}
\title{Plot Upper Bounds}
\usage{
\method{plot}{upper_bound}(x, xlim = c(min(x$bound), max(x$bound)), ...)
}
\arguments{
\item{x}{an object of class \code{upper_bound}.}

\item{xlim}{limits of the x-axis.}

\item{...}{additional parameters for compatibility.}
}
\value{
A histogram for the posterior estimated upper bound of the distribution.
}
\description{
Plotting method for the posterior distribution of the upper bound. No plot is reported if the posterior sample of xi has only positive values (unbounded distribution).
}
\examples{
plot(upper_bound(rainfall_ggpd))

}
