@interface PGTrendsConfiguration
- (NSArray)negativeScenes;
- (NSArray)positiveDominantScenes;
- (NSArray)positiveScenes;
- (NSArray)positiveSemDevScenes;
- (NSArray)secondaryPositiveScenes;
- (NSArray)validTrendTypes;
- (NSString)featureLabel;
@end

@implementation PGTrendsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeScenes, 0);
  objc_storeStrong((id *)&self->_positiveSemDevScenes, 0);
  objc_storeStrong((id *)&self->_positiveDominantScenes, 0);
  objc_storeStrong((id *)&self->_secondaryPositiveScenes, 0);
  objc_storeStrong((id *)&self->_positiveScenes, 0);
  objc_storeStrong((id *)&self->_validTrendTypes, 0);
  objc_storeStrong((id *)&self->_featureLabel, 0);
}

- (NSArray)negativeScenes
{
  return self->_negativeScenes;
}

- (NSArray)positiveSemDevScenes
{
  return self->_positiveSemDevScenes;
}

- (NSArray)positiveDominantScenes
{
  return self->_positiveDominantScenes;
}

- (NSArray)secondaryPositiveScenes
{
  return self->_secondaryPositiveScenes;
}

- (NSArray)positiveScenes
{
  return self->_positiveScenes;
}

- (NSArray)validTrendTypes
{
  return self->_validTrendTypes;
}

- (NSString)featureLabel
{
  return self->_featureLabel;
}

@end