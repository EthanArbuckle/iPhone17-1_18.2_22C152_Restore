@interface PGMemoryMomentRequirementsBuilder
- (BOOL)filterMomentsWithNotEnoughScenesProcessed;
- (BOOL)filterUninterestingForMemories;
- (BOOL)filterUninterestingWithAlternateJunking;
- (double)aboveContentScoreThreshold;
- (id)memoryMomentRequirements;
- (unint64_t)minimumNumberOfAssetsInExtendedCuration;
- (unint64_t)minimumNumberOfPersons;
- (unint64_t)minimumNumberOfRelevantAssets;
@end

@implementation PGMemoryMomentRequirementsBuilder

- (unint64_t)minimumNumberOfPersons
{
  return self->_minimumNumberOfPersons;
}

- (double)aboveContentScoreThreshold
{
  return self->_aboveContentScoreThreshold;
}

- (unint64_t)minimumNumberOfAssetsInExtendedCuration
{
  return self->_minimumNumberOfAssetsInExtendedCuration;
}

- (unint64_t)minimumNumberOfRelevantAssets
{
  return self->_minimumNumberOfRelevantAssets;
}

- (BOOL)filterMomentsWithNotEnoughScenesProcessed
{
  return self->_filterMomentsWithNotEnoughScenesProcessed;
}

- (BOOL)filterUninterestingForMemories
{
  return self->_filterUninterestingForMemories;
}

- (BOOL)filterUninterestingWithAlternateJunking
{
  return self->_filterUninterestingWithAlternateJunking;
}

- (id)memoryMomentRequirements
{
  v3 = objc_alloc_init(PGMemoryMomentRequirements);
  [(PGMemoryMomentRequirements *)v3 setFilterUninterestingWithAlternateJunking:[(PGMemoryMomentRequirementsBuilder *)self filterUninterestingWithAlternateJunking]];
  [(PGMemoryMomentRequirements *)v3 setFilterUninterestingForMemories:[(PGMemoryMomentRequirementsBuilder *)self filterUninterestingForMemories]];
  [(PGMemoryMomentRequirements *)v3 setFilterMomentsWithNotEnoughScenesProcessed:[(PGMemoryMomentRequirementsBuilder *)self filterMomentsWithNotEnoughScenesProcessed]];
  [(PGMemoryMomentRequirements *)v3 setMinimumNumberOfRelevantAssets:[(PGMemoryMomentRequirementsBuilder *)self minimumNumberOfRelevantAssets]];
  [(PGMemoryMomentRequirements *)v3 setMinimumNumberOfAssetsInExtendedCuration:[(PGMemoryMomentRequirementsBuilder *)self minimumNumberOfAssetsInExtendedCuration]];
  [(PGMemoryMomentRequirementsBuilder *)self aboveContentScoreThreshold];
  -[PGMemoryMomentRequirements setAboveContentScoreThreshold:](v3, "setAboveContentScoreThreshold:");
  [(PGMemoryMomentRequirements *)v3 setMinimumNumberOfPersons:[(PGMemoryMomentRequirementsBuilder *)self minimumNumberOfPersons]];
  return v3;
}

@end