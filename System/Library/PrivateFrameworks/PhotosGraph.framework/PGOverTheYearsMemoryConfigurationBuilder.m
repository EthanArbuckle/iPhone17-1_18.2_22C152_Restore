@interface PGOverTheYearsMemoryConfigurationBuilder
- (BOOL)allowTwoConsecutiveYears;
- (id)overTheYearsMemoryConfiguration;
- (unint64_t)minimumNumberOfMomentsForTwoConsecutiveYears;
- (unint64_t)minimumNumberOfYears;
@end

@implementation PGOverTheYearsMemoryConfigurationBuilder

- (unint64_t)minimumNumberOfMomentsForTwoConsecutiveYears
{
  return self->_minimumNumberOfMomentsForTwoConsecutiveYears;
}

- (BOOL)allowTwoConsecutiveYears
{
  return self->_allowTwoConsecutiveYears;
}

- (unint64_t)minimumNumberOfYears
{
  return self->_minimumNumberOfYears;
}

- (id)overTheYearsMemoryConfiguration
{
  v3 = objc_alloc_init(PGOverTheYearsMemoryConfiguration);
  [(PGOverTimeMemoryConfiguration *)v3 setMinimumNumberOfMoments:[(PGOverTimeMemoryConfigurationBuilder *)self minimumNumberOfMoments]];
  [(PGOverTimeMemoryConfiguration *)v3 setMinimumNumberOfMomentsInterestingWithAlternateJunking:[(PGOverTimeMemoryConfigurationBuilder *)self minimumNumberOfMomentsInterestingWithAlternateJunking]];
  [(PGOverTimeMemoryConfiguration *)v3 setMinimumNumberOfMomentsInterestingForMemories:[(PGOverTimeMemoryConfigurationBuilder *)self minimumNumberOfMomentsInterestingForMemories]];
  [(PGOverTimeMemoryConfiguration *)v3 setMinimumNumberOfAssetsInExtendedCuration:[(PGOverTimeMemoryConfigurationBuilder *)self minimumNumberOfAssetsInExtendedCuration]];
  [(PGOverTimeMemoryConfiguration *)v3 setMinimumNumberOfRelevantAssets:[(PGOverTimeMemoryConfigurationBuilder *)self minimumNumberOfRelevantAssets]];
  [(PGOverTimeMemoryConfigurationBuilder *)self aboveMomentAverageContentScoreThreshold];
  -[PGOverTimeMemoryConfiguration setAboveMomentAverageContentScoreThreshold:](v3, "setAboveMomentAverageContentScoreThreshold:");
  [(PGOverTimeMemoryConfigurationBuilder *)self minimumOverallTimeIntervalOfMoments];
  -[PGOverTimeMemoryConfiguration setMinimumOverallTimeIntervalOfMoments:](v3, "setMinimumOverallTimeIntervalOfMoments:");
  [(PGOverTimeMemoryConfigurationBuilder *)self minimumMomentSpreadicityTimeInterval];
  -[PGOverTimeMemoryConfiguration setMinimumMomentSpreadicityTimeInterval:](v3, "setMinimumMomentSpreadicityTimeInterval:");
  [(PGOverTimeMemoryConfiguration *)v3 setAllMomentsMustHaveScenesProcessed:[(PGOverTimeMemoryConfigurationBuilder *)self allMomentsMustHaveScenesProcessed]];
  [(PGOverTimeMemoryConfiguration *)v3 setAllMomentsMustHaveFacesProcessed:[(PGOverTimeMemoryConfigurationBuilder *)self allMomentsMustHaveFacesProcessed]];
  [(PGOverTheYearsMemoryConfiguration *)v3 setMinimumNumberOfYears:[(PGOverTheYearsMemoryConfigurationBuilder *)self minimumNumberOfYears]];
  [(PGOverTheYearsMemoryConfiguration *)v3 setAllowTwoConsecutiveYears:[(PGOverTheYearsMemoryConfigurationBuilder *)self allowTwoConsecutiveYears]];
  [(PGOverTheYearsMemoryConfiguration *)v3 setMinimumNumberOfMomentsForTwoConsecutiveYears:[(PGOverTheYearsMemoryConfigurationBuilder *)self minimumNumberOfMomentsForTwoConsecutiveYears]];
  return v3;
}

@end