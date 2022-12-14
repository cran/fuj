% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/muffle.R
\name{muffle}
\alias{muffle}
\alias{wuffle}
\title{Muffle messages}
\usage{
muffle(expr, fun, classes = "message")

wuffle(expr, fun, classes = "warning")
}
\arguments{
\item{expr}{An expression to evaluate}

\item{fun}{A function to \emph{muffle} (or \emph{wuffle})}

\item{classes}{A character vector if classes to suppress}
}
\value{
The result of \code{expr} or a \code{function} wrapping \code{fun}
}
\description{
Aliases for \code{\link[base:message]{base::suppressMessages()}} and \code{\link[base:warning]{base::suppressWarnings()}}
}
\examples{

# load function
foo <- function(...) {
  message("You entered :", paste0(...))
  c(...)
}

# wrap around function or muffle the function ti's
muffle(foo(1, 2))
muffle(fun = foo)(1, 2)
sapply(1:3, muffle(fun = foo))

# silence warnings
wuffle(as.integer("a"))
sapply(list(1, "a", "0", ".2"), wuffle(fun = as.integer))
}
