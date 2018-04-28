\name{quantification-package}
\alias{quantification-package}
\alias{quantification}
\docType{package}
\title{
Quantification of qualitative survey data
}
\description{
This package provides different functions for quantifying qualitative survey data. It supports the Carlson-Parkin method (developed by Carlson/Parkin (1985)), the regression approach (developed by Pesaran (1984)), the balance approach (see Batchelor (1984)) and the conditional expectations method.

These methods are usually applied in economics to quantify qualitative inflation expectations collected through surveys (e.g. consumer surveys). However, the same approaches can be used to quantify \emph{any} qualitative expectation about the change of a variable that is quantitative in nature.

The four functions of the package -- \code{cp} for the Carlson-Parkin method, \code{ra} for the regression approach, \code{bal} for the balance approach and \code{ce} for the conditional expectations method -- allow the user to customize a wide range of parameters and make use of certain extensions of the original methods. Apart from that all the functions deliver per default two versions of quantified expectations: one under the assumption that the survey respondents form expectations over the \emph{absolute} change of the variable in question and one under the assumption of expectations over the \emph{relative} change. The functions also provide the user with standard measures for the forecast quality of the quantified expectations enabling the user to quickly assess the effect of a change in the quantification method used.
}
\author{
Joachim Zuckarelli

Maintainer: Joachim Zuckarelli <joachim@zuckarelli.de>
}
\section{Comments and suggestions}{
Your comments and suggestions are highly appreciated.
}
\references{
Batchelor, R.A. (1984), Quantitative vs. qualitative measures of inflation expectations, \emph{Oxford Bulletin of Economics and Statistics} \bold{48} (2), 99--120.

Carlson, J. A./Parkin, M. (1975), Inflation expectations, \emph{Economica} \bold{42}, 123--138.

Henzel, S./Wollmershaeuser, T. (2005), Quantifying inflation expectations with the Carlson-Parkin
method: A survey-based determination of the just noticeable difference, \emph{Journal of Business Cycle}
Measurement and Analysis \bold{2}, 321--352.

Nardo, M. (2003), The quantification of qualitative survey data: a critical assessment, \emph{Journal of Economic}
Surveys \bold{17} (5), 645--668.

Pesaran, M. (1984), Expectations formation and macroeconomic modelling, in: Malgrange, M. (1984), \emph{Contemporary macroeconomic modelling}, 27--55.

Zuckarelli, J. (2015): A new method for quantification of qualitative expectations, \emph{Economics and Business Letters} \bold{3}(5), Special Issue \emph{Energy demand forecasting}, 123-128.
}