% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarize.R
\name{summarize}
\alias{summarize}
\title{Summarize data in a data frame}
\usage{

}
\description{
Summarizes a data frame by reducing it down to just a
few rows using aggregate functions.
}
\details{
First argument: a data frame, which may be grouped (see \code{\link[=group_by]{group_by()}}]).

Next arguments: an aggregate function applied to a variable. Make sure
to give your aggregation a name.

\code{summarize(data, ...)}

\code{data \%>\% summarize(...)}
}
\examples{
# Summarize the mean and standard
# deviation of each variable:

tibble(
  x = c(6, 7, 3),
  y = c(5, 9, 0)
) \%>\%
  summarize(
    x_mean = mean(x), x_sd = sd(x),
    y_mean = mean(y), y_sd = sd(y)
  )

#> A tibble: 1 x 4
#> x_mean  x_sd y_mean  y_sd
    <dbl> <dbl>  <dbl> <dbl>
#>   5.33  2.08   4.67  4.51

-----------------------------------

# If the data frame has been grouped, summarize
# will return the same number of rows as there are
# groups.

tibble(
  x = c(0, 1, 1, 0, 1),
  y = c(2, 1, 2, 0, 0)
) \%>\%
  group_by(x) \%>\%
  summarize(
    y_mean = mean(y),
    y_sum = sum(y),
    total_obs = n()
  )

#> A tibble: 2 x 4
#>     x y_mean y_sum total_obs
   <dbl>  <dbl> <dbl>     <int>
#>     0      1     2         2
#>     1      1     3         3

-----------------------------------

library(gapminder)

gapminder \%>\%
  group_by(continent) \%>\%
  summarize(gdp_mean = mean(gdpPercap))

#> # A tibble: 5 x 2
#> continent   gdp_mean
     <fct>        <dbl>
#> 1 Africa       2194.
#> 2 Americas     7136.
#> 3 Asia         7902.
#> 4 Europe      14469.
#> 5 Oceania     18622.

}
\seealso{
Some aggregate functions: \code{\link[=mean]{mean()}}, \code{\link[=sd]{sd()}}, \code{\link[=median]{median()}}, \code{\link[=quantile]{quantile()}}, \code{\link[=n]{n()}}

Other dplyr verbs: \code{\link[=filter]{filter()}}, \code{\link[=group_by]{group_by()}}, \code{\link[=arrange]{arrange()}}, \code{\link[=mutate]{mutate()}}, \code{\link[=select]{select()}}
}
