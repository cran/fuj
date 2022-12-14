% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/attributes.R
\name{exattr}
\alias{exattr}
\alias{\%attr\%}
\title{Exact attributes}
\usage{
exattr(x, which)

x \%attr\% which
}
\arguments{
\item{x}{an object whose attributes are to be accessed.}

\item{which}{a non-empty character string specifying which attribute
    is to be accessed.}
}
\value{
See \link[base:attr]{base::attr}
}
\description{
Get the exact attributes of an object
}
\examples{
foo <- struct(list(), "foo", aa = TRUE)
  attr(foo, "a")  # TRUE : partial match successful
exattr(foo, "a")  # NULL : partial match failed
exattr(foo, "aa") # TRUE : exact match
}
