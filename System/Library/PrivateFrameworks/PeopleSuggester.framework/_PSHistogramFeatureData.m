@interface _PSHistogramFeatureData
- (NSDictionary)bucketHasEver;
- (NSDictionary)bucketSums;
- (NSDictionary)cache;
- (NSDictionary)factorToUniqueBucketNames;
- (NSMutableDictionary)candidateTimeIntervalSums;
- (void)setBucketHasEver:(id)a3;
- (void)setBucketSums:(id)a3;
- (void)setCache:(id)a3;
- (void)setCandidateTimeIntervalSums:(id)a3;
- (void)setFactorToUniqueBucketNames:(id)a3;
@end

@implementation _PSHistogramFeatureData

- (NSDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (NSDictionary)bucketSums
{
  return self->_bucketSums;
}

- (void)setBucketSums:(id)a3
{
}

- (NSDictionary)bucketHasEver
{
  return self->_bucketHasEver;
}

- (void)setBucketHasEver:(id)a3
{
}

- (NSDictionary)factorToUniqueBucketNames
{
  return self->_factorToUniqueBucketNames;
}

- (void)setFactorToUniqueBucketNames:(id)a3
{
}

- (NSMutableDictionary)candidateTimeIntervalSums
{
  return self->_candidateTimeIntervalSums;
}

- (void)setCandidateTimeIntervalSums:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateTimeIntervalSums, 0);
  objc_storeStrong((id *)&self->_factorToUniqueBucketNames, 0);
  objc_storeStrong((id *)&self->_bucketHasEver, 0);
  objc_storeStrong((id *)&self->_bucketSums, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end