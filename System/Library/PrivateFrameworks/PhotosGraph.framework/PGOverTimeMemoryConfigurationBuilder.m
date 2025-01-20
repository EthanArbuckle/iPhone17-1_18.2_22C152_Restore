@interface PGOverTimeMemoryConfigurationBuilder
- (BOOL)allMomentsMustHaveFacesProcessed;
- (BOOL)allMomentsMustHaveScenesProcessed;
- (double)aboveMomentAverageContentScoreThreshold;
- (double)minimumMomentSpreadicityTimeInterval;
- (double)minimumOverallTimeIntervalOfMoments;
- (unint64_t)minimumNumberOfAssetsInExtendedCuration;
- (unint64_t)minimumNumberOfMoments;
- (unint64_t)minimumNumberOfMomentsInterestingForMemories;
- (unint64_t)minimumNumberOfMomentsInterestingWithAlternateJunking;
- (unint64_t)minimumNumberOfRelevantAssets;
@end

@implementation PGOverTimeMemoryConfigurationBuilder

- (BOOL)allMomentsMustHaveFacesProcessed
{
  return self->_allMomentsMustHaveFacesProcessed;
}

- (BOOL)allMomentsMustHaveScenesProcessed
{
  return self->_allMomentsMustHaveScenesProcessed;
}

- (double)minimumMomentSpreadicityTimeInterval
{
  return self->_minimumMomentSpreadicityTimeInterval;
}

- (double)minimumOverallTimeIntervalOfMoments
{
  return self->_minimumOverallTimeIntervalOfMoments;
}

- (double)aboveMomentAverageContentScoreThreshold
{
  return self->_aboveMomentAverageContentScoreThreshold;
}

- (unint64_t)minimumNumberOfRelevantAssets
{
  return self->_minimumNumberOfRelevantAssets;
}

- (unint64_t)minimumNumberOfAssetsInExtendedCuration
{
  return self->_minimumNumberOfAssetsInExtendedCuration;
}

- (unint64_t)minimumNumberOfMomentsInterestingForMemories
{
  return self->_minimumNumberOfMomentsInterestingForMemories;
}

- (unint64_t)minimumNumberOfMomentsInterestingWithAlternateJunking
{
  return self->_minimumNumberOfMomentsInterestingWithAlternateJunking;
}

- (unint64_t)minimumNumberOfMoments
{
  return self->_minimumNumberOfMoments;
}

@end