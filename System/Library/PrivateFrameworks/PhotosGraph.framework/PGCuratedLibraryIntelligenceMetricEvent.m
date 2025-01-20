@interface PGCuratedLibraryIntelligenceMetricEvent
+ (id)librarySizeRangeDescriptionForLibrarySizeRange:(int64_t)a3;
- (BOOL)shouldReportMetrics;
- (NSDate)debugDate;
- (PGCuratedLibraryIntelligenceMetricEvent)initWithGraphManager:(id)a3;
- (PGManager)manager;
- (double)_ratioFromNumerator:(unint64_t)a3 denominator:(unint64_t)a4;
- (double)averageNumberOfAssetsInAggregationHighlights;
- (double)averageNumberOfAssetsInDefaultHighlights;
- (double)averageNumberOfAssetsInTripHighlights;
- (double)averageNumberOfCuratedAssetsPerMonth;
- (double)averageNumberOfPromotedHighlightsPerMonth;
- (double)averageNumberOfPromotedHighlightsPerMonthPastYear;
- (double)personalGoodAestheticScore;
- (double)personalHighAestheticScore;
- (double)ratioOfAssetsInAggregationHighlights;
- (double)ratioOfAssetsInDefaultHighlights;
- (double)ratioOfAssetsInTripHighlights;
- (double)ratioOfAssetsWithBetterCurationScore;
- (double)ratioOfAssetsWithDefaultCurationScore;
- (double)ratioOfAssetsWithImprovedCurationScore;
- (double)ratioOfAssetsWithUtilityCurationScore;
- (double)ratioOfAutoplayedPhotoKeyAssets;
- (double)ratioOfAutoplayedVideoKeyAssets;
- (double)ratioOfCurated1siesAmongVisibleHighlights;
- (double)ratioOfCurated2siesAmongVisibleHighlights;
- (double)ratioOfCuratedAssets;
- (double)ratioOfCuratedAssetsCoveredInMonth;
- (double)ratioOfCuratedAssetsInAggregations;
- (double)ratioOfCuratedAssetsInDefaultHighlights;
- (double)ratioOfCuratedAssetsInTrips;
- (double)ratioOfDaysInAggregations;
- (double)ratioOfDaysInTrips;
- (double)ratioOfDedupedAssets;
- (double)ratioOfDedupedAssetsInTrips;
- (double)ratioOfDefaultDays;
- (double)ratioOfGoldAssets;
- (double)ratioOfHiddenDayHighlights;
- (double)ratioOfPhotoKeyAssets;
- (double)ratioOfProcessedFaces;
- (double)ratioOfProcessedScenes;
- (double)ratioOfRegularGemAssets;
- (double)ratioOfShinyGemAssets;
- (double)ratioOfUtilityAssets;
- (double)ratioOfUtilityAssetsInTrips;
- (double)ratioOfVideoKeyAssets;
- (double)topTierAestheticScore;
- (double)topTierAestheticScoreForTripKeyAsset;
- (id)_aggregationGroups;
- (id)_assetsStatisticsInHighlights:(id)a3 photoLibrary:(id)a4 includeUtility:(BOOL)a5 progressReporter:(id)a6;
- (id)_dayHighlights;
- (id)_daysWithinAggregations;
- (id)_daysWithinTrips;
- (id)_defaultHighlights;
- (id)_longTripDayGroups;
- (id)_shortTripDayGroups;
- (id)identifier;
- (id)payload;
- (id)utilityPredicate;
- (int64_t)librarySizeRange;
- (unint64_t)_debugNumberOfAssets;
- (unint64_t)_numberOfDayHighlights;
- (unint64_t)librarySize;
- (unint64_t)numberOfAggregations;
- (unint64_t)numberOfCuratedAssets;
- (unint64_t)numberOfDayHighlights;
- (unint64_t)numberOfDaysInAggregations;
- (unint64_t)numberOfDaysInTrips;
- (unint64_t)numberOfDaysWithPhotosInPastYear;
- (unint64_t)numberOfDefaultDayHighlights;
- (unint64_t)numberOfLongTrips;
- (unint64_t)numberOfMoments;
- (unint64_t)numberOfMonthHighlights;
- (unint64_t)numberOfShortTrips;
- (unint64_t)numberOfYearHighlights;
- (void)_fillAestheticAndBehavioralCurationStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillContentScoreStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillDayHighlightsStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillGenericStatisticsWithGraph:(id)a3;
- (void)_fillHiddenHighlightsStatisticsWithGraph:(id)a3;
- (void)_fillKeyAssetsStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillMomentsStatisticsWithGraph:(id)a3;
- (void)_fillMonthHighlightsStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillOnesiesHighlightStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillProcessingLevelStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillYearHighlightsStatisticsWithGraph:(id)a3;
- (void)_saveKey:(id)a3 doubleValue:(double)a4 payload:(id)a5;
- (void)_saveKey:(id)a3 integerValue:(unint64_t)a4 payload:(id)a5;
- (void)_saveKey:(id)a3 stringValue:(id)a4 payload:(id)a5;
- (void)gatherMetricsWithProgressBlock:(id)a3;
- (void)setAverageNumberOfAssetsInAggregationHighlights:(double)a3;
- (void)setAverageNumberOfAssetsInDefaultHighlights:(double)a3;
- (void)setAverageNumberOfAssetsInTripHighlights:(double)a3;
- (void)setAverageNumberOfCuratedAssetsPerMonth:(double)a3;
- (void)setAverageNumberOfPromotedHighlightsPerMonth:(double)a3;
- (void)setAverageNumberOfPromotedHighlightsPerMonthPastYear:(double)a3;
- (void)setDebugDate:(id)a3;
- (void)setLibrarySize:(unint64_t)a3;
- (void)setLibrarySizeRange:(int64_t)a3;
- (void)setManager:(id)a3;
- (void)setNumberOfAggregations:(unint64_t)a3;
- (void)setNumberOfCuratedAssets:(unint64_t)a3;
- (void)setNumberOfDayHighlights:(unint64_t)a3;
- (void)setNumberOfDaysInAggregations:(unint64_t)a3;
- (void)setNumberOfDaysInTrips:(unint64_t)a3;
- (void)setNumberOfDaysWithPhotosInPastYear:(unint64_t)a3;
- (void)setNumberOfDefaultDayHighlights:(unint64_t)a3;
- (void)setNumberOfLongTrips:(unint64_t)a3;
- (void)setNumberOfMoments:(unint64_t)a3;
- (void)setNumberOfMonthHighlights:(unint64_t)a3;
- (void)setNumberOfShortTrips:(unint64_t)a3;
- (void)setNumberOfYearHighlights:(unint64_t)a3;
- (void)setPersonalGoodAestheticScore:(double)a3;
- (void)setPersonalHighAestheticScore:(double)a3;
- (void)setRatioOfAssetsInAggregationHighlights:(double)a3;
- (void)setRatioOfAssetsInDefaultHighlights:(double)a3;
- (void)setRatioOfAssetsInTripHighlights:(double)a3;
- (void)setRatioOfAssetsWithBetterCurationScore:(double)a3;
- (void)setRatioOfAssetsWithDefaultCurationScore:(double)a3;
- (void)setRatioOfAssetsWithImprovedCurationScore:(double)a3;
- (void)setRatioOfAssetsWithUtilityCurationScore:(double)a3;
- (void)setRatioOfAutoplayedPhotoKeyAssets:(double)a3;
- (void)setRatioOfAutoplayedVideoKeyAssets:(double)a3;
- (void)setRatioOfCurated1siesAmongVisibleHighlights:(double)a3;
- (void)setRatioOfCurated2siesAmongVisibleHighlights:(double)a3;
- (void)setRatioOfCuratedAssets:(double)a3;
- (void)setRatioOfCuratedAssetsCoveredInMonth:(double)a3;
- (void)setRatioOfCuratedAssetsInAggregations:(double)a3;
- (void)setRatioOfCuratedAssetsInDefaultHighlights:(double)a3;
- (void)setRatioOfCuratedAssetsInTrips:(double)a3;
- (void)setRatioOfDaysInAggregations:(double)a3;
- (void)setRatioOfDaysInTrips:(double)a3;
- (void)setRatioOfDedupedAssets:(double)a3;
- (void)setRatioOfDedupedAssetsInTrips:(double)a3;
- (void)setRatioOfDefaultDays:(double)a3;
- (void)setRatioOfGoldAssets:(double)a3;
- (void)setRatioOfHiddenDayHighlights:(double)a3;
- (void)setRatioOfPhotoKeyAssets:(double)a3;
- (void)setRatioOfProcessedFaces:(double)a3;
- (void)setRatioOfProcessedScenes:(double)a3;
- (void)setRatioOfRegularGemAssets:(double)a3;
- (void)setRatioOfShinyGemAssets:(double)a3;
- (void)setRatioOfUtilityAssets:(double)a3;
- (void)setRatioOfUtilityAssetsInTrips:(double)a3;
- (void)setRatioOfVideoKeyAssets:(double)a3;
- (void)setTopTierAestheticScore:(double)a3;
- (void)setTopTierAestheticScoreForTripKeyAsset:(double)a3;
@end

@implementation PGCuratedLibraryIntelligenceMetricEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_debugDate, 0);
}

- (void)setRatioOfProcessedFaces:(double)a3
{
  self->_ratioOfProcessedFaces = a3;
}

- (double)ratioOfProcessedFaces
{
  return self->_ratioOfProcessedFaces;
}

- (void)setRatioOfProcessedScenes:(double)a3
{
  self->_ratioOfProcessedScenes = a3;
}

- (double)ratioOfProcessedScenes
{
  return self->_ratioOfProcessedScenes;
}

- (void)setRatioOfAutoplayedVideoKeyAssets:(double)a3
{
  self->_ratioOfAutoplayedVideoKeyAssets = a3;
}

- (double)ratioOfAutoplayedVideoKeyAssets
{
  return self->_ratioOfAutoplayedVideoKeyAssets;
}

- (void)setRatioOfVideoKeyAssets:(double)a3
{
  self->_ratioOfVideoKeyAssets = a3;
}

- (double)ratioOfVideoKeyAssets
{
  return self->_ratioOfVideoKeyAssets;
}

- (void)setRatioOfAutoplayedPhotoKeyAssets:(double)a3
{
  self->_ratioOfAutoplayedPhotoKeyAssets = a3;
}

- (double)ratioOfAutoplayedPhotoKeyAssets
{
  return self->_ratioOfAutoplayedPhotoKeyAssets;
}

- (void)setRatioOfPhotoKeyAssets:(double)a3
{
  self->_ratioOfPhotoKeyAssets = a3;
}

- (double)ratioOfPhotoKeyAssets
{
  return self->_ratioOfPhotoKeyAssets;
}

- (void)setNumberOfMoments:(unint64_t)a3
{
  self->_numberOfMoments = a3;
}

- (unint64_t)numberOfMoments
{
  return self->_numberOfMoments;
}

- (void)setRatioOfDedupedAssetsInTrips:(double)a3
{
  self->_ratioOfDedupedAssetsInTrips = a3;
}

- (double)ratioOfDedupedAssetsInTrips
{
  return self->_ratioOfDedupedAssetsInTrips;
}

- (void)setRatioOfDedupedAssets:(double)a3
{
  self->_ratioOfDedupedAssets = a3;
}

- (double)ratioOfDedupedAssets
{
  return self->_ratioOfDedupedAssets;
}

- (void)setRatioOfUtilityAssetsInTrips:(double)a3
{
  self->_ratioOfUtilityAssetsInTrips = a3;
}

- (double)ratioOfUtilityAssetsInTrips
{
  return self->_ratioOfUtilityAssetsInTrips;
}

- (void)setRatioOfUtilityAssets:(double)a3
{
  self->_ratioOfUtilityAssets = a3;
}

- (double)ratioOfUtilityAssets
{
  return self->_ratioOfUtilityAssets;
}

- (void)setRatioOfCuratedAssetsInAggregations:(double)a3
{
  self->_ratioOfCuratedAssetsInAggregations = a3;
}

- (double)ratioOfCuratedAssetsInAggregations
{
  return self->_ratioOfCuratedAssetsInAggregations;
}

- (void)setRatioOfCuratedAssetsInDefaultHighlights:(double)a3
{
  self->_ratioOfCuratedAssetsInDefaultHighlights = a3;
}

- (double)ratioOfCuratedAssetsInDefaultHighlights
{
  return self->_ratioOfCuratedAssetsInDefaultHighlights;
}

- (void)setRatioOfCuratedAssetsInTrips:(double)a3
{
  self->_ratioOfCuratedAssetsInTrips = a3;
}

- (double)ratioOfCuratedAssetsInTrips
{
  return self->_ratioOfCuratedAssetsInTrips;
}

- (void)setRatioOfCuratedAssets:(double)a3
{
  self->_ratioOfCuratedAssets = a3;
}

- (double)ratioOfCuratedAssets
{
  return self->_ratioOfCuratedAssets;
}

- (void)setNumberOfCuratedAssets:(unint64_t)a3
{
  self->_numberOfCuratedAssets = a3;
}

- (unint64_t)numberOfCuratedAssets
{
  return self->_numberOfCuratedAssets;
}

- (void)setRatioOfCurated2siesAmongVisibleHighlights:(double)a3
{
  self->_ratioOfCurated2siesAmongVisibleHighlights = a3;
}

- (double)ratioOfCurated2siesAmongVisibleHighlights
{
  return self->_ratioOfCurated2siesAmongVisibleHighlights;
}

- (void)setRatioOfCurated1siesAmongVisibleHighlights:(double)a3
{
  self->_ratioOfCurated1siesAmongVisibleHighlights = a3;
}

- (double)ratioOfCurated1siesAmongVisibleHighlights
{
  return self->_ratioOfCurated1siesAmongVisibleHighlights;
}

- (void)setRatioOfHiddenDayHighlights:(double)a3
{
  self->_ratioOfHiddenDayHighlights = a3;
}

- (double)ratioOfHiddenDayHighlights
{
  return self->_ratioOfHiddenDayHighlights;
}

- (void)setNumberOfYearHighlights:(unint64_t)a3
{
  self->_numberOfYearHighlights = a3;
}

- (unint64_t)numberOfYearHighlights
{
  return self->_numberOfYearHighlights;
}

- (void)setRatioOfCuratedAssetsCoveredInMonth:(double)a3
{
  self->_ratioOfCuratedAssetsCoveredInMonth = a3;
}

- (double)ratioOfCuratedAssetsCoveredInMonth
{
  return self->_ratioOfCuratedAssetsCoveredInMonth;
}

- (void)setAverageNumberOfCuratedAssetsPerMonth:(double)a3
{
  self->_averageNumberOfCuratedAssetsPerMonth = a3;
}

- (double)averageNumberOfCuratedAssetsPerMonth
{
  return self->_averageNumberOfCuratedAssetsPerMonth;
}

- (void)setAverageNumberOfPromotedHighlightsPerMonthPastYear:(double)a3
{
  self->_averageNumberOfPromotedHighlightsPerMonthPastYear = a3;
}

- (double)averageNumberOfPromotedHighlightsPerMonthPastYear
{
  return self->_averageNumberOfPromotedHighlightsPerMonthPastYear;
}

- (void)setAverageNumberOfPromotedHighlightsPerMonth:(double)a3
{
  self->_averageNumberOfPromotedHighlightsPerMonth = a3;
}

- (double)averageNumberOfPromotedHighlightsPerMonth
{
  return self->_averageNumberOfPromotedHighlightsPerMonth;
}

- (void)setNumberOfMonthHighlights:(unint64_t)a3
{
  self->_numberOfMonthHighlights = a3;
}

- (unint64_t)numberOfMonthHighlights
{
  return self->_numberOfMonthHighlights;
}

- (void)setRatioOfGoldAssets:(double)a3
{
  self->_ratioOfGoldAssets = a3;
}

- (double)ratioOfGoldAssets
{
  return self->_ratioOfGoldAssets;
}

- (void)setRatioOfRegularGemAssets:(double)a3
{
  self->_ratioOfRegularGemAssets = a3;
}

- (double)ratioOfRegularGemAssets
{
  return self->_ratioOfRegularGemAssets;
}

- (void)setRatioOfShinyGemAssets:(double)a3
{
  self->_ratioOfShinyGemAssets = a3;
}

- (double)ratioOfShinyGemAssets
{
  return self->_ratioOfShinyGemAssets;
}

- (void)setTopTierAestheticScoreForTripKeyAsset:(double)a3
{
  self->_topTierAestheticScoreForTripKeyAsset = a3;
}

- (double)topTierAestheticScoreForTripKeyAsset
{
  return self->_topTierAestheticScoreForTripKeyAsset;
}

- (void)setTopTierAestheticScore:(double)a3
{
  self->_topTierAestheticScore = a3;
}

- (double)topTierAestheticScore
{
  return self->_topTierAestheticScore;
}

- (void)setPersonalGoodAestheticScore:(double)a3
{
  self->_personalGoodAestheticScore = a3;
}

- (double)personalGoodAestheticScore
{
  return self->_personalGoodAestheticScore;
}

- (void)setPersonalHighAestheticScore:(double)a3
{
  self->_personalHighAestheticScore = a3;
}

- (double)personalHighAestheticScore
{
  return self->_personalHighAestheticScore;
}

- (void)setRatioOfAssetsWithBetterCurationScore:(double)a3
{
  self->_ratioOfAssetsWithBetterCurationScore = a3;
}

- (double)ratioOfAssetsWithBetterCurationScore
{
  return self->_ratioOfAssetsWithBetterCurationScore;
}

- (void)setRatioOfAssetsWithImprovedCurationScore:(double)a3
{
  self->_ratioOfAssetsWithImprovedCurationScore = a3;
}

- (double)ratioOfAssetsWithImprovedCurationScore
{
  return self->_ratioOfAssetsWithImprovedCurationScore;
}

- (void)setRatioOfAssetsWithDefaultCurationScore:(double)a3
{
  self->_ratioOfAssetsWithDefaultCurationScore = a3;
}

- (double)ratioOfAssetsWithDefaultCurationScore
{
  return self->_ratioOfAssetsWithDefaultCurationScore;
}

- (void)setRatioOfAssetsWithUtilityCurationScore:(double)a3
{
  self->_ratioOfAssetsWithUtilityCurationScore = a3;
}

- (double)ratioOfAssetsWithUtilityCurationScore
{
  return self->_ratioOfAssetsWithUtilityCurationScore;
}

- (void)setRatioOfAssetsInTripHighlights:(double)a3
{
  self->_ratioOfAssetsInTripHighlights = a3;
}

- (double)ratioOfAssetsInTripHighlights
{
  return self->_ratioOfAssetsInTripHighlights;
}

- (void)setRatioOfAssetsInAggregationHighlights:(double)a3
{
  self->_ratioOfAssetsInAggregationHighlights = a3;
}

- (double)ratioOfAssetsInAggregationHighlights
{
  return self->_ratioOfAssetsInAggregationHighlights;
}

- (void)setRatioOfAssetsInDefaultHighlights:(double)a3
{
  self->_ratioOfAssetsInDefaultHighlights = a3;
}

- (double)ratioOfAssetsInDefaultHighlights
{
  return self->_ratioOfAssetsInDefaultHighlights;
}

- (void)setAverageNumberOfAssetsInTripHighlights:(double)a3
{
  self->_averageNumberOfAssetsInTripHighlights = a3;
}

- (double)averageNumberOfAssetsInTripHighlights
{
  return self->_averageNumberOfAssetsInTripHighlights;
}

- (void)setAverageNumberOfAssetsInAggregationHighlights:(double)a3
{
  self->_averageNumberOfAssetsInAggregationHighlights = a3;
}

- (double)averageNumberOfAssetsInAggregationHighlights
{
  return self->_averageNumberOfAssetsInAggregationHighlights;
}

- (void)setAverageNumberOfAssetsInDefaultHighlights:(double)a3
{
  self->_averageNumberOfAssetsInDefaultHighlights = a3;
}

- (double)averageNumberOfAssetsInDefaultHighlights
{
  return self->_averageNumberOfAssetsInDefaultHighlights;
}

- (void)setNumberOfAggregations:(unint64_t)a3
{
  self->_numberOfAggregations = a3;
}

- (unint64_t)numberOfAggregations
{
  return self->_numberOfAggregations;
}

- (void)setNumberOfLongTrips:(unint64_t)a3
{
  self->_numberOfLongTrips = a3;
}

- (unint64_t)numberOfLongTrips
{
  return self->_numberOfLongTrips;
}

- (void)setNumberOfShortTrips:(unint64_t)a3
{
  self->_numberOfShortTrips = a3;
}

- (unint64_t)numberOfShortTrips
{
  return self->_numberOfShortTrips;
}

- (void)setRatioOfDaysInAggregations:(double)a3
{
  self->_ratioOfDaysInAggregations = a3;
}

- (double)ratioOfDaysInAggregations
{
  return self->_ratioOfDaysInAggregations;
}

- (void)setRatioOfDaysInTrips:(double)a3
{
  self->_ratioOfDaysInTrips = a3;
}

- (double)ratioOfDaysInTrips
{
  return self->_ratioOfDaysInTrips;
}

- (void)setRatioOfDefaultDays:(double)a3
{
  self->_ratioOfDefaultDays = a3;
}

- (double)ratioOfDefaultDays
{
  return self->_ratioOfDefaultDays;
}

- (void)setNumberOfDaysInAggregations:(unint64_t)a3
{
  self->_numberOfDaysInAggregations = a3;
}

- (unint64_t)numberOfDaysInAggregations
{
  return self->_numberOfDaysInAggregations;
}

- (void)setNumberOfDaysInTrips:(unint64_t)a3
{
  self->_numberOfDaysInTrips = a3;
}

- (unint64_t)numberOfDaysInTrips
{
  return self->_numberOfDaysInTrips;
}

- (void)setNumberOfDefaultDayHighlights:(unint64_t)a3
{
  self->_numberOfDefaultDayHighlights = a3;
}

- (unint64_t)numberOfDefaultDayHighlights
{
  return self->_numberOfDefaultDayHighlights;
}

- (void)setNumberOfDayHighlights:(unint64_t)a3
{
  self->_numberOfDayHighlights = a3;
}

- (unint64_t)numberOfDayHighlights
{
  return self->_numberOfDayHighlights;
}

- (void)setNumberOfDaysWithPhotosInPastYear:(unint64_t)a3
{
  self->_numberOfDaysWithPhotosInPastYear = a3;
}

- (unint64_t)numberOfDaysWithPhotosInPastYear
{
  return self->_numberOfDaysWithPhotosInPastYear;
}

- (void)setLibrarySizeRange:(int64_t)a3
{
  self->_librarySizeRange = a3;
}

- (int64_t)librarySizeRange
{
  return self->_librarySizeRange;
}

- (void)setLibrarySize:(unint64_t)a3
{
  self->_librarySize = a3;
}

- (unint64_t)librarySize
{
  return self->_librarySize;
}

- (void)setManager:(id)a3
{
}

- (PGManager)manager
{
  return self->_manager;
}

- (void)setDebugDate:(id)a3
{
}

- (NSDate)debugDate
{
  return self->_debugDate;
}

- (id)_longTripDayGroups
{
  v2 = [(PGManager *)self->_manager photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type = %d", 1);
  [v3 setPredicate:v4];

  v5 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000304 options:v3];

  return v5;
}

- (id)_shortTripDayGroups
{
  v2 = [(PGManager *)self->_manager photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type = %d", 2);
  [v3 setPredicate:v4];

  v5 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000304 options:v3];

  return v5;
}

- (id)_daysWithinTrips
{
  v2 = [(PGManager *)self->_manager photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type = %d", 5);
  [v3 setPredicate:v4];

  v5 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000301 options:v3];

  return v5;
}

- (id)_aggregationGroups
{
  v2 = [(PGManager *)self->_manager photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type = %d", 3);
  [v3 setPredicate:v4];

  v5 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000304 options:v3];

  return v5;
}

- (id)_daysWithinAggregations
{
  v2 = [(PGManager *)self->_manager photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type = %d", 6);
  [v3 setPredicate:v4];

  v5 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000301 options:v3];

  return v5;
}

- (id)_defaultHighlights
{
  v2 = [(PGManager *)self->_manager photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type = %d", 0);
  [v3 setPredicate:v4];

  v5 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000301 options:v3];

  return v5;
}

- (unint64_t)_numberOfDayHighlights
{
  v2 = [(PGManager *)self->_manager photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  [v3 setShouldPrefetchCount:1];
  v4 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000301 options:v3];
  unint64_t v5 = [v4 count];

  return v5;
}

- (id)_dayHighlights
{
  v2 = [(PGManager *)self->_manager photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  v4 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000301 options:v3];

  return v4;
}

- (double)_ratioFromNumerator:(unint64_t)a3 denominator:(unint64_t)a4
{
  if (a4) {
    return (double)a3 / (double)a4;
  }
  else {
    return -1.0;
  }
}

- (id)utilityPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"curationScore <= %f", *MEMORY[0x1E4F8E750]);
}

- (id)_assetsStatisticsInHighlights:(id)a3 photoLibrary:(id)a4 includeUtility:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v7 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (![v12 isCancelledWithProgress:0.0])
  {
    v31 = v11;
    context = (void *)MEMORY[0x1D25FED50]();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v32 = v10;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v14);
          }
          v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v18 += [v21 estimatedAssetCount];
          v17 += [v21 extendedCount];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v16);
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v18 = 0;
    }

    if (v7)
    {
      id v11 = v31;
      v22 = [v31 librarySpecificFetchOptions];
      [v22 setShouldPrefetchCount:1];
      v23 = [(PGCuratedLibraryIntelligenceMetricEvent *)self utilityPredicate];
      [v22 setInternalPredicate:v23];

      [v22 setIncludeGuestAssets:1];
      v24 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollections:v14 options:v22];
      uint64_t v25 = [v24 count];
      if ([v12 isCancelledWithProgress:0.8])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v41 = 838;
          __int16 v42 = 2080;
          v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v25 = 0;
      id v11 = v31;
    }
    if (![v12 isCancelledWithProgress:1.0])
    {
      v37[0] = @"total";
      v26 = [NSNumber numberWithUnsignedInteger:v18];
      v38[0] = v26;
      v37[1] = @"curated";
      v27 = [NSNumber numberWithUnsignedInteger:v17];
      v38[1] = v27;
      v37[2] = @"utility";
      v28 = [NSNumber numberWithUnsignedInteger:v25];
      v38[2] = v28;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];

      goto LABEL_26;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v41 = 841;
      __int16 v42 = 2080;
      v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_24:
    v13 = (void *)MEMORY[0x1E4F1CC08];
LABEL_26:
    id v10 = v32;
    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v41 = 815;
    __int16 v42 = 2080;
    v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v13 = (void *)MEMORY[0x1E4F1CC08];
LABEL_27:

  return v13;
}

- (unint64_t)_debugNumberOfAssets
{
  v3 = [(PGManager *)self->_manager photoLibrary];
  v4 = [v3 librarySpecificFetchOptions];

  unint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate >= %@", self->_debugDate];
  [v4 setPredicate:v5];

  [v4 setShouldPrefetchCount:1];
  [v4 setIncludeGuestAssets:1];
  v6 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v4];
  unint64_t v7 = [v6 count];

  return v7;
}

- (id)payload
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"librarySize" integerValue:self->_librarySize payload:v3];
  v4 = [(id)objc_opt_class() librarySizeRangeDescriptionForLibrarySizeRange:self->_librarySizeRange];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"librarySizeRange" stringValue:v4 payload:v3];

  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"numberOfDaysWithPhotosInPastYear" integerValue:self->_numberOfDaysWithPhotosInPastYear payload:v3];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"numberOfDayHighlights" integerValue:self->_numberOfDayHighlights payload:v3];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"numberOfDefaultDayHighlights" integerValue:self->_numberOfDefaultDayHighlights payload:v3];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"numberOfDaysInTrips" integerValue:self->_numberOfDaysInTrips payload:v3];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"numberOfDaysInAggregations" integerValue:self->_numberOfDaysInAggregations payload:v3];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfDefaultDays" doubleValue:v3 payload:self->_ratioOfDefaultDays];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfDaysInTrips" doubleValue:v3 payload:self->_ratioOfDaysInTrips];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfDaysInAggregations" doubleValue:v3 payload:self->_ratioOfDaysInAggregations];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"numberOfAggregations" integerValue:self->_numberOfAggregations payload:v3];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"numberOfShortTrips" integerValue:self->_numberOfShortTrips payload:v3];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"numberOfLongTrips" integerValue:self->_numberOfLongTrips payload:v3];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"averageNumberOfAssetsInDefaultHighlights" doubleValue:v3 payload:self->_averageNumberOfAssetsInDefaultHighlights];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"averageNumberOfAssetsInAggregationHighlights" doubleValue:v3 payload:self->_averageNumberOfAssetsInAggregationHighlights];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"averageNumberOfAssetsInTripHighlights" doubleValue:v3 payload:self->_averageNumberOfAssetsInTripHighlights];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfHiddenDayHighlights" doubleValue:v3 payload:self->_ratioOfHiddenDayHighlights];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfAssetsInDefaultHighlights" doubleValue:v3 payload:self->_ratioOfAssetsInDefaultHighlights];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfAssetsInAggregationHighlights" doubleValue:v3 payload:self->_ratioOfAssetsInAggregationHighlights];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfAssetsInTripHighlights" doubleValue:v3 payload:self->_ratioOfAssetsInTripHighlights];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfAssetsWithUtilityCurationScore" doubleValue:v3 payload:self->_ratioOfAssetsWithUtilityCurationScore];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfAssetsWithDefaultCurationScore" doubleValue:v3 payload:self->_ratioOfAssetsWithDefaultCurationScore];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfAssetsWithImprovedCurationScore" doubleValue:v3 payload:self->_ratioOfAssetsWithImprovedCurationScore];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfAssetsWithBetterCurationScore" doubleValue:v3 payload:self->_ratioOfAssetsWithBetterCurationScore];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"personalHighAestheticScore" doubleValue:v3 payload:self->_personalHighAestheticScore];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"personalGoodAestheticScore" doubleValue:v3 payload:self->_personalGoodAestheticScore];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"topTierAestheticScore" doubleValue:v3 payload:self->_topTierAestheticScore];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"topTierAestheticScoreForTripKeyAsset" doubleValue:v3 payload:self->_topTierAestheticScoreForTripKeyAsset];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfShinyGemAssets" doubleValue:v3 payload:self->_ratioOfShinyGemAssets];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfRegularGemAssets" doubleValue:v3 payload:self->_ratioOfRegularGemAssets];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfGoldAssets" doubleValue:v3 payload:self->_ratioOfGoldAssets];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"numberOfMonthHighlights" integerValue:self->_numberOfMonthHighlights payload:v3];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"averageNumberOfPromotedHighlightsPerMonth" doubleValue:v3 payload:self->_averageNumberOfPromotedHighlightsPerMonth];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"averageNumberOfPromotedHighlightsPerMonthPastYear" doubleValue:v3 payload:self->_averageNumberOfPromotedHighlightsPerMonthPastYear];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"averageNumberOfCuratedAssetsPerMonth" doubleValue:v3 payload:self->_averageNumberOfCuratedAssetsPerMonth];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfCuratedAssetsCoveredInMonth" doubleValue:v3 payload:self->_ratioOfCuratedAssetsCoveredInMonth];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"numberOfYearHighlights" integerValue:self->_numberOfYearHighlights payload:v3];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOf1siesAmongVisibleHighlights" doubleValue:v3 payload:self->_ratioOfCurated1siesAmongVisibleHighlights];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOf2siesAmongVisibleHighlights" doubleValue:v3 payload:self->_ratioOfCurated2siesAmongVisibleHighlights];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"numberOfCuratedAssets" doubleValue:v3 payload:(double)self->_numberOfCuratedAssets];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfCuratedAssets" doubleValue:v3 payload:self->_ratioOfCuratedAssets];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfCuratedAssetsInTrips" doubleValue:v3 payload:self->_ratioOfCuratedAssetsInTrips];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfCuratedAssetsInDefaultHighlights" doubleValue:v3 payload:self->_ratioOfCuratedAssetsInDefaultHighlights];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfCuratedAssetsInAggregations" doubleValue:v3 payload:self->_ratioOfCuratedAssetsInAggregations];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfUtilityAssets" doubleValue:v3 payload:self->_ratioOfUtilityAssets];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfUtilityAssetsInTrips" doubleValue:v3 payload:self->_ratioOfUtilityAssetsInTrips];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfDedupedAssets" doubleValue:v3 payload:self->_ratioOfDedupedAssets];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfDedupedAssetsInTrips" doubleValue:v3 payload:self->_ratioOfDedupedAssetsInTrips];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"numberOfMoments" integerValue:self->_numberOfMoments payload:v3];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfPhotoKeyAssets" doubleValue:v3 payload:self->_ratioOfPhotoKeyAssets];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfVideoKeyAssets" doubleValue:v3 payload:self->_ratioOfVideoKeyAssets];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfAutoplayedPhotoKeyAssets" doubleValue:v3 payload:self->_ratioOfAutoplayedPhotoKeyAssets];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfAutoplayedVideoKeyAssets" doubleValue:v3 payload:self->_ratioOfAutoplayedVideoKeyAssets];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfProcessedScenes" doubleValue:v3 payload:self->_ratioOfProcessedScenes];
  [(PGCuratedLibraryIntelligenceMetricEvent *)self _saveKey:@"ratioOfProcessedFaces" doubleValue:v3 payload:self->_ratioOfProcessedFaces];
  return v3;
}

- (void)_saveKey:(id)a3 stringValue:(id)a4 payload:(id)a5
{
}

- (void)_saveKey:(id)a3 integerValue:(unint64_t)a4 payload:(id)a5
{
  unint64_t v7 = NSNumber;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v7 numberWithUnsignedInteger:a4];
  [v8 setObject:v10 forKeyedSubscript:v9];
}

- (void)_saveKey:(id)a3 doubleValue:(double)a4 payload:(id)a5
{
  if (*(double *)&PGMetricsUnavailableDoubleValue != a4)
  {
    unint64_t v7 = NSNumber;
    id v8 = a5;
    id v9 = a3;
    id v10 = [v7 numberWithDouble:a4];
    [v8 setObject:v10 forKeyedSubscript:v9];
  }
}

- (void)_fillProcessingLevelStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D25FED50]();
  id v9 = v7;
  if (![v9 isCancelledWithProgress:0.0])
  {
    id v10 = [(PGManager *)self->_manager photoLibrary];
    [v10 ratioOfAssetsWithFacesProcessed];
    -[PGCuratedLibraryIntelligenceMetricEvent setRatioOfProcessedFaces:](self, "setRatioOfProcessedFaces:");
    if ([v9 isCancelledWithProgress:0.5])
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_11:

        goto LABEL_12;
      }
      int v12 = 67109378;
      int v13 = 667;
      __int16 v14 = 2080;
      uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
      id v11 = MEMORY[0x1E4F14500];
    }
    else
    {
      [v10 ratioOfAssetsWithScenesProcessed];
      -[PGCuratedLibraryIntelligenceMetricEvent setRatioOfProcessedScenes:](self, "setRatioOfProcessedScenes:");
      if (![v9 isCancelledWithProgress:1.0]
        || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        goto LABEL_11;
      }
      int v12 = 67109378;
      int v13 = 669;
      __int16 v14 = 2080;
      uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
      id v11 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v12, 0x12u);
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v12 = 67109378;
    int v13 = 662;
    __int16 v14 = 2080;
    uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v12, 0x12u);
  }
LABEL_12:
}

- (void)_fillMomentsStatisticsWithGraph:(id)a3
{
  id v5 = a3;
  v4 = (void *)MEMORY[0x1D25FED50]();
  self->_numberOfMoments = [v5 numberOfMomentNodes];
}

- (void)_fillKeyAssetsStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D25FED50]();
  id v9 = v7;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  int v10 = [v9 isCancelledWithProgress:0.0];
  *((unsigned char *)v47 + 24) = v10;
  if (!v10)
  {
    id v11 = [(PGCuratedLibraryIntelligenceMetricEvent *)self _dayHighlights];
    if (*((unsigned char *)v47 + 24))
    {
      *((unsigned char *)v47 + 24) = 1;
      goto LABEL_7;
    }
    char v12 = [v9 isCancelledWithProgress:0.2];
    *((unsigned char *)v47 + 24) = v12;
    if (v12)
    {
LABEL_7:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 610;
        LOWORD(v55) = 2080;
        *(void *)((char *)&v55 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_21;
    }
    *(void *)buf = 0;
    *(void *)&long long v55 = buf;
    *((void *)&v55 + 1) = 0x2020000000;
    uint64_t v56 = 0;
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    uint64_t v45 = 0;
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0;
    uint64_t v34 = 0;
    long long v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    int v13 = [(PGManager *)self->_manager photoLibrary];
    __int16 v14 = [v13 librarySpecificFetchOptions];

    uint64_t v15 = [MEMORY[0x1E4F38EB8] fetchKeyAssetByHighlightUUIDForHighlights:v11 options:v14];
    if (*((unsigned char *)v47 + 24))
    {
      *((unsigned char *)v47 + 24) = 1;
      goto LABEL_12;
    }
    char v16 = [v9 isCancelledWithProgress:0.5];
    *((unsigned char *)v47 + 24) = v16;
    if (v16)
    {
LABEL_12:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v50 = 67109378;
        int v51 = 620;
        __int16 v52 = 2080;
        v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v50, 0x12u);
      }
      goto LABEL_20;
    }
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __94__PGCuratedLibraryIntelligenceMetricEvent__fillKeyAssetsStatisticsWithGraph_progressReporter___block_invoke;
    v27 = &unk_1E68E5D70;
    v29 = buf;
    v30 = &v38;
    v31 = &v42;
    id v32 = &v34;
    long long v33 = &v46;
    id v17 = v9;
    id v28 = v17;
    [v15 enumerateKeysAndObjectsUsingBlock:&v24];
    uint64_t v18 = v43[3] + *(void *)(v55 + 24);
    -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v24, v25, v26, v27);
    self->_ratioOfPhotoKeyAssets = v19;
    [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v39[3] denominator:v18];
    self->_ratioOfAutoplayedPhotoKeyAssets = v20;
    [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v43[3] denominator:v18];
    self->_ratioOfVideoKeyAssets = v21;
    [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v35[3] denominator:v18];
    self->_ratioOfAutoplayedVideoKeyAssets = v22;
    if (*((unsigned char *)v47 + 24))
    {
      *((unsigned char *)v47 + 24) = 1;
    }
    else
    {
      char v23 = [v17 isCancelledWithProgress:1.0];
      *((unsigned char *)v47 + 24) = v23;
      if ((v23 & 1) == 0)
      {
LABEL_19:

LABEL_20:
        _Block_object_dispose(&v34, 8);
        _Block_object_dispose(&v38, 8);
        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(buf, 8);
LABEL_21:

        goto LABEL_22;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v50 = 67109378;
      int v51 = 648;
      __int16 v52 = 2080;
      v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v50, 0x12u);
    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 607;
    LOWORD(v55) = 2080;
    *(void *)((char *)&v55 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_22:
  _Block_object_dispose(&v46, 8);
}

void __94__PGCuratedLibraryIntelligenceMetricEvent__fillKeyAssetsStatisticsWithGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  [v9 highlightVisibilityScore];
  double v5 = v4;
  if ([v9 mediaType] == 1)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v5 < 0.763358779) {
      goto LABEL_8;
    }
    uint64_t v6 = a1 + 48;
  }
  else
  {
    if ([v9 mediaType] != 2) {
      goto LABEL_8;
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v5 < 0.763358779) {
      goto LABEL_8;
    }
    uint64_t v6 = a1 + 64;
  }
  ++*(void *)(*(void *)(*(void *)v6 + 8) + 24);
LABEL_8:
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    char v8 = 1;
  }
  else
  {
    char v8 = [*(id *)(a1 + 32) isCancelledWithProgress:0.8];
    uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  }
  *(unsigned char *)(v7 + 24) = v8;
}

- (void)_fillOnesiesHighlightStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = (void *)MEMORY[0x1D25FED50]();
  id v9 = v7;
  if (![v9 isCancelledWithProgress:0.0])
  {
    int v10 = [(PGManager *)self->_manager photoLibrary];
    id v11 = [v10 librarySpecificFetchOptions];

    char v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"visibilityState == %d || visibilityState == %d", 1, 3);
    [v11 setInternalPredicate:v12];

    int v13 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:0x7FFFFFFFFFFFFFFFLL options:v11];
    if ([v9 isCancelledWithProgress:0.4])
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_30:

        goto LABEL_31;
      }
      *(_DWORD *)buf = 67109378;
      int v39 = 578;
      __int16 v40 = 2080;
      uint64_t v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
      __int16 v14 = MEMORY[0x1E4F14500];
    }
    else
    {
      v30 = v11;
      v31 = v8;
      id v32 = v6;
      uint64_t v28 = [v13 count];
      v29 = v13;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        uint64_t v20 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v34 != v20) {
              objc_enumerationMutation(v15);
            }
            double v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            char v23 = (void *)MEMORY[0x1D25FED50]();
            uint64_t v24 = [v22 extendedCount];
            if (v24 == 1) {
              uint64_t v25 = v18 + 1;
            }
            else {
              uint64_t v25 = v18;
            }
            if (v24 == 2) {
              ++v19;
            }
            else {
              uint64_t v18 = v25;
            }
            if ([v9 isCancelledWithProgress:0.8])
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v39 = 595;
                __int16 v40 = 2080;
                uint64_t v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              char v8 = v31;
              id v6 = v32;
              int v13 = v29;
              id v11 = v30;
              goto LABEL_30;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v18 = 0;
        uint64_t v19 = 0;
      }

      [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v18 denominator:v28];
      self->_ratioOfCurated1siesAmongVisibleHighlights = v26;
      [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v19 denominator:v28];
      self->_ratioOfCurated2siesAmongVisibleHighlights = v27;
      char v8 = v31;
      id v6 = v32;
      int v13 = v29;
      id v11 = v30;
      if (![v9 isCancelledWithProgress:1.0]
        || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        goto LABEL_30;
      }
      *(_DWORD *)buf = 67109378;
      int v39 = 600;
      __int16 v40 = 2080;
      uint64_t v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
      __int16 v14 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v39 = 573;
    __int16 v40 = 2080;
    uint64_t v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_31:
}

- (void)_fillHiddenHighlightsStatisticsWithGraph:(id)a3
{
  id v10 = a3;
  double v4 = (void *)MEMORY[0x1D25FED50]();
  double v5 = [(PGManager *)self->_manager photoLibrary];
  id v6 = [v5 librarySpecificFetchOptions];

  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"promotionScore < 0.25"];
  [v6 setInternalPredicate:v7];

  char v8 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000301 options:v6];
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", [v8 count], self->_numberOfDayHighlights);
  self->_ratioOfHiddenDayHighlights = v9;
}

- (void)_fillYearHighlightsStatisticsWithGraph:(id)a3
{
  id v8 = a3;
  double v4 = (void *)MEMORY[0x1D25FED50]();
  double v5 = [(PGManager *)self->_manager photoLibrary];
  id v6 = [v5 librarySpecificFetchOptions];

  id v7 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000303 options:v6];
  self->_numberOfYearHighlights = [v7 count];
}

- (void)_fillMonthHighlightsStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D25FED50]();
  id v9 = v7;
  uint64_t v48 = v9;
  if ([v9 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v60 = 493;
      __int16 v61 = 2080;
      v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    id v10 = [(PGManager *)self->_manager photoLibrary];
    id v11 = [v10 librarySpecificFetchOptions];
    char v12 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000302 options:v11];
    self->_numberOfMonthHighlights = [v12 count];
    if ([v9 isCancelledWithProgress:0.2])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v60 = 500;
        __int16 v61 = 2080;
        v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      v47 = [MEMORY[0x1E4F76C68] currentLocalDate];
      int v13 = [v10 librarySpecificFetchOptions];
      __int16 v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"visibilityState == %d || visibilityState == %d", 3, 2);
      uint64_t v46 = v13;
      [v13 setInternalPredicate:v14];

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id obj = v12;
      uint64_t v45 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      if (v45)
      {
        uint64_t v44 = *(void *)v54;
        uint64_t v41 = v8;
        id v42 = v6;
        int v39 = v11;
        __int16 v40 = v10;
        uint64_t v38 = v12;
        uint64_t v37 = self;
        while (2)
        {
          uint64_t v19 = 0;
          uint64_t v20 = v48;
          do
          {
            if (*(void *)v54 != v44) {
              objc_enumerationMutation(obj);
            }
            double v21 = *(void **)(*((void *)&v53 + 1) + 8 * v19);
            double v22 = (void *)MEMORY[0x1D25FED50]();
            char v23 = [v21 startDate];
            [v23 timeIntervalSinceDate:v47];
            double v25 = v24;

            if (v25 < 0.0) {
              double v25 = -v25;
            }
            if (v25 < 31536000.0) {
              ++v15;
            }
            double v26 = [MEMORY[0x1E4F39238] fetchChildHighlightsForHighlight:v21 options:v46];
            if ([v20 isCancelledWithProgress:0.5])
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v60 = 524;
                __int16 v61 = 2080;
                v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              id v8 = v41;
              id v6 = v42;
              id v11 = v39;
              id v10 = v40;
              char v12 = v38;
              goto LABEL_38;
            }
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            id v27 = v26;
            uint64_t v28 = [v27 countByEnumeratingWithState:&v49 objects:v57 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v50;
              do
              {
                for (uint64_t i = 0; i != v29; ++i)
                {
                  if (*(void *)v50 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  v17 += [*(id *)(*((void *)&v49 + 1) + 8 * i) extendedCount];
                }
                if (v25 >= 31536000.0) {
                  uint64_t v32 = 0;
                }
                else {
                  uint64_t v32 = v29;
                }
                v18 += v29;
                v16 += v32;
                uint64_t v29 = [v27 countByEnumeratingWithState:&v49 objects:v57 count:16];
              }
              while (v29);
            }

            uint64_t v20 = v48;
            if ([v48 isCancelledWithProgress:0.5])
            {
              id v8 = v41;
              id v6 = v42;
              id v11 = v39;
              id v10 = v40;
              char v12 = v38;
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v60 = 535;
                __int16 v61 = 2080;
                v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
LABEL_38:

              goto LABEL_39;
            }
            ++v19;
          }
          while (v19 != v45);
          id v8 = v41;
          id v6 = v42;
          id v11 = v39;
          id v10 = v40;
          char v12 = v38;
          self = v37;
          uint64_t v45 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
          if (v45) {
            continue;
          }
          break;
        }
      }

      [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v16 denominator:v15];
      self->_averageNumberOfPromotedHighlightsPerMonthPastYear = v33;
      [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v18 denominator:self->_numberOfMonthHighlights];
      self->_averageNumberOfPromotedHighlightsPerMonth = v34;
      [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v17 denominator:self->_numberOfMonthHighlights];
      self->_averageNumberOfCuratedAssetsPerMonth = v35;
      [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v17 denominator:self->_numberOfCuratedAssets];
      self->_ratioOfCuratedAssetsCoveredInMonth = v36;
      if ([v48 isCancelledWithProgress:1.0]
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v60 = 542;
        __int16 v61 = 2080;
        v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
LABEL_39:
    }
  }
}

- (void)_fillAestheticAndBehavioralCurationStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v7 isCancelledWithProgress:0.0])
  {
    id v8 = [v6 infoNode];
    [v8 personalHighAestheticsThreshold];
    self->_personalHighAestheticScore = v9;
    [v8 personalGoodAestheticsThreshold];
    self->_personalGoodAestheticScore = v10;
    [v8 topTierAestheticScore];
    self->_topTierAestheticScore = v11;
    [v8 topTierAestheticScoreForTripKeyAsset];
    self->_topTierAestheticScoreForTripKeyAsset = v12;
    int v13 = [(PGManager *)self->_manager photoLibrary];
    __int16 v14 = (void *)MEMORY[0x1D25FED50]();
    uint64_t v15 = [v13 librarySpecificFetchOptions];
    [v15 setShouldPrefetchCount:1];
    uint64_t v16 = [[PGBehavioralScoreProcessor alloc] initWithGraphManager:self->_manager algorithm:1];
    uint64_t v17 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v18 = [(PGBehavioralScoreProcessor *)v16 goldAssetUUIDs];
    uint64_t v19 = [v17 predicateWithFormat:@"uuid IN %@", v18];
    [v15 setInternalPredicate:v19];

    uint64_t v20 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v15];
    -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", [v20 count], self->_librarySize);
    self->_ratioOfGoldAssets = v21;

    if ([v7 isCancelledWithProgress:0.4])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v34 = 468;
        __int16 v35 = 2080;
        double v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
        double v22 = MEMORY[0x1E4F14500];
LABEL_13:
        _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      char v23 = (void *)MEMORY[0x1D25FED50]();
      double v24 = [v13 librarySpecificFetchOptions];
      [v24 setShouldPrefetchCount:1];
      double v25 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"computedAttributes.behavioralScore >= %f", 0x3FECCCCCC0000000);
      [v24 setInternalPredicate:v25];

      double v26 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v24];
      -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", [v26 count], self->_librarySize);
      self->_ratioOfShinyGemAssets = v27;

      if (![v7 isCancelledWithProgress:0.7])
      {
        uint64_t v28 = (void *)MEMORY[0x1D25FED50]();
        uint64_t v29 = [v13 librarySpecificFetchOptions];
        [v29 setShouldPrefetchCount:1];
        uint64_t v30 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(computedAttributes.behavioralScore < %f AND computedAttributes.behavioralScore >= %f)", 0x3FECCCCCC0000000, 0x3FE6666660000000);
        [v29 setInternalPredicate:v30];

        v31 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v29];
        -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", [v31 count], self->_librarySize);
        self->_ratioOfRegularGemAssets = v32;

        if (![v7 isCancelledWithProgress:1.0]
          || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 67109378;
        int v34 = 487;
        __int16 v35 = 2080;
        double v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
        double v22 = MEMORY[0x1E4F14500];
        goto LABEL_13;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v34 = 477;
        __int16 v35 = 2080;
        double v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
        double v22 = MEMORY[0x1E4F14500];
        goto LABEL_13;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v34 = 450;
    __int16 v35 = 2080;
    double v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_15:
}

- (void)_fillContentScoreStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v7 isCancelledWithProgress:0.0])
  {
    if (!self->_librarySize)
    {
      *(void *)&self->_ratioOfAssetsWithUtilityCurationScore = PGMetricsUnavailableDoubleValue;
      *(void *)&self->_ratioOfAssetsWithDefaultCurationScore = PGMetricsUnavailableDoubleValue;
      *(void *)&self->_ratioOfAssetsWithImprovedCurationScore = PGMetricsUnavailableDoubleValue;
      *(void *)&self->_ratioOfAssetsWithBetterCurationScore = PGMetricsUnavailableDoubleValue;
      goto LABEL_20;
    }
    id v8 = [(PGManager *)self->_manager photoLibrary];
    double v9 = [v8 librarySpecificFetchOptions];

    [v9 setIncludeGuestAssets:1];
    double v10 = (void *)MEMORY[0x1D25FED50]([v9 setShouldPrefetchCount:1]);
    uint64_t v11 = *MEMORY[0x1E4F8E740];
    double v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"curationScore < %f", *MEMORY[0x1E4F8E740]);
    [v9 setInternalPredicate:v12];

    int v13 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v9];
    uint64_t v14 = [v13 count];
    [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v14 denominator:self->_librarySize];
    self->_ratioOfAssetsWithUtilityCurationScore = v15;
    [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v14 denominator:self->_librarySize];
    self->_ratioOfUtilityAssets = v16;
    -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", self->_librarySize - self->_numberOfCuratedAssets - v14);
    self->_ratioOfDedupedAssets = v17;

    if ([v7 isCancelledWithProgress:0.2])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v34 = 415;
        __int16 v35 = 2080;
        double v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
        uint64_t v18 = MEMORY[0x1E4F14500];
LABEL_18:
        _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x1D25FED50]();
      uint64_t v20 = *MEMORY[0x1E4F8E748];
      double v21 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"curationScore >= %f AND curationScore < %f", v11, *MEMORY[0x1E4F8E748]);
      [v9 setInternalPredicate:v21];

      double v22 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v9];
      -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", [v22 count], self->_librarySize);
      self->_ratioOfAssetsWithDefaultCurationScore = v23;

      if ([v7 isCancelledWithProgress:0.5])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v34 = 425;
          __int16 v35 = 2080;
          double v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
          uint64_t v18 = MEMORY[0x1E4F14500];
          goto LABEL_18;
        }
      }
      else
      {
        double v24 = (void *)MEMORY[0x1D25FED50]();
        uint64_t v25 = *MEMORY[0x1E4F8E738];
        double v26 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"curationScore >= %f AND curationScore < %f", v20, *MEMORY[0x1E4F8E738]);
        [v9 setInternalPredicate:v26];

        double v27 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v9];
        -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", [v27 count], self->_librarySize);
        self->_ratioOfAssetsWithImprovedCurationScore = v28;

        if (![v7 isCancelledWithProgress:0.8])
        {
          uint64_t v29 = (void *)MEMORY[0x1D25FED50]();
          uint64_t v30 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"curationScore >= %f", v25);
          [v9 setInternalPredicate:v30];

          v31 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v9];
          -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", [v31 count], self->_librarySize);
          self->_ratioOfAssetsWithBetterCurationScore = v32;

          if (![v7 isCancelledWithProgress:1.0]
            || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            goto LABEL_19;
          }
          *(_DWORD *)buf = 67109378;
          int v34 = 445;
          __int16 v35 = 2080;
          double v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
          uint64_t v18 = MEMORY[0x1E4F14500];
          goto LABEL_18;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v34 = 435;
          __int16 v35 = 2080;
          double v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
          uint64_t v18 = MEMORY[0x1E4F14500];
          goto LABEL_18;
        }
      }
    }
LABEL_19:

    goto LABEL_20;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v34 = 388;
    __int16 v35 = 2080;
    double v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_20:
}

- (void)_fillDayHighlightsStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v109 = 282;
      *(_WORD *)&v109[4] = 2080;
      *(void *)&v109[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    id v104 = v6;
    uint64_t v8 = [(PGManager *)self->_manager photoLibrary];
    double v9 = [(PGManager *)self->_manager enrichmentLoggingConnection];
    double v10 = (void *)MEMORY[0x1D25FED50]();
    self->_numberOfDayHighlights = [(PGCuratedLibraryIntelligenceMetricEvent *)self _numberOfDayHighlights];
    context = (void *)MEMORY[0x1D25FED50]();
    uint64_t v11 = v9;
    os_signpost_id_t v12 = os_signpost_id_generate(v11);
    int v13 = v11;
    uint64_t v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "DayDefaultStatistics", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v98 = mach_absolute_time();
    double v15 = [(PGCuratedLibraryIntelligenceMetricEvent *)self _defaultHighlights];
    self->_numberOfDefaultDayHighlights = [v15 count];
    v106 = v7;
    double v16 = [v7 childProgressReporterFromStart:0.01 toEnd:0.09];
    v105 = (void *)v8;
    double v17 = [(PGCuratedLibraryIntelligenceMetricEvent *)self _assetsStatisticsInHighlights:v15 photoLibrary:v8 includeUtility:0 progressReporter:v16];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"total"];
    uint64_t v19 = [v18 unsignedIntegerValue];

    uint64_t v20 = [v17 objectForKeyedSubscript:@"curated"];
    uint64_t v21 = [v20 unsignedIntegerValue];

    [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v19 denominator:self->_numberOfDefaultDayHighlights];
    self->_averageNumberOfAssetsInDefaultHighlights = v22;
    [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v19 denominator:self->_librarySize];
    self->_ratioOfAssetsInDefaultHighlights = v23;
    uint64_t v96 = v21;
    [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v21 denominator:v19];
    self->_ratioOfCuratedAssetsInDefaultHighlights = v24;
    [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:self->_numberOfDefaultDayHighlights denominator:self->_numberOfDayHighlights];
    self->_ratioOfDefaultDays = v25;
    uint64_t v26 = mach_absolute_time();
    mach_timebase_info v27 = info;
    double v28 = v14;
    uint64_t v29 = v28;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v29, OS_SIGNPOST_INTERVAL_END, v12, "DayDefaultStatistics", "", buf, 2u);
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v109 = "DayDefaultStatistics";
      *(_WORD *)&v109[8] = 2048;
      *(double *)&v109[10] = (float)((float)((float)((float)(v26 - v98) * (float)v27.numer) / (float)v27.denom)
                                   / 1000000.0);
      _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    id v7 = v106;
    if ([v106 isCancelledWithProgress:0.1])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v109 = 313;
        *(_WORD *)&v109[4] = 2080;
        *(void *)&v109[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {

      uint64_t v30 = (void *)MEMORY[0x1D25FED50]();
      v31 = v29;
      os_signpost_id_t v32 = os_signpost_id_generate(v31);
      double v33 = v31;
      int v34 = v33;
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "DayAggregationsStatistics", "", buf, 2u);
      }

      mach_timebase_info info = 0;
      mach_timebase_info(&info);
      uint64_t v35 = mach_absolute_time();
      double v36 = [(PGCuratedLibraryIntelligenceMetricEvent *)self _daysWithinAggregations];
      if ([v106 isCancelledWithProgress:0.2])
      {
        int v37 = 1;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v109 = 321;
          *(_WORD *)&v109[4] = 2080;
          *(void *)&v109[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        uint64_t v38 = 0;
        char v39 = 1;
        id v7 = v106;
      }
      else
      {
        __int16 v40 = [(PGCuratedLibraryIntelligenceMetricEvent *)self _aggregationGroups];
        if ([v106 isCancelledWithProgress:0.3])
        {
          int v37 = 1;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v109 = 324;
            *(_WORD *)&v109[4] = 2080;
            *(void *)&v109[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          uint64_t v38 = 0;
          char v39 = 1;
          id v7 = v106;
        }
        else
        {
          contexta = v30;
          self->_numberOfAggregations = [v40 count];
          self->_numberOfDaysInAggregations = [v36 count];
          [v106 childProgressReporterFromStart:0.31 toEnd:0.39];
          v94 = v99 = v36;
          uint64_t v41 = -[PGCuratedLibraryIntelligenceMetricEvent _assetsStatisticsInHighlights:photoLibrary:includeUtility:progressReporter:](self, "_assetsStatisticsInHighlights:photoLibrary:includeUtility:progressReporter:", v36, v105, 0);
          id v42 = [v41 objectForKeyedSubscript:@"total"];
          uint64_t v43 = [v42 unsignedIntegerValue];

          v92 = v41;
          uint64_t v44 = [v41 objectForKeyedSubscript:@"curated"];
          uint64_t v45 = [v44 unsignedIntegerValue];

          [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v43 denominator:self->_numberOfAggregations];
          self->_averageNumberOfAssetsInAggregationHighlights = v46;
          [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v43 denominator:self->_librarySize];
          self->_ratioOfAssetsInAggregationHighlights = v47;
          [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v45 denominator:v43];
          self->_ratioOfCuratedAssetsInAggregations = v48;
          [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:self->_numberOfDaysInAggregations denominator:self->_numberOfDayHighlights];
          self->_ratioOfDaysInAggregations = v49;
          uint64_t v50 = mach_absolute_time();
          uint32_t numer = info.numer;
          uint32_t denom = info.denom;
          long long v53 = v34;
          long long v54 = v53;
          if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v54, OS_SIGNPOST_INTERVAL_END, v32, "DayAggregationsStatistics", "", buf, 2u);
          }

          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)v109 = "DayAggregationsStatistics";
            *(_WORD *)&v109[8] = 2048;
            *(double *)&v109[10] = (float)((float)((float)((float)(v50 - v35) * (float)numer) / (float)denom) / 1000000.0);
            _os_log_impl(&dword_1D1805000, v54, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }
          id v7 = v106;
          int v55 = [v106 isCancelledWithProgress:0.4];
          char v39 = v55;
          uint64_t v38 = v45;
          double v36 = v99;
          if (v55)
          {
            int v37 = 1;
            uint64_t v30 = contexta;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v109 = 340;
              *(_WORD *)&v109[4] = 2080;
              *(void *)&v109[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
          else
          {
            int v37 = 0;
            uint64_t v30 = contexta;
          }
        }
      }

      if (!v37)
      {
        contextb = (void *)MEMORY[0x1D25FED50]();
        long long v56 = v34;
        os_signpost_id_t v57 = os_signpost_id_generate(v56);
        v58 = v56;
        v59 = v58;
        if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v59, OS_SIGNPOST_INTERVAL_BEGIN, v57, "TripsStatistics", "", buf, 2u);
        }

        mach_timebase_info info = 0;
        mach_timebase_info(&info);
        uint64_t v60 = mach_absolute_time();
        uint64_t v61 = [(PGCuratedLibraryIntelligenceMetricEvent *)self _daysWithinTrips];
        v100 = (void *)v61;
        if ((v39 & 1) != 0 || (v62 = (void *)v61, [v106 isCancelledWithProgress:0.5]))
        {
          int v63 = 1;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v109 = 348;
            *(_WORD *)&v109[4] = 2080;
            *(void *)&v109[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          uint64_t v64 = 0;
          char v65 = 1;
          id v7 = v106;
        }
        else
        {
          v66 = [(PGCuratedLibraryIntelligenceMetricEvent *)self _shortTripDayGroups];
          if ([v106 isCancelledWithProgress:0.6])
          {
            int v63 = 1;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v109 = 351;
              *(_WORD *)&v109[4] = 2080;
              *(void *)&v109[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            uint64_t v64 = 0;
            char v65 = 1;
            id v7 = v106;
          }
          else
          {
            spid = v66;
            v67 = [(PGCuratedLibraryIntelligenceMetricEvent *)self _longTripDayGroups];
            if ([v106 isCancelledWithProgress:0.7])
            {
              int v63 = 1;
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v109 = 354;
                *(_WORD *)&v109[4] = 2080;
                *(void *)&v109[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              uint64_t v64 = 0;
              char v65 = 1;
              id v7 = v106;
            }
            else
            {
              uint64_t v89 = v60;
              uint64_t v95 = v38;
              self->_numberOfShortTrips = [spid count];
              v93 = v67;
              unint64_t v68 = [v67 count];
              self->_numberOfLongTrips = v68;
              unint64_t v69 = self->_numberOfShortTrips + v68;
              self->_numberOfDaysInTrips = [v62 count];
              v91 = [v106 childProgressReporterFromStart:0.71 toEnd:0.79];
              v70 = -[PGCuratedLibraryIntelligenceMetricEvent _assetsStatisticsInHighlights:photoLibrary:includeUtility:progressReporter:](self, "_assetsStatisticsInHighlights:photoLibrary:includeUtility:progressReporter:", v62, v105, 0);
              v71 = [v70 objectForKeyedSubscript:@"total"];
              uint64_t v72 = [v71 unsignedIntegerValue];

              [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v72 denominator:v69];
              self->_averageNumberOfAssetsInTripHighlights = v73;
              [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v72 denominator:self->_librarySize];
              self->_ratioOfAssetsInTripHighlights = v74;
              v75 = [v70 objectForKeyedSubscript:@"curated"];
              uint64_t v64 = [v75 unsignedIntegerValue];

              [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v64 denominator:v72];
              self->_ratioOfCuratedAssetsInTrips = v76;
              v90 = v70;
              v77 = [v70 objectForKeyedSubscript:@"utility"];
              uint64_t v78 = [v77 unsignedIntegerValue];

              [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v78 denominator:v72];
              self->_ratioOfUtilityAssetsInTrips = v79;
              [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:v72 - (v64 + v78) denominator:v72];
              self->_ratioOfDedupedAssetsInTrips = v80;
              [(PGCuratedLibraryIntelligenceMetricEvent *)self _ratioFromNumerator:self->_numberOfDaysInTrips denominator:self->_numberOfDayHighlights];
              self->_ratioOfDaysInTrips = v81;
              uint64_t v82 = mach_absolute_time();
              uint32_t v84 = info.numer;
              uint32_t v83 = info.denom;
              v85 = v59;
              v86 = v85;
              if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1D1805000, v86, OS_SIGNPOST_INTERVAL_END, v57, "TripsStatistics", "", buf, 2u);
              }

              if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)v109 = "TripsStatistics";
                *(_WORD *)&v109[8] = 2048;
                *(double *)&v109[10] = (float)((float)((float)((float)(v82 - v89) * (float)v84) / (float)v83) / 1000000.0);
                _os_log_impl(&dword_1D1805000, v86, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
              }
              id v7 = v106;
              int v87 = [v106 isCancelledWithProgress:0.8];
              char v65 = v87;
              uint64_t v38 = v95;
              if (v87)
              {
                int v63 = 1;
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v109 = 376;
                  *(_WORD *)&v109[4] = 2080;
                  *(void *)&v109[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
              }
              else
              {
                int v63 = 0;
              }

              v67 = v93;
            }

            v66 = spid;
          }
        }
        if (!v63)
        {
          self->_numberOfCuratedAssets = v38 + v96 + v64;
          -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:");
          self->_ratioOfCuratedAssets = v88;
          if (((v65 & 1) != 0 || [v7 isCancelledWithProgress:1.0])
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v109 = 383;
            *(_WORD *)&v109[4] = 2080;
            *(void *)&v109[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    id v6 = v104;
  }
}

- (void)_fillGenericStatisticsWithGraph:(id)a3
{
  id v13 = a3;
  double v4 = (void *)MEMORY[0x1D25FED50]();
  double v5 = [v13 infoNode];
  self->_librarySize = [v5 numberOfAssets];

  self->_librarySizeRange = [v13 librarySizeRange];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [MEMORY[0x1E4F76C68] dateByAddingDays:-365 toDate:v6];
  uint64_t v8 = [MEMORY[0x1E4F76C68] startOfDayForDate:v7];

  double v9 = [(PGManager *)self->_manager photoLibrary];
  double v10 = [v9 librarySpecificFetchOptions];

  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"startDate >= %@", v8];
  [v10 setPredicate:v11];

  [v10 setShouldPrefetchCount:1];
  os_signpost_id_t v12 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000301 options:v10];
  self->_numberOfDaysWithPhotosInPastYear = [v12 count];
}

- (void)gatherMetricsWithProgressBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(PGManager *)self->_manager enrichmentLoggingConnection];
  manager = self->_manager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PGCuratedLibraryIntelligenceMetricEvent_gatherMetricsWithProgressBlock___block_invoke;
  v9[3] = &unk_1E68F17B0;
  uint64_t v11 = self;
  id v12 = v4;
  id v10 = v5;
  id v7 = v5;
  id v8 = v4;
  [(PGManager *)manager performSynchronousConcurrentGraphReadUsingBlock:v9];
}

void __74__PGCuratedLibraryIntelligenceMetricEvent_gatherMetricsWithProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v199 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:*(void *)(a1 + 48)];
  if ([v4 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v198 = 168;
      *(_WORD *)&v198[4] = 2080;
      *(void *)&v198[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    double v5 = [v3 graph];
    id v6 = *(id *)(a1 + 32);
    os_signpost_id_t v7 = os_signpost_id_generate(v6);
    id v8 = v6;
    double v9 = v8;
    unint64_t v183 = v7 - 1;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CuratedLibraryIntelligenceMetrics", "", buf, 2u);
    }
    os_signpost_id_t spid = v7;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v182 = mach_absolute_time();
    id v10 = +[PGLogging sharedLogging];
    uint64_t v11 = [v10 loggingConnection];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsGeneric", buf, 2u);
    }
    v184 = v9;

    id v12 = *(id *)(a1 + 32);
    os_signpost_id_t v13 = os_signpost_id_generate(v12);
    uint64_t v14 = v12;
    double v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CuratedLibraryIntelligenceMetricsGeneric", "", buf, 2u);
    }

    mach_timebase_info v195 = 0;
    mach_timebase_info(&v195);
    uint64_t v16 = mach_absolute_time();
    [*(id *)(a1 + 40) _fillGenericStatisticsWithGraph:v5];
    uint64_t v17 = mach_absolute_time();
    mach_timebase_info v18 = v195;
    uint64_t v19 = v15;
    uint64_t v20 = v19;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_END, v13, "CuratedLibraryIntelligenceMetricsGeneric", "", buf, 2u);
    }

    uint64_t v21 = v20;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v198 = "CuratedLibraryIntelligenceMetricsGeneric";
      *(_WORD *)&v198[8] = 2048;
      *(double *)&v198[10] = (float)((float)((float)((float)(v17 - v16) * (float)v18.numer) / (float)v18.denom)
                                   / 1000000.0);
      _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    if ([v4 isCancelledWithProgress:0.1])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v198 = 178;
        *(_WORD *)&v198[4] = 2080;
        *(void *)&v198[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      double v22 = +[PGLogging sharedLogging];
      double v23 = [v22 loggingConnection];

      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsProcessingLevels", buf, 2u);
      }

      double v24 = *(id *)(a1 + 32);
      os_signpost_id_t v25 = os_signpost_id_generate(v24);
      uint64_t v26 = v24;
      mach_timebase_info v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "CuratedLibraryIntelligenceMetricsProcessingLevels", "", buf, 2u);
      }

      mach_timebase_info v194 = 0;
      mach_timebase_info(&v194);
      uint64_t v28 = mach_absolute_time();
      uint64_t v29 = [v4 childProgressReporterFromStart:0.11 toEnd:0.19];
      [*(id *)(a1 + 40) _fillProcessingLevelStatisticsWithGraph:v5 progressReporter:v29];
      if ([v4 isCancelledWithProgress:0.2])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v198 = 185;
          *(_WORD *)&v198[4] = 2080;
          *(void *)&v198[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
      else
      {
        v179 = v29;
        uint64_t v30 = mach_absolute_time();
        uint32_t numer = v194.numer;
        uint32_t denom = v194.denom;
        v180 = v27;
        double v33 = v27;
        int v34 = v33;
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v34, OS_SIGNPOST_INTERVAL_END, v25, "CuratedLibraryIntelligenceMetricsProcessingLevels", "", buf, 2u);
        }

        uint64_t v35 = v34;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)v198 = "CuratedLibraryIntelligenceMetricsProcessingLevels";
          *(_WORD *)&v198[8] = 2048;
          *(double *)&v198[10] = (float)((float)((float)((float)(v30 - v28) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        double v36 = +[PGLogging sharedLogging];
        int v37 = [v36 loggingConnection];

        mach_timebase_info v27 = v180;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsDayHighlights", buf, 2u);
        }

        uint64_t v38 = *(id *)(a1 + 32);
        os_signpost_id_t v39 = os_signpost_id_generate(v38);
        __int16 v40 = v38;
        uint64_t v41 = v40;
        if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "CuratedLibraryIntelligenceMetricsDayHighlights", "", buf, 2u);
        }

        mach_timebase_info v193 = 0;
        mach_timebase_info(&v193);
        uint64_t v42 = mach_absolute_time();
        v177 = [v4 childProgressReporterFromStart:0.21 toEnd:0.29];
        objc_msgSend(*(id *)(a1 + 40), "_fillDayHighlightsStatisticsWithGraph:progressReporter:", v5);
        v178 = v41;
        if ([v4 isCancelledWithProgress:0.3])
        {
          uint64_t v29 = v179;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v198 = 193;
            *(_WORD *)&v198[4] = 2080;
            *(void *)&v198[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else
        {
          v176 = v5;
          uint64_t v43 = mach_absolute_time();
          uint32_t v45 = v193.numer;
          uint32_t v44 = v193.denom;
          double v46 = v41;
          double v47 = v46;
          if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v47, OS_SIGNPOST_INTERVAL_END, v39, "CuratedLibraryIntelligenceMetricsDayHighlights", "", buf, 2u);
          }

          double v48 = v47;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)v198 = "CuratedLibraryIntelligenceMetricsDayHighlights";
            *(_WORD *)&v198[8] = 2048;
            *(double *)&v198[10] = (float)((float)((float)((float)(v43 - v42) * (float)v45) / (float)v44) / 1000000.0);
            _os_log_impl(&dword_1D1805000, v48, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }

          double v49 = +[PGLogging sharedLogging];
          uint64_t v50 = [v49 loggingConnection];

          mach_timebase_info v27 = v180;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1805000, v50, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsContentScore", buf, 2u);
          }

          long long v51 = *(id *)(a1 + 32);
          os_signpost_id_t v52 = os_signpost_id_generate(v51);
          long long v53 = v51;
          long long v54 = v53;
          double v5 = v176;
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v52, "CuratedLibraryIntelligenceMetricsContentScore", "", buf, 2u);
          }

          mach_timebase_info v192 = 0;
          mach_timebase_info(&v192);
          uint64_t v55 = mach_absolute_time();
          v174 = [v4 childProgressReporterFromStart:0.31 toEnd:0.39];
          objc_msgSend(*(id *)(a1 + 40), "_fillContentScoreStatisticsWithGraph:progressReporter:", v176);
          v175 = v54;
          if ([v4 isCancelledWithProgress:0.4])
          {
            uint64_t v29 = v179;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v198 = 201;
              *(_WORD *)&v198[4] = 2080;
              *(void *)&v198[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
          else
          {
            uint64_t v172 = mach_absolute_time();
            uint32_t v57 = v192.numer;
            uint32_t v56 = v192.denom;
            v58 = v54;
            v59 = v58;
            if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1D1805000, v59, OS_SIGNPOST_INTERVAL_END, v52, "CuratedLibraryIntelligenceMetricsContentScore", "", buf, 2u);
            }

            uint64_t v60 = v59;
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)v198 = "CuratedLibraryIntelligenceMetricsContentScore";
              *(_WORD *)&v198[8] = 2048;
              *(double *)&v198[10] = (float)((float)((float)((float)(v172 - v55) * (float)v57) / (float)v56) / 1000000.0);
              _os_log_impl(&dword_1D1805000, v60, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
            }

            uint64_t v61 = +[PGLogging sharedLogging];
            v62 = [v61 loggingConnection];

            if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1805000, v62, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsAestheticAndBehavioralCuration", buf, 2u);
            }

            int v63 = *(id *)(a1 + 32);
            os_signpost_id_t v64 = os_signpost_id_generate(v63);
            char v65 = v63;
            v66 = v65;
            if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1D1805000, v66, OS_SIGNPOST_INTERVAL_BEGIN, v64, "CuratedLibraryIntelligenceMetricsAestheticAndBehavioralCuration", "", buf, 2u);
            }

            mach_timebase_info v191 = 0;
            mach_timebase_info(&v191);
            uint64_t v67 = mach_absolute_time();
            v171 = [v4 childProgressReporterFromStart:0.41 toEnd:0.49];
            objc_msgSend(*(id *)(a1 + 40), "_fillAestheticAndBehavioralCurationStatisticsWithGraph:progressReporter:", v176);
            v173 = v66;
            if ([v4 isCancelledWithProgress:0.5])
            {
              uint64_t v29 = v179;
              mach_timebase_info v27 = v180;
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v198 = 209;
                *(_WORD *)&v198[4] = 2080;
                *(void *)&v198[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
            }
            else
            {
              uint64_t v68 = mach_absolute_time();
              uint32_t v70 = v191.numer;
              uint32_t v69 = v191.denom;
              v71 = v66;
              uint64_t v72 = v71;
              if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1D1805000, v72, OS_SIGNPOST_INTERVAL_END, v64, "CuratedLibraryIntelligenceMetricsAestheticAndBehavioralCuration", "", buf, 2u);
              }

              double v73 = v72;
              if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)v198 = "CuratedLibraryIntelligenceMetricsAestheticAndBehavioralCuration";
                *(_WORD *)&v198[8] = 2048;
                *(double *)&v198[10] = (float)((float)((float)((float)(v68 - v67) * (float)v70) / (float)v69) / 1000000.0);
                _os_log_impl(&dword_1D1805000, v73, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
              }

              double v74 = +[PGLogging sharedLogging];
              v75 = [v74 loggingConnection];

              mach_timebase_info v27 = v180;
              if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1805000, v75, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsMonthHighlights", buf, 2u);
              }

              double v76 = *(id *)(a1 + 32);
              os_signpost_id_t v77 = os_signpost_id_generate(v76);
              uint64_t v78 = v76;
              double v79 = v78;
              if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1D1805000, v79, OS_SIGNPOST_INTERVAL_BEGIN, v77, "CuratedLibraryIntelligenceMetricsMonthHighlights", "", buf, 2u);
              }

              mach_timebase_info v190 = 0;
              mach_timebase_info(&v190);
              uint64_t v80 = mach_absolute_time();
              v169 = [v4 childProgressReporterFromStart:0.51 toEnd:0.59];
              objc_msgSend(*(id *)(a1 + 40), "_fillMonthHighlightsStatisticsWithGraph:progressReporter:", v176);
              v170 = v79;
              if ([v4 isCancelledWithProgress:0.6])
              {
                uint64_t v29 = v179;
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v198 = 217;
                  *(_WORD *)&v198[4] = 2080;
                  *(void *)&v198[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
              }
              else
              {
                uint64_t v167 = mach_absolute_time();
                uint32_t v82 = v190.numer;
                uint32_t v81 = v190.denom;
                uint32_t v83 = v79;
                uint32_t v84 = v83;
                if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1D1805000, v84, OS_SIGNPOST_INTERVAL_END, v77, "CuratedLibraryIntelligenceMetricsMonthHighlights", "", buf, 2u);
                }

                v85 = v84;
                if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)v198 = "CuratedLibraryIntelligenceMetricsMonthHighlights";
                  *(_WORD *)&v198[8] = 2048;
                  *(double *)&v198[10] = (float)((float)((float)((float)(v167 - v80) * (float)v82) / (float)v81)
                                               / 1000000.0);
                  _os_log_impl(&dword_1D1805000, v85, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
                }

                v86 = +[PGLogging sharedLogging];
                int v87 = [v86 loggingConnection];

                if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D1805000, v87, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsYearHighlights", buf, 2u);
                }

                double v88 = *(id *)(a1 + 32);
                os_signpost_id_t v89 = os_signpost_id_generate(v88);
                v90 = v88;
                v91 = v90;
                if (v89 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v90))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1D1805000, v91, OS_SIGNPOST_INTERVAL_BEGIN, v89, "CuratedLibraryIntelligenceMetricsYearHighlights", "", buf, 2u);
                }

                mach_timebase_info v189 = 0;
                mach_timebase_info(&v189);
                uint64_t v92 = mach_absolute_time();
                [*(id *)(a1 + 40) _fillYearHighlightsStatisticsWithGraph:v176];
                v168 = v91;
                if ([v4 isCancelledWithProgress:0.7])
                {
                  v93 = MEMORY[0x1E4F14500];
                  id v94 = MEMORY[0x1E4F14500];
                  uint64_t v29 = v179;
                  mach_timebase_info v27 = v180;
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v198 = 224;
                    *(_WORD *)&v198[4] = 2080;
                    *(void *)&v198[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
                    _os_log_impl(&dword_1D1805000, v93, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                }
                else
                {
                  uint64_t v95 = mach_absolute_time();
                  uint32_t v97 = v189.numer;
                  uint32_t v96 = v189.denom;
                  uint64_t v98 = v91;
                  v99 = v98;
                  if (v89 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v98))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1D1805000, v99, OS_SIGNPOST_INTERVAL_END, v89, "CuratedLibraryIntelligenceMetricsYearHighlights", "", buf, 2u);
                  }

                  v100 = v99;
                  if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(void *)v198 = "CuratedLibraryIntelligenceMetricsYearHighlights";
                    *(_WORD *)&v198[8] = 2048;
                    *(double *)&v198[10] = (float)((float)((float)((float)(v95 - v92) * (float)v97) / (float)v96)
                                                 / 1000000.0);
                    _os_log_impl(&dword_1D1805000, v100, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
                  }

                  v101 = +[PGLogging sharedLogging];
                  v102 = [v101 loggingConnection];

                  mach_timebase_info v27 = v180;
                  if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D1805000, v102, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsHiddenHighlights", buf, 2u);
                  }

                  v103 = *(id *)(a1 + 32);
                  os_signpost_id_t v104 = os_signpost_id_generate(v103);
                  v105 = v103;
                  v106 = v105;
                  if (v104 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v105))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1D1805000, v106, OS_SIGNPOST_INTERVAL_BEGIN, v104, "CuratedLibraryIntelligenceMetricsHiddenHighlights", "", buf, 2u);
                  }

                  mach_timebase_info v188 = 0;
                  mach_timebase_info(&v188);
                  uint64_t v165 = mach_absolute_time();
                  [*(id *)(a1 + 40) _fillHiddenHighlightsStatisticsWithGraph:v176];
                  uint64_t v107 = mach_absolute_time();
                  mach_timebase_info v108 = v188;
                  v109 = v106;
                  uint64_t v110 = v109;
                  if (v104 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1D1805000, v110, OS_SIGNPOST_INTERVAL_END, v104, "CuratedLibraryIntelligenceMetricsHiddenHighlights", "", buf, 2u);
                  }

                  v111 = v110;
                  if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(void *)v198 = "CuratedLibraryIntelligenceMetricsHiddenHighlights";
                    *(_WORD *)&v198[8] = 2048;
                    *(double *)&v198[10] = (float)((float)((float)((float)(v107 - v165) * (float)v108.numer)
                                                         / (float)v108.denom)
                                                 / 1000000.0);
                    _os_log_impl(&dword_1D1805000, v111, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
                  }
                  v166 = v111;

                  v112 = +[PGLogging sharedLogging];
                  v113 = [v112 loggingConnection];

                  if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D1805000, v113, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsOnesieHighlights", buf, 2u);
                  }

                  v114 = *(id *)(a1 + 32);
                  os_signpost_id_t v115 = os_signpost_id_generate(v114);
                  v116 = v114;
                  v117 = v116;
                  if (v115 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v116))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1D1805000, v117, OS_SIGNPOST_INTERVAL_BEGIN, v115, "CuratedLibraryIntelligenceMetricsOnesieHighlights", "", buf, 2u);
                  }

                  mach_timebase_info v187 = 0;
                  mach_timebase_info(&v187);
                  uint64_t v118 = mach_absolute_time();
                  v163 = [v4 childProgressReporterFromStart:0.71 toEnd:0.79];
                  objc_msgSend(*(id *)(a1 + 40), "_fillOnesiesHighlightStatisticsWithGraph:progressReporter:", v176);
                  v164 = v117;
                  if ([v4 isCancelledWithProgress:0.8])
                  {
                    v119 = MEMORY[0x1E4F14500];
                    id v120 = MEMORY[0x1E4F14500];
                    double v9 = v184;
                    uint64_t v29 = v179;
                    v93 = v166;
                    if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v198 = 238;
                      *(_WORD *)&v198[4] = 2080;
                      *(void *)&v198[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
                      _os_log_impl(&dword_1D1805000, v119, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }
                  }
                  else
                  {
                    uint64_t v161 = mach_absolute_time();
                    uint32_t v122 = v187.numer;
                    uint32_t v121 = v187.denom;
                    v123 = v117;
                    v124 = v123;
                    if (v115 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v123))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl(&dword_1D1805000, v124, OS_SIGNPOST_INTERVAL_END, v115, "CuratedLibraryIntelligenceMetricsOnesieHighlights", "", buf, 2u);
                    }

                    v125 = v124;
                    if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 136315394;
                      *(void *)v198 = "CuratedLibraryIntelligenceMetricsOnesieHighlights";
                      *(_WORD *)&v198[8] = 2048;
                      *(double *)&v198[10] = (float)((float)((float)((float)(v161 - v118) * (float)v122) / (float)v121)
                                                   / 1000000.0);
                      _os_log_impl(&dword_1D1805000, v125, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
                    }

                    v126 = +[PGLogging sharedLogging];
                    v127 = [v126 loggingConnection];

                    if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1D1805000, v127, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsMoments", buf, 2u);
                    }

                    v128 = *(id *)(a1 + 32);
                    os_signpost_id_t v129 = os_signpost_id_generate(v128);
                    v130 = v128;
                    v131 = v130;
                    if (v129 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v130))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl(&dword_1D1805000, v131, OS_SIGNPOST_INTERVAL_BEGIN, v129, "CuratedLibraryIntelligenceMetricsMoments", "", buf, 2u);
                    }

                    mach_timebase_info v186 = 0;
                    mach_timebase_info(&v186);
                    uint64_t v132 = mach_absolute_time();
                    [*(id *)(a1 + 40) _fillMomentsStatisticsWithGraph:v176];
                    v162 = v131;
                    if ([v4 isCancelledWithProgress:0.9])
                    {
                      v133 = MEMORY[0x1E4F14500];
                      id v134 = MEMORY[0x1E4F14500];
                      double v9 = v184;
                      uint64_t v29 = v179;
                      mach_timebase_info v27 = v180;
                      v93 = v166;
                      if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v198 = 245;
                        *(_WORD *)&v198[4] = 2080;
                        *(void *)&v198[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysi"
                                              "s/PhotosGraph/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
                        _os_log_impl(&dword_1D1805000, v133, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }
                    }
                    else
                    {
                      uint64_t v135 = mach_absolute_time();
                      uint32_t v137 = v186.numer;
                      uint32_t v136 = v186.denom;
                      v138 = v131;
                      v139 = v138;
                      if (v129 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v138))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1D1805000, v139, OS_SIGNPOST_INTERVAL_END, v129, "CuratedLibraryIntelligenceMetricsMoments", "", buf, 2u);
                      }

                      v140 = v139;
                      if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315394;
                        *(void *)v198 = "CuratedLibraryIntelligenceMetricsMoments";
                        *(_WORD *)&v198[8] = 2048;
                        *(double *)&v198[10] = (float)((float)((float)((float)(v135 - v132) * (float)v137) / (float)v136)
                                                     / 1000000.0);
                        _os_log_impl(&dword_1D1805000, v140, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
                      }

                      v141 = +[PGLogging sharedLogging];
                      v142 = [v141 loggingConnection];

                      mach_timebase_info v27 = v180;
                      if (os_log_type_enabled(v142, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1D1805000, v142, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsKeyAssets", buf, 2u);
                      }

                      v143 = *(id *)(a1 + 32);
                      os_signpost_id_t v144 = os_signpost_id_generate(v143);
                      v145 = v143;
                      v146 = v145;
                      if (v144 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v145))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1D1805000, v146, OS_SIGNPOST_INTERVAL_BEGIN, v144, "CuratedLibraryIntelligenceMetricsKeyAssets", "", buf, 2u);
                      }

                      mach_timebase_info v185 = 0;
                      mach_timebase_info(&v185);
                      uint64_t v159 = mach_absolute_time();
                      v160 = [v4 childProgressReporterFromStart:0.91 toEnd:0.99];
                      objc_msgSend(*(id *)(a1 + 40), "_fillKeyAssetsStatisticsWithGraph:progressReporter:", v176);
                      uint64_t v147 = mach_absolute_time();
                      mach_timebase_info v148 = v185;
                      v149 = v146;
                      v150 = v149;
                      if (v144 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v149))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1D1805000, v150, OS_SIGNPOST_INTERVAL_END, v144, "CuratedLibraryIntelligenceMetricsKeyAssets", "", buf, 2u);
                      }

                      v133 = v150;
                      if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315394;
                        *(void *)v198 = "CuratedLibraryIntelligenceMetricsKeyAssets";
                        *(_WORD *)&v198[8] = 2048;
                        *(double *)&v198[10] = (float)((float)((float)((float)(v147 - v159) * (float)v148.numer)
                                                             / (float)v148.denom)
                                                     / 1000000.0);
                        _os_log_impl(&dword_1D1805000, v133, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
                      }

                      uint64_t v151 = mach_absolute_time();
                      uint32_t v153 = info.numer;
                      uint32_t v152 = info.denom;
                      double v9 = v184;
                      v154 = v184;
                      v155 = v154;
                      if (v183 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v154))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1D1805000, v155, OS_SIGNPOST_INTERVAL_END, spid, "CuratedLibraryIntelligenceMetrics", "", buf, 2u);
                      }

                      v156 = v155;
                      if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315394;
                        *(void *)v198 = "CuratedLibraryIntelligenceMetrics";
                        *(_WORD *)&v198[8] = 2048;
                        *(double *)&v198[10] = (float)((float)((float)((float)(v151 - v182) * (float)v153) / (float)v152)
                                                     / 1000000.0);
                        _os_log_impl(&dword_1D1805000, v156, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
                      }

                      v93 = v166;
                      if ([v4 isCancelledWithProgress:1.0])
                      {
                        v157 = MEMORY[0x1E4F14500];
                        id v158 = MEMORY[0x1E4F14500];
                        if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 67109378;
                          *(_DWORD *)v198 = 256;
                          *(_WORD *)&v198[4] = 2080;
                          *(void *)&v198[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanaly"
                                                "sis/PhotosGraph/Framework/Metrics/MetricEvents/PGCuratedLibraryIntellige"
                                                "nceMetricEvent.m";
                          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                        }
                      }
                      uint64_t v29 = v179;
                    }

                    v119 = v162;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (BOOL)shouldReportMetrics
{
  return [(PGManager *)self->_manager isReady];
}

- (id)identifier
{
  return @"com.apple.Photos.CuratedLibraryIntelligence";
}

- (PGCuratedLibraryIntelligenceMetricEvent)initWithGraphManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGCuratedLibraryIntelligenceMetricEvent;
  id v6 = [(PGCuratedLibraryIntelligenceMetricEvent *)&v11 init];
  os_signpost_id_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1559088000.0];
    debugDate = v7->_debugDate;
    v7->_debugDate = (NSDate *)v8;
  }
  return v7;
}

+ (id)librarySizeRangeDescriptionForLibrarySizeRange:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
  {
    id v4 = @"Unknown";
  }
  else
  {
    id v4 = *off_1E68E5D90[a3];
  }
  return v4;
}

@end