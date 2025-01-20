@interface PGMemoryMomentRequirements
- (BOOL)filterMomentsWithNotEnoughScenesProcessed;
- (BOOL)filterUninterestingForMemories;
- (BOOL)filterUninterestingWithAlternateJunking;
- (double)aboveContentScoreThreshold;
- (unint64_t)minimumNumberOfAssetsInExtendedCuration;
- (unint64_t)minimumNumberOfPersons;
- (unint64_t)minimumNumberOfRelevantAssets;
- (void)setAboveContentScoreThreshold:(double)a3;
- (void)setFilterMomentsWithNotEnoughScenesProcessed:(BOOL)a3;
- (void)setFilterUninterestingForMemories:(BOOL)a3;
- (void)setFilterUninterestingWithAlternateJunking:(BOOL)a3;
- (void)setMinimumNumberOfAssetsInExtendedCuration:(unint64_t)a3;
- (void)setMinimumNumberOfPersons:(unint64_t)a3;
- (void)setMinimumNumberOfRelevantAssets:(unint64_t)a3;
@end

@implementation PGMemoryMomentRequirements

- (void)setMinimumNumberOfPersons:(unint64_t)a3
{
  self->_minimumNumberOfPersons = a3;
}

- (unint64_t)minimumNumberOfPersons
{
  return self->_minimumNumberOfPersons;
}

- (void)setAboveContentScoreThreshold:(double)a3
{
  self->_aboveContentScoreThreshold = a3;
}

- (double)aboveContentScoreThreshold
{
  return self->_aboveContentScoreThreshold;
}

- (void)setMinimumNumberOfAssetsInExtendedCuration:(unint64_t)a3
{
  self->_minimumNumberOfAssetsInExtendedCuration = a3;
}

- (unint64_t)minimumNumberOfAssetsInExtendedCuration
{
  return self->_minimumNumberOfAssetsInExtendedCuration;
}

- (void)setMinimumNumberOfRelevantAssets:(unint64_t)a3
{
  self->_minimumNumberOfRelevantAssets = a3;
}

- (unint64_t)minimumNumberOfRelevantAssets
{
  return self->_minimumNumberOfRelevantAssets;
}

- (void)setFilterMomentsWithNotEnoughScenesProcessed:(BOOL)a3
{
  self->_filterMomentsWithNotEnoughScenesProcessed = a3;
}

- (BOOL)filterMomentsWithNotEnoughScenesProcessed
{
  return self->_filterMomentsWithNotEnoughScenesProcessed;
}

- (void)setFilterUninterestingForMemories:(BOOL)a3
{
  self->_filterUninterestingForMemories = a3;
}

- (BOOL)filterUninterestingForMemories
{
  return self->_filterUninterestingForMemories;
}

- (void)setFilterUninterestingWithAlternateJunking:(BOOL)a3
{
  self->_filterUninterestingWithAlternateJunking = a3;
}

- (BOOL)filterUninterestingWithAlternateJunking
{
  return self->_filterUninterestingWithAlternateJunking;
}

@end