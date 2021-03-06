% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/linear_association.R
\name{run_lm_stats_limma}
\alias{run_lm_stats_limma}
\title{Estimate linear-model stats for a matrix of data using limma with empirical Bayes moderated t-stats for p-values}
\usage{
run_lm_stats_limma(mat, vec, covars = NULL, weights = NULL,
  target_type = "Gene", limma_trend = FALSE)
}
\arguments{
\item{mat:}{Nxp data matrix with N cell lines and p genes}

\item{vec:}{N vector of independent variables. Can be two-group labels as factors, bools, or can be numeric}

\item{covars:}{Optional Nxk matrix of covariates}

\item{weights:}{Optional N vector of precision weights for each data point}

\item{target_type:}{Name of the column variable in the data (default 'Gene')}

\item{limma_trend:}{Whether to fit an intensity trend with the empirical Bayes variance model}
}
\value{
: data frame of stats
}
\description{
Estimate linear-model stats for a matrix of data using limma with empirical Bayes moderated t-stats for p-values
}
\examples{
CRISPR = load.from.taiga(data.name='avana-2-0-1-d98f',
data.version=1,
data.file='ceres_gene_effects',
transpose = T)
is_panc <- load.from.taiga(data.name = 'ccle-lines-lineages') \%>\% .[, 'pancreas']
ulines <- intersect(rownames(CRISPR), names(is_panc))
lim_res <- run_lm_stats_limma(CRISPR[ulines,], is_panc[ulines])
}
