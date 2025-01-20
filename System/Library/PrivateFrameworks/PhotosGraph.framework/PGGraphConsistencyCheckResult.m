@interface PGGraphConsistencyCheckResult
- (NSDictionary)similarityScoreByDomain;
- (PGGraphConsistencyCheckResult)init;
- (double)overallSimilarityScore;
- (id)description;
- (void)setOverallSimilarityScore:(double)a3;
- (void)setSimilarityScoreByDomain:(id)a3;
@end

@implementation PGGraphConsistencyCheckResult

- (void).cxx_destruct
{
}

- (void)setSimilarityScoreByDomain:(id)a3
{
}

- (NSDictionary)similarityScoreByDomain
{
  return self->_similarityScoreByDomain;
}

- (void)setOverallSimilarityScore:(double)a3
{
  self->_overallSimilarityScore = a3;
}

- (double)overallSimilarityScore
{
  return self->_overallSimilarityScore;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphConsistencyCheckResult;
  v4 = [(PGGraphConsistencyCheckResult *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ - Overall similarity: %.2f\nResults per domain:\n%@", v4, *(void *)&self->_overallSimilarityScore, self->_similarityScoreByDomain];

  return v5;
}

- (PGGraphConsistencyCheckResult)init
{
  v7.receiver = self;
  v7.super_class = (Class)PGGraphConsistencyCheckResult;
  v2 = [(PGGraphConsistencyCheckResult *)&v7 init];
  v3 = v2;
  if (v2)
  {
    similarityScoreByDomain = v2->_similarityScoreByDomain;
    v5 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    v2->_overallSimilarityScore = 0.0;
    v2->_similarityScoreByDomain = v5;
  }
  return v3;
}

@end