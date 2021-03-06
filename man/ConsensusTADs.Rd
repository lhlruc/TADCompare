% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ConsensusTADs.R
\name{ConsensusTADs}
\alias{ConsensusTADs}
\title{Consensus boundary identification}
\usage{
ConsensusTADs(cont_mats, resolution, z_thresh = 3, window_size = 15,
  gap_thresh = 0.2)
}
\arguments{
\item{cont_mats}{List of contact matrices in either sparse 3 column,
n x n or n x (n+3) form where the first three columns are coordinates in
BED format. See "Input_Data" vignette for more information. 
If an x n matrix is used, the column names must correspond to
the start point of the corresponding bin. Required.}

\item{resolution}{Resolution of the data. Used to assign TAD boundaries
to genomic regions. If not provided, resolution will be estimated from
column names of the first matrix. Default is "auto"}

\item{z_thresh}{Threshold for boundary score. Higher values result in a
higher threshold for differential TADs. Default is 3.}

\item{window_size}{Size of sliding window for TAD detection, measured in bins.
Results should be consistent Default is 15.}

\item{gap_thresh}{Required \% of non-zero entries before a region will
be considered non-informative and excluded. Default is .2}
}
\value{
A list containing consensus TAD boundaries and overall scores
 \itemize{
 \item Consensus - Data frame containing location of all consensus
 boundaries. Coordinate is the region of the genome, Sample columns
 correspond to individual boundary scores. Consensus_Score is consensus
 boundary score.
 \item All_Regions - Data frame containing consensus scores for all regions.
 All columns are identiical to the Consensus object.
}
}
\description{
Consensus boundary identification
}
\details{
Given a list of sparse 3 column, n x n , or n x (n+3) contact matrices,
ConsensusTADs provides the set of consensus TAD boundaries across
them. Consensus TADs are defined by the consensus boundary score,
a score measuring TAD boundary likelihood across all matrices.
}
\examples{
# Read in data
data("time_mats")
# Find consensus TAD boundaries
diff_list <- ConsensusTADs(time_mats, resolution = 50000)
}
