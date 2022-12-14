% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/struct.R
\name{struct}
\alias{struct}
\title{Simple structures}
\usage{
struct(x, class, ..., .keep_attr = FALSE)
}
\arguments{
\item{x}{An object; if \code{NULL}, coerced to \code{list()}}

\item{class}{A vector of classes; can also be \code{NULL}}

\item{...}{Named attributes to set to \code{x}; overwrites any attributes in \code{x}
even if defined in \code{.keep_attr}}

\item{.keep_attr}{Control for keeping attributes from \code{x}: \code{TRUE} will retain
all attributes from \code{x}; a character vector will pick out specifically
defined attributes to retain; otherwise only attributes defined in \code{...}
will be used}
}
\value{
An object with class defined as \code{class} and attributes \code{...}
}
\description{
Create simple structures
}
\details{
Unlike \code{\link[base:structure]{base::structure()}} this does not provide additional checks
for special names, performs no \code{\link[base:mode]{base::storage.mode()}} conversions for
\code{factors} (\code{x} therefor has to be an \code{integer}), \code{attributes} from \code{x} are
not retained, and \code{class} is specified outside of other attributes and
assigned after \code{\link[base:attributes]{base::attributes()}} is called.

Essentially, this is just a wrapper for calling \code{\link[base:attributes]{base::attributes()}} then
\code{\link[base:class]{base::class()}}.

Note that \code{\link[base:structure]{base::structure()}} provides a warning when the first argument is
\code{NULL}.  \code{struct()} does not.  The coercion from \code{NULL} to \code{list()} is
done, and documented, in \code{\link[base:attributes]{base::attributes()}}.
}
\examples{
x <- list(a = 1, b = 2)
# structure() retains the $names attribute of x but struct() does not
structure(x, class = "data.frame", row.names = 1L)
struct(x, "data.frame", row.names = 1L)
struct(x, "data.frame", row.names = 1L, names = names(x))

# structure() corrects entries for "factor" class
# but struct() demands the data to be an integer
structure(1, class = "factor", levels = "a")
try(struct(1, "factor", levels = "a"))
struct(1L, "factor", levels = "a")

# When first argument is NULL -- attributes() coerces
try(structure(NULL))    # NULL, no call to attributes()
struct(NULL, NULL)      # list(), without warning
x <- NULL
attributes(x) <- NULL
x                       # NULL
attributes(x) <- list() # struct() always grabs ... into a list
x                       # list()

# Due to the use of class() to assign class, you may experience some
# other differences between structure() and struct()
x <- structure(1, class = "integer")
y <- struct(1, "integer")
str(x)
str(y)

all.equal(x, y)

# Be careful about carrying over attributes
x <- quick_df(list(a = 1:2, b = 3:4))
# returns empty data.frame
struct(x, "data.frame", new = 1)

# safely changing names without breaking rownames
struct(x, "data.frame", names = c("c", "d")) # breaks
struct(x, "data.frame", names = c("c", "d"), .keep_attr = TRUE)
struct(x, "data.frame", names = c("c", "d"), .keep_attr = "row.names")

# safely adds comments
struct(x, "data.frame", comment = "hi", .keep_attr = TRUE)
struct(x, "data.frame", comment = "hi", .keep_attr = c("names", "row.names"))

# assignment in ... overwrites attributes
struct(x, "data.frame", names = c("var1", "var2"), .keep_attr = TRUE)
}
