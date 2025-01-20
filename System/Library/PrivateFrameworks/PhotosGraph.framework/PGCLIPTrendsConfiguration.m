@interface PGCLIPTrendsConfiguration
- (NSArray)negativeScenes;
- (NSArray)positiveQueries;
- (NSArray)positiveScenes;
- (NSArray)validTrendTypes;
- (NSDictionary)cosineSimilarityThresholdByVersion;
- (NSNumber)useAveragedEmbeddingAsNumber;
- (NSString)featureLabel;
@end

@implementation PGCLIPTrendsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeScenes, 0);
  objc_storeStrong((id *)&self->_positiveScenes, 0);
  objc_storeStrong((id *)&self->_positiveQueries, 0);
  objc_storeStrong((id *)&self->_validTrendTypes, 0);
  objc_storeStrong((id *)&self->_cosineSimilarityThresholdByVersion, 0);
  objc_storeStrong((id *)&self->_useAveragedEmbeddingAsNumber, 0);
  objc_storeStrong((id *)&self->_featureLabel, 0);
}

- (NSArray)negativeScenes
{
  return self->_negativeScenes;
}

- (NSArray)positiveScenes
{
  return self->_positiveScenes;
}

- (NSArray)positiveQueries
{
  return self->_positiveQueries;
}

- (NSArray)validTrendTypes
{
  return self->_validTrendTypes;
}

- (NSDictionary)cosineSimilarityThresholdByVersion
{
  return self->_cosineSimilarityThresholdByVersion;
}

- (NSNumber)useAveragedEmbeddingAsNumber
{
  return self->_useAveragedEmbeddingAsNumber;
}

- (NSString)featureLabel
{
  return self->_featureLabel;
}

@end