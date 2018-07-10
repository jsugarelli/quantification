\name{bal}
\alias{bal}

\title{
The balance approach
}
\description{
\code{bal} implements the balance approach for the quantification of qualitative survey data. A description of the method can be found in Batchelor (1986).
}
\usage{
bal(y.series, survey.up, survey.same, survey.down, forecast.horizon, 
	first.period = 1, last.period = (length(survey.up) - forecast.horizon),
	growth.limit = NA, suppress.warnings = FALSE)
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
an optional numeric value indexing the first period for which survey data in \code{survey.up}, \code{survey.same} and \code{survey.down} shall be used for quantification; default value is \code{1}.
}
  \item{last.period}{
an optional numeric value indexing the last period for which survey data in \code{survey.up}, \code{survey.same} and \code{survey.down} shall be used for quantification; default value is \code{length(survey.up) - forecast.horizon}.
}
	\item{growth.limit}{
serves to limit the effect of outliers when expectations are quantified under the assumption that survey respondents form expectations on the percentage change of \code{y}. \code{growth.limit} defines a limit for percentage change of \code{y}. When this limit is exceeded the growth rate is set automatically to the median growth of \code{y} over the period covered by the expectations. Default value is \code{NA}.
}
	\item{suppress.warnings}{
a logical value indicating if runtime warnings shall be displayed (\code{FALSE}) or not (\code{TRUE}). Default value is \code{FALSE}.
}
}
\details{
\code{bal} provides two alternative versions of quantified expectations, depending on the assumed expectation formation process of survey respondents. The basic common assumption of the balance method is that survey participants are asked to assess whether variable \code{y} will go up or down or stay the same. Survey respondents can now form expectations on either the absolute or the relative change of \code{y} which differ because the scaling factors (thetas) used to scale the difference between the shares of 'up' and the 'down' respondents are calculated differently in each case. The \code{bal} function calculates both versions.

The survey result vectors \code{survey.up}, \code{survey.down} and \code{survey.same} as well as the variable \code{y.series} must be of the same length and must cover the forecasted horizon (i.e. \code{last.period} + \code{forecast.horizon} \eqn{\le} \code{length(survey.up)}). 

Data in \code{survey.up}, \code{survey.down} and \code{survey.same} outside the survey period interval \code{[first.period, last.period]} are ignored. Similiarly, \code{y.series} data with a period index greater than \code{last.period} is ignored.

\code{survey.up}, \code{survey.down} and \code{survey.same} need not sum up to \code{100\%} or \code{1} (which may happen, for example, if the survey has a 'Don't know' answer option).
}
\value{
\itemize{
\item \code{y.e.mean.abs}: a numeric vector containing the quantified mean expectations of the variable \code{y}, assuming that survey respondents form expectations on the \emph{absolute} change in \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{y.e.mean.perc}: a numeric vector containing the quantified mean expectations of the variable \code{y}, assuming that survey respondents form expectations on the \emph{relative} change in \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{delta.y.e.mean.abs}: a numeric vector containing the quantified mean absolute change of the variable \code{y}, assuming that survey respondents form expectations on the \emph{absolute} change in \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{delta.y.e.mean.perc}: a numeric vector containing the quantified mean percentage change of the variable \code{y}, assuming that survey respondents form expectations on the \emph{relative} change in \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{delta.y.e.sd.abs}: a numeric vector containing the standard deviation of the absolute change expectation for variable \code{y} in the population. Assumes that survey respondents form expectations on the \emph{absolute} change in \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{delta.y.e.sd.perc}: a numeric vector containing the standard deviation of the absolute change expectation for variable \code{y} in the population. Assumes that survey respondents form expectations on the \emph{relative} change in \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{theta.abs}: a numeric vector containing the estimated factor   which scales the difference between the  shares of 'up' respondents and 'down' respondents assuming that survey respondents form expectations on the \emph{absolute} change in variable \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{theta.perc}: a numeric vector containing the estimated factor   which scales the difference between the  shares of 'up' respondents and 'down' respondents assuming that survey respondents form expectations on the \emph{relative} change in variable \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{nob}: a numeric value showing the number of periods for which expectations have been quantified.
\item \code{mae.abs}: a numeric value showing the mean absolute error (MAE) of expectations when survey respondents form expectations on the \emph{absolute} change in variable \code{y}.
\item \code{rmse.abs}: a numeric value showing the root mean squared error (RMSE) of expectations when survey respondents form expectations on the \emph{absolute} change in variable \code{y}.
\item \code{mae.perc}: a numeric value showing the mean absolute error (MAE) of expectations when survey respondents form expectations on the \emph{relative} change in variable \code{y}.
\item \code{rmse.perc}: a numeric value showing the root mean squared error (RMSE) of expectations when survey respondents form expectations on the \emph{relative} change in variable \code{y}.
}
}
\references{
Batchelor, R.A. (1984), Quantitative vs. qualitative measures of inflation expectations, \emph{Oxford Bulletin of Economics and Statistics} \bold{48} (2), 99--120.

}
\section{Please cite as:}{
Zuckarelli, Joachim (2014). \emph{Quantification of qualitative survey data in R}.\cr
R package version 1.0.0. http://CRAN.R-project.org/package=quantification
}
\author{
Joachim Zuckarelli, \email{joachim@zuckarelli.de}
}
\seealso{
\code{\link{quantification-package}}, \code{\link{cp}}, \code{\link{ra}}, \code{\link{ce}}
}

\examples{
## Data preparation: generate a sample dataset with inflation and survey data
inflation<-c(1.7, 1.9, 2, 1.9, 2, 2.1, 2.1, 2.1, 2.4, 2.3, 2.4)
answer.up<-c(67, 75.1, 76.4, 72.4, 69.7, 49.7, 45.2, 31.6, 14.9, 19.3, 19.2)
answer.same<-c(30.1, 19.6, 19.5, 21.3, 20.1, 33.1, 34.4, 33.5, 44.6, 38.1, 35.3)
answer.down<-c(2.9, 5.3, 4.1, 6.3, 10.2, 17.2, 20.4, 34.9, 40.5, 42.6, 45.5)

## Call bal for quantification
quant.bal<-bal(inflation, answer.up, answer.same, answer.down, first.period=5, 
	last.period=7, forecast.horizon=4)

}