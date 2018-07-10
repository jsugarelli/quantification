\name{cp}
\alias{cp}
\title{
Carlson-Parkin method
}
\description{
\code{cp} implements the method for the quantifcation of qualitative survey data proposed by Carlson/Parkin (1985). Additionally, it provides certain extensions of the Carlson-Parkin approach (e.g. other distributions than the normal distribution, indifference limens depending on the level of the forecasted variable).
}
\usage{
cp(y.series, survey.up, survey.same, survey.down, forecast.horizon, 
	first.period = 1, last.period = (length(survey.up) - forecast.horizon), 
	limen.type = "carlson.parkin", const.limen = 0, user.symm.limen = 0, 
	user.upper.limen = 0, user.lower.limen = 0, correct.zero = TRUE, 
	correct.by = 0.01, growth.limit = NA, distrib.type = "normal", 
	distrib.mean = 0, distrib.sd = 1, distrib.log.location = 0, 
	distrib.log.scale = 1, distrib.t.df = (last.period - first.period), 
	suppress.warnings = FALSE)
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
  \item{limen.type}{
an optional character vector describing the type of indifference limen that shall be used for quantification. Possible values are:\itemize{
	\item "\code{carlson.parkin}": standard symmetric, time-invariant Carlson-Parkin indifference limens; default value.
	\item "\code{weber.fechner}": symmetric, time-varying indifference limens following the Weber-Fechner law, i.e. proportional to the variable in question (i.e. \code{y.series}) at the time of the survey. For details see Henzel/Wollmershaeuser (2005).
	\item "\code{constant}": symmetric, time-invariant indifference limen defined by the user through the \code{const.limen} argument
	\item "\code{symm.series}": fully user-defined, symmetric, time-varying indifference limen given by the argument \code{user.symm.limen}.
	\item "\code{asymm.series}": fully user-defined, asymmetric, time-varying indifference limens given by the arguments \code{user.upper.limen} and \code{user.lower.limen}.	
}
}
  \item{const.limen}{
an optional numeric value containing the symmetric, time-invariant user-defined indifference limen. Must be provided when "\code{constant}" is chosen as \code{limen.type}. Is ignored otherwise. Default value is \code{0}.
}
  \item{user.symm.limen}{
an optional numeric vector containing the symmetric, time-varying indifference limen. Must be provided when "\code{symm.series}" is chosen as \code{limen.type}. Is ignored otherwise. Default value is a \code{0}.
}
  \item{user.upper.limen}{
an optional numeric vector containing the upper, time-varying indifference limen. Must be provided when "\code{asymm.series}" is chosen as \code{limen.type}. Is ignored otherwise. Default value is \code{0}.
}
  \item{user.lower.limen}{
an optional numeric vector containing the lower, time-varying indifference limen. Must be provided when "\code{asymm.series}" is chosen as \code{limen.type}. Is ignored otherwise. Default value is \code{0}.
}
	\item{correct.zero}{
an optional logical value steering the automatic correction of zero-values in \code{survey.up} and \code{survey.down}. If \code{survey.up} or \code{survey.down} are zero in any period then the Carlson-Parkin method delivers counter-intuitive results (see Nardo (2003) for details). Automatic correction changes the zero value to an amount specified by the \code{correct.by} argument. \code{correct.zero=TRUE} switches automatic correction on which is the default. 
}
  \item{correct.by}{
an optional parameter indicating the amount by which \code{survey.up} and \code{survey.down} are corrected in case they have zero value and \code{correct.zero=TRUE}. Default value is \code{0.01}.
}
	\item{growth.limit}{
serves to limit the effect of outliers when expectations are quantified under the assumption that survey respondents form expectations on the percentage change of \code{y}. \code{growth.limit} defines a limit for percentage change of \code{y}. When this limit is exceeded the growth rate is set automatically to the median growth of \code{y} over the period covered by the expectations. Default value is \code{NA}.
}
  \item{distrib.type}{
an optional character vector describing the type of distribution used for quantification. Possible values are:
\itemize{
	\item "\code{normal}": the normal distribution is used. Default value for \code{distrib.type}. Parameters \code{distrib.mean} and \code{distrib.sd} can be used to specify the distribution.
	\item "\code{logistic}": the logistic distribution is used. Parameters \code{distrib.log.location} and \code{distrib.log.scale} can be used to specify the distribution.
	\item "\code{t}": the t distribution is used. Parameter \code{distrib.t.df} can be used to specify the distribution.
}
}
  \item{distrib.mean}{
an optional numerical value defining the mean of the normal distribution (used in case \code{distrib.type="normal"}). Default value is \code{0}.
}
  \item{distrib.sd}{
an optional numerical value defining the standard deviation of the normal distribution (used in case \code{distrib.type="normal"}). Default value is \code{1}.
}
  \item{distrib.log.location}{
an optional numerical value defining the location of the logistic distribution (used in case \code{distrib.type="logistic"}). Default value is \code{0}.
}
  \item{distrib.log.scale}{
an optional numerical value defining the scale of the logistic distribution (used in case \code{distrib.type="logistic"}). Default value is \code{1}.
}
  \item{distrib.t.df}{
an optional numerical value defining the degrees of freedom (df) of the t distribution (used in case \code{distrib.type="t"}). Default value is \code{last.period - first.period}.
}
	\item{suppress.warnings}{
a logical value indicating if runtime warnings shall be displayed (\code{FALSE}) or not (\code{TRUE}). Default value is \code{FALSE}.
}
}
\details{
\code{cp} provides two alternative versions of quantified expectations, depending on the assumed expectation formation process of survey respondents. The basic common assumption of the Carlson-Parkin method is that survey participants are asked to assess whether variable \code{y} will go up or down or stay the same. Survey respondents can now form expectations on either the absolute or the relative change of \code{y} which differ because the indifferent limens used for quantification are calculated differently in each case. The \code{cp} function calculates both versions.

The survey result vectors \code{survey.up}, \code{survey.down} and \code{survey.same} as well as the variable \code{y.series} must be of the same length and must cover the forecasted horizon (i.e. \code{last.period} + \code{forecast.horizon} \eqn{\le} \code{length(survey.up)}). 

Data in \code{survey.up}, \code{survey.down} and \code{survey.same} outside the survey period interval \code{[first.period, last.period]} are ignored. Similiarly, \code{y.series} data with a period index greater than \code{last.period} is ignored.

\code{first.period} must be greater than \code{forecast.horizon}, because indifference limens use the current change of variable \code{y}  for calibration. In order to calculate the change in \code{y} for the survey obersavation with index \code{first.period} the observation of \code{y} with index \code{first.period - forecast.horizon} is required.

\code{survey.up}, \code{survey.down} and \code{survey.same} need not sum up to \code{100\%} or \code{1} (which may happen, for example, if the survey has a 'Don't know' answer option).

The Weber-Fechner option (see Henzel/Wollmershaeuser (2005) for details) weighs the 'expectations' term in the traditional Carlson-Parkin limen calculation with the current inflation rate. The resulting time-invariant value is applied as a proportionality factor to current inflation leading to a time-varying, inflation-proportional indifference limen.

When the indifference limen is user-defined (i.e. \code{limen.type="symm.series"} or \code{limen.type="asymm.series"}) then each limen value needs to be placed in such a way in the limen vector(s) (i.e. \code{user.limen} or \code{user.upper.limen} / \code{user.lower.limen}) that it has the same index as the survey observation (in \code{survey.up}, \code{survey.down} and \code{survey.same}) to which it belongs.
}
\value{
\code{cp} returns a list containing the quantified survey data and some meta information. The list has the following elements:
\itemize{
\item \code{y.e.mean.abs}: a numeric vector containing the quantified mean expectations of the variable \code{y}, assuming that survey respondents form expectations on the \emph{absolute} change in \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{y.e.mean.perc}: a numeric vector containing the quantified mean expectations of the variable \code{y}, assuming that survey respondents form expectations on the \emph{relative} change in \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{delta.y.e.mean.abs}: a numeric vector containing the quantified mean absolute change of the variable \code{y}, assuming that survey respondents form expectations on the \emph{absolute} change in \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{delta.y.e.mean.perc}: a numeric vector containing the quantified mean percentage change of the variable \code{y}, assuming that survey respondents form expectations on the \emph{relative} change in \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{delta.y.e.sd.abs}: a numeric vector containing the standard deviation of the absolute change expectation for variable \code{y} in the population. Assumes that survey respondents form expectations on the \emph{absolute} change in \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{delta.y.e.sd.perc}: a numeric vector containing the standard deviation of the absolute change expectation for variable \code{y} in the population. Assumes that survey respondents form expectations on the \emph{relative} change in \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{limen.abs}: a numeric vector containing the estimated (or user-defined) indifference limens assuming that survey respondents form expectations on the \emph{absolute} change in variable \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{limen.perc}: a numeric vector containing the estimated (or user-defined) indifference limens assuming that survey respondents form expectations on the \emph{relative} change in variable \code{y}. For all periods which are not in scope of the survey the value is \code{NA}.
\item \code{nob}: a numeric value showing the number of periods for which expectations have been quantified.
\item \code{mae.abs}: a numeric value showing the mean absolute error (MAE) of expectations when survey respondents form expectations on the \emph{absolute} change in variable \code{y}.
\item \code{rmse.abs}: a numeric value showing the root mean squared error (RMSE) of expectations when survey respondents form expectations on the \emph{absolute} change in variable \code{y}.
\item \code{mae.perc}: a numeric value showing the mean absolute error (MAE) of expectations when survey respondents form expectations on the \emph{relative} change in variable \code{y}.
\item \code{rmse.perc}: a numeric value showing the root mean squared error (RMSE) of expectations when survey respondents form expectations on the \emph{relative} change in variable \code{y}.
}
}
\references{
Carlson, J. A./Parkin, M. (1975), Inflation expectations, \emph{Economica} \bold{42}, 123--138.

Henzel, S./Wollmershaeuser, T. (2005), Quantifying inflation expectations with the Carlson-Parkin
method: A survey-based determination of the just noticeable difference, \emph{Journal of Business Cycle}
Measurement and Analysis \bold{2}, 321--352.

Nardo, M. (2003), The quantification of qualitative survey data: a critical assessment, \emph{Journal of Economic}
Surveys \bold{17} (5), 645--668.
}

\section{Please cite as:}{
Zuckarelli, Joachim (2014). \emph{Quantification of qualitative survey data in R}.\cr
R package version 0.1.0. http://CRAN.R-project.org/package=quantification
}
\author{
Joachim Zuckarelli, \email{joachim@zuckarelli.de}
}
\seealso{
\code{\link{quantification-package}}, \code{\link{bal}}, \code{\link{ra}}, \code{\link{ce}}
}
\examples{
## Data preparation: generate a sample dataset with inflation and survey data
inflation<-c(1.7, 1.9, 2, 1.9, 2, 2.1, 2.1, 2.1, 2.4, 2.3, 2.4)
answer.up<-c(67, 75.1, 76.4, 72.4, 69.7, 49.7, 45.2, 31.6, 14.9, 19.3, 19.2)
answer.same<-c(30.1, 19.6, 19.5, 21.3, 20.1, 33.1, 34.4, 33.5, 44.6, 38.1, 35.3)
answer.down<-c(2.9, 5.3, 4.1, 6.3, 10.2, 17.2, 20.4, 34.9, 40.5, 42.6, 45.5)

## Call cp for quantification
quant.cp.limens<-cp(inflation, answer.up, answer.same, answer.down, first.period=5, 
	last.period=7, forecast.horizon=4)

## With Weber-Fechner limens instead of Carson-Parkin limens
quant.wf.limens<-cp(inflation, answer.up, answer.same, answer.same, first.period=5, 
	last.period=7, forecast.horizon=4, limen.type="weber.fechner")
}