@interface PGGraph
+ (BOOL)graphExistsAtURL:(id)a3;
+ (BOOL)graphExistsWithName:(id)a3 parentDirectoryURL:(id)a4;
+ (PGGraph)graphWithVisualString:(id)a3 error:(id *)a4;
+ (id)_closestRelationshipEdgeLabelForPersonNode:(id)a3 andOtherPersonNode:(id)a4;
+ (id)_findParentMeaningLabelForMeaningLabel:(id)a3 inTree:(id)a4 currentParent:(id)a5;
+ (id)_graphNodePOILabelByPlaceType;
+ (id)_meaningLabelTree;
+ (id)_personClosestToMeBetweenPersonNode:(id)a3 andOtherPersonNode:(id)a4;
+ (id)allMeaningfulMeanings;
+ (id)assetPropertySetsForIngest;
+ (id)availableInferredMeaningLabels;
+ (id)defaultMatchingSortDescriptors;
+ (id)defaultSpecification;
+ (id)frequentMeaningLabels;
+ (id)graphURLForName:(id)a3 parentDirectoryURL:(id)a4;
+ (id)lessMeaningfulMeanings;
+ (id)matchingBlockedSceneLabels;
+ (id)matchingWeightToDictionary;
+ (id)meaningLabelForMeaning:(unint64_t)a3;
+ (id)mostSignificantMeaningLabels;
+ (id)parentMeaningLabelForMeaningLabel:(id)a3;
+ (id)poiLabelForPOIType:(id)a3;
+ (id)preciseMeaningNodeForMeaningLabel:(id)a3 meaningfulEvent:(id)a4;
+ (id)socialGroupMemberSortDescriptorForSocialGroupNode:(id)a3;
+ (id)stellarMeanings;
+ (id)veryMeaningfulMeanings;
+ (int64_t)librarySizeRangeForNumberOfAssets:(unint64_t)a3;
+ (unint64_t)meaningForMeaningLabel:(id)a3;
+ (void)_traverseMeaningLabelsInTree:(id)a3 usingBlock:(id)a4;
+ (void)_traverseMeaningLabelsUsingBlock:(id)a3;
+ (void)traverseParentMeaningsForMeaningLabel:(id)a3 usingBlock:(id)a4;
- (BOOL)_enumerateMomentNodesForAssetCollection:(id)a3 paddingTime:(double)a4 error:(id *)a5 enumerationBlock:(id)a6;
- (BOOL)copyToURL:(id)a3;
- (BOOL)eventIsStellar:(id)a3;
- (BOOL)eventIsVeryMeaningful:(id)a3;
- (BOOL)exportMatchMomentEventResults:(id)a3 relatedType:(unint64_t)a4 focusOnNodes:(id)a5 toFileURL:(id)a6 error:(id *)a7;
- (BOOL)hasSocialGroups;
- (BOOL)isBestPairSocialGroup:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isOnGraphQueue;
- (BOOL)isPairSocialGroup:(id)a3;
- (BOOL)isSharedLibraryEnabled;
- (BOOL)isSocialGroupEligible:(unint64_t)a3 longevity:(float)a4;
- (BOOL)saveToURL:(id)a3;
- (BOOL)singlePersonBelongsToSocialGroupOfMaxSize:(id)a3 groups:(id)a4 maxSize:(unint64_t)a5;
- (BOOL)singlePersonGroupIsInSocialGroups:(id)a3 groups:(id)a4;
- (NSDateFormatter)dateFormatter;
- (NSDictionary)zeroKeywordMappingByMeaningLabel;
- (NSSet)musicSessions;
- (NSSet)supersets;
- (OS_dispatch_queue)graphQueue;
- (PGGraph)initWithSpecification:(id)a3;
- (PGGraph)initWithURL:(id)a3 persistenceOptions:(int64_t)a4 error:(id *)a5;
- (PGGraphInfoNode)infoNode;
- (PGGraphLocationCityNodeCollection)supersetCityNodes;
- (PGGraphLocationCountryNodeCollection)supersetCountryNodes;
- (PGGraphLocationCountyNodeCollection)supersetCountyNodes;
- (PGGraphLocationStateNodeCollection)supersetStateNodes;
- (double)_distanceForLocationLabel:(id)a3;
- (double)_scoreForPlaceSubDomain:(unsigned __int16)a3;
- (double)averageTopMomentTimes:(id)a3 numberOfMoments:(unint64_t)a4;
- (double)libraryDuration;
- (double)longevity:(id)a3;
- (double)momentsCountDistance:(id)a3 withSecondBaseGroup:(id)a4 withSubsetBias:(double)a5 withDistanceThreshold:(double)a6 withIntersectionBias:(double)a7 withKey:(id)a8;
- (double)peopleDistance:(id)a3 withSecondBaseGroup:(id)a4 threshold:(double)a5 factor:(double)a6;
- (double)relationshipScoreForPersonNode:(id)a3;
- (float)normalizeFeatureValue:(float)a3 average:(float)a4 featureValues:(id)a5 factor:(float)a6;
- (float)recencyFeature:(double)a3;
- (id)_closestLocationNodeFromAddressNode:(id)a3 toAddressNode:(id)a4;
- (id)_commonAreaNodesBetweenAddressAreaNodes:(id)a3 andAddressNode:(id)a4;
- (id)_commonAreaNodesBetweenAddressNode:(id)a3 andAddressNode:(id)a4;
- (id)_coreEventMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5;
- (id)_coreLocationMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5;
- (id)_corePlaceMatchingIdsToScoresFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5;
- (id)_coreSceneMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5;
- (id)_createZeroKeywordMappingByMeaningLabel;
- (id)_eventMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5;
- (id)_eventMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4;
- (id)_eventsFromEvents:(id)a3 withTargetDomain:(unsigned __int16)a4;
- (id)_firstLocationNodeFromAddressNode:(id)a3 inLocationNodes:(id)a4;
- (id)_fuzzyMomentLookupForMomentNode:(id)a3 inPhotoLibrary:(id)a4 error:(id *)a5;
- (id)_fuzzyMomentNodeLookupForAssetCollection:(id)a3 error:(id *)a4;
- (id)_locationMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5;
- (id)_locationMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4;
- (id)_momentNodeForAssetCollection:(id)a3 error:(id *)a4;
- (id)_momentNodesForDateComponents:(id)a3 error:(id *)a4;
- (id)_peopleMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5;
- (id)_peopleMatchingIdsToResultsFromEvent:(id)a3 options:(id)a4;
- (id)_peopleMatchingResultFromEvent:(id)a3 matchedEvent:(id)a4 presentPeopleCountForEvent:(unint64_t)a5 presentPeopleCountForMatchedEvent:(unint64_t)a6 commonPeople:(id)a7 relationshipScoreCache:(id)a8 needsKeywords:(BOOL)a9;
- (id)_peopleWithoutMe:(id)a3 focusOnNodes:(id)a4;
- (id)_personNodeIntersectingSocialGroups:(id)a3;
- (id)_placeMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5;
- (id)_placeMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4;
- (id)_previousSeasonForSeason:(id)a3;
- (id)_sceneMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5;
- (id)_sceneMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4;
- (id)_socialGroupNodeForPersonNodes:(id)a3 searchWithTolerance:(BOOL)a4;
- (id)_strictMomentLookupForMomentNode:(id)a3 inPhotoLibrary:(id)a4;
- (id)_strictMomentNodeLookupForAssetCollection:(id)a3 error:(id *)a4;
- (id)_timeMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5;
- (id)_timeMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4;
- (id)aggregationHighlightTypeNode;
- (id)aggregationNodes;
- (id)allSocialGroupsForMemberLocalIdentifier:(id)a3 options:(id)a4;
- (id)allTimeYearsNodes;
- (id)allTripNodes;
- (id)bestFittingAreaNodeFromAreaNodes:(id)a3;
- (id)bestMeaningLabelForMeaningfulEvent:(id)a3;
- (id)bestSocialGroupNodes;
- (id)businessNodes;
- (id)celebratedHolidayNodes;
- (id)celebratedHolidays;
- (id)children;
- (id)closestMomentNodeForLocalDate:(id)a3;
- (id)commonSocialGroupNodesForMemberNodes:(id)a3;
- (id)commonSocialGroupNodesForMemberNodes:(id)a3 withThreshold:(double)a4;
- (id)coworkers;
- (id)dateNodeFilterForLocalDateInterval:(id)a3;
- (id)dateNodeForLocalDate:(id)a3;
- (id)dateNodeNameWithLocalDate:(id)a3;
- (id)dateNodesForLocalDate:(id)a3;
- (id)dateNodesForLocalDateInterval:(id)a3;
- (id)dateNodesForMonth:(int64_t)a3;
- (id)dateNodesForWeekOfMonth:(int64_t)a3;
- (id)dateNodesForWeekOfYear:(int64_t)a3;
- (id)dateNodesForYear:(int64_t)a3;
- (id)dateNodesIgnoringYearForLocalDate:(id)a3;
- (id)dayHighlightNodes;
- (id)dayHighlightNodesSortedByDate;
- (id)dayNodeForDay:(int64_t)a3;
- (id)dayOfWeekNodeForDayOfWeek:(int64_t)a3;
- (id)dayOfWeekNodes;
- (id)defaultHighlightNodes;
- (id)defaultHighlightTypeNode;
- (id)eventNodeForAssetCollection:(id)a3;
- (id)familyMembers;
- (id)favoritedPersonNodesIncludingMe:(BOOL)a3;
- (id)fetchMemberNodesBySocialGroupNodeForSocialGroupNodes:(id)a3;
- (id)fetchMemberNodesBySocialGroupNodeForSocialGroups:(id)a3;
- (id)friends;
- (id)highlightForHighlightNode:(id)a3 inPhotoLibrary:(id)a4;
- (id)highlightGroupNodes;
- (id)highlightGroupNodesSortedByDate;
- (id)highlightNodeForHighlight:(id)a3;
- (id)inferMeNodeFromSocialGroups;
- (id)inferredUserLocales;
- (id)interestingAreaNodes;
- (id)interestingCityNodes;
- (id)largeFrequentLocationNodes;
- (id)localDatesForMomentNode:(id)a3;
- (id)longTripHighlightTypeNode;
- (id)longTripNodes;
- (id)mainUrbanCityNodes;
- (id)matchEvent:(id)a3 options:(id)a4;
- (id)matchEvent:(id)a3 withEvent:(id)a4 options:(id)a5;
- (id)matchPersonNodes:(id)a3 sortDescriptors:(id)a4;
- (id)maximalSocialGroupsOverlappingMemberLocalIdentifiers:(id)a3;
- (id)meNode;
- (id)meNodeCollection;
- (id)meNodeWithFallbackInferredMeNode;
- (id)meaningNodes;
- (id)meaningfulEventNodeForUUID:(id)a3;
- (id)meaningfulEvents;
- (id)meaningfulMomentNodesSortedByDate;
- (id)meaningsFromMeaningfulEvent:(id)a3;
- (id)memberLocalIdentifiersBySocialGroupUUIDWithMemberNodesBySocialGroupNode:(id)a3 shouldIncludeMeNode:(BOOL)a4 simulateMeNodeNotSet:(BOOL)a5;
- (id)momentForMomentNode:(id)a3 inPhotoLibrary:(id)a4;
- (id)momentNodeForAsset:(id)a3;
- (id)momentNodeForMoment:(id)a3;
- (id)momentNodes;
- (id)momentNodesForPersonNodes:(id)a3;
- (id)momentNodesOverlappingLocalDateInterval:(id)a3;
- (id)momentNodesSortedByDate;
- (id)momentNodesSortedByDateFromMomentNodes:(id)a3;
- (id)momentNodesWithMeaning:(unint64_t)a3;
- (id)momentsForMomentNodes:(id)a3 inPhotoLibrary:(id)a4 sortChronologically:(BOOL)a5;
- (id)momentsResultForMomentNodes:(id)a3 inPhotoLibrary:(id)a4 sortChronologically:(BOOL)a5;
- (id)monthNodeForMonth:(int64_t)a3;
- (id)musicGenreDistributionUsingTaggedGenres:(BOOL)a3;
- (id)nodeLabelForHighlightType:(unsigned __int16)a3;
- (id)onGoingTripHighlightTypeNode;
- (id)onGoingTripNodes;
- (id)parents;
- (id)partners;
- (id)personNodeForPersonLocalIdentifier:(id)a3;
- (id)personNodesForPersonLocalIdentifiers:(id)a3;
- (id)personNodesIncludingMe:(BOOL)a3;
- (id)poiNodes;
- (id)previousSeasonNodeForSeasonNode:(id)a3;
- (id)publicEventNodes;
- (id)relevantMomentNodesForSocialGroupProcessing;
- (id)sceneNodeForSceneName:(id)a3;
- (id)sceneNodesForSceneNames:(id)a3;
- (id)seasonNodeForLocalDate:(id)a3;
- (id)shortTripHighlightTypeNode;
- (id)shortTripNodes;
- (id)socialGroupMemberNodesForMemberLocalIdentifiers:(id)a3;
- (id)socialGroupNodeForMemberNodes:(id)a3;
- (id)socialGroupNodesSortedByImportance;
- (id)socialGroupsIdentifiersFromSocialGroupNodes:(id)a3 shouldIncludeMeNode:(BOOL)a4;
- (id)socialGroupsIdentifiersFromSocialGroupNodesWithMemberNodesBySocialGroupNode:(id)a3 shouldIncludeMeNode:(BOOL)a4 simulateMeNodeNotSet:(BOOL)a5;
- (id)socialGroupsOverlappingMemberLocalIdentifiers:(id)a3;
- (id)sortedSocialGroupNodesWithMomentNodes:(id)a3;
- (id)staticGraphSchema;
- (id)trips;
- (id)weekends;
- (id)yearNodeForYear:(int64_t)a3;
- (int64_t)libraryAge;
- (int64_t)librarySizeRange;
- (unint64_t)_cluePeopleForRelationships:(id)a3;
- (unint64_t)_countOfDistinctSocialGroups:(id)a3;
- (unint64_t)_peopleCountWithoutMe:(id)a3 focusOnNodes:(id)a4;
- (unint64_t)numberOfMomentNodes;
- (unint64_t)numberOfPersonNodesIncludingMe:(BOOL)a3;
- (unint64_t)numberOfSocialGroupNodes;
- (void)_checkCanRead;
- (void)_enumerateMeaningfulEventsWithMeaningLabel:(id)a3 visitedMeaningfulEvents:(id)a4 usingBlock:(id)a5;
- (void)_enumerateMomentForMomentNode:(id)a3 inPhotoLibrary:(id)a4 paddingTime:(double)a5 enumerationBlock:(id)a6;
- (void)_reportBusinessItemsWithAnalytics:(id)a3;
- (void)_reportDeviceOwnerWithAnalytics:(id)a3 photoLibrary:(id)a4 serviceManager:(id)a5;
- (void)_reportDisambiguatedLocationsWithAnalytics:(id)a3;
- (void)_reportLibraryWithAnalytics:(id)a3;
- (void)_reportMobilityWithAnalytics:(id)a3;
- (void)enableInTransactionCheck;
- (void)enumerateAreaNodesUsingBlock:(id)a3;
- (void)enumerateBusinessNodesUsingBlock:(id)a3;
- (void)enumerateCelebratedHolidayNodesUsingBlock:(id)a3;
- (void)enumerateDayHighlightNodesWithBlock:(id)a3;
- (void)enumerateHighlightGroupNodesWithBlock:(id)a3;
- (void)enumerateMeaningfulEventsWithMeaning:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateMeaningsFromMeaningfulEvent:(id)a3 usingBlock:(id)a4;
- (void)enumerateMomentNodesWithMeaning:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateMusicSessionNodesUsingBlock:(id)a3;
- (void)enumeratePeopleClustersIncludingMeNode:(BOOL)a3 socialGroupsVersion:(unint64_t)a4 singlePersonGroups:(id *)a5 withBlock:(id)a6;
- (void)enumeratePeopleClustersWithLinkage:(unint64_t)a3 threshold:(double)a4 includingMeNode:(BOOL)a5 socialGroupsVersion:(unint64_t)a6 singlePersonGroups:(id *)a7 withBlock:(id)a8;
- (void)enumeratePersonNodesIncludingMe:(BOOL)a3 withBlock:(id)a4;
- (void)enumeratePublicEventNodesUsingBlock:(id)a3;
- (void)enumerateSocialGroupsIncludingMeNode:(BOOL)a3 socialGroupsVersion:(unint64_t)a4 simulateMeNodeNotSet:(BOOL)a5 validGroupsBlock:(id)a6 invalidGroupsBlock:(id)a7 averageWeight:(float *)a8;
- (void)enumerateSocialGroupsIncludingMeNode:(BOOL)a3 validGroupsBlock:(id)a4 invalidGroupsBlock:(id)a5 averageWeight:(float *)a6;
- (void)enumerateSocialGroupsWithBlock:(id)a3 includeInvalidGroups:(BOOL)a4;
- (void)invalidateMemoryCaches;
- (void)invalidateProcessingCaches;
- (void)invalidateSupersetCaches;
- (void)reportMetricsLogsWithAnalytics:(id)a3 photoLibrary:(id)a4 serviceManager:(id)a5;
- (void)setGraphQueue:(id)a3;
@end

@implementation PGGraph

- (int64_t)libraryAge
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0x7FFFFFFFLL;
  v2 = [(PGGraph *)self allTimeYearsNodes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__PGGraph_Lookup__libraryAge__block_invoke;
  v8[3] = &unk_1E68E5F10;
  v8[4] = &v9;
  [v2 enumerateObjectsUsingBlock:v8];
  v3 = (void *)MEMORY[0x1E4F76C68];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [v3 yearFromDate:v4];

  if (v5 - v10[3] <= 1) {
    int64_t v6 = 1;
  }
  else {
    int64_t v6 = v5 - v10[3];
  }

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __29__PGGraph_Lookup__libraryAge__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 calendarUnitValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (result < v5) {
    uint64_t v5 = result;
  }
  *(void *)(v4 + 24) = v5;
  return result;
}

- (id)dayOfWeekNodeForDayOfWeek:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[PGGraphDayOfWeekNode nameForDayOfWeek:a3];
  v8 = @"name";
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  int64_t v6 = [(MAGraph *)self anyNodeForLabel:@"DayOfWeek" domain:400 properties:v5];

  return v6;
}

- (id)momentNodesOverlappingLocalDateInterval:(id)a3
{
  id v4 = a3;
  [(PGGraph *)self _checkCanRead];
  uint64_t v5 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:v4 inGraph:self];

  int64_t v6 = [v5 set];

  return v6;
}

- (id)_momentNodeForAssetCollection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(PGGraph *)self _strictMomentNodeLookupForAssetCollection:v6 error:a4];
  if (!v7)
  {
    v7 = [(PGGraph *)self _fuzzyMomentNodeLookupForAssetCollection:v6 error:a4];
  }

  return v7;
}

- (id)localDatesForMomentNode:(id)a3
{
  id v4 = a3;
  [(PGGraph *)self _checkCanRead];
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PGGraph_Lookup__localDatesForMomentNode___block_invoke;
  v8[3] = &unk_1E68ED880;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateDateNodesUsingBlock:v8];

  return v6;
}

void __43__PGGraph_Lookup__localDatesForMomentNode___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 localDate];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    v3 = v4;
  }
}

- (id)closestMomentNodeForLocalDate:(id)a3
{
  id v4 = a3;
  [(PGGraph *)self _checkCanRead];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12687;
  v25 = __Block_byref_object_dispose__12688;
  id v26 = 0;
  uint64_t v5 = [(PGGraph *)self dateNodeForLocalDate:v4];
  id v6 = [v5 collection];
  v7 = [v6 momentNodes];

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0x7FEFFFFFFFFFFFFFLL;
  if ([v7 count])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__PGGraph_Lookup__closestMomentNodeForLocalDate___block_invoke;
    v16[3] = &unk_1E68EB6C8;
    id v17 = v4;
    v18 = &v21;
    v19 = v20;
    [v7 enumerateNodesUsingBlock:v16];
    v8 = v17;
  }
  else
  {
    id v9 = [(PGGraph *)self momentNodes];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__PGGraph_Lookup__closestMomentNodeForLocalDate___block_invoke_2;
    v12[3] = &unk_1E68EB6C8;
    id v13 = v4;
    v14 = &v21;
    v15 = v20;
    [v9 enumerateNodesUsingBlock:v12];

    v8 = v13;
  }

  _Block_object_dispose(v20, 8);
  id v10 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v10;
}

void __49__PGGraph_Lookup__closestMomentNodeForLocalDate___block_invoke(void *a1, void *a2)
{
  id v10 = a2;
  id v4 = [v10 localStartDate];
  [v4 timeIntervalSinceDate:a1[4]];
  double v6 = fabs(v5);

  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (!v9 || v6 < *(double *)(*(void *)(a1[6] + 8) + 24))
  {
    objc_storeStrong(v8, a2);
    *(double *)(*(void *)(a1[6] + 8) + 24) = v6;
  }
}

void __49__PGGraph_Lookup__closestMomentNodeForLocalDate___block_invoke_2(void *a1, void *a2)
{
  id v10 = a2;
  id v4 = [v10 localStartDate];
  [v4 timeIntervalSinceDate:a1[4]];
  double v6 = fabs(v5);

  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (!v9 || v6 < *(double *)(*(void *)(a1[6] + 8) + 24))
  {
    objc_storeStrong(v8, a2);
    *(double *)(*(void *)(a1[6] + 8) + 24) = v6;
  }
}

- (id)yearNodeForYear:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"name";
  id v4 = [NSNumber numberWithInteger:a3];
  v9[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  double v6 = [(MAGraph *)self anyNodeForLabel:@"Year" domain:400 properties:v5];

  return v6;
}

- (id)monthNodeForMonth:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"name";
  id v4 = [NSNumber numberWithInteger:a3];
  v9[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  double v6 = [(MAGraph *)self anyNodeForLabel:@"Month" domain:400 properties:v5];

  return v6;
}

- (id)dayNodeForDay:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"name";
  id v4 = [NSNumber numberWithInteger:a3];
  v9[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  double v6 = [(MAGraph *)self anyNodeForLabel:@"Day" domain:400 properties:v5];

  return v6;
}

- (id)_previousSeasonForSeason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_previousSeasonForSeason__onceToken != -1) {
    dispatch_once(&_previousSeasonForSeason__onceToken, &__block_literal_global_12690);
  }
  uint64_t v4 = [(id)_previousSeasonForSeason__seasons indexOfObject:v3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_8;
  }
  if (v4) {
    [(id)_previousSeasonForSeason__seasons objectAtIndex:v4 - 1];
  }
  else {
  double v5 = [(id)_previousSeasonForSeason__seasons lastObject];
  }
  if (!v5)
  {
LABEL_8:
    double v6 = +[PGLogging sharedLogging];
    uint64_t v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "Error: could not find _previousSeasonForSeason: string %@", (uint8_t *)&v9, 0xCu);
    }

    double v5 = 0;
  }

  return v5;
}

void __44__PGGraph_Lookup___previousSeasonForSeason___block_invoke()
{
  v0 = (void *)_previousSeasonForSeason__seasons;
  _previousSeasonForSeason__seasons = (uint64_t)&unk_1F28D3B58;
}

- (id)previousSeasonNodeForSeasonNode:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 name];
  double v5 = [(PGGraph *)self _previousSeasonForSeason:v4];

  if (v5)
  {
    id v10 = @"name";
    v11[0] = v5;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v7 = [(MAGraph *)self nodesForLabel:@"Season" domain:400 properties:v6];
    v8 = [v7 anyObject];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)seasonNodeForLocalDate:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PGGraph *)self _checkCanRead];
  double v5 = [(PGGraph *)self infoNode];
  double v6 = [v5 locale];

  uint64_t v7 = [MEMORY[0x1E4F76C68] seasonNameForLocalDate:v4 locale:v6];

  if (v7)
  {
    uint64_t v12 = @"name";
    v13[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    int v9 = [(MAGraph *)self nodesForLabel:@"Season" domain:400 properties:v8];
    id v10 = [v9 anyObject];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)dateNodesForWeekOfMonth:(int64_t)a3
{
  [(PGGraph *)self _checkCanRead];
  double v5 = +[PGGraphWeekOfMonthNodeCollection weekOfMonthNodesForWeekOfMonth:a3 inGraph:self];
  double v6 = [v5 dateNodes];
  uint64_t v7 = [v6 temporarySet];

  return v7;
}

- (id)dateNodesForWeekOfYear:(int64_t)a3
{
  [(PGGraph *)self _checkCanRead];
  double v5 = +[PGGraphWeekOfYearNodeCollection weekOfYearNodesForWeekOfYear:a3 inGraph:self];
  double v6 = [v5 dateNodes];
  uint64_t v7 = [v6 temporarySet];

  return v7;
}

- (id)dateNodesForYear:(int64_t)a3
{
  [(PGGraph *)self _checkCanRead];
  double v5 = +[PGGraphYearNodeCollection yearNodesForYear:a3 inGraph:self];
  double v6 = [v5 dateNodes];
  uint64_t v7 = [v6 temporarySet];

  return v7;
}

- (id)dateNodesForMonth:(int64_t)a3
{
  id v3 = +[PGGraphMonthNodeCollection monthNodesForMonth:a3 inGraph:self];
  id v4 = [v3 dateNodes];
  double v5 = [v4 temporarySet];

  return v5;
}

- (id)dateNodesIgnoringYearForLocalDate:(id)a3
{
  id v4 = a3;
  [(PGGraph *)self _checkCanRead];
  double v5 = +[PGGraphMonthDayNodeCollection monthDayNodesForLocalDate:v4 inGraph:self];

  double v6 = [v5 dateNodes];

  return v6;
}

- (id)dateNodesForLocalDateInterval:(id)a3
{
  id v4 = [(PGGraph *)self dateNodeFilterForLocalDateInterval:a3];
  double v5 = +[MANodeCollection nodesMatchingFilter:v4 inGraph:self];

  return v5;
}

- (id)dateNodeFilterForLocalDateInterval:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v6 = [v4 startDate];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  int v9 = [v4 endDate];
  [v9 timeIntervalSince1970];
  double v11 = v10;

  while (v8 <= v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v8];
    id v13 = [(PGGraph *)self dateNodeNameWithLocalDate:v12];
    [v5 addObject:v13];

    double v8 = v8 + 86400.0;
  }
  id v14 = objc_alloc(MEMORY[0x1E4F71F00]);
  v18 = @"name";
  v19[0] = v5;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v16 = (void *)[v14 initWithLabel:@"Date" domain:400 properties:v15];

  return v16;
}

- (id)dateNodeForLocalDate:(id)a3
{
  id v4 = a3;
  [(PGGraph *)self _checkCanRead];
  id v5 = [(PGGraph *)self dateNodesForLocalDate:v4];

  double v6 = [v5 anyNode];

  return v6;
}

- (id)dateNodesForLocalDate:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PGGraph *)self _checkCanRead];
  id v5 = [(PGGraph *)self dateNodeNameWithLocalDate:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F71F00]);
  v19 = @"name";
  v20[0] = v5;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  double v8 = (void *)[v6 initWithLabel:@"Date" domain:400 properties:v7];

  int v9 = +[MANodeCollection nodesMatchingFilter:v8 inGraph:self];
  unint64_t v10 = [v9 count];
  if (v10 >= 2)
  {
    unint64_t v11 = v10;
    uint64_t v12 = +[PGLogging sharedLogging];
    id v13 = [v12 loggingConnection];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412546;
      v16 = v5;
      __int16 v17 = 2048;
      unint64_t v18 = v11;
      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "Error: too many date nodes for local date %@, count: %lu", (uint8_t *)&v15, 0x16u);
    }
  }
  return v9;
}

- (id)momentsResultForMomentNodes:(id)a3 inPhotoLibrary:(id)a4 sortChronologically:(BOOL)a5
{
  BOOL v5 = a5;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = [a4 librarySpecificFetchOptions];
  if (v5)
  {
    int v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
    v25[0] = v9;
    unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v8 setSortDescriptors:v10];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        __int16 v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "localIdentifier", (void)v20);
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  unint64_t v18 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithLocalIdentifiers:v11 options:v8];

  return v18;
}

- (id)momentsForMomentNodes:(id)a3 inPhotoLibrary:(id)a4 sortChronologically:(BOOL)a5
{
  BOOL v5 = [(PGGraph *)self momentsResultForMomentNodes:a3 inPhotoLibrary:a4 sortChronologically:a5];
  id v6 = [v5 fetchedObjects];

  return v6;
}

- (id)momentForMomentNode:(id)a3 inPhotoLibrary:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PGGraph *)self _checkCanRead];
  double v8 = [v6 localIdentifier];
  if (!v8) {
    goto LABEL_3;
  }
  int v9 = [v7 librarySpecificFetchOptions];
  [v9 setFetchLimit:1];
  unint64_t v10 = (void *)MEMORY[0x1E4F38EE8];
  v24[0] = v8;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  id v12 = [v10 fetchAssetCollectionsWithLocalIdentifiers:v11 options:v9];

  uint64_t v13 = [v12 firstObject];

  if (!v13)
  {
LABEL_3:
    uint64_t v14 = [(PGGraph *)self _strictMomentLookupForMomentNode:v6 inPhotoLibrary:v7];
    if (v14)
    {
      uint64_t v13 = (void *)v14;
      id v15 = 0;
    }
    else
    {
      id v19 = 0;
      uint64_t v13 = [(PGGraph *)self _fuzzyMomentLookupForMomentNode:v6 inPhotoLibrary:v7 error:&v19];
      id v15 = v19;
      if (!v13)
      {
        v16 = +[PGLogging sharedLogging];
        __int16 v17 = [v16 loggingConnection];

        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          long long v21 = "-[PGGraph(Lookup) momentForMomentNode:inPhotoLibrary:]";
          __int16 v22 = 2112;
          id v23 = v15;
          _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "error: %s %@", buf, 0x16u);
        }

        uint64_t v13 = 0;
      }
    }
  }
  return v13;
}

- (id)highlightForHighlightNode:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  [(PGGraph *)self _checkCanRead];
  double v8 = [v7 localIdentifier];

  if (v8)
  {
    int v9 = [v6 librarySpecificFetchOptions];
    unint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"localIdentifier == %@", v8];
    [v9 setPredicate:v10];

    [v9 setFetchLimit:1];
    id v11 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:0x7FFFFFFFFFFFFFFFLL options:v9];
    id v12 = [v11 firstObject];
    if ([v11 count] != 1)
    {
      uint64_t v13 = +[PGLogging sharedLogging];
      uint64_t v14 = [v13 loggingConnection];

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315651;
        __int16 v17 = "-[PGGraph(Lookup) highlightForHighlightNode:inPhotoLibrary:]";
        __int16 v18 = 2112;
        id v19 = v8;
        __int16 v20 = 2113;
        long long v21 = v11;
        _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "error: %s Didn't find highlight with identifier %@. %{private}@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_fuzzyMomentLookupForMomentNode:(id)a3 inPhotoLibrary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [MEMORY[0x1E4F1CA80] set];
  id v11 = (void *)MEMORY[0x1D25FED50]();
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  __int16 v18 = __72__PGGraph_Lookup___fuzzyMomentLookupForMomentNode_inPhotoLibrary_error___block_invoke;
  id v19 = &unk_1E68E5EE8;
  __int16 v20 = self;
  id v12 = v8;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  [(PGGraph *)self _enumerateMomentForMomentNode:v12 inPhotoLibrary:v9 paddingTime:&v16 enumerationBlock:10800.0];

  if ([v13 count] == 1)
  {
    a5 = [v13 anyObject];
  }
  else if (a5)
  {
    if ([v13 count]) {
      [NSString stringWithFormat:@"Event node %@ matching multiple moments", v12, v16, v17, v18, v19, v20];
    }
    else {
    uint64_t v14 = [NSString stringWithFormat:@"Event node %@ matching 0 moment", v12, v16, v17, v18, v19, v20];
    }
    *a5 = +[PGError errorWithCode:-3 description:v14];

    a5 = 0;
  }

  return a5;
}

void __72__PGGraph_Lookup___fuzzyMomentLookupForMomentNode_inPhotoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "_strictMomentNodeLookupForAssetCollection:error:");
  id v4 = v3;
  if (!v3 || [v3 isSameNodeAsNode:*(void *)(a1 + 40)]) {
    [*(id *)(a1 + 48) addObject:v5];
  }
}

- (id)_strictMomentLookupForMomentNode:(id)a3 inPhotoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__12687;
  uint64_t v16 = __Block_byref_object_dispose__12688;
  id v17 = 0;
  id v8 = (void *)MEMORY[0x1D25FED50]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __67__PGGraph_Lookup___strictMomentLookupForMomentNode_inPhotoLibrary___block_invoke;
  v11[3] = &unk_1E68E5EC0;
  v11[4] = &v12;
  [(PGGraph *)self _enumerateMomentForMomentNode:v6 inPhotoLibrary:v7 paddingTime:v11 enumerationBlock:0.001];
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __67__PGGraph_Lookup___strictMomentLookupForMomentNode_inPhotoLibrary___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)momentNodeForMoment:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PGGraph *)self _checkCanRead];
  id v5 = [v4 uuid];
  id v6 = +[PGGraphMomentNodeCollection momentNodeForUUID:v5 inGraph:self];
  id v7 = [v6 anyNode];

  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v13 = 0;
    id v7 = [(PGGraph *)self _momentNodeForAssetCollection:v4 error:&v13];
    id v8 = v13;
    if (!v7)
    {
      id v9 = +[PGLogging sharedLogging];
      unint64_t v10 = [v9 loggingConnection];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = [v4 uuid];
        *(_DWORD *)buf = 136315650;
        id v15 = "-[PGGraph(Lookup) momentNodeForMoment:]";
        __int16 v16 = 2112;
        id v17 = v12;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "%s - Can't get node for moment (%@), error:%@", buf, 0x20u);
      }
      id v7 = 0;
    }
  }

  return v7;
}

- (id)highlightNodeForHighlight:(id)a3
{
  id v4 = [a3 uuid];
  id v5 = +[PGGraphHighlightNodeCollection highlightNodeForUUID:v4 inGraph:self];
  id v6 = [v5 anyNode];

  return v6;
}

- (id)momentNodeForAsset:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PGGraph *)self _checkCanRead];
  id v5 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v4 withType:3 options:0];
  if ([v5 count] == 1)
  {
    id v6 = [v5 firstObject];
    id v7 = [(PGGraph *)self momentNodeForMoment:v6];
  }
  else
  {
    id v8 = +[PGLogging sharedLogging];
    id v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "Multiple moment for asset %@", (uint8_t *)&v11, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)eventNodeForAssetCollection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 assetCollectionType];
  if (v5 <= 0xB)
  {
    if (((1 << v5) & 0xFB7) == 0)
    {
      if (v5 == 3) {
        [(PGGraph *)self momentNodeForMoment:v4];
      }
      else {
      id v8 = [(PGGraph *)self highlightNodeForHighlight:v4];
      }
      goto LABEL_7;
    }
    id v6 = +[PGLogging sharedLogging];
    id v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Requesting event node for unsupported asset collection type: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (id)_fuzzyMomentNodeLookupForAssetCollection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = [v6 photoLibrary];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  __int16 v16 = __66__PGGraph_Lookup___fuzzyMomentNodeLookupForAssetCollection_error___block_invoke;
  id v17 = &unk_1E68E9BA0;
  id v9 = v6;
  id v18 = v9;
  id v19 = self;
  id v10 = v8;
  id v20 = v10;
  id v11 = v7;
  id v21 = v11;
  [(PGGraph *)self _enumerateMomentNodesForAssetCollection:v9 paddingTime:a4 error:&v14 enumerationBlock:10800.0];
  if (objc_msgSend(v11, "count", v14, v15, v16, v17) == 1)
  {
    uint64_t v12 = [v11 anyObject];
  }
  else if (a4)
  {
    +[PGError errorWithCode:-3 description:@"Fuzzy event find multiple events"];
    uint64_t v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void __66__PGGraph_Lookup___fuzzyMomentNodeLookupForAssetCollection_error___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)MEMORY[0x1D25FED50]();
  if ([*(id *)(a1 + 32) assetCollectionType] == 3)
  {
    id v4 = [*(id *)(a1 + 40) _strictMomentLookupForMomentNode:v5 inPhotoLibrary:*(void *)(a1 + 48)];
    if (!v4 || [*(id *)(a1 + 32) isEqual:v4]) {
      [*(id *)(a1 + 56) addObject:v5];
    }
  }
  else
  {
    [*(id *)(a1 + 56) addObject:v5];
  }
}

- (id)_strictMomentNodeLookupForAssetCollection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__12687;
  uint64_t v14 = __Block_byref_object_dispose__12688;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __67__PGGraph_Lookup___strictMomentNodeLookupForAssetCollection_error___block_invoke;
  v9[3] = &unk_1E68EB798;
  v9[4] = &v10;
  [(PGGraph *)self _enumerateMomentNodesForAssetCollection:v6 paddingTime:a4 error:v9 enumerationBlock:0.001];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __67__PGGraph_Lookup___strictMomentNodeLookupForAssetCollection_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)_momentNodesForDateComponents:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x1E4F76C68];
  id v7 = a3;
  id v8 = [v7 timeZone];
  id v9 = [v6 dateFromComponents:v7 inTimeZone:v8];

  uint64_t v10 = [(PGGraph *)self dateNodeForLocalDate:v9];
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 collection];
    uint64_t v13 = [v12 momentNodes];
LABEL_5:

    goto LABEL_6;
  }
  if (a4)
  {
    uint64_t v12 = [NSString stringWithFormat:@"%s - Cannot find node with date: %@", "-[PGGraph(Lookup) _momentNodesForDateComponents:error:]", v9];
    +[PGError errorWithCode:-3 description:v12];
    uint64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  uint64_t v13 = 0;
LABEL_6:

  return v13;
}

- (void)_enumerateMomentForMomentNode:(id)a3 inPhotoLibrary:(id)a4 paddingTime:(double)a5 enumerationBlock:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  uint64_t v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v11 = a4;
  id v12 = a3;
  [v12 timestampUTCStart];
  uint64_t v14 = [v10 dateWithTimeIntervalSince1970:v13 - a5];
  id v15 = (void *)MEMORY[0x1E4F1C9C8];
  [v12 timestampUTCEnd];
  double v17 = v16;

  id v18 = [v15 dateWithTimeIntervalSince1970:v17 + a5];
  id v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate >= %@) AND (endDate <= %@)", v14, v18];
  id v20 = [v11 librarySpecificFetchOptions];

  id v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v27[0] = v21;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [v20 setSortDescriptors:v22];

  [v20 setPredicate:v19];
  id v23 = [MEMORY[0x1E4F38EE8] fetchMomentsWithOptions:v20];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __93__PGGraph_Lookup___enumerateMomentForMomentNode_inPhotoLibrary_paddingTime_enumerationBlock___block_invoke;
  v25[3] = &unk_1E68E5E98;
  id v26 = v9;
  id v24 = v9;
  [v23 enumerateObjectsUsingBlock:v25];
}

uint64_t __93__PGGraph_Lookup___enumerateMomentForMomentNode_inPhotoLibrary_paddingTime_enumerationBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_enumerateMomentNodesForAssetCollection:(id)a3 paddingTime:(double)a4 error:(id *)a5 enumerationBlock:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  double v13 = objc_msgSend(v11, "cls_localStartDateComponents");
  if (v13)
  {
    uint64_t v14 = [(PGGraph *)self _momentNodesForDateComponents:v13 error:a5];
    id v15 = v14;
    if (v14 && [v14 count])
    {
      double v16 = objc_msgSend(v11, "cls_universalStartDate");
      [v16 timeIntervalSince1970];
      uint64_t v18 = v17;

      id v19 = objc_msgSend(v11, "cls_universalEndDate");
      [v19 timeIntervalSince1970];
      uint64_t v21 = v20;

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __94__PGGraph_Lookup___enumerateMomentNodesForAssetCollection_paddingTime_error_enumerationBlock___block_invoke;
      v25[3] = &unk_1E68E5E70;
      uint64_t v27 = v18;
      double v28 = a4;
      uint64_t v29 = v21;
      id v26 = v12;
      [v15 enumerateNodesUsingBlock:v25];

      char v22 = 1;
    }
    else
    {
      char v22 = 0;
      BOOL v6 = v15 != 0;
    }

    char v23 = v22 | v6;
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDescription:@"Couldn't get asset collection's dates"];
    char v23 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v23 = 0;
  }

  return v23 & 1;
}

void __94__PGGraph_Lookup___enumerateMomentNodesForAssetCollection_paddingTime_error_enumerationBlock___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  [v15 timestampUTCStart];
  double v4 = v3;
  [v15 timestampUTCEnd];
  double v7 = *(double *)(a1 + 40);
  double v6 = *(double *)(a1 + 48);
  double v8 = v7 - v6;
  double v9 = v7 + v6;
  if (v4 >= v8 && v4 <= v9)
  {
    double v11 = *(double *)(a1 + 56);
    double v12 = v11 - v6;
    double v13 = v6 + v11;
    if (v5 >= v12 && v5 <= v13) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (id)publicEventNodes
{
  return +[PGGraphNodeCollection nodesInGraph:self];
}

- (id)poiNodes
{
  return +[PGGraphNodeCollection nodesInGraph:self];
}

- (id)meaningNodes
{
  return +[PGGraphNodeCollection nodesInGraph:self];
}

- (id)largeFrequentLocationNodes
{
  v55[2] = *MEMORY[0x1E4F143B8];
  v2 = [(PGGraph *)self supersets];
  double v3 = [v2 allObjects];

  if ((unint64_t)[v3 count] > 2)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    double v6 = (void *)MEMORY[0x1E4F76C60];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __51__PGGraph_Conveniences__largeFrequentLocationNodes__block_invoke_2;
    v50[3] = &unk_1E68E6A48;
    v36 = v3;
    id v51 = v3;
    id v7 = v5;
    id v52 = v7;
    [v6 calculateStandardDeviationForItems:v51 valueBlock:&__block_literal_global_275 result:v50];
    double v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"numberOfMomentNodes" ascending:0];
    v55[0] = v8;
    double v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:0];
    v55[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    double v11 = [v7 sortedArrayUsingDescriptors:v10];

    double v12 = (void *)[v11 mutableCopy];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v11;
    uint64_t v40 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v40)
    {
      uint64_t v39 = *(void *)v47;
      v38 = v12;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v47 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v46 + 1) + 8 * v13);
        id v15 = objc_msgSend(v14, "collection", v36);
        double v16 = [v15 momentNodes];
        unint64_t v17 = [v16 count];

        [v12 removeObject:v14];
        if (!v17) {
          break;
        }
        uint64_t v41 = v13;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        uint64_t v18 = [v12 reverseObjectEnumerator];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v53 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v43;
          double v22 = (double)v17;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v43 != v21) {
                objc_enumerationMutation(v18);
              }
              id v24 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              if ([v7 containsObject:v24])
              {
                v25 = [v24 collection];
                id v26 = [v25 momentNodes];
                unint64_t v27 = [v26 count];

                if ((double)v27 / v22 >= 0.2) {
                  goto LABEL_21;
                }
                double v28 = [v24 universalDateInterval];
                [v28 duration];
                double v30 = v29;
                v31 = [v14 universalDateInterval];
                v32 = [v28 intersectionWithDateInterval:v31];
                [v32 duration];
                double v34 = v33;

                if (v34 / v30 >= 0.5) {
                  objc_msgSend(v7, "removeObject:", v24, v34 / v30);
                }
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v53 count:16];
          }
          while (v20);
        }
LABEL_21:

        uint64_t v13 = v41 + 1;
        double v12 = v38;
        if (v41 + 1 == v40)
        {
          uint64_t v40 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
          if (v40) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    id v4 = v7;
    double v3 = v36;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  }

  return v4;
}

void __51__PGGraph_Conveniences__largeFrequentLocationNodes__block_invoke_2(uint64_t a1, double a2, double a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v4 = ceil(a3 - a2);
  if (v4 >= 1.0) {
    double v5 = v4;
  }
  else {
    double v5 = 1.0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v12 = objc_msgSend(v11, "collection", (void)v15);
        uint64_t v13 = [v12 momentNodes];
        unint64_t v14 = [v13 count];

        if (v14 >= (unint64_t)v5) {
          [*(id *)(a1 + 40) addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

double __51__PGGraph_Conveniences__largeFrequentLocationNodes__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 collection];
  double v3 = [v2 momentNodes];
  double v4 = (double)(unint64_t)[v3 count];

  return v4;
}

- (id)sceneNodesForSceneNames:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "capitalizedString", (void)v16);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v12 = objc_alloc(MEMORY[0x1E4F71F00]);
  uint64_t v13 = (void *)[v12 initWithLabels:v5 domain:600 properties:MEMORY[0x1E4F1CC08]];
  unint64_t v14 = +[MANodeCollection nodesMatchingFilter:v13 inGraph:self];

  return v14;
}

- (id)sceneNodeForSceneName:(id)a3
{
  id v4 = [a3 capitalizedString];
  id v5 = [(MAGraph *)self anyNodeForLabel:v4 domain:600];

  return v5;
}

- (id)dayOfWeekNodes
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__PGGraph_Conveniences__dayOfWeekNodes__block_invoke;
  v6[3] = &unk_1E68E6A00;
  id v4 = v3;
  id v7 = v4;
  [(MAGraph *)self enumerateNodesWithLabel:@"DayOfWeek" domain:400 usingBlock:v6];

  return v4;
}

uint64_t __39__PGGraph_Conveniences__dayOfWeekNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumeratePublicEventNodesUsingBlock:(id)a3
{
}

- (void)enumerateBusinessNodesUsingBlock:(id)a3
{
}

- (void)enumerateAreaNodesUsingBlock:(id)a3
{
}

- (void)enumerateCelebratedHolidayNodesUsingBlock:(id)a3
{
  id v4 = a3;
  [(PGGraph *)self _checkCanRead];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PGGraph_Conveniences__enumerateCelebratedHolidayNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E68E69D8;
  id v7 = v4;
  id v5 = v4;
  [(MAGraph *)self enumerateEdgesWithLabel:@"CELEBRATING" domain:401 usingBlock:v6];
}

void __67__PGGraph_Conveniences__enumerateCelebratedHolidayNodesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a2 targetNode];
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);
}

- (id)bestFittingAreaNodeFromAreaNodes:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__17684;
  uint64_t v13 = __Block_byref_object_dispose__17685;
  id v14 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v4 = +[PGGraphEdgeCollection edgesToNodes:v3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PGGraph_Conveniences__bestFittingAreaNodeFromAreaNodes___block_invoke;
  v7[3] = &unk_1E68E69B0;
  v7[4] = v8;
  v7[5] = &v9;
  [v4 enumerateEdgesUsingBlock:v7];
  id v5 = (id)v10[5];

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __58__PGGraph_Conveniences__bestFittingAreaNodeFromAreaNodes___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 relevance];
  double v4 = v3;
  if (v3 < *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v5 = [v8 targetNode];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  }
}

- (BOOL)isSharedLibraryEnabled
{
  v2 = +[PGGraphPersonNodeCollection personNodesForSharedLibraryParticipantsInGraph:self];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (double)libraryDuration
{
  v2 = [(PGGraph *)self momentNodesSortedByDate];
  BOOL v3 = [v2 lastObject];
  double v4 = [v3 universalEndDate];
  uint64_t v5 = [v2 firstObject];
  uint64_t v6 = [v5 universalStartDate];
  [v4 timeIntervalSinceDate:v6];
  double v8 = v7;

  return v8;
}

- (id)businessNodes
{
  return [(MAGraph *)self nodesForLabel:@"Business" domain:503];
}

- (id)celebratedHolidayNodes
{
  [(PGGraph *)self _checkCanRead];
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PGGraph_Conveniences__celebratedHolidayNodes__block_invoke;
  v6[3] = &unk_1E68EF038;
  id v4 = v3;
  id v7 = v4;
  [(PGGraph *)self enumerateCelebratedHolidayNodesUsingBlock:v6];

  return v4;
}

uint64_t __47__PGGraph_Conveniences__celebratedHolidayNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)allTimeYearsNodes
{
  [(PGGraph *)self _checkCanRead];
  return [(MAGraph *)self nodesForLabel:@"Year" domain:400];
}

- (id)dateNodeNameWithLocalDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PGGraph *)self dateFormatter];
  uint64_t v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)coworkers
{
  BOOL v3 = objc_opt_new();
  id v4 = [(PGGraph *)self meNode];
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__PGGraph_Conveniences__coworkers__block_invoke;
    v6[3] = &unk_1E68E6988;
    id v7 = v3;
    [v4 enumeratePersonNodesWithRelationship:1 matchingQuery:3 usingBlock:v6];
  }
  return v3;
}

uint64_t __34__PGGraph_Conveniences__coworkers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)friends
{
  BOOL v3 = objc_opt_new();
  id v4 = [(PGGraph *)self meNode];
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__PGGraph_Conveniences__friends__block_invoke;
    v6[3] = &unk_1E68E6988;
    id v7 = v3;
    [v4 enumeratePersonNodesWithRelationship:2 matchingQuery:3 usingBlock:v6];
  }
  return v3;
}

uint64_t __32__PGGraph_Conveniences__friends__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)children
{
  BOOL v3 = objc_opt_new();
  id v4 = [(PGGraph *)self meNode];
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33__PGGraph_Conveniences__children__block_invoke;
    v6[3] = &unk_1E68E6988;
    id v7 = v3;
    [v4 enumeratePersonNodesWithRelationship:5 matchingQuery:3 usingBlock:v6];
  }
  return v3;
}

uint64_t __33__PGGraph_Conveniences__children__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)parents
{
  BOOL v3 = objc_opt_new();
  id v4 = [(PGGraph *)self meNode];
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__PGGraph_Conveniences__parents__block_invoke;
    v6[3] = &unk_1E68E6988;
    id v7 = v3;
    [v4 enumeratePersonNodesWithRelationship:8 matchingQuery:3 usingBlock:v6];
  }
  return v3;
}

uint64_t __32__PGGraph_Conveniences__parents__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)partners
{
  BOOL v3 = objc_opt_new();
  id v4 = [(PGGraph *)self meNode];
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33__PGGraph_Conveniences__partners__block_invoke;
    v6[3] = &unk_1E68E6988;
    id v7 = v3;
    [v4 enumeratePersonNodesWithRelationship:13 matchingQuery:3 usingBlock:v6];
  }
  return v3;
}

uint64_t __33__PGGraph_Conveniences__partners__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)familyMembers
{
  BOOL v3 = objc_opt_new();
  id v4 = [(PGGraph *)self meNode];
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__PGGraph_Conveniences__familyMembers__block_invoke;
    v6[3] = &unk_1E68E6988;
    id v7 = v3;
    [v4 enumeratePersonNodesWithRelationship:4 matchingQuery:3 usingBlock:v6];
  }
  return v3;
}

uint64_t __38__PGGraph_Conveniences__familyMembers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)meNodeCollection
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = +[PGGraphNodeCollection nodesInGraph:self];
  if ((unint64_t)[v2 count] >= 2)
  {
    BOOL v3 = +[PGLogging sharedLogging];
    id v4 = [v3 loggingConnection];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [v2 set];
      int v7 = 138412290;
      double v8 = v6;
      _os_log_error_impl(&dword_1D1805000, v4, OS_LOG_TYPE_ERROR, "Graph has multiple meNodes: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return v2;
}

- (id)meNode
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [(MAGraph *)self nodesForLabel:@"Me" domain:300];
  if ((unint64_t)[v2 count] >= 2)
  {
    BOOL v3 = +[PGLogging sharedLogging];
    id v4 = [v3 loggingConnection];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      double v8 = v2;
      _os_log_error_impl(&dword_1D1805000, v4, OS_LOG_TYPE_ERROR, "Graph has multiple meNodes: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t v5 = [v2 anyObject];

  return v5;
}

+ (id)poiLabelForPOIType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _graphNodePOILabelByPlaceType];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (id)_graphNodePOILabelByPlaceType
{
  if (_graphNodePOILabelByPlaceType_onceToken != -1) {
    dispatch_once(&_graphNodePOILabelByPlaceType_onceToken, &__block_literal_global_17690);
  }
  v2 = (void *)_graphNodePOILabelByPlaceType_graphNodePOILabelByPlaceType;
  return v2;
}

void __54__PGGraph_Conveniences___graphNodePOILabelByPlaceType__block_invoke()
{
  v17[14] = *MEMORY[0x1E4F143B8];
  long long v15 = +[PGPhotosGraphProfile poiHospital];
  v16[0] = v15;
  v17[0] = @"Hospital";
  id v14 = +[PGPhotosGraphProfile poiHiking];
  v16[1] = v14;
  v17[1] = @"Hiking";
  uint64_t v13 = +[PGPhotosGraphProfile poiDiving];
  v16[2] = v13;
  v17[2] = @"Diving";
  id v12 = +[PGPhotosGraphProfile poiActivity];
  v16[3] = v12;
  v17[3] = @"Activity";
  v0 = +[PGPhotosGraphProfile poiStadium];
  void v16[4] = v0;
  v17[4] = @"Stadium";
  v1 = +[PGPhotosGraphProfile poiPerformance];
  v16[5] = v1;
  v17[5] = @"Performance";
  v2 = +[PGPhotosGraphProfile poiPark];
  v16[6] = v2;
  v17[6] = @"Park";
  BOOL v3 = +[PGPhotosGraphProfile poiAmusementPark];
  v16[7] = v3;
  v17[7] = @"AmusementPark";
  id v4 = +[PGPhotosGraphProfile poiEntertainment];
  v16[8] = v4;
  v17[8] = @"Entertainment";
  uint64_t v5 = +[PGPhotosGraphProfile poiMuseum];
  v16[9] = v5;
  v17[9] = @"Museum";
  uint64_t v6 = +[PGPhotosGraphProfile poiCulture];
  v16[10] = v6;
  v17[10] = @"Culture";
  int v7 = +[PGPhotosGraphProfile poiTravel];
  v16[11] = v7;
  v17[11] = @"Travel";
  double v8 = +[PGPhotosGraphProfile poiNightlife];
  v16[12] = v8;
  v17[12] = @"Nightlife";
  uint64_t v9 = +[PGPhotosGraphProfile poiRestaurant];
  v16[13] = v9;
  v17[13] = @"Restaurant";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:14];
  uint64_t v11 = (void *)_graphNodePOILabelByPlaceType_graphNodePOILabelByPlaceType;
  _graphNodePOILabelByPlaceType_graphNodePOILabelByPlaceType = v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_graphQueue);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_zeroKeywordMappingByMeaningLabel, 0);
  objc_storeStrong((id *)&self->_interestingCityNodes, 0);
  objc_storeStrong((id *)&self->_supersetCountryNodes, 0);
  objc_storeStrong((id *)&self->_supersetStateNodes, 0);
  objc_storeStrong((id *)&self->_supersetCountyNodes, 0);
  objc_storeStrong((id *)&self->_supersetCityNodes, 0);
}

- (OS_dispatch_queue)graphQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graphQueue);
  return (OS_dispatch_queue *)WeakRetained;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (int64_t)librarySizeRange
{
  BOOL v3 = objc_opt_class();
  id v4 = [(PGGraph *)self infoNode];
  int64_t v5 = objc_msgSend(v3, "librarySizeRangeForNumberOfAssets:", objc_msgSend(v4, "numberOfAssets"));

  return v5;
}

- (PGGraphInfoNode)infoNode
{
  return (PGGraphInfoNode *)[(MAGraph *)self anyNodeForLabel:@"Info" domain:21];
}

- (BOOL)isEmpty
{
  return ![(MAGraph *)self version] && [(MAGraph *)self nodesCount] == 0;
}

- (void)invalidateMemoryCaches
{
  v3.receiver = self;
  v3.super_class = (Class)PGGraph;
  [(MAGraph *)&v3 invalidateMemoryCaches];
  [(PGGraph *)self invalidateProcessingCaches];
}

- (BOOL)copyToURL:(id)a3
{
  id v4 = a3;
  [(PGGraph *)self _checkCanRead];
  if (v4)
  {
    int64_t v5 = [(MAGraph *)self databaseURL];
    id v11 = 0;
    BOOL v6 = +[MAGraph copyPersistentStoreFromURL:v5 toURL:v4 error:&v11];
    int v7 = v11;
  }
  else
  {
    double v8 = +[PGLogging sharedLogging];
    int v7 = [v8 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "URL is nil", v10, 2u);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)saveToURL:(id)a3
{
  id v4 = a3;
  [(PGGraph *)self _checkCanRead];
  if (v4)
  {
    id v10 = 0;
    BOOL v5 = [(MAGraph *)self writeDataToURL:v4 error:&v10];
    BOOL v6 = v10;
  }
  else
  {
    int v7 = +[PGLogging sharedLogging];
    BOOL v6 = [v7 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "Url is nil", v9, 2u);
    }
    BOOL v5 = 0;
  }

  return v5;
}

- (void)enableInTransactionCheck
{
  id v3 = [(MAGraph *)self graph];
  v2 = [v3 store];
  [v2 enableInTransactionCheck];
}

- (PGGraph)initWithSpecification:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PGGraph;
  id v3 = [(MAGraph *)&v8 initWithSpecification:a3];
  if (v3)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v3->_dateFormatter;
    v3->_dateFormatter = v4;

    BOOL v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
    [(NSDateFormatter *)v3->_dateFormatter setTimeZone:v6];

    [(NSDateFormatter *)v3->_dateFormatter setDateFormat:@"MM-dd-yyyy"];
    v3->_supersetLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (PGGraph)initWithURL:(id)a3 persistenceOptions:(int64_t)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(MAGraph *)self initWithPersistentStoreURL:v8 options:a4 error:a5];
  if (v9)
  {
    id v10 = [NSNumber numberWithBool:1];
    uint64_t v11 = *MEMORY[0x1E4F1C630];
    id v17 = 0;
    char v12 = [v8 setResourceValue:v10 forKey:v11 error:&v17];
    id v13 = v17;

    if ((v12 & 1) == 0)
    {
      id v14 = +[PGLogging sharedLogging];
      long long v15 = [v14 loggingConnection];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v8;
        __int16 v20 = 2112;
        id v21 = v13;
        _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "Error excluding \"%@\" from backup: \"%@\"", buf, 0x16u);
      }
    }
  }

  return v9;
}

- (BOOL)isOnGraphQueue
{
  return dispatch_get_specific(self) != 0;
}

- (void)_checkCanRead
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graphQueue);
  if (WeakRetained && ![(PGGraph *)self isOnGraphQueue])
  {
    id v4 = +[PGLogging sharedLogging];
    BOOL v5 = [v4 loggingConnection];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "Accessing graph on the wrong queue!", v6, 2u);
    }
  }
}

- (void)setGraphQueue:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graphQueue);
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      dispatch_queue_set_specific(WeakRetained, self, 0, 0);
    }
    objc_storeWeak((id *)&self->_graphQueue, obj);
    if (obj) {
      dispatch_queue_set_specific(obj, self, self, 0);
    }
  }
}

+ (int64_t)librarySizeRangeForNumberOfAssets:(unint64_t)a3
{
  int64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (a3 >> 4 >= 0xC35) {
    uint64_t v6 = 5;
  }
  if (a3 >> 4 >= 0x271) {
    uint64_t v5 = v6;
  }
  if (a3 >= 0x7D0) {
    uint64_t v4 = v5;
  }
  if (a3 >= 0x1F4) {
    int64_t v3 = v4;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (id)defaultSpecification
{
  v2 = objc_alloc_init(PGGraphSpecification);
  return v2;
}

+ (PGGraph)graphWithVisualString:(id)a3 error:(id *)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___PGGraph;
  uint64_t v4 = objc_msgSendSuper2(&v6, sel_graphWithVisualString_error_, a3, a4);
  return (PGGraph *)v4;
}

+ (BOOL)graphExistsWithName:(id)a3 parentDirectoryURL:(id)a4
{
  id v4 = a1;
  uint64_t v5 = [a1 graphURLForName:a3 parentDirectoryURL:a4];
  LOBYTE(v4) = [v4 graphExistsAtURL:v5];

  return (char)v4;
}

+ (BOOL)graphExistsAtURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  char v9 = 0;
  uint64_t v5 = [v3 relativePath];

  char v6 = [v4 fileExistsAtPath:v5 isDirectory:&v9];
  if (v9) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v6;
  }

  return v7;
}

+ (id)graphURLForName:(id)a3 parentDirectoryURL:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = (objc_class *)MEMORY[0x1E4F28CB8];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  char v9 = [v7 path];

  id v10 = [v9 stringByAppendingPathComponent:@"PhotosGraph"];

  if (([v8 fileExistsAtPath:v10 isDirectory:0] & 1) != 0
    || (id v17 = 0,
        [v8 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v17],
        (id v11 = v17) == 0))
  {
    long long v15 = [(id)objc_opt_class() persistentStoreURLWithPath:v10 andName:v5];
  }
  else
  {
    char v12 = v11;
    id v13 = +[PGLogging sharedLogging];
    id v14 = [v13 loggingConnection];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v12;
      _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    long long v15 = 0;
  }

  return v15;
}

+ (id)assetPropertySetsForIngest
{
  v13[14] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *MEMORY[0x1E4F39538];
  v13[0] = *MEMORY[0x1E4F39568];
  v13[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F394E0];
  void v13[2] = *MEMORY[0x1E4F39550];
  v13[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F39458];
  v13[4] = *MEMORY[0x1E4F39528];
  v13[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F39420];
  v13[6] = *MEMORY[0x1E4F394C8];
  v13[7] = v6;
  uint64_t v7 = *MEMORY[0x1E4F39480];
  v13[8] = *MEMORY[0x1E4F39440];
  v13[9] = v7;
  uint64_t v8 = *MEMORY[0x1E4F39488];
  v13[10] = *MEMORY[0x1E4F394C0];
  v13[11] = v8;
  uint64_t v9 = *MEMORY[0x1E4F39510];
  v13[12] = *MEMORY[0x1E4F39558];
  v13[13] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:14];
  id v11 = (void *)[v2 initWithArray:v10];

  if (+[PGEventLabelingConfiguration isEventLabelingEnabled])
  {
    [v11 addObject:*MEMORY[0x1E4F394E8]];
  }
  return v11;
}

- (id)sortedSocialGroupNodesWithMomentNodes:(id)a3
{
  uint64_t v4 = [a3 socialGroupNodes];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __64__PGGraph_OnDiskQueries__sortedSocialGroupNodesWithMomentNodes___block_invoke;
  v13[3] = &unk_1E68E7FC0;
  id v7 = v6;
  id v14 = v7;
  [v4 enumerateIdentifiersAsCollectionsWithBlock:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__PGGraph_OnDiskQueries__sortedSocialGroupNodesWithMomentNodes___block_invoke_2;
  v10[3] = &unk_1E68E7FE8;
  id v11 = v7;
  char v12 = self;
  id v8 = v7;
  [v5 sortUsingComparator:v10];

  return v5;
}

void __64__PGGraph_OnDiskQueries__sortedSocialGroupNodesWithMomentNodes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  id v9 = [a3 momentNodes];
  id v6 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  id v7 = *(void **)(a1 + 32);
  id v8 = [NSNumber numberWithUnsignedInteger:a2];
  [v7 setObject:v6 forKeyedSubscript:v8];
}

uint64_t __64__PGGraph_OnDiskQueries__sortedSocialGroupNodesWithMomentNodes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "identifier"));
  id v9 = [v7 objectForKeyedSubscript:v8];

  id v10 = *(void **)(a1 + 32);
  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "identifier"));
  char v12 = [v10 objectForKeyedSubscript:v11];

  uint64_t v13 = [v12 compare:v9];
  if (!v13)
  {
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "rankInGraph:", *(void *)(a1 + 40)));
    long long v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "rankInGraph:", *(void *)(a1 + 40)));
    uint64_t v13 = [v15 compare:v14];
  }
  return v13;
}

- (id)maximalSocialGroupsOverlappingMemberLocalIdentifiers:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v34 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        char v12 = (void *)MEMORY[0x1D25FED50]();
        uint64_t v13 = [(PGGraph *)self allSocialGroupsForMemberLocalIdentifier:v11 options:0];
        if (v13) {
          [v5 addObjectsFromArray:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v8);
  }
  double v29 = v6;

  id v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"@count" ascending:0];
  v50 = v14;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  double v30 = v5;
  long long v16 = [v5 sortedArrayUsingDescriptors:v15];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v16;
  uint64_t v32 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(obj);
        }
        long long v18 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v19 = obj;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v37;
LABEL_17:
          uint64_t v23 = 0;
          while (1)
          {
            if (*(void *)v37 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = *(void **)(*((void *)&v36 + 1) + 8 * v23);
            unint64_t v25 = [v18 count];
            if (v25 >= [v24 count]) {
              break;
            }
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __72__PGGraph_People__maximalSocialGroupsOverlappingMemberLocalIdentifiers___block_invoke;
            v35[3] = &unk_1E68E8260;
            v35[4] = v24;
            id v26 = [v18 indexesOfObjectsPassingTest:v35];
            uint64_t v27 = [v26 count];
            if (v27 != [v18 count]) {
              [v34 addObject:v18];
            }

            if (v21 == ++v23)
            {
              uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v48 count:16];
              if (v21) {
                goto LABEL_17;
              }
              break;
            }
          }
        }
      }
      uint64_t v32 = [v19 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v32);
  }

  return v34;
}

uint64_t __72__PGGraph_People__maximalSocialGroupsOverlappingMemberLocalIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)socialGroupsOverlappingMemberLocalIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:v4 inGraph:self];
  if ([v5 count])
  {
    id v6 = [v5 asSocialGroupMemberNodeCollection];
    uint64_t v7 = [(PGGraph *)self commonSocialGroupNodesForMemberNodes:v6];

    if ([v7 count])
    {
      uint64_t v8 = [(PGGraph *)self meNode];
      uint64_t v9 = v8;
      if (v8)
      {
        id v10 = [v8 localIdentifier];
        uint64_t v11 = [v4 containsObject:v10];
      }
      else
      {
        uint64_t v11 = 0;
      }
      char v12 = [(PGGraph *)self socialGroupsIdentifiersFromSocialGroupNodes:v7 shouldIncludeMeNode:v11];
    }
    else
    {
      char v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    char v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)allSocialGroupsForMemberLocalIdentifier:(id)a3 options:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F8B040]];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8B048]];
    uint64_t v10 = [v9 BOOLValue];

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __67__PGGraph_People__allSocialGroupsForMemberLocalIdentifier_options___block_invoke;
    uint64_t v23 = &unk_1E68EE8F8;
    id v12 = v11;
    id v24 = v12;
    unint64_t v25 = self;
    [(PGGraph *)self enumerateSocialGroupsIncludingMeNode:1 socialGroupsVersion:0 simulateMeNodeNotSet:v10 validGroupsBlock:&v20 invalidGroupsBlock:0 averageWeight:0];
    if (objc_msgSend(v12, "count", v20, v21, v22, v23))
    {
      uint64_t v13 = [(PGGraph *)self socialGroupsIdentifiersFromSocialGroupNodesWithMemberNodesBySocialGroupNode:v12 shouldIncludeMeNode:1 simulateMeNodeNotSet:v10];
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
    }

    goto LABEL_17;
  }
  if (v6)
  {
    id v14 = [(PGGraph *)self meNode];
    long long v15 = v14;
    if (v14
      && ([v14 localIdentifier],
          long long v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v16 isEqualToString:v6],
          v16,
          v17))
    {
      id v12 = +[PGGraphNodeCollection nodesInGraph:self];
    }
    else
    {
      long long v18 = +[PGGraphPersonNodeCollection personNodesForLocalIdentifier:v6 inGraph:self];
      id v12 = [v18 socialGroupNodes];
    }
    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
    id v12 = +[PGGraphNodeCollection nodesInGraph:self];
    if (!v12) {
      goto LABEL_16;
    }
  }
  if ([v12 count])
  {
    uint64_t v13 = [(PGGraph *)self socialGroupsIdentifiersFromSocialGroupNodes:v12 shouldIncludeMeNode:1];
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_17:

  return v13;
}

void __67__PGGraph_People__allSocialGroupsForMemberLocalIdentifier_options___block_invoke(uint64_t a1, void *a2, float a3)
{
  id v5 = (void *)MEMORY[0x1E4F29128];
  id v6 = a2;
  uint64_t v7 = [v5 UUID];
  uint64_t v8 = [v7 hash];

  uint64_t v10 = [[PGGraphSocialGroupNode alloc] initWithSocialGroupIdentifier:v8 importance:a3];
  [(MANode *)v10 resolveIdentifier:v8];
  uint64_t v9 = [(MAElementCollection *)[PGGraphSocialGroupMemberNodeCollection alloc] initWithArray:v6 graph:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
}

- (unint64_t)_countOfDistinctSocialGroups:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v33 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v3;
  uint64_t v34 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v53;
    do
    {
      id v4 = 0;
      do
      {
        if (*(void *)v53 != v32) {
          objc_enumerationMutation(obj);
        }
        long long v36 = v4;
        id v5 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v4);
        long long v38 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObject:", v5, v32);
        unint64_t v6 = [v5 count];
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v7 = obj;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v58 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          unint64_t v10 = vcvtpd_u64_f64((double)v6 * 0.5);
          uint64_t v11 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v49 != v11) {
                objc_enumerationMutation(v7);
              }
              uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              if (v13 != v5)
              {
                id v14 = [MEMORY[0x1E4F1CA80] setWithSet:v5];
                [v14 intersectSet:v13];
                if ([v14 count] > v10
                  || (uint64_t v15 = [v14 count], v15 == objc_msgSend(v5, "count")))
                {
                  [v38 addObject:v13];
                }
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v58 count:16];
          }
          while (v9);
        }

        [v33 addObject:v38];
        id v4 = v36 + 1;
      }
      while (v36 + 1 != (char *)v34);
      uint64_t v34 = [v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v34);
  }

  long long v16 = (void *)[v33 mutableCopy];
  int v17 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v37 = v33;
  uint64_t v18 = [v37 countByEnumeratingWithState:&v44 objects:v57 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v39 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(v37);
        }
        uint64_t v21 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        [v16 removeObject:v21];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v22 = v16;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v56 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v41;
          do
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v41 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void **)(*((void *)&v40 + 1) + 8 * k);
              if (([v21 isSubsetOfSet:v27] & 1) == 0)
              {
                int v28 = [v27 isSubsetOfSet:v21];
                uint64_t v27 = v21;
                if (!v28) {
                  continue;
                }
              }
              [v17 addObject:v27];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v56 count:16];
          }
          while (v24);
        }
      }
      uint64_t v19 = [v37 countByEnumeratingWithState:&v44 objects:v57 count:16];
    }
    while (v19);
  }

  uint64_t v29 = [v37 count];
  uint64_t v30 = [v17 count];

  return v29 - v30;
}

- (id)_personNodeIntersectingSocialGroups:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 unionSet:*(void *)(*((void *)&v34 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v7);
  }

  unint64_t v10 = vcvtmd_u64_f64((double)(unint64_t)[v5 count] * 0.8);
  if (v10 <= 3) {
    unint64_t v11 = 3;
  }
  else {
    unint64_t v11 = v10;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (!v13)
  {

    unint64_t v15 = 0;
    goto LABEL_29;
  }
  uint64_t v14 = v13;
  id v29 = v5;
  unint64_t v15 = 0;
  long long v16 = 0;
  uint64_t v17 = *(void *)v31;
  char v18 = 1;
  do
  {
    for (uint64_t j = 0; j != v14; ++j)
    {
      if (*(void *)v31 != v17) {
        objc_enumerationMutation(v12);
      }
      uint64_t v20 = *(void **)(*((void *)&v30 + 1) + 8 * j);
      unint64_t v21 = [v12 countForObject:v20];
      unint64_t v22 = v21;
      if (v21 >= v11 && v21 > v15)
      {
        uint64_t v24 = v20;

        char v18 = 1;
        unint64_t v15 = v22;
        long long v16 = v24;
      }
      else
      {
        v18 &= v21 != v15;
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v42 count:16];
  }
  while (v14);

  if (!v16)
  {
    id v5 = v29;
LABEL_29:
    uint64_t v25 = +[PGLogging sharedLogging];
    long long v16 = [v25 loggingConnection];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v39 = v15;
      __int16 v40 = 2112;
      long long v41 = 0;
      _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "Can't suggest Me Person: Not getting 1 person intersect between social groups. Highest overlap count %lu for person %@", buf, 0x16u);
    }
    goto LABEL_34;
  }
  if (v18)
  {
    id v5 = v29;
    goto LABEL_35;
  }
  id v26 = +[PGLogging sharedLogging];
  uint64_t v27 = [v26 loggingConnection];

  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v39 = v15;
    __int16 v40 = 2112;
    long long v41 = v16;
    _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "Can't suggest Me Person: Not getting a unique person intersecting between the social groups. Highest overlap count %lu for person %@", buf, 0x16u);
  }

  id v5 = v29;
LABEL_34:

  long long v16 = 0;
LABEL_35:

  return v16;
}

- (id)_socialGroupNodeForPersonNodes:(id)a3 searchWithTolerance:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  unint64_t v22 = __Block_byref_object_copy__29258;
  uint64_t v23 = __Block_byref_object_dispose__29259;
  uint64_t v7 = [v6 asSocialGroupMemberNodeCollection];
  id v24 = [(PGGraph *)self socialGroupNodeForMemberNodes:v7];

  uint64_t v8 = (void *)v20[5];
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v4;
  }
  if (!v9)
  {
    unint64_t v10 = [v6 asSocialGroupMemberNodeCollection];
    unint64_t v11 = [(PGGraph *)self commonSocialGroupNodesForMemberNodes:v10];

    if ([v11 count])
    {
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x2020000000;
      v18[3] = 0;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __70__PGGraph_People___socialGroupNodeForPersonNodes_searchWithTolerance___block_invoke;
      v14[3] = &unk_1E68E8238;
      id v15 = v6;
      long long v16 = v18;
      uint64_t v17 = &v19;
      [v11 enumerateIdentifiersAsCollectionsWithBlock:v14];

      _Block_object_dispose(v18, 8);
    }

    uint64_t v8 = (void *)v20[5];
  }
  id v12 = v8;
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __70__PGGraph_People___socialGroupNodeForPersonNodes_searchWithTolerance___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v5 = [v7 personNodes];
  unint64_t v6 = [v5 count];

  if (v6 > [*(id *)(a1 + 32) count] && v6 > *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  }
}

- (id)fetchMemberNodesBySocialGroupNodeForSocialGroupNodes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    BOOL v4 = [PGGraphSocialGroupNodeCollection alloc];
    id v5 = [v3 firstObject];
    unint64_t v6 = [v5 graph];
    id v7 = [(MAElementCollection *)v4 initWithArray:v3 graph:v6];

    uint64_t v8 = (void *)MEMORY[0x1E4F71E88];
    BOOL v9 = +[PGGraphSocialGroupNode memberOfSocialGroup];
    unint64_t v10 = [v8 adjacencyWithSources:v7 relation:v9 targetsClass:objc_opt_class()];

    unint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v3;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          char v18 = objc_msgSend(v10, "targetsForSourceIdentifier:", objc_msgSend(v17, "identifier", (void)v20));
          [v11 setObject:v18 forKeyedSubscript:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }
  }
  else
  {
    unint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v11;
}

- (id)fetchMemberNodesBySocialGroupNodeForSocialGroups:(id)a3
{
  BOOL v4 = [a3 array];
  id v5 = [(PGGraph *)self fetchMemberNodesBySocialGroupNodeForSocialGroupNodes:v4];

  return v5;
}

- (id)socialGroupsIdentifiersFromSocialGroupNodes:(id)a3 shouldIncludeMeNode:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = [(PGGraph *)self fetchMemberNodesBySocialGroupNodeForSocialGroups:a3];
  id v7 = [(PGGraph *)self socialGroupsIdentifiersFromSocialGroupNodesWithMemberNodesBySocialGroupNode:v6 shouldIncludeMeNode:v4 simulateMeNodeNotSet:0];

  return v7;
}

- (id)socialGroupsIdentifiersFromSocialGroupNodesWithMemberNodesBySocialGroupNode:(id)a3 shouldIncludeMeNode:(BOOL)a4 simulateMeNodeNotSet:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = [(PGGraph *)self memberLocalIdentifiersBySocialGroupUUIDWithMemberNodesBySocialGroupNode:v8 shouldIncludeMeNode:v6 simulateMeNodeNotSet:v5];
  unint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v11 = [v8 allKeys];
  id v12 = +[PGGraphSocialGroupNode importanceSortDescriptors];
  uint64_t v13 = [v11 sortedArrayUsingDescriptors:v12];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v20 = objc_msgSend(v19, "UUID", (void)v25);
        long long v21 = [v9 objectForKey:v20];

        if (v21)
        {
          long long v22 = [v19 UUID];
          long long v23 = [v9 objectForKeyedSubscript:v22];

          if (v23) {
            [v10 addObject:v23];
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  return v10;
}

- (id)memberLocalIdentifiersBySocialGroupUUIDWithMemberNodesBySocialGroupNode:(id)a3 shouldIncludeMeNode:(BOOL)a4 simulateMeNodeNotSet:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
  if (!a5)
  {
    unint64_t v10 = [(PGGraph *)self meNode];
    BOOL v9 = [v10 localIdentifier];

    if ([v9 length]) {
      goto LABEL_6;
    }
    unint64_t v11 = [(PGGraph *)self meNode];
    id v12 = [v11 inferredPersonNode];
    uint64_t v13 = [v12 localIdentifier];

    if ([v13 length])
    {
      BOOL v9 = v13;
      goto LABEL_6;
    }
  }
  BOOL v9 = 0;
LABEL_6:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v15) {
    goto LABEL_22;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v29;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v29 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      long long v20 = [v14 objectForKeyedSubscript:v19];
      long long v21 = [v20 localIdentifiers];

      if ([v21 count] != 1 || !v6)
      {
        long long v23 = [v21 allObjects];
        id v24 = [v19 UUID];
        [v27 setObject:v23 forKeyedSubscript:v24];
      }
      else
      {
        if (!v9) {
          goto LABEL_20;
        }
        long long v25 = [v21 setByAddingObject:v9];

        long long v23 = [v25 allObjects];
        id v24 = [v19 UUID];
        [v27 setObject:v23 forKeyedSubscript:v24];
        long long v21 = v25;
      }

LABEL_20:
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  }
  while (v16);
LABEL_22:

  return v27;
}

- (id)personNodeForPersonLocalIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[PGGraphPersonNodeCollection personNodesForLocalIdentifier:v4 inGraph:self];
  if (![v5 count])
  {
    BOOL v6 = +[PGLogging sharedLogging];
    id v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      unint64_t v11 = "-[PGGraph(People) personNodeForPersonLocalIdentifier:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "%s - Cannot find person node for person local identifier: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  id v8 = [v5 anyNode];

  return v8;
}

- (id)momentNodesForPersonNodes:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && [v4 count])
  {
    if ([v5 count] == 1)
    {
      BOOL v6 = [v5 momentNodes];
    }
    else
    {
      id v7 = [(PGGraph *)self _socialGroupNodeForPersonNodes:v5 searchWithTolerance:1];
      id v8 = v7;
      if (v7)
      {
        BOOL v6 = [v7 momentNodes];
      }
      else
      {
        BOOL v6 = 0;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)socialGroupMemberNodesForMemberLocalIdentifiers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];
  BOOL v6 = +[PGGraphSocialGroupMemberNodeCollection memberNodesForLocalIdentifiers:v5 inGraph:self];

  id v7 = [v6 memberNodeByLocalIdentifier];
  uint64_t v8 = [v6 count];
  if (v8)
  {
    BOOL v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(v7, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
  else
  {
    BOOL v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)personNodesForPersonLocalIdentifiers:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:v4 inGraph:self];
  BOOL v6 = [v5 personNodeByLocalIdentifier];
  uint64_t v7 = [v5 count];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
          if (v14) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (void)enumeratePersonNodesIncludingMe:(BOOL)a3 withBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if (!v4) {
    goto LABEL_3;
  }
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __61__PGGraph_People__enumeratePersonNodesIncludingMe_withBlock___block_invoke;
  uint64_t v11 = &unk_1E68E8210;
  id v12 = v6;
  uint64_t v13 = &v14;
  [(MAGraph *)self enumerateNodesWithLabel:@"Me" domain:300 usingBlock:&v8];

  if (!*((unsigned char *)v15 + 24)) {
LABEL_3:
  }
    [(MAGraph *)self enumerateNodesWithLabel:@"People", 300, v7, v8, v9, v10, v11 domain usingBlock];
  _Block_object_dispose(&v14, 8);
}

uint64_t __61__PGGraph_People__enumeratePersonNodesIncludingMe_withBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (id)favoritedPersonNodesIncludingMe:(BOOL)a3
{
  BOOL v3 = a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = @"fav";
  uint64_t v5 = MEMORY[0x1E4F1CC38];
  v15[0] = MEMORY[0x1E4F1CC38];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v7 = [(MAGraph *)self nodesForLabel:@"People" domain:300 properties:v6];

  if (v3)
  {
    id v12 = @"fav";
    uint64_t v13 = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    uint64_t v9 = [(MAGraph *)self nodesForLabel:@"Me" domain:300 properties:v8];

    if ([v9 count])
    {
      uint64_t v10 = (void *)[v7 mutableCopy];
      [v10 unionSet:v9];

      uint64_t v7 = v10;
    }
  }
  return v7;
}

- (id)personNodesIncludingMe:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MAGraph *)self nodesForLabel:@"People" domain:300];
  if (v3)
  {
    id v6 = [(MAGraph *)self nodesForLabel:@"Me" domain:300];
    if ([v6 count])
    {
      uint64_t v7 = (void *)[v5 mutableCopy];
      [v7 unionSet:v6];

      uint64_t v5 = v7;
    }
  }
  return v5;
}

- (unint64_t)numberOfPersonNodesIncludingMe:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(MAGraph *)self nodesCountForLabel:@"People" domain:300];
  if (v3) {
    v5 += [(MAGraph *)self nodesCountForLabel:@"Me" domain:300];
  }
  return v5;
}

- (id)commonSocialGroupNodesForMemberNodes:(id)a3 withThreshold:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(PGGraph *)self meNode];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 collection];
    uint64_t v10 = [v6 collectionBySubtracting:v9];

    id v6 = (id)v10;
  }
  uint64_t v11 = [v6 socialGroupNodes];
  id v12 = objc_alloc_init(MEMORY[0x1E4F71E60]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__PGGraph_People__commonSocialGroupNodesForMemberNodes_withThreshold___block_invoke;
  v17[3] = &unk_1E68E81E8;
  double v20 = a4;
  id v18 = v6;
  id v19 = v12;
  id v13 = v12;
  id v14 = v6;
  [v11 enumerateIdentifiersAsCollectionsWithBlock:v17];
  uint64_t v15 = [(MAElementCollection *)[PGGraphSocialGroupNodeCollection alloc] initWithGraph:self elementIdentifiers:v13];

  return v15;
}

void __70__PGGraph_People__commonSocialGroupNodesForMemberNodes_withThreshold___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = [a3 memberNodes];
  unint64_t v5 = [v10 collectionByIntersecting:*(void *)(a1 + 32)];
  unint64_t v6 = [v10 count];
  unint64_t v7 = [v5 count];
  unint64_t v8 = vcvtmd_u64_f64(*(double *)(a1 + 48) * (double)v6);
  if (v8 <= 2) {
    unint64_t v8 = 2;
  }
  if (v7 >= v8 || v7 == v6) {
    [*(id *)(a1 + 40) addIdentifier:a2];
  }
}

- (id)commonSocialGroupNodesForMemberNodes:(id)a3
{
  return [(PGGraph *)self commonSocialGroupNodesForMemberNodes:a3 withThreshold:0.75];
}

- (BOOL)isBestPairSocialGroup:(id)a3
{
  id v4 = a3;
  [v4 importance];
  BOOL v6 = v5 == 1.0 && [(PGGraph *)self isPairSocialGroup:v4];

  return v6;
}

- (BOOL)isPairSocialGroup:(id)a3
{
  id v4 = a3;
  double v5 = [(PGGraph *)self meNode];
  uint64_t v6 = [v4 countOfEdgesWithLabel:@"BELONGSTO" domain:302];

  uint64_t v7 = 1;
  if (!v5) {
    uint64_t v7 = 2;
  }
  BOOL v8 = v6 == v7;

  return v8;
}

- (BOOL)hasSocialGroups
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__PGGraph_People__hasSocialGroups__block_invoke;
  v4[3] = &unk_1E68E81C0;
  v4[4] = &v5;
  [(MAGraph *)self enumerateEdgesWithLabel:@"SOCIALGROUP" domain:302 properties:0 usingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __34__PGGraph_People__hasSocialGroups__block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- (id)bestSocialGroupNodes
{
  char v2 = [(PGGraph *)self socialGroupNodesSortedByImportance];
  unint64_t v3 = [v2 count];
  if (v3 >= 5) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = v3;
  }
  uint64_t v5 = objc_msgSend(v2, "subarrayWithRange:", 0, v4);

  return v5;
}

- (id)socialGroupNodesSortedByImportance
{
  char v2 = +[PGGraphNodeCollection nodesInGraph:self];
  unint64_t v3 = +[PGGraphSocialGroupNode importanceSortDescriptors];
  uint64_t v4 = [v2 sortedArrayUsingDescriptors:v3];

  return v4;
}

- (unint64_t)numberOfSocialGroupNodes
{
  return [(MAGraph *)self nodesCountForLabel:@"SocialGroup" domain:302];
}

- (id)socialGroupNodeForMemberNodes:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PGGraph *)self meNode];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 collection];
    uint64_t v8 = [v4 collectionBySubtracting:v7];

    id v4 = (id)v8;
  }
  uint64_t v9 = [v4 socialGroupNodes];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__29258;
  id v27 = __Block_byref_object_dispose__29259;
  id v28 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __49__PGGraph_People__socialGroupNodeForMemberNodes___block_invoke;
  double v20 = &unk_1E68E8198;
  id v10 = v4;
  id v21 = v10;
  uint64_t v22 = &v23;
  [v9 enumerateIdentifiersAsCollectionsWithBlock:&v17];
  uint64_t v11 = (void *)v24[5];
  if (!v11)
  {
    id v12 = +[PGLogging sharedLogging];
    id v13 = [v12 loggingConnection];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v10 set];
      *(_DWORD *)buf = 136315394;
      long long v30 = "-[PGGraph(People) socialGroupNodeForMemberNodes:]";
      __int16 v31 = 2112;
      long long v32 = v16;
      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "%s - Cannot find social group for people nodes %@", buf, 0x16u);
    }
    uint64_t v11 = (void *)v24[5];
  }
  id v14 = v11;

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __49__PGGraph_People__socialGroupNodeForMemberNodes___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  uint64_t v7 = [v9 memberNodes];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (id)inferMeNodeFromSocialGroups
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(PGGraph *)self libraryDuration];
  double v4 = v3;
  if (v3 >= 15552000.0)
  {
    int v8 = objc_opt_new();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __46__PGGraph_People__inferMeNodeFromSocialGroups__block_invoke;
    v15[3] = &unk_1E68EB8E0;
    uint64_t v6 = v8;
    uint64_t v16 = v6;
    [(PGGraph *)self enumerateSocialGroupsIncludingMeNode:1 socialGroupsVersion:0 simulateMeNodeNotSet:0 validGroupsBlock:v15 invalidGroupsBlock:0 averageWeight:0];
    unint64_t v9 = [(PGGraph *)self _countOfDistinctSocialGroups:v6];
    if (v9 > 2)
    {
      uint64_t v7 = [(PGGraph *)self _personNodeIntersectingSocialGroups:v6];
    }
    else
    {
      unint64_t v10 = v9;
      uint64_t v11 = +[PGLogging sharedLogging];
      id v12 = [v11 loggingConnection];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [v6 count];
        *(_DWORD *)buf = 134218496;
        uint64_t v18 = v13;
        __int16 v19 = 2048;
        uint64_t v20 = v10;
        __int16 v21 = 2048;
        uint64_t v22 = 3;
        _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "Can't suggest Me Person: Not enough distinct social groups (%lu social groups, %lu distinct < %lu)", buf, 0x20u);
      }

      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v5 = +[PGLogging sharedLogging];
    uint64_t v6 = [v5 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v18 = *(void *)&v4;
      __int16 v19 = 2048;
      uint64_t v20 = 0x416DA9C000000000;
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_INFO, "Can't suggest Me Person: Library time interval too small (%.2f < %.2f)", buf, 0x16u);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

void __46__PGGraph_People__inferMeNodeFromSocialGroups__block_invoke(uint64_t a1, uint64_t a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:a2];
  [v2 addObject:v3];
}

- (id)meNodeWithFallbackInferredMeNode
{
  char v2 = [(PGGraph *)self meNode];
  id v3 = [v2 localIdentifier];
  if ([v3 length])
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [v2 inferredPersonNode];
  }
  uint64_t v5 = v4;

  return v5;
}

+ (id)socialGroupMemberSortDescriptorForSocialGroupNode:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F29008];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__PGGraph_People__socialGroupMemberSortDescriptorForSocialGroupNode___block_invoke;
  v8[3] = &unk_1E68E8170;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 sortDescriptorWithKey:@"self" ascending:0 comparator:v8];

  return v6;
}

uint64_t __69__PGGraph_People__socialGroupMemberSortDescriptorForSocialGroupNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 anyEdgeTowardNode:*(void *)(a1 + 32)];
  [v7 importance];
  double v9 = v8;

  unint64_t v10 = [v6 anyEdgeTowardNode:*(void *)(a1 + 32)];
  [v10 importance];
  double v12 = v11;

  if (v9 < v12) {
    goto LABEL_4;
  }
  if (v9 > v12)
  {
LABEL_7:
    uint64_t v15 = 1;
    goto LABEL_8;
  }
  unint64_t v13 = [v5 edgesCount];
  unint64_t v14 = [v6 edgesCount];
  if (v13 >= v14)
  {
    if (v13 <= v14)
    {
      uint64_t v17 = [v5 localIdentifier];
      uint64_t v18 = [v6 localIdentifier];
      uint64_t v15 = [v17 compare:v18];

      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v15 = -1;
LABEL_8:

  return v15;
}

- (id)musicGenreDistributionUsingTaggedGenres:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__PGGraph_Music__musicGenreDistributionUsingTaggedGenres___block_invoke;
  v10[3] = &unk_1E68E8688;
  id v11 = v5;
  id v6 = v5;
  [(PGGraph *)self enumerateMusicSessionNodesUsingBlock:v10];
  uint64_t v7 = objc_alloc_init(PGMusicGenreDistributionComputer);
  [(PGMusicGenreDistributionComputer *)v7 setUseTaggedGenres:v3];
  double v8 = [(PGMusicGenreDistributionComputer *)v7 musicGenreDistributionForGenres:v6];

  return v8;
}

void __58__PGGraph_Music__musicGenreDistributionUsingTaggedGenres___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__PGGraph_Music__musicGenreDistributionUsingTaggedGenres___block_invoke_2;
  v3[3] = &unk_1E68E9610;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateMusicTrackNodesUsingBlock:v3];
}

void __58__PGGraph_Music__musicGenreDistributionUsingTaggedGenres___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = [a2 genreNodes];
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [v5 allObjects];
  [v3 addObjectsFromArray:v4];
}

- (void)enumerateMusicSessionNodesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PGGraph_Music__enumerateMusicSessionNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E68E86B0;
  id v7 = v4;
  id v5 = v4;
  [(MAGraph *)self enumerateNodesWithLabel:@"MusicSession" domain:1000 usingBlock:v6];
}

uint64_t __55__PGGraph_Music__enumerateMusicSessionNodesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSSet)musicSessions
{
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__PGGraph_Music__musicSessions__block_invoke;
  v6[3] = &unk_1E68E8688;
  id v4 = v3;
  id v7 = v4;
  [(PGGraph *)self enumerateMusicSessionNodesUsingBlock:v6];

  return (NSSet *)v4;
}

uint64_t __31__PGGraph_Music__musicSessions__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)staticGraphSchema
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F71ED8]);
  v124 = [v2 nodeSchemeWithLabel:@"Info" domain:1];
  BOOL v3 = [v2 nodeSchemeWithLabel:@"Moment" domain:100];
  uint64_t v4 = [v2 nodeSchemeWithLabel:@"Highlight" domain:102];
  uint64_t v5 = [v2 nodeSchemeWithLabel:@"HighlightGroup" domain:102];
  v121 = [v2 nodeSchemeWithLabel:0 domain:103];
  uint64_t v6 = [v2 nodeSchemeWithLabel:@"Address" domain:200];
  uint64_t v7 = [v2 nodeSchemeWithLabel:@"Number" domain:200];
  uint64_t v8 = [v2 nodeSchemeWithLabel:@"Street" domain:200];
  uint64_t v9 = [v2 nodeSchemeWithLabel:@"District" domain:200];
  v137 = [v2 nodeSchemeWithLabel:@"City" domain:200];
  v172 = [v2 nodeSchemeWithLabel:@"County" domain:200];
  v171 = [v2 nodeSchemeWithLabel:@"State" domain:200];
  v136 = [v2 nodeSchemeWithLabel:@"Country" domain:200];
  v170 = [v2 nodeSchemeWithLabel:@"Language" domain:205];
  v169 = [v2 nodeSchemeWithLabel:@"Area" domain:201];
  v135 = [v2 nodeSchemeWithLabel:@"Home" domain:202];
  v134 = [v2 nodeSchemeWithLabel:@"Work" domain:202];
  v168 = [v2 nodeSchemeWithLabel:0 domain:203];
  v133 = [v2 nodeSchemeWithLabel:@"FrequentLocation" domain:204];
  v131 = [v2 nodeSchemeWithLabel:@"Me" domain:300];
  v127 = [v2 nodeSchemeWithLabel:@"People" domain:300];
  v132 = [v2 nodeSchemeWithLabel:@"SocialGroup" domain:302];
  v128 = [v2 nodeSchemeWithLabel:@"Contact" domain:303];
  v167 = [v2 nodeSchemeWithLabel:0 domain:305];
  v125 = [v2 nodeSchemeWithLabel:@"Date" domain:400];
  v166 = [v2 nodeSchemeWithLabel:@"Day" domain:400];
  v165 = [v2 nodeSchemeWithLabel:@"Month" domain:400];
  v164 = [v2 nodeSchemeWithLabel:@"Year" domain:400];
  v163 = [v2 nodeSchemeWithLabel:@"WeekMonth" domain:400];
  v162 = [v2 nodeSchemeWithLabel:@"WeekYear" domain:400];
  v161 = [v2 nodeSchemeWithLabel:@"Season" domain:400];
  v160 = [v2 nodeSchemeWithLabel:@"Weekend" domain:400];
  v159 = [v2 nodeSchemeWithLabel:@"Weekday" domain:400];
  v126 = [v2 nodeSchemeWithLabel:@"Holiday" domain:401];
  v158 = [v2 nodeSchemeWithLabel:@"PartOfDay" domain:400];
  v157 = [v2 nodeSchemeWithLabel:@"DayOfWeek" domain:400];
  v156 = [v2 nodeSchemeWithLabel:@"Urban" domain:502];
  v155 = [v2 nodeSchemeWithLabel:@"Beach" domain:502];
  v154 = [v2 nodeSchemeWithLabel:@"Water" domain:502];
  v153 = [v2 nodeSchemeWithLabel:@"Nature" domain:502];
  v152 = [v2 nodeSchemeWithLabel:@"Mountain" domain:502];
  v151 = [v2 nodeSchemeWithLabel:@"Restaurant" domain:501];
  v150 = [v2 nodeSchemeWithLabel:@"Nightlife" domain:501];
  v149 = [v2 nodeSchemeWithLabel:@"Travel" domain:501];
  v148 = [v2 nodeSchemeWithLabel:@"Culture" domain:501];
  v147 = [v2 nodeSchemeWithLabel:@"Entertainment" domain:501];
  v146 = [v2 nodeSchemeWithLabel:@"Park" domain:501];
  v145 = [v2 nodeSchemeWithLabel:@"AmusementPark" domain:501];
  v144 = [v2 nodeSchemeWithLabel:@"Museum" domain:501];
  v143 = [v2 nodeSchemeWithLabel:@"Stadium" domain:501];
  v129 = [v2 nodeSchemeWithLabel:@"Business" domain:503];
  v142 = [v2 nodeSchemeWithLabel:0 domain:504];
  v130 = [v2 nodeSchemeWithLabel:@"PublicEvent" domain:900];
  v141 = [v2 nodeSchemeWithLabel:@"Performer" domain:900];
  v140 = [v2 nodeSchemeWithLabel:0 domain:901];
  v139 = [v2 nodeSchemeWithLabel:0 domain:902];
  v138 = [v2 nodeSchemeWithLabel:0 domain:600];
  unint64_t v10 = objc_opt_class();
  v177[0] = MEMORY[0x1E4F143A8];
  v177[1] = 3221225472;
  v177[2] = __36__PGGraph_Schema__staticGraphSchema__block_invoke;
  v177[3] = &unk_1E68ED970;
  id v11 = v2;
  id v178 = v11;
  [v10 _traverseMeaningLabelsUsingBlock:v177];
  v120 = [v11 edgeSchemeWithLabel:@"NEXT" domain:101 sourceNode:v3 targetNode:v3];
  v123 = (void *)v4;
  v119 = [v11 edgeSchemeWithLabel:@"CONTAINS" domain:102 sourceNode:v4 targetNode:v3];
  v122 = (void *)v5;
  v118 = [v11 edgeSchemeWithLabel:@"GROUP_CONTAINS" domain:102 sourceNode:v5 targetNode:v4];
  v116 = [v11 edgeSchemeWithLabel:@"HAS_TYPE" domain:103 sourceNode:v5 targetNode:v121];
  v114 = [v11 edgeSchemeWithLabel:@"ADDRESS" domain:200 sourceNode:v3 targetNode:v6];
  v112 = [v11 edgeSchemeWithLabel:@"NUMBER" domain:200 sourceNode:v6 targetNode:v7];
  v111 = [v11 edgeSchemeWithLabel:@"STREET" domain:200 sourceNode:v6 targetNode:v8];
  v110 = [v11 edgeSchemeWithLabel:@"STREET" domain:200 sourceNode:v7 targetNode:v8];
  v109 = [v11 edgeSchemeWithLabel:@"DISTRICT" domain:200 sourceNode:v6 targetNode:v9];
  v108 = [v11 edgeSchemeWithLabel:@"DISTRICT" domain:200 sourceNode:v7 targetNode:v9];
  v107 = [v11 edgeSchemeWithLabel:@"DISTRICT" domain:200 sourceNode:v8 targetNode:v9];
  v106 = [v11 edgeSchemeWithLabel:@"CITY" domain:200 sourceNode:v6 targetNode:v137];
  v105 = [v11 edgeSchemeWithLabel:@"CITY" domain:200 sourceNode:v7 targetNode:v137];
  v104 = [v11 edgeSchemeWithLabel:@"CITY" domain:200 sourceNode:v8 targetNode:v137];
  v102 = [v11 edgeSchemeWithLabel:@"CITY" domain:200 sourceNode:v9 targetNode:v137];
  v101 = [v11 edgeSchemeWithLabel:@"COUNTY" domain:200 sourceNode:v6 targetNode:v172];
  v100 = [v11 edgeSchemeWithLabel:@"COUNTY" domain:200 sourceNode:v7 targetNode:v172];
  v99 = [v11 edgeSchemeWithLabel:@"COUNTY" domain:200 sourceNode:v8 targetNode:v172];
  v98 = [v11 edgeSchemeWithLabel:@"COUNTY" domain:200 sourceNode:v9 targetNode:v172];
  v97 = [v11 edgeSchemeWithLabel:@"COUNTY" domain:200 sourceNode:v137 targetNode:v172];
  v96 = [v11 edgeSchemeWithLabel:@"STATE" domain:200 sourceNode:v6 targetNode:v171];
  v117 = (void *)v7;
  v95 = [v11 edgeSchemeWithLabel:@"STATE" domain:200 sourceNode:v7 targetNode:v171];
  v115 = (void *)v8;
  v94 = [v11 edgeSchemeWithLabel:@"STATE" domain:200 sourceNode:v8 targetNode:v171];
  v113 = (void *)v9;
  v93 = [v11 edgeSchemeWithLabel:@"STATE" domain:200 sourceNode:v9 targetNode:v171];
  v92 = [v11 edgeSchemeWithLabel:@"STATE" domain:200 sourceNode:v137 targetNode:v171];
  v91 = [v11 edgeSchemeWithLabel:@"STATE" domain:200 sourceNode:v172 targetNode:v171];
  v90 = [v11 edgeSchemeWithLabel:@"COUNTRY" domain:200 sourceNode:v6 targetNode:v136];
  v89 = [v11 edgeSchemeWithLabel:@"COUNTRY" domain:200 sourceNode:v7 targetNode:v136];
  v88 = [v11 edgeSchemeWithLabel:@"COUNTRY" domain:200 sourceNode:v8 targetNode:v136];
  v87 = [v11 edgeSchemeWithLabel:@"COUNTRY" domain:200 sourceNode:v9 targetNode:v136];
  v86 = [v11 edgeSchemeWithLabel:@"COUNTRY" domain:200 sourceNode:v137 targetNode:v136];
  v84 = [v11 edgeSchemeWithLabel:@"COUNTRY" domain:200 sourceNode:v172 targetNode:v136];
  v83 = [v11 edgeSchemeWithLabel:@"COUNTRY" domain:200 sourceNode:v171 targetNode:v136];
  v82 = [v11 edgeSchemeWithLabel:@"POPULAR_LANGUAGE" domain:205 sourceNode:v136 targetNode:v170];
  v81 = [v11 edgeSchemeWithLabel:@"AREA" domain:201 sourceNode:v6 targetNode:v169];
  v80 = [v11 edgeSchemeWithLabel:@"IS_HOME_WORK" domain:202 sourceNode:v6 targetNode:v135];
  v103 = (void *)v6;
  v79 = [v11 edgeSchemeWithLabel:@"IS_HOME_WORK" domain:202 sourceNode:v6 targetNode:v134];
  v78 = [v11 edgeSchemeWithLabel:@"IS_OWNED_BY" domain:202 sourceNode:v135 targetNode:v127];
  v77 = [v11 edgeSchemeWithLabel:@"IS_OWNED_BY" domain:202 sourceNode:v134 targetNode:v127];
  v76 = [v11 edgeSchemeWithLabel:@"IS_OWNED_BY" domain:202 sourceNode:v135 targetNode:v131];
  v75 = [v11 edgeSchemeWithLabel:@"IS_OWNED_BY" domain:202 sourceNode:v134 targetNode:v131];
  v74 = [v11 edgeSchemeWithLabel:@"MOBILITY" domain:203 sourceNode:v3 targetNode:v168];
  v73 = [v11 edgeSchemeWithLabel:@"IN" domain:204 sourceNode:v3 targetNode:v133];
  v72 = [v11 edgeSchemeWithLabel:@"AT" domain:204 sourceNode:v133 targetNode:v6];
  v71 = [v11 edgeSchemeWithLabel:@"PRESENT" domain:300 sourceNode:v127 targetNode:v3];
  v70 = [v11 edgeSchemeWithLabel:@"PRESENT" domain:300 sourceNode:v131 targetNode:v3];
  v69 = [v11 edgeSchemeWithLabel:@"FAMILY" domain:300 sourceNode:v131 targetNode:v127];
  v68 = [v11 edgeSchemeWithLabel:@"CHILD" domain:300 sourceNode:v131 targetNode:v127];
  v67 = [v11 edgeSchemeWithLabel:@"PARENT" domain:300 sourceNode:v131 targetNode:v127];
  v66 = [v11 edgeSchemeWithLabel:@"FRIEND" domain:300 sourceNode:v131 targetNode:v127];
  v65 = [v11 edgeSchemeWithLabel:@"PARTNER" domain:300 sourceNode:v131 targetNode:v127];
  v64 = [v11 edgeSchemeWithLabel:@"VIP" domain:300 sourceNode:v131 targetNode:v127];
  v63 = [v11 edgeSchemeWithLabel:@"COWORKER" domain:300 sourceNode:v131 targetNode:v127];
  v62 = [v11 edgeSchemeWithLabel:@"BELONGSTO" domain:302 sourceNode:v127 targetNode:v132];
  v61 = [v11 edgeSchemeWithLabel:@"SOCIALGROUP" domain:302 sourceNode:v3 targetNode:v132];
  uint64_t v60 = [v11 edgeSchemeWithLabel:@"FAMILY_SOCIALGROUP" domain:302 sourceNode:v131 targetNode:v132];
  v59 = [v11 edgeSchemeWithLabel:@"COWORKER_SOCIALGROUP" domain:302 sourceNode:v131 targetNode:v132];
  v58 = [v11 edgeSchemeWithLabel:@"BIRTHDAY" domain:301 sourceNode:v3 targetNode:v127];
  v57 = [v11 edgeSchemeWithLabel:@"ANNIVERSARY" domain:301 sourceNode:v3 targetNode:v127];
  v56 = [v11 edgeSchemeWithLabel:@"BIRTHDAY" domain:301 sourceNode:v3 targetNode:v131];
  long long v55 = [v11 edgeSchemeWithLabel:@"ANNIVERSARY" domain:301 sourceNode:v3 targetNode:v131];
  long long v54 = [v11 edgeSchemeWithLabel:@"PEOPLE_CONTACT_SUGGESTION" domain:303 sourceNode:v127 targetNode:v128];
  long long v53 = [v11 edgeSchemeWithLabel:@"PEOPLE_CONTACT_SUGGESTION" domain:303 sourceNode:v131 targetNode:v128];
  long long v52 = [v11 edgeSchemeWithLabel:@"RELATIONSHIP_TAG" domain:305 sourceNode:v127 targetNode:v167];
  long long v51 = [v11 edgeSchemeWithLabel:@"DATE" domain:400 sourceNode:v3 targetNode:v125];
  long long v50 = [v11 edgeSchemeWithLabel:@"DAY" domain:400 sourceNode:v125 targetNode:v166];
  long long v49 = [v11 edgeSchemeWithLabel:@"MONTH" domain:400 sourceNode:v125 targetNode:v165];
  long long v48 = [v11 edgeSchemeWithLabel:@"YEAR" domain:400 sourceNode:v125 targetNode:v164];
  long long v47 = [v11 edgeSchemeWithLabel:@"WEEKMONTH" domain:400 sourceNode:v125 targetNode:v163];
  long long v46 = [v11 edgeSchemeWithLabel:@"WEEKYEAR" domain:400 sourceNode:v125 targetNode:v162];
  long long v45 = [v11 edgeSchemeWithLabel:@"SEASON" domain:400 sourceNode:v125 targetNode:v161];
  uint64_t v44 = [v11 edgeSchemeWithLabel:@"PARTOFWEEK" domain:400 sourceNode:v3 targetNode:v160];
  long long v43 = [v11 edgeSchemeWithLabel:@"PARTOFWEEK" domain:400 sourceNode:v3 targetNode:v159];
  long long v42 = [v11 edgeSchemeWithLabel:@"CELEBRATING" domain:401 sourceNode:v3 targetNode:v126];
  long long v41 = [v11 edgeSchemeWithLabel:@"HOLIDAY" domain:401 sourceNode:v125 targetNode:v126];
  __int16 v40 = [v11 edgeSchemeWithLabel:@"PARTOFDAY" domain:400 sourceNode:v3 targetNode:v158];
  unint64_t v39 = [v11 edgeSchemeWithLabel:@"DAYOFWEEK" domain:400 sourceNode:v125 targetNode:v157];
  long long v38 = [v11 edgeSchemeWithLabel:@"ROI" domain:502 sourceNode:v3 targetNode:v156];
  long long v37 = [v11 edgeSchemeWithLabel:@"ROI" domain:502 sourceNode:v3 targetNode:v155];
  long long v36 = [v11 edgeSchemeWithLabel:@"ROI" domain:502 sourceNode:v3 targetNode:v154];
  long long v35 = [v11 edgeSchemeWithLabel:@"ROI" domain:502 sourceNode:v3 targetNode:v153];
  long long v34 = [v11 edgeSchemeWithLabel:@"ROI" domain:502 sourceNode:v3 targetNode:v152];
  uint64_t v33 = [v11 edgeSchemeWithLabel:@"POI" domain:501 sourceNode:v3 targetNode:v151];
  long long v32 = [v11 edgeSchemeWithLabel:@"POI" domain:501 sourceNode:v3 targetNode:v150];
  __int16 v31 = [v11 edgeSchemeWithLabel:@"POI" domain:501 sourceNode:v3 targetNode:v149];
  long long v30 = [v11 edgeSchemeWithLabel:@"POI" domain:501 sourceNode:v3 targetNode:v148];
  long long v29 = [v11 edgeSchemeWithLabel:@"POI" domain:501 sourceNode:v3 targetNode:v147];
  id v28 = [v11 edgeSchemeWithLabel:@"POI" domain:501 sourceNode:v3 targetNode:v146];
  id v27 = [v11 edgeSchemeWithLabel:@"POI" domain:501 sourceNode:v3 targetNode:v145];
  long long v26 = [v11 edgeSchemeWithLabel:@"POI" domain:501 sourceNode:v3 targetNode:v144];
  uint64_t v25 = [v11 edgeSchemeWithLabel:@"POI" domain:501 sourceNode:v3 targetNode:v143];
  id v24 = [v11 edgeSchemeWithLabel:@"BUSINESS" domain:503 sourceNode:v3 targetNode:v129];
  uint64_t v23 = [v11 edgeSchemeWithLabel:@"BUSINESSCATEGORY" domain:504 sourceNode:v129 targetNode:v142];
  double v12 = [v11 edgeSchemeWithLabel:@"PUBLIC_EVENT" domain:900 sourceNode:v3 targetNode:v130];
  unint64_t v13 = [v11 edgeSchemeWithLabel:@"PERFORMER" domain:900 sourceNode:v130 targetNode:v141];
  unint64_t v14 = [v11 edgeSchemeWithLabel:@"CATEGORY" domain:901 sourceNode:v130 targetNode:v140];
  uint64_t v15 = [v11 edgeSchemeWithLabel:@"LOCALIZED_SUBCATEGORY" domain:900 sourceNode:v130 targetNode:v139];
  uint64_t v16 = [v11 edgeSchemeWithLabel:@"PUBLIC_EVENT_BUSINESS" domain:900 sourceNode:v130 targetNode:v129];
  uint64_t v17 = [v11 edgeSchemeWithLabel:@"SCENE" domain:600 sourceNode:v3 targetNode:v138];
  uint64_t v18 = objc_opt_class();
  v173[0] = MEMORY[0x1E4F143A8];
  v173[1] = 3221225472;
  v173[2] = __36__PGGraph_Schema__staticGraphSchema__block_invoke_2;
  v173[3] = &unk_1E68E8980;
  id v19 = v11;
  id v174 = v19;
  id v175 = v3;
  v176 = self;
  id v20 = v3;
  [v18 _traverseMeaningLabelsUsingBlock:v173];
  id v21 = v19;

  return v21;
}

void __36__PGGraph_Schema__staticGraphSchema__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) nodeSchemeWithLabel:a2 domain:700];
}

void __36__PGGraph_Schema__staticGraphSchema__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) nodesForLabel:v3 domain:700];
  uint64_t v5 = [v4 anyObject];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) edgeSchemeWithLabel:@"MEANING" domain:700 sourceNode:*(void *)(a1 + 40) targetNode:v5];
    uint64_t v7 = [(id)objc_opt_class() parentMeaningLabelForMeaningLabel:v3];
    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 32) nodesForLabel:v7 domain:700];
      uint64_t v9 = [v8 anyObject];

      if (v9)
      {
        [*(id *)(a1 + 32) edgeSchemeWithLabel:@"SUBMEANING_OF" domain:700 sourceNode:v5 targetNode:v9];
      }
      else
      {
        id v11 = +[PGLogging sharedLogging];
        double v12 = [v11 loggingConnection];

        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v13 = 138412290;
          id v14 = v3;
          _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "Cannot find meaning node for meaning %@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
  }
  else
  {
    unint64_t v10 = +[PGLogging sharedLogging];
    uint64_t v6 = [v10 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "Cannot find meaning node for meaning %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

+ (id)_meaningLabelTree
{
  v18[5] = *MEMORY[0x1E4F143B8];
  v17[0] = @"Activity";
  uint64_t v2 = MEMORY[0x1E4F1CC08];
  v15[0] = @"Hiking";
  v15[1] = @"Climbing";
  v16[0] = MEMORY[0x1E4F1CC08];
  v16[1] = MEMORY[0x1E4F1CC08];
  void v15[2] = @"Beaching";
  v15[3] = @"Diving";
  v16[2] = MEMORY[0x1E4F1CC08];
  v16[3] = MEMORY[0x1E4F1CC08];
  void v15[4] = @"WinterSport";
  void v16[4] = MEMORY[0x1E4F1CC08];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];
  v18[0] = v3;
  v17[1] = @"Entertainment";
  v13[0] = @"AmusementPark";
  v13[1] = @"SportEvent";
  v14[0] = v2;
  v14[1] = v2;
  void v13[2] = @"Performance";
  v13[3] = @"Concert";
  v14[2] = v2;
  v14[3] = v2;
  void v13[4] = @"Festival";
  v13[5] = @"NightOut";
  void v14[4] = v2;
  v14[5] = v2;
  v13[6] = @"Museum";
  v13[7] = @"Theater";
  v14[6] = v2;
  v14[7] = v2;
  v13[8] = @"Dance";
  v14[8] = v2;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:9];
  v18[1] = v4;
  v17[2] = @"Celebration";
  v11[0] = @"Birthday";
  v11[1] = @"Anniversary";
  v12[0] = v2;
  v12[1] = v2;
  void v11[2] = @"Wedding";
  v11[3] = @"HolidayEvent";
  v12[2] = v2;
  v12[3] = v2;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  v18[2] = v5;
  v17[3] = @"Restaurant";
  v9[0] = @"Breakfast";
  v9[1] = @"Lunch";
  v10[0] = v2;
  v10[1] = v2;
  void v9[2] = @"Dinner";
  v10[2] = v2;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  void v17[4] = @"Gathering";
  v18[3] = v6;
  void v18[4] = v2;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];

  return v7;
}

+ (void)_traverseMeaningLabelsInTree:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__PGGraph_Schema___traverseMeaningLabelsInTree_usingBlock___block_invoke;
  v8[3] = &unk_1E68E89D0;
  id v9 = v6;
  id v10 = a1;
  id v7 = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void __59__PGGraph_Schema___traverseMeaningLabelsInTree_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  *a4 = 0;
  if ([v6 count]) {
    [*(id *)(a1 + 40) _traverseMeaningLabelsInTree:v6 usingBlock:*(void *)(a1 + 32)];
  }
}

+ (void)_traverseMeaningLabelsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _meaningLabelTree];
  [a1 _traverseMeaningLabelsInTree:v5 usingBlock:v4];
}

+ (id)_findParentMeaningLabelForMeaningLabel:(id)a3 inTree:(id)a4 currentParent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__31552;
  id v24 = __Block_byref_object_dispose__31553;
  id v25 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __79__PGGraph_Schema___findParentMeaningLabelForMeaningLabel_inTree_currentParent___block_invoke;
  v15[3] = &unk_1E68E89A8;
  id v11 = v8;
  id v16 = v11;
  uint64_t v18 = &v20;
  id v12 = v10;
  id v17 = v12;
  id v19 = a1;
  [v9 enumerateKeysAndObjectsUsingBlock:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __79__PGGraph_Schema___findParentMeaningLabelForMeaningLabel_inTree_currentParent___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = a3;
  if ([v13 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(id *)(a1 + 40);
    id v10 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 56) _findParentMeaningLabelForMeaningLabel:*(void *)(a1 + 32) inTree:v7 currentParent:v13];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    *a4 = 1;
  }
}

+ (id)parentMeaningLabelForMeaningLabel:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _meaningLabelTree];
  id v6 = [a1 _findParentMeaningLabelForMeaningLabel:v4 inTree:v5 currentParent:0];

  return v6;
}

+ (void)traverseParentMeaningsForMeaningLabel:(id)a3 usingBlock:(id)a4
{
  id v6 = (void (**)(id, void *, unsigned char *))a4;
  id v7 = [a1 parentMeaningLabelForMeaningLabel:a3];
  if (v7)
  {
    char v8 = 0;
    v6[2](v6, v7, &v8);
    if (!v8) {
      [a1 traverseParentMeaningsForMeaningLabel:v7 usingBlock:v6];
    }
  }
}

- (id)_createZeroKeywordMappingByMeaningLabel
{
  v23[9] = *MEMORY[0x1E4F143B8];
  v23[0] = @"AmusementPark";
  v23[1] = @"Concert";
  v23[2] = @"Festival";
  v23[3] = @"SportEvent";
  v23[4] = @"Museum";
  v23[5] = @"Wedding";
  v23[6] = @"Birthday";
  v23[7] = @"Anniversary";
  v23[8] = @"Restaurant";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:9];
  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [(MAGraph *)self anyNodeForLabel:v9 domain:700 properties:0];
        if (v10)
        {
          uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v10, 0);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __58__PGGraph_Search___createZeroKeywordMappingByMeaningLabel__block_invoke;
          v16[3] = &unk_1E68EDAB8;
          id v17 = v11;
          id v12 = v11;
          [v10 traverseSubmeaningHierarchyUsingBlock:v16];
          id v13 = [[PGZeroKeywordMapping alloc] initWithDisplayNode:v10 mappedMeaningNodes:v12];
          [v15 setObject:v13 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v15;
}

void __58__PGGraph_Search___createZeroKeywordMappingByMeaningLabel__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 label];
  char v4 = [v3 isEqualToString:@"HolidayEvent"];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (NSDictionary)zeroKeywordMappingByMeaningLabel
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  zeroKeywordMappingByMeaningLabel = v2->_zeroKeywordMappingByMeaningLabel;
  if (!zeroKeywordMappingByMeaningLabel)
  {
    uint64_t v4 = [(PGGraph *)v2 _createZeroKeywordMappingByMeaningLabel];
    id v5 = v2->_zeroKeywordMappingByMeaningLabel;
    v2->_zeroKeywordMappingByMeaningLabel = (NSDictionary *)v4;

    zeroKeywordMappingByMeaningLabel = v2->_zeroKeywordMappingByMeaningLabel;
  }
  uint64_t v6 = zeroKeywordMappingByMeaningLabel;
  objc_sync_exit(v2);

  return v6;
}

- (id)nodeLabelForHighlightType:(unsigned __int16)a3
{
  if (a3 > 7u)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = *off_1E68E9D28[a3];
  }
  return v4;
}

- (id)onGoingTripNodes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PGGraph *)self onGoingTripHighlightTypeNode];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__PGGraph_Highlight__onGoingTripNodes__block_invoke;
  v7[3] = &unk_1E68EB678;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateNeighborNodesThroughEdgesWithLabel:@"HAS_TYPE" domain:103 usingBlock:v7];

  return v5;
}

uint64_t __38__PGGraph_Highlight__onGoingTripNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateHighlightGroupNodesWithBlock:(id)a3
{
}

- (id)highlightGroupNodesSortedByDate
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PGGraph *)self highlightGroupNodes];
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalEndDate", 1, v3);
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  void v9[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];

  uint64_t v7 = [v2 sortedArrayUsingDescriptors:v6];

  return v7;
}

- (id)highlightGroupNodes
{
  return [(MAGraph *)self nodesForLabel:@"HighlightGroup" domain:102];
}

- (void)enumerateDayHighlightNodesWithBlock:(id)a3
{
}

- (id)dayHighlightNodesSortedByDate
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PGGraph *)self dayHighlightNodes];
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalEndDate", 1, v3);
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  void v9[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];

  uint64_t v7 = [v2 sortedArrayUsingDescriptors:v6];

  return v7;
}

- (id)dayHighlightNodes
{
  uint64_t v2 = +[PGGraphHighlightNodeCollection dayHighlightNodesInGraph:self];
  id v3 = [v2 temporarySet];

  return v3;
}

- (id)defaultHighlightNodes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PGGraph *)self dayHighlightNodes];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 isPartOfTrip] & 1) == 0 && (objc_msgSend(v9, "isPartOfAggregation") & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)aggregationNodes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PGGraph *)self aggregationHighlightTypeNode];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__PGGraph_Highlight__aggregationNodes__block_invoke;
  v7[3] = &unk_1E68EB678;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateNeighborNodesThroughEdgesWithLabel:@"HAS_TYPE" domain:103 usingBlock:v7];

  return v5;
}

uint64_t __38__PGGraph_Highlight__aggregationNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)allTripNodes
{
  id v3 = [(PGGraph *)self longTripNodes];
  uint64_t v4 = [(PGGraph *)self shortTripNodes];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (id)shortTripNodes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PGGraph *)self shortTripHighlightTypeNode];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__PGGraph_Highlight__shortTripNodes__block_invoke;
  v7[3] = &unk_1E68EB678;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateNeighborNodesThroughEdgesWithLabel:@"HAS_TYPE" domain:103 usingBlock:v7];

  return v5;
}

uint64_t __36__PGGraph_Highlight__shortTripNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)longTripNodes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PGGraph *)self longTripHighlightTypeNode];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__PGGraph_Highlight__longTripNodes__block_invoke;
  v7[3] = &unk_1E68EB678;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateNeighborNodesThroughEdgesWithLabel:@"HAS_TYPE" domain:103 usingBlock:v7];

  return v5;
}

uint64_t __35__PGGraph_Highlight__longTripNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)defaultHighlightTypeNode
{
  uint64_t v2 = [(MAGraph *)self nodesForLabel:@"Default" domain:103];
  id v3 = [v2 anyObject];

  return v3;
}

- (id)onGoingTripHighlightTypeNode
{
  uint64_t v2 = [(MAGraph *)self nodesForLabel:@"OngoingTrip" domain:103];
  id v3 = [v2 anyObject];

  return v3;
}

- (id)aggregationHighlightTypeNode
{
  uint64_t v2 = [(MAGraph *)self nodesForLabel:@"Aggregation" domain:103];
  id v3 = [v2 anyObject];

  return v3;
}

- (id)shortTripHighlightTypeNode
{
  uint64_t v2 = [(MAGraph *)self nodesForLabel:@"ShortTrip" domain:103];
  id v3 = [v2 anyObject];

  return v3;
}

- (id)longTripHighlightTypeNode
{
  uint64_t v2 = [(MAGraph *)self nodesForLabel:@"LongTrip" domain:103];
  id v3 = [v2 anyObject];

  return v3;
}

- (id)meaningfulMomentNodesSortedByDate
{
  void v10[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PGGraph *)self meaningfulEvents];
  id v3 = [v2 allObjects];
  uint64_t v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  id v5 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalEndDate", 1, v4);
  v10[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  v10[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  id v8 = [v3 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (id)momentNodesSortedByDateFromMomentNodes:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F29008];
  id v4 = a3;
  id v5 = [v3 sortDescriptorWithKey:@"universalStartDate" ascending:1];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalEndDate", 1, v5);
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  void v11[2] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];

  uint64_t v9 = [v4 sortedArrayUsingDescriptors:v8];

  return v9;
}

- (id)momentNodesSortedByDate
{
  void v10[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PGGraph *)self momentNodes];
  id v3 = [v2 set];
  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  id v5 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalEndDate", 1, v4);
  v10[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  v10[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  id v8 = [v3 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (id)momentNodes
{
  return +[PGGraphNodeCollection nodesInGraph:self];
}

- (unint64_t)numberOfMomentNodes
{
  return [(MAGraph *)self nodesCountForLabel:@"Moment" domain:100];
}

- (BOOL)exportMatchMomentEventResults:(id)a3 relatedType:(unint64_t)a4 focusOnNodes:(id)a5 toFileURL:(id)a6 error:(id *)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v39 = a6;
  id v12 = a3;
  [(PGGraph *)self _checkCanRead];
  long long v13 = +[PGGraphMatchingOptions optionsWithRelatedType:a4];
  [v13 setFocusedNodes:v11];
  long long v14 = [(id)objc_opt_class() defaultMatchingSortDescriptors];
  [v13 setSortDescriptors:v14];

  id v15 = [(PGGraph *)self matchEvent:v12 options:v13];
  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  id v17 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = [MEMORY[0x1E4F1CA60] dictionary];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __92__PGGraph_Matching__exportMatchMomentEventResults_relatedType_focusOnNodes_toFileURL_error___block_invoke;
  v40[3] = &unk_1E68EC408;
  id v19 = v17;
  id v41 = v19;
  id v20 = v18;
  id v42 = v20;
  long long v37 = v15;
  [v15 enumerateObjectsUsingBlock:v40];
  long long v21 = NSNumber;
  uint64_t v22 = [v12 identifier];

  uint64_t v23 = [v21 numberWithUnsignedInteger:v22];
  [v16 setObject:v23 forKeyedSubscript:@"reference_identifier"];

  id v24 = [NSNumber numberWithUnsignedInteger:a4];
  [v16 setObject:v24 forKeyedSubscript:@"relatedType"];

  [v16 setObject:v19 forKeyedSubscript:@"related_identifier"];
  [v16 setObject:v20 forKeyedSubscript:@"results"];
  if (v11)
  {
    id v25 = [v11 valueForKeyPath:@"identifier"];
    long long v26 = [v25 allObjects];
    [v16 setObject:v26 forKeyedSubscript:@"focusNodeIdentifiers"];
  }
  id v27 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initWithURL:v39 append:0];
  [v28 open];
  uint64_t v29 = [MEMORY[0x1E4F28F98] writePropertyList:v16 toStream:v28 format:100 options:0 error:a7];
  if (v29)
  {
    [v28 close];
    long long v30 = +[PGLogging sharedLogging];
    __int16 v31 = [v30 loggingConnection];

    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v31, OS_LOG_TYPE_ERROR, "Export matching result done!", buf, 2u);
    }

    long long v32 = v39;
  }
  else
  {
    uint64_t v33 = +[PGLogging sharedLogging];
    long long v34 = [v33 loggingConnection];

    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v36 = *a7;
      *(_DWORD *)buf = 136315394;
      uint64_t v44 = "-[PGGraph(Matching) exportMatchMomentEventResults:relatedType:focusOnNodes:toFileURL:error:]";
      __int16 v45 = 2112;
      id v46 = v36;
      _os_log_error_impl(&dword_1D1805000, v34, OS_LOG_TYPE_ERROR, "%s - %@", buf, 0x16u);
    }

    [v28 close];
    long long v32 = v39;
    [v27 removeItemAtURL:v39 error:0];
  }

  return v29 != 0;
}

void __92__PGGraph_Matching__exportMatchMomentEventResults_relatedType_focusOnNodes_toFileURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = NSNumber;
  id v5 = a2;
  uint64_t v6 = [v5 event];
  uint64_t v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "identifier"));
  [v3 addObject:v7];

  id v8 = NSString;
  uint64_t v9 = [v5 event];
  objc_msgSend(v8, "stringWithFormat:", @"%ld", objc_msgSend(v9, "identifier"));
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  id v11 = NSNumber;
  id v12 = [v5 event];
  long long v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "identifier"));
  [v10 setObject:v13 forKeyedSubscript:@"eventIdentifier"];

  long long v14 = NSNumber;
  [v5 score];
  id v15 = objc_msgSend(v14, "numberWithDouble:");
  [v10 setObject:v15 forKeyedSubscript:@"score"];

  uint64_t v16 = [v5 debugDescription];

  [v10 setObject:v16 forKeyedSubscript:@"debugDescription"];
  [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v17];
}

- (id)_eventsFromEvents:(id)a3 withTargetDomain:(unsigned __int16)a4
{
  int v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 anyObject];
  int v7 = [v6 domain];

  if (v7 == v4)
  {
    id v8 = v5;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA80] set];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (v4 == 102)
          {
            id v15 = objc_msgSend(v14, "connectedEventsWithTargetDomain:", 102, (void)v21);
            [v8 unionSet:v15];
          }
          else
          {
            if (v4 != 100)
            {
              long long v18 = +[PGLogging sharedLogging];
              id v19 = [v18 loggingConnection];

              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                int v26 = v4;
                _os_log_error_impl(&dword_1D1805000, v19, OS_LOG_TYPE_ERROR, "Unsupported target domain: %hu", buf, 8u);
              }

              goto LABEL_18;
            }
            id v15 = [v14 eventCollection];
            uint64_t v16 = [v15 eventMomentNodes];
            id v17 = [v16 temporarySet];
            [v8 unionSet:v17];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
  return v8;
}

- (id)_commonAreaNodesBetweenAddressAreaNodes:(id)a3 andAddressNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    int v7 = [v6 collection];
    id v8 = [v7 areaNodes];
    id v9 = [v5 collectionByIntersecting:v8];
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (id)_commonAreaNodesBetweenAddressNode:(id)a3 andAddressNode:(id)a4
{
  id v6 = a4;
  int v7 = [a3 collection];
  id v8 = [v7 areaNodes];

  id v9 = [(PGGraph *)self _commonAreaNodesBetweenAddressAreaNodes:v8 andAddressNode:v6];

  return v9;
}

- (id)_closestLocationNodeFromAddressNode:(id)a3 toAddressNode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isSameNodeAsNode:v7])
  {
    id v8 = v6;
    goto LABEL_22;
  }
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  long long v43 = __Block_byref_object_copy__54860;
  uint64_t v44 = __Block_byref_object_dispose__54861;
  id v45 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __71__PGGraph_Matching___closestLocationNodeFromAddressNode_toAddressNode___block_invoke;
  v39[3] = &unk_1E68EC3A0;
  v39[4] = &v40;
  [v6 enumerateNeighborNodesThroughOutEdgesUsingBlock:v39];
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__54860;
  long long v37 = __Block_byref_object_dispose__54861;
  id v38 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __71__PGGraph_Matching___closestLocationNodeFromAddressNode_toAddressNode___block_invoke_2;
  v32[3] = &unk_1E68EC3A0;
  v32[4] = &v33;
  [v7 enumerateNeighborNodesThroughOutEdgesUsingBlock:v32];
  if ([(id)v41[5] isSameNodeAsNode:v34[5]])
  {
    id v9 = v34;
  }
  else
  {
    uint64_t v10 = (void *)v41[5];
    id v9 = v34;
    if (v10 && v34[5])
    {
      uint64_t v11 = [v10 label];
      [(PGGraph *)self _distanceForLocationLabel:v11];
      double v13 = v12;

      long long v14 = [(id)v34[5] label];
      [(PGGraph *)self _distanceForLocationLabel:v14];
      double v16 = v15;
      while (1)
      {

        int v17 = [(id)v41[5] isSameNodeAsNode:v34[5]];
        long long v18 = (void *)v41[5];
        if (v17) {
          break;
        }
        id v19 = v34;
        if (!v18 || !v34[5]) {
          goto LABEL_18;
        }
        if (v13 <= v16)
        {
          id v25 = [v18 locationNodeCollection];
          int v26 = [v25 parentLocationNodes];
          uint64_t v27 = [v26 anyNode];
          uint64_t v28 = (void *)v41[5];
          v41[5] = v27;

          long long v14 = [(id)v41[5] label];
          [(PGGraph *)self _distanceForLocationLabel:v14];
          double v13 = v29;
        }
        else
        {
          id v20 = [(id)v34[5] locationNodeCollection];
          long long v21 = [v20 parentLocationNodes];
          uint64_t v22 = [v21 anyNode];
          long long v23 = (void *)v34[5];
          v34[5] = v22;

          long long v14 = [(id)v34[5] label];
          [(PGGraph *)self _distanceForLocationLabel:v14];
          double v16 = v24;
        }
      }
      id v19 = v34;
LABEL_18:
      if (![v18 isSameNodeAsNode:v19[5]])
      {
        id v8 = 0;
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  if (v9[5] && (objc_msgSend((id)v41[5], "isSameNodeAsNode:") & 1) != 0)
  {
LABEL_19:
    long long v30 = (void *)v41[5];
    goto LABEL_20;
  }
  long long v30 = 0;
LABEL_20:
  id v8 = v30;
LABEL_21:
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v40, 8);
LABEL_22:

  return v8;
}

void __71__PGGraph_Matching___closestLocationNodeFromAddressNode_toAddressNode___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 domain] == 200)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __71__PGGraph_Matching___closestLocationNodeFromAddressNode_toAddressNode___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 domain] == 200)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)_firstLocationNodeFromAddressNode:(id)a3 inLocationNodes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 containsNode:v5])
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [v5 collection];
    id v9 = [v8 parentLocationNodes];

    if ([v9 count])
    {
      while (([v6 intersectsCollection:v9] & 1) == 0)
      {
        uint64_t v10 = [v9 parentLocationNodes];

        id v9 = v10;
        if (![v10 count]) {
          goto LABEL_8;
        }
      }
    }
    uint64_t v10 = v9;
LABEL_8:
    id v7 = [v10 anyNode];
  }
  return v7;
}

- (double)_distanceForLocationLabel:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = 0.0;
  if (([v3 isEqualToString:@"Address"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"Number"])
    {
      double v4 = 0.01;
    }
    else if ([v3 isEqualToString:@"Street"])
    {
      double v4 = 0.1;
    }
    else if ([v3 isEqualToString:@"District"])
    {
      double v4 = 0.3;
    }
    else
    {
      double v4 = 0.5;
      if (([v3 isEqualToString:@"City"] & 1) == 0)
      {
        if ([v3 isEqualToString:@"County"])
        {
          double v4 = 0.8;
        }
        else if ([v3 isEqualToString:@"State"])
        {
          double v4 = 0.9;
        }
        else if ([v3 isEqualToString:@"Country"])
        {
          double v4 = 0.95;
        }
        else
        {
          id v5 = +[PGLogging sharedLogging];
          id v6 = [v5 loggingConnection];

          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            int v8 = 138412290;
            id v9 = v3;
            _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "Error: unknown location label '%@'", (uint8_t *)&v8, 0xCu);
          }

          double v4 = 1.0;
        }
      }
    }
  }

  return v4;
}

- (double)relationshipScoreForPersonNode:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PGGraph *)self meNode];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v19 = v24 = 0u;
  id v20 = v4;
  id v5 = [v19 edgesTowardNode:v4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [*(id *)(*((void *)&v21 + 1) + 8 * i) label];
        char v12 = [v11 isEqualToString:@"VIP"];
        double v13 = 1.0;
        if ((v12 & 1) == 0)
        {
          char v14 = objc_msgSend(v11, "isEqualToString:", @"PARTNER", 1.0);
          double v13 = 0.9;
          if ((v14 & 1) == 0)
          {
            char v15 = objc_msgSend(v11, "isEqualToString:", @"FAMILY", 0.9);
            double v13 = 0.8;
            if ((v15 & 1) == 0)
            {
              char v16 = objc_msgSend(v11, "isEqualToString:", @"FRIEND", 0.8);
              double v13 = 0.7;
              if ((v16 & 1) == 0)
              {
                char v17 = objc_msgSend(v11, "isEqualToString:", @"COWORKER", 0.7);
                double v13 = 0.4;
                if ((v17 & 1) == 0)
                {
                  if (objc_msgSend(v11, "isEqualToString:", @"ACQUAINTANCE", 0.4)) {
                    double v13 = 0.3;
                  }
                  else {
                    double v13 = 0.0;
                  }
                }
              }
            }
          }
        }
        if (v13 > v9) {
          double v9 = v13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (double)_scoreForPlaceSubDomain:(unsigned __int16)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 == 501) {
    return 1.0;
  }
  int v3 = a3;
  if (a3 == 502) {
    return 0.9;
  }
  id v5 = +[PGLogging sharedLogging];
  uint64_t v6 = [v5 loggingConnection];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "Error: unknown category domain '%d'", (uint8_t *)v7, 8u);
  }

  return 0.0;
}

- (id)_coreSceneMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v36 = a4;
  id v9 = a5;
  uint64_t v35 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  char v12 = [(id)objc_opt_class() matchingBlockedSceneLabels];
  uint64_t v13 = [v11 setWithArray:v12];

  long long v34 = (void *)v13;
  char v14 = [(PGGraph *)self sceneNodesForSceneNames:v13];
  char v15 = [v8 eventCollection];
  char v16 = [v15 eventMomentNodes];

  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v54[3] = 0;
  char v17 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = [MEMORY[0x1E4F1CA60] dictionary];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke;
  v46[3] = &unk_1E68EC378;
  id v19 = v8;
  id v47 = v19;
  id v20 = v14;
  id v48 = v20;
  long long v53 = v54;
  id v21 = v9;
  id v49 = v21;
  id v22 = v17;
  id v50 = v22;
  id v23 = v18;
  id v51 = v23;
  id v24 = v10;
  id v52 = v24;
  [v16 enumerateNodesUsingBlock:v46];
  uint64_t v33 = v16;
  LOBYTE(v15) = [v21 needsKeywords];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke_4;
  v37[3] = &unk_1E68EC300;
  v37[4] = self;
  long long v43 = v54;
  id v25 = v23;
  id v38 = v25;
  id v26 = v24;
  id v39 = v26;
  long long v44 = xmmword_1D1F4F270;
  id v27 = v19;
  id v40 = v27;
  char v45 = (char)v15;
  id v28 = v36;
  id v41 = v28;
  id v29 = v35;
  id v42 = v29;
  [v22 enumerateKeysAndObjectsUsingBlock:v37];
  long long v30 = v42;
  id v31 = v29;

  _Block_object_dispose(v54, 8);
  return v31;
}

void __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 relatableEvent];
  [v5 weightForMoment:v4];
  uint64_t v7 = v6;

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke_2;
  v17[3] = &unk_1E68EC328;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 80);
  id v18 = v8;
  uint64_t v19 = v9;
  uint64_t v20 = v7;
  [v4 enumerateSceneEdgesAndNodesUsingBlock:v17];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke_3;
  void v10[3] = &unk_1E68EC350;
  id v11 = *(id *)(a1 + 40);
  uint64_t v16 = v7;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 72);
  [v4 enumerateSiblingNodesThroughEdgesWithLabel:0 domain:600 usingBlock:v10];
}

void __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "nodeForIdentifier:", objc_msgSend(v5, "unsignedIntegerValue"));
  double v8 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  [v9 doubleValue];
  double v11 = v8 + v10;
  [v6 doubleValue];
  double v13 = 1.0 - ((v11 + 1.0) / (v11 + 1.0 + v12 - v11) + -1.0) / v11;

  id v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
  id v15 = [[PGGraphMatchingResult alloc] initWithEvent:v7];
  [(PGGraphMatchingResult *)v15 setScore:v13];
  uint64_t v16 = [PGGraphMatchingContextItem alloc];
  uint64_t v17 = *(void *)(a1 + 88);
  [(PGGraphMatchingResult *)v15 score];
  id v18 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v16, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", v17, *(void *)(a1 + 96), *(void *)(a1 + 56), v7, v14);
  [(PGGraphMatchingResult *)v15 setContextItem:v18 forRelatedType:*(void *)(a1 + 88)];
  if (*(unsigned char *)(a1 + 104) && [v7 isSameNodeAsNode:*(void *)(a1 + 64)])
  {
    id v27 = v7;
    id v28 = v6;
    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = v14;
    id v20 = v14;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = [*(id *)(*((void *)&v29 + 1) + 8 * i) keywordDescription];
          [v19 addObject:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v22);
    }

    [(PGGraphMatchingResult *)v15 addKeywords:v19 forRelatedType:*(void *)(a1 + 88)];
    uint64_t v7 = v27;
    id v6 = v28;
    id v14 = v26;
  }
  [*(id *)(a1 + 72) setObject:v15 forKey:v5];
}

void __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (([*(id *)(a1 + 32) containsNode:a3] & 1) == 0)
  {
    [v6 confidence];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24)
                                                                + v5 * *(double *)(a1 + 48);
  }
}

void __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v42 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([*(id *)(a1 + 32) containsNode:v10] & 1) == 0)
  {
    id v40 = v11;
    [v11 confidence];
    double v13 = v12;
    double v14 = *(double *)(a1 + 72);
    objc_msgSend(v9, "connectedEventsWithTargetDomain:", objc_msgSend(*(id *)(a1 + 40), "targetEventDomain"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      double v17 = v13 * v14;
      uint64_t v18 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          [v42 confidence];
          double v22 = v21;
          id v23 = v9;
          [v20 weightForMoment:v9];
          double v25 = v22 * v24;
          id v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "identifier"));
          id v27 = [*(id *)(a1 + 48) objectForKeyedSubscript:v26];

          if (v27)
          {
            id v28 = [*(id *)(a1 + 48) objectForKeyedSubscript:v26];
            [v28 doubleValue];
            double v30 = v17 + v25 + v29;

            long long v31 = [NSNumber numberWithDouble:v30];
            [*(id *)(a1 + 48) setObject:v31 forKeyedSubscript:v26];

            long long v32 = [*(id *)(a1 + 56) objectForKeyedSubscript:v26];
            [v32 doubleValue];
            double v34 = v25 + v33;

            uint64_t v35 = [NSNumber numberWithDouble:v34];
            id v36 = (id *)(a1 + 56);
          }
          else
          {
            long long v37 = [NSNumber numberWithDouble:v17 + v25];
            [*(id *)(a1 + 48) setObject:v37 forKeyedSubscript:v26];

            id v38 = [NSNumber numberWithDouble:v25];
            [*(id *)(a1 + 56) setObject:v38 forKeyedSubscript:v26];

            uint64_t v35 = [MEMORY[0x1E4F1CA80] set];
            id v36 = (id *)(a1 + 64);
          }
          [*v36 setObject:v35 forKeyedSubscript:v26];

          id v39 = [*(id *)(a1 + 64) objectForKeyedSubscript:v26];
          [v39 addObject:v10];

          id v9 = v23;
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v16);
    }

    id v11 = v40;
  }
}

- (id)_sceneMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v8 = a4;
  id v9 = [(PGGraph *)self _coreSceneMatchingFromEvent:a3 toEvent:v8 options:a5];
  id v10 = NSNumber;
  uint64_t v11 = [v8 identifier];

  double v12 = [v10 numberWithUnsignedInteger:v11];
  double v13 = [v9 objectForKeyedSubscript:v12];

  return v13;
}

- (id)_sceneMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4
{
  return [(PGGraph *)self _coreSceneMatchingFromEvent:a3 toEvent:0 options:a4];
}

- (id)_corePlaceMatchingIdsToScoresFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v34 = a4;
  id v9 = a5;
  double v33 = [MEMORY[0x1E4F1CA60] dictionary];
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v11 = [NSNumber numberWithUnsignedShort:501];
  v54[0] = v11;
  double v12 = [NSNumber numberWithUnsignedShort:502];
  v54[1] = v12;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];

  double v14 = [v8 eventCollection];
  uint64_t v15 = [v14 eventMomentNodes];

  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v53[3] = 0;
  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  double v17 = [MEMORY[0x1E4F1CA60] dictionary];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke;
  v44[3] = &unk_1E68EC2D8;
  id v18 = v8;
  id v45 = v18;
  id v19 = v13;
  id v52 = v53;
  id v46 = v19;
  id v47 = self;
  id v20 = v9;
  id v48 = v20;
  id v21 = v16;
  id v49 = v21;
  id v22 = v17;
  id v50 = v22;
  id v23 = v10;
  id v51 = v23;
  [v15 enumerateNodesUsingBlock:v44];
  char v24 = [v20 needsKeywords];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke_4;
  v35[3] = &unk_1E68EC300;
  v35[4] = self;
  id v41 = v53;
  id v25 = v22;
  id v36 = v25;
  id v26 = v23;
  id v37 = v26;
  long long v42 = xmmword_1D1F4F280;
  id v27 = v18;
  id v38 = v27;
  char v43 = v24;
  id v28 = v34;
  id v39 = v28;
  id v29 = v33;
  id v40 = v29;
  [v21 enumerateKeysAndObjectsUsingBlock:v35];
  double v30 = v40;
  id v31 = v29;

  _Block_object_dispose(v53, 8);
  return v31;
}

void __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 relatableEvent];
  [v5 weightForMoment:v4];
  uint64_t v7 = v6;

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke_2;
  v18[3] = &unk_1E68EC288;
  uint64_t v8 = *(void *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 40);
  void v18[4] = *(void *)(a1 + 48);
  v18[5] = v8;
  void v18[6] = v7;
  [v4 enumerateNeighborEdgesAndNodesThroughEdgesWithDomains:v9 usingBlock:v18];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke_3;
  v12[3] = &unk_1E68EC2B0;
  uint64_t v17 = v7;
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void **)(a1 + 56);
  void v12[4] = *(void *)(a1 + 48);
  id v13 = v11;
  id v14 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 72);
  id v16 = *(id *)(a1 + 80);
  [v4 enumerateSiblingNodesThroughEdgesWithDomains:v10 usingBlock:v12];
}

void __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "nodeForIdentifier:", objc_msgSend(v5, "unsignedIntegerValue"));
  double v8 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  [v9 doubleValue];
  double v11 = v8 + v10;
  [v6 doubleValue];
  double v13 = 1.0 - ((v11 + 1.0) / (v11 + 1.0 + v12 - v11) + -1.0) / v11;

  id v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
  id v15 = [[PGGraphMatchingResult alloc] initWithEvent:v7];
  [(PGGraphMatchingResult *)v15 setScore:v13];
  id v16 = [PGGraphMatchingContextItem alloc];
  uint64_t v17 = *(void *)(a1 + 88);
  [(PGGraphMatchingResult *)v15 score];
  id v18 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v16, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", v17, *(void *)(a1 + 96), *(void *)(a1 + 56), v7, v14);
  [(PGGraphMatchingResult *)v15 setContextItem:v18 forRelatedType:*(void *)(a1 + 88)];
  if (*(unsigned char *)(a1 + 104) && [v7 isSameNodeAsNode:*(void *)(a1 + 64)])
  {
    id v27 = v7;
    id v28 = v6;
    id v19 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = v14;
    id v20 = v14;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = [*(id *)(*((void *)&v29 + 1) + 8 * i) keywordDescription];
          [v19 addObject:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v22);
    }

    [(PGGraphMatchingResult *)v15 addKeywords:v19 forRelatedType:*(void *)(a1 + 88)];
    uint64_t v7 = v27;
    id v6 = v28;
    id v14 = v26;
  }
  [*(id *)(a1 + 72) setObject:v15 forKey:v5];
}

void __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 domain] == 501 || (double v6 = 0.0, objc_msgSend(v9, "domain") == 502))
  {
    [v9 confidence];
    double v6 = v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "_scoreForPlaceSubDomain:", objc_msgSend(v5, "domain"));
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + v6 * v8 * *(double *)(a1 + 48);
}

void __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v45 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v11 domain] == 501 || (double v12 = 0.0, objc_msgSend(v11, "domain") == 502))
  {
    [v11 confidence];
    double v12 = v13;
  }
  double v14 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "_scoreForPlaceSubDomain:", objc_msgSend(v10, "domain", v11));
  double v16 = v15;
  objc_msgSend(v45, "connectedEventsWithTargetDomain:", objc_msgSend(*(id *)(a1 + 40), "targetEventDomain"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    double v19 = v12 * v14;
    uint64_t v20 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        if ([v9 domain] == 501
          || (double v23 = 0.0, [v9 domain] == 502))
        {
          [v9 confidence];
          double v23 = v24;
        }
        [v22 weightForMoment:v45];
        double v26 = v23 * v25;
        double v27 = v16 * (v19 + v26);
        double v28 = v16 * v26;
        long long v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "identifier"));
        long long v30 = [*(id *)(a1 + 48) objectForKeyedSubscript:v29];

        if (v30)
        {
          long long v31 = [*(id *)(a1 + 48) objectForKeyedSubscript:v29];
          [v31 doubleValue];
          double v33 = v27 + v32;

          uint64_t v34 = [NSNumber numberWithDouble:v33];
          [*(id *)(a1 + 48) setObject:v34 forKeyedSubscript:v29];

          uint64_t v35 = [*(id *)(a1 + 56) objectForKeyedSubscript:v29];
          [v35 doubleValue];
          double v37 = v28 + v36;

          id v38 = [NSNumber numberWithDouble:v37];
          id v39 = (id *)(a1 + 56);
        }
        else
        {
          id v40 = [NSNumber numberWithDouble:v27];
          [*(id *)(a1 + 48) setObject:v40 forKeyedSubscript:v29];

          id v41 = [NSNumber numberWithDouble:v28];
          [*(id *)(a1 + 56) setObject:v41 forKeyedSubscript:v29];

          id v38 = [MEMORY[0x1E4F1CA80] set];
          id v39 = (id *)(a1 + 64);
        }
        [*v39 setObject:v38 forKeyedSubscript:v29];

        long long v42 = [*(id *)(a1 + 64) objectForKeyedSubscript:v29];
        [v42 addObject:v10];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v18);
  }
}

- (id)_placeMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v8 = a4;
  id v9 = [(PGGraph *)self _corePlaceMatchingIdsToScoresFromEvent:a3 toEvent:v8 options:a5];
  id v10 = NSNumber;
  uint64_t v11 = [v8 identifier];

  double v12 = [v10 numberWithUnsignedInteger:v11];
  double v13 = [v9 objectForKeyedSubscript:v12];

  return v13;
}

- (id)_placeMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4
{
  return [(PGGraph *)self _corePlaceMatchingIdsToScoresFromEvent:a3 toEvent:0 options:a4];
}

- (id)_coreEventMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v53 = a4;
  id v59 = a5;
  int v52 = [v59 needsKeywords];
  v57 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = [MEMORY[0x1E4F1CA80] set];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v10 = [v8 celebratedHolidayNodes];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v77 objects:v83 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v78;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v78 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = [*(id *)(*((void *)&v77 + 1) + 8 * v14) collection];
        double v16 = [v15 celebratingMomentNodes];
        uint64_t v17 = [v16 temporarySet];

        uint64_t v18 = -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v17, [v59 targetEventDomain]);
        [v9 unionSet:v18];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v77 objects:v83 count:16];
    }
    while (v12);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v9;
  double v19 = v53;
  int v20 = v52;
  uint64_t v60 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
  if (v60)
  {
    uint64_t v58 = *(void *)v74;
    id v51 = v8;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v74 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void **)(*((void *)&v73 + 1) + 8 * v21);
        if (!v19 || [*(id *)(*((void *)&v73 + 1) + 8 * v21) isSameNodeAsNode:v19])
        {
          double v23 = [PGGraphMatchingResult alloc];
          double v24 = [v22 relatableEvent];
          double v25 = [(PGGraphMatchingResult *)v23 initWithEvent:v24];

          [(PGGraphMatchingResult *)v25 setScore:0.9];
          double v26 = [v22 dateNodes];
          double v27 = [PGGraphMatchingContextItem alloc];
          [(PGGraphMatchingResult *)v25 score];
          v61 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v27, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 8, 4, v8, v22, v26);
          -[PGGraphMatchingResult setContextItem:forRelatedType:](v25, "setContextItem:forRelatedType:");
          if (v20)
          {
            v56 = v25;
            double v28 = [MEMORY[0x1E4F1CA48] array];
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            long long v55 = v26;
            id v29 = v26;
            uint64_t v30 = [v29 countByEnumeratingWithState:&v69 objects:v81 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = *(void *)v70;
              do
              {
                uint64_t v33 = 0;
                do
                {
                  if (*(void *)v70 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  uint64_t v34 = NSString;
                  uint64_t v35 = [*(id *)(*((void *)&v69 + 1) + 8 * v33) keywordDescription];
                  double v36 = [v34 stringWithFormat:@"%@ - Celebrated Holiday Date", v35];
                  [v28 addObject:v36];

                  ++v33;
                }
                while (v31 != v33);
                uint64_t v31 = [v29 countByEnumeratingWithState:&v69 objects:v81 count:16];
              }
              while (v31);
            }

            double v25 = v56;
            [(PGGraphMatchingResult *)v56 addKeywords:v28 forRelatedType:8];

            id v8 = v51;
            double v19 = v53;
            int v20 = v52;
            double v26 = v55;
          }
          double v37 = NSNumber;
          [(PGGraphMatchingResult *)v25 event];
          id v39 = v38 = v25;
          id v40 = objc_msgSend(v37, "numberWithUnsignedInteger:", objc_msgSend(v39, "identifier"));
          [v57 setObject:v38 forKey:v40];
        }
        ++v21;
      }
      while (v21 != v60);
      uint64_t v60 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
    }
    while (v60);
  }

  id v41 = [v8 eventCollection];
  long long v42 = [v41 eventMomentNodes];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __65__PGGraph_Matching___coreEventMatchingFromEvent_toEvent_options___block_invoke;
  v62[3] = &unk_1E68EC260;
  id v63 = v59;
  id v64 = v19;
  id v43 = v57;
  id v66 = v8;
  uint64_t v67 = 8;
  id v65 = v43;
  char v68 = v20;
  id v44 = v8;
  id v45 = v19;
  id v46 = v59;
  [v42 enumerateNodesUsingBlock:v62];

  long long v47 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v44, "identifier"));
  [v43 removeObjectForKey:v47];

  long long v48 = v66;
  id v49 = v43;

  return v49;
}

void __65__PGGraph_Matching___coreEventMatchingFromEvent_toEvent_options___block_invoke(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __65__PGGraph_Matching___coreEventMatchingFromEvent_toEvent_options___block_invoke_2;
  v7[3] = &unk_1E68EC238;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  double v6 = *(void **)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  id v10 = v4;
  uint64_t v12 = v5;
  id v11 = v6;
  char v13 = *(unsigned char *)(a1 + 72);
  [a2 enumerateSiblingNodesThroughEdgesWithLabel:0 domain:301 usingBlock:v7];
}

void __65__PGGraph_Matching___coreEventMatchingFromEvent_toEvent_options___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v53 = a4;
  id v49 = a5;
  id v11 = [v49 label];
  if (([v11 isEqualToString:@"BIRTHDAY"] & 1) != 0
    || (double v12 = 0.0, [v11 isEqualToString:@"ANNIVERSARY"]))
  {
    [v49 confidence];
    double v12 = v13;
  }
  uint64_t v14 = [v10 label];
  if (([v14 isEqualToString:@"BIRTHDAY"] & 1) != 0
    || (double v15 = 0.0, [v14 isEqualToString:@"ANNIVERSARY"]))
  {
    [v10 confidence];
    double v15 = v16;
  }
  id v46 = v11;
  long long v47 = v10;
  id v45 = v14;
  int v17 = [v11 isEqualToString:v14];
  double v18 = v12 * v15;
  double v19 = v12 * v15 * 0.5;
  uint64_t v20 = 23;
  if (!v17) {
    uint64_t v20 = 24;
  }
  uint64_t v51 = v20;
  if (v17) {
    double v21 = v12 * v15;
  }
  else {
    double v21 = v12 * v15 * 0.5;
  }
  long long v48 = v9;
  objc_msgSend(v9, "connectedEventsWithTargetDomain:", objc_msgSend(*(id *)(a1 + 32), "targetEventDomain", v18, v19));
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v56;
    unint64_t v25 = 0x1E4F28000uLL;
    uint64_t v50 = *(void *)v56;
LABEL_14:
    uint64_t v26 = 0;
    uint64_t v52 = v23;
    while (1)
    {
      if (*(void *)v56 != v24) {
        objc_enumerationMutation(obj);
      }
      double v27 = *(void **)(*((void *)&v55 + 1) + 8 * v26);
      if (*(void *)(a1 + 40))
      {
        if (!objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * v26), "isSameNodeAsNode:")) {
          break;
        }
      }
      double v28 = objc_msgSend(*(id *)(v25 + 3792), "numberWithUnsignedInteger:", objc_msgSend(v27, "identifier"));
      id v29 = [*(id *)(a1 + 48) objectForKeyedSubscript:v28];
      if (v29)
      {
        uint64_t v30 = v29;
        [(PGGraphMatchingResult *)v29 score];
      }
      else
      {
        uint64_t v30 = [[PGGraphMatchingResult alloc] initWithEvent:v27];
        [*(id *)(a1 + 48) setObject:v30 forKey:v28];
        double v31 = 0.0;
      }
      if (v21 > v31)
      {
        [(PGGraphMatchingResult *)v30 setScore:v21];
        id v32 = v53;
        uint64_t v33 = [PGGraphMatchingContextItem alloc];
        uint64_t v34 = *(void *)(a1 + 64);
        [(PGGraphMatchingResult *)v30 score];
        double v36 = v35;
        uint64_t v37 = *(void *)(a1 + 56);
        id v38 = [MEMORY[0x1E4F1CAD0] setWithObject:v32];
        id v39 = [(PGGraphMatchingContextItem *)v33 initWithRelatedType:v34 score:v51 criteria:v37 referenceNode:v27 matchedNode:v38 contextNodes:v36];

        [(PGGraphMatchingResult *)v30 setContextItem:v39 forRelatedType:*(void *)(a1 + 64)];
        if (*(unsigned char *)(a1 + 72))
        {
          [(PGGraphMatchingResult *)v30 clearKeywordsForRelatedType:*(void *)(a1 + 64)];
          id v40 = [MEMORY[0x1E4F1CA48] array];
          id v41 = NSString;
          long long v42 = [v49 label];
          id v43 = [v32 name];
          id v44 = [v41 stringWithFormat:@"[%@] %@", v42, v43];
          [v40 addObject:v44];

          [(PGGraphMatchingResult *)v30 addKeywords:v40 forRelatedType:*(void *)(a1 + 64)];
        }

        uint64_t v24 = v50;
        unint64_t v25 = 0x1E4F28000;
        uint64_t v23 = v52;
      }

      if (v23 == ++v26)
      {
        uint64_t v23 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
        if (v23) {
          goto LABEL_14;
        }
        break;
      }
    }
  }
}

- (id)_eventMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v8 = a4;
  id v9 = [(PGGraph *)self _coreEventMatchingFromEvent:a3 toEvent:v8 options:a5];
  id v10 = NSNumber;
  uint64_t v11 = [v8 identifier];

  double v12 = [v10 numberWithUnsignedInteger:v11];
  double v13 = [v9 objectForKeyedSubscript:v12];

  return v13;
}

- (id)_eventMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4
{
  return [(PGGraph *)self _coreEventMatchingFromEvent:a3 toEvent:0 options:a4];
}

- (id)_coreLocationMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  v367[6] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v236 = a4;
  id v274 = a5;
  v259 = [v7 graph];
  v241 = [MEMORY[0x1E4F1CA60] dictionary];
  v239 = [MEMORY[0x1E4F1CA60] dictionary];
  v366[0] = @"Street";
  id v8 = [MEMORY[0x1E4F1CA80] set];
  v367[0] = v8;
  v366[1] = @"District";
  id v9 = [MEMORY[0x1E4F1CA80] set];
  v367[1] = v9;
  v366[2] = @"City";
  id v10 = [MEMORY[0x1E4F1CA80] set];
  v367[2] = v10;
  v366[3] = @"County";
  uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
  v367[3] = v11;
  v366[4] = @"State";
  double v12 = [MEMORY[0x1E4F1CA80] set];
  v367[4] = v12;
  v366[5] = @"Country";
  double v13 = [MEMORY[0x1E4F1CA80] set];
  v367[5] = v13;
  v237 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v367 forKeys:v366 count:6];

  uint64_t v14 = [v7 eventCollection];
  v245 = [v14 eventMomentNodes];

  double v15 = [MEMORY[0x1E4F1CA80] set];
  double v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v245, "count"));
  v346[0] = MEMORY[0x1E4F143A8];
  v346[1] = 3221225472;
  v346[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke;
  v346[3] = &unk_1E68EC148;
  id v17 = v15;
  id v347 = v17;
  id v263 = v16;
  id v348 = v263;
  id v272 = v7;
  id v349 = v272;
  [v245 enumerateNodesUsingBlock:v346];
  double v18 = [v274 focusedNodes];
  LOBYTE(a5) = v18 == 0;

  if (a5)
  {
    v258 = 0;
  }
  else
  {
    v258 = [MEMORY[0x1E4F1CA80] set];
    long long v345 = 0u;
    long long v344 = 0u;
    long long v343 = 0u;
    long long v342 = 0u;
    double v19 = [v274 focusedNodes];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v342 objects:v365 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v343;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v343 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void **)(*((void *)&v342 + 1) + 8 * i);
          uint64_t v24 = [v23 label];
          int v25 = [v24 isEqualToString:@"Address"];

          if (v25) {
            [v258 addObject:v23];
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v342 objects:v365 count:16];
      }
      while (v20);
    }
  }
  uint64_t v26 = [MEMORY[0x1E4F1CA80] set];
  v253 = [MEMORY[0x1E4F1CA80] set];
  os_log_t oslog = (os_log_t)objc_alloc_init(MEMORY[0x1E4F71E60]);
  long long v341 = 0u;
  long long v340 = 0u;
  long long v339 = 0u;
  long long v338 = 0u;
  id v27 = v17;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v338 objects:v364 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v339;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v339 != v29) {
          objc_enumerationMutation(v27);
        }
        double v31 = *(void **)(*((void *)&v338 + 1) + 8 * j);
        if (!v258 || [v258 containsObject:*(void *)(*((void *)&v338 + 1) + 8 * j)])
        {
          v334[0] = MEMORY[0x1E4F143A8];
          v334[1] = 3221225472;
          v334[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_3;
          v334[3] = &unk_1E68EC170;
          id v335 = v274;
          id v336 = v272;
          id v337 = v26;
          [v31 enumerateSiblingNodesThroughEdgesWithLabel:@"AREA" domain:201 usingBlock:v334];
          id v32 = [v31 collection];
          uint64_t v33 = [v32 countryNodes];
          uint64_t v34 = [v33 anyNode];

          if (v34)
          {
            [v253 addObject:v34];
            -[NSObject addIdentifier:](oslog, "addIdentifier:", [v34 identifier]);
          }
          else
          {
            double v35 = +[PGLogging sharedLogging];
            double v36 = [v35 loggingConnection];

            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v31;
              _os_log_error_impl(&dword_1D1805000, v36, OS_LOG_TYPE_ERROR, "No country node for address node: %@", (uint8_t *)&buf, 0xCu);
            }
          }
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v338 objects:v364 count:16];
    }
    while (v28);
  }

  v329[0] = MEMORY[0x1E4F143A8];
  v329[1] = 3221225472;
  v329[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_453;
  v329[3] = &unk_1E68EC198;
  v232 = oslog;
  v330 = v232;
  id v233 = v274;
  id v331 = v233;
  id v234 = v272;
  id v332 = v234;
  id v37 = v26;
  id v333 = v37;
  [(MAGraph *)self enumerateNodesWithLabel:@"Address" domain:200 usingBlock:v329];
  id v38 = objc_alloc_init(MEMORY[0x1E4F71E58]);
  id v39 = objc_alloc_init(MEMORY[0x1E4F71E58]);
  long long v328 = 0u;
  long long v327 = 0u;
  long long v326 = 0u;
  long long v325 = 0u;
  id obj = v27;
  uint64_t v40 = [obj countByEnumeratingWithState:&v325 objects:v363 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v326;
    do
    {
      for (uint64_t k = 0; k != v40; ++k)
      {
        if (*(void *)v326 != v41) {
          objc_enumerationMutation(obj);
        }
        id v43 = *(void **)(*((void *)&v325 + 1) + 8 * k);
        id v44 = [v43 collection];
        id v45 = [v44 areaNodes];
        id v46 = [v45 elementIdentifiers];
        objc_msgSend(v38, "setTargets:forSource:", v46, objc_msgSend(v43, "identifier"));

        long long v47 = [v43 collection];
        long long v48 = [v47 deepParentLocationNodes];
        id v49 = [v48 elementIdentifiers];
        objc_msgSend(v39, "setTargets:forSource:", v49, objc_msgSend(v43, "identifier"));

        objc_msgSend(v39, "insertSource:target:", objc_msgSend(v43, "identifier"), objc_msgSend(v43, "identifier"));
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v325 objects:v363 count:16];
    }
    while (v40);
  }

  id v50 = objc_alloc(MEMORY[0x1E4F71E88]);
  uint64_t v51 = objc_opt_class();
  v250 = (void *)[v50 initWithAdjacency:v38 graph:v259 sourcesClass:v51 targetsClass:objc_opt_class()];
  id v52 = objc_alloc(MEMORY[0x1E4F71E88]);
  uint64_t v53 = objc_opt_class();
  v249 = (void *)[v52 initWithAdjacency:v39 graph:v259 sourcesClass:v53 targetsClass:objc_opt_class()];

  long long v324 = 0u;
  long long v323 = 0u;
  long long v322 = 0u;
  long long v321 = 0u;
  id v240 = v37;
  uint64_t v244 = [v240 countByEnumeratingWithState:&v321 objects:v362 count:16];
  if (v244)
  {
    uint64_t v235 = *(void *)v322;
    double v54 = 1.0;
    do
    {
      uint64_t v55 = 0;
      do
      {
        if (*(void *)v322 != v235)
        {
          uint64_t v56 = v55;
          objc_enumerationMutation(v240);
          uint64_t v55 = v56;
        }
        uint64_t v238 = v55;
        v246 = *(void **)(*((void *)&v321 + 1) + 8 * v55);
        long long v57 = [v246 eventCollection];
        v247 = [v57 eventMomentNodes];

        long long v58 = [MEMORY[0x1E4F1CA80] set];
        id v59 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v247, "count"));
        v317[0] = MEMORY[0x1E4F143A8];
        v317[1] = 3221225472;
        v317[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_3_461;
        v317[3] = &unk_1E68EC148;
        id v251 = v58;
        id v318 = v251;
        id v262 = v59;
        id v319 = v262;
        v320 = v246;
        [v247 enumerateNodesUsingBlock:v317];
        if ([v258 count]) {
          uint64_t v60 = v258;
        }
        else {
          uint64_t v60 = obj;
        }
        unint64_t v61 = [v60 count];
        unint64_t v62 = [v251 count];
        if (v61 >= v62) {
          unint64_t v63 = v62;
        }
        else {
          unint64_t v63 = v61;
        }
        unint64_t v248 = v63;
        v265 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
        v273 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v248];
        v243 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v248];
        v242 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v248];
        v260 = [MEMORY[0x1E4F1CA48] array];
        v275 = [(MAElementCollection *)[PGGraphAreaNodeCollection alloc] initWithGraph:v259];
        unint64_t v64 = [v265 count];
        while (2)
        {
          if (v64 >= v248) {
            goto LABEL_97;
          }
          long long v315 = 0u;
          long long v316 = 0u;
          long long v313 = 0u;
          long long v314 = 0u;
          os_log_t v252 = (os_log_t)obj;
          uint64_t v255 = [v252 countByEnumeratingWithState:&v313 objects:v361 count:16];
          if (!v255) {
            goto LABEL_96;
          }
          os_log_t osloga = 0;
          id v65 = 0;
          uint64_t v254 = *(void *)v314;
          double v66 = 0.0;
          double v67 = 0.0;
          do
          {
            for (uint64_t m = 0; m != v255; ++m)
            {
              if (*(void *)v314 != v254) {
                objc_enumerationMutation(v252);
              }
              v261 = *(void **)(*((void *)&v313 + 1) + 8 * m);
              if ((objc_msgSend(v265, "containsObject:") & 1) == 0
                && (!v258 || [v258 containsObject:v261]))
              {
                v264 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v261, "identifier"));
                v266 = objc_msgSend(v250, "targetsForSourceIdentifier:", objc_msgSend(v261, "identifier"));
                v267 = objc_msgSend(v249, "targetsForSourceIdentifier:", objc_msgSend(v261, "identifier"));
                long long v311 = 0u;
                long long v312 = 0u;
                long long v309 = 0u;
                long long v310 = 0u;
                id v268 = v251;
                uint64_t v68 = [v268 countByEnumeratingWithState:&v309 objects:v360 count:16];
                if (!v68) {
                  goto LABEL_90;
                }
                uint64_t v69 = *(void *)v310;
                while (1)
                {
                  uint64_t v70 = 0;
                  do
                  {
                    if (*(void *)v310 != v69) {
                      objc_enumerationMutation(v268);
                    }
                    long long v71 = *(void **)(*((void *)&v309 + 1) + 8 * v70);
                    if (([v273 containsObject:v71] & 1) == 0)
                    {
                      long long v72 = [(PGGraph *)self _firstLocationNodeFromAddressNode:v71 inLocationNodes:v267];
                      long long v73 = [(PGGraph *)self _commonAreaNodesBetweenAddressAreaNodes:v266 andAddressNode:v71];
                      long long v74 = v73;
                      if (v72)
                      {
                        long long v75 = [v72 label];
                        [(PGGraph *)self _distanceForLocationLabel:v75];
                        double v77 = v76;

                        goto LABEL_66;
                      }
                      if (([v73 isEmpty] & 1) == 0)
                      {
                        double v77 = 0.95;
LABEL_66:
                        if (([v74 isEmpty] & 1) == 0) {
                          double v77 = v77 * ((double)(unint64_t)([v74 count] - 1) * -0.0001 + 0.01);
                        }
                        long long v78 = [v263 objectForKeyedSubscript:v264];
                        [v78 doubleValue];
                        double v80 = v79;
                        v81 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v71, "identifier"));
                        v82 = [v262 objectForKeyedSubscript:v81];
                        [v82 doubleValue];
                        double v84 = v83;

                        double v85 = v80 + v84;
                        double v86 = (v54 - v77) * (v80 + v84);
                        if (v86 > v67)
                        {
                          id v87 = v261;

                          os_log_t v88 = v71;
                          if (![v265 count])
                          {
                            [v260 removeAllObjects];
                            if ([v74 count])
                            {
                              v89 = [(MAElementCollection *)v275 collectionByFormingUnionWith:v74];
                              v90 = v275;
                              goto LABEL_88;
                            }
                            v89 = [(MAElementCollection *)[PGGraphAreaNodeCollection alloc] initWithGraph:v259];

                            [v87 coordinate];
                            double v103 = v102;
                            double v105 = v104;
                            [v88 coordinate];
                            double v107 = v106;
                            double v109 = v108;
                            v370.latitude = v103;
                            v370.longitude = v105;
                            if (CLLocationCoordinate2DIsValid(v370))
                            {
                              v371.latitude = v107;
                              v371.longitude = v109;
                              if (CLLocationCoordinate2DIsValid(v371))
                              {
                                v90 = [v72 label];
                                v110 = +[PGMatchingCommonLocation matchingCommonLocationWithLabel:coordinate:forAddressCoordinate:](PGMatchingCommonLocation, "matchingCommonLocationWithLabel:coordinate:forAddressCoordinate:", v90, v107, v109, v103, v105);
                                [v260 addObject:v110];

LABEL_88:
                              }
                            }
LABEL_82:

                            os_log_t osloga = v88;
                            id v65 = v87;
                            double v66 = v85;
                            double v67 = v86;
                            v275 = v89;
                            goto LABEL_83;
                          }
LABEL_81:
                          v89 = v275;
                          goto LABEL_82;
                        }
                        if (![v265 count] && v86 == v67)
                        {
                          uint64_t v91 = [(MAElementCollection *)v275 count];
                          BOOL v92 = v72 == 0;
                          if (v91) {
                            BOOL v92 = 1;
                          }
                          if (!v92)
                          {
                            [v261 coordinate];
                            double v94 = v93;
                            double v96 = v95;
                            [v71 coordinate];
                            double v98 = v97;
                            double v100 = v99;
                            v368.latitude = v94;
                            v368.longitude = v96;
                            if (CLLocationCoordinate2DIsValid(v368))
                            {
                              v369.latitude = v98;
                              v369.longitude = v100;
                              if (CLLocationCoordinate2DIsValid(v369))
                              {
                                v90 = [v72 label];
                                v101 = +[PGMatchingCommonLocation matchingCommonLocationWithLabel:coordinate:forAddressCoordinate:](PGMatchingCommonLocation, "matchingCommonLocationWithLabel:coordinate:forAddressCoordinate:", v90, v98, v100, v94, v96);
                                [v260 addObject:v101];

                                os_log_t v88 = osloga;
                                id v87 = v65;
                                double v85 = v66;
                                double v86 = v67;
                                v89 = v275;
                                goto LABEL_88;
                              }
                            }
                          }
                        }
                      }
                      os_log_t v88 = osloga;
                      id v87 = v65;
                      double v85 = v66;
                      double v86 = v67;
                      goto LABEL_81;
                    }
LABEL_83:
                    ++v70;
                  }
                  while (v68 != v70);
                  uint64_t v111 = [v268 countByEnumeratingWithState:&v309 objects:v360 count:16];
                  uint64_t v68 = v111;
                  if (!v111)
                  {
LABEL_90:

                    break;
                  }
                }
              }
            }
            uint64_t v255 = [v252 countByEnumeratingWithState:&v313 objects:v361 count:16];
          }
          while (v255);

          if (v65)
          {
            [v265 addObject:v65];
            [v273 addObject:osloga];
            v112 = [NSNumber numberWithDouble:v67];
            [v243 addObject:v112];

            v113 = [NSNumber numberWithDouble:v66];
            [v242 addObject:v113];

            unint64_t v64 = [v265 count];
            continue;
          }
          break;
        }
        os_log_t v252 = osloga;
LABEL_96:

LABEL_97:
        if ([v265 count])
        {
          long long v307 = 0u;
          long long v308 = 0u;
          long long v305 = 0u;
          long long v306 = 0u;
          id v114 = v243;
          uint64_t v115 = [v114 countByEnumeratingWithState:&v305 objects:v359 count:16];
          if (v115)
          {
            uint64_t v116 = *(void *)v306;
            double v117 = 0.0;
            do
            {
              for (uint64_t n = 0; n != v115; ++n)
              {
                if (*(void *)v306 != v116) {
                  objc_enumerationMutation(v114);
                }
                [*(id *)(*((void *)&v305 + 1) + 8 * n) doubleValue];
                double v117 = v117 + v119;
              }
              uint64_t v115 = [v114 countByEnumeratingWithState:&v305 objects:v359 count:16];
            }
            while (v115);
          }
          else
          {
            double v117 = 0.0;
          }

          long long v303 = 0u;
          long long v304 = 0u;
          long long v301 = 0u;
          long long v302 = 0u;
          id v121 = v242;
          uint64_t v122 = [v121 countByEnumeratingWithState:&v301 objects:v358 count:16];
          if (v122)
          {
            uint64_t v123 = *(void *)v302;
            double v124 = 0.0;
            do
            {
              for (iuint64_t i = 0; ii != v122; ++ii)
              {
                if (*(void *)v302 != v123) {
                  objc_enumerationMutation(v121);
                }
                [*(id *)(*((void *)&v301 + 1) + 8 * ii) doubleValue];
                double v124 = v124 + v126;
              }
              uint64_t v122 = [v121 countByEnumeratingWithState:&v301 objects:v358 count:16];
            }
            while (v122);
          }
          else
          {
            double v124 = 0.0;
          }

          long long v299 = 0u;
          long long v300 = 0u;
          long long v297 = 0u;
          long long v298 = 0u;
          id v127 = obj;
          uint64_t v128 = [v127 countByEnumeratingWithState:&v297 objects:v357 count:16];
          if (v128)
          {
            uint64_t v129 = *(void *)v298;
            do
            {
              for (juint64_t j = 0; jj != v128; ++jj)
              {
                if (*(void *)v298 != v129) {
                  objc_enumerationMutation(v127);
                }
                v131 = *(void **)(*((void *)&v297 + 1) + 8 * jj);
                if (([v265 containsObject:v131] & 1) == 0)
                {
                  v132 = [v265 firstObject];
                  v133 = [(PGGraph *)self _closestLocationNodeFromAddressNode:v131 toAddressNode:v132];

                  if (v133)
                  {
                    v134 = [v133 label];
                    [(PGGraph *)self _distanceForLocationLabel:v134];
                    double v136 = v135;
                  }
                  else
                  {
                    double v136 = 1.0;
                  }
                  if ([v260 count])
                  {
                    v137 = [v260 firstObject];
                    v138 = [v137 label];
                    [(PGGraph *)self _distanceForLocationLabel:v138];
                    double v140 = v139;
                  }
                  else
                  {
                    double v140 = 0.0;
                  }
                  v141 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v131, "identifier"));
                  v142 = [v263 objectForKeyedSubscript:v141];
                  [v142 doubleValue];
                  double v144 = v143;
                  if (v136 - v140 >= 0.0) {
                    double v145 = v136 - v140;
                  }
                  else {
                    double v145 = -(v136 - v140);
                  }

                  double v124 = v124 + v145 * v144;
                }
              }
              uint64_t v128 = [v127 countByEnumeratingWithState:&v297 objects:v357 count:16];
            }
            while (v128);
          }

          long long v295 = 0u;
          long long v296 = 0u;
          long long v293 = 0u;
          long long v294 = 0u;
          id v146 = v251;
          uint64_t v147 = [v146 countByEnumeratingWithState:&v293 objects:v356 count:16];
          if (v147)
          {
            uint64_t v148 = *(void *)v294;
            do
            {
              for (kuint64_t k = 0; kk != v147; ++kk)
              {
                if (*(void *)v294 != v148) {
                  objc_enumerationMutation(v146);
                }
                v150 = *(void **)(*((void *)&v293 + 1) + 8 * kk);
                if (([v273 containsObject:v150] & 1) == 0)
                {
                  v151 = [v273 firstObject];
                  v152 = [(PGGraph *)self _closestLocationNodeFromAddressNode:v150 toAddressNode:v151];

                  if (v152)
                  {
                    v153 = [v152 label];
                    [(PGGraph *)self _distanceForLocationLabel:v153];
                    double v155 = v154;
                  }
                  else
                  {
                    double v155 = 1.0;
                  }
                  if ([v260 count])
                  {
                    v156 = [v260 firstObject];
                    v157 = [v156 label];
                    [(PGGraph *)self _distanceForLocationLabel:v157];
                    double v159 = v158;
                  }
                  else
                  {
                    double v159 = 0.0;
                  }
                  v160 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v150, "identifier"));
                  v161 = [v262 objectForKeyedSubscript:v160];
                  [v161 doubleValue];
                  double v163 = v162;
                  if (v155 - v159 >= 0.0) {
                    double v164 = v155 - v159;
                  }
                  else {
                    double v164 = -(v155 - v159);
                  }

                  double v124 = v124 + v164 * v163;
                }
              }
              uint64_t v147 = [v146 countByEnumeratingWithState:&v293 objects:v356 count:16];
            }
            while (v147);
          }

          oslogb = [(PGGraph *)self bestFittingAreaNodeFromAreaNodes:v275];
          v165 = [PGGraphMatchingResult alloc];
          v166 = [v246 relatableEvent];
          v167 = [(PGGraphMatchingResult *)v165 initWithEvent:v166];

          double v54 = 1.0;
          [(PGGraphMatchingResult *)v167 setScore:1.0 - ((v124 + 1.0) / (v124 + 1.0 + v117 - v124) + -1.0) / v124];
          if (oslogb)
          {
            v168 = (void *)MEMORY[0x1E4F1CAD0];
            v169 = [v273 firstObject];
            v170 = objc_msgSend(v168, "setWithObjects:", v169, oslogb, 0);
            uint64_t v171 = 12;
          }
          else
          {
            if ([v260 count])
            {
              v172 = [v260 firstObject];
              v173 = [v172 label];
              unint64_t v174 = +[PGGraphMatchingContextItem criteriaForLocationLabel:v173];
            }
            else
            {
              id v175 = +[PGLogging sharedLogging];
              v176 = [v175 loggingConnection];

              if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
              {
                LOWORD(buf) = 0;
                _os_log_error_impl(&dword_1D1805000, v176, OS_LOG_TYPE_ERROR, "Best common locations count is 0", (uint8_t *)&buf, 2u);
              }

              v177 = [v265 firstObject];
              id v178 = [v273 firstObject];
              v172 = [(PGGraph *)self _closestLocationNodeFromAddressNode:v177 toAddressNode:v178];

              v173 = [v172 label];
              unint64_t v174 = +[PGGraphMatchingContextItem criteriaForLocationLabel:v173];
            }
            uint64_t v171 = v174;

            v179 = (void *)MEMORY[0x1E4F1CAD0];
            v169 = [v273 firstObject];
            v170 = [v179 setWithObject:v169];
          }

          v180 = [PGGraphMatchingContextItem alloc];
          [(PGGraphMatchingResult *)v167 score];
          v181 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v180, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 4, v171, v234, v246, v170);
          [(PGGraphMatchingResult *)v167 setContextItem:v181 forRelatedType:4];
          if ([v233 needsKeywords]
            && [v246 isSameNodeAsNode:v236])
          {
            v182 = [MEMORY[0x1E4F1CA48] array];
            if ([v265 count])
            {
              unint64_t v183 = 0;
              do
              {
                v184 = [v265 objectAtIndexedSubscript:v183];
                v185 = [v273 objectAtIndexedSubscript:v183];
                v186 = [(PGGraph *)self _commonAreaNodesBetweenAddressNode:v184 andAddressNode:v185];

                if ([v186 count])
                {
                  v187 = [v186 array];
                  v188 = [v187 valueForKey:@"keywordDescription"];
                  [v182 addObjectsFromArray:v188];
                }
                v189 = [v265 objectAtIndexedSubscript:v183];
                v190 = [v273 objectAtIndexedSubscript:v183];
                v191 = [(PGGraph *)self _closestLocationNodeFromAddressNode:v189 toAddressNode:v190];

                if (v191)
                {
                  v192 = [v191 keywordDescription];
                  [v182 addObject:v192];
                }
                ++v183;
              }
              while (v183 < [v265 count]);
            }
            [(PGGraphMatchingResult *)v167 addKeywords:v182 forRelatedType:4];
          }
          v193 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v246, "identifier"));
          [v241 setObject:v167 forKey:v193];
          if ([v260 count])
          {
            v194 = [v260 firstObject];
            v195 = [v194 label];
            v196 = [v237 objectForKeyedSubscript:v195];
            BOOL v197 = v196 == 0;

            if (!v197)
            {
              long long v291 = 0u;
              long long v292 = 0u;
              long long v289 = 0u;
              long long v290 = 0u;
              id v198 = v260;
              uint64_t v199 = [v198 countByEnumeratingWithState:&v289 objects:v355 count:16];
              if (v199)
              {
                v200 = 0;
                uint64_t v201 = *(void *)v290;
                double v202 = 1.79769313e308;
                do
                {
                  for (uint64_t mm = 0; mm != v199; ++mm)
                  {
                    if (*(void *)v290 != v201) {
                      objc_enumerationMutation(v198);
                    }
                    v204 = *(void **)(*((void *)&v289 + 1) + 8 * mm);
                    [v204 distanceBetweenCoordinates];
                    double v206 = v205;
                    if (v205 < v202)
                    {
                      id v207 = v204;

                      v200 = v207;
                      double v202 = v206;
                    }
                  }
                  uint64_t v199 = [v198 countByEnumeratingWithState:&v289 objects:v355 count:16];
                }
                while (v199);

                if (v200)
                {
                  v208 = [v200 label];
                  v209 = [v237 objectForKeyedSubscript:v208];
                  [v209 addObject:v193];

                  [v239 setObject:v200 forKey:v193];
                  goto LABEL_186;
                }
              }
              else
              {
                v200 = v198;
LABEL_186:
              }
            }
          }
        }
        else
        {
          v120 = +[PGLogging sharedLogging];
          oslogb = [v120 loggingConnection];

          if (os_log_type_enabled(oslogb, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_error_impl(&dword_1D1805000, oslogb, OS_LOG_TYPE_ERROR, "Inconsistency in Graph: common location found in query but not common", (uint8_t *)&buf, 2u);
          }
        }

        uint64_t v55 = v238 + 1;
      }
      while (v238 + 1 != v244);
      uint64_t v244 = [v240 countByEnumeratingWithState:&v321 objects:v362 count:16];
    }
    while (v244);
  }

  if (v236)
  {
    v210 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v236, "identifier"));
    v211 = [v239 objectForKeyedSubscript:v210];
    BOOL v212 = v211 == 0;

    if (!v212)
    {
      v213 = [v239 objectForKeyedSubscript:v210];
      v214 = [v213 label];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v353 = 0x2020000000;
      uint64_t v354 = 0x7FEFFFFFFFFFFFFFLL;
      uint64_t v281 = 0;
      v282 = (double *)&v281;
      uint64_t v283 = 0x2020000000;
      uint64_t v284 = 0;
      v215 = [v237 objectForKeyedSubscript:v214];
      v277[0] = MEMORY[0x1E4F143A8];
      v277[1] = 3221225472;
      v277[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_4_473;
      v277[3] = &unk_1E68EC1C0;
      id v216 = v239;
      id v278 = v216;
      v279 = &v281;
      p_long long buf = &buf;
      [v215 enumerateObjectsUsingBlock:v277];

      if (v282[3] != *(double *)(*((void *)&buf + 1) + 24))
      {
        v217 = [v216 objectForKeyedSubscript:v210];
        [v217 distanceBetweenCoordinates];
        double v219 = v218;

        v220 = [v241 objectForKeyedSubscript:v210];
        double v221 = *(double *)(*((void *)&buf + 1) + 24);
        double v222 = v282[3];
        [v220 score];
        [v220 setScore:v223 - ((v219 - v221) / (v222 - v221) * 0.02 + -0.01)];
        v224 = [v220 contextItemForRelatedType:4];
        [v220 score];
        objc_msgSend(v224, "setScore:");
      }
      _Block_object_dispose(&v281, 8);
      _Block_object_dispose(&buf, 8);
    }
    v225 = [v241 objectForKeyedSubscript:v210];
    BOOL v226 = v225 == 0;

    if (v226)
    {
      id v228 = 0;
    }
    else
    {
      v350 = v210;
      v227 = [v241 objectForKeyedSubscript:v210];
      v351 = v227;
      id v228 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v351 forKeys:&v350 count:1];
    }
  }
  else
  {
    v285[0] = MEMORY[0x1E4F143A8];
    v285[1] = 3221225472;
    v285[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_468;
    v285[3] = &unk_1E68EC210;
    id v286 = v239;
    id v229 = v241;
    id v287 = v229;
    uint64_t v288 = 4;
    [v237 enumerateKeysAndObjectsUsingBlock:v285];
    id v228 = v229;

    v210 = v286;
  }

  id v230 = v228;
  return v230;
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_2;
  v5[3] = &unk_1E68EC120;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = v3;
  id v4 = v3;
  [v4 enumerateAddressEdgesAndNodesUsingBlock:v5];
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_3(id *a1, void *a2)
{
  id v3 = [a2 collection];
  id v4 = [v3 momentNodes];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_4;
  v5[3] = &unk_1E68EC148;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  [v4 enumerateNodesUsingBlock:v5];
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_453(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 collection];
  id v6 = [v5 countryNodes];
  id v7 = [v6 elementIdentifiers];
  LODWORD(v4) = [v4 intersectsIdentifierSet:v7];

  if (v4)
  {
    id v8 = [v3 collection];
    id v9 = [v8 momentNodes];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_2_454;
    void v10[3] = &unk_1E68EC148;
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    [v9 enumerateNodesUsingBlock:v10];
  }
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_3_461(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_4_462;
  v7[3] = &unk_1E68EC120;
  id v8 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v3;
  id v6 = v3;
  [v6 enumerateAddressEdgesAndNodesUsingBlock:v7];
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_468(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = (double *)&v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v18 = 0;
  double v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_2_469;
  v14[3] = &unk_1E68EC1C0;
  id v15 = *(id *)(a1 + 32);
  double v16 = &v18;
  id v17 = &v22;
  [v6 enumerateObjectsUsingBlock:v14];
  if (v19[3] != v23[3])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_3_471;
    v8[3] = &unk_1E68EC1E8;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 32);
    id v11 = &v22;
    uint64_t v7 = *(void *)(a1 + 48);
    id v12 = &v18;
    uint64_t v13 = v7;
    [v6 enumerateObjectsUsingBlock:v8];
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_4_473(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  [v3 distanceBetweenCoordinates];
  double v5 = v4;

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v5 > *(double *)(v6 + 24)) {
    *(double *)(v6 + 24) = v5;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v5 < *(double *)(v7 + 24)) {
    *(double *)(v7 + 24) = v5;
  }
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_2_469(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  [v3 distanceBetweenCoordinates];
  double v5 = v4;

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v5 > *(double *)(v6 + 24)) {
    *(double *)(v6 + 24) = v5;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v5 < *(double *)(v7 + 24)) {
    *(double *)(v7 + 24) = v5;
  }
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_3_471(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v12 = [v3 objectForKeyedSubscript:v4];
  double v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];

  [v5 distanceBetweenCoordinates];
  double v7 = v6;

  double v8 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  double v9 = (v7 - v8) / (*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) - v8) * 0.02 + -0.01;
  [v12 score];
  [v12 setScore:v10 - v9];
  id v11 = [v12 contextItemForRelatedType:*(void *)(a1 + 64)];
  [v12 score];
  objc_msgSend(v11, "setScore:");
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_4_462(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 addObject:v6];
  double v8 = NSNumber;
  uint64_t v9 = [v6 identifier];

  id v19 = [v8 numberWithUnsignedInteger:v9];
  double v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v19];
  [v10 doubleValue];
  double v12 = v11;

  [v7 relevance];
  double v14 = v13;

  id v15 = [*(id *)(a1 + 48) relatableEvent];
  [v15 weightForMoment:*(void *)(a1 + 56)];
  double v17 = v12 + v14 * v16;

  uint64_t v18 = [NSNumber numberWithDouble:v17];
  [*(id *)(a1 + 40) setObject:v18 forKeyedSubscript:v19];
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_2_454(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(v3, "connectedEventsWithTargetDomain:", objc_msgSend(*(id *)(a1 + 32), "targetEventDomain", 0));
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v9 isSameNodeAsNode:*(void *)(a1 + 40)] & 1) == 0) {
          [*(id *)(a1 + 48) addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(v3, "connectedEventsWithTargetDomain:", objc_msgSend(*(id *)(a1 + 32), "targetEventDomain", 0));
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v9 isSameNodeAsNode:*(void *)(a1 + 40)] & 1) == 0) {
          [*(id *)(a1 + 48) addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 addObject:v6];
  double v8 = NSNumber;
  uint64_t v9 = [v6 identifier];

  id v19 = [v8 numberWithUnsignedInteger:v9];
  long long v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v19];
  [v10 doubleValue];
  double v12 = v11;

  [v7 relevance];
  double v14 = v13;

  uint64_t v15 = [*(id *)(a1 + 48) relatableEvent];
  [v15 weightForMoment:*(void *)(a1 + 56)];
  double v17 = v12 + v14 * v16;

  uint64_t v18 = [NSNumber numberWithDouble:v17];
  [*(id *)(a1 + 40) setObject:v18 forKeyedSubscript:v19];
}

- (id)_locationMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v8 = a4;
  uint64_t v9 = [(PGGraph *)self _coreLocationMatchingFromEvent:a3 toEvent:v8 options:a5];
  long long v10 = NSNumber;
  uint64_t v11 = [v8 identifier];

  double v12 = [v10 numberWithUnsignedInteger:v11];
  double v13 = [v9 objectForKeyedSubscript:v12];

  return v13;
}

- (id)_locationMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4
{
  return [(PGGraph *)self _coreLocationMatchingFromEvent:a3 toEvent:0 options:a4];
}

- (id)_timeMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  uint64_t v360 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 relatedType] & 0x402;
  int v227 = [v9 needsKeywords];
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA80];
  double v12 = [v7 dateNodes];
  double v13 = [v11 setWithSet:v12];

  double v14 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v15 = [v8 dateNodes];
  double v16 = [v14 setWithSet:v15];

  double v17 = [v9 focusedNodes];

  if (v17)
  {
    uint64_t v18 = [v9 focusedNodes];
    [v13 intersectSet:v18];
  }
  uint64_t v225 = v10;
  id v235 = v9;
  id v228 = v13;
  if (v10 != 1026)
  {
    BOOL v223 = 0;
    goto LABEL_42;
  }
  id v19 = [v8 eventCollection];
  uint64_t v20 = [v19 eventMomentNodes];
  uint64_t v21 = [v20 weekendNodes];

  uint64_t v22 = v13;
  uint64_t v23 = [v21 count];

  if ([v22 intersectsSet:v16])
  {
    uint64_t v24 = [PGGraphMatchingResult alloc];
    uint64_t v25 = [v8 relatableEvent];
    uint64_t v26 = [(PGGraphMatchingResult *)v24 initWithEvent:v25];

    [(PGGraphMatchingResult *)v26 setScore:0.8];
    id v27 = (PGGraphMatchingContextItem *)[v22 mutableCopy];
    [(PGGraphMatchingContextItem *)v27 intersectSet:v16];
    uint64_t v28 = [PGGraphMatchingContextItem alloc];
    [(PGGraphMatchingResult *)v26 score];
    uint64_t v29 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v28, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 2, v7, v8, v27);
    id v236 = v26;
    [(PGGraphMatchingResult *)v26 setContextItem:v29 forRelatedType:2];
    double v13 = v22;
    if (!v227)
    {
      double v67 = v235;
LABEL_112:

      goto LABEL_113;
    }
    id v229 = v8;
    id v232 = v7;
    uint64_t v30 = [MEMORY[0x1E4F1CA48] array];
    long long v337 = 0u;
    long long v338 = 0u;
    long long v339 = 0u;
    long long v340 = 0u;
    id v31 = v22;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v337 objects:v359 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v338;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v338 != v34) {
            objc_enumerationMutation(v31);
          }
          double v36 = *(void **)(*((void *)&v337 + 1) + 8 * i);
          if ([v16 containsObject:v36])
          {
            id v37 = NSString;
            id v38 = [v36 keywordDescription];
            id v39 = [v37 stringWithFormat:@"%@ - Same Date", v38];
            [(PGGraphMatchingContextItem *)v30 addObject:v39];
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v337 objects:v359 count:16];
      }
      while (v33);
    }

    uint64_t v40 = v30;
    [(PGGraphMatchingResult *)v236 addKeywords:v30 forRelatedType:2];
    id v8 = v229;
    id v7 = v232;
    goto LABEL_110;
  }
  BOOL v223 = v23 != 0;
  uint64_t v41 = [MEMORY[0x1E4F1CA80] set];
  long long v42 = [v7 eventCollection];
  id v43 = [v42 eventMomentNodes];
  v335[0] = MEMORY[0x1E4F143A8];
  v335[1] = 3221225472;
  v335[2] = __60__PGGraph_Matching___timeMatchingFromEvent_toEvent_options___block_invoke;
  v335[3] = &unk_1E68EF578;
  id v44 = v41;
  id v336 = v44;
  [v43 enumerateNodesUsingBlock:v335];

  id v45 = [MEMORY[0x1E4F1CA80] set];
  long long v331 = 0u;
  long long v332 = 0u;
  long long v333 = 0u;
  long long v334 = 0u;
  id v46 = v44;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v331 objects:v358 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v332;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v332 != v49) {
          objc_enumerationMutation(v46);
        }
        uint64_t v51 = [*(id *)(*((void *)&v331 + 1) + 8 * j) dateNodes];
        [v45 unionSet:v51];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v331 objects:v358 count:16];
    }
    while (v48);
  }

  [v45 intersectSet:v16];
  if ([v45 count]) {
    BOOL v52 = v23 == 0;
  }
  else {
    BOOL v52 = 1;
  }
  char v53 = !v52;
  if (!v52)
  {
    double v54 = [PGGraphMatchingResult alloc];
    uint64_t v55 = [v8 relatableEvent];
    uint64_t v56 = [(PGGraphMatchingResult *)v54 initWithEvent:v55];

    [(PGGraphMatchingResult *)v56 setScore:0.7];
    long long v57 = [PGGraphMatchingContextItem alloc];
    [(PGGraphMatchingResult *)v56 score];
    long long v58 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v57, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 3, v7, v8, v45);
    id v236 = v56;
    [(PGGraphMatchingResult *)v56 setContextItem:v58 forRelatedType:2];
    if (v227)
    {
      v245 = v58;
      id v230 = v8;
      id v233 = v7;
      id v59 = [MEMORY[0x1E4F1CA48] array];
      long long v327 = 0u;
      long long v328 = 0u;
      long long v329 = 0u;
      long long v330 = 0u;
      id obj = v45;
      uint64_t v60 = [obj countByEnumeratingWithState:&v327 objects:v357 count:16];
      if (v60)
      {
        uint64_t v61 = v60;
        uint64_t v62 = *(void *)v328;
        do
        {
          for (uint64_t k = 0; k != v61; ++k)
          {
            if (*(void *)v328 != v62) {
              objc_enumerationMutation(obj);
            }
            unint64_t v64 = NSString;
            id v65 = [*(id *)(*((void *)&v327 + 1) + 8 * k) keywordDescription];
            double v66 = [v64 stringWithFormat:@"%@ - Same Weekend Date", v65];
            [v59 addObject:v66];
          }
          uint64_t v61 = [obj countByEnumeratingWithState:&v327 objects:v357 count:16];
        }
        while (v61);
      }

      [(PGGraphMatchingResult *)v236 addKeywords:v59 forRelatedType:2];
      id v8 = v230;
      id v7 = v233;
      long long v58 = v245;
    }
  }
  double v67 = v235;
  double v13 = v228;
  if ((v53 & 1) == 0)
  {
LABEL_42:
    v231 = v8;
    id v234 = v7;
    uint64_t v68 = (void *)MEMORY[0x1E4F76C68];
    uint64_t v69 = [MEMORY[0x1E4F76C68] currentLocalDate];
    uint64_t v70 = [v68 yearFromDate:v69];

    id v27 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v29 = [MEMORY[0x1E4F1CA80] set];
    long long v323 = 0u;
    long long v324 = 0u;
    long long v325 = 0u;
    long long v326 = 0u;
    id v71 = v13;
    id v246 = (id)[v71 countByEnumeratingWithState:&v323 objects:v356 count:16];
    if (v246)
    {
      uint64_t v72 = v70 - 1;
      id v237 = v71;
      uint64_t v242 = *(void *)v324;
      do
      {
        for (uint64_t m = 0; m != v246; uint64_t m = (char *)m + 1)
        {
          if (*(void *)v324 != v242) {
            objc_enumerationMutation(v237);
          }
          long long v74 = *(void **)(*((void *)&v323 + 1) + 8 * (void)m);
          uint64_t v75 = [v74 siblingNodesThroughEdgesWithLabel:@"DAY" domain:400];
          uint64_t v76 = [v74 siblingNodesThroughEdgesWithLabel:@"MONTH" domain:400];
          id obja = (id)v75;
          double v77 = [MEMORY[0x1E4F1CA80] setWithSet:v75];
          id v250 = (id)v76;
          [v77 intersectSet:v76];
          long long v322 = 0u;
          long long v321 = 0u;
          long long v320 = 0u;
          long long v319 = 0u;
          id v78 = v77;
          uint64_t v79 = [v78 countByEnumeratingWithState:&v319 objects:v355 count:16];
          if (v79)
          {
            uint64_t v80 = v79;
            uint64_t v81 = *(void *)v320;
            do
            {
              for (uint64_t n = 0; n != v80; ++n)
              {
                if (*(void *)v320 != v81) {
                  objc_enumerationMutation(v78);
                }
                double v83 = *(void **)(*((void *)&v319 + 1) + 8 * n);
                if ([v16 containsObject:v83])
                {
                  if ([v83 year] == v72) {
                    double v84 = v27;
                  }
                  else {
                    double v84 = v29;
                  }
                  [(PGGraphMatchingContextItem *)v84 addObject:v83];
                }
              }
              uint64_t v80 = [v78 countByEnumeratingWithState:&v319 objects:v355 count:16];
            }
            while (v80);
          }
        }
        id v71 = v237;
        id v246 = (id)[v237 countByEnumeratingWithState:&v323 objects:v356 count:16];
      }
      while (v246);
    }

    if ([(PGGraphMatchingContextItem *)v27 count])
    {
      double v85 = [PGGraphMatchingResult alloc];
      id v8 = v231;
      double v86 = [v231 relatableEvent];
      id v87 = [(PGGraphMatchingResult *)v85 initWithEvent:v86];

      [(PGGraphMatchingResult *)v87 setScore:1.0];
      os_log_t v88 = [PGGraphMatchingContextItem alloc];
      [(PGGraphMatchingResult *)v87 score];
      id v7 = v234;
      uint64_t v40 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v88, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 5, v234, v231, v27);
      id v236 = v87;
      [(PGGraphMatchingResult *)v87 setContextItem:v40 forRelatedType:2];
      if (v227)
      {
        objb = v40;
        v89 = [MEMORY[0x1E4F1CA48] array];
        long long v315 = 0u;
        long long v316 = 0u;
        long long v317 = 0u;
        long long v318 = 0u;
        id v27 = v27;
        uint64_t v90 = [(PGGraphMatchingContextItem *)v27 countByEnumeratingWithState:&v315 objects:v354 count:16];
        if (v90)
        {
          uint64_t v91 = v90;
          uint64_t v92 = *(void *)v316;
          do
          {
            for (iuint64_t i = 0; ii != v91; ++ii)
            {
              if (*(void *)v316 != v92) {
                objc_enumerationMutation(v27);
              }
              double v94 = NSString;
              double v95 = [*(id *)(*((void *)&v315 + 1) + 8 * ii) keywordDescription];
              double v96 = [v94 stringWithFormat:@"%@ - A Year Ago", v95];
              [v89 addObject:v96];
            }
            uint64_t v91 = [(PGGraphMatchingContextItem *)v27 countByEnumeratingWithState:&v315 objects:v354 count:16];
          }
          while (v91);
        }

LABEL_81:
        [(PGGraphMatchingResult *)v236 addKeywords:v89 forRelatedType:2];

        id v8 = v231;
        id v7 = v234;
LABEL_82:
        double v67 = v235;
        double v13 = v228;
LABEL_83:
        uint64_t v40 = objb;
LABEL_111:

        goto LABEL_112;
      }
      goto LABEL_110;
    }
    id v8 = v231;
    id v7 = v234;
    if ([(PGGraphMatchingContextItem *)v29 count])
    {
      double v97 = [PGGraphMatchingResult alloc];
      double v98 = [v231 relatableEvent];
      double v99 = [(PGGraphMatchingResult *)v97 initWithEvent:v98];

      [(PGGraphMatchingResult *)v99 setScore:0.95];
      double v100 = [PGGraphMatchingContextItem alloc];
      [(PGGraphMatchingResult *)v99 score];
      uint64_t v40 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v100, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 6, v234, v231, v29);
      id v236 = v99;
      [(PGGraphMatchingResult *)v99 setContextItem:v40 forRelatedType:2];
      if (v227)
      {
        objb = v40;
        v89 = [MEMORY[0x1E4F1CA48] array];
        long long v311 = 0u;
        long long v312 = 0u;
        long long v313 = 0u;
        long long v314 = 0u;
        uint64_t v29 = v29;
        uint64_t v101 = [(PGGraphMatchingContextItem *)v29 countByEnumeratingWithState:&v311 objects:v353 count:16];
        if (v101)
        {
          uint64_t v102 = v101;
          uint64_t v103 = *(void *)v312;
          do
          {
            for (juint64_t j = 0; jj != v102; ++jj)
            {
              if (*(void *)v312 != v103) {
                objc_enumerationMutation(v29);
              }
              double v105 = NSString;
              double v106 = [*(id *)(*((void *)&v311 + 1) + 8 * jj) keywordDescription];
              double v107 = [v105 stringWithFormat:@"%@ - Day in History", v106];
              [v89 addObject:v107];
            }
            uint64_t v102 = [(PGGraphMatchingContextItem *)v29 countByEnumeratingWithState:&v311 objects:v353 count:16];
          }
          while (v102);
        }

        goto LABEL_81;
      }
LABEL_110:
      double v67 = v235;
      double v13 = v228;
      goto LABEL_111;
    }
    objb = [MEMORY[0x1E4F1CA80] set];
    long long v307 = 0u;
    long long v308 = 0u;
    long long v309 = 0u;
    long long v310 = 0u;
    id v251 = v71;
    uint64_t v108 = [v251 countByEnumeratingWithState:&v307 objects:v352 count:16];
    if (v108)
    {
      uint64_t v109 = v108;
      uint64_t v110 = *(void *)v308;
      do
      {
        for (kuint64_t k = 0; kk != v109; ++kk)
        {
          if (*(void *)v308 != v110) {
            objc_enumerationMutation(v251);
          }
          v112 = *(void **)(*((void *)&v307 + 1) + 8 * kk);
          v304[0] = MEMORY[0x1E4F143A8];
          v304[1] = 3221225472;
          v304[2] = __60__PGGraph_Matching___timeMatchingFromEvent_toEvent_options___block_invoke_2;
          v304[3] = &unk_1E68EC0F8;
          id v305 = v16;
          long long v306 = objb;
          [v112 enumerateSiblingNodesThroughEdgesWithLabel:@"HOLIDAY" domain:401 usingBlock:v304];
        }
        uint64_t v109 = [v251 countByEnumeratingWithState:&v307 objects:v352 count:16];
      }
      while (v109);
    }

    long long v302 = 0u;
    long long v303 = 0u;
    long long v300 = 0u;
    long long v301 = 0u;
    id v247 = [v234 celebratedHolidayNodes];
    uint64_t v113 = [v247 countByEnumeratingWithState:&v300 objects:v351 count:16];
    if (v113)
    {
      uint64_t v114 = v113;
      uint64_t v115 = *(void *)v301;
      do
      {
        for (uint64_t mm = 0; mm != v114; ++mm)
        {
          if (*(void *)v301 != v115) {
            objc_enumerationMutation(v247);
          }
          double v117 = *(void **)(*((void *)&v300 + 1) + 8 * mm);
          v298[0] = MEMORY[0x1E4F143A8];
          v298[1] = 3221225472;
          v298[2] = __60__PGGraph_Matching___timeMatchingFromEvent_toEvent_options___block_invoke_3;
          v298[3] = &unk_1E68ED880;
          long long v299 = objb;
          [v117 enumerateNeighborNodesThroughEdgesWithLabel:@"HOLIDAY" domain:401 usingBlock:v298];
        }
        uint64_t v114 = [v247 countByEnumeratingWithState:&v300 objects:v351 count:16];
      }
      while (v114);
    }

    [(PGGraphMatchingContextItem *)objb intersectSet:v16];
    if ([(PGGraphMatchingContextItem *)objb count])
    {
      v118 = [PGGraphMatchingResult alloc];
      id v8 = v231;
      double v119 = [v231 relatableEvent];
      v120 = [(PGGraphMatchingResult *)v118 initWithEvent:v119];

      [(PGGraphMatchingResult *)v120 setScore:0.6];
      id v121 = [PGGraphMatchingContextItem alloc];
      [(PGGraphMatchingResult *)v120 score];
      id v7 = v234;
      uint64_t v122 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v121, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 8, v234, v231, objb);
      id v236 = v120;
      [(PGGraphMatchingResult *)v120 setContextItem:v122 forRelatedType:2];
      uint64_t v40 = objb;
      if (v227)
      {
        unint64_t v248 = v122;
        uint64_t v123 = [MEMORY[0x1E4F1CA48] array];
        long long v294 = 0u;
        long long v295 = 0u;
        long long v296 = 0u;
        long long v297 = 0u;
        os_log_t v252 = objb;
        uint64_t v124 = [(PGGraphMatchingContextItem *)v252 countByEnumeratingWithState:&v294 objects:v350 count:16];
        if (v124)
        {
          uint64_t v125 = v124;
          uint64_t v126 = *(void *)v295;
          do
          {
            for (nuint64_t n = 0; nn != v125; ++nn)
            {
              if (*(void *)v295 != v126) {
                objc_enumerationMutation(v252);
              }
              uint64_t v128 = NSString;
              uint64_t v129 = [*(id *)(*((void *)&v294 + 1) + 8 * nn) keywordDescription];
              v130 = [v128 stringWithFormat:@"%@ - Same Holiday", v129];
              [v123 addObject:v130];
            }
            uint64_t v125 = [(PGGraphMatchingContextItem *)v252 countByEnumeratingWithState:&v294 objects:v350 count:16];
          }
          while (v125);
        }

        [(PGGraphMatchingResult *)v236 addKeywords:v123 forRelatedType:2];
        id v8 = v231;
        id v7 = v234;
        uint64_t v40 = objb;
        uint64_t v122 = v248;
      }

      goto LABEL_110;
    }
    id v8 = v231;
    id v7 = v234;
    double v67 = v235;
    double v13 = v228;
    if (v225 != 1026)
    {
LABEL_205:
      id v236 = 0;
      goto LABEL_83;
    }
    v132 = [v234 eventSortedMomentNodes];
    v133 = [v132 firstObject];
    v134 = [v133 lastWeekendMoments];

    double v135 = [MEMORY[0x1E4F1CA80] set];
    long long v290 = 0u;
    long long v291 = 0u;
    long long v292 = 0u;
    long long v293 = 0u;
    id v249 = v134;
    uint64_t v136 = [v249 countByEnumeratingWithState:&v290 objects:v349 count:16];
    if (v136)
    {
      uint64_t v137 = v136;
      uint64_t v138 = *(void *)v291;
      do
      {
        for (uint64_t i1 = 0; i1 != v137; ++i1)
        {
          if (*(void *)v291 != v138) {
            objc_enumerationMutation(v249);
          }
          double v140 = [*(id *)(*((void *)&v290 + 1) + 8 * i1) dateNodes];
          [v135 unionSet:v140];
        }
        uint64_t v137 = [v249 countByEnumeratingWithState:&v290 objects:v349 count:16];
      }
      while (v137);
    }

    [v135 intersectSet:v16];
    uint64_t v141 = [v135 count];
    BOOL v142 = v223;
    if (!v141) {
      BOOL v142 = 0;
    }
    if (v142)
    {
      double v143 = [PGGraphMatchingResult alloc];
      double v144 = [v231 relatableEvent];
      double v145 = [(PGGraphMatchingResult *)v143 initWithEvent:v144];

      [(PGGraphMatchingResult *)v145 setScore:0.5];
      id v146 = [PGGraphMatchingContextItem alloc];
      [(PGGraphMatchingResult *)v145 score];
      uint64_t v147 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v146, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 7, v234, v231, v135);
      id v236 = v145;
      [(PGGraphMatchingResult *)v145 setContextItem:v147 forRelatedType:2];
      if (v227)
      {
        v243 = v147;
        uint64_t v148 = [MEMORY[0x1E4F1CA48] array];
        long long v286 = 0u;
        long long v287 = 0u;
        long long v288 = 0u;
        long long v289 = 0u;
        double v219 = v135;
        id v253 = v135;
        uint64_t v149 = [v253 countByEnumeratingWithState:&v286 objects:v348 count:16];
        if (v149)
        {
          uint64_t v150 = v149;
          uint64_t v151 = *(void *)v287;
          do
          {
            for (uint64_t i2 = 0; i2 != v150; ++i2)
            {
              if (*(void *)v287 != v151) {
                objc_enumerationMutation(v253);
              }
              v153 = NSString;
              double v154 = [*(id *)(*((void *)&v286 + 1) + 8 * i2) keywordDescription];
              double v155 = [v153 stringWithFormat:@"%@ - Previous Weekend Date", v154];
              [v148 addObject:v155];
            }
            uint64_t v150 = [v253 countByEnumeratingWithState:&v286 objects:v348 count:16];
          }
          while (v150);
        }

        [(PGGraphMatchingResult *)v236 addKeywords:v148 forRelatedType:2];
        id v8 = v231;
        id v7 = v234;
        double v135 = v219;
        uint64_t v147 = v243;
      }

      goto LABEL_82;
    }
    v220 = v135;
    uint64_t v244 = [MEMORY[0x1E4F1CA80] set];
    long long v282 = 0u;
    long long v283 = 0u;
    long long v284 = 0u;
    long long v285 = 0u;
    id v156 = v251;
    uint64_t v157 = [v156 countByEnumeratingWithState:&v282 objects:v347 count:16];
    if (v157)
    {
      uint64_t v158 = v157;
      uint64_t v159 = *(void *)v283;
      do
      {
        for (uint64_t i3 = 0; i3 != v158; ++i3)
        {
          if (*(void *)v283 != v159) {
            objc_enumerationMutation(v156);
          }
          v161 = [*(id *)(*((void *)&v282 + 1) + 8 * i3) sameWeekDateNodes];
          [v244 unionSet:v161];
        }
        uint64_t v158 = [v156 countByEnumeratingWithState:&v282 objects:v347 count:16];
      }
      while (v158);
    }

    double v162 = v244;
    [v244 intersectSet:v16];
    if ([v244 count])
    {
      double v163 = [PGGraphMatchingResult alloc];
      double v164 = [v231 relatableEvent];
      v165 = [(PGGraphMatchingResult *)v163 initWithEvent:v164];

      [(PGGraphMatchingResult *)v165 setScore:0.2];
      v166 = [PGGraphMatchingContextItem alloc];
      [(PGGraphMatchingResult *)v165 score];
      id v236 = v165;
      uint64_t v254 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v166, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 9, v234, v231, v244);
      -[PGGraphMatchingResult setContextItem:forRelatedType:](v165, "setContextItem:forRelatedType:");
      if (!v227)
      {
        int v175 = 1;
        double v67 = v235;
        v195 = v220;
        goto LABEL_204;
      }
      v167 = [MEMORY[0x1E4F1CA48] array];
      long long v278 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      long long v281 = 0u;
      id v238 = v244;
      uint64_t v168 = [v238 countByEnumeratingWithState:&v278 objects:v346 count:16];
      if (v168)
      {
        uint64_t v169 = v168;
        uint64_t v170 = *(void *)v279;
        do
        {
          for (uint64_t i4 = 0; i4 != v169; ++i4)
          {
            if (*(void *)v279 != v170) {
              objc_enumerationMutation(v238);
            }
            v172 = NSString;
            v173 = [*(id *)(*((void *)&v278 + 1) + 8 * i4) keywordDescription];
            unint64_t v174 = [v172 stringWithFormat:@"%@ - Same Week Date", v173];
            [(PGGraphMatchingContextItem *)v167 addObject:v174];
          }
          uint64_t v169 = [v238 countByEnumeratingWithState:&v278 objects:v346 count:16];
        }
        while (v169);
      }

      [(PGGraphMatchingResult *)v236 addKeywords:v167 forRelatedType:2];
      int v175 = 1;
      id v8 = v231;
      id v7 = v234;
      goto LABEL_199;
    }
    uint64_t v254 = [MEMORY[0x1E4F1CA80] set];
    long long v274 = 0u;
    long long v275 = 0u;
    long long v276 = 0u;
    long long v277 = 0u;
    id v176 = v156;
    uint64_t v177 = [v176 countByEnumeratingWithState:&v274 objects:v345 count:16];
    if (v177)
    {
      uint64_t v178 = v177;
      uint64_t v179 = *(void *)v275;
      do
      {
        for (uint64_t i5 = 0; i5 != v178; ++i5)
        {
          if (*(void *)v275 != v179) {
            objc_enumerationMutation(v176);
          }
          v181 = [*(id *)(*((void *)&v274 + 1) + 8 * i5) lastWeekDateNodes];
          [(PGGraphMatchingContextItem *)v254 unionSet:v181];
        }
        uint64_t v178 = [v176 countByEnumeratingWithState:&v274 objects:v345 count:16];
      }
      while (v178);
    }

    [(PGGraphMatchingContextItem *)v254 intersectSet:v16];
    if ([(PGGraphMatchingContextItem *)v254 count])
    {
      v182 = [PGGraphMatchingResult alloc];
      unint64_t v183 = [v231 relatableEvent];
      v184 = [(PGGraphMatchingResult *)v182 initWithEvent:v183];

      [(PGGraphMatchingResult *)v184 setScore:0.15];
      v185 = [PGGraphMatchingContextItem alloc];
      [(PGGraphMatchingResult *)v184 score];
      v167 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v185, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 10, v234, v231, v254);
      id v236 = v184;
      [(PGGraphMatchingResult *)v184 setContextItem:v167 forRelatedType:2];
      if (!v227)
      {
        int v175 = 1;
LABEL_199:
        double v67 = v235;
        v195 = v220;
        double v162 = v244;
LABEL_203:

LABEL_204:
        double v13 = v228;
        if (v175) {
          goto LABEL_83;
        }
        goto LABEL_205;
      }
      v186 = [MEMORY[0x1E4F1CA48] array];
      long long v270 = 0u;
      long long v271 = 0u;
      long long v272 = 0u;
      long long v273 = 0u;
      v239 = v254;
      uint64_t v187 = [(PGGraphMatchingContextItem *)v239 countByEnumeratingWithState:&v270 objects:v344 count:16];
      if (v187)
      {
        uint64_t v188 = v187;
        uint64_t v189 = *(void *)v271;
        do
        {
          for (uint64_t i6 = 0; i6 != v188; ++i6)
          {
            if (*(void *)v271 != v189) {
              objc_enumerationMutation(v239);
            }
            v191 = NSString;
            v192 = [*(id *)(*((void *)&v270 + 1) + 8 * i6) keywordDescription];
            v193 = [v191 stringWithFormat:@"%@ - Previous Week Date", v192];
            [(PGGraphMatchingContextItem *)v186 addObject:v193];
          }
          uint64_t v188 = [(PGGraphMatchingContextItem *)v239 countByEnumeratingWithState:&v270 objects:v344 count:16];
        }
        while (v188);
      }

      v194 = v186;
      [(PGGraphMatchingResult *)v236 addKeywords:v186 forRelatedType:2];
      id v8 = v231;
      id v7 = v234;
      double v67 = v235;
      v195 = v220;
      double v162 = v244;
    }
    else
    {
      v167 = [MEMORY[0x1E4F1CA80] set];
      long long v266 = 0u;
      long long v267 = 0u;
      long long v268 = 0u;
      long long v269 = 0u;
      id v221 = v176;
      uint64_t v224 = [v221 countByEnumeratingWithState:&v266 objects:v343 count:16];
      if (v224)
      {
        uint64_t v222 = *(void *)v267;
        do
        {
          for (uint64_t i7 = 0; i7 != v224; ++i7)
          {
            if (*(void *)v267 != v222) {
              objc_enumerationMutation(v221);
            }
            BOOL v197 = *(void **)(*((void *)&v266 + 1) + 8 * i7);
            uint64_t v198 = [v197 siblingNodesThroughEdgesWithLabel:@"WEEKMONTH" domain:400];
            uint64_t v199 = [v197 siblingNodesThroughEdgesWithLabel:@"MONTH" domain:400];
            id v240 = (id)v198;
            v200 = [MEMORY[0x1E4F1CA80] setWithSet:v198];
            BOOL v226 = (void *)v199;
            [v200 intersectSet:v199];
            long long v264 = 0u;
            long long v265 = 0u;
            long long v262 = 0u;
            long long v263 = 0u;
            id v201 = v200;
            uint64_t v202 = [v201 countByEnumeratingWithState:&v262 objects:v342 count:16];
            if (v202)
            {
              uint64_t v203 = v202;
              uint64_t v204 = *(void *)v263;
              do
              {
                for (uint64_t i8 = 0; i8 != v203; ++i8)
                {
                  if (*(void *)v263 != v204) {
                    objc_enumerationMutation(v201);
                  }
                  uint64_t v206 = *(void *)(*((void *)&v262 + 1) + 8 * i8);
                  if ([v16 containsObject:v206]) {
                    [(PGGraphMatchingContextItem *)v167 addObject:v206];
                  }
                }
                uint64_t v203 = [v201 countByEnumeratingWithState:&v262 objects:v342 count:16];
              }
              while (v203);
            }
          }
          uint64_t v224 = [v221 countByEnumeratingWithState:&v266 objects:v343 count:16];
        }
        while (v224);
      }

      double v162 = v244;
      if (![(PGGraphMatchingContextItem *)v167 count])
      {
        int v175 = 0;
        id v8 = v231;
        id v7 = v234;
        double v67 = v235;
        v195 = v220;
        goto LABEL_203;
      }
      id v207 = [PGGraphMatchingResult alloc];
      id v8 = v231;
      v208 = [v231 relatableEvent];
      v209 = [(PGGraphMatchingResult *)v207 initWithEvent:v208];

      [(PGGraphMatchingResult *)v209 setScore:0.1];
      v210 = [PGGraphMatchingContextItem alloc];
      [(PGGraphMatchingResult *)v209 score];
      id v7 = v234;
      v194 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v210, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 11, v234, v231, v167);
      id v236 = v209;
      [(PGGraphMatchingResult *)v209 setContextItem:v194 forRelatedType:2];
      if (v227)
      {
        v241 = v194;
        v211 = [MEMORY[0x1E4F1CA48] array];
        long long v258 = 0u;
        long long v259 = 0u;
        long long v260 = 0u;
        long long v261 = 0u;
        v167 = v167;
        uint64_t v212 = [(PGGraphMatchingContextItem *)v167 countByEnumeratingWithState:&v258 objects:v341 count:16];
        if (v212)
        {
          uint64_t v213 = v212;
          uint64_t v214 = *(void *)v259;
          do
          {
            for (uint64_t i9 = 0; i9 != v213; ++i9)
            {
              if (*(void *)v259 != v214) {
                objc_enumerationMutation(v167);
              }
              id v216 = NSString;
              v217 = [*(id *)(*((void *)&v258 + 1) + 8 * i9) keywordDescription];
              double v218 = [v216 stringWithFormat:@"%@ - Same Week In History Date", v217];
              [v211 addObject:v218];
            }
            uint64_t v213 = [(PGGraphMatchingContextItem *)v167 countByEnumeratingWithState:&v258 objects:v341 count:16];
          }
          while (v213);
        }

        [(PGGraphMatchingResult *)v236 addKeywords:v211 forRelatedType:2];
        id v8 = v231;
        id v7 = v234;
        double v67 = v235;
        v195 = v220;
        v194 = v241;
        double v162 = v244;
      }
      else
      {
        double v67 = v235;
        v195 = v220;
      }
    }

    int v175 = 1;
    goto LABEL_203;
  }
LABEL_113:

  return v236;
}

void __60__PGGraph_Matching___timeMatchingFromEvent_toEvent_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 sameWeekendMoments];
  [v2 unionSet:v3];
}

void __60__PGGraph_Matching___timeMatchingFromEvent_toEvent_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

uint64_t __60__PGGraph_Matching___timeMatchingFromEvent_toEvent_options___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)_timeMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4
{
  uint64_t v358 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v239 = [MEMORY[0x1E4F1CA60] dictionary];
  unsigned int v218 = [v7 targetEventDomain];
  uint64_t v230 = [v7 relatedType] & 0x402;
  id v8 = (void *)MEMORY[0x1E4F76C68];
  id v9 = [MEMORY[0x1E4F76C68] currentLocalDate];
  uint64_t v10 = [v8 yearFromDate:v9];

  double v219 = [MEMORY[0x1E4F1CA80] set];
  id v216 = [MEMORY[0x1E4F1CA80] set];
  id v253 = [MEMORY[0x1E4F1CA80] set];
  id v255 = [MEMORY[0x1E4F1CA80] set];
  id v233 = [MEMORY[0x1E4F1CA80] set];
  v217 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v244 = [MEMORY[0x1E4F1CA80] set];
  v245 = [MEMORY[0x1E4F1CA80] set];
  id v247 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v225 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  id v232 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  long long v258 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  v257 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  id v237 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  v231 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  uint64_t v224 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  BOOL v223 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  unint64_t v248 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  long long v337 = 0u;
  long long v338 = 0u;
  long long v339 = 0u;
  long long v340 = 0u;
  id obj = [v6 dateNodes];
  id v238 = v6;
  BOOL v226 = v7;
  uint64_t v222 = [obj countByEnumeratingWithState:&v337 objects:v357 count:16];
  if (v222)
  {
    id v251 = (id)(v10 - 1);
    uint64_t v221 = *(void *)v338;
    do
    {
      for (uint64_t i = 0; i != v222; ++i)
      {
        if (*(void *)v338 != v221) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v337 + 1) + 8 * i);
        double v13 = [v7 focusedNodes];
        double v14 = v13;
        if (!v13 || [v13 containsObject:v12])
        {
          id v228 = v14;
          uint64_t v229 = i;
          if (v230 == 1026)
          {
            uint64_t v15 = [v12 collection];
            double v16 = [v15 momentNodes];

            double v17 = [v16 temporarySet];
            uint64_t v18 = [(PGGraph *)self _eventsFromEvents:v17 withTargetDomain:v218];

            __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke(v19, v225, v18, v12);
            [v219 unionSet:v18];
          }
          uint64_t v20 = [v12 siblingNodesThroughEdgesWithLabel:@"DAY" domain:400];
          id v235 = v12;
          uint64_t v21 = [v12 siblingNodesThroughEdgesWithLabel:@"MONTH" domain:400];
          int v227 = (void *)v20;
          uint64_t v22 = [MEMORY[0x1E4F1CA80] setWithSet:v20];
          id v234 = (void *)v21;
          [v22 intersectSet:v21];
          long long v336 = 0u;
          long long v335 = 0u;
          long long v334 = 0u;
          long long v333 = 0u;
          id v249 = v22;
          uint64_t v23 = [v249 countByEnumeratingWithState:&v333 objects:v356 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v334;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v334 != v25) {
                  objc_enumerationMutation(v249);
                }
                id v27 = *(void **)(*((void *)&v333 + 1) + 8 * j);
                uint64_t v28 = [v27 year];
                uint64_t v29 = [v27 collection];
                uint64_t v30 = [v29 momentNodes];

                id v31 = [v30 temporarySet];
                uint64_t v32 = -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v31, [v7 targetEventDomain]);

                if ((id)v28 == v251) {
                  uint64_t v34 = v258;
                }
                else {
                  uint64_t v34 = v257;
                }
                if ((id)v28 == v251) {
                  double v35 = v253;
                }
                else {
                  double v35 = v255;
                }
                __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke(v33, v34, v32, v27);
                [v35 unionSet:v32];
              }
              uint64_t v24 = [v249 countByEnumeratingWithState:&v333 objects:v356 count:16];
            }
            while (v24);
          }

          v328[0] = MEMORY[0x1E4F143A8];
          v328[1] = 3221225472;
          v328[2] = __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_3;
          v328[3] = &unk_1E68EC0A8;
          v328[4] = self;
          id v36 = v7;
          id v329 = v36;
          id v332 = &__block_literal_global_416;
          id v330 = v237;
          id v331 = v233;
          [v235 enumerateSiblingNodesThroughEdgesWithLabel:@"HOLIDAY" domain:401 usingBlock:v328];
          if (v230 == 1026)
          {
            id v37 = [v235 sameWeekDateNodes];
            long long v324 = 0u;
            long long v325 = 0u;
            long long v326 = 0u;
            long long v327 = 0u;
            id v242 = v37;
            uint64_t v38 = [v37 countByEnumeratingWithState:&v324 objects:v355 count:16];
            if (v38)
            {
              uint64_t v39 = v38;
              uint64_t v40 = *(void *)v325;
              do
              {
                for (uint64_t k = 0; k != v39; ++k)
                {
                  if (*(void *)v325 != v40) {
                    objc_enumerationMutation(v242);
                  }
                  long long v42 = *(void **)(*((void *)&v324 + 1) + 8 * k);
                  id v43 = [v42 collection];
                  id v44 = [v43 momentNodes];

                  id v45 = [v44 temporarySet];
                  id v46 = -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v45, [v36 targetEventDomain]);

                  __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke(v47, v224, v46, v42);
                  [v244 unionSet:v46];
                }
                uint64_t v39 = [v242 countByEnumeratingWithState:&v324 objects:v355 count:16];
              }
              while (v39);
            }
            uint64_t v48 = [v235 lastWeekDateNodes];
            long long v320 = 0u;
            long long v321 = 0u;
            long long v322 = 0u;
            long long v323 = 0u;
            id v240 = v48;
            uint64_t v49 = [v48 countByEnumeratingWithState:&v320 objects:v354 count:16];
            if (v49)
            {
              uint64_t v50 = v49;
              uint64_t v51 = *(void *)v321;
              do
              {
                for (uint64_t m = 0; m != v50; ++m)
                {
                  if (*(void *)v321 != v51) {
                    objc_enumerationMutation(v240);
                  }
                  char v53 = *(void **)(*((void *)&v320 + 1) + 8 * m);
                  double v54 = [v53 collection];
                  uint64_t v55 = [v54 momentNodes];

                  uint64_t v56 = [v55 temporarySet];
                  long long v57 = -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v56, [v36 targetEventDomain]);

                  __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke(v58, v223, v57, v53);
                  [v245 unionSet:v57];
                }
                uint64_t v50 = [v240 countByEnumeratingWithState:&v320 objects:v354 count:16];
              }
              while (v50);
            }
            id v236 = [v235 siblingNodesThroughEdgesWithLabel:@"WEEKMONTH" domain:400];
            id v59 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:");
            [v59 intersectSet:v234];
            long long v319 = 0u;
            long long v318 = 0u;
            long long v317 = 0u;
            long long v316 = 0u;
            id v60 = v59;
            uint64_t v61 = [v60 countByEnumeratingWithState:&v316 objects:v353 count:16];
            if (v61)
            {
              uint64_t v62 = v61;
              uint64_t v63 = *(void *)v317;
              do
              {
                for (uint64_t n = 0; n != v62; ++n)
                {
                  if (*(void *)v317 != v63) {
                    objc_enumerationMutation(v60);
                  }
                  id v65 = *(void **)(*((void *)&v316 + 1) + 8 * n);
                  double v66 = [v65 collection];
                  double v67 = [v66 momentNodes];

                  uint64_t v68 = [v67 temporarySet];
                  uint64_t v69 = -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v68, [v36 targetEventDomain]);

                  __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke(v70, v248, v69, v65);
                  [v247 unionSet:v69];
                }
                uint64_t v62 = [v60 countByEnumeratingWithState:&v316 objects:v353 count:16];
              }
              while (v62);
            }

            id v7 = v226;
          }

          id v6 = v238;
          double v14 = v228;
          uint64_t i = v229;
        }
      }
      uint64_t v222 = [obj countByEnumeratingWithState:&v337 objects:v357 count:16];
    }
    while (v222);
  }

  if (v230 == 1026)
  {
    id v71 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v72 = [v6 eventCollection];
    long long v73 = [v72 eventMomentNodes];
    v314[0] = MEMORY[0x1E4F143A8];
    v314[1] = 3221225472;
    v314[2] = __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_4;
    v314[3] = &unk_1E68EF578;
    id v74 = v71;
    id v315 = v74;
    [v73 enumerateNodesUsingBlock:v314];

    uint64_t v75 = -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v74, [v226 targetEventDomain]);
    [v216 unionSet:v75];
    long long v313 = 0u;
    long long v312 = 0u;
    long long v311 = 0u;
    long long v310 = 0u;
    id v76 = v75;
    uint64_t v77 = [v76 countByEnumeratingWithState:&v310 objects:v352 count:16];
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v79 = *(void *)v311;
      do
      {
        for (iuint64_t i = 0; ii != v78; ++ii)
        {
          if (*(void *)v311 != v79) {
            objc_enumerationMutation(v76);
          }
          uint64_t v81 = *(void **)(*((void *)&v310 + 1) + 8 * ii);
          v82 = [v81 dateNodes];
          __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_2(v232, v81, v82);
        }
        uint64_t v78 = [v76 countByEnumeratingWithState:&v310 objects:v352 count:16];
      }
      while (v78);
    }
  }
  long long v309 = 0u;
  long long v308 = 0u;
  long long v307 = 0u;
  long long v306 = 0u;
  double v83 = [v6 celebratedHolidayNodes];
  uint64_t v84 = [v83 countByEnumeratingWithState:&v306 objects:v351 count:16];
  if (v84)
  {
    uint64_t v85 = v84;
    uint64_t v86 = *(void *)v307;
    do
    {
      for (juint64_t j = 0; jj != v85; ++jj)
      {
        if (*(void *)v307 != v86) {
          objc_enumerationMutation(v83);
        }
        os_log_t v88 = *(void **)(*((void *)&v306 + 1) + 8 * jj);
        v301[0] = MEMORY[0x1E4F143A8];
        v301[1] = 3221225472;
        v301[2] = __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_5;
        v301[3] = &unk_1E68EC0D0;
        v301[4] = self;
        id v302 = v226;
        id v305 = &__block_literal_global_416;
        id v303 = v237;
        id v304 = v233;
        [v88 enumerateNeighborNodesThroughEdgesWithLabel:@"HOLIDAY" domain:401 usingBlock:v301];
      }
      uint64_t v85 = [v83 countByEnumeratingWithState:&v306 objects:v351 count:16];
    }
    while (v85);
  }

  if (v230 == 1026)
  {
    v89 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v90 = [v238 eventCollection];
    uint64_t v91 = [v90 eventMomentNodes];
    v299[0] = MEMORY[0x1E4F143A8];
    v299[1] = 3221225472;
    v299[2] = __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_6;
    v299[3] = &unk_1E68EF578;
    id v92 = v89;
    id v300 = v92;
    [v91 enumerateNodesUsingBlock:v299];

    double v93 = -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v92, [v226 targetEventDomain]);
    [v217 unionSet:v93];
    long long v297 = 0u;
    long long v298 = 0u;
    long long v295 = 0u;
    long long v296 = 0u;
    id v94 = v93;
    uint64_t v95 = [v94 countByEnumeratingWithState:&v295 objects:v350 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v296;
      do
      {
        for (kuint64_t k = 0; kk != v96; ++kk)
        {
          if (*(void *)v296 != v97) {
            objc_enumerationMutation(v94);
          }
          double v99 = *(void **)(*((void *)&v295 + 1) + 8 * kk);
          double v100 = [v99 dateNodes];
          __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_2(v231, v99, v100);
        }
        uint64_t v96 = [v94 countByEnumeratingWithState:&v295 objects:v350 count:16];
      }
      while (v96);
    }
  }
  [v216 minusSet:v219];
  [v253 minusSet:v219];
  [v253 minusSet:v216];
  [v255 minusSet:v219];
  [v255 minusSet:v216];
  [v255 minusSet:v253];
  [v233 minusSet:v219];
  [v233 minusSet:v216];
  [v233 minusSet:v253];
  [v233 minusSet:v255];
  [v217 minusSet:v219];
  [v217 minusSet:v216];
  [v217 minusSet:v253];
  [v217 minusSet:v255];
  [v217 minusSet:v233];
  [v244 minusSet:v219];
  [v244 minusSet:v216];
  [v244 minusSet:v253];
  [v244 minusSet:v255];
  [v244 minusSet:v233];
  [v244 minusSet:v217];
  [v245 minusSet:v219];
  [v245 minusSet:v216];
  [v245 minusSet:v253];
  [v245 minusSet:v255];
  [v245 minusSet:v233];
  [v245 minusSet:v217];
  [v245 minusSet:v244];
  [v247 minusSet:v219];
  [v247 minusSet:v216];
  [v247 minusSet:v253];
  [v247 minusSet:v255];
  [v247 minusSet:v233];
  [v247 minusSet:v217];
  [v247 minusSet:v244];
  [v247 minusSet:v245];
  long long v293 = 0u;
  long long v294 = 0u;
  long long v291 = 0u;
  long long v292 = 0u;
  id v252 = v219;
  uint64_t v101 = [v252 countByEnumeratingWithState:&v291 objects:v349 count:16];
  if (v101)
  {
    uint64_t v102 = v101;
    uint64_t v103 = *(void *)v292;
    do
    {
      for (uint64_t mm = 0; mm != v102; ++mm)
      {
        if (*(void *)v292 != v103) {
          objc_enumerationMutation(v252);
        }
        double v105 = *(void **)(*((void *)&v291 + 1) + 8 * mm);
        double v106 = [PGGraphMatchingResult alloc];
        double v107 = [v105 relatableEvent];
        uint64_t v108 = [(PGGraphMatchingResult *)v106 initWithEvent:v107];

        [(PGGraphMatchingResult *)v108 setScore:0.8];
        uint64_t v109 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v105, "identifier"));
        uint64_t v110 = [v225 objectForKey:v109];
        uint64_t v111 = [PGGraphMatchingContextItem alloc];
        [(PGGraphMatchingResult *)v108 score];
        v112 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v111, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 2, v238, v105, v110);
        [(PGGraphMatchingResult *)v108 setContextItem:v112 forRelatedType:2];
        [v239 setObject:v108 forKeyedSubscript:v109];
      }
      uint64_t v102 = [v252 countByEnumeratingWithState:&v291 objects:v349 count:16];
    }
    while (v102);
  }

  long long v289 = 0u;
  long long v290 = 0u;
  long long v287 = 0u;
  long long v288 = 0u;
  id v250 = v216;
  uint64_t v113 = [v250 countByEnumeratingWithState:&v287 objects:v348 count:16];
  if (v113)
  {
    uint64_t v114 = v113;
    uint64_t v115 = *(void *)v288;
    do
    {
      for (nuint64_t n = 0; nn != v114; ++nn)
      {
        if (*(void *)v288 != v115) {
          objc_enumerationMutation(v250);
        }
        double v117 = *(void **)(*((void *)&v287 + 1) + 8 * nn);
        v118 = [PGGraphMatchingResult alloc];
        double v119 = [v117 relatableEvent];
        v120 = [(PGGraphMatchingResult *)v118 initWithEvent:v119];

        [(PGGraphMatchingResult *)v120 setScore:0.7];
        id v121 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v117, "identifier"));
        uint64_t v122 = [v232 objectForKey:v121];
        uint64_t v123 = [PGGraphMatchingContextItem alloc];
        [(PGGraphMatchingResult *)v120 score];
        uint64_t v124 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v123, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 3, v238, v117, v122);
        [(PGGraphMatchingResult *)v120 setContextItem:v124 forRelatedType:2];
        [v239 setObject:v120 forKeyedSubscript:v121];
      }
      uint64_t v114 = [v250 countByEnumeratingWithState:&v287 objects:v348 count:16];
    }
    while (v114);
  }

  long long v285 = 0u;
  long long v286 = 0u;
  long long v283 = 0u;
  long long v284 = 0u;
  id v254 = v253;
  uint64_t v125 = [v254 countByEnumeratingWithState:&v283 objects:v347 count:16];
  if (v125)
  {
    uint64_t v126 = v125;
    uint64_t v127 = *(void *)v284;
    do
    {
      for (uint64_t i1 = 0; i1 != v126; ++i1)
      {
        if (*(void *)v284 != v127) {
          objc_enumerationMutation(v254);
        }
        uint64_t v129 = *(void **)(*((void *)&v283 + 1) + 8 * i1);
        v130 = [PGGraphMatchingResult alloc];
        v131 = [v129 relatableEvent];
        v132 = [(PGGraphMatchingResult *)v130 initWithEvent:v131];

        [(PGGraphMatchingResult *)v132 setScore:1.0];
        v133 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v129, "identifier"));
        v134 = [v258 objectForKey:v133];
        double v135 = [PGGraphMatchingContextItem alloc];
        [(PGGraphMatchingResult *)v132 score];
        uint64_t v136 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v135, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 5, v238, v129, v134);
        [(PGGraphMatchingResult *)v132 setContextItem:v136 forRelatedType:2];
        [v239 setObject:v132 forKeyedSubscript:v133];
      }
      uint64_t v126 = [v254 countByEnumeratingWithState:&v283 objects:v347 count:16];
    }
    while (v126);
  }

  long long v281 = 0u;
  long long v282 = 0u;
  long long v279 = 0u;
  long long v280 = 0u;
  id v256 = v255;
  uint64_t v137 = [v256 countByEnumeratingWithState:&v279 objects:v346 count:16];
  if (v137)
  {
    uint64_t v138 = v137;
    uint64_t v139 = *(void *)v280;
    do
    {
      for (uint64_t i2 = 0; i2 != v138; ++i2)
      {
        if (*(void *)v280 != v139) {
          objc_enumerationMutation(v256);
        }
        uint64_t v141 = *(void **)(*((void *)&v279 + 1) + 8 * i2);
        BOOL v142 = [PGGraphMatchingResult alloc];
        double v143 = [v141 relatableEvent];
        double v144 = [(PGGraphMatchingResult *)v142 initWithEvent:v143];

        [(PGGraphMatchingResult *)v144 setScore:0.95];
        double v145 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v141, "identifier"));
        id v146 = [v257 objectForKey:v145];
        uint64_t v147 = [PGGraphMatchingContextItem alloc];
        [(PGGraphMatchingResult *)v144 score];
        uint64_t v148 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v147, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 6, v238, v141, v146);
        [(PGGraphMatchingResult *)v144 setContextItem:v148 forRelatedType:2];
        [v239 setObject:v144 forKeyedSubscript:v145];
      }
      uint64_t v138 = [v256 countByEnumeratingWithState:&v279 objects:v346 count:16];
    }
    while (v138);
  }

  long long v277 = 0u;
  long long v278 = 0u;
  long long v275 = 0u;
  long long v276 = 0u;
  id v243 = v233;
  uint64_t v149 = [v243 countByEnumeratingWithState:&v275 objects:v345 count:16];
  if (v149)
  {
    uint64_t v150 = v149;
    uint64_t v151 = *(void *)v276;
    do
    {
      for (uint64_t i3 = 0; i3 != v150; ++i3)
      {
        if (*(void *)v276 != v151) {
          objc_enumerationMutation(v243);
        }
        v153 = *(void **)(*((void *)&v275 + 1) + 8 * i3);
        double v154 = [PGGraphMatchingResult alloc];
        double v155 = [v153 relatableEvent];
        id v156 = [(PGGraphMatchingResult *)v154 initWithEvent:v155];

        [(PGGraphMatchingResult *)v156 setScore:0.6];
        uint64_t v157 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v153, "identifier"));
        uint64_t v158 = [v237 objectForKey:v157];
        uint64_t v159 = [PGGraphMatchingContextItem alloc];
        [(PGGraphMatchingResult *)v156 score];
        v160 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v159, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 8, v238, v153, v158);
        [(PGGraphMatchingResult *)v156 setContextItem:v160 forRelatedType:2];
        [v239 setObject:v156 forKeyedSubscript:v157];
      }
      uint64_t v150 = [v243 countByEnumeratingWithState:&v275 objects:v345 count:16];
    }
    while (v150);
  }

  long long v273 = 0u;
  long long v274 = 0u;
  long long v271 = 0u;
  long long v272 = 0u;
  id v241 = v217;
  uint64_t v161 = [v241 countByEnumeratingWithState:&v271 objects:v344 count:16];
  if (v161)
  {
    uint64_t v162 = v161;
    uint64_t v163 = *(void *)v272;
    do
    {
      for (uint64_t i4 = 0; i4 != v162; ++i4)
      {
        if (*(void *)v272 != v163) {
          objc_enumerationMutation(v241);
        }
        v165 = *(void **)(*((void *)&v271 + 1) + 8 * i4);
        v166 = [PGGraphMatchingResult alloc];
        v167 = [v165 relatableEvent];
        uint64_t v168 = [(PGGraphMatchingResult *)v166 initWithEvent:v167];

        [(PGGraphMatchingResult *)v168 setScore:0.5];
        uint64_t v169 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v165, "identifier"));
        uint64_t v170 = [v231 objectForKey:v169];
        uint64_t v171 = [PGGraphMatchingContextItem alloc];
        [(PGGraphMatchingResult *)v168 score];
        v172 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v171, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 7, v238, v165, v170);
        [(PGGraphMatchingResult *)v168 setContextItem:v172 forRelatedType:2];
        [v239 setObject:v168 forKeyedSubscript:v169];
      }
      uint64_t v162 = [v241 countByEnumeratingWithState:&v271 objects:v344 count:16];
    }
    while (v162);
  }

  long long v269 = 0u;
  long long v270 = 0u;
  long long v267 = 0u;
  long long v268 = 0u;
  id v173 = v244;
  uint64_t v174 = [v173 countByEnumeratingWithState:&v267 objects:v343 count:16];
  if (v174)
  {
    uint64_t v175 = v174;
    uint64_t v176 = *(void *)v268;
    do
    {
      for (uint64_t i5 = 0; i5 != v175; ++i5)
      {
        if (*(void *)v268 != v176) {
          objc_enumerationMutation(v173);
        }
        uint64_t v178 = *(void **)(*((void *)&v267 + 1) + 8 * i5);
        uint64_t v179 = [PGGraphMatchingResult alloc];
        v180 = [v178 relatableEvent];
        v181 = [(PGGraphMatchingResult *)v179 initWithEvent:v180];

        [(PGGraphMatchingResult *)v181 setScore:0.2];
        v182 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v178, "identifier"));
        unint64_t v183 = [v224 objectForKey:v182];
        v184 = [PGGraphMatchingContextItem alloc];
        [(PGGraphMatchingResult *)v181 score];
        v185 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v184, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 9, v238, v178, v183);
        [(PGGraphMatchingResult *)v181 setContextItem:v185 forRelatedType:2];
        [v239 setObject:v181 forKeyedSubscript:v182];
      }
      uint64_t v175 = [v173 countByEnumeratingWithState:&v267 objects:v343 count:16];
    }
    while (v175);
  }

  long long v265 = 0u;
  long long v266 = 0u;
  long long v263 = 0u;
  long long v264 = 0u;
  id v186 = v245;
  uint64_t v187 = [v186 countByEnumeratingWithState:&v263 objects:v342 count:16];
  if (v187)
  {
    uint64_t v188 = v187;
    uint64_t v189 = *(void *)v264;
    do
    {
      for (uint64_t i6 = 0; i6 != v188; ++i6)
      {
        if (*(void *)v264 != v189) {
          objc_enumerationMutation(v186);
        }
        v191 = *(void **)(*((void *)&v263 + 1) + 8 * i6);
        v192 = [PGGraphMatchingResult alloc];
        v193 = [v191 relatableEvent];
        v194 = [(PGGraphMatchingResult *)v192 initWithEvent:v193];

        [(PGGraphMatchingResult *)v194 setScore:0.15];
        v195 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v191, "identifier"));
        v196 = [v223 objectForKey:v195];
        BOOL v197 = [PGGraphMatchingContextItem alloc];
        [(PGGraphMatchingResult *)v194 score];
        uint64_t v198 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v197, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 10, v238, v191, v196);
        [(PGGraphMatchingResult *)v194 setContextItem:v198 forRelatedType:2];
        [v239 setObject:v194 forKeyedSubscript:v195];
      }
      uint64_t v188 = [v186 countByEnumeratingWithState:&v263 objects:v342 count:16];
    }
    while (v188);
  }
  id v246 = v173;

  long long v261 = 0u;
  long long v262 = 0u;
  long long v259 = 0u;
  long long v260 = 0u;
  id v199 = v247;
  uint64_t v200 = [v199 countByEnumeratingWithState:&v259 objects:v341 count:16];
  id v201 = v238;
  if (v200)
  {
    uint64_t v202 = v200;
    uint64_t v203 = *(void *)v260;
    do
    {
      for (uint64_t i7 = 0; i7 != v202; ++i7)
      {
        if (*(void *)v260 != v203) {
          objc_enumerationMutation(v199);
        }
        double v205 = *(void **)(*((void *)&v259 + 1) + 8 * i7);
        uint64_t v206 = [PGGraphMatchingResult alloc];
        id v207 = [v205 relatableEvent];
        v208 = [(PGGraphMatchingResult *)v206 initWithEvent:v207];

        [(PGGraphMatchingResult *)v208 setScore:0.1];
        v209 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v205, "identifier"));
        v210 = [v248 objectForKey:v209];
        v211 = [PGGraphMatchingContextItem alloc];
        [(PGGraphMatchingResult *)v208 score];
        uint64_t v212 = v211;
        id v201 = v238;
        uint64_t v213 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v212, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 11, v238, v205, v210);
        [(PGGraphMatchingResult *)v208 setContextItem:v213 forRelatedType:2];
        [v239 setObject:v208 forKeyedSubscript:v209];
      }
      uint64_t v202 = [v199 countByEnumeratingWithState:&v259 objects:v341 count:16];
    }
    while (v202);
  }

  uint64_t v214 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v201, "identifier"));
  [v239 removeObjectForKey:v214];

  return v239;
}

void __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        double v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "identifier"));
        double v14 = [v6 objectForKey:v13];
        if (!v14)
        {
          double v14 = [MEMORY[0x1E4F1CA80] set];
          [v6 setObject:v14 forKey:v13];
        }
        [v14 addObject:v8];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

void __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 collection];
  id v8 = [v4 momentNodes];

  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v8 temporarySet];
  id v7 = objc_msgSend(v5, "_eventsFromEvents:withTargetDomain:", v6, objc_msgSend(*(id *)(a1 + 40), "targetEventDomain"));

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 56) unionSet:v7];
}

void __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 sameWeekendMoments];
  [v2 unionSet:v3];
}

void __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v8 = a1;
  id v5 = a3;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "identifier"));
  id v7 = [v8 objectForKey:v6];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
    [v8 setObject:v7 forKey:v6];
  }
  [v7 unionSet:v5];
}

void __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 collection];
  id v8 = [v4 momentNodes];

  id v5 = *(void **)(a1 + 32);
  id v6 = [v8 temporarySet];
  id v7 = objc_msgSend(v5, "_eventsFromEvents:withTargetDomain:", v6, objc_msgSend(*(id *)(a1 + 40), "targetEventDomain"));

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 56) unionSet:v7];
}

void __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 lastWeekendMoments];
  [v2 unionSet:v3];
}

- (id)_peopleMatchingResultFromEvent:(id)a3 matchedEvent:(id)a4 presentPeopleCountForEvent:(unint64_t)a5 presentPeopleCountForMatchedEvent:(unint64_t)a6 commonPeople:(id)a7 relationshipScoreCache:(id)a8 needsKeywords:(BOOL)a9
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  double v19 = (double)(a6 + a5 - [v17 count]);
  double v20 = 1.0 - ((v19 + 1.0) / (v19 + 1.0 + (double)(unint64_t)[v17 count] - v19) + -1.0) / v19;
  double v54 = v15;
  uint64_t v21 = [v15 eventCollection];
  uint64_t v22 = [v21 eventMomentNodes];

  char v53 = v16;
  uint64_t v23 = [v16 eventCollection];
  uint64_t v24 = [v23 eventMomentNodes];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __176__PGGraph_Matching___peopleMatchingResultFromEvent_matchedEvent_presentPeopleCountForEvent_presentPeopleCountForMatchedEvent_commonPeople_relationshipScoreCache_needsKeywords___block_invoke_3;
  aBlock[3] = &unk_1E68EC060;
  id v51 = v18;
  id v64 = v51;
  id v65 = self;
  uint64_t v25 = (double (**)(void *, void *))_Block_copy(aBlock);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v26 = v17;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v59 objects:v67 count:16];
  id obj = v26;
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v60 != v29) {
          objc_enumerationMutation(obj);
        }
        id v31 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        uint64_t v32 = [v54 relatableEvent];
        double v33 = __176__PGGraph_Matching___peopleMatchingResultFromEvent_matchedEvent_presentPeopleCountForEvent_presentPeopleCountForMatchedEvent_commonPeople_relationshipScoreCache_needsKeywords___block_invoke(v32, v31, v22);
        uint64_t v34 = [v53 relatableEvent];
        double v35 = v33
            - __176__PGGraph_Matching___peopleMatchingResultFromEvent_matchedEvent_presentPeopleCountForEvent_presentPeopleCountForMatchedEvent_commonPeople_relationshipScoreCache_needsKeywords___block_invoke(v34, v31, v24);

        double v36 = -v35;
        if (v35 >= 0.0) {
          double v36 = v35;
        }
        double v20 = v20 + (1.0 - v36) * 0.000000001 + v25[2](v25, v31) * 1.0e-10;
      }
      id v26 = obj;
      uint64_t v28 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v28);
  }

  id v37 = [PGGraphMatchingResult alloc];
  uint64_t v38 = [v53 relatableEvent];
  uint64_t v39 = [(PGGraphMatchingResult *)v37 initWithEvent:v38];

  [(PGGraphMatchingResult *)v39 setScore:v20];
  uint64_t v40 = [PGGraphMatchingContextItem alloc];
  [(PGGraphMatchingResult *)v39 score];
  uint64_t v41 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v40, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 1, 1, v54, v53, v26);
  [(PGGraphMatchingResult *)v39 setContextItem:v41 forRelatedType:1];
  if (a9)
  {
    uint64_t v50 = v41;
    long long v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v26, "count"));
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v43 = v26;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v55 objects:v66 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v56 != v46) {
            objc_enumerationMutation(v43);
          }
          uint64_t v48 = [*(id *)(*((void *)&v55 + 1) + 8 * j) keywordDescription];
          [v42 addObject:v48];
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v55 objects:v66 count:16];
      }
      while (v45);
    }

    [(PGGraphMatchingResult *)v39 addKeywords:v42 forRelatedType:1];
    id v26 = obj;
    uint64_t v41 = v50;
  }

  return v39;
}

double __176__PGGraph_Matching___peopleMatchingResultFromEvent_matchedEvent_presentPeopleCountForEvent_presentPeopleCountForMatchedEvent_commonPeople_relationshipScoreCache_needsKeywords___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "identifier"));
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    double v8 = v7;
  }
  else
  {
    [*(id *)(a1 + 40) relationshipScoreForPersonNode:v3];
    double v8 = v9;
    if (*(void *)(a1 + 32))
    {
      uint64_t v10 = [NSNumber numberWithDouble:v9];
      [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v4];
    }
  }

  return v8;
}

double __176__PGGraph_Matching___peopleMatchingResultFromEvent_matchedEvent_presentPeopleCountForEvent_presentPeopleCountForMatchedEvent_commonPeople_relationshipScoreCache_needsKeywords___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  double v8 = [v6 collection];
  if ([v7 count] == 1)
  {
    double v9 = +[PGGraphEdgeCollection edgesFromNodes:v8 toNodes:v7];
    uint64_t v10 = [v9 anyEdge];
    [v10 importance];
    double v12 = v11;
  }
  else
  {
    uint64_t v18 = 0;
    double v19 = (double *)&v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __176__PGGraph_Matching___peopleMatchingResultFromEvent_matchedEvent_presentPeopleCountForEvent_presentPeopleCountForMatchedEvent_commonPeople_relationshipScoreCache_needsKeywords___block_invoke_2;
    v14[3] = &unk_1E68F1898;
    id v15 = v8;
    id v17 = &v18;
    id v16 = v5;
    [v7 enumerateNodesUsingBlock:v14];
    double v12 = v19[3];

    _Block_object_dispose(&v18, 8);
  }

  return v12;
}

double __176__PGGraph_Matching___peopleMatchingResultFromEvent_matchedEvent_presentPeopleCountForEvent_presentPeopleCountForMatchedEvent_commonPeople_relationshipScoreCache_needsKeywords___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 collection];
  id v6 = +[PGGraphEdgeCollection edgesFromNodes:v3 toNodes:v5];
  id v7 = [v6 anyEdge];
  [v7 importance];
  double v9 = v8;

  [*(id *)(a1 + 40) weightForMoment:v4];
  double v11 = v10;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  double result = *(double *)(v12 + 24) + v11 * v9;
  *(double *)(v12 + 24) = result;
  return result;
}

- (id)_peopleMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = NSString;
  uint64_t v12 = [(id)objc_opt_class() pathToMoment];
  uint64_t v13 = [v11 stringWithFormat:@"(e)%@", v12];

  double v14 = NSString;
  id v15 = [(id)objc_opt_class() pathFromMoment];
  id v16 = [v14 stringWithFormat:@"%@(oe)", v15];

  id v17 = v10;
  double v36 = (void *)v13;
  uint64_t v18 = [NSString stringWithFormat:@"%@<-[:PRESENT]-(commonPerson:People)-[:PRESENT]->%@", v13, v16];
  v37[0] = @"e";
  v37[1] = @"oe";
  v38[0] = v8;
  v38[1] = v9;
  double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  uint64_t v20 = [(MAGraph *)self matchWithVisualFormat:v18 elements:v19 error:0];

  uint64_t v21 = [v20 nodesForName:@"commonPerson"];
  uint64_t v22 = [v17 focusedNodes];
  uint64_t v23 = [(PGGraph *)self _peopleWithoutMe:v21 focusOnNodes:v22];

  if ([v23 count])
  {
    uint64_t v34 = [v8 personNodes];
    [v17 focusedNodes];
    uint64_t v24 = v35 = v16;
    unint64_t v33 = [(PGGraph *)self _peopleCountWithoutMe:v34 focusOnNodes:v24];

    uint64_t v25 = [v9 personNodes];
    id v26 = v20;
    uint64_t v27 = v18;
    unint64_t v28 = [(PGGraph *)self _peopleCountWithoutMe:v25 focusOnNodes:0];
    LOBYTE(v32) = [v17 needsKeywords];
    unint64_t v29 = v28;
    uint64_t v18 = v27;
    uint64_t v20 = v26;
    uint64_t v30 = [(PGGraph *)self _peopleMatchingResultFromEvent:v8 matchedEvent:v9 presentPeopleCountForEvent:v33 presentPeopleCountForMatchedEvent:v29 commonPeople:v23 relationshipScoreCache:0 needsKeywords:v32];

    id v16 = v35;
  }
  else
  {
    uint64_t v30 = 0;
  }

  return v30;
}

- (unint64_t)_peopleCountWithoutMe:(id)a3 focusOnNodes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PGGraph_Matching___peopleCountWithoutMe_focusOnNodes___block_invoke;
  void v10[3] = &unk_1E68EF708;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = &v13;
  [v5 enumerateObjectsUsingBlock:v10];
  unint64_t v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __56__PGGraph_Matching___peopleCountWithoutMe_focusOnNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v7 = v3;
  if (!v4 || (int v5 = [v4 containsObject:v3], v3 = v7, v5))
  {
    char v6 = [v3 isMeNode];
    id v3 = v7;
    if ((v6 & 1) == 0) {
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
  }
}

- (id)_peopleWithoutMe:(id)a3 focusOnNodes:(id)a4
{
  id v5 = a4;
  char v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = a3;
  unint64_t v8 = [v6 set];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__PGGraph_Matching___peopleWithoutMe_focusOnNodes___block_invoke;
  v14[3] = &unk_1E68F0820;
  id v15 = v5;
  id v9 = v8;
  id v16 = v9;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v14];

  id v11 = v16;
  id v12 = v9;

  return v12;
}

void __51__PGGraph_Matching___peopleWithoutMe_focusOnNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v7 = v3;
  if (!v4 || (int v5 = [v4 containsObject:v3], v3 = v7, v5))
  {
    char v6 = [v3 isMeNode];
    id v3 = v7;
    if ((v6 & 1) == 0)
    {
      [*(id *)(a1 + 40) addObject:v7];
      id v3 = v7;
    }
  }
}

- (id)_peopleMatchingIdsToResultsFromEvent:(id)a3 options:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = [v6 personNodes];
  id v10 = [v7 focusedNodes];
  unint64_t v11 = [(PGGraph *)self _peopleCountWithoutMe:v9 focusOnNodes:v10];

  id v12 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v11)
  {
    uint64_t v13 = NSString;
    double v14 = [(id)objc_opt_class() pathToMoment];
    id v15 = +[PGGraphMomentNode inclusivePathToTargetNodeDomain:withName:](PGGraphMomentNode, "inclusivePathToTargetNodeDomain:withName:", [v7 targetEventDomain], @"linkedEvent");
    id v16 = [v13 stringWithFormat:@"(e)%@<-[:PRESENT]-(commonPerson:People)-[:PRESENT]->%@", v14, v15];

    uint64_t v32 = @"e";
    v33[0] = v6;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    uint64_t v18 = [(MAGraph *)self matchWithVisualFormat:v16 elements:v17 error:0];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __66__PGGraph_Matching___peopleMatchingIdsToResultsFromEvent_options___block_invoke;
    v24[3] = &unk_1E68EC038;
    id v25 = v18;
    id v26 = self;
    id v27 = v7;
    id v19 = v6;
    id v28 = v19;
    unint64_t v31 = v11;
    id v29 = v12;
    id v20 = v8;
    id v30 = v20;
    id v21 = v18;
    [v21 enumerateNodesWithName:@"linkedEvent" usingBlock:v24];
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "identifier"));
    [v20 removeObjectForKey:v22];
  }
  return v8;
}

void __66__PGGraph_Matching___peopleMatchingIdsToResultsFromEvent_options___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "nodesForName:fromNode:", @"commonPerson");
  id v4 = *(void **)(a1 + 40);
  int v5 = [*(id *)(a1 + 48) focusedNodes];
  id v6 = [v4 _peopleWithoutMe:v3 focusOnNodes:v5];

  if ([v6 count])
  {
    id v7 = *(void **)(a1 + 40);
    unint64_t v8 = [v14 personNodes];
    uint64_t v9 = [v7 _peopleCountWithoutMe:v8 focusOnNodes:0];

    LOBYTE(v13) = 0;
    id v10 = [*(id *)(a1 + 40) _peopleMatchingResultFromEvent:*(void *)(a1 + 56) matchedEvent:v14 presentPeopleCountForEvent:*(void *)(a1 + 80) presentPeopleCountForMatchedEvent:v9 commonPeople:v6 relationshipScoreCache:*(void *)(a1 + 64) needsKeywords:v13];
    unint64_t v11 = *(void **)(a1 + 72);
    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "identifier"));
    [v11 setObject:v10 forKey:v12];
  }
}

- (id)matchPersonNodes:(id)a3 sortDescriptors:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = objc_opt_new();
  id v30 = self;
  uint64_t v9 = [(PGGraph *)self meNode];
  if ([v6 count] == 1 && objc_msgSend(v6, "containsObject:", v9))
  {
    id v10 = objc_alloc_init(PGNeighborScoreComputer);
    unint64_t v11 = [v9 collection];
    id v12 = [v11 momentNodes];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __54__PGGraph_Matching__matchPersonNodes_sortDescriptors___block_invoke;
    v45[3] = &unk_1E68EBFA0;
    uint64_t v46 = v10;
    __int16 v48 = 102;
    id v13 = v8;
    id v47 = v13;
    uint64_t v32 = v10;
    [v12 enumerateNodesUsingBlock:v45];

    id v14 = v13;
    id v15 = v46;
  }
  else
  {
    unint64_t v31 = v8;
    id v29 = v7;
    if ((unint64_t)[v6 count] >= 2 && objc_msgSend(v6, "containsObject:", v9))
    {
      id v16 = (void *)[v6 mutableCopy];
      [v16 removeObject:v9];

      id v6 = v16;
    }
    uint64_t v17 = objc_msgSend(v6, "count", v9);
    uint64_t v32 = [MEMORY[0x1E4F1CA60] dictionary];
    id v15 = [MEMORY[0x1E4F28E60] indexSet];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v18 = v6;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v42 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = [*(id *)(*((void *)&v41 + 1) + 8 * i) collection];
          uint64_t v24 = [v23 momentNodes];
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          void v33[2] = __54__PGGraph_Matching__matchPersonNodes_sortDescriptors___block_invoke_2;
          v33[3] = &unk_1E68EBFF0;
          id v25 = v18;
          id v34 = v25;
          __int16 v40 = 102;
          id v35 = v15;
          id v36 = v31;
          id v37 = v30;
          uint64_t v39 = v17;
          uint64_t v38 = v32;
          [v24 enumerateNodesUsingBlock:v33];
        }
        uint64_t v20 = [v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v20);
    }
    id v6 = v18;

    unint64_t v8 = v31;
    id v7 = v29;
    if (v29) {
      [v31 sortUsingDescriptors:v29];
    }
    id v26 = v31;
    uint64_t v9 = v28;
  }

  return v8;
}

void __54__PGGraph_Matching__matchPersonNodes_sortDescriptors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) neighborScoreWithMomentNode:v3];
  double v5 = v4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = objc_msgSend(v3, "connectedEventsWithTargetDomain:", *(unsigned __int16 *)(a1 + 48), 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = [[PGGraphMatchingResult alloc] initWithEvent:*(void *)(*((void *)&v12 + 1) + 8 * v10)];
        [(PGGraphMatchingResult *)v11 setScore:v5];
        [*(id *)(a1 + 40) addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void __54__PGGraph_Matching__matchPersonNodes_sortDescriptors___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  double v4 = [MEMORY[0x1E4F1CA80] set];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__PGGraph_Matching__matchPersonNodes_sortDescriptors___block_invoke_3;
  v18[3] = &unk_1E68EBFC8;
  id v19 = *(id *)(a1 + 32);
  id v5 = v4;
  id v20 = v5;
  uint64_t v21 = &v22;
  [v3 enumeratePersonNodesUsingBlock:v18];
  [v3 connectedEventsWithTargetDomain:*(unsigned __int16 *)(a1 + 80)];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      if (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v10, "identifier"))) {
        break;
      }
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v10, "identifier"));
      unint64_t v11 = *(void **)(a1 + 48);
      LOBYTE(v13) = 0;
      long long v12 = [*(id *)(a1 + 56) _peopleMatchingResultFromEvent:0 matchedEvent:v10 presentPeopleCountForEvent:*(void *)(a1 + 72) presentPeopleCountForMatchedEvent:v23[3] commonPeople:v5 relationshipScoreCache:*(void *)(a1 + 64) needsKeywords:v13];
      [v11 addObject:v12];

      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v26 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __54__PGGraph_Matching__matchPersonNodes_sortDescriptors___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 isMeNode] & 1) == 0)
  {
    if ([*(id *)(a1 + 32) containsObject:v4]) {
      [*(id *)(a1 + 40) addObject:v4];
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  return MEMORY[0x1F4181820]();
}

- (id)matchEvent:(id)a3 withEvent:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(PGGraph *)self _checkCanRead];
  char v11 = [v10 relatedType];
  char v12 = v11;
  if (v11)
  {
    double v93 = [(PGGraph *)self _peopleMatchingFromEvent:v8 toEvent:v9 options:v10];
    double v13 = 0.7;
    if ((v12 & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    double v93 = 0;
    double v13 = 0.0;
    if ((v11 & 2) != 0)
    {
LABEL_3:
      uint64_t v95 = [(PGGraph *)self _timeMatchingFromEvent:v8 toEvent:v9 options:v10];
      double v13 = v13 + 0.5;
      goto LABEL_6;
    }
  }
  uint64_t v95 = 0;
LABEL_6:
  if ((v12 & 4) != 0)
  {
    long long v14 = [(PGGraph *)self _locationMatchingFromEvent:v8 toEvent:v9 options:v10];
    double v13 = v13 + 1.1;
    if ((v12 & 8) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    long long v14 = 0;
    if ((v12 & 8) != 0)
    {
LABEL_8:
      long long v15 = [(PGGraph *)self _eventMatchingFromEvent:v8 toEvent:v9 options:v10];
      double v13 = v13 + 0.5;
      goto LABEL_11;
    }
  }
  long long v15 = 0;
LABEL_11:
  if ((v12 & 0x10) != 0)
  {
    id v94 = [(PGGraph *)self _placeMatchingFromEvent:v8 toEvent:v9 options:v10];
    double v13 = v13 + 0.3;
    if ((v12 & 0x20) != 0) {
      goto LABEL_13;
    }
  }
  else
  {
    id v94 = 0;
    if ((v12 & 0x20) != 0)
    {
LABEL_13:
      id v92 = [(PGGraph *)self _sceneMatchingFromEvent:v8 toEvent:v9 options:v10];
      double v13 = v13 + 0.3;
      goto LABEL_16;
    }
  }
  id v92 = 0;
LABEL_16:
  int v91 = [v10 needsKeywords];
  if (v12)
  {
    id v17 = v93;
    long long v16 = v17;
    if (v17)
    {
      id v18 = v17;
      [v18 score];
      [v18 setScore:0.7 / v13 * v19];
    }
  }
  else
  {
    long long v16 = 0;
  }
  double v20 = 0.5 / v13;
  if ((v12 & 2) != 0)
  {
    id v21 = v95;
    uint64_t v22 = v21;
    id v23 = v16;
    if (v21)
    {
      if (v16)
      {
        [v21 score];
        double v25 = v24;
        [v16 score];
        [v16 setScore:v26 + v25 * v20];
        uint64_t v27 = [v16 contextItemForRelatedType:2];
        if (!v27)
        {
          uint64_t v27 = [v22 contextItemForRelatedType:2];
          if (v27) {
            [v16 setContextItem:v27 forRelatedType:2];
          }
        }
        if (v91)
        {
          [v22 keywordsForRelatedType:2];
          id v89 = v9;
          id v28 = v8;
          v30 = id v29 = v14;
          [v16 addKeywords:v30 forRelatedType:2];

          long long v14 = v29;
          id v8 = v28;
          id v9 = v89;
        }

        id v23 = v16;
      }
      else
      {
        id v23 = v21;
        [v23 score];
        [v23 setScore:v20 * v31];
      }
    }

    id v32 = v23;
    long long v16 = v32;
  }
  if ((v12 & 4) != 0)
  {
    id v33 = v14;
    id v34 = v33;
    id v35 = v16;
    if (v33)
    {
      double v36 = 1.1 / v13;
      if (v16)
      {
        [v33 score];
        double v38 = v37;
        [v16 score];
        [v16 setScore:v39 + v38 * v36];
        __int16 v40 = [v16 contextItemForRelatedType:4];
        if (!v40)
        {
          __int16 v40 = [v34 contextItemForRelatedType:4];
          if (v40) {
            [v16 setContextItem:v40 forRelatedType:4];
          }
        }
        if (v91)
        {
          [v34 keywordsForRelatedType:4];
          id v90 = v9;
          id v41 = v8;
          v43 = long long v42 = v14;
          [v16 addKeywords:v43 forRelatedType:4];

          long long v14 = v42;
          id v8 = v41;
          id v9 = v90;
        }

        id v35 = v16;
      }
      else
      {
        id v35 = v33;
        [v35 score];
        [v35 setScore:v36 * v44];
      }
    }

    id v45 = v35;
    long long v16 = v45;
  }
  if ((v12 & 8) != 0)
  {
    id v46 = v15;
    id v47 = v46;
    id v48 = v16;
    if (v46)
    {
      if (v16)
      {
        [v46 score];
        double v50 = v49;
        [v16 score];
        [v16 setScore:v51 + v50 * v20];
        BOOL v52 = [v16 contextItemForRelatedType:8];
        if (!v52)
        {
          BOOL v52 = [v47 contextItemForRelatedType:8];
          if (v52) {
            [v16 setContextItem:v52 forRelatedType:8];
          }
        }
        if (v91)
        {
          [v47 keywordsForRelatedType:8];
          id v53 = v9;
          id v54 = v8;
          v56 = long long v55 = v14;
          [v16 addKeywords:v56 forRelatedType:8];

          long long v14 = v55;
          id v8 = v54;
          id v9 = v53;
        }

        id v48 = v16;
      }
      else
      {
        id v48 = v46;
        [v48 score];
        [v48 setScore:v20 * v57];
      }
    }

    id v58 = v48;
    long long v16 = v58;
  }
  double v59 = 0.3 / v13;
  if ((v12 & 0x10) != 0)
  {
    id v60 = v94;
    long long v61 = v60;
    id v62 = v16;
    if (v60)
    {
      if (v16)
      {
        [v60 score];
        double v64 = v63;
        [v16 score];
        [v16 setScore:v65 + v64 * v59];
        double v66 = [v16 contextItemForRelatedType:16];
        if (!v66)
        {
          double v66 = [v61 contextItemForRelatedType:16];
          if (v66) {
            [v16 setContextItem:v66 forRelatedType:16];
          }
        }
        if (v91)
        {
          [v61 keywordsForRelatedType:16];
          id v67 = v9;
          id v68 = v8;
          v70 = uint64_t v69 = v14;
          [v16 addKeywords:v70 forRelatedType:16];

          long long v14 = v69;
          id v8 = v68;
          id v9 = v67;
        }

        id v62 = v16;
      }
      else
      {
        id v62 = v60;
        [v62 score];
        [v62 setScore:v59 * v71];
      }
    }

    id v72 = v62;
    long long v16 = v72;
  }
  if ((v12 & 0x20) != 0)
  {
    long long v73 = v92;
    id v74 = v92;
    uint64_t v75 = v74;
    id v76 = v16;
    if (v74)
    {
      if (v16)
      {
        [v74 score];
        double v78 = v77;
        [v16 score];
        [v16 setScore:v79 + v78 * v59];
        uint64_t v80 = [v16 contextItemForRelatedType:32];
        if (!v80)
        {
          uint64_t v80 = [v75 contextItemForRelatedType:32];
          if (v80) {
            [v16 setContextItem:v80 forRelatedType:32];
          }
        }
        if (v91)
        {
          [v75 keywordsForRelatedType:32];
          id v81 = v9;
          id v82 = v8;
          uint64_t v84 = v83 = v14;
          [v16 addKeywords:v84 forRelatedType:32];

          long long v14 = v83;
          id v8 = v82;
          id v9 = v81;
          long long v73 = v92;
        }

        id v76 = v16;
      }
      else
      {
        id v76 = v74;
        [v76 score];
        [v76 setScore:v59 * v85];
      }
    }

    id v86 = v76;
    long long v16 = v86;
  }
  else
  {
    long long v73 = v92;
  }
  id v87 = v16;

  return v87;
}

- (id)matchEvent:(id)a3 options:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PGGraph *)self _checkCanRead];
  id v88 = [MEMORY[0x1E4F1CA48] array];
  char v8 = [v7 relatedType];
  id v9 = [MEMORY[0x1E4F1CA80] set];
  if (v8)
  {
    id v87 = [(PGGraph *)self _peopleMatchingIdsToResultsFromEvent:v6 options:v7];
    char v12 = [v87 allKeys];
    [v9 addObjectsFromArray:v12];

    double v10 = 0.7;
    if ((v8 & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    id v87 = 0;
    double v10 = 0.0;
    if ((v8 & 2) != 0)
    {
LABEL_3:
      id v86 = [(PGGraph *)self _timeMatchingIdsToScoresFromEvent:v6 options:v7];
      char v11 = [v86 allKeys];
      [v9 addObjectsFromArray:v11];

      double v10 = v10 + 0.5;
      goto LABEL_6;
    }
  }
  id v86 = 0;
LABEL_6:
  if ((v8 & 4) != 0)
  {
    double v85 = [(PGGraph *)self _locationMatchingIdsToScoresFromEvent:v6 options:v7];
    long long v14 = [v85 allKeys];
    [v9 addObjectsFromArray:v14];

    double v10 = v10 + 1.1;
    if ((v8 & 8) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    double v85 = 0;
    if ((v8 & 8) != 0)
    {
LABEL_8:
      uint64_t v84 = [(PGGraph *)self _eventMatchingIdsToScoresFromEvent:v6 options:v7];
      double v13 = [v84 allKeys];
      [v9 addObjectsFromArray:v13];

      double v10 = v10 + 0.5;
      goto LABEL_11;
    }
  }
  uint64_t v84 = 0;
LABEL_11:
  if ((v8 & 0x10) != 0)
  {
    double v83 = [(PGGraph *)self _placeMatchingIdsToScoresFromEvent:v6 options:v7];
    long long v15 = [v83 allKeys];
    [v9 addObjectsFromArray:v15];

    double v10 = v10 + 0.3;
  }
  else
  {
    double v83 = 0;
  }
  id v81 = v7;
  id v82 = v6;
  if ((v8 & 0x20) != 0)
  {
    long long v16 = [(PGGraph *)self _sceneMatchingIdsToScoresFromEvent:v6 options:v7];
    id v17 = [v16 allKeys];
    [v9 addObjectsFromArray:v17];

    double v10 = v10 + 0.3;
  }
  else
  {
    long long v16 = 0;
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v89 objects:v93 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    double v21 = 0.7 / v10;
    double v22 = 0.5 / v10;
    double v23 = 1.1 / v10;
    uint64_t v24 = *(void *)v90;
    double v25 = 0.3 / v10;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v90 != v24) {
          objc_enumerationMutation(v18);
        }
        uint64_t v27 = *(void *)(*((void *)&v89 + 1) + 8 * v26);
        if (v8)
        {
          id v29 = [v87 objectForKeyedSubscript:*(void *)(*((void *)&v89 + 1) + 8 * v26)];
          id v28 = v29;
          if (v29)
          {
            id v30 = v29;
            [v30 score];
            [v30 setScore:v21 * v31];
          }
        }
        else
        {
          id v28 = 0;
        }
        if ((v8 & 2) != 0)
        {
          id v32 = [v86 objectForKeyedSubscript:v27];
          id v33 = v32;
          id v34 = v28;
          if (v32)
          {
            if (v28)
            {
              [v32 score];
              double v36 = v35;
              [v28 score];
              [v28 setScore:v37 + v36 * v22];
              double v38 = [v28 contextItemForRelatedType:2];
              if (!v38)
              {
                double v38 = [v33 contextItemForRelatedType:2];
                if (v38) {
                  [v28 setContextItem:v38 forRelatedType:2];
                }
              }

              id v34 = v28;
            }
            else
            {
              id v34 = v32;
              [v34 score];
              [v34 setScore:v22 * v39];
            }
          }

          id v40 = v34;
          id v28 = v40;
          if ((v8 & 4) == 0)
          {
LABEL_28:
            if ((v8 & 8) == 0) {
              goto LABEL_29;
            }
            goto LABEL_51;
          }
        }
        else if ((v8 & 4) == 0)
        {
          goto LABEL_28;
        }
        objc_msgSend(v85, "objectForKeyedSubscript:", v27, v81, v82);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        long long v42 = v41;
        id v43 = v28;
        if (v41)
        {
          if (v28)
          {
            [v41 score];
            double v45 = v44;
            [v28 score];
            [v28 setScore:v46 + v45 * v23];
            id v47 = [v28 contextItemForRelatedType:4];
            if (!v47)
            {
              id v47 = [v42 contextItemForRelatedType:4];
              if (v47) {
                [v28 setContextItem:v47 forRelatedType:4];
              }
            }

            id v43 = v28;
          }
          else
          {
            id v43 = v41;
            [v43 score];
            [v43 setScore:v23 * v48];
          }
        }

        id v49 = v43;
        id v28 = v49;
        if ((v8 & 8) == 0)
        {
LABEL_29:
          if ((v8 & 0x10) == 0) {
            goto LABEL_30;
          }
          goto LABEL_59;
        }
LABEL_51:
        objc_msgSend(v84, "objectForKeyedSubscript:", v27, v81);
        id v50 = (id)objc_claimAutoreleasedReturnValue();
        double v51 = v50;
        id v52 = v28;
        if (v50)
        {
          if (v28)
          {
            [v50 score];
            double v54 = v53;
            [v28 score];
            [v28 setScore:v55 + v54 * v22];
            long long v56 = [v28 contextItemForRelatedType:8];
            if (!v56)
            {
              long long v56 = [v51 contextItemForRelatedType:8];
              if (v56) {
                [v28 setContextItem:v56 forRelatedType:8];
              }
            }

            id v52 = v28;
          }
          else
          {
            id v52 = v50;
            [v52 score];
            [v52 setScore:v22 * v57];
          }
        }

        id v58 = v52;
        id v28 = v58;
        if ((v8 & 0x10) == 0)
        {
LABEL_30:
          if ((v8 & 0x20) == 0) {
            goto LABEL_31;
          }
          goto LABEL_67;
        }
LABEL_59:
        objc_msgSend(v83, "objectForKeyedSubscript:", v27, v81);
        id v59 = (id)objc_claimAutoreleasedReturnValue();
        id v60 = v59;
        id v61 = v28;
        if (v59)
        {
          if (v28)
          {
            [v59 score];
            double v63 = v62;
            [v28 score];
            [v28 setScore:v64 + v63 * v25];
            double v65 = [v28 contextItemForRelatedType:16];
            if (!v65)
            {
              double v65 = [v60 contextItemForRelatedType:16];
              if (v65) {
                [v28 setContextItem:v65 forRelatedType:16];
              }
            }

            id v61 = v28;
          }
          else
          {
            id v61 = v59;
            [v61 score];
            [v61 setScore:v25 * v66];
          }
        }

        id v67 = v61;
        id v28 = v67;
        if ((v8 & 0x20) == 0)
        {
LABEL_31:
          if (!v28) {
            goto LABEL_33;
          }
LABEL_32:
          objc_msgSend(v88, "addObject:", v28, v81);
          goto LABEL_33;
        }
LABEL_67:
        objc_msgSend(v16, "objectForKeyedSubscript:", v27, v81);
        id v68 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v69 = v68;
        id v70 = v28;
        if (v68)
        {
          if (v28)
          {
            [v68 score];
            double v72 = v71;
            [v28 score];
            [v28 setScore:v73 + v72 * v25];
            id v74 = [v28 contextItemForRelatedType:32];
            if (!v74)
            {
              id v74 = [v69 contextItemForRelatedType:32];
              if (v74) {
                [v28 setContextItem:v74 forRelatedType:32];
              }
            }

            id v70 = v28;
          }
          else
          {
            id v70 = v68;
            [v70 score];
            [v70 setScore:v25 * v75];
          }
        }

        id v76 = v70;
        id v28 = v76;
        if (v76) {
          goto LABEL_32;
        }
LABEL_33:

        ++v26;
      }
      while (v20 != v26);
      uint64_t v77 = [v18 countByEnumeratingWithState:&v89 objects:v93 count:16];
      uint64_t v20 = v77;
    }
    while (v77);
  }

  double v78 = [v81 sortDescriptors];

  if (v78)
  {
    double v79 = [v81 sortDescriptors];
    [v88 sortUsingDescriptors:v79];
  }
  return v88;
}

+ (id)defaultMatchingSortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"event" ascending:0 comparator:&__block_literal_global_54945];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

uint64_t __51__PGGraph_Matching__defaultMatchingSortDescriptors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 timestampUTCStart];
  double v7 = v6;
  [v5 timestampUTCStart];
  if (v7 >= v8)
  {
    [v4 timestampUTCStart];
    double v11 = v10;
    [v5 timestampUTCStart];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

+ (id)matchingBlockedSceneLabels
{
  return &unk_1F28D47B8;
}

+ (id)matchingWeightToDictionary
{
  return &unk_1F28D5A40;
}

- (id)interestingAreaNodes
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  [(PGGraph *)self _checkCanRead];
  uint64_t v2 = MEMORY[0x1E4F14500];
  id v3 = MEMORY[0x1E4F14500];
  os_signpost_id_t v4 = os_signpost_id_generate(v2);
  id v5 = v2;
  os_signpost_id_t spid = v4;
  unint64_t v39 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v4, "InterestingAreaNodes", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v36 = mach_absolute_time();
  context = (void *)MEMORY[0x1D25FED50]();
  id v40 = [(PGGraph *)self supersetCityNodes];
  double v6 = [v40 addressNodes];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
  double v8 = +[PGGraphAreaNode nonBlockedFilter];
  uint64_t v9 = +[MANodeCollection nodesMatchingFilter:v8 inGraph:self];

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v58 = 0;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __43__PGGraph_Processing__interestingAreaNodes__block_invoke;
  v50[3] = &unk_1E68EC5D8;
  id v10 = v6;
  id v51 = v10;
  double v53 = buf;
  id v11 = v7;
  id v52 = v11;
  [v9 enumerateIdentifiersAsCollectionsWithBlock:v50];
  unint64_t v12 = [v11 count];
  if (v12)
  {
    *(double *)(*(void *)&buf[8] + 24) = *(double *)(*(void *)&buf[8] + 24) / (double)v12;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    double v13 = [v11 objectEnumerator];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v47;
      double v16 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v47 != v15) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v46 + 1) + 8 * i) doubleValue];
          double v16 = v16 + (v18 - *(double *)(*(void *)&buf[8] + 24)) * (v18 - *(double *)(*(void *)&buf[8] + 24));
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v56 count:16];
      }
      while (v14);
    }
    else
    {
      double v16 = 0.0;
    }

    unint64_t v20 = [v11 count];
    double v21 = *(double *)(*(void *)&buf[8] + 24);
    id v22 = objc_alloc_init(MEMORY[0x1E4F71E60]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    double v23 = [v11 keyEnumerator];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v55 count:16];
    if (v24)
    {
      double v25 = v21 + sqrt(v16 / (double)v20) * 0.5;
      uint64_t v26 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v43 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          id v29 = [v11 objectForKey:v28];
          [v29 doubleValue];
          if (v30 >= v25) {
            objc_msgSend(v22, "addIdentifier:", objc_msgSend(v28, "unsignedIntegerValue"));
          }
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v55 count:16];
      }
      while (v24);
    }

    if ([v22 count]) {
      uint64_t v19 = [(MAElementCollection *)[PGGraphAreaNodeCollection alloc] initWithGraph:self elementIdentifiers:v22];
    }
    else {
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  _Block_object_dispose(buf, 8);
  uint64_t v31 = mach_absolute_time();
  uint32_t numer = info.numer;
  denouint64_t m = info.denom;
  id v34 = MEMORY[0x1E4F14500];
  if (v39 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, spid, "InterestingAreaNodes", "", buf, 2u);
  }

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "InterestingAreaNodes";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v31 - v36) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (!v19) {
    uint64_t v19 = [(MAElementCollection *)[PGGraphAreaNodeCollection alloc] initWithGraph:self];
  }

  return v19;
}

void __43__PGGraph_Processing__interestingAreaNodes__block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v16 = a3;
  id v5 = (void *)MEMORY[0x1D25FED50]();
  double v6 = [v16 addressNodes];
  double v7 = [v6 collectionBySubtracting:a1[4]];
  double v8 = [v7 momentNodes];
  unint64_t v9 = [v8 count];
  if (v9 >= 3)
  {
    unint64_t v10 = v9;
    id v11 = [v8 universalDateInterval];
    [v11 duration];
    if (v12 >= 7776000.0)
    {
      *(double *)(*(void *)(a1[6] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 24) + (double)v10;
      double v13 = (void *)a1[5];
      uint64_t v14 = [NSNumber numberWithUnsignedInteger:v10];
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:a2];
      [v13 setObject:v14 forKey:v15];
    }
  }
}

- (id)interestingCityNodes
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(PGGraph *)self _checkCanRead];
  id v3 = [(PGGraph *)self supersets];
  objc_sync_enter(v3);
  interestingCityNodes = self->_interestingCityNodes;
  if (!interestingCityNodes)
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
    os_signpost_id_t v7 = os_signpost_id_generate(v5);
    double v8 = v5;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v7, "InterestingCityNodes", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v9 = mach_absolute_time();
    unint64_t v10 = (void *)MEMORY[0x1D25FED50]();
    id v11 = [(PGGraph *)self mainUrbanCityNodes];
    double v12 = [(PGGraph *)self supersetCityNodes];
    double v13 = [v11 collectionBySubtracting:v12];
    uint64_t v14 = self->_interestingCityNodes;
    self->_interestingCityNodes = v13;

    uint64_t v15 = mach_absolute_time();
    mach_timebase_info v16 = info;
    id v17 = MEMORY[0x1E4F14500];
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, v7, "InterestingCityNodes", "", buf, 2u);
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      id v22 = "InterestingCityNodes";
      __int16 v23 = 2048;
      double v24 = (float)((float)((float)((float)(v15 - v9) * (float)v16.numer) / (float)v16.denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    interestingCityNodes = self->_interestingCityNodes;
  }
  double v18 = interestingCityNodes;
  objc_sync_exit(v3);

  return v18;
}

- (id)mainUrbanCityNodes
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(PGGraph *)self _checkCanRead];
  id v3 = objc_alloc_init(MEMORY[0x1E4F71E60]);
  os_signpost_id_t v4 = MEMORY[0x1E4F14500];
  id v5 = MEMORY[0x1E4F14500];
  os_signpost_id_t v6 = os_signpost_id_generate(v4);
  os_signpost_id_t v7 = v4;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v6, "MainUrbanCityNodes", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v22 = mach_absolute_time();
  double v8 = (void *)MEMORY[0x1D25FED50]();
  uint64_t v9 = +[PGGraphROINode urbanFilter];
  unint64_t v10 = +[MANodeCollection nodesMatchingFilter:v9 inGraph:self];

  id v11 = [v10 momentNodes];
  double v12 = +[PGGraphLocationCityNode filter];
  double v13 = +[MANodeCollection nodesMatchingFilter:v12 inGraph:self];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __41__PGGraph_Processing__mainUrbanCityNodes__block_invoke;
  v23[3] = &unk_1E68EC5B0;
  id v24 = v11;
  id v14 = v3;
  id v25 = v14;
  id v15 = v11;
  [v13 enumerateIdentifiersAsCollectionsWithBlock:v23];

  uint64_t v16 = mach_absolute_time();
  mach_timebase_info v17 = info;
  double v18 = v4;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, v6, "MainUrbanCityNodes", "", buf, 2u);
  }
  uint64_t v19 = MEMORY[0x1E4F14500];

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v28 = "MainUrbanCityNodes";
    __int16 v29 = 2048;
    double v30 = (float)((float)((float)((float)(v16 - v22) * (float)v17.numer) / (float)v17.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  unint64_t v20 = [(MAElementCollection *)[PGGraphLocationCityNodeCollection alloc] initWithGraph:self elementIdentifiers:v14];

  return v20;
}

void __41__PGGraph_Processing__mainUrbanCityNodes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = [a3 momentNodes];
  id v5 = [v8 collectionByIntersecting:*(void *)(a1 + 32)];
  if ((unint64_t)[v5 count] >= 3)
  {
    os_signpost_id_t v6 = [v5 universalDateInterval];
    [v6 duration];
    if (v7 >= 7776000.0) {
      [*(id *)(a1 + 40) addIdentifier:a2];
    }
  }
}

- (unint64_t)_cluePeopleForRelationships:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:@"FAMILY"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 containsObject:@"FRIEND"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 containsObject:@"PARTNER"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 containsObject:@"COWORKER"])
  {
    unint64_t v4 = 16;
  }
  else if ([v3 containsObject:@"ACQUAINTANCE"])
  {
    unint64_t v4 = 32;
  }
  else if ([v3 containsObject:@"VIP"])
  {
    unint64_t v4 = 64;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)inferredUserLocales
{
  uint64_t v2 = [(PGGraph *)self supersetCountryNodes];
  id v3 = [v2 languageNodes];
  unint64_t v4 = [v3 locales];
  id v5 = (void *)[v4 mutableCopy];

  os_signpost_id_t v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  if (v6) {
    [v5 addObject:v6];
  }

  return v5;
}

- (id)celebratedHolidays
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v4 = +[PGGraphNodeCollection nodesInGraph:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __41__PGGraph_Processing__celebratedHolidays__block_invoke;
  v7[3] = &unk_1E68EC578;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateIdentifiersAsCollectionsWithBlock:v7];

  return v5;
}

void __41__PGGraph_Processing__celebratedHolidays__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void v10[3] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [a3 celebratingMomentNodes];
  if ([v4 count])
  {
    id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
    os_signpost_id_t v6 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalEndDate", 1, v5);
    v10[1] = v6;
    double v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
    v10[2] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

    uint64_t v9 = [v4 sortedArrayUsingDescriptors:v8];

    [*(id *)(a1 + 32) addObject:v9];
  }
}

- (id)weekends
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(PGGraph *)self shortTripNodes];
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        double v7 = [*(id *)(*((void *)&v17 + 1) + 8 * i) collection];
        id v8 = [v7 momentNodes];
        uint64_t v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
        v22[0] = v9;
        unint64_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
        v22[1] = v10;
        id v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
        v22[2] = v11;
        double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];

        double v13 = [v8 sortedArrayUsingDescriptors:v12];
        [v16 addObject:v13];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v16;
}

- (id)trips
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(PGGraph *)self longTripNodes];
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        double v7 = [*(id *)(*((void *)&v17 + 1) + 8 * i) collection];
        id v8 = [v7 momentNodes];
        uint64_t v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
        v22[0] = v9;
        unint64_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
        v22[1] = v10;
        id v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
        v22[2] = v11;
        double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];

        double v13 = [v8 sortedArrayUsingDescriptors:v12];
        [v16 addObject:v13];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v16;
}

- (PGGraphLocationCountryNodeCollection)supersetCountryNodes
{
  [(PGGraph *)self _checkCanRead];
  p_supersetLocuint64_t k = &self->_supersetLock;
  os_unfair_lock_lock(&self->_supersetLock);
  supersetCountryNodes = self->_supersetCountryNodes;
  if (!supersetCountryNodes)
  {
    uint64_t v5 = +[PGGraphNodeCollection nodesInGraph:self];
    os_signpost_id_t v6 = [v5 addressNodes];
    double v7 = [v6 countryNodes];
    id v8 = self->_supersetCountryNodes;
    self->_supersetCountryNodes = v7;

    supersetCountryNodes = self->_supersetCountryNodes;
  }
  uint64_t v9 = supersetCountryNodes;
  os_unfair_lock_unlock(p_supersetLock);
  return v9;
}

- (PGGraphLocationStateNodeCollection)supersetStateNodes
{
  [(PGGraph *)self _checkCanRead];
  p_supersetLocuint64_t k = &self->_supersetLock;
  os_unfair_lock_lock(&self->_supersetLock);
  supersetStateNodes = self->_supersetStateNodes;
  if (!supersetStateNodes)
  {
    uint64_t v5 = +[PGGraphNodeCollection nodesInGraph:self];
    os_signpost_id_t v6 = [v5 addressNodes];
    double v7 = [v6 stateNodes];
    id v8 = self->_supersetStateNodes;
    self->_supersetStateNodes = v7;

    supersetStateNodes = self->_supersetStateNodes;
  }
  uint64_t v9 = supersetStateNodes;
  os_unfair_lock_unlock(p_supersetLock);
  return v9;
}

- (PGGraphLocationCountyNodeCollection)supersetCountyNodes
{
  [(PGGraph *)self _checkCanRead];
  p_supersetLocuint64_t k = &self->_supersetLock;
  os_unfair_lock_lock(&self->_supersetLock);
  supersetCountyNodes = self->_supersetCountyNodes;
  if (!supersetCountyNodes)
  {
    uint64_t v5 = +[PGGraphNodeCollection nodesInGraph:self];
    os_signpost_id_t v6 = [v5 addressNodes];
    double v7 = [v6 countyNodes];
    id v8 = self->_supersetCountyNodes;
    self->_supersetCountyNodes = v7;

    supersetCountyNodes = self->_supersetCountyNodes;
  }
  uint64_t v9 = supersetCountyNodes;
  os_unfair_lock_unlock(p_supersetLock);
  return v9;
}

- (PGGraphLocationCityNodeCollection)supersetCityNodes
{
  [(PGGraph *)self _checkCanRead];
  p_supersetLocuint64_t k = &self->_supersetLock;
  os_unfair_lock_lock(&self->_supersetLock);
  supersetCityNodes = self->_supersetCityNodes;
  if (!supersetCityNodes)
  {
    uint64_t v5 = +[PGGraphNodeCollection nodesInGraph:self];
    os_signpost_id_t v6 = [v5 addressNodes];
    double v7 = [v6 cityNodes];
    id v8 = self->_supersetCityNodes;
    self->_supersetCityNodes = v7;

    supersetCityNodes = self->_supersetCityNodes;
  }
  uint64_t v9 = supersetCityNodes;
  os_unfair_lock_unlock(p_supersetLock);
  return v9;
}

- (NSSet)supersets
{
  [(PGGraph *)self _checkCanRead];
  uint64_t v3 = +[PGGraphNodeCollection nodesInGraph:self];
  uint64_t v4 = [v3 temporarySet];

  return (NSSet *)v4;
}

- (BOOL)isSocialGroupEligible:(unint64_t)a3 longevity:(float)a4
{
  return a4 >= 0.083333 && a3 > 4;
}

- (BOOL)singlePersonBelongsToSocialGroupOfMaxSize:(id)a3 groups:(id)a4 maxSize:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = [a3 objectForKeyedSubscript:@"personNodes"];
  unint64_t v10 = [v8 setWithArray:v9];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (void *)MEMORY[0x1E4F1CAD0];
        long long v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "objectForKeyedSubscript:", @"personNodes", (void)v21);
        long long v18 = [v16 setWithArray:v17];

        if ([v18 count] <= a5 && objc_msgSend(v10, "isSubsetOfSet:", v18))
        {

          BOOL v19 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 0;
LABEL_12:

  return v19;
}

- (BOOL)singlePersonGroupIsInSocialGroups:(id)a3 groups:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  os_signpost_id_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [a3 objectForKeyedSubscript:@"personNodes"];
  id v8 = [v6 setWithArray:v7];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "objectForKeyedSubscript:", @"personNodes", (void)v19);
        id v16 = [v14 setWithArray:v15];

        LOBYTE(v15) = [v16 isEqualToSet:v8];
        if (v15)
        {
          BOOL v17 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 0;
LABEL_11:

  return v17;
}

- (double)longevity:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_358];
    double v5 = 0.0;
    if ((unint64_t)[v4 count] >= 2)
    {
      os_signpost_id_t v6 = [v4 objectAtIndexedSubscript:0];
      id v7 = [v6 universalStartDate];
      [v7 timeIntervalSince1970];
      double v9 = v8;
      uint64_t v10 = [v4 lastObject];
      uint64_t v11 = [v10 universalStartDate];
      [v11 timeIntervalSince1970];
      double v5 = v9 - v12;
    }
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

uint64_t __33__PGGraph_Processing__longevity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  double v5 = [a3 universalStartDate];
  os_signpost_id_t v6 = [v4 universalEndDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (float)recencyFeature:(double)a3
{
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  double v8 = [v7 dateByAddingTimeInterval:-157680000.0];

  [v8 timeIntervalSince1970];
  *(float *)&a3 = (a3 - v9) / (v6 - v9);

  return *(float *)&a3;
}

- (double)averageTopMomentTimes:(id)a3 numberOfMoments:(unint64_t)a4
{
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = [v6 dateByAddingTimeInterval:-315360000.0];

  [v7 timeIntervalSince1970];
  double v9 = v8;
  uint64_t v10 = [v5 sortedArrayUsingComparator:&__block_literal_global_356];
  unint64_t v11 = [v5 count];
  if (v11 >= a4) {
    unint64_t v12 = a4;
  }
  else {
    unint64_t v12 = v11;
  }
  if (v12)
  {
    uint64_t v13 = 0;
    double v14 = 0.0;
    do
    {
      uint64_t v15 = [v10 objectAtIndexedSubscript:v13];
      id v16 = [v15 universalStartDate];
      [v16 timeIntervalSince1970];
      double v14 = v14 + v17;

      ++v13;
    }
    while (v12 != v13);
    double v18 = v14 / (double)v12;
  }
  else
  {
    double v18 = 0.0;
  }
  if (v18 >= v9) {
    double v9 = v18;
  }

  return v9;
}

uint64_t __61__PGGraph_Processing__averageTopMomentTimes_numberOfMoments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 universalStartDate];
  double v6 = [v4 universalEndDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (float)normalizeFeatureValue:(float)a3 average:(float)a4 featureValues:(id)a5 factor:(float)a6
{
  id v9 = a5;
  if ([v9 count])
  {
    uint64_t v10 = [v9 lastObject];
    [v10 floatValue];
    float v12 = v11;

    float v13 = -1.0;
    if (v12 <= a3)
    {
      double v14 = [v9 objectAtIndexedSubscript:0];
      [v14 floatValue];
      float v16 = v15;

      float v13 = 1.0;
      if (v16 >= a3)
      {
        if (a3 < a4)
        {
          double v17 = [v9 lastObject];
          [v17 floatValue];
          float v19 = a4;
LABEL_9:
          float v13 = (float)((float)(a3 - a4) / (float)(v19 - v18)) * a6;

          goto LABEL_10;
        }
        long long v20 = [v9 objectAtIndexedSubscript:0];
        [v20 floatValue];
        float v22 = v21;

        float v13 = 0.0;
        if (v22 != a4)
        {
          double v17 = [v9 objectAtIndexedSubscript:0];
          [v17 floatValue];
          float v19 = v23;
          float v18 = a4;
          goto LABEL_9;
        }
      }
    }
  }
  else
  {
    float v13 = -0.1;
  }
LABEL_10:

  return v13;
}

- (void)enumerateSocialGroupsIncludingMeNode:(BOOL)a3 socialGroupsVersion:(unint64_t)a4 simulateMeNodeNotSet:(BOOL)a5 validGroupsBlock:(id)a6 invalidGroupsBlock:(id)a7 averageWeight:(float *)a8
{
  BOOL v10 = a3;
  uint64_t v387 = *MEMORY[0x1E4F143B8];
  long long v301 = (char *)a6;
  id v11 = a7;
  float v12 = os_log_create("com.apple.PhotosGraph", "graph");
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  double v14 = v12;
  float v15 = v14;
  os_signpost_id_t spid = v13;
  unint64_t v279 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SocialGroupsV2", "", buf, 2u);
  }
  long long v289 = v15;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v277 = mach_absolute_time();
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a5)
  {
    double v17 = [(MAElementCollection *)[PGGraphMeNodeCollection alloc] initWithGraph:self];
  }
  else
  {
    double v17 = [(PGGraph *)self meNodeCollection];
  }
  long long v288 = v17;

  float v18 = [(PGGraphPersonNodeCollection *)v288 momentNodes];
  uint64_t v360 = 0;
  v361 = (float *)&v360;
  uint64_t v362 = 0x2020000000;
  int v363 = 0;
  uint64_t v356 = 0;
  v357 = (float *)&v356;
  uint64_t v358 = 0x2020000000;
  int v359 = 0;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v352 = 0;
  uint64_t v353 = &v352;
  uint64_t v354 = 0x2020000000;
  uint64_t v355 = 0;
  id v351 = 0;
  v340[0] = MEMORY[0x1E4F143A8];
  v340[1] = 3221225472;
  v340[2] = __151__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_socialGroupsVersion_simulateMeNodeNotSet_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke;
  v340[3] = &unk_1E68EC530;
  id v347 = &v352;
  id v348 = &v360;
  id v349 = &v356;
  unint64_t v350 = a4;
  id v286 = v19;
  id v341 = v286;
  id v285 = v20;
  id v342 = v285;
  id v283 = v21;
  id v343 = v283;
  id v282 = v18;
  id v344 = v282;
  id v300 = (char *)v11;
  v346 = v300;
  id v287 = v16;
  id v345 = v287;
  [(PGGraph *)self enumeratePeopleClustersIncludingMeNode:v10 socialGroupsVersion:a4 singlePersonGroups:&v351 withBlock:v340];
  id v281 = v351;
  long long v284 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:");
  if (v353[3])
  {
    float v22 = MEMORY[0x1E4F14500];
    id v23 = MEMORY[0x1E4F14500];
    os_signpost_id_t v24 = os_signpost_id_generate(v22);
    id v25 = v22;
    os_signpost_id_t v275 = v24;
    unint64_t v276 = v24 - 1;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v24, "CandidatesValidation", "", buf, 2u);
    }

    mach_timebase_info v339 = 0;
    mach_timebase_info(&v339);
    uint64_t v274 = mach_absolute_time();
    v361[6] = v361[6] / (float)(unint64_t)v353[3];
    id v314 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v313 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a4 == 1)
    {
      uint64_t v26 = [v286 sortedArrayUsingComparator:&__block_literal_global_343];
      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:v26];
      [v27 mean];
      float v29 = v28;
      [v27 standardDeviation];
      float v31 = v30;
      long long v337 = 0u;
      long long v338 = 0u;
      long long v335 = 0u;
      long long v336 = 0u;
      id v32 = v26;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v335 objects:v382 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v336;
        float v35 = v29 - v31;
        float v36 = v29 + v31;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v336 != v34) {
              objc_enumerationMutation(v32);
            }
            double v38 = *(void **)(*((void *)&v335 + 1) + 8 * i);
            objc_msgSend(v38, "floatValue", v274);
            if (v39 >= v35)
            {
              [v38 floatValue];
              if (v40 <= v36) {
                [v314 addObject:v38];
              }
            }
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v335 objects:v382 count:16];
        }
        while (v33);
      }

      id v41 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:v314];
      [v41 mean];
      int v306 = v42;
      long long v43 = [v285 sortedArrayUsingComparator:&__block_literal_global_346];
      long long v44 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:v43];
      [v44 mean];
      float v46 = v45;
      [v44 standardDeviation];
      float v48 = v47;
      long long v333 = 0u;
      long long v334 = 0u;
      long long v331 = 0u;
      long long v332 = 0u;
      id v49 = v43;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v331 objects:v381 count:16];
      if (v50)
      {
        uint64_t v51 = *(void *)v332;
        double v52 = (float)(v46 - v48);
        double v53 = (float)(v46 + v48);
        do
        {
          for (uint64_t j = 0; j != v50; ++j)
          {
            if (*(void *)v332 != v51) {
              objc_enumerationMutation(v49);
            }
            double v55 = *(void **)(*((void *)&v331 + 1) + 8 * j);
            objc_msgSend(v55, "doubleValue", v274);
            if (v56 >= v52)
            {
              [v55 doubleValue];
              if (v57 <= v53) {
                [v313 addObject:v55];
              }
            }
          }
          uint64_t v50 = [v49 countByEnumeratingWithState:&v331 objects:v381 count:16];
        }
        while (v50);
      }

      uint64_t v58 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:v313];
      [v58 mean];
      unsigned int v305 = v59;
      unint64_t v60 = v353[3];
      if (v60 <= 0x4F)
      {
        float v291 = (float)((float)((float)v60 / 80.0) * 0.48) + -0.65;
        unint64_t v61 = vcvtps_u32_f32((float)((float)v60 * 0.15) + 6.0);
        if (v61 <= 7) {
          unint64_t v61 = 7;
        }
        unint64_t v292 = v61;
      }
      else
      {
        unint64_t v292 = 18;
        float v291 = -0.17;
      }
    }
    else
    {
      unint64_t v292 = 0;
      unsigned int v305 = 0;
      int v306 = 0;
      float v291 = 0.0;
    }
    id v304 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v294 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v290 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v295 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v298 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v293 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v329 = 0u;
    long long v330 = 0u;
    long long v327 = 0u;
    long long v328 = 0u;
    id obj = v287;
    uint64_t v62 = [obj countByEnumeratingWithState:&v327 objects:v380 count:16];
    if (v62)
    {
      id v307 = *(id *)v328;
      do
      {
        uint64_t v63 = 0;
        uint64_t v311 = v62;
        do
        {
          if (*(id *)v328 != v307) {
            objc_enumerationMutation(obj);
          }
          double v64 = *(void **)(*((void *)&v327 + 1) + 8 * v63);
          context = (void *)MEMORY[0x1D25FED50]();
          double v65 = [v64 objectForKeyedSubscript:@"isSubset"];
          char v66 = [v65 BOOLValue];

          id v67 = [v64 objectForKeyedSubscript:@"personNodes"];
          id v68 = [v64 objectForKeyedSubscript:@"peopleWeights"];
          uint64_t v69 = [v64 objectForKeyedSubscript:@"momentNodes"];
          id v70 = [v64 objectForKeyedSubscript:@"frequency"];
          [v70 floatValue];
          float v72 = v71;

          double v73 = [v64 objectForKeyedSubscript:@"longevity"];
          [v73 floatValue];
          int v75 = v74;

          id v76 = v67;
          id v77 = v68;
          id v78 = v69;
          unint64_t v79 = 0;
          double v80 = 0.0;
          while (v79 < objc_msgSend(v76, "count", v274))
          {
            id v81 = [v76 objectAtIndexedSubscript:v79];
            id v82 = [v77 objectAtIndexedSubscript:v79];
            [v82 doubleValue];
            double v84 = v83;

            unint64_t v85 = [v81 numberOfMomentNodes];
            if (v85)
            {
              unint64_t v86 = [v78 count];
              double v87 = -((double)v86 * v84 - (double)v85);
              if (-((double)v85 - (double)v86 * v84) >= 0.0) {
                double v87 = -((double)v85 - (double)v86 * v84);
              }
              double v88 = v87 / (double)v85;
            }
            else
            {
              double v88 = 0.0;
            }

            double v80 = v80 + v88;
            ++v79;
          }
          unint64_t v89 = [v76 count];

          double v90 = 1.0 - v80 / (double)v89;
          float v91 = v72 / v357[6];
          if (a4 == 1)
          {
            *(float *)&double v92 = (float)(unint64_t)[v78 count];
            LODWORD(v93) = v306;
            LODWORD(v94) = 1060320051;
            [(PGGraph *)self normalizeFeatureValue:v314 average:v92 featureValues:v93 factor:v94];
            float v96 = v95;
            LODWORD(v97) = v75;
            LODWORD(v98) = v305;
            LODWORD(v99) = 1060320051;
            [(PGGraph *)self normalizeFeatureValue:v313 average:v97 featureValues:v98 factor:v99];
            float v101 = v100;
            [(PGGraph *)self averageTopMomentTimes:v78 numberOfMoments:5];
            -[PGGraph recencyFeature:](self, "recencyFeature:");
            float v103 = v102;
            id v104 = v77;
            long long v365 = 0u;
            long long v366 = 0u;
            long long v367 = 0u;
            long long v368 = 0u;
            id v105 = v104;
            uint64_t v106 = [v105 countByEnumeratingWithState:&v365 objects:buf count:16];
            if (v106)
            {
              uint64_t v107 = *(void *)v366;
              double v108 = 0.0;
              do
              {
                for (uint64_t k = 0; k != v106; ++k)
                {
                  if (*(void *)v366 != v107) {
                    objc_enumerationMutation(v105);
                  }
                  [*(id *)(*((void *)&v365 + 1) + 8 * k) doubleValue];
                  double v108 = v108 + v110;
                }
                uint64_t v106 = [v105 countByEnumeratingWithState:&v365 objects:buf count:16];
              }
              while (v106);
            }
            else
            {
              double v108 = 0.0;
            }

            unint64_t v115 = [v105 count];
            double v116 = v108 / (double)v115 + -0.5 + v108 / (double)v115 + -0.5;
            *(float *)&double v116 = v116;
            *(float *)&double v116 = (float)((float)((float)(v96 + (float)(v103 * 0.0)) + (float)(v101 * 0.0))
                                    + (float)(*(float *)&v116 * 0.0))
                            + 0.0;
            if (*(float *)&v116 < 1.0) {
              float v117 = *(float *)&v116;
            }
            else {
              float v117 = 1.0;
            }
            v378[0] = @"personNodes";
            v378[1] = @"peopleWeights";
            v379[0] = v76;
            v379[1] = v105;
            v379[2] = v78;
            v378[2] = @"momentNodes";
            v378[3] = @"socialGroupWeight";
            *(float *)&double v116 = v91;
            v118 = [NSNumber numberWithFloat:v116];
            v379[3] = v118;
            v378[4] = @"groupCohesionScore";
            double v119 = [NSNumber numberWithDouble:v90];
            v379[4] = v119;
            v378[5] = @"recencyFeature";
            *(float *)&double v120 = v103;
            id v121 = [NSNumber numberWithFloat:v120];
            v379[5] = v121;
            v378[6] = @"longevity";
            LODWORD(v122) = v75;
            uint64_t v123 = [NSNumber numberWithFloat:v122];
            v379[6] = v123;
            v378[7] = @"ranking";
            *(float *)&double v124 = v117;
            uint64_t v125 = [NSNumber numberWithFloat:v124];
            v379[7] = v125;
            uint64_t v126 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v379 forKeys:v378 count:8];
            [v304 addObject:v126];
          }
          else
          {
            if (v301) {
              char v111 = v66;
            }
            else {
              char v111 = 1;
            }
            if (v111)
            {
              v112 = (void (**)(char *, id, id, id, float, double))(v300 + 16);
              uint64_t v113 = v300;
              if (v300) {
                goto LABEL_75;
              }
            }
            else
            {
              BOOL v114 = v90 >= 0.3 || v72 >= v361[6];
              v112 = (void (**)(char *, id, id, id, float, double))(v301 + 16);
              if (v114)
              {
                uint64_t v113 = v301;
              }
              else
              {
                v112 = (void (**)(char *, id, id, id, float, double))(v300 + 16);
                uint64_t v113 = v300;
              }
              if (v114 || v300) {
LABEL_75:
              }
                (*v112)(v113, v76, v77, v78, v91, v90);
            }
          }

          ++v63;
        }
        while (v63 != v311);
        uint64_t v62 = [obj countByEnumeratingWithState:&v327 objects:v380 count:16];
      }
      while (v62);
    }

    if (a4 == 1)
    {
      long long v299 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"ranking" ascending:0];
      long long v297 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"momentNodes" ascending:0 comparator:&__block_literal_global_348];
      long long v296 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"personNodes" ascending:1 comparator:&__block_literal_global_350];
      v377[0] = v299;
      v377[1] = v297;
      v377[2] = v296;
      uint64_t v127 = [MEMORY[0x1E4F1C978] arrayWithObjects:v377 count:3];
      [v304 sortUsingDescriptors:v127];

      id obja = 0;
      for (unint64_t m = 0; m < objc_msgSend(v304, "count", v274); ++m)
      {
        uint64_t v129 = [v304 objectAtIndexedSubscript:m];
        v130 = [v129 objectForKeyedSubscript:@"momentNodes"];
        v131 = [v129 objectForKeyedSubscript:@"personNodes"];
        v132 = [v129 objectForKeyedSubscript:@"ranking"];
        [v132 floatValue];
        float v134 = v133;

        double v135 = [v129 objectForKeyedSubscript:@"longevity"];
        [v135 floatValue];
        int v137 = v136;

        uint64_t v138 = [v130 count];
        LODWORD(v139) = v137;
        if ([(PGGraph *)self isSocialGroupEligible:v138 longevity:v139])
        {
          if (v134 < v291 || m >= v292)
          {
            [v294 addObject:v129];
          }
          else
          {
            [v290 addObject:v129];
            uint64_t v140 = [v131 count];
            uint64_t v141 = obja;
            if (v140 == 1) {
              uint64_t v141 = obja + 1;
            }
            id obja = v141;
          }
        }
      }
      v376[0] = v299;
      v376[1] = v297;
      v376[2] = v296;
      BOOL v142 = [MEMORY[0x1E4F1C978] arrayWithObjects:v376 count:3];
      [v294 sortUsingDescriptors:v142];

      for (unint64_t n = 0; n < [v294 count]; ++n)
      {
        double v144 = [v294 objectAtIndexedSubscript:n];
        if (n < v292) {
          [v295 addObject:v144];
        }
      }
      id v310 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v325 = 0u;
      long long v326 = 0u;
      long long v323 = 0u;
      long long v324 = 0u;
      id v308 = v284;
      uint64_t v145 = [v308 countByEnumeratingWithState:&v323 objects:v375 count:16];
      if (v145)
      {
        contexta = *(void **)v324;
        do
        {
          for (iuint64_t i = 0; ii != v145; ++ii)
          {
            if (*(void **)v324 != contexta) {
              objc_enumerationMutation(v308);
            }
            uint64_t v147 = *(void **)(*((void *)&v323 + 1) + 8 * ii);
            uint64_t v148 = [v147 objectForKeyedSubscript:@"momentNodes"];
            uint64_t v149 = (void *)MEMORY[0x1E4F1C978];
            uint64_t v150 = [v147 objectForKeyedSubscript:@"personNodes"];
            uint64_t v151 = [v150 allObjects];
            v152 = [v149 arrayWithArray:v151];

            *(float *)&double v153 = (float)(unint64_t)[v148 count];
            LODWORD(v154) = v306;
            LODWORD(v155) = 1060320051;
            [(PGGraph *)self normalizeFeatureValue:v314 average:v153 featureValues:v154 factor:v155];
            float v157 = v156;
            [(PGGraph *)self longevity:v148];
            double v159 = v158 / 31536000.0;
            float v160 = v159;
            *(float *)&double v159 = v160;
            LODWORD(v161) = 1060320051;
            [(PGGraph *)self normalizeFeatureValue:v313 average:v159 featureValues:COERCE_DOUBLE(v305 | 0x417E133800000000) factor:v161];
            float v163 = v162;
            [(PGGraph *)self averageTopMomentTimes:v148 numberOfMoments:5];
            -[PGGraph recencyFeature:](self, "recencyFeature:");
            float v165 = v164;
            id v166 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v167 = [NSNumber numberWithDouble:1.0];
            [v166 addObject:v167];

            id v168 = v166;
            long long v365 = 0u;
            long long v366 = 0u;
            long long v367 = 0u;
            long long v368 = 0u;
            id v169 = v168;
            uint64_t v170 = [v169 countByEnumeratingWithState:&v365 objects:buf count:16];
            if (v170)
            {
              uint64_t v171 = *(void *)v366;
              double v172 = 0.0;
              do
              {
                for (juint64_t j = 0; jj != v170; ++jj)
                {
                  if (*(void *)v366 != v171) {
                    objc_enumerationMutation(v169);
                  }
                  [*(id *)(*((void *)&v365 + 1) + 8 * jj) doubleValue];
                  double v172 = v172 + v174;
                }
                uint64_t v170 = [v169 countByEnumeratingWithState:&v365 objects:buf count:16];
              }
              while (v170);
            }
            else
            {
              double v172 = 0.0;
            }

            unint64_t v175 = [v169 count];
            if ((float)((float)(v157 + (float)(v165 * 0.0)) + (float)(v163 * 0.0))
               + (v172 / (double)v175 + -0.5 + v172 / (double)v175 + -0.5) * 0.0
               + 0.0 < 1.0)
              double v176 = (float)((float)(v157 + (float)(v165 * 0.0)) + (float)(v163 * 0.0))
                   + (v172 / (double)v175 + -0.5 + v172 / (double)v175 + -0.5) * 0.0
                   + 0.0;
            else {
              double v176 = 1.0;
            }
            id v177 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v177 setObject:v148 forKeyedSubscript:@"momentNodes"];
            [v177 setObject:v152 forKeyedSubscript:@"personNodes"];
            uint64_t v178 = [NSNumber numberWithDouble:v176];
            [v177 setObject:v178 forKeyedSubscript:@"socialGroupWeight"];

            [v177 setObject:v169 forKeyedSubscript:@"peopleWeights"];
            uint64_t v179 = [NSNumber numberWithDouble:1.0];
            [v177 setObject:v179 forKeyedSubscript:@"groupCohesionScore"];

            *(float *)&double v180 = v160;
            v181 = [NSNumber numberWithFloat:v180];
            [v177 setObject:v181 forKeyedSubscript:@"longevity"];

            *(float *)&double v182 = v165;
            unint64_t v183 = [NSNumber numberWithFloat:v182];
            [v177 setObject:v183 forKeyedSubscript:@"recencyFeature"];

            v184 = [NSNumber numberWithDouble:v176];
            [v177 setObject:v184 forKeyedSubscript:@"ranking"];

            uint64_t v185 = [v148 count];
            *(float *)&double v186 = v160;
            if ([(PGGraph *)self isSocialGroupEligible:v185 longevity:v186]) {
              [v310 addObject:v177];
            }
          }
          uint64_t v145 = [v308 countByEnumeratingWithState:&v323 objects:v375 count:16];
        }
        while (v145);
      }

      uint64_t v187 = [v310 count];
      unint64_t v188 = 0x1E4F1C000;
      if (v187)
      {
        v374[0] = v299;
        v374[1] = v297;
        uint64_t v189 = [MEMORY[0x1E4F1C978] arrayWithObjects:v374 count:2];
        [v310 sortUsingDescriptors:v189];

        unint64_t v188 = 0x1E4F1C000uLL;
      }
      id contextb = objc_alloc_init(*(Class *)(v188 + 2632));
      uint64_t v190 = 0;
      unint64_t v191 = 0;
      unint64_t v192 = vcvtps_u32_f32((float)(unint64_t)[v290 count] / 3.0);
      if (v192 <= 3) {
        unint64_t v192 = 3;
      }
      BOOL v194 = v192 < 4 && v292 < 8;
      unint64_t v195 = v192 + 1;
      while (v191 < [v310 count])
      {
        v196 = [v310 objectAtIndexedSubscript:v191];
        BOOL v197 = [v196 objectForKeyedSubscript:@"ranking"];
        [v197 floatValue];
        float v199 = v198;

        uint64_t v200 = [v310 objectAtIndexedSubscript:v191];
        if ([(PGGraph *)self singlePersonGroupIsInSocialGroups:v200 groups:v290])
        {
        }
        else if (v199 >= -0.65)
        {
          uint64_t v202 = [v310 objectAtIndexedSubscript:v191];
          BOOL v203 = [(PGGraph *)self singlePersonBelongsToSocialGroupOfMaxSize:v202 groups:v290 maxSize:2];

          if (v203 && !v194)
          {
LABEL_140:
            uint64_t v204 = [v310 objectAtIndexedSubscript:v191];
            BOOL v205 = [(PGGraph *)self singlePersonGroupIsInSocialGroups:v204 groups:v293];

            if (!v205)
            {
              uint64_t v206 = [v310 objectAtIndexedSubscript:v191];
              [v293 addObject:v206];
            }
            goto LABEL_137;
          }
        }
        else
        {

          if (!v194) {
            goto LABEL_140;
          }
        }
        id v201 = [v310 objectAtIndexedSubscript:v191];
        [contextb addObject:v201];

        ++v190;
LABEL_137:
        ++v191;
        if (v190 == v195) {
          break;
        }
      }
      long long v312 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"recencyFeature" ascending:0];
      v373[0] = v312;
      v373[1] = v299;
      v373[2] = v297;
      id v207 = [MEMORY[0x1E4F1C978] arrayWithObjects:v373 count:3];
      [contextb sortUsingDescriptors:v207];

      uint64_t v208 = [contextb count];
      unint64_t v209 = v208;
      if (v208)
      {
        unint64_t v210 = 0;
        uint64_t v211 = 0;
        unint64_t v212 = v208 - 1;
        do
        {
          if (v209 < 4 || v210 < v212)
          {
            id v216 = [contextb objectAtIndexedSubscript:v210];
            [v298 addObject:v216];

            ++v211;
          }
          else
          {
            uint64_t v213 = [contextb objectAtIndexedSubscript:v210];
            BOOL v214 = [(PGGraph *)self singlePersonGroupIsInSocialGroups:v213 groups:v293];

            if (!v214)
            {
              v215 = [contextb objectAtIndexedSubscript:v210];
              [v293 addObject:v215];
            }
          }
          ++v210;
        }
        while (v209 != v210);
      }
      else
      {
        uint64_t v211 = 0;
      }
      uint64_t v217 = [v298 count];
      long long v321 = 0u;
      long long v322 = 0u;
      long long v319 = 0u;
      long long v320 = 0u;
      id v218 = v290;
      uint64_t v219 = [v218 countByEnumeratingWithState:&v319 objects:v372 count:16];
      if (v219)
      {
        unint64_t v220 = 0;
        uint64_t v221 = *(void *)v320;
        do
        {
          for (kuint64_t k = 0; kk != v219; ++kk)
          {
            if (*(void *)v320 != v221) {
              objc_enumerationMutation(v218);
            }
            BOOL v223 = *(void **)(*((void *)&v319 + 1) + 8 * kk);
            uint64_t v224 = [v223 objectForKeyedSubscript:@"personNodes"];
            if ((unint64_t)[v224 count] >= 2)
            {
              if (v220 < v292 - v217)
              {
                [v298 addObject:v223];
                ++v220;
                goto LABEL_163;
              }
LABEL_162:
              [v295 addObject:v223];
              goto LABEL_163;
            }
            if ([v224 count] == 1
              && ![(PGGraph *)self singlePersonGroupIsInSocialGroups:v223 groups:v298])
            {
              goto LABEL_162;
            }
LABEL_163:
          }
          uint64_t v219 = [v218 countByEnumeratingWithState:&v319 objects:v372 count:16];
        }
        while (v219);
      }

      v371[0] = v299;
      v371[1] = v297;
      v371[2] = v296;
      uint64_t v225 = [MEMORY[0x1E4F1C978] arrayWithObjects:v371 count:3];
      [v295 sortUsingDescriptors:v225];

      uint64_t v226 = 0;
      unint64_t v227 = 0;
      id v228 = &obja[-v211];
      while (v227 < [v295 count])
      {
        uint64_t v229 = [v295 objectAtIndexedSubscript:v227];
        uint64_t v230 = [v229 objectForKeyedSubscript:@"personNodes"];
        v231 = [v229 objectForKeyedSubscript:@"momentNodes"];
        id v232 = [v229 objectForKeyedSubscript:@"ranking"];
        [v232 floatValue];
        float v234 = v233;

        id v235 = [v229 objectForKeyedSubscript:@"longevity"];
        [v235 floatValue];
        int v237 = v236;

        if ((unint64_t)[v230 count] >= 2
          && v226 < (uint64_t)v228
          && v234 >= v291
          && (uint64_t v238 = [v231 count],
              LODWORD(v239) = v237,
              [(PGGraph *)self isSocialGroupEligible:v238 longevity:v239]))
        {
          [v298 addObject:v229];
          ++v226;
        }
        else if ((unint64_t)[v230 count] > 1 {
               || ![(PGGraph *)self singlePersonGroupIsInSocialGroups:v229 groups:v293])
        }
        {
          [v293 addObject:v229];
        }

        ++v227;
      }
      v370[0] = v312;
      v370[1] = v299;
      id v240 = [MEMORY[0x1E4F1C978] arrayWithObjects:v370 count:2];
      [v298 sortUsingDescriptors:v240];

      v369[0] = v312;
      v369[1] = v299;
      id v241 = [MEMORY[0x1E4F1C978] arrayWithObjects:v369 count:2];
      [v293 sortUsingDescriptors:v241];

      if (v301)
      {
        for (unint64_t mm = 0; mm < [v298 count]; ++mm)
        {
          id v243 = [v298 objectAtIndexedSubscript:mm];
          uint64_t v244 = [v243 objectForKeyedSubscript:@"recencyFeature"];
          [v244 floatValue];
          float v246 = v245;

          id v247 = [v243 objectForKeyedSubscript:@"personNodes"];
          unint64_t v248 = [v243 objectForKeyedSubscript:@"peopleWeights"];
          id v249 = [v243 objectForKeyedSubscript:@"momentNodes"];
          id v250 = [v243 objectForKeyedSubscript:@"groupCohesionScore"];
          [v250 floatValue];
          (*((void (**)(char *, void *, void *, void *, float, double))v301 + 2))(v301, v247, v248, v249, v246, v251);
        }
      }
      if (v300)
      {
        for (nunint64_t n = 0; nn < [v293 count]; ++nn)
        {
          id v253 = [v293 objectAtIndexedSubscript:nn];
          id v254 = [v253 objectForKeyedSubscript:@"recencyFeature"];
          [v254 floatValue];
          float v256 = v255;

          v257 = [v253 objectForKeyedSubscript:@"personNodes"];
          long long v258 = [v253 objectForKeyedSubscript:@"peopleWeights"];
          long long v259 = [v253 objectForKeyedSubscript:@"momentNodes"];
          long long v260 = [v253 objectForKeyedSubscript:@"groupCohesionScore"];
          [v260 floatValue];
          (*((void (**)(char *, void *, void *, void *, float, double))v300 + 2))(v300, v257, v258, v259, v256, v261);
        }
      }
    }
    uint64_t v262 = mach_absolute_time();
    uint32_t numer = v339.numer;
    denounint64_t m = v339.denom;
    id v265 = MEMORY[0x1E4F14500];
    if (v276 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, v275, "CandidatesValidation", "", buf, 2u);
    }

    long long v266 = MEMORY[0x1E4F14500];
    id v267 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v266, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      v384 = "CandidatesValidation";
      __int16 v385 = 2048;
      double v386 = (float)((float)((float)((float)(v262 - v274) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    uint64_t v268 = mach_absolute_time();
    uint32_t v269 = info.numer;
    uint32_t v270 = info.denom;
    long long v271 = v289;
    long long v272 = v271;
    if (v279 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v271))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v272, OS_SIGNPOST_INTERVAL_END, spid, "SocialGroupsV2", "", buf, 2u);
    }

    long long v273 = v272;
    if (os_log_type_enabled(v273, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      v384 = "SocialGroupsV2";
      __int16 v385 = 2048;
      double v386 = (float)((float)((float)((float)(v268 - v277) * (float)v269) / (float)v270) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v273, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    if (a8) {
      *a8 = v361[6] / v357[6];
    }
  }
  _Block_object_dispose(&v352, 8);

  _Block_object_dispose(&v356, 8);
  _Block_object_dispose(&v360, 8);
}

void __151__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_socialGroupsVersion_simulateMeNodeNotSet_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, float a5, float a6)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  double v14 = v13;
  ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  *(float *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)
                                                             + a5;
  uint64_t v15 = *(void *)(*(void *)(a1 + 96) + 8);
  if (*(float *)(v15 + 24) == 0.0) {
    *(float *)(v15 + 24) = a5;
  }
  uint64_t v16 = *(void *)(a1 + 104);
  if (v16 == 1)
  {
    double v17 = *(void **)(a1 + 32);
    float v18 = NSNumber;
    *(float *)&double v19 = (float)(unint64_t)[v13 count];
    id v20 = [v18 numberWithFloat:v19];
    [v17 addObject:v20];

    id v21 = *(void **)(a1 + 40);
    *(float *)&double v22 = a6;
    id v23 = [NSNumber numberWithFloat:v22];
    [v21 addObject:v23];

    uint64_t v16 = *(void *)(a1 + 104);
  }
  if (v16)
  {
    if (![v11 count]) {
      goto LABEL_38;
    }
    goto LABEL_35;
  }
  id v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v26 = *(id *)(a1 + 48);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v48 != v29) {
          objc_enumerationMutation(v26);
        }
        if ([v25 isSubsetOfSet:*(void *)(*((void *)&v47 + 1) + 8 * i)])
        {

          int v31 = 1;
          goto LABEL_18;
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v47 objects:v54 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }

  [*(id *)(a1 + 48) addObject:v25];
  int v31 = 0;
LABEL_18:

  if (*(void *)(a1 + 104) || [v11 count] != 1)
  {
LABEL_31:
    if ([v11 count])
    {
      if (!v31)
      {
LABEL_35:
        uint64_t v37 = 0;
        goto LABEL_36;
      }
      if (*(void *)(a1 + 72))
      {
        uint64_t v37 = 1;
LABEL_36:
        double v38 = *(void **)(a1 + 64);
        v51[0] = @"personNodes";
        v51[1] = @"peopleWeights";
        v52[0] = v11;
        v52[1] = v12;
        v52[2] = v14;
        v51[2] = @"momentNodes";
        v51[3] = @"frequency";
        *(float *)&double v24 = a5;
        id v32 = [NSNumber numberWithFloat:v24];
        v52[3] = v32;
        v51[4] = @"longevity";
        *(float *)&double v39 = a6;
        float v40 = [NSNumber numberWithFloat:v39];
        v52[4] = v40;
        v51[5] = @"isSubset";
        id v41 = [NSNumber numberWithBool:v37];
        v52[5] = v41;
        int v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:6];
        [v38 addObject:v42];

LABEL_37:
      }
    }
  }
  else if ([*(id *)(a1 + 56) count])
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v32 = v14;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v44;
      while (2)
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v44 != v35) {
            objc_enumerationMutation(v32);
          }
          if (objc_msgSend(*(id *)(a1 + 56), "containsNode:", *(void *)(*((void *)&v43 + 1) + 8 * j), (void)v43))
          {

            goto LABEL_31;
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v53 count:16];
        if (v34) {
          continue;
        }
        break;
      }
    }
    goto LABEL_37;
  }
LABEL_38:
}

uint64_t __151__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_socialGroupsVersion_simulateMeNodeNotSet_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 >= [v5 count])
  {
    unint64_t v8 = [v4 count];
    if (v8 <= [v5 count]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __151__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_socialGroupsVersion_simulateMeNodeNotSet_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 >= [v5 count])
  {
    unint64_t v8 = [v4 count];
    uint64_t v7 = v8 > [v5 count];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

uint64_t __151__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_socialGroupsVersion_simulateMeNodeNotSet_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __151__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_socialGroupsVersion_simulateMeNodeNotSet_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_341(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (void)enumerateSocialGroupsIncludingMeNode:(BOOL)a3 validGroupsBlock:(id)a4 invalidGroupsBlock:(id)a5 averageWeight:(float *)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v14 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __110__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke;
  v15[3] = &unk_1E68EC4E0;
  id v16 = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __110__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_2;
  v13[3] = &unk_1E68EC4E0;
  id v11 = v14;
  id v12 = v10;
  [(PGGraph *)self enumerateSocialGroupsIncludingMeNode:v8 socialGroupsVersion:0 simulateMeNodeNotSet:0 validGroupsBlock:v15 invalidGroupsBlock:v13 averageWeight:a6];
}

uint64_t __110__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __110__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateSocialGroupsWithBlock:(id)a3 includeInvalidGroups:(BOOL)a4
{
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __75__PGGraph_Processing__enumerateSocialGroupsWithBlock_includeInvalidGroups___block_invoke;
  v11[3] = &unk_1E68EC4E0;
  id v12 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__PGGraph_Processing__enumerateSocialGroupsWithBlock_includeInvalidGroups___block_invoke_2;
  v8[3] = &unk_1E68EC508;
  BOOL v10 = a4;
  id v9 = v12;
  id v7 = v12;
  [(PGGraph *)self enumerateSocialGroupsIncludingMeNode:0 socialGroupsVersion:1 simulateMeNodeNotSet:0 validGroupsBlock:v11 invalidGroupsBlock:v8 averageWeight:0];
}

uint64_t __75__PGGraph_Processing__enumerateSocialGroupsWithBlock_includeInvalidGroups___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__PGGraph_Processing__enumerateSocialGroupsWithBlock_includeInvalidGroups___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (id)relevantMomentNodesForSocialGroupProcessing
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(PGGraph *)self meNodeCollection];
  if (-[PGGraph isSharedLibraryEnabled](self, "isSharedLibraryEnabled") && [v3 count])
  {
    uint64_t v4 = [v3 momentNodesWithPresence];
  }
  else
  {
    uint64_t v4 = [(PGGraph *)self momentNodes];
  }
  id v5 = (void *)v4;
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  id v7 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalEndDate", 1, v6);
  v12[1] = v7;
  BOOL v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  v12[2] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];

  BOOL v10 = [v5 sortedArrayUsingDescriptors:v9];

  return v10;
}

- (double)momentsCountDistance:(id)a3 withSecondBaseGroup:(id)a4 withSubsetBias:(double)a5 withDistanceThreshold:(double)a6 withIntersectionBias:(double)a7 withKey:(id)a8
{
  id v13 = a8;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v14 objectForKeyedSubscript:@"personNodes"];
  double v17 = [v15 objectForKeyedSubscript:@"personNodes"];
  float v18 = [MEMORY[0x1E4F1CA80] setWithSet:v16];
  [v18 intersectSet:v17];
  double v19 = [v14 objectForKeyedSubscript:v13];

  id v20 = [v15 objectForKeyedSubscript:v13];

  unint64_t v21 = [v19 count];
  unint64_t v22 = [v20 count];
  if (([v16 isSubsetOfSet:v17] & 1) != 0 || objc_msgSend(v17, "isSubsetOfSet:", v16))
  {
    int v23 = [v16 isSubsetOfSet:v17];
    double v24 = (double)v21 + (double)v22;
    double v25 = (double)v22 / v24 + a5;
    if (v23) {
      double v25 = (double)v21 / v24 + a5;
    }
  }
  else
  {
    unint64_t v26 = v22 - v21;
    if (v21 >= v22) {
      unint64_t v26 = v21 - v22;
    }
    if (v21 <= v22) {
      unint64_t v27 = v22;
    }
    else {
      unint64_t v27 = v21;
    }
    double v25 = a6 - a7 + (double)v26 / (double)v27;
  }
  double v28 = v25 - a6;

  return v28;
}

- (double)peopleDistance:(id)a3 withSecondBaseGroup:(id)a4 threshold:(double)a5 factor:(double)a6
{
  id v9 = a3;
  BOOL v10 = [a4 objectForKeyedSubscript:@"personNodes"];
  id v11 = [v9 objectForKeyedSubscript:@"personNodes"];

  id v12 = [MEMORY[0x1E4F1CA80] setWithSet:v10];
  [v12 intersectSet:v11];
  unint64_t v13 = [v10 count];
  unint64_t v14 = [v11 count];
  unint64_t v15 = [v12 count];
  double v16 = -(a5 - (((double)v14 - (double)v15) / (double)v14 + ((double)v13 - (double)v15) / (double)v13) * a6);

  return v16;
}

- (void)enumeratePeopleClustersWithLinkage:(unint64_t)a3 threshold:(double)a4 includingMeNode:(BOOL)a5 socialGroupsVersion:(unint64_t)a6 singlePersonGroups:(id *)a7 withBlock:(id)a8
{
  BOOL v8 = a5;
  uint64_t v276 = *MEMORY[0x1E4F143B8];
  double v172 = (void (**)(id, id, id, void *, uint8_t *, float, float))a8;
  unint64_t v188 = self;
  [(PGGraph *)self _checkCanRead];
  id v11 = MEMORY[0x1E4F14500];
  id v12 = MEMORY[0x1E4F14500];
  os_signpost_id_t v13 = os_signpost_id_generate(v11);
  unint64_t v14 = v11;
  os_signpost_id_t spid = v13;
  id v204 = (id)(v13 - 1);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v13, "BaseGroupsCreation", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v194 = mach_absolute_time();
  unint64_t v15 = MEMORY[0x1E4F14500];
  id v16 = MEMORY[0x1E4F14500];
  os_signpost_id_t v17 = os_signpost_id_generate(v15);
  float v18 = v15;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v17, "GatherExclusiveMoments", "", buf, 2u);
  }

  mach_timebase_info v253 = 0;
  mach_timebase_info(&v253);
  uint64_t v19 = mach_absolute_time();
  id v196 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v191 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v179 = [(PGGraph *)v188 relevantMomentNodesForSocialGroupProcessing];
  double v176 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithArray:v179 graph:v188];
  *(void *)long long buf = 0;
  id v250 = buf;
  uint64_t v251 = 0x2020000000;
  uint64_t v252 = 0;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v8) {
    +[PGGraphMomentNode personInMoment];
  }
  else {
  unint64_t v175 = +[PGGraphMomentNode personExcludingMeInMoment];
  }
  unint64_t v21 = (void *)MEMORY[0x1E4F71E88];
  unint64_t v22 = self;
  int v23 = [v21 adjacencyWithSources:v176 relation:v175 targetsClass:v22];

  v245[0] = MEMORY[0x1E4F143A8];
  v245[1] = 3221225472;
  v245[2] = __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke;
  v245[3] = &unk_1E68EC490;
  id v170 = v23;
  id v246 = v170;
  id v24 = v20;
  id v247 = v24;
  unint64_t v248 = buf;
  [v179 enumerateObjectsUsingBlock:v245];
  uint64_t v25 = mach_absolute_time();
  uint32_t numer = v253.numer;
  denouint64_t m = v253.denom;
  id v28 = MEMORY[0x1E4F14500];
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)long long v272 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, v17, "GatherExclusiveMoments", "", v272, 2u);
  }

  uint64_t v29 = MEMORY[0x1E4F14500];
  id v30 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long v272 = 136315394;
    long long v273 = "GatherExclusiveMoments";
    __int16 v274 = 2048;
    double v275 = (float)((float)((float)((float)(v25 - v19) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v272, 0x16u);
  }

  long long v243 = 0u;
  long long v244 = 0u;
  long long v241 = 0u;
  long long v242 = 0u;
  id obj = v24;
  unint64_t v31 = 0;
  uint64_t v32 = [obj countByEnumeratingWithState:&v241 objects:v271 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v242;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v242 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = *(void **)(*((void *)&v241 + 1) + 8 * i);
        float v36 = [obj objectForKeyedSubscript:v35];
        uint64_t v37 = v36;
        if (a6 != 1)
        {
          long long v43 = [v35 relationshipEdges];
          id v41 = [v43 labels];

          uint64_t v44 = [v37 count];
          v266[0] = v37;
          v265[0] = @"momentNodes";
          v265[1] = @"personNodes";
          int v42 = [v35 temporarySet];
          v265[2] = @"relationships";
          v266[1] = v42;
          v266[2] = v41;
          long long v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v266 forKeys:v265 count:3];
          [v196 addObject:v45];

          v31 += v44;
          goto LABEL_28;
        }
        if ([v36 count] && objc_msgSend(v35, "count"))
        {
          uint64_t v38 = [v37 count];
          v270[0] = v37;
          v269[0] = @"momentNodes";
          v269[1] = @"personNodes";
          double v39 = [v35 temporarySet];
          v270[1] = v39;
          float v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v270 forKeys:v269 count:2];
          [v196 addObject:v40];

          v31 += v38;
        }
        if ([v35 count] == 1 && objc_msgSend(v37, "count"))
        {
          v268[0] = v37;
          v267[0] = @"momentNodes";
          v267[1] = @"personNodes";
          id v41 = [v35 temporarySet];
          v268[1] = v41;
          int v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v268 forKeys:v267 count:2];
          [v191 addObject:v42];
LABEL_28:
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v241 objects:v271 count:16];
    }
    while (v32);
  }

  uint64_t v46 = mach_absolute_time();
  uint32_t v47 = info.numer;
  uint32_t v48 = info.denom;
  id v49 = MEMORY[0x1E4F14500];
  if ((unint64_t)v204 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)long long v272 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, spid, "BaseGroupsCreation", "", v272, 2u);
  }

  long long v50 = MEMORY[0x1E4F14500];
  id v51 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long v272 = 136315394;
    long long v273 = "BaseGroupsCreation";
    __int16 v274 = 2048;
    double v275 = (float)((float)((float)((float)(v46 - v194) * (float)v47) / (float)v48) / 1000000.0);
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v272, 0x16u);
  }

  if (a7) {
    *a7 = v191;
  }
  double v52 = v50;
  os_signpost_id_t v53 = os_signpost_id_generate(v50);
  double v54 = v50;
  if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)long long v272 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v53, "BaseGroupsClustering", "", v272, 2u);
  }

  mach_timebase_info v240 = 0;
  mach_timebase_info(&v240);
  uint64_t v55 = mach_absolute_time();
  double v174 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"personNodes" ascending:1 comparator:&__block_literal_global_55520];
  id v177 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"momentNodes" ascending:0 comparator:&__block_literal_global_306];
  if (a6 == 1)
  {
    v264[0] = v174;
    v264[1] = v177;
    double v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v264 count:2];
    [v196 sortUsingDescriptors:v56];
  }
  else
  {
    double v56 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"momentNodes" ascending:0 comparator:&__block_literal_global_309];
    v263[0] = v174;
    v263[1] = v56;
    double v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v263 count:2];
    [v196 sortUsingDescriptors:v57];
  }
  id v58 = objc_alloc(MEMORY[0x1E4F8A870]);
  v239[0] = MEMORY[0x1E4F143A8];
  v239[1] = 3221225472;
  v239[2] = __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_4;
  v239[3] = &unk_1E68EC4B8;
  v239[5] = a6;
  v239[4] = v188;
  unsigned int v59 = (void *)[v58 initWithDistanceBlock:v239];
  [v59 setK:1];
  [v59 setLinkage:a3];
  [v59 setThreshold:a4];
  if (a6 == 1)
  {
    if ([v59 linkage] == 5) {
      [v59 setClusterKeyElementBlock:&__block_literal_global_315];
    }
    if ([v59 linkage] == 4) {
      [v59 setClusterConsolidationBlock:&__block_literal_global_318_55521];
    }
  }
  id v169 = v59;
  unint64_t v60 = [v59 performWithDataset:v196 progressBlock:0];
  unint64_t v61 = [v60 sortedArrayUsingComparator:&__block_literal_global_321];

  uint64_t v62 = mach_absolute_time();
  uint32_t v63 = v240.numer;
  uint32_t v64 = v240.denom;
  id v65 = MEMORY[0x1E4F14500];
  if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)long long v272 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, v53, "BaseGroupsClustering", "", v272, 2u);
  }

  char v66 = MEMORY[0x1E4F14500];
  id v67 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long v272 = 136315394;
    long long v273 = "BaseGroupsClustering";
    __int16 v274 = 2048;
    double v275 = (float)((float)((float)((float)(v62 - v55) * (float)v63) / (float)v64) / 1000000.0);
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v272, 0x16u);
  }

  id v68 = v66;
  os_signpost_id_t v69 = os_signpost_id_generate(v66);
  id v70 = v66;
  os_signpost_id_t v167 = v69;
  unint64_t v168 = v69 - 1;
  if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)long long v272 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v69, "ClusterConsolidation", "", v272, 2u);
  }

  mach_timebase_info v238 = 0;
  mach_timebase_info(&v238);
  uint64_t v164 = mach_absolute_time();
  long long v236 = 0u;
  long long v237 = 0u;
  long long v234 = 0u;
  long long v235 = 0u;
  id v173 = v61;
  uint64_t v71 = [v173 countByEnumeratingWithState:&v234 objects:v262 count:16];
  if (v71)
  {
    uint64_t v72 = *(void *)v235;
    float v161 = (float)v31;
    uint64_t v165 = *(void *)v235;
    do
    {
      uint64_t v178 = 0;
      uint64_t v166 = v71;
      do
      {
        if (*(void *)v235 != v72) {
          objc_enumerationMutation(v173);
        }
        double v73 = *(void **)(*((void *)&v234 + 1) + 8 * v178);
        context = (void *)MEMORY[0x1D25FED50]();
        double v180 = [v73 objects];
        id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v75 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        double v182 = v74;
        if (a6 == 1)
        {
          id v183 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"personNodes" ascending:1 comparator:&__block_literal_global_328];
          unint64_t v195 = [MEMORY[0x1E4F1CA48] arrayWithArray:v180];
          v261[0] = v183;
          v261[1] = v177;
          id v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v261 count:2];
          [v195 sortUsingDescriptors:v76];

          float v163 = [v195 objectAtIndexedSubscript:0];
          float v162 = [v163 objectForKeyedSubscript:@"personNodes"];
          if ((unint64_t)[v162 count] > 3)
          {
            double v78 = 0.8;
            double v77 = 0.3;
            double v79 = 0.05;
            uint64_t v80 = 3;
          }
          else
          {
            double v77 = 0.0;
            double v78 = 1.0;
            double v79 = 0.0;
            uint64_t v80 = 1;
          }
          unint64_t v181 = v80;
          int v98 = 0;
          unint64_t v184 = 0;
LABEL_89:
          if (((v184 < [v195 count]) & (v98 ^ 1)) != 0)
          {
            double v99 = objc_msgSend(v195, "objectAtIndexedSubscript:");
            float v100 = [v99 objectForKeyedSubscript:@"personNodes"];
            uint64_t v190 = v99;
            float v101 = [v99 objectForKeyedSubscript:@"momentNodes"];
            unint64_t v209 = [v101 count];
            uint64_t v185 = v101;
            double v186 = [MEMORY[0x1E4F1CA48] arrayWithArray:v101];
            id v102 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            long long v232 = 0u;
            long long v233 = 0u;
            long long v230 = 0u;
            long long v231 = 0u;
            id v206 = v100;
            uint64_t v103 = [v206 countByEnumeratingWithState:&v230 objects:v260 count:16];
            if (v103)
            {
              uint64_t v104 = *(void *)v231;
              do
              {
                for (uint64_t j = 0; j != v103; ++j)
                {
                  if (*(void *)v231 != v104) {
                    objc_enumerationMutation(v206);
                  }
                  uint64_t v106 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v230 + 1) + 8 * j), "identifier"));
                  uint64_t v107 = [v102 objectForKeyedSubscript:v106];
                  uint64_t v108 = [v107 unsignedIntegerValue];

                  uint64_t v109 = [NSNumber numberWithUnsignedInteger:v108 + v209];
                  [v102 setObject:v109 forKeyedSubscript:v106];
                }
                uint64_t v103 = [v206 countByEnumeratingWithState:&v230 objects:v260 count:16];
              }
              while (v103);
            }

            unint64_t v192 = [v185 count];
            unint64_t v189 = v192;
            os_signpost_id_t spida = ++v184;
            while (1)
            {
              if (spida >= [v195 count])
              {
LABEL_114:
                if (v189)
                {
                  double v123 = (double)v192 / (double)v189;
                  double v124 = (double)v209 / (double)v189;
                }
                else
                {
                  double v123 = 0.0;
                  double v124 = 0.0;
                }
                [(PGGraph *)v188 longevity:v185];
                if (v123 < v77 || v124 < v79)
                {
                  int v98 = 0;
                }
                else
                {
                  int v98 = 0;
                  if (v209 >= v181)
                  {
                    float v127 = v125 / 31536000.0;
                    if (v127 >= 0.083333)
                    {
                      id v128 = v102;

                      id v129 = v186;
                      int v98 = 1;
                      double v182 = v129;
                      id v75 = v128;
                    }
                  }
                }

                goto LABEL_89;
              }
              double v110 = objc_msgSend(v195, "objectAtIndexedSubscript:");
              id v201 = [v110 objectForKeyedSubscript:@"personNodes"];
              char v111 = [v110 objectForKeyedSubscript:@"momentNodes"];
              v193 = v110;
              if ([v201 isSubsetOfSet:v206])
              {
                [(PGGraph *)v188 peopleDistance:v190 withSecondBaseGroup:v110 threshold:0.0 factor:1.0];
                unint64_t v113 = v192;
                if (v112 > v78)
                {
                  char v122 = 0;
                  goto LABEL_113;
                }
                if (v112 <= 0.6) {
                  unint64_t v113 = [v111 count] + v192;
                }
                uint64_t v187 = [v111 count];
                [v186 addObjectsFromArray:v111];
                long long v228 = 0u;
                long long v229 = 0u;
                long long v226 = 0u;
                long long v227 = 0u;
                id v114 = v201;
                uint64_t v115 = [v114 countByEnumeratingWithState:&v226 objects:v259 count:16];
                unint64_t v192 = v113;
                if (v115)
                {
                  uint64_t v116 = *(void *)v227;
                  do
                  {
                    for (uint64_t k = 0; k != v115; ++k)
                    {
                      if (*(void *)v227 != v116) {
                        objc_enumerationMutation(v114);
                      }
                      v118 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v226 + 1) + 8 * k), "identifier"));
                      double v119 = [v102 objectForKeyedSubscript:v118];
                      uint64_t v120 = [v119 unsignedIntegerValue];

                      id v121 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v111, "count") + v120);
                      [v102 setObject:v121 forKeyedSubscript:v118];
                    }
                    uint64_t v115 = [v114 countByEnumeratingWithState:&v226 objects:v259 count:16];
                  }
                  while (v115);
                }

                v189 += v187;
              }
              char v122 = 1;
LABEL_113:

              ++spida;
              if ((v122 & 1) == 0) {
                goto LABEL_114;
              }
            }
          }
        }
        else
        {
          long long v224 = 0u;
          long long v225 = 0u;
          long long v222 = 0u;
          long long v223 = 0u;
          id v81 = [v180 valueForKey:@"momentNodes"];
          uint64_t v82 = [v81 countByEnumeratingWithState:&v222 objects:v258 count:16];
          if (v82)
          {
            uint64_t v83 = *(void *)v223;
            do
            {
              for (uint64_t m = 0; m != v82; ++m)
              {
                if (*(void *)v223 != v83) {
                  objc_enumerationMutation(v81);
                }
                [v74 addObjectsFromArray:*(void *)(*((void *)&v222 + 1) + 8 * m)];
              }
              uint64_t v82 = [v81 countByEnumeratingWithState:&v222 objects:v258 count:16];
            }
            while (v82);
          }

          long long v220 = 0u;
          long long v221 = 0u;
          long long v218 = 0u;
          long long v219 = 0u;
          id v183 = v180;
          uint64_t v85 = [v183 countByEnumeratingWithState:&v218 objects:v257 count:16];
          if (v85)
          {
            uint64_t v200 = *(void *)v219;
            do
            {
              uint64_t v86 = 0;
              id v205 = (id)v85;
              do
              {
                if (*(void *)v219 != v200) {
                  objc_enumerationMutation(v183);
                }
                uint64_t v208 = v86;
                double v87 = *(void **)(*((void *)&v218 + 1) + 8 * v86);
                long long v214 = 0u;
                long long v215 = 0u;
                long long v216 = 0u;
                long long v217 = 0u;
                double v88 = [v87 objectForKeyedSubscript:@"personNodes"];
                uint64_t v89 = [v88 countByEnumeratingWithState:&v214 objects:v256 count:16];
                if (v89)
                {
                  uint64_t v90 = *(void *)v215;
                  do
                  {
                    for (uint64_t n = 0; n != v89; ++n)
                    {
                      if (*(void *)v215 != v90) {
                        objc_enumerationMutation(v88);
                      }
                      double v92 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v214 + 1) + 8 * n), "identifier"));
                      double v93 = [v75 objectForKeyedSubscript:v92];
                      uint64_t v94 = [v93 unsignedIntegerValue];

                      float v95 = NSNumber;
                      float v96 = [v87 objectForKeyedSubscript:@"momentNodes"];
                      double v97 = objc_msgSend(v95, "numberWithUnsignedInteger:", objc_msgSend(v96, "count") + v94);
                      [v75 setObject:v97 forKeyedSubscript:v92];
                    }
                    uint64_t v89 = [v88 countByEnumeratingWithState:&v214 objects:v256 count:16];
                  }
                  while (v89);
                }

                uint64_t v86 = v208 + 1;
              }
              while ((id)(v208 + 1) != v205);
              uint64_t v85 = [v183 countByEnumeratingWithState:&v218 objects:v257 count:16];
            }
            while (v85);
          }
        }

        if (![v182 count]) {
          goto LABEL_133;
        }
        if (a6 == 1)
        {
          [(PGGraph *)v188 longevity:v182];
          float v131 = v130 / 31536000.0;
        }
        else
        {
          float v131 = 0.0;
          if (!a6 && (unint64_t)[v182 count] < 3)
          {
LABEL_133:
            int v132 = 5;
            goto LABEL_159;
          }
        }
        float v133 = [v75 keysSortedByValueUsingComparator:&__block_literal_global_333];
        id v134 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v135 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        int v136 = [v133 firstObject];
        int v137 = [v75 objectForKeyedSubscript:v136];
        [v137 floatValue];
        float v139 = v138;

        long long v212 = 0u;
        long long v213 = 0u;
        long long v210 = 0u;
        long long v211 = 0u;
        id v140 = v133;
        uint64_t v141 = [v140 countByEnumeratingWithState:&v210 objects:v255 count:16];
        if (!v141) {
          goto LABEL_149;
        }
        uint64_t v142 = *(void *)v211;
        while (2)
        {
          for (iuint64_t i = 0; ii != v141; ++ii)
          {
            if (*(void *)v211 != v142) {
              objc_enumerationMutation(v140);
            }
            double v144 = *(void **)(*((void *)&v210 + 1) + 8 * ii);
            if (v139 <= 0.0)
            {
              double v148 = 0.0;
              if (a6 != 1) {
                goto LABEL_151;
              }
            }
            else
            {
              uint64_t v145 = [v75 objectForKeyedSubscript:*(void *)(*((void *)&v210 + 1) + 8 * ii)];
              [v145 floatValue];
              float v147 = v146;

              double v148 = (float)(v147 / v139);
              if (a6 != 1)
              {
                if (v148 < 0.35)
                {
LABEL_151:

                  uint64_t v151 = v182;
                  goto LABEL_157;
                }
                goto LABEL_147;
              }
              if (v148 >= 0.35) {
                goto LABEL_147;
              }
            }
            if ([v75 count] != 1)
            {

              uint64_t v151 = v182;
              goto LABEL_153;
            }
LABEL_147:
            uint64_t v149 = -[MAGraph nodeForIdentifier:](v188, "nodeForIdentifier:", [v144 unsignedIntegerValue]);
            [v134 addObject:v149];

            uint64_t v150 = [NSNumber numberWithDouble:v148];
            [v135 addObject:v150];
          }
          uint64_t v141 = [v140 countByEnumeratingWithState:&v210 objects:v255 count:16];
          if (v141) {
            continue;
          }
          break;
        }
LABEL_149:

        uint64_t v151 = v182;
        if (a6 == 1)
        {
LABEL_153:
          if ([v134 count] == 1)
          {
            v152 = [v134 objectAtIndexedSubscript:0];
            BOOL v153 = (unint64_t)[v152 numberOfMomentNodes] > 1;

            uint64_t v151 = v182;
            if (v153) {
              goto LABEL_157;
            }
          }
          else if ((unint64_t)[v151 count] >= 2)
          {
            goto LABEL_157;
          }
          int v132 = 5;
        }
        else
        {
LABEL_157:
          unint64_t v154 = [v151 count];
          v272[0] = 0;
          v172[2](v172, v134, v135, v151, v272, (float)v154 / v161, v131);
          int v132 = v272[0];
        }

LABEL_159:
        uint64_t v72 = v165;
        if (v132 != 5 && v132)
        {
          double v159 = v173;
          goto LABEL_168;
        }
        ++v178;
      }
      while (v178 != v166);
      uint64_t v71 = [v173 countByEnumeratingWithState:&v234 objects:v262 count:16];
    }
    while (v71);
  }

  uint64_t v155 = mach_absolute_time();
  uint32_t v156 = v238.numer;
  uint32_t v157 = v238.denom;
  id v158 = MEMORY[0x1E4F14500];
  if (v168 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)long long v272 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, v167, "ClusterConsolidation", "", v272, 2u);
  }

  double v159 = MEMORY[0x1E4F14500];
  id v160 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v159, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long v272 = 136315394;
    long long v273 = "ClusterConsolidation";
    __int16 v274 = 2048;
    double v275 = (float)((float)((float)((float)(v155 - v164) * (float)v156) / (float)v157) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v159, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v272, 0x16u);
  }
LABEL_168:

  _Block_object_dispose(buf, 8);
}

void __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v10 = a2;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "targetsForSourceIdentifier:", objc_msgSend(v10, "identifier"));
  if ([v6 count])
  {
    id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];

    if (v7)
    {
      BOOL v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
      [v8 addObject:v10];
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:v10];
      [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v6];

      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    *a4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) > 0x3E8uLL;
  }
}

double __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"personNodes"];
  BOOL v8 = [v5 objectForKeyedSubscript:@"personNodes"];
  if (*(void *)(a1 + 40) == 1)
  {
    if (([v7 isSubsetOfSet:v8] & 1) != 0
      || (double v9 = 3.0, [v8 isSubsetOfSet:v7]))
    {
      [*(id *)(a1 + 32) peopleDistance:v5 withSecondBaseGroup:v6 threshold:0.28 factor:0.5];
      double v11 = v10 + 0.0;
      [*(id *)(a1 + 32) momentsCountDistance:v5 withSecondBaseGroup:v6 withSubsetBias:@"momentNodes" withDistanceThreshold:0.0 withIntersectionBias:0.66 withKey:0.2];
      double v9 = v11 + v12;
    }
  }
  else
  {
    os_signpost_id_t v13 = *(void **)(a1 + 32);
    unint64_t v14 = [v5 objectForKeyedSubscript:@"relationships"];
    uint64_t v15 = [v13 _cluePeopleForRelationships:v14];

    id v16 = *(void **)(a1 + 32);
    os_signpost_id_t v17 = [v6 objectForKeyedSubscript:@"relationships"];
    uint64_t v18 = [v16 _cluePeopleForRelationships:v17];

    if (v18 | v15) {
      double v9 = 0.0;
    }
    else {
      double v9 = 0.33;
    }
    uint64_t v19 = [MEMORY[0x1E4F1CA80] setWithSet:v7];
    [v19 unionSet:v8];
    uint64_t v20 = [v19 count];
    if (v20)
    {
      unint64_t v21 = v20;
      unint64_t v22 = [MEMORY[0x1E4F1CA80] setWithSet:v7];
      [v22 intersectSet:v8];
      id v23 = v19;
      [v23 minusSet:v22];
      double v9 = v9 + ((double)(v21 + 1) / (double)(v21 + 1 - [v23 count]) + -1.0) / (double)v21;
    }
    else
    {
      id v23 = 0;
    }
  }
  return v9;
}

uint64_t __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_2_330(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_326(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 >= [v5 count])
  {
    unint64_t v8 = [v4 count];
    if (v8 <= [v5 count]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objects];
  unint64_t v6 = [v5 valueForKeyPath:@"@sum.momentNodes.@count"];

  uint64_t v7 = [v4 objects];

  unint64_t v8 = [v7 valueForKeyPath:@"@sum.momentNodes.@count"];

  uint64_t v9 = [v8 compare:v6];
  return v9;
}

id __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a5;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (a4)
  {
    uint64_t v9 = 0;
    do
    {
      double v10 = [v20 objectAtIndexedSubscript:*(void *)(*(void *)(a2 + 8 * a3) + 8 * v9)];
      double v11 = [v10 objectForKeyedSubscript:@"momentNodes"];
      [v7 addObjectsFromArray:v11];

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      double v12 = [v10 objectForKeyedSubscript:@"personNodes"];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            [v8 addObject:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v14);
      }

      ++v9;
    }
    while (v9 != a4);
  }
  [v18 setObject:v8 forKeyedSubscript:@"personNodes"];
  [v18 setObject:v7 forKeyedSubscript:@"momentNodes"];

  return v18;
}

uint64_t __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *(void *)(a2 + 8 * a3);
  if (a4)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    for (uint64_t i = 0; i != a4; ++i)
    {
      double v11 = [a5 objectAtIndexedSubscript:*(void *)(v5 + 8 * i)];
      double v12 = [v11 objectForKeyedSubscript:@"personNodes"];
      if ([v12 count] > v8)
      {
        unint64_t v8 = [v12 count];
        uint64_t v9 = i;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  return *(void *)(v5 + 8 * v9);
}

uint64_t __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 firstObject];
  unint64_t v6 = [v5 universalStartDate];
  id v7 = [v4 firstObject];

  unint64_t v8 = [v7 universalEndDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 >= [v5 count])
  {
    unint64_t v8 = [v4 count];
    uint64_t v7 = v8 > [v5 count];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

uint64_t __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_302(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 >= [v5 count])
  {
    unint64_t v8 = [v4 count];
    uint64_t v7 = v8 > [v5 count];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (void)enumeratePeopleClustersIncludingMeNode:(BOOL)a3 socialGroupsVersion:(unint64_t)a4 singlePersonGroups:(id *)a5 withBlock:(id)a6
{
  BOOL v7 = a3;
  if (a4 == 1) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 3;
  }
  double v9 = 0.7;
  if (a4 == 1) {
    double v9 = 0.0;
  }
  -[PGGraph enumeratePeopleClustersWithLinkage:threshold:includingMeNode:socialGroupsVersion:singlePersonGroups:withBlock:](self, "enumeratePeopleClustersWithLinkage:threshold:includingMeNode:socialGroupsVersion:singlePersonGroups:withBlock:", v8, v7, v9);
}

- (void)invalidateSupersetCaches
{
  p_supersetLocuint64_t k = &self->_supersetLock;
  os_unfair_lock_lock(&self->_supersetLock);
  supersetCityNodes = self->_supersetCityNodes;
  self->_supersetCityNodes = 0;

  supersetCountyNodes = self->_supersetCountyNodes;
  self->_supersetCountyNodes = 0;

  supersetStateNodes = self->_supersetStateNodes;
  self->_supersetStateNodes = 0;

  supersetCountryNodes = self->_supersetCountryNodes;
  self->_supersetCountryNodes = 0;

  os_unfair_lock_unlock(p_supersetLock);
}

- (void)invalidateProcessingCaches
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  zeroKeywordMappingByMeaningLabel = v2->_zeroKeywordMappingByMeaningLabel;
  v2->_zeroKeywordMappingByMeaningLabel = 0;

  objc_sync_exit(v2);
  interestingCityNodes = v2->_interestingCityNodes;
  v2->_interestingCityNodes = 0;
}

+ (id)_personClosestToMeBetweenPersonNode:(id)a3 andOtherPersonNode:(id)a4
{
  v28[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 graph];
  uint64_t v8 = +[PGGraphNodeCollection nodesInGraph:v7];
  double v9 = [v8 anyNode];

  double v10 = [v5 anyEdgeFromNode:v9];
  double v11 = [v10 label];

  double v12 = [v6 anyEdgeFromNode:v9];
  uint64_t v13 = [v12 label];

  v28[0] = @"PARTNER";
  v28[1] = @"FAMILY";
  v28[2] = @"FRIEND";
  v28[3] = @"COWORKER";
  v28[4] = @"ACQUAINTANCE";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:5];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v15)
  {
    id v20 = 0;
    goto LABEL_15;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v24;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v24 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
      if (objc_msgSend(v11, "isEqualToString:", v19, (void)v23))
      {
        long long v21 = v5;
LABEL_14:
        id v20 = v21;
        goto LABEL_15;
      }
      if ([v13 isEqualToString:v19])
      {
        long long v21 = v6;
        goto LABEL_14;
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    id v20 = 0;
    if (v16) {
      continue;
    }
    break;
  }
LABEL_15:

  return v20;
}

+ (id)_closestRelationshipEdgeLabelForPersonNode:(id)a3 andOtherPersonNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 graph];
  uint64_t v8 = +[PGGraphNodeCollection nodesInGraph:v7];
  double v9 = [v8 anyNode];

  double v10 = [(id)objc_opt_class() _personClosestToMeBetweenPersonNode:v5 andOtherPersonNode:v6];
  if (v10)
  {
    if ([v5 isSameNodeAsNode:v10]) {
      double v11 = v6;
    }
    else {
      double v11 = v5;
    }
    id v12 = v11;
    uint64_t v13 = [v10 anyEdgeFromNode:v9];
    id v14 = [v13 label];

    uint64_t v15 = [v12 anyEdgeFromNode:v9];

    uint64_t v16 = [v15 label];

    uint64_t v17 = @"ACQUAINTANCE";
    if ([v14 isEqualToString:@"PARTNER"]
      && ![(__CFString *)v16 isEqualToString:@"COWORKER"])
    {
      uint64_t v17 = v16;
    }
    id v18 = v17;
  }
  else
  {
    id v14 = [v5 anyEdgeFromNode:v9];
    id v18 = [v14 label];
  }

  return v18;
}

- (void)_enumerateMeaningfulEventsWithMeaningLabel:(id)a3 visitedMeaningfulEvents:(id)a4 usingBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke;
  v12[3] = &unk_1E68ECDC8;
  id v14 = self;
  id v15 = v9;
  id v13 = v8;
  id v10 = v9;
  id v11 = v8;
  [(MAGraph *)self enumerateNodesWithLabel:a3 domain:700 usingBlock:v12];
}

void __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke(uint64_t a1, void *a2, char *a3)
{
  id v5 = a2;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke_2;
  v13[3] = &unk_1E68ECD50;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 48);
  uint64_t v16 = &v17;
  [v5 enumerateMeaningfulEventsUsingBlock:v13];
  if (*((unsigned char *)v18 + 24))
  {
    char v6 = 1;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke_3;
    void v9[3] = &unk_1E68ECDA0;
    int8x16_t v8 = *(int8x16_t *)(a1 + 32);
    id v7 = (id)v8.i64[0];
    int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
    id v11 = *(id *)(a1 + 48);
    id v12 = &v17;
    [v5 enumerateSubmeaningsUsingBlock:v9];

    char v6 = *((unsigned char *)v18 + 24);
  }
  *a3 = v6;

  _Block_object_dispose(&v17, 8);
}

void __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) addObject:v5];
    *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

void __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  char v6 = *(void **)(a1 + 32);
  id v7 = [a3 label];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke_4;
  v11[3] = &unk_1E68ECD78;
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  id v12 = v9;
  uint64_t v13 = v10;
  uint64_t v14 = a4;
  [v6 _enumerateMeaningfulEventsWithMeaningLabel:v7 visitedMeaningfulEvents:v8 usingBlock:v11];
}

uint64_t __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke_4(void *a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(a1[4] + 16))();
  char v6 = (unsigned char *)a1[6];
  *a3 = *(unsigned char *)(*(void *)(a1[5] + 8) + 24);
  *char v6 = *(unsigned char *)(*(void *)(a1[5] + 8) + 24);
  return result;
}

- (id)meaningfulEventNodeForUUID:(id)a3
{
  id v3 = +[PGGraphMomentNodeCollection momentNodeForUUID:a3 inGraph:self];
  id v4 = [v3 anyNode];

  return v4;
}

- (id)bestMeaningLabelForMeaningfulEvent:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__57624;
  uint64_t v17 = __Block_byref_object_dispose__57625;
  id v18 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  id v4 = [(id)objc_opt_class() availableInferredMeaningLabels];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PGGraph_Meaning__bestMeaningLabelForMeaningfulEvent___block_invoke;
  v8[3] = &unk_1E68ECD28;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = v12;
  id v11 = &v13;
  [v3 enumerateMeaningNodesUsingBlock:v8];
  id v6 = (id)v14[5];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void __55__PGGraph_Meaning__bestMeaningLabelForMeaningfulEvent___block_invoke(uint64_t a1, void *a2)
{
  id obj = [a2 label];
  unint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:");
  if (v3 < *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    unint64_t v4 = v3;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  }
}

- (void)enumerateMomentNodesWithMeaning:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__PGGraph_Meaning__enumerateMomentNodesWithMeaning_usingBlock___block_invoke;
  v8[3] = &unk_1E68ECD00;
  id v9 = v6;
  id v7 = v6;
  [(PGGraph *)self enumerateMeaningfulEventsWithMeaning:a3 usingBlock:v8];
}

void __63__PGGraph_Meaning__enumerateMomentNodesWithMeaning_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 eventCollection];
  id v6 = [v5 eventMomentNodes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __63__PGGraph_Meaning__enumerateMomentNodesWithMeaning_usingBlock___block_invoke_2;
  v7[3] = &unk_1E68ECCD8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = a3;
  [v6 enumerateNodesUsingBlock:v7];
}

uint64_t __63__PGGraph_Meaning__enumerateMomentNodesWithMeaning_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  **(unsigned char **)(a1 + 40) = *a3;
  return result;
}

- (id)momentNodesWithMeaning:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F1CA80] set];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PGGraph_Meaning__momentNodesWithMeaning___block_invoke;
  v8[3] = &unk_1E68EF578;
  id v6 = v5;
  id v9 = v6;
  [(PGGraph *)self enumerateMomentNodesWithMeaning:a3 usingBlock:v8];

  return v6;
}

uint64_t __43__PGGraph_Meaning__momentNodesWithMeaning___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateMeaningsFromMeaningfulEvent:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F28E60];
  id v7 = a3;
  id v8 = [v6 indexSet];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __68__PGGraph_Meaning__enumerateMeaningsFromMeaningfulEvent_usingBlock___block_invoke;
  v11[3] = &unk_1E68ECCB0;
  id v12 = v8;
  id v13 = v5;
  id v9 = v5;
  id v10 = v8;
  [v7 enumerateMeaningNodesUsingBlock:v11];
}

void __68__PGGraph_Meaning__enumerateMeaningsFromMeaningfulEvent_usingBlock___block_invoke(uint64_t a1, void *a2, char *a3)
{
  id v5 = a2;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PGGraph_Meaning__enumerateMeaningsFromMeaningfulEvent_usingBlock___block_invoke_2;
  aBlock[3] = &unk_1E68ECC60;
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  uint64_t v17 = &v18;
  id v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v7 = [v5 label];
  v6[2](v6, v7);

  if (*((unsigned char *)v19 + 24))
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [v5 collection];
    id v10 = [v9 parentMeaningNodes];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __68__PGGraph_Meaning__enumerateMeaningsFromMeaningfulEvent_usingBlock___block_invoke_3;
    v11[3] = &unk_1E68ECC88;
    id v12 = v6;
    id v13 = &v18;
    [v10 enumerateNodesUsingBlock:v11];

    char v8 = *((unsigned char *)v19 + 24);
  }
  *a3 = v8;

  _Block_object_dispose(&v18, 8);
}

uint64_t __68__PGGraph_Meaning__enumerateMeaningsFromMeaningfulEvent_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = PGMeaningForMeaningLabel(a2);
  if (result)
  {
    uint64_t v4 = result;
    uint64_t result = [*(id *)(a1 + 32) containsIndex:result];
    if ((result & 1) == 0)
    {
      [*(id *)(a1 + 32) addIndex:v4];
      id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
      return v5();
    }
  }
  return result;
}

void __68__PGGraph_Meaning__enumerateMeaningsFromMeaningfulEvent_usingBlock___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [a2 label];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (id)meaningsFromMeaningfulEvent:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28E60];
  id v5 = a3;
  id v6 = [v4 indexSet];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __48__PGGraph_Meaning__meaningsFromMeaningfulEvent___block_invoke;
  void v9[3] = &unk_1E68F0470;
  id v7 = v6;
  id v10 = v7;
  [(PGGraph *)self enumerateMeaningsFromMeaningfulEvent:v5 usingBlock:v9];

  return v7;
}

uint64_t __48__PGGraph_Meaning__meaningsFromMeaningfulEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIndex:a2];
}

- (void)enumerateMeaningfulEventsWithMeaning:(unint64_t)a3 usingBlock:(id)a4
{
  id v8 = a4;
  id v6 = PGMeaningLabelForMeaning(a3);
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
    [(PGGraph *)self _enumerateMeaningfulEventsWithMeaningLabel:v6 visitedMeaningfulEvents:v7 usingBlock:v8];
  }
}

- (BOOL)eventIsStellar:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(id)objc_opt_class() stellarMeanings];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__PGGraph_Meaning__eventIsStellar___block_invoke;
  v8[3] = &unk_1E68ECC38;
  id v10 = &v11;
  id v6 = v5;
  id v9 = v6;
  [(PGGraph *)self enumerateMeaningsFromMeaningfulEvent:v4 usingBlock:v8];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

uint64_t __35__PGGraph_Meaning__eventIsStellar___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsIndex:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (BOOL)eventIsVeryMeaningful:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(id)objc_opt_class() veryMeaningfulMeanings];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PGGraph_Meaning__eventIsVeryMeaningful___block_invoke;
  v8[3] = &unk_1E68ECC38;
  id v10 = &v11;
  id v6 = v5;
  id v9 = v6;
  [(PGGraph *)self enumerateMeaningsFromMeaningfulEvent:v4 usingBlock:v8];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

uint64_t __42__PGGraph_Meaning__eventIsVeryMeaningful___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsIndex:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (id)meaningfulEvents
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [(id)objc_opt_class() availableInferredMeaningLabels];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = [(MAGraph *)self nodesForLabel:*(void *)(*((void *)&v14 + 1) + 8 * i) domain:700];
        id v9 = [v8 anyObject];

        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __36__PGGraph_Meaning__meaningfulEvents__block_invoke;
        v12[3] = &unk_1E68ECC10;
        id v13 = v3;
        [v9 enumerateMeaningfulEventsUsingBlock:v12];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v3;
}

uint64_t __36__PGGraph_Meaning__meaningfulEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (id)availableInferredMeaningLabels
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA80];
  id v3 = [(id)objc_opt_class() availableMeaningLabels];
  uint64_t v4 = [v2 setWithArray:v3];

  if (+[PGEventLabelingConfiguration isEventLabelingEnabled])
  {
    uint64_t v5 = objc_alloc_init(PGEventLabelingConfiguration);
    uint64_t v6 = [(PGEventLabelingConfiguration *)v5 meaningLabels];
    [v4 unionSet:v6];
  }
  id v7 = [v4 allObjects];

  return v7;
}

+ (unint64_t)meaningForMeaningLabel:(id)a3
{
  return PGMeaningForMeaningLabel(a3);
}

+ (id)meaningLabelForMeaning:(unint64_t)a3
{
  return PGMeaningLabelForMeaning(a3);
}

+ (id)preciseMeaningNodeForMeaningLabel:(id)a3 meaningfulEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__57624;
  long long v17 = __Block_byref_object_dispose__57625;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__PGGraph_Meaning__preciseMeaningNodeForMeaningLabel_meaningfulEvent___block_invoke;
  void v10[3] = &unk_1E68ED948;
  id v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 enumerateMeaningNodesUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __70__PGGraph_Meaning__preciseMeaningNodeForMeaningLabel_meaningfulEvent___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v6 = a2;
  id v7 = [v6 label];
  id v8 = v6;
  id v14 = v8;
  if (v8)
  {
    id v9 = v8;
    do
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
        break;
      }
      id v10 = [v9 parentMeaningNode];
      id v11 = [v10 label];
      if ([*(id *)(a1 + 32) isEqualToString:v11]) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v9);
      }

      id v9 = v10;
    }
    while (v10);
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (!*(void *)(*(void *)(v12 + 8) + 40))
  {
    int v13 = [*(id *)(a1 + 32) isEqualToString:v7];
    uint64_t v12 = *(void *)(a1 + 40);
    if (v13)
    {
      objc_storeStrong((id *)(*(void *)(v12 + 8) + 40), a2);
      uint64_t v12 = *(void *)(a1 + 40);
    }
  }
  *a3 = *(void *)(*(void *)(v12 + 8) + 40) != 0;
}

+ (id)mostSignificantMeaningLabels
{
  if (mostSignificantMeaningLabels_onceToken != -1) {
    dispatch_once(&mostSignificantMeaningLabels_onceToken, &__block_literal_global_262);
  }
  uint64_t v2 = (void *)mostSignificantMeaningLabels_mostSignificantMeaningLabels;
  return v2;
}

void __48__PGGraph_Meaning__mostSignificantMeaningLabels__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Wedding", @"Celebration", @"Birthday", @"HolidayEvent", 0);
  v1 = (void *)mostSignificantMeaningLabels_mostSignificantMeaningLabels;
  mostSignificantMeaningLabels_mostSignificantMeaningLabels = v0;
}

+ (id)frequentMeaningLabels
{
  if (frequentMeaningLabels_onceToken[0] != -1) {
    dispatch_once(frequentMeaningLabels_onceToken, &__block_literal_global_259);
  }
  uint64_t v2 = (void *)frequentMeaningLabels_frequentMeaningLabels;
  return v2;
}

void __41__PGGraph_Meaning__frequentMeaningLabels__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Restaurant", @"Lunch", @"Dinner", @"Breakfast", 0);
  v1 = (void *)frequentMeaningLabels_frequentMeaningLabels;
  frequentMeaningLabels_frequentMeaningLabels = v0;
}

+ (id)stellarMeanings
{
  uint64_t v2 = [a1 allMeaningfulMeanings];
  id v3 = (void *)[v2 mutableCopy];
  [v3 removeIndex:16];
  [v3 removeIndex:15];
  [v3 removeIndex:0];

  return v3;
}

+ (id)lessMeaningfulMeanings
{
  id v3 = [a1 allMeaningfulMeanings];
  uint64_t v4 = [a1 veryMeaningfulMeanings];
  id v5 = (void *)[v3 mutableCopy];
  [v5 removeIndexes:v4];

  return v5;
}

+ (id)veryMeaningfulMeanings
{
  if (veryMeaningfulMeanings_onceToken != -1) {
    dispatch_once(&veryMeaningfulMeanings_onceToken, &__block_literal_global_57629);
  }
  uint64_t v2 = (void *)veryMeaningfulMeanings_meanings;
  return v2;
}

uint64_t __42__PGGraph_Meaning__veryMeaningfulMeanings__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E60] indexSet];
  v1 = (void *)veryMeaningfulMeanings_meanings;
  veryMeaningfulMeanings_meanings = v0;

  [(id)veryMeaningfulMeanings_meanings addIndex:12];
  [(id)veryMeaningfulMeanings_meanings addIndex:11];
  [(id)veryMeaningfulMeanings_meanings addIndex:14];
  uint64_t v2 = (void *)veryMeaningfulMeanings_meanings;
  return [v2 addIndex:10];
}

+ (id)allMeaningfulMeanings
{
  return (id)objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 1, 16);
}

- (void)_reportBusinessItemsWithAnalytics:(id)a3
{
  v28[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__PGGraph_Metrics___reportBusinessItemsWithAnalytics___block_invoke;
  void v10[3] = &unk_1E68F0330;
  void v10[4] = &v23;
  v10[5] = &v19;
  v10[6] = &v15;
  v10[7] = &v11;
  [(MAGraph *)self enumerateNodesWithLabel:@"Business" domain:503 usingBlock:v10];
  v27[0] = @"businessItemsCount";
  id v5 = [NSNumber numberWithUnsignedInteger:v24[3]];
  v28[0] = v5;
  v27[1] = @"businessItemsCountFromPublicEvent";
  id v6 = [NSNumber numberWithUnsignedInteger:v20[3]];
  v28[1] = v6;
  void v27[2] = @"businessItemsCountFromRoutine";
  id v7 = [NSNumber numberWithUnsignedInteger:v16[3]];
  v28[2] = v7;
  v27[3] = @"businessItemsCountFromMeaningInference";
  id v8 = [NSNumber numberWithUnsignedInteger:v12[3]];
  v28[3] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];
  [v4 sendEvent:@"com.apple.Photos.Intelligence.businessItems" withPayload:v9];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

void __54__PGGraph_Metrics___reportBusinessItemsWithAnalytics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = [v3 collection];
  id v5 = [v4 publicEventNodes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__PGGraph_Metrics___reportBusinessItemsWithAnalytics___block_invoke_2;
    v8[3] = &unk_1E68F0308;
    void v8[4] = &v9;
    [v3 enumerateMomentEdgesAndNodesUsingBlock:v8];
    uint64_t v7 = 48;
    if (!*((unsigned char *)v10 + 24)) {
      uint64_t v7 = 56;
    }
    ++*(void *)(*(void *)(*(void *)(a1 + v7) + 8) + 24);
    _Block_object_dispose(&v9, 8);
  }
}

void __54__PGGraph_Metrics___reportBusinessItemsWithAnalytics___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  [v8 confidence];
  if (v6 >= 0.6) {
    char v7 = [v8 hasRoutineInfo];
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (void)_reportDisambiguatedLocationsWithAnalytics:(id)a3
{
  v32[10] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __63__PGGraph_Metrics___reportDisambiguatedLocationsWithAnalytics___block_invoke;
  v22[3] = &unk_1E68F02D8;
  v22[4] = &v27;
  void v22[5] = &v23;
  [(MAGraph *)self enumerateNodesWithLabel:@"Address" domain:200 usingBlock:v22];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(PGGraph *)self infoNode];
  id v5 = v4;
  if (v4)
  {
    [v4 routineInfo];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
  }

  v31[0] = @"improvedLocationsCount";
  uint64_t v17 = [NSNumber numberWithUnsignedInteger:v28[3]];
  v32[0] = v17;
  v31[1] = @"remoteLocationsCount";
  double v6 = [NSNumber numberWithUnsignedInteger:v24[3]];
  v32[1] = v6;
  v31[2] = @"routineAvailable";
  char v7 = [NSNumber numberWithBool:v18];
  v32[2] = v7;
  v31[3] = @"routineNumberOfLocationsOfInterest";
  id v8 = [NSNumber numberWithUnsignedInteger:*((void *)&v18 + 1)];
  v32[3] = v8;
  v31[4] = @"routineNumberOfVisits";
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:(void)v19];
  v32[4] = v9;
  v31[5] = @"routineNumberOfTimeMatches";
  id v10 = [NSNumber numberWithUnsignedInteger:*((void *)&v19 + 1)];
  void v32[5] = v10;
  v31[6] = @"routineNumberOfCloseByLocationMatches";
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:(void)v20];
  v32[6] = v11;
  v31[7] = @"routineNumberOfRemoteLocationMatches";
  char v12 = [NSNumber numberWithUnsignedInteger:*((void *)&v20 + 1)];
  v32[7] = v12;
  v31[8] = @"routineNumberOfMatchRequests";
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:(void)v21];
  v32[8] = v13;
  v31[9] = @"routinePinningVisitsRatio";
  uint64_t v14 = [NSNumber numberWithDouble:*((double *)&v21 + 1) * 100.0];
  v32[9] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:10];
  [v16 sendEvent:@"com.apple.Photos.Intelligence.disambiguatedLocations" withPayload:v15];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

void __63__PGGraph_Metrics___reportDisambiguatedLocationsWithAnalytics___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = (void *)MEMORY[0x1D25FED50]();
  if ([v6 isImproved]) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  id v4 = [v6 collection];
  id v5 = [v4 momentNodes];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v5 count];
}

- (void)_reportMobilityWithAnalytics:(id)a3
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v5 = [(PGGraph *)self momentNodes];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __49__PGGraph_Metrics___reportMobilityWithAnalytics___block_invoke;
  v11[3] = &unk_1E68F02B0;
  void v11[4] = &v24;
  void v11[5] = &v20;
  v11[6] = &v16;
  v11[7] = &v12;
  [v5 enumerateNodesUsingBlock:v11];

  v28[0] = @"locationMobilityPedestrianCount";
  id v6 = [NSNumber numberWithUnsignedInteger:v25[3]];
  v29[0] = v6;
  v28[1] = @"locationMobilityBicycleCount";
  char v7 = [NSNumber numberWithUnsignedInteger:v21[3]];
  v29[1] = v7;
  v28[2] = @"locationMobilityCarCount";
  id v8 = [NSNumber numberWithUnsignedInteger:v17[3]];
  v29[2] = v8;
  v28[3] = @"locationMobilityPlaneCount";
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:v13[3]];
  v29[3] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
  [v4 sendEvent:@"com.apple.Photos.Intelligence.locationMobility" withPayload:v10];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

uint64_t __49__PGGraph_Metrics___reportMobilityWithAnalytics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 locationMobilityType];
  switch(result)
  {
    case 1:
      uint64_t v4 = a1 + 32;
      goto LABEL_6;
    case 2:
      uint64_t v4 = a1 + 40;
      goto LABEL_6;
    case 3:
      uint64_t v4 = a1 + 48;
      goto LABEL_6;
    case 4:
      uint64_t v4 = a1 + 56;
LABEL_6:
      ++*(void *)(*(void *)(*(void *)v4 + 8) + 24);
      break;
    default:
      return result;
  }
  return result;
}

- (void)_reportDeviceOwnerWithAnalytics:(id)a3 photoLibrary:(id)a4 serviceManager:(id)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PGGraph *)self meNode];
  uint64_t v12 = [v11 localIdentifier];

  [v9 ratioOfAssetsWithFacesProcessed];
  double v14 = v13;
  if ([v12 length] && v14 >= 0.9)
  {
    uint64_t v15 = [v9 librarySpecificFetchOptions];
    [v15 setPersonContext:1];
    [v15 setFetchLimit:1];
    [v15 setShouldPrefetchCount:1];
    uint64_t v16 = (void *)MEMORY[0x1E4F391F0];
    v40[0] = v12;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    uint64_t v18 = [v16 fetchPersonsWithLocalIdentifiers:v17 options:v15];

    if ([v18 count])
    {
      uint64_t v34 = v18;
      id v35 = v10;
      uint64_t v19 = [v10 inferredDeviceOwnerForPhotoLibrary:v9 ignoreContactLinking:1];
      uint64_t v20 = [v19 localIdentifier];

      long long v21 = [(PGGraph *)self inferMeNodeFromSocialGroups];
      uint64_t v22 = [v21 localIdentifier];

      uint64_t v23 = [v22 length];
      if (v23) {
        uint64_t v24 = [v22 isEqualToString:v12];
      }
      else {
        uint64_t v24 = 0;
      }
      uint64_t v26 = [v20 length];
      uint64_t v33 = v22;
      if (v26) {
        uint64_t v27 = -[NSObject isEqualToString:](v20, "isEqualToString:", v12, v22);
      }
      else {
        uint64_t v27 = 0;
      }
      v37[0] = MEMORY[0x1E4F1CC38];
      v36[0] = @"VUEnabled";
      v36[1] = @"graphInferenceAvailable";
      id v28 = [NSNumber numberWithBool:v23 != 0];
      v37[1] = v28;
      v36[2] = @"graphInferenceMatchesGroundTruth";
      uint64_t v29 = [NSNumber numberWithBool:v24];
      void v37[2] = v29;
      v36[3] = @"vuInferenceAvailable";
      uint64_t v30 = [NSNumber numberWithBool:v26 != 0];
      v37[3] = v30;
      v36[4] = @"vuInferenceMatchesGroundTruth";
      unint64_t v31 = [NSNumber numberWithBool:v27];
      v37[4] = v31;
      uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:5];
      [v8 sendEvent:@"com.apple.Photos.Intelligence.deviceOwnerInference" withPayload:v32];

      uint64_t v18 = v34;
      id v10 = v35;
    }
    else
    {
      uint64_t v25 = +[PGLogging sharedLogging];
      uint64_t v20 = [v25 loggingConnection];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        double v39 = v12;
        _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "No person node for local identifier %@, skipping device owner metric reporting.", buf, 0xCu);
      }
    }
  }
}

- (void)_reportLibraryWithAnalytics:(id)a3
{
  void v12[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PGGraph *)self infoNode];
  v11[0] = @"numberOfUtilityAssets";
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "numberOfUtilityAssets"));
  v12[0] = v6;
  v11[1] = @"numberOfDefaultAssets";
  char v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "numberOfDefaultAssets"));
  v12[1] = v7;
  void v11[2] = @"numberOfImprovedAssets";
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "numberOfImprovedAssets"));
  v12[2] = v8;
  v11[3] = @"numberOfBetterAssets";
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "numberOfBetterAssets"));
  v12[3] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  [v4 sendEvent:@"com.apple.Photos.Intelligence.library" withPayload:v10];
}

- (void)reportMetricsLogsWithAnalytics:(id)a3 photoLibrary:(id)a4 serviceManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(PGGraph *)self _reportLibraryWithAnalytics:v10];
  [(PGGraph *)self _reportMobilityWithAnalytics:v10];
  [(PGGraph *)self _reportDisambiguatedLocationsWithAnalytics:v10];
  [(PGGraph *)self _reportBusinessItemsWithAnalytics:v10];
  [(PGGraph *)self _reportDeviceOwnerWithAnalytics:v10 photoLibrary:v9 serviceManager:v8];
}

@end