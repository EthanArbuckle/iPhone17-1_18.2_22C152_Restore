@interface PGOverTimeMemoryConfiguration
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
- (void)setAboveMomentAverageContentScoreThreshold:(double)a3;
- (void)setAllMomentsMustHaveFacesProcessed:(BOOL)a3;
- (void)setAllMomentsMustHaveScenesProcessed:(BOOL)a3;
- (void)setMinimumMomentSpreadicityTimeInterval:(double)a3;
- (void)setMinimumNumberOfAssetsInExtendedCuration:(unint64_t)a3;
- (void)setMinimumNumberOfMoments:(unint64_t)a3;
- (void)setMinimumNumberOfMomentsInterestingForMemories:(unint64_t)a3;
- (void)setMinimumNumberOfMomentsInterestingWithAlternateJunking:(unint64_t)a3;
- (void)setMinimumNumberOfRelevantAssets:(unint64_t)a3;
- (void)setMinimumOverallTimeIntervalOfMoments:(double)a3;
@end

@implementation PGOverTimeMemoryConfiguration

- (void)setAllMomentsMustHaveFacesProcessed:(BOOL)a3
{
  self->_allMomentsMustHaveFacesProcessed = a3;
}

- (BOOL)allMomentsMustHaveFacesProcessed
{
  return self->_allMomentsMustHaveFacesProcessed;
}

- (void)setAllMomentsMustHaveScenesProcessed:(BOOL)a3
{
  self->_allMomentsMustHaveScenesProcessed = a3;
}

- (BOOL)allMomentsMustHaveScenesProcessed
{
  return self->_allMomentsMustHaveScenesProcessed;
}

- (void)setMinimumMomentSpreadicityTimeInterval:(double)a3
{
  self->_minimumMomentSpreadicityTimeInterval = a3;
}

- (double)minimumMomentSpreadicityTimeInterval
{
  return self->_minimumMomentSpreadicityTimeInterval;
}

- (void)setMinimumOverallTimeIntervalOfMoments:(double)a3
{
  self->_minimumOverallTimeIntervalOfMoments = a3;
}

- (double)minimumOverallTimeIntervalOfMoments
{
  return self->_minimumOverallTimeIntervalOfMoments;
}

- (void)setAboveMomentAverageContentScoreThreshold:(double)a3
{
  self->_aboveMomentAverageContentScoreThreshold = a3;
}

- (double)aboveMomentAverageContentScoreThreshold
{
  return self->_aboveMomentAverageContentScoreThreshold;
}

- (void)setMinimumNumberOfRelevantAssets:(unint64_t)a3
{
  self->_minimumNumberOfRelevantAssets = a3;
}

- (unint64_t)minimumNumberOfRelevantAssets
{
  return self->_minimumNumberOfRelevantAssets;
}

- (void)setMinimumNumberOfAssetsInExtendedCuration:(unint64_t)a3
{
  self->_minimumNumberOfAssetsInExtendedCuration = a3;
}

- (unint64_t)minimumNumberOfAssetsInExtendedCuration
{
  return self->_minimumNumberOfAssetsInExtendedCuration;
}

- (void)setMinimumNumberOfMomentsInterestingForMemories:(unint64_t)a3
{
  self->_minimumNumberOfMomentsInterestingForMemories = a3;
}

- (unint64_t)minimumNumberOfMomentsInterestingForMemories
{
  return self->_minimumNumberOfMomentsInterestingForMemories;
}

- (void)setMinimumNumberOfMomentsInterestingWithAlternateJunking:(unint64_t)a3
{
  self->_minimumNumberOfMomentsInterestingWithAlternateJunking = a3;
}

- (unint64_t)minimumNumberOfMomentsInterestingWithAlternateJunking
{
  return self->_minimumNumberOfMomentsInterestingWithAlternateJunking;
}

- (void)setMinimumNumberOfMoments:(unint64_t)a3
{
  self->_minimumNumberOfMoments = a3;
}

- (unint64_t)minimumNumberOfMoments
{
  return self->_minimumNumberOfMoments;
}

@end