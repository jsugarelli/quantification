\name{ce}
\alias{ce}
\title{
Conditional Expectations method
}
\description{
\code{ce} implements the Conditional Expectations approach for the quantification of qualitative survey data. The method calculates expectations on a distribution of past realizations of the variable of interest (variable \code{y}), conditional on the expectation of either an increase or a decrese in  \code{y}. These conditional expectations are then weighted with the share of survey respondents expecting variable \code{y} to rise or fall, respectively. For details see
}
\usage{
ce(y.series, survey.up, survey.same, survey.down, forecast.horizon, first.period = 11, 
		last.period = (length(survey.up) - forecast.horizon), exp.horizon.type = "moving", 
		mov.horizon.length = 10, fix.horizon.start = 1, fix.horizon.end = 10, 
		distrib.param = "mean", suppress.warnings = FALSE)
}

\arguments{
  \item{y.series}{
a numerical vector containing the variable whose change is the subject of the qualitative survey question. If, for example the survey asks participants to assess whether inflation will increase, decrease or stay the same, \code{y.series} would be the series of inflation data.
}
  \item{survey.up}{
a numerical vector containing the number or the share of survey respondents expecting the variable contained in \code{y.series} to increase. This vector needs to be of the same length as \code{y.series}.
}
  \item{survey.same}{
a numerical vector containing the number or the share of survey respondents expecting the variable contained in \code{y.series} to stay the same. This vector needs to be of the same length as \code{y.series}.
}
  \item{survey.down}{
a numerical vector containing the number or the share of survey respondents expecting the variable contained in \code{y.series} to decrease. This vector needs to be of the same length as \code{y.series}.
}
  \item{forecast.horizon}{
a numeric value defining the number of periods the survey question looks in to the future. If the data in \code{y.series} is monthly data and the survey question asks respondents to assess the development of the variable over the next six months then \code{forecast.horizon=6}.
}
  \item{first.period}{
an optional numeric value indexing the first period for which survey data in \code{survey.up}, \code{survey.same} and \code{survey.down} shall be used for quantification; default value is \code{11}.
}
  \item{last.period}{
an optional numeric value indexing the last period for which survey data in \code{survey.up}, \code{survey.same} and \code{survey.down} shall be used for quantification; default value is \code{length(survey.up) - forecast.horizon}.
}
  \item{exp.horizon.type}{
an optional character vector indicating the type of experience horizon to be used. The experience horizon is the time period over which the distribution of variable \code{y} serves as basis for quantification. Possible values are:
\itemize{
\item{"\code{fix}"}: the distribution of variable \code{y} over a fixed period of time is used for calculating the conditional expectations
\item{"\code{moving}"}: the time period over which the distribution of variable \code{y} is used for quantification moves with the time the respective survey results were generated, i.e. the experience horizon reaches back a certain number of periods from the time of the survey.
}
Default value is "\code{moving}".
}
  \item{mov.horizon.length}{
an optional numeric value indicating the length of the (moving) forecast horizon. Is only considered when \code{exp.horizon.type}="\code{moving}". Default value is \code{10}.
}
  \item{fix.horizon.start}{
an optional numeric value indicating the first period of the (fixed) forecast horizon. Is only considered when \code{exp.horizon.type}="\code{fix}". Default value is \code{1}.
}
  \item{fix.horizon.end}{
an optional numeric value indicating the last period of the (fixed) forecast horizon. Is only considered when \code{exp.horizon.type}="\code{fix}". Default value is \code{10}.
}
  \item{distrib.param}{
an optional character vector indicating the distribution parameter that shall be used for calculating conditional expectations based on the distribution of variable \code{y} over the expectation horizon. Can be either "\code{mean}" or "\code{median}". Default value is "\code{mean}".
}
\item{suppress.warnings}{
a logical value indicating if runtime warnings shall be displayed (\code{FALSE}) or not (\code{TRUE}). Default value is \code{FALSE}.
}
}
\details{
The survey result vectors \code{survey.up}, \code{survey.down} and \code{survey.same} as well as the variable \code{y.series} must be of the same length and must cover the forecasted horizon (i.e. \code{last.period} + \code{forecast.horizon} \eqn{\le} \code{length(survey.up)}). 

Data in \code{survey.up}, \code{survey.down} and \code{survey.same} outside the survey period interval \code{[first.period, last.period]} are ignored. Similiarly, \code{y.series} data with a period index greater than \code{last.period} is ignored.

\code{survey.up}, \code{survey.down} and \code{survey.same} need not sum up to \code{100\%} or \code{1} (which may happen, for example, if the survey has a 'Don't know' answer option).
}
\value{
\code{ce} returns a list containing the quantified survey data and some meta information. The list has the following elements:
\itemize{
\item \code{y.e}: a numeric vector containing the quantified expectations of the variable \code{y}.
\item \code{nob}: a numeric value showing the number of periods for which expectations have been quantified.
\item \code{mae}: a numeric value showing the mean absolute error (MAE) of expectations.
\item \code{rmse}: a numeric value showing the root mean squared error (RMSE) of expectations.
}
}
\references{
Zuckarelli, J. (2015): A new method for quantification of qualitative expectations, \emph{Economics and Business Letters} \bold{3}(5), Special Issue \emph{Energy demand forecasting}, 123-128.
}
\section{Please cite as:}{
Zuckarelli, Joachim (2014). \emph{Quantification of qualitative survey data in R}.\cr
R package version 1.0.0. http://CRAN.R-project.org/package=quantification
}
\author{
Joachim Zuckarelli, \email{joachim@zuckarelli.de}
}
\seealso{
\code{\link{quantification-package}}, \code{\link{cp}}, \code{\link{bal}}, \code{\link{ra}}
}
\examples{
## Data preparation: generate a sample dataset with inflation and survey data
inflation<-c(1.5, 1.5, 1.5, 1.1, 0.9, 1.3, 1.3, 1.2, 1.7, 1.7, 1.5, 2, 1.4, 1.9, 1.9, 2.3, 2.8, 2.5, 2.1, 2.1, 1.9, 1.9, 1.5, 1.6, 2.1, 1.8, 2.1, 1.5, 1.3, 1.1, 1.1, 1.3, 1.3, 1.3, 1.1, 1.1, 1, 1.2, 1.1, 0.9)
answer.up<-c(72.7, 69.7, 60.9, 53.7, 54.9, 54.8, 56.1, 51.7, 62.2, 54.2, 39.8, 18.6, 5.4, 8.2, 8.6, 8.5, 16, 18.9, 7.7, 6.5, 6.4, 7, 7.4, 6.8, 9.5, 17.1, 13.1, 21.5, 22.7, 26.9, 32.4, 20.2, 20.4, 15.8, 11.4, 7.9, 11.3, 10, 11.3, 9.7)
answer.same<-c(24.1, 22.8, 24.3, 26.2, 31.1, 35.4, 33, 35.5, 27.4, 24.8, 32.1, 44.8, 41.8, 37.9, 33.2, 30.9, 29.9, 22.1, 17.2, 15.5, 21.8, 25.2, 23.2, 24.2, 32.9, 31.2, 42.2, 50.5, 52.5, 56.3, 53.8, 62.8, 65.6, 63, 60.3, 61.1, 57.8, 63, 61.4, 61.9)
answer.down<-c(3.2, 7.5, 14.8, 20.1, 14, 9.8, 10.9, 12.8, 10.4, 21, 28.1, 36.6, 52.8, 53.9, 58.2, 60.6, 54.1, 59, 75.1, 78, 71.8, 67.8, 69.4, 69, 57.6, 51.7, 44.7, 28, 24.8, 16.8, 13.8, 17, 14, 21.2, 28.3, 31, 30.9, 27, 27.3, 28.4)

## Call ce for quantification
quant.ce<-ce(inflation, answer.up, answer.same, answer.down, first.period=30, last.period=36, forecast.horizon=4, exp.horizon.type = "fix", fix.horizon.start = 1, fix.horizon.end = 29)
}