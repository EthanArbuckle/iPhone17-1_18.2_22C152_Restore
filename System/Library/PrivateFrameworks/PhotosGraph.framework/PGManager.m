@interface PGManager
+ (BOOL)geoServiceProviderDidChangeForGraph:(id)a3;
+ (BOOL)graphConsistencyCheckIsEnabled;
+ (BOOL)photosChallengeIsEnabled;
+ (Class)graphClass;
+ (id)_calendarEventsBetweenDate:(id)a3 andDate:(id)a4 atLocation:(id)a5 withPersonLocalIdentifiers:(id)a6 inPhotoLibrary:(id)a7 serviceManager:(id)a8 locationCache:(id)a9;
+ (id)_nodesOfClass:(id)a3 matchingNodes:(id)a4 inGraph:(id)a5;
+ (id)consistencyCheckResultOfGraph:(id)a3 andGraph:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6;
+ (id)consistencyIgnoredNodeDomainClasses;
+ (id)consistencyIgnoredNodeDomainCodes;
+ (id)defaultRulesWithOptions:(id)a3 graph:(id)a4;
+ (id)edgesByNodeFromEdges:(id)a3 andNode:(id)a4;
+ (id)exportableDictionaryFromKeywords:(id)a3;
+ (id)graphServicesURLWithPhotoLibrary:(id)a3;
+ (id)nodeDomainsFromGraph:(id)a3;
+ (id)nodesByClassFromGraph:(id)a3;
+ (id)nodesOfClass:(id)a3 matchingNode:(id)a4 inGraph:(id)a5;
+ (id)stringFromPGDuration:(unint64_t)a3;
+ (id)summaryCurationForHighlight:(id)a3;
+ (int64_t)_totalNumberOfIdenticalNodesFromNode1ByNode2:(id)a3 withNumberOfIdenticalNodesByDomain:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6;
+ (void)initialize;
- (BOOL)_addressesDidChangeBetweenAddressesInGraph:(id)a3 andAddressesInContacts:(id)a4 addressType:(unint64_t)a5 person:(id)a6 graph:(id)a7;
- (BOOL)_isReadyWithError:(id *)a3;
- (BOOL)_supportsSemanticalDedupingForMemory:(id)a3;
- (BOOL)canProceedWithFullGraphRebuildStamp:(unint64_t)a3;
- (BOOL)copyGraphToURL:(id)a3;
- (BOOL)date:(id)a3 isEqualToDate:(id)a4;
- (BOOL)destroyValidationGraph;
- (BOOL)generateDefaultRulesForLibraryScopeWithLocalIdentifier:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)graphIsUsable:(id)a3 error:(id *)a4;
- (BOOL)hasPendingGraphAccess;
- (BOOL)homeWorkAddressesDidChangeForPersonInContact:(id)a3 andPersonNode:(id)a4 withHomeWorkNodesByPersonNode:(id)a5 graph:(id)a6;
- (BOOL)isBusy;
- (BOOL)isInterestingForMoment:(id)a3;
- (BOOL)isReady;
- (BOOL)isSmartInterestingForMoment:(id)a3;
- (BOOL)mePersonContactIdentifierDidChangeWithGraphUpdate:(id)a3;
- (BOOL)photoLibraryIsReadonly;
- (BOOL)requiresReadOnly;
- (BOOL)saveGraphToURL:(id)a3;
- (BOOL)shouldValidateGraphConsistency;
- (BOOL)suggestsToStartSharedLibraryWithError:(id *)a3;
- (BOOL)swapInGraphAtURL:(id)a3 progressBlock:(id)a4 error:(id *)a5;
- (BOOL)updateGraph:(id)a3 withGraphUpdate:(id)a4 withRecipe:(id)a5 progressBlock:(id)a6;
- (CLSAOICache)aoiCache;
- (CLSLocationCache)locationCache;
- (CLSNatureCache)natureCache;
- (CLSPOICache)poiCache;
- (CLSPublicEventManager)publicEventManager;
- (CLSROICache)roiCache;
- (CLSServiceManager)serviceManager;
- (CPAnalytics)analytics;
- (NSArray)availableMetricEvents;
- (NSDate)dateOfLastIncrementalUpdateInvocation;
- (NSProgress)rebuildProgress;
- (NSString)graphName;
- (NSURL)graphPersistenceParentDirectoryURL;
- (NSURL)metadataSnapshotOutputPathURL;
- (OS_dispatch_queue)graphUpdateQueue;
- (OS_os_log)enrichmentLoggingConnection;
- (OS_os_log)externalRelevanceLoggingConnection;
- (OS_os_log)graphConsistencyCheckLoggingConnection;
- (OS_os_log)graphLoggingConnection;
- (OS_os_log)guessWhoLoggingConnection;
- (OS_os_log)ingestLoggingConnection;
- (OS_os_log)loggingConnection;
- (OS_os_log)memoriesLoggingConnection;
- (OS_os_log)metricsLoggingConnection;
- (OS_os_log)relatedLoggingConnection;
- (OS_os_log)suggestionsLoggingConnection;
- (OS_os_log)upNextLoggingConnection;
- (PGCurationManager)curationManager;
- (PGManager)init;
- (PGManager)initWithGraph:(id)a3;
- (PGManager)initWithGraph:(id)a3 photoLibrary:(id)a4;
- (PGManager)initWithGraph:(id)a3 readonlyPhotoLibrary:(id)a4;
- (PGManager)initWithGraphPersistentStoreURL:(id)a3 photoLibrary:(id)a4 analytics:(id)a5 progressBlock:(id)a6;
- (PGManager)initWithImmutableGraph:(id)a3;
- (PGManager)initWithImmutableGraph:(id)a3 photoLibrary:(id)a4;
- (PGManager)initWithPhotoLibrary:(id)a3 analytics:(id)a4 progressBlock:(id)a5;
- (PGManager)initWithPhotoLibrary:(id)a3 progressBlock:(id)a4;
- (PGManager)initWithReadonlyPhotoLibrary:(id)a3;
- (PGMusicBag)musicBag;
- (PHPhotoLibrary)photoLibrary;
- (double)graphScoreForMoment:(id)a3;
- (double)libraryDuration;
- (double)neighborScoreForMoment:(id)a3;
- (double)targetCurationDurationWithCurationLength:(unint64_t)a3 customDuration:(double)result;
- (double)timeIntervalSinceLastGraphFullRebuild;
- (id)UUIDForMoment:(id)a3;
- (id)_behavioralStatisticsWithGraph:(id)a3;
- (id)_changingPropertyKeysForPersonProperties:(id)a3 andPersonContactProperties:(id)a4;
- (id)_checkConsistencyOfGraph:(id)a3;
- (id)_collectionStatisticsForCurrentPhotoLibrary;
- (id)_curationDebugInformationForHighlight:(id)a3 options:(id)a4;
- (id)_dateFormatter;
- (id)_dayOfWeekStatisticsWithGraph:(id)a3;
- (id)_debugInformationForRelated:(id)a3 referenceKeywords:(id)a4 andRelatedMoment:(id)a5 relatedType:(unint64_t)a6 curationContext:(id)a7;
- (id)_defaultStatisticsWithGraph:(id)a3 verbose:(BOOL)a4 forDiagnostics:(BOOL)a5;
- (id)_diagnosticSummaryInfoForMemory:(id)a3;
- (id)_domainLabelCountStatisticsWithGraph:(id)a3;
- (id)_entityTagsStatistics:(id)a3;
- (id)_extractDatesAndAssetCountsFromMemory:(id)a3;
- (id)_extractYearStatsFromOrderedCollectionFetchResults:(id)a3 fetchOptions:(id)a4 yearEntryKey:(id)a5 numberOfYearsEntryKey:(id)a6;
- (id)_fallbackCurationOfLength:(unint64_t)a3 forMemory:(id)a4 customDuration:(double)a5 curationContext:(id)a6;
- (id)_featureNodesForEncodedFeatures:(id)a3 inGraph:(id)a4;
- (id)_fetchResultMatchingInternalPredicate:(id)a3;
- (id)_getDefaultOutputPathForMetadataSnapshot;
- (id)_highlightEstimatesStatisticsWithCurationContext:(id)a3;
- (id)_highlightTitleStatisticsWithGraph:(id)a3 titleGenerationContext:(id)a4;
- (id)_homeWorkNodesByPersonNodeForContactIdentifiers:(id)a3 inGraph:(id)a4;
- (id)_interestingStatisticsWithGraph:(id)a3;
- (id)_mobilityStatisticsWithGraph:(id)a3;
- (id)_momentNodesFromMemory:(id)a3 inGraph:(id)a4;
- (id)_momentsStatisticsForCurrentPhotoLibrary;
- (id)_moodStatisticsWithGraph:(id)a3;
- (id)_oneOnOneTripsWithGraph:(id)a3;
- (id)_partOfDayStatisticsWithGraph:(id)a3 titleGenerationContext:(id)a4;
- (id)_peopleNameBiologicalSexStatisticsWithGraph:(id)a3;
- (id)_peopleRelationshipsStatisticsWithGraph:(id)a3 includingDebugInfo:(BOOL)a4;
- (id)_peopleVisionAgeStatisticsWithGraph:(id)a3;
- (id)_peopleVisionBiologicalSexStatisticsWithGraph:(id)a3;
- (id)_poiStatisticsWithGraph:(id)a3;
- (id)_recentlyUsedSongAdamIDsFromCurationOptions:(id)a3;
- (id)_sanitizeGraphDataDictionaryForArchiving:(id)a3 referencedMemory:(id)a4;
- (id)_sharedLibraryStatistics:(id)a3;
- (id)_snapshotFilenameForLookupKey:(id)a3;
- (id)_socialGroupsDebugStatistics:(id)a3;
- (id)_socialGroupsDebugStringIncludingMeNode:(BOOL)a3 withGraph:(id)a4;
- (id)_socialGroupsDebugStringWithGraph:(id)a3;
- (id)_socialGroupsStatistics:(id)a3;
- (id)_sortedTextFeaturesFromTextFeatures:(id)a3;
- (id)_stringDescriptionForBusinessItemsWithGraph:(id)a3 includingInferredThroughPublicEvents:(BOOL)a4 verbose:(BOOL)a5;
- (id)_stringDescriptionForDisambiguatedLocationsWithGraph:(id)a3;
- (id)_stringDescriptionForDisambiguatedPOIsInMomentNodes:(id)a3;
- (id)_stringDescriptionForInterestingAreas:(id)a3;
- (id)_stringDescriptionForInterestingCities:(id)a3;
- (id)_stringDescriptionForLanguagesWithGraph:(id)a3;
- (id)_stringDescriptionForLocationsWithGraph:(id)a3;
- (id)_stringDescriptionForMeNode:(id)a3;
- (id)_stringDescriptionForMeaningfulEvents:(id)a3 isTrip:(BOOL)a4 forDiagnostics:(BOOL)a5 titleGenerationContext:(id)a6;
- (id)_stringDescriptionForMemoriesNotification;
- (id)_stringDescriptionForMusicWithGraph:(id)a3 summaryOnly:(BOOL)a4;
- (id)_stringDescriptionForPeopleEventsWithGraph:(id)a3;
- (id)_stringDescriptionForPetsWithGraph:(id)a3;
- (id)_stringDescriptionForPublicEventsWithGraph:(id)a3 verbose:(BOOL)a4;
- (id)_stringDescriptionForSocialGroups:(id)a3 includeImportance:(BOOL)a4;
- (id)_stringDescriptionForUrbanCities:(id)a3;
- (id)_summaryOfInferencesForMomentNodes:(id)a3 inGraph:(id)a4;
- (id)_titleStatisticsWithGraph:(id)a3 titleGenerationContext:(id)a4;
- (id)_yearsStatisticsForCurrentPhotoLibrary;
- (id)allSocialGroupsForMemberLocalIdentifier:(id)a3 options:(id)a4;
- (id)assetCollectionFingerprintsWithVersion:(int64_t)a3 forAssetCollections:(id)a4 withTransformers:(id)a5 error:(id *)a6;
- (id)assetCollectionsForPersonLocalIdentifiers:(id)a3;
- (id)assetFingerprintsWithVersion:(int64_t)a3 forAssets:(id)a4 withTransformers:(id)a5 error:(id *)a6;
- (id)assetIdentifiersForPersonLocalIdentifiers:(id)a3;
- (id)assetSearchKeywordsByMomentUUIDWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 progressReporter:(id)a5;
- (id)blockedFeatures;
- (id)clsPersonByContactIdentifierWithPersonContactIdentifiers:(id)a3 progressBlock:(id)a4;
- (id)curatedKeyAssetForAssetCollection:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 curationContext:(id)a6;
- (id)curationDebugInformationForAssetCollection:(id)a3 options:(id)a4 curationContext:(id)a5;
- (id)curationOfLength:(unint64_t)a3 forMemory:(id)a4 customDuration:(double)a5 useAssetEligibility:(BOOL)a6 curationContext:(id)a7;
- (id)defaultGraphExportFullPath;
- (id)defaultPeopleClustersExportIntermediatePath;
- (id)defaultSnapshotRootPath;
- (id)diagnosticsSummaryInfoOnExistingMemoriesForCurrentPhotoLibrary;
- (id)fastGraphExportFullPath;
- (id)graphAndAlgorithmVersionsWithGraph:(id)a3;
- (id)graphForLibraryFullAnalysisAtURL:(id)a3 alreadyIngestedMomentIdentifiers:(id *)a4 alreadyIngestedHighlightIdentifiers:(id *)a5 progressBlock:(id)a6 error:(id *)a7;
- (id)graphPersistenceParentDirectoryCandidateURLs;
- (id)graphPersistentStoreURL;
- (id)graphUpdateForContactsChangesWithProgressReporter:(id)a3;
- (id)highlightDebugInformationWithHighlight:(id)a3;
- (id)homeCircularRegions;
- (id)initForTesting;
- (id)instantiateMutableGraphWithError:(id *)a3;
- (id)keywordsForAsset:(id)a3 relatedType:(unint64_t)a4;
- (id)keywordsForAssetCollection:(id)a3 relatedType:(unint64_t)a4;
- (id)keywordsForMomentNodeName:(id)a3 relatedType:(unint64_t)a4;
- (id)libraryStatisticsForCurrentPhotoLibrary;
- (id)maximalSocialGroupsOverlappingMemberLocalIdentifiers:(id)a3;
- (id)memoryDebugInformationWithMoments:(id)a3 meaningLabels:(id)a4;
- (id)momentLocalIdentifiersInDateInterval:(id)a3 error:(id *)a4;
- (id)musicCurationInflationContextWithInflationOptions:(id)a3 error:(id *)a4;
- (id)musicCuratorContextWithCurationOptions:(id)a3 error:(id *)a4;
- (id)musicCuratorContextWithRecentlyUsedSongAdamIDs:(id)a3 error:(id *)a4;
- (id)newSearchComputationCache;
- (id)performerIdentifiersForMomentUUIDs:(id)a3;
- (id)processSubdirectoryName;
- (id)recentFrequentLocationRegions;
- (id)relatedDebugInformationBetweenAsset:(id)a3 andRelatedAssetCollection:(id)a4 relatedType:(unint64_t)a5 curationContext:(id)a6;
- (id)relatedDebugInformationBetweenReferenceAssetCollection:(id)a3 andRelatedAssetCollection:(id)a4 relatedType:(unint64_t)a5 curationContext:(id)a6;
- (id)relationshipInferencesForPersonLocalIdentifiers:(id)a3;
- (id)requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:(id)a3 error:(id *)a4;
- (id)requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier:(id)a3 error:(id *)a4;
- (id)requestGraleSemanticLabelPropagationWithError:(id *)a3;
- (id)searchKeywordsByEventWithUUIDs:(id)a3 ofType:(unint64_t)a4 progressReporter:(id)a5;
- (id)searchMetadataWithOptions:(id)a3 progressReporter:(id)a4;
- (id)searchSynonymsDictionariesWithProgressReporter:(id)a3;
- (id)searchableAssetUUIDsBySocialGroupWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 isFullAnalysis:(BOOL)a5 progressReporter:(id)a6;
- (id)sharingMessageSuggestionDebugInformationForAssetCollection:(id)a3;
- (id)sharingSuggestionDebugInformationForSuggestion:(id)a3;
- (id)snapshotOuputFilePathURLForKey:(id)a3;
- (id)socialGroupsOverlappingMemberLocalIdentifiers:(id)a3;
- (id)sortedArrayForPersonLocalIdentifiers:(id)a3;
- (id)statisticsWithTypeStrings:(id)a3;
- (id)suggestedContributionsForAssetsMetadata:(id)a3;
- (id)suggestedMomentLocalIdentifiersForPersonLocalIdentifiers:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (id)suggestedPersonsForHome;
- (id)suggestedPersonsForSharedLibraryContentInclusion;
- (id)suggestedPersonsForSharedLibraryParticipants;
- (id)suggestedRecipientsForAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 sharingOptions:(id)a5;
- (id)summaryOfInferencesPerMomentByLocalIdentifiers:(id)a3 error:(id *)a4;
- (id)summaryOfInferencesPerMomentInDateInterval:(id)a3 error:(id *)a4;
- (id)textFeaturesForMomentLocalIdentifiers:(id)a3;
- (id)titleTupleForAlbum:(id)a3 format:(int64_t)a4 error:(id *)a5;
- (id)titleTupleForAssetCollection:(id)a3 format:(int64_t)a4 error:(id *)a5;
- (id)titleTupleForMoment:(id)a3 format:(int64_t)a4 error:(id *)a5;
- (id)titleTupleForMomentList:(id)a3 format:(int64_t)a4 error:(id *)a5;
- (id)titleTupleForPersonLocalIdentifiers:(id)a3 format:(int64_t)a4 error:(id *)a5;
- (id)utilityAssetInformation;
- (id)workingContext;
- (id)workingContextForEnrichment;
- (id)workingContextForExternalRelevance;
- (id)workingContextForGraphConsistencyCheck;
- (id)workingContextForMemories;
- (id)workingContextForMetrics;
- (id)workingContextForRelated;
- (id)workingContextForSuggestions;
- (id)workingContextForUpNext;
- (id)zeroKeywordsWithOptions:(id)a3 progressReporter:(id)a4;
- (int64_t)performLibraryAnalysisWithGraphURL:(id)a3 withRecipe:(id)a4 processedGraphUpdate:(id *)a5 progressBlock:(id)a6;
- (int64_t)validatePHObject:(id)a3 featureAggregationValidator:(id)a4 assetFetchOptionPropertySet:(id)a5 error:(id *)a6;
- (int64_t)validatePHObject:(id)a3 graphRelationsFeatureValidator:(id)a4 error:(id *)a5;
- (unint64_t)_numberOfAssetsMatchingInternalPredicate:(id)a3;
- (unint64_t)_numberOfFamilyHolidayMomentsWithGraph:(id)a3;
- (unint64_t)_numberOfMomentsOverWeekendsWithGraph:(id)a3;
- (unint64_t)_numberOfNightOutMomentsWithGraph:(id)a3;
- (unint64_t)_sexHintForGivenNameOfContactForIdentifier:(id)a3 inGraph:(id)a4;
- (unint64_t)currentFullGraphRebuildStamp;
- (unint64_t)currentGraphVersion;
- (unint64_t)libraryAnalysisState;
- (unint64_t)medianValueFromUnsignedItegerArray:(id)a3;
- (unsigned)identifierForMoment:(id)a3;
- (void)_invalidatePersistentCaches;
- (void)_invalidatePersistentCachesBeforeDateWithTimestamp:(double)a3;
- (void)_invalidatePersistentCachesForGeoServiceProviderChange;
- (void)_invalidateTransientCaches;
- (void)_precachePersonsInformationFromGraph:(id)a3 progressBlock:(id)a4;
- (void)_unloadGraph;
- (void)_waitGraphUntilFinishedUsingBlock:(id)a3;
- (void)_waitLibraryUpdateUntilFinishedUsingBlock:(id)a3;
- (void)commonInitWithPhotoLibrary:(id)a3 progressBlock:(id)a4;
- (void)invalidatePersistentCaches;
- (void)invalidateTransientCaches;
- (void)legacyPerformAsynchronousBarrierGraphWriteUsingBlock:(id)a3;
- (void)loadGraphWithProgressBlock:(id)a3;
- (void)matchWithVisualFormat:(id)a3 elements:(id)a4 usingBlock:(id)a5;
- (void)matchWithVisualFormat:(id)a3 usingBlock:(id)a4;
- (void)notifyCoalescingBlocksGraphAnalysisFinished:(BOOL)a3 error:(id)a4;
- (void)performAsynchronousGraphBarrierUsingBlock:(id)a3;
- (void)performAsynchronousGraphWriteUsingBlock:(id)a3;
- (void)performAsynchronousNotification:(id)a3;
- (void)performFullLibraryAnalysisInGraph:(id)a3 withRecipe:(id)a4 withAlreadyIngestedMomentIdentifiers:(id)a5 alreadyIngestedHighlightIdentifiers:(id)a6 processedGraphUpdate:(id *)a7 progressBlock:(id)a8;
- (void)performSynchronousConcurrentGraphReadUsingBlock:(id)a3;
- (void)regenerateMemoriesOfCategory:(unint64_t)a3 progressReporter:(id)a4 completionBlock:(id)a5;
- (void)registerCoalescingBlockWhenGraphAnalysisFinishes:(id)a3;
- (void)reportMetricsLogWithConsistencyCheckResult:(id)a3 loggingConnection:(id)a4;
- (void)setGraph:(id)a3;
- (void)setGraphInfoDateOfLastIncrementalUpdateInvocationWithDate:(id)a3 completionBlock:(id)a4;
- (void)setGraphPersistentStoreURL:(id)a3;
- (void)setLibraryAnalysisState:(unint64_t)a3;
- (void)setMetadataSnapshotOutputPathURL:(id)a3;
- (void)setMusicBag:(id)a3;
- (void)setMutableGraph:(id)a3;
- (void)setRebuildProgress:(id)a3;
- (void)stampFullGraphRebuild;
- (void)startGraphUpdate:(id)a3 progressBlock:(id)a4 completionBlock:(id)a5;
- (void)startLibraryAnalysis:(id)a3 keepExistingGraph:(BOOL)a4 completionBlock:(id)a5;
- (void)startLibraryAnalysisWithRecipe:(id)a3 progressBlock:(id)a4 keepExistingGraph:(BOOL)a5 completionBlock:(id)a6;
- (void)unloadGraph;
- (void)updateGraphWithRecipe:(id)a3 keepExistingGraph:(BOOL)a4 progressBlock:(id)a5 completionBlock:(id)a6;
- (void)validateGraphConsistencyIfNeededWithProgressBlock:(id)a3;
- (void)waitUntilFinishedUsingBlock:(id)a3;
@end

@implementation PGManager

- (id)textFeaturesForMomentLocalIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__PGManager_Sharing__textFeaturesForMomentLocalIdentifiers___block_invoke;
  v11[3] = &unk_1E68F0960;
  id v12 = v4;
  v13 = self;
  id v6 = v5;
  id v14 = v6;
  id v7 = v4;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v11];
  v8 = v14;
  id v9 = v6;

  return v9;
}

void __60__PGManager_Sharing__textFeaturesForMomentLocalIdentifiers___block_invoke(id *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1[4], "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = a1[4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [MEMORY[0x1E4F391D0] uuidFromLocalIdentifier:*(void *)(*((void *)&v17 + 1) + 8 * v9)];
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  v11 = [v3 graph];
  id v12 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:v4 inGraph:v11];

  if ([v12 count])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__PGManager_Sharing__textFeaturesForMomentLocalIdentifiers___block_invoke_301;
    v15[3] = &unk_1E68EF578;
    v16 = a1[6];
    [v12 enumerateNodesUsingBlock:v15];
    v13 = v16;
  }
  else
  {
    v13 = [a1[5] suggestionsLoggingConnection];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = a1[4];
      *(_DWORD *)buf = 138412290;
      id v22 = v14;
      _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_DEFAULT, "Cannot get text features for moments %@ - no moment node found", buf, 0xCu);
    }
  }
}

void __60__PGManager_Sharing__textFeaturesForMomentLocalIdentifiers___block_invoke_301(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [PGTextFeatureGenerator alloc];
  id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
  uint64_t v6 = [v3 graph];
  uint64_t v7 = [(PGTextFeatureGenerator *)v4 initWithMomentNodes:v5 graph:v6];

  uint64_t v8 = [(PGTextFeatureGenerator *)v7 knowledgeFeatures];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14), "encodedData", (void)v18);
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  v16 = *(void **)(a1 + 32);
  long long v17 = [v3 localIdentifier];
  [v16 setObject:v9 forKeyedSubscript:v17];
}

- (id)recentFrequentLocationRegions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PGManager_Sharing__recentFrequentLocationRegions__block_invoke;
  v7[3] = &unk_1E68F0AF0;
  id v4 = v3;
  id v8 = v4;
  uint64_t v9 = self;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v7];
  id v5 = v4;

  return v5;
}

void __51__PGManager_Sharing__recentFrequentLocationRegions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 graph];
  id v5 = +[PGGraphNodeCollection nodesInGraph:v4];
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = [MEMORY[0x1E4F1C9C8] distantPast];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__PGManager_Sharing__recentFrequentLocationRegions__block_invoke_2;
  v18[3] = &unk_1E68E4D50;
  v18[4] = &v19;
  [v5 enumerateNodesUsingBlock:v18];
  uint64_t v6 = (void *)v20[5];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantPast];
  LOBYTE(v6) = [v6 isEqualToDate:v7];

  if ((v6 & 1) == 0)
  {
    id v8 = [(id)v20[5] dateByAddingTimeInterval:-7889400.0];
    id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v10 = (void *)[v9 initWithStartDate:v8 endDate:v20[5]];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__PGManager_Sharing__recentFrequentLocationRegions__block_invoke_3;
    v14[3] = &unk_1E68E4D78;
    id v11 = v10;
    id v15 = v11;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    id v16 = v12;
    uint64_t v17 = v13;
    [v5 enumerateNodesUsingBlock:v14];
  }
  _Block_object_dispose(&v19, 8);
}

void __51__PGManager_Sharing__recentFrequentLocationRegions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v7 = [a2 universalEndDate];
  uint64_t v4 = [v3 laterDate:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __51__PGManager_Sharing__recentFrequentLocationRegions__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 universalDateInterval];
  int v5 = [v4 intersectsDateInterval:*(void *)(a1 + 32)];

  if (v5)
  {
    uint64_t v6 = [v3 addressNode];
    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1E5A8]);
      [v6 coordinate];
      double v9 = v8;
      double v11 = v10;
      id v12 = [v6 description];
      uint64_t v13 = objc_msgSend(v7, "initWithCenter:radius:identifier:", v12, v9, v11, 150.0);

      [*(id *)(a1 + 40) addObject:v13];
    }
    else
    {
      uint64_t v14 = [*(id *)(a1 + 48) graphLoggingConnection];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        int v15 = 136315395;
        id v16 = "-[PGManager(Sharing) recentFrequentLocationRegions]_block_invoke_3";
        __int16 v17 = 2113;
        id v18 = v3;
        _os_log_fault_impl(&dword_1D1805000, v14, OS_LOG_TYPE_FAULT, "%s: frequent location skipped due to missing address node edge: %{private}@", (uint8_t *)&v15, 0x16u);
      }
    }
  }
}

- (id)homeCircularRegions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PGManager *)self serviceManager];
  if (!v4) {
    __assert_rtn("-[PGManager(Sharing) homeCircularRegions]", "PGManager+Sharing.m", 270, "serviceManager != nil");
  }
  int v5 = v4;
  uint64_t v6 = [v4 mePerson];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 countOfAddressesOfType:0];
    double v9 = [(PGManager *)self graphLoggingConnection];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[PGManager(Sharing) homeCircularRegions]";
      __int16 v20 = 2048;
      uint64_t v21 = v8;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_DEFAULT, "%s: Found %zu potential home addresses", buf, 0x16u);
    }

    double v10 = [(PGManager *)self locationCache];
    [v7 prefetchPersonAddressesIfNeededWithLocationCache:v10];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __41__PGManager_Sharing__homeCircularRegions__block_invoke;
    v16[3] = &unk_1E68E4D28;
    double v11 = v3;
    __int16 v17 = v11;
    [v7 enumerateAddressesOfType:0 asPlacemarkWithBlock:v16];
    id v12 = [(PGManager *)self graphLoggingConnection];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v11 count];
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[PGManager(Sharing) homeCircularRegions]";
      __int16 v20 = 2048;
      uint64_t v21 = v13;
      _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_DEFAULT, "%s: Created %zu home circular regions", buf, 0x16u);
    }

    uint64_t v14 = v17;
  }
  else
  {
    uint64_t v14 = [(PGManager *)self graphLoggingConnection];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = "-[PGManager(Sharing) homeCircularRegions]";
      _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_DEFAULT, "%s: No me person found, not returning any home circular regions", buf, 0xCu);
    }
  }

  return v3;
}

void __41__PGManager_Sharing__homeCircularRegions__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 region];
  [v2 addObject:v3];
}

- (id)suggestedMomentLocalIdentifiersForPersonLocalIdentifiers:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__PGManager_Sharing__suggestedMomentLocalIdentifiersForPersonLocalIdentifiers_withOptions_error___block_invoke;
  v13[3] = &unk_1E68E4D00;
  id v10 = v8;
  id v14 = v10;
  int v15 = &v23;
  id v16 = &v17;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v13];
  if (a5) {
    *a5 = (id) v18[5];
  }
  double v11 = [(id)v24[5] allObjects];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __97__PGManager_Sharing__suggestedMomentLocalIdentifiersForPersonLocalIdentifiers_withOptions_error___block_invoke(void *a1, void *a2)
{
  id v25 = [a2 graph];
  id v3 = +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForArrayOfLocalIdentifiers:inGraph:", a1[4]);
  if ([v3 count])
  {
    uint64_t v4 = [v3 momentNodes];
    uint64_t v5 = [v4 count];
    uint64_t v6 = *(void *)(a1[5] + 8);
    id v7 = *(void **)(v6 + 40);
    if (v5)
    {
      id v8 = [v4 localIdentifiers];
      [v7 unionSet:v8];

      id v9 = +[PGGraphHighlightTypeNodeCollection concludedTripTypeNodesInGraph:v25];
      id v10 = [v9 highlightGroupNodes];
      double v11 = [v4 highlightNodes];
      id v12 = [v11 highlightGroupNodes];

      uint64_t v13 = [v10 collectionByIntersecting:v12];
      id v14 = *(void **)(*(void *)(a1[5] + 8) + 40);
      int v15 = [v13 momentNodes];
      id v16 = [v15 localIdentifiers];
      [v14 unionSet:v16];
    }
    else
    {
      *(void *)(v6 + 40) = 0;

      id v22 = (void *)MEMORY[0x1E4F28C58];
      id v9 = [NSString stringWithFormat:@"No moment nodes found for persons with local identifiers: %@", a1[4]];
      uint64_t v23 = [v22 errorWithDescription:v9];
      uint64_t v24 = *(void *)(a1[6] + 8);
      id v10 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
  }
  else
  {
    uint64_t v17 = *(void *)(a1[5] + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0;

    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = [NSString stringWithFormat:@"No person nodes found for local identifiers: %@", a1[4]];
    uint64_t v20 = [v19 errorWithDescription:v4];
    uint64_t v21 = *(void *)(a1[6] + 8);
    id v9 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
}

- (BOOL)generateDefaultRulesForLibraryScopeWithLocalIdentifier:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PGManager *)self photoLibrary];
  double v11 = [v10 librarySpecificFetchOptions];
  id v12 = (void *)MEMORY[0x1E4F39110];
  v34[0] = v8;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  id v14 = [v12 fetchLibraryScopesWithLocalIdentifiers:v13 options:v11];

  int v15 = [v14 firstObject];
  if (v15)
  {
    id v16 = [MEMORY[0x1E4F39130] fetchLibraryScopeRulesForLibraryScope:v15 options:v11];
    if ([v16 count])
    {
      if (a5)
      {
        uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
        id v18 = [NSString stringWithFormat:@"Library scope already has existing rules: %@", v16];
        *a5 = [v17 errorWithDescription:v18];
      }
      char v19 = 0;
    }
    else
    {
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x3032000000;
      v31 = __Block_byref_object_copy_;
      v32 = __Block_byref_object_dispose_;
      id v33 = 0;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __95__PGManager_Sharing__generateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke;
      v25[3] = &unk_1E68E9F28;
      v27 = &v28;
      v25[4] = self;
      id v26 = v9;
      [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v25];
      if ([(id)v29[5] count])
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __95__PGManager_Sharing__generateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke_2;
        v22[3] = &unk_1E68F0BB8;
        id v23 = v15;
        uint64_t v24 = &v28;
        char v19 = [v10 performChangesAndWait:v22 error:a5];
      }
      else
      {
        char v19 = 1;
      }

      _Block_object_dispose(&v28, 8);
    }
    goto LABEL_13;
  }
  if (a5)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    id v16 = [NSString stringWithFormat:@"Cannot find library scope for identifier: %@", v8];
    [v20 errorWithDescription:v16];
    char v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  char v19 = 0;
LABEL_14:

  return v19;
}

void __95__PGManager_Sharing__generateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = [v3 graph];

  uint64_t v6 = [v4 defaultRulesWithOptions:v5 graph:v9];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __95__PGManager_Sharing__generateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F39118] changeRequestForLibraryScope:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 32) autoSharePolicy] != 2) {
    [v2 setAutoSharePolicy:2];
  }
  [v2 updateWithCustomRules:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (id)suggestedContributionsForAssetsMetadata:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (char *)a3;
  uint64_t v5 = [(PGManager *)self suggestionsLoggingConnection];
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = v5;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  id v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SuggestedContribution", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v11 = mach_absolute_time();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    uint64_t v30 = v4;
    _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Asking for contributions for metadata: %{private}@", buf, 0xCu);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __62__PGManager_Sharing__suggestedContributionsForAssetsMetadata___block_invoke;
  v23[3] = &unk_1E68F0898;
  uint64_t v24 = v4;
  id v12 = v10;
  id v25 = v12;
  id v26 = self;
  id v13 = v6;
  id v27 = v13;
  id v14 = v4;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v23];
  uint64_t v15 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v18 = v12;
  char v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v19, OS_SIGNPOST_INTERVAL_END, v8, "SuggestedContribution", "", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v30 = "SuggestedContribution";
    __int16 v31 = 2048;
    double v32 = (float)((float)((float)((float)(v15 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  uint64_t v20 = v27;
  id v21 = v13;

  return v21;
}

void __62__PGManager_Sharing__suggestedContributionsForAssetsMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 graph];
  uint64_t v4 = +[PGShareBackSuggesterInput suggesterInputsWithDictionaries:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 48) photoLibrary];
  uint64_t v7 = +[PGShareBackSuggester shareBackSuggesterForCMMWithLoggingConnection:v5 photoLibrary:v6 graph:v3];

  id v76 = 0;
  os_signpost_id_t v8 = [v7 suggesterResultsForUnclusteredSuggesterInputs:v4 inGraph:v3 error:&v76];
  id v9 = v76;
  id v10 = +[PGShareBackSuggesterResult momentNodesForSuggesterResults:v8];
  uint64_t v11 = (void *)[v10 mutableCopy];

  if ((unint64_t)[v11 count] < 2)
  {
    v58 = v7;
  }
  else
  {
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F8A780]) initWithDistanceBlock:&__block_literal_global_1066];
    [v12 setMaximumDistance:864000.0];
    [v12 setMinimumNumberOfObjects:2];
    id v13 = [v11 allObjects];
    id v14 = [v12 performWithDataset:v13 progressBlock:0];

    if (![v14 count])
    {
      __int16 v31 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v82 = v11;
        _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] None of the matched moment nodes were contiguous: %{private}@", buf, 0xCu);
      }
      goto LABEL_26;
    }
    v56 = v3;
    v58 = v7;
    id v51 = v9;
    v52 = v4;
    v53 = (void *)[v11 mutableCopy];
    uint64_t v15 = objc_opt_new();
    id v16 = v11;
    uint64_t v11 = (void *)v15;

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v17 = v14;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v72 objects:v80 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v73 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = [*(id *)(*((void *)&v72 + 1) + 8 * i) objects];
          [v11 addObjectsFromArray:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v72 objects:v80 count:16];
      }
      while (v19);
    }

    [v53 minusSet:v11];
    if ([v53 count])
    {
      id v23 = *(NSObject **)(a1 + 40);
      id v3 = v56;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v82 = v53;
        _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Discarding non contiguous moments: %{private}@", buf, 0xCu);
      }

      id v9 = v51;
      uint64_t v4 = v52;
      uint64_t v7 = v58;
LABEL_26:

      goto LABEL_27;
    }
    v55 = v8;
    id v32 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v33 = v11;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v68 objects:v79 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v69 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v68 + 1) + 8 * j);
          if ([v38 isPartOfTrip])
          {
            v39 = [v38 highlightGroupNode];
            [v32 addObject:v39];
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v68 objects:v79 count:16];
      }
      while (v35);
    }
    v59 = v33;

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v40 = v32;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v64 objects:v78 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v65;
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v65 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = *(void **)(*((void *)&v64 + 1) + 8 * k);
          unint64_t v46 = [v40 countForObject:v45];
          if (v46 >= 2)
          {
            unint64_t v47 = v46;
            v48 = [v45 eventEnrichmentMomentNodes];
            if ([v48 count] > v47)
            {
              v49 = *(NSObject **)(a1 + 40);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                v82 = v45;
                _os_log_impl(&dword_1D1805000, v49, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Adding moment nodes from trip %{private}@", buf, 0xCu);
              }
              v50 = [v48 temporarySet];
              [v59 unionSet:v50];
            }
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v64 objects:v78 count:16];
      }
      while (v42);
    }

    os_signpost_id_t v8 = v55;
    id v3 = v56;
    id v9 = v51;
    uint64_t v4 = v52;
    uint64_t v11 = v59;
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v12 = v11;
  uint64_t v24 = [v12 countByEnumeratingWithState:&v60 objects:v77 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    v54 = v8;
    v57 = v3;
    id v26 = v9;
    uint64_t v27 = *(void *)v61;
    do
    {
      for (uint64_t m = 0; m != v25; ++m)
      {
        if (*(void *)v61 != v27) {
          objc_enumerationMutation(v12);
        }
        v29 = *(void **)(a1 + 56);
        uint64_t v30 = [*(id *)(*((void *)&v60 + 1) + 8 * m) localIdentifier];
        [v29 addObject:v30];
      }
      uint64_t v25 = [v12 countByEnumeratingWithState:&v60 objects:v77 count:16];
    }
    while (v25);
    uint64_t v11 = v12;
    id v3 = v57;
    uint64_t v7 = v58;
    id v9 = v26;
    os_signpost_id_t v8 = v54;
  }
  else
  {
    uint64_t v11 = v12;
    uint64_t v7 = v58;
  }
LABEL_27:
}

void __62__PGManager_Sharing__suggestedContributionsForAssetsMetadata___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 universalStartDate];
  uint64_t v6 = [v4 universalStartDate];

  [v5 timeIntervalSinceDate:v6];
}

- (id)suggestedRecipientsForAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 sharingOptions:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (char *)a5;
  uint64_t v11 = [(PGManager *)self suggestionsLoggingConnection];
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  id v13 = v11;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SuggestedRecipientsForAssetLocalIdentifiers", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v25 = mach_absolute_time();
  uint64_t v15 = [(PGManager *)self workingContextForSuggestions];
  id v16 = [[PGSharingManager alloc] initWithWorkingContext:v15];
  id v17 = [(PGManager *)self suggestionsLoggingConnection];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v28 = v10;
    __int16 v29 = 2112;
    double v30 = *(double *)&v8;
    __int16 v31 = 2112;
    id v32 = v9;
    _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Asking for recipient suggestions from options %@, for assets %@ moments %@", buf, 0x20u);
  }

  uint64_t v18 = [(PGSharingManager *)v16 suggestionResultsForAssetLocalIdentifiers:v8 momentLocalIdentifiers:v9 options:v10];
  uint64_t v19 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v22 = v14;
  id v23 = v22;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v23, OS_SIGNPOST_INTERVAL_END, v12, "SuggestedRecipientsForAssetLocalIdentifiers", "", buf, 2u);
  }

  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v28 = "SuggestedRecipientsForAssetLocalIdentifiers";
    __int16 v29 = 2048;
    double v30 = (float)((float)((float)((float)(v19 - v25) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v18;
}

+ (id)defaultRulesWithOptions:(id)a3 graph:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [v4 partners];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) localIdentifier];
        if ([v11 length])
        {
          os_signpost_id_t v12 = [MEMORY[0x1E4F391F0] uuidFromLocalIdentifier:v11];
          id v13 = objc_alloc_init(MEMORY[0x1E4F39128]);
          [v13 setCriteria:1];
          id v21 = v12;
          id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
          [v13 setPersonUUIDs:v14];

          id v15 = objc_alloc_init(MEMORY[0x1E4F39130]);
          [v15 addCondition:v13];
          [v5 addObject:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)regenerateMemoriesOfCategory:(unint64_t)a3 progressReporter:(id)a4 completionBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__PGManager_MemoriesPrivate__regenerateMemoriesOfCategory_progressReporter_completionBlock___block_invoke;
  v12[3] = &unk_1E68E4E40;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = a3;
  id v10 = v9;
  id v11 = v8;
  [(PGManager *)self performAsynchronousGraphWriteUsingBlock:v12];
}

void __92__PGManager_MemoriesPrivate__regenerateMemoriesOfCategory_progressReporter_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v9 = 0;
  uint64_t v5 = [v4 instantiateMutableGraphWithError:&v9];
  id v6 = v9;
  if (v5)
  {
    [v5 enableInTransactionCheck];
    [v5 enterBatch];
    uint64_t v7 = [[PGGraphBuilder alloc] initWithGraph:v5 manager:v3];
    id v8 = [*(id *)(a1 + 40) childProgressReporterFromStart:0.1 toEnd:1.0];
    +[PGGraphIngestMemoryProcessor regenerateMemoriesOfCategory:*(void *)(a1 + 56) withGraphBuilder:v7 progressReporter:v8];
    [v5 leaveBatch];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_fallbackCurationOfLength:(unint64_t)a3 forMemory:(id)a4 customDuration:(double)a5 curationContext:(id)a6
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  os_signpost_id_t v12 = [(PGManager *)self photoLibrary];
  id v13 = v12;
  if (a3 == 2)
  {
    id v14 = [v12 librarySpecificFetchOptions];
    v88[0] = *MEMORY[0x1E4F394A8];
    unint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:1];
    [v14 setFetchPropertySets:v15];

    id v16 = [MEMORY[0x1E4F38EB8] fetchCuratedAssetsInAssetCollection:v10 options:v14];
    long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v80 objects:v87 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v81 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = [*(id *)(*((void *)&v80 + 1) + 8 * i) uuid];
          [v17 addObject:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v80 objects:v87 count:16];
      }
      while (v20);
    }
    uint64_t v24 = v18;
  }
  else
  {
    uint64_t v25 = [(PGManager *)self curationManager];
    id v26 = [v13 librarySpecificFetchOptions];
    uint64_t v86 = *MEMORY[0x1E4F394A8];
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
    [v26 setFetchPropertySets:v27];

    long long v70 = v25;
    id v18 = [v25 defaultAssetFetchOptionsForMemories];
    id v68 = v10;
    long long v66 = v26;
    if (a3 != 1 && (a3 || a5 >= 60.0))
    {
      uint64_t v28 = [MEMORY[0x1E4F38EB8] fetchExtendedCuratedAssetsInAssetCollection:v10 options:v18];
      uint64_t v29 = [MEMORY[0x1E4F38EB8] fetchCuratedAssetsInAssetCollection:v10 options:v26];
    }
    else
    {
      uint64_t v28 = [MEMORY[0x1E4F38EB8] fetchCuratedAssetsInAssetCollection:v10 options:v18];
      uint64_t v29 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v10 options:v26];
    }
    double v30 = (void *)v29;
    id v31 = objc_alloc(MEMORY[0x1E4F1C978]);
    long long v65 = v28;
    id v32 = [v28 fetchedObjects];
    uint64_t v33 = [v31 initWithArray:v32];

    uint64_t v34 = [v11 curationSession];
    [v34 prepareAssets:v33];

    +[PGGraphBuilder topTierAestheticScoreForRatio:v13 inPhotoLibrary:0.01];
    +[PGMemoryGenerationHelper prepareAssets:forMemoriesWithTopTierAestheticScore:curationContext:](PGMemoryGenerationHelper, "prepareAssets:forMemoriesWithTopTierAestheticScore:curationContext:", v33, v11);
    id v35 = objc_alloc(MEMORY[0x1E4F39150]);
    uint64_t v36 = (void *)MEMORY[0x1E4F1CAD0];
    v37 = [v18 fetchPropertySets];
    v38 = [v36 setWithArray:v37];
    long long v64 = (void *)v33;
    long long v71 = v13;
    uint64_t v39 = [v35 initWithObjects:v33 photoLibrary:v13 fetchType:0 fetchPropertySets:v38 identifier:0 registerIfNeeded:0];

    long long v63 = (void *)v39;
    long long v69 = (void *)[objc_alloc(MEMORY[0x1E4F76CF0]) initWithAssetFetchResult:v39 curationContext:v11];
    id v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v30, "count"));
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v41 = v30;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v76 objects:v85 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v77;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v77 != v44) {
            objc_enumerationMutation(v41);
          }
          unint64_t v46 = [*(id *)(*((void *)&v76 + 1) + 8 * j) uuid];
          [v40 addObject:v46];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v76 objects:v85 count:16];
      }
      while (v43);
    }

    uint64_t v47 = [(PGManager *)self memoriesLoggingConnection];
    v48 = objc_alloc_init(PGCurator_PHAsset);
    [(PGCurator *)v48 setLoggingConnection:v47];
    +[PGGraphLocationHelper inefficientLocationHelper];
    long long v60 = v67 = v11;
    v59 = [[PGMemoryCurationSession alloc] initWithCurationManager:v70 photoLibrary:v71 curationContext:v11 locationHelper:v60];
    long long v62 = (void *)v47;
    v58 = [[PGMemoryGenerator alloc] initWithMemoryCurationSession:v59 loggingConnection:v47];
    v49 = [(PGMemoryGenerator *)v58 baseCurationOptionsWithRequiredAssetUUIDs:v40 eligibleAssetUUIDs:0];
    [v49 setUseDurationBasedCuration:1];
    [v49 setMinimumDuration:0.0];
    [(PGManager *)self targetCurationDurationWithCurationLength:a3 customDuration:a5];
    objc_msgSend(v49, "setTargetDuration:");
    [v49 setFailIfMinimumDurationNotReached:0];
    long long v61 = v48;
    v50 = [(PGCurator_PHAsset *)v48 bestAssetsForFeeder:v69 options:v49 debugInfo:0 progressBlock:&__block_literal_global_1325];
    long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v50, "count"));
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v51 = v50;
    uint64_t v52 = [v51 countByEnumeratingWithState:&v72 objects:v84 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v73;
      do
      {
        for (uint64_t k = 0; k != v53; ++k)
        {
          if (*(void *)v73 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = [*(id *)(*((void *)&v72 + 1) + 8 * k) uuid];
          [v17 addObject:v56];
        }
        uint64_t v53 = [v51 countByEnumeratingWithState:&v72 objects:v84 count:16];
      }
      while (v53);
    }

    id v11 = v67;
    id v10 = v68;
    id v14 = v70;
    id v13 = v71;
    uint64_t v24 = v66;
  }

  return v17;
}

- (id)curationOfLength:(unint64_t)a3 forMemory:(id)a4 customDuration:(double)a5 useAssetEligibility:(BOOL)a6 curationContext:(id)a7
{
  BOOL v8 = a6;
  v70[1] = *MEMORY[0x1E4F143B8];
  id v44 = a4;
  id v42 = a7;
  uint64_t v43 = [(PGManager *)self photoLibrary];
  if ([(PGManager *)self isReady])
  {
    context = (void *)MEMORY[0x1D25FED50]();
    id v11 = [v43 librarySpecificFetchOptions];
    v70[0] = *MEMORY[0x1E4F394A8];
    os_signpost_id_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
    [v11 setFetchPropertySets:v12];

    [v11 setIncludeGuestAssets:1];
    id v13 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v44 options:v11];
    uint64_t v39 = [v13 firstObject];

    if (v8)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      unint64_t v15 = objc_msgSend(MEMORY[0x1E4F38EB8], "fetchExtendedCuratedAssetsInAssetCollection:options:", v44, v11, v39);
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      char v16 = 0;
      uint64_t v17 = [v15 countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v58 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            uint64_t v21 = [v20 uuid];
            [v14 addObject:v21];

            if (v16) {
              char v16 = 1;
            }
            else {
              char v16 = [v20 isGuestAsset];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v57 objects:v69 count:16];
        }
        while (v17);
      }
    }
    else
    {
      char v16 = 0;
      id v14 = 0;
    }

    id v26 = [(PGManager *)self curationManager];
    uint64_t v27 = [(PGManager *)self serviceManager];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    long long v66 = __Block_byref_object_copy__1328;
    id v67 = __Block_byref_object_dispose__1329;
    id v68 = 0;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __101__PGManager_Memories__curationOfLength_forMemory_customDuration_useAssetEligibility_curationContext___block_invoke;
    v45[3] = &unk_1E68E4E18;
    v45[4] = self;
    id v28 = v44;
    id v46 = v28;
    unint64_t v54 = a3;
    double v55 = a5;
    id v29 = v26;
    id v47 = v29;
    id v48 = v43;
    id v30 = v42;
    id v49 = v30;
    id v31 = v27;
    id v50 = v31;
    uint64_t v53 = buf;
    id v32 = v39;
    id v51 = v32;
    id v33 = v14;
    id v52 = v33;
    char v56 = v16;
    [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v45];
    if ([*(id *)(*(void *)&buf[8] + 40) count])
    {
      id v34 = *(id *)(*(void *)&buf[8] + 40);
    }
    else
    {
      id v35 = [(PGManager *)self workingContext];
      uint64_t v36 = [v35 loggingConnection];

      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = [v28 uuid];
        *(_DWORD *)long long v61 = 136315394;
        long long v62 = "-[PGManager(Memories) curationOfLength:forMemory:customDuration:useAssetEligibility:curationContext:]";
        __int16 v63 = 2112;
        long long v64 = v37;
        _os_log_impl(&dword_1D1805000, v36, OS_LOG_TYPE_DEFAULT, "%s using fallback curation for memory uuid %@, as memory specific enrichment failed", v61, 0x16u);
      }
      id v34 = [(PGManager *)self _fallbackCurationOfLength:a3 forMemory:v28 customDuration:v30 curationContext:a5];
    }
    uint64_t v25 = v34;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v22 = [(PGManager *)self workingContext];
    uint64_t v23 = [v22 loggingConnection];

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [v44 uuid];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[PGManager(Memories) curationOfLength:forMemory:customDuration:useAssetEligibility:curationContext:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_DEFAULT, "%s using fallback curation for memory uuid %@, graph is not ready", buf, 0x16u);
    }
    uint64_t v25 = [(PGManager *)self _fallbackCurationOfLength:a3 forMemory:v44 customDuration:v42 curationContext:a5];
  }

  return v25;
}

void __101__PGManager_Memories__curationOfLength_forMemory_customDuration_useAssetEligibility_curationContext___block_invoke(uint64_t a1, void *a2)
{
  id v31 = [a2 graph];
  id v29 = [*(id *)(a1 + 32) _momentNodesFromMemory:*(void *)(a1 + 40) inGraph:v31];
  id v3 = [*(id *)(a1 + 40) photosGraphProperties];
  id v30 = [v3 objectForKeyedSubscript:@"encodedFeatures"];

  id v4 = [*(id *)(a1 + 40) photosGraphProperties];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"memoryCategorySubcategory"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = [*(id *)(a1 + 32) _featureNodesForEncodedFeatures:v30 inGraph:v31];
  BOOL v8 = [*(id *)(a1 + 40) photosGraphProperties];
  id v9 = [v8 objectForKeyedSubscript:@"generatedWithFallbackRequirements"];
  char v10 = [v9 BOOLValue];

  id v11 = [PGTriggeredMemory alloc];
  uint64_t v12 = [*(id *)(a1 + 40) category];
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  id v14 = [*(id *)(a1 + 40) graphMemoryIdentifier];
  LOBYTE(v28) = v10;
  unint64_t v15 = [(PGTriggeredMemory *)v11 initWithMemoryCategory:v12 memoryCategorySubcategory:v6 memoryMomentNodes:v29 memoryFeatureNodes:v7 validityIntervalByTriggerType:MEMORY[0x1E4F1CC08] creationDate:v13 uniqueMemoryIdentifier:v14 generatedWithFallbackRequirements:v28];

  [*(id *)(a1 + 32) targetCurationDurationWithCurationLength:*(void *)(a1 + 104) customDuration:*(double *)(a1 + 112)];
  double v17 = v16;
  uint64_t v18 = [[PGGraphLocationHelper alloc] initWithGraph:v31];
  uint64_t v19 = [[PGMemoryCurationSession alloc] initWithCurationManager:*(void *)(a1 + 48) photoLibrary:*(void *)(a1 + 56) curationContext:*(void *)(a1 + 64) locationHelper:v18];
  uint64_t v20 = [[PGEnrichedMemoryFactory alloc] initWithMemoryCurationSession:v19 graph:v31 serviceManager:*(void *)(a1 + 72)];
  uint64_t v21 = *(void *)(a1 + 80);
  uint64_t v22 = *(void *)(a1 + 88);
  uint64_t v23 = *(unsigned __int8 *)(a1 + 120);
  uint64_t v24 = [MEMORY[0x1E4F71F08] ignoreProgress];
  uint64_t v25 = [(PGEnrichedMemoryFactory *)v20 curatedAssetUUIDsWithTriggeredMemory:v15 keyAsset:v21 extendedCuratedAssetUUIDs:v22 targetCurationDuration:v23 allowGuestAsset:v24 progressReporter:v17];
  uint64_t v26 = *(void *)(*(void *)(a1 + 96) + 8);
  uint64_t v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v25;
}

- (double)targetCurationDurationWithCurationLength:(unint64_t)a3 customDuration:(double)result
{
  if (a3)
  {
    if (a3 == 4)
    {
      return 90.0;
    }
    else
    {
      result = 60.0;
      if (a3 == 1) {
        return 40.0;
      }
    }
  }
  return result;
}

- (id)_featureNodesForEncodedFeatures:(id)a3 inGraph:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F71E60]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v14 = [PGFeature alloc];
          unint64_t v15 = -[PGFeature initWithEncodedFeature:](v14, "initWithEncodedFeature:", v13, (void)v20);
          double v16 = [(PGFeature *)v15 nodeInGraph:v6];
          double v17 = v16;
          if (v16) {
            objc_msgSend(v7, "addIdentifier:", objc_msgSend(v16, "identifier"));
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    uint64_t v18 = [(MAElementCollection *)[PGGraphFeatureNodeCollection alloc] initWithGraph:v6 elementIdentifiers:v7];
  }
  else
  {
    uint64_t v18 = [(MAElementCollection *)[PGGraphFeatureNodeCollection alloc] initWithGraph:v6];
  }

  return v18;
}

- (id)_momentNodesFromMemory:(id)a3 inGraph:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 photoLibrary];
  id v8 = [v7 librarySpecificFetchOptions];

  uint64_t v9 = [MEMORY[0x1E4F39160] fetchMomentsBackingMemory:v5 options:v8];
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "uuid", (void)v19);
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  double v17 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:v10 inGraph:v6];

  return v17;
}

- (void)validateGraphConsistencyIfNeededWithProgressBlock:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PGManager *)self graphConsistencyCheckLoggingConnection];
  if ([(PGManager *)self shouldValidateGraphConsistency])
  {
    uint64_t v25 = 0;
    uint64_t v26 = (double *)&v25;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = __Block_byref_object_copy__3735;
    id v29 = __Block_byref_object_dispose__3736;
    id v30 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __76__PGManager_Consistency__validateGraphConsistencyIfNeededWithProgressBlock___block_invoke;
    v21[3] = &unk_1E68E6A70;
    v21[4] = self;
    uint64_t v24 = &v25;
    id v23 = v4;
    id v6 = v5;
    long long v22 = v6;
    [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v21];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = v26[5];
      *(_DWORD *)buf = 138412290;
      double v32 = v7;
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_INFO, "[PGManager+Consistency] Graph consistency check: %@", buf, 0xCu);
    }
    uint64_t v8 = *((void *)v26 + 5);
    if (!v8) {
      goto LABEL_13;
    }
    uint64_t v9 = [(PGManager *)self graphConsistencyCheckLoggingConnection];
    [(PGManager *)self reportMetricsLogWithConsistencyCheckResult:v8 loggingConnection:v9];

    [*((id *)v26 + 5) overallSimilarityScore];
    double v11 = v10;
    +[PGUserDefaults graphConsistencyPercentageThresholdForTTR];
    double v13 = v12;
    BOOL v14 = +[PGUserDefaults graphConsistencyNotificationIsEnabled];
    if (v11 < v13 && v14)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v32 = v11;
        __int16 v33 = 2048;
        double v34 = v13;
        _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "[PGManager+Consistency] Graph consistency score %.2f bellow %.2f: prompting user to file a radar.", buf, 0x16u);
      }
      double v16 = [NSString stringWithFormat:@"an incremental graph rebuild inconsistency was detected"];
      double v17 = v11 * 100.0;
      uint64_t v18 = [NSString stringWithFormat:@"[Graph] %@ - %.2f%% consistent", v16, *(void *)&v17];
      long long v19 = [NSString stringWithFormat:@"The last incrementally updated graph is %.2f%% consistent with the fully rebuilt one. Please file a radar to help diagnose consistency issues.", *(void *)&v17];
      long long v20 = [NSString stringWithFormat:@"%@\n\n%@\n\nDetails per domain:\n%@", v18, v19, *((void *)v26 + 5)];
      [MEMORY[0x1E4F8A7D0] tapToRadarWithTitle:v18 description:v20 radarComponent:1 isUserInitiated:0 displayReason:v16 attachments:MEMORY[0x1E4F1CBF0]];
    }
    else
    {
LABEL_13:
      [(PGManager *)self destroyValidationGraph];
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    [(PGManager *)self destroyValidationGraph];
  }
}

void __76__PGManager_Consistency__validateGraphConsistencyIfNeededWithProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) graphPersistenceParentDirectoryURL];
  id v5 = +[PGGraph graphURLForName:@"validation-photosgraph" parentDirectoryURL:v4];
  id v15 = 0;
  id v6 = [(MAGraph *)[PGGraph alloc] initWithPersistentStoreURL:v5 options:4 error:&v15];
  id v7 = v15;
  if (v6)
  {
    uint64_t v8 = [v3 graph];
    uint64_t v9 = objc_opt_class();
    double v10 = [*(id *)(a1 + 32) graphConsistencyCheckLoggingConnection];
    uint64_t v11 = [v9 consistencyCheckResultOfGraph:v6 andGraph:v8 loggingConnection:v10 progressBlock:*(void *)(a1 + 48)];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    double v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    BOOL v14 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "[PGManager+Consistency] Failed to load validation graph: %@", buf, 0xCu);
    }
  }
}

- (void)reportMetricsLogWithConsistencyCheckResult:(id)a3 loggingConnection:(id)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(PGManager *)self analytics];

    if (v8)
    {
      [v6 overallSimilarityScore];
      double v10 = v9;
      uint64_t v11 = [(PGManager *)self analytics];
      v18[0] = @"graphSchemaVersion";
      v18[1] = @"type";
      v19[0] = &unk_1F28D06A8;
      v19[1] = @"overall";
      v18[2] = @"similarityScore";
      uint64_t v12 = [NSNumber numberWithDouble:v10];
      v19[2] = v12;
      double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
      [v11 sendEvent:@"com.apple.Photos.Intelligence.GraphConsistency" withPayload:v13];

      objc_initWeak(&location, self);
      BOOL v14 = [v6 similarityScoreByDomain];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __87__PGManager_Consistency__reportMetricsLogWithConsistencyCheckResult_loggingConnection___block_invoke;
      v15[3] = &unk_1E68E51C0;
      objc_copyWeak(&v16, &location);
      [v14 enumerateKeysAndObjectsUsingBlock:v15];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location) = 0;
      _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "[PGManager+Consistency] Core Analytics is nil", (uint8_t *)&location, 2u);
    }
  }
}

void __87__PGManager_Consistency__reportMetricsLogWithConsistencyCheckResult_loggingConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PGGraphDomainToString((unsigned __int16)[a2 unsignedIntValue]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = [WeakRetained analytics];
  v10[0] = @"graphSchemaVersion";
  v10[1] = @"type";
  v11[0] = &unk_1F28D06A8;
  v11[1] = v6;
  v10[2] = @"similarityScore";
  v11[2] = v5;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  [v8 sendEvent:@"com.apple.Photos.Intelligence.GraphConsistency" withPayload:v9];
}

- (BOOL)destroyValidationGraph
{
  id v2 = [(PGManager *)self graphPersistenceParentDirectoryURL];
  id v3 = +[PGGraph graphURLForName:@"validation-photosgraph" parentDirectoryURL:v2];
  uint64_t v6 = 0;
  BOOL v4 = +[MAGraph destroyPersistentStoreAtURL:v3 error:&v6];

  return v4;
}

- (BOOL)shouldValidateGraphConsistency
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(PGManager *)self graphConsistencyCheckLoggingConnection];
  if ([(id)objc_opt_class() graphConsistencyCheckIsEnabled])
  {
    BOOL v4 = @"validation-photosgraph";
    id v5 = [(PGManager *)self graphPersistenceParentDirectoryURL];
    uint64_t v6 = +[PGGraph graphURLForName:@"validation-photosgraph" parentDirectoryURL:v5];
    if ([(PGManager *)self isReady])
    {
      id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v8 = [v6 path];
      char v9 = [v7 fileExistsAtPath:v8];

      if (v9)
      {
        id v18 = 0;
        double v10 = [(MAGraph *)[PGGraph alloc] initWithPersistentStoreURL:v6 options:4 error:&v18];
        id v11 = v18;
        if (v10)
        {
          uint64_t v12 = [(PGGraph *)v10 infoNode];
          double v13 = [v12 dateOfLastIncrementalUpdateInvocation];
          if (v13
            && ([MEMORY[0x1E4F1C9A8] currentCalendar],
                BOOL v14 = objc_claimAutoreleasedReturnValue(),
                char v15 = [v14 isDateInToday:v13],
                v14,
                (v15 & 1) != 0))
          {
            BOOL v16 = 1;
          }
          else
          {
            if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v20 = v13;
              _os_log_impl(&dword_1D1805000, v3, OS_LOG_TYPE_INFO, "Skipping graph consistency check: Graph was last updated on %@", buf, 0xCu);
            }
            BOOL v16 = 0;
          }
        }
        else
        {
          if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v20 = v11;
            _os_log_error_impl(&dword_1D1805000, v3, OS_LOG_TYPE_ERROR, "[PGManager+Consistency] Skipping graph consistency check: Failed to load the validation graph: %@", buf, 0xCu);
          }
          BOOL v16 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1805000, v3, OS_LOG_TYPE_INFO, "[PGManager+Consistency] Skipping graph consistency check: No validation graph available", buf, 2u);
        }
        BOOL v16 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v3, OS_LOG_TYPE_INFO, "[PGManager+Consistency] Skipping graph consistency check: manager is not ready", buf, 2u);
      }
      BOOL v16 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v3, OS_LOG_TYPE_INFO, "[PGManager+Consistency] Skipping graph consistency check: default disabled", buf, 2u);
    }
    BOOL v16 = 0;
  }

  return v16;
}

+ (id)consistencyIgnoredNodeDomainCodes
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = [NSNumber numberWithUnsignedShort:21];
  v6[0] = v2;
  id v3 = [NSNumber numberWithUnsignedShort:302];
  v6[1] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)consistencyIgnoredNodeDomainClasses
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  v10[0] = v4;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v8 = [v2 setWithArray:v7];

  return v8;
}

+ (id)_nodesOfClass:(id)a3 matchingNodes:(id)a4 inGraph:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__3735;
  uint64_t v24 = __Block_byref_object_dispose__3736;
  uint64_t v25 = [(MAElementCollection *)[PGGraphNodeCollection alloc] initWithGraph:v10];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__PGManager_Consistency___nodesOfClass_matchingNodes_inGraph___block_invoke;
  v15[3] = &unk_1E68E5288;
  id v19 = a1;
  id v11 = v8;
  id v16 = v11;
  id v12 = v10;
  id v17 = v12;
  id v18 = &v20;
  [v9 enumerateNodesUsingBlock:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __62__PGManager_Consistency___nodesOfClass_matchingNodes_inGraph___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v7 = [(id)objc_opt_class() nodesOfClass:a1[4] matchingNode:v3 inGraph:a1[5]];

  uint64_t v4 = [*(id *)(*(void *)(a1[6] + 8) + 40) collectionByFormingUnionWith:v7];
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

+ (id)nodesOfClass:(id)a3 matchingNode:(id)a4 inGraph:(id)a5
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  int v12 = [v9 isEqualToString:v11];

  if (v12)
  {
    id v13 = objc_opt_class();
    BOOL v14 = (objc_class *)objc_opt_class();
    char v15 = NSStringFromClass(v14);
    id v16 = [v7 collection];
    id v17 = [v16 ownerNodes];
    id v18 = [v13 _nodesOfClass:v15 matchingNodes:v17 inGraph:v8];

    id v19 = objc_alloc(MEMORY[0x1E4F71E90]);
    uint64_t v20 = +[PGGraphIsOwnedByEdge filter];
    uint64_t v21 = [v20 inRelation];
    v31[0] = v21;
    id v22 = objc_alloc(MEMORY[0x1E4F71F00]);
    id v23 = [v7 label];
    uint64_t v24 = objc_msgSend(v22, "initWithLabel:domain:", v23, objc_msgSend(v7, "domain"));
    uint64_t v25 = [v24 relation];
    v31[1] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    uint64_t v27 = (void *)[v19 initWithSteps:v26];

    uint64_t v28 = +[MANodeCollection nodesRelatedToNodes:v18 withRelation:v27];
  }
  else
  {
    id v29 = [v7 entityFilter];
    uint64_t v28 = +[MANodeCollection nodesMatchingFilter:v29 inGraph:v8];
  }
  return v28;
}

+ (id)nodesByClassFromGraph:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [a1 consistencyIgnoredNodeDomainClasses];
  id v8 = [MEMORY[0x1E4F71F00] any];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__PGManager_Consistency__nodesByClassFromGraph___block_invoke;
  v14[3] = &unk_1E68EE048;
  id v15 = v7;
  id v9 = v6;
  id v16 = v9;
  id v10 = v7;
  [v5 enumerateNodesMatchingFilter:v8 usingBlock:v14];

  id v11 = v16;
  id v12 = v9;

  return v12;
}

void __48__PGManager_Consistency__nodesByClassFromGraph___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  if (([*(id *)(a1 + 32) containsObject:v4] & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
    if (!v5)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v4];
    }
    [v5 addObject:v6];
  }
}

+ (id)nodeDomainsFromGraph:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = [v4 set];
  id v7 = [a1 consistencyIgnoredNodeDomainClasses];
  id v8 = [MEMORY[0x1E4F71F00] any];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__PGManager_Consistency__nodeDomainsFromGraph___block_invoke;
  v14[3] = &unk_1E68EE048;
  id v15 = v7;
  id v9 = v6;
  id v16 = v9;
  id v10 = v7;
  [v5 enumerateNodesMatchingFilter:v8 usingBlock:v14];

  id v11 = v16;
  id v12 = v9;

  return v12;
}

void __47__PGManager_Consistency__nodeDomainsFromGraph___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  if (([*(id *)(a1 + 32) containsObject:v4] & 1) == 0)
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v7, "domain"));
    [v5 addObject:v6];
  }
}

+ (id)edgesByNodeFromEdges:(id)a3 andNode:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__PGManager_Consistency__edgesByNodeFromEdges_andNode___block_invoke;
  v14[3] = &unk_1E68F1AA0;
  id v15 = v5;
  id v9 = v8;
  id v16 = v9;
  id v10 = v5;
  [v7 enumerateEdgesUsingBlock:v14];

  id v11 = v16;
  id v12 = v9;

  return v12;
}

void __55__PGManager_Consistency__edgesByNodeFromEdges_andNode___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 oppositeNode:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:v3];
  }
  [v4 addObject:v5];
}

+ (int64_t)_totalNumberOfIdenticalNodesFromNode1ByNode2:(id)a3 withNumberOfIdenticalNodesByDomain:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = _Block_copy(v13);
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v37 = 0;
  v38 = (double *)&v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  if (!v14
    || (double v15 = CFAbsoluteTimeGetCurrent(), v15 - v38[3] < 0.01)
    || (v38[3] = v15,
        LOBYTE(v45) = 0,
        (*((void (**)(void *, int *, double))v14 + 2))(v14, &v45, 0.0),
        char v16 = *((unsigned char *)v42 + 24) | v45,
        (*((unsigned char *)v42 + 24) = v16) == 0))
  {
    id v18 = [(id)objc_opt_class() consistencyIgnoredNodeDomainClasses];
    uint64_t buf = 0;
    *(void *)&long long v50 = &buf;
    *((void *)&v50 + 1) = 0x2020000000;
    uint64_t v51 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __138__PGManager_Consistency___totalNumberOfIdenticalNodesFromNode1ByNode2_withNumberOfIdenticalNodesByDomain_loggingConnection_progressBlock___block_invoke;
    v26[3] = &unk_1E68E5260;
    id v35 = a1;
    id v27 = v10;
    id v19 = v18;
    id v28 = v19;
    id v29 = v11;
    p_uint64_t buf = &buf;
    id v30 = v12;
    id v20 = v14;
    id v31 = v20;
    __int16 v33 = &v37;
    uint64_t v36 = 0x3F847AE147AE147BLL;
    double v34 = &v41;
    [v27 enumerateKeysAndObjectsUsingBlock:v26];
    if (*((unsigned char *)v42 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v45 = 67109378;
        int v46 = 408;
        __int16 v47 = 2080;
        id v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGM"
              "anager+Consistency.m";
        uint64_t v21 = MEMORY[0x1E4F14500];
LABEL_10:
        _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v45, 0x12u);
      }
    }
    else
    {
      if (!v14
        || (double Current = CFAbsoluteTimeGetCurrent(), Current - v38[3] < 0.01)
        || (v38[3] = Current,
            char v25 = 0,
            (*((void (**)(id, char *, double))v20 + 2))(v20, &v25, 1.0),
            char v23 = *((unsigned char *)v42 + 24) | v25,
            (*((unsigned char *)v42 + 24) = v23) == 0))
      {
        int64_t v17 = *(void *)(v50 + 24);
        goto LABEL_18;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v45 = 67109378;
        int v46 = 410;
        __int16 v47 = 2080;
        id v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGM"
              "anager+Consistency.m";
        uint64_t v21 = MEMORY[0x1E4F14500];
        goto LABEL_10;
      }
    }
    int64_t v17 = 0;
LABEL_18:

    _Block_object_dispose(&buf, 8);
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0x14104000202;
    LOWORD(v50) = 2080;
    *(void *)((char *)&v50 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Core/PGManager+Consistency.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  int64_t v17 = 0;
LABEL_19:
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v17;
}

void __138__PGManager_Consistency___totalNumberOfIdenticalNodesFromNode1ByNode2_withNumberOfIdenticalNodesByDomain_loggingConnection_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v28 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([v7 properties],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v6 properties],
        id v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = +[PGConsistencyUtility properties:v8 areConsistentWithProperties:v9 toleranceFactor:2], v9, v8, v10))
  {
    id v11 = [(MANodeCollection *)[PGGraphNodeCollection alloc] initWithNode:v7];
    id v12 = +[PGGraphEdgeCollection edgesFromNodes:v11];
    id v13 = [*(id *)(a1 + 96) edgesByNodeFromEdges:v12 andNode:v7];
    BOOL v14 = [(MANodeCollection *)[PGGraphNodeCollection alloc] initWithNode:v6];
    double v15 = +[PGGraphEdgeCollection edgesFromNodes:v14];
    uint64_t v16 = [v12 count];
    if (v16 == [v15 count])
    {
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      id v31 = __138__PGManager_Consistency___totalNumberOfIdenticalNodesFromNode1ByNode2_withNumberOfIdenticalNodesByDomain_loggingConnection_progressBlock___block_invoke_2;
      double v32 = &unk_1E68E5238;
      id v17 = v6;
      id v33 = v17;
      id v34 = *(id *)(a1 + 32);
      id v35 = *(id *)(a1 + 40);
      uint64_t v37 = &v38;
      id v36 = v13;
      [v15 enumerateEdgesUsingBlock:&v29];
      if (*((unsigned char *)v39 + 24))
      {
        id v18 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v17, "domain"));
        id v19 = [*(id *)(a1 + 48) objectForKey:v18];
        BOOL v20 = v19 == 0;

        if (v20) {
          [*(id *)(a1 + 48) setObject:&unk_1F28D5608 forKeyedSubscript:v18];
        }
        uint64_t v21 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v18, v28, v29, v30, v31, v32, v33, v34, v35);
        [v21 doubleValue];
        double v23 = v22;

        uint64_t v24 = [NSNumber numberWithDouble:v23 + 1.0];
        [*(id *)(a1 + 48) setObject:v24 forKeyedSubscript:v18];

        ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      }
      else
      {
        char v25 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 138412546;
          id v43 = v7;
          __int16 v44 = 2112;
          id v45 = v17;
          _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, "[PGManager+Consistency] The node %@ is not consistent with node %@", buf, 0x16u);
        }
      }
      if (*(void *)(a1 + 64))
      {
        double Current = CFAbsoluteTimeGetCurrent();
        uint64_t v27 = *(void *)(*(void *)(a1 + 80) + 8);
        if (Current - *(double *)(v27 + 24) >= *(double *)(a1 + 104))
        {
          *(double *)(v27 + 24) = Current;
          buf[0] = 0;
          (*(void (**)(double))(*(void *)(a1 + 64) + 16))(0.5);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) |= buf[0];
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
            *id v28 = 1;
          }
        }
      }
    }
  }
  _Block_object_dispose(&v38, 8);
}

void __138__PGManager_Consistency___totalNumberOfIdenticalNodesFromNode1ByNode2_withNumberOfIdenticalNodesByDomain_loggingConnection_progressBlock___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1D25FED50]();
  id v7 = [v5 oppositeNode:*(void *)(a1 + 32)];
  id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
  id v9 = (objc_class *)objc_opt_class();
  BOOL v10 = NSStringFromClass(v9);
  id v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  if (([*(id *)(a1 + 48) containsObject:v10] & 1) == 0
    && ([*(id *)(a1 + 48) containsObject:v12] & 1) == 0)
  {
    if (v8)
    {
      id v28 = v12;
      uint64_t v29 = v10;
      uint64_t v26 = a1;
      uint64_t v27 = a3;
      id v31 = v7;
      double v32 = v6;
      uint64_t v30 = v8;
      [*(id *)(a1 + 56) objectForKeyedSubscript:v8];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v34;
LABEL_6:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v33 + 1) + 8 * v17);
          id v19 = [v18 label];
          BOOL v20 = [v5 label];
          if ([v19 isEqualToString:v20])
          {
            int v21 = [v18 domain];
            int v22 = [v5 domain];

            if (v21 == v22)
            {
              double v23 = [v18 properties];
              uint64_t v24 = [v5 properties];
              BOOL v25 = +[PGConsistencyUtility properties:v23 areConsistentWithProperties:v24 toleranceFactor:2];

              if (v25) {
                goto LABEL_19;
              }
              goto LABEL_18;
            }
          }
          else
          {
          }
          if (v15 == ++v17)
          {
            uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
            if (v15) {
              goto LABEL_6;
            }
            break;
          }
        }
      }

LABEL_18:
      *(unsigned char *)(*(void *)(*(void *)(v26 + 64) + 8) + 24) = 0;
      unsigned char *v27 = 1;
LABEL_19:

      id v7 = v31;
      id v6 = v32;
      BOOL v10 = v29;
      id v8 = v30;
      id v12 = v28;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      *a3 = 1;
    }
  }
}

+ (id)consistencyCheckResultOfGraph:(id)a3 andGraph:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v97 = a3;
  id v98 = a4;
  id v9 = a5;
  aBlocuint64_t k = a6;
  BOOL v10 = v9;
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  id v12 = v10;
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PGManagerConsitencySimilarityScore", "", (uint8_t *)&buf, 2u);
  }
  oslog = v13;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v80 = mach_absolute_time();
  v95 = (void (**)(void *, int *, double))_Block_copy(aBlock);
  uint64_t v135 = 0;
  v136 = &v135;
  uint64_t v137 = 0x2020000000;
  char v138 = 0;
  uint64_t v131 = 0;
  v132 = (double *)&v131;
  uint64_t v133 = 0x2020000000;
  uint64_t v134 = 0;
  if (!v95
    || (double v14 = CFAbsoluteTimeGetCurrent(), v14 - v132[3] < 0.01)
    || (v132[3] = v14,
        LOBYTE(v140) = 0,
        v95[2](v95, &v140, 0.0),
        char v15 = *((unsigned char *)v136 + 24) | v140,
        (*((unsigned char *)v136 + 24) = v15) == 0))
  {
    uint64_t v16 = 0;
    if (!v97 || !v98) {
      goto LABEL_110;
    }
    uint64_t v17 = [v97 nodesCount];
    uint64_t v18 = [v98 nodesCount];
    +[PGManager consistencyIgnoredNodeDomainCodes];
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [obj countByEnumeratingWithState:&v127 objects:v150 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v128;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v128 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = (unsigned __int16)[*(id *)(*((void *)&v127 + 1) + 8 * i) unsignedIntValue];
          v17 -= [v97 nodesCountForDomain:v22];
          v18 -= [v98 nodesCountForDomain:v22];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v127 objects:v150 count:16];
      }
      while (v19);
    }

    long long v83 = objc_alloc_init(PGGraphConsistencyCheckResult);
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v24 = [(id)objc_opt_class() nodeDomainsFromGraph:v97];
    v84 = (void *)[v24 mutableCopy];

    BOOL v25 = [(id)objc_opt_class() nodeDomainsFromGraph:v98];
    [v84 unionSet:v25];

    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    v125[2] = __97__PGManager_Consistency__consistencyCheckResultOfGraph_andGraph_loggingConnection_progressBlock___block_invoke;
    v125[3] = &unk_1E68E51E8;
    id v26 = v23;
    id v126 = v26;
    [v84 enumerateObjectsUsingBlock:v125];
    [(PGGraphConsistencyCheckResult *)v83 setSimilarityScoreByDomain:v26];
    long long v77 = v26;
    if (!v17 && v18 > 0 || v17 >= 1 && !v18)
    {
      uint64_t v16 = v83;
LABEL_109:

      goto LABEL_110;
    }
    long long v82 = [(id)objc_opt_class() nodesByClassFromGraph:v97];
    long long v81 = [(id)objc_opt_class() nodesByClassFromGraph:v98];
    if (v95)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v132[3] >= 0.01)
      {
        v132[3] = Current;
        LOBYTE(v140) = 0;
        v95[2](v95, &v140, 0.1);
        char v28 = *((unsigned char *)v136 + 24) | v140;
        *((unsigned char *)v136 + 24) = v28;
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            uint64_t buf = 0xF104000202;
            LOWORD(v143) = 2080;
            *(void *)((char *)&v143 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Core/PGManager+Consistency.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
          }
          uint64_t v16 = 0;
          goto LABEL_108;
        }
      }
    }
    uint64_t v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = [v82 allKeys];
    long long v75 = [v29 setWithArray:v30];

    id v31 = (void *)MEMORY[0x1E4F1CAD0];
    double v32 = [v81 allKeys];
    long long v74 = [v31 setWithArray:v32];

    long long v33 = (void *)[v75 mutableCopy];
    [v33 intersectSet:v74];
    long long v73 = v33;
    if (![v33 count])
    {
      uint64_t v16 = v83;
LABEL_107:

LABEL_108:
      goto LABEL_109;
    }
    id v93 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id v76 = v33;
    uint64_t v34 = [v76 countByEnumeratingWithState:&v121 objects:v149 count:16];
    if (v34)
    {
      uint64_t v79 = *(void *)v122;
      while (2)
      {
        uint64_t v35 = 0;
        uint64_t v78 = v34;
        do
        {
          if (*(void *)v122 != v79) {
            objc_enumerationMutation(v76);
          }
          uint64_t v86 = v35;
          uint64_t v36 = *(void *)(*((void *)&v121 + 1) + 8 * v35);
          context = (void *)MEMORY[0x1D25FED50]();
          uint64_t v37 = [v82 objectForKeyedSubscript:v36];
          v87 = [v81 objectForKeyedSubscript:v36];
          long long v119 = 0u;
          long long v120 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          id v94 = v37;
          uint64_t v38 = [v94 countByEnumeratingWithState:&v117 objects:v148 count:16];
          if (v38)
          {
            uint64_t v39 = *(void *)v118;
            while (2)
            {
              for (uint64_t j = 0; j != v38; ++j)
              {
                if (*(void *)v118 != v39) {
                  objc_enumerationMutation(v94);
                }
                uint64_t v41 = *(void *)(*((void *)&v117 + 1) + 8 * j);
                if (v95)
                {
                  double v42 = CFAbsoluteTimeGetCurrent();
                  if (v42 - v132[3] >= 0.01)
                  {
                    v132[3] = v42;
                    LOBYTE(v140) = 0;
                    v95[2](v95, &v140, 0.4);
                    char v43 = *((unsigned char *)v136 + 24) | v140;
                    *((unsigned char *)v136 + 24) = v43;
                    if (v43)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                      {
                        uint64_t buf = 0x10504000202;
                        LOWORD(v143) = 2080;
                        *(void *)((char *)&v143 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/p"
                                                         "hotoanalysis/PhotosGraph/Framework/Core/PGManager+Consistency.m";
                        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
                      }
                      int v57 = 0;
                      id v47 = v94;
                      goto LABEL_73;
                    }
                  }
                }
                __int16 v44 = [(id)objc_opt_class() nodesOfClass:v36 matchingNode:v41 inGraph:v98];
                id v45 = v44;
                if (v44 && [v44 count] == 1)
                {
                  uint64_t v46 = [v45 anyNode];
                  [v93 setObject:v41 forKeyedSubscript:v46];
                }
              }
              uint64_t v38 = [v94 countByEnumeratingWithState:&v117 objects:v148 count:16];
              if (v38) {
                continue;
              }
              break;
            }
          }

          long long v115 = 0u;
          long long v116 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          id v47 = v87;
          uint64_t v92 = [v47 countByEnumeratingWithState:&v113 objects:v147 count:16];
          if (v92)
          {
            id v90 = v47;
            uint64_t v91 = *(void *)v114;
            while (2)
            {
              for (uint64_t k = 0; k != v92; ++k)
              {
                if (*(void *)v114 != v91) {
                  objc_enumerationMutation(v90);
                }
                uint64_t v49 = *(void *)(*((void *)&v113 + 1) + 8 * k);
                if (v95)
                {
                  double v50 = CFAbsoluteTimeGetCurrent();
                  if (v50 - v132[3] >= 0.01)
                  {
                    v132[3] = v50;
                    LOBYTE(v140) = 0;
                    v95[2](v95, &v140, 0.4);
                    char v51 = *((unsigned char *)v136 + 24) | v140;
                    *((unsigned char *)v136 + 24) = v51;
                    if (v51)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                      {
                        uint64_t buf = 0x10E04000202;
                        LOWORD(v143) = 2080;
                        *(void *)((char *)&v143 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/p"
                                                         "hotoanalysis/PhotosGraph/Framework/Core/PGManager+Consistency.m";
                        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
                      }
                      int v57 = 0;
                      goto LABEL_71;
                    }
                  }
                }
                uint64_t v52 = [(id)objc_opt_class() nodesOfClass:v36 matchingNode:v49 inGraph:v97];
                uint64_t v53 = v52;
                if (v52 && [v52 count] == 1)
                {
                  unint64_t v54 = [v53 anyNode];
                  double v55 = [v93 objectForKeyedSubscript:v49];
                  char v56 = [v54 isEqualToNode:v55];

                  if ((v56 & 1) == 0) {
                    [v93 removeObjectForKey:v49];
                  }
                }
              }
              uint64_t v92 = [v90 countByEnumeratingWithState:&v113 objects:v147 count:16];
              if (v92) {
                continue;
              }
              break;
            }
            int v57 = 1;
LABEL_71:
            id v47 = v90;
          }
          else
          {
            int v57 = 1;
          }
LABEL_73:

          if (!v57)
          {
            uint64_t v16 = 0;
            long long v61 = (void (**)(void *, int *, double))v76;
            goto LABEL_106;
          }
          uint64_t v35 = v86 + 1;
        }
        while (v86 + 1 != v78);
        uint64_t v34 = [v76 countByEnumeratingWithState:&v121 objects:v149 count:16];
        if (v34) {
          continue;
        }
        break;
      }
    }

    long long v58 = objc_opt_class();
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __97__PGManager_Consistency__consistencyCheckResultOfGraph_andGraph_loggingConnection_progressBlock___block_invoke_327;
    v108[3] = &unk_1E68F03F8;
    long long v59 = v95;
    v109 = v59;
    uint64_t v112 = 0x3F847AE147AE147BLL;
    v110 = &v131;
    v111 = &v135;
    uint64_t v60 = [v58 _totalNumberOfIdenticalNodesFromNode1ByNode2:v93 withNumberOfIdenticalNodesByDomain:v77 loggingConnection:oslog progressBlock:v108];
    if (*((unsigned char *)v136 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t buf = 0x11E04000202;
        LOWORD(v143) = 2080;
        *(void *)((char *)&v143 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Core/PGManager+Consistency.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
      uint64_t v16 = 0;
LABEL_105:
      long long v61 = v109;
LABEL_106:

      goto LABEL_107;
    }
    uint64_t v62 = v60;
    uint64_t buf = 0;
    *(void *)&long long v143 = &buf;
    *((void *)&v143 + 1) = 0x3032000000;
    v144 = __Block_byref_object_copy__3735;
    v145 = __Block_byref_object_dispose__3736;
    id v146 = [MEMORY[0x1E4F1CA60] dictionary];
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __97__PGManager_Consistency__consistencyCheckResultOfGraph_andGraph_loggingConnection_progressBlock___block_invoke_329;
    v100[3] = &unk_1E68E5210;
    id v101 = v97;
    id v102 = v98;
    p_uint64_t buf = &buf;
    __int16 v63 = v59;
    v103 = v63;
    v105 = &v131;
    v106 = &v135;
    uint64_t v107 = 0x3F847AE147AE147BLL;
    [v77 enumerateKeysAndObjectsUsingBlock:v100];
    if (*((unsigned char *)v136 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v140 = 67109378;
        LODWORD(v141[0]) = 303;
        WORD2(v141[0]) = 2080;
        *(void *)((char *)v141 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Core/PGManager+Consistency.m";
        long long v64 = MEMORY[0x1E4F14500];
LABEL_85:
        _os_log_impl(&dword_1D1805000, v64, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v140, 0x12u);
      }
    }
    else
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        int v140 = 134217984;
        v141[0] = v62;
        _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_INFO, "[PGManager+Consistency] Total number of identical nodes in graph1 and graph2 = %lu\n", (uint8_t *)&v140, 0xCu);
      }
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        int v140 = 134217984;
        v141[0] = v17;
        _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_INFO, "[PGManager+Consistency] Total number of nodes in graph1 = %lu\n", (uint8_t *)&v140, 0xCu);
      }
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        int v140 = 134217984;
        v141[0] = v18;
        _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_INFO, "[PGManager+Consistency] Total number of nodes in graph2 = %lu\n", (uint8_t *)&v140, 0xCu);
      }
      [(PGGraphConsistencyCheckResult *)v83 setOverallSimilarityScore:(double)v62 / (double)(v17 + v18 - v62)];
      [(PGGraphConsistencyCheckResult *)v83 setSimilarityScoreByDomain:*(void *)(v143 + 40)];
      uint64_t v65 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      id v68 = oslog;
      long long v69 = v68;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
      {
        LOWORD(v140) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v69, OS_SIGNPOST_INTERVAL_END, v11, "PGManagerConsitencySimilarityScore", "", (uint8_t *)&v140, 2u);
      }

      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        int v140 = 136315394;
        v141[0] = "PGManagerConsitencySimilarityScore";
        LOWORD(v141[1]) = 2048;
        *(double *)((char *)&v141[1] + 2) = (float)((float)((float)((float)(v65 - v80) * (float)numer) / (float)denom)
                                                  / 1000000.0);
        _os_log_impl(&dword_1D1805000, v69, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v140, 0x16u);
      }
      if (!v95
        || (double v70 = CFAbsoluteTimeGetCurrent(), v70 - v132[3] < 0.01)
        || (v132[3] = v70,
            char v99 = 0,
            v63[2](v63, (int *)&v99, 1.0),
            char v71 = *((unsigned char *)v136 + 24) | v99,
            (*((unsigned char *)v136 + 24) = v71) == 0))
      {
        uint64_t v16 = v83;
        goto LABEL_104;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v140 = 67109378;
        LODWORD(v141[0]) = 314;
        WORD2(v141[0]) = 2080;
        *(void *)((char *)v141 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Core/PGManager+Consistency.m";
        long long v64 = MEMORY[0x1E4F14500];
        goto LABEL_85;
      }
    }
    uint64_t v16 = 0;
LABEL_104:

    _Block_object_dispose(&buf, 8);
    goto LABEL_105;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0xD004000202;
    LOWORD(v143) = 2080;
    *(void *)((char *)&v143 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Core/PGManager+Consistency.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  uint64_t v16 = 0;
LABEL_110:
  _Block_object_dispose(&v131, 8);
  _Block_object_dispose(&v135, 8);

  return v16;
}

uint64_t __97__PGManager_Consistency__consistencyCheckResultOfGraph_andGraph_loggingConnection_progressBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:&unk_1F28D06C0 forKeyedSubscript:a2];
}

void __97__PGManager_Consistency__consistencyCheckResultOfGraph_andGraph_loggingConnection_progressBlock___block_invoke_327(uint64_t a1, unsigned char *a2)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __97__PGManager_Consistency__consistencyCheckResultOfGraph_andGraph_loggingConnection_progressBlock___block_invoke_329(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (unsigned __int16)[v7 unsignedIntValue];
  double v10 = (double)(unint64_t)[*(id *)(a1 + 32) nodesCountForDomain:v9];
  double v11 = (double)(unint64_t)[*(id *)(a1 + 40) nodesCountForDomain:v9];
  [v8 doubleValue];
  double v13 = v12;

  double v14 = v10 + v11 - v13;
  if (v14 <= 0.0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:&unk_1F28D5608 forKeyedSubscript:v7];
  }
  else
  {
    char v15 = [NSNumber numberWithDouble:v13 / v14];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v15 forKeyedSubscript:v7];
  }
  if (*(void *)(a1 + 48))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    if (Current - *(double *)(v17 + 24) >= *(double *)(a1 + 80))
    {
      *(double *)(v17 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 48) + 16))(0.9);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
        *a4 = 1;
      }
    }
  }
}

+ (BOOL)graphConsistencyCheckIsEnabled
{
  return +[PGUserDefaults graphConsistencyCheckIsEnabled];
}

- (id)suggestedPersonsForSharedLibraryContentInclusion
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(PGManager *)self guessWhoLoggingConnection];
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  uint64_t v5 = v3;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "suggestedPersonsForSharedLibraryContentInclusion", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v7 = mach_absolute_time();
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__PGManager_People__suggestedPersonsForSharedLibraryContentInclusion__block_invoke;
  v15[3] = &unk_1E68F0848;
  id v9 = v8;
  id v16 = v9;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v15];
  uint64_t v10 = mach_absolute_time();
  mach_timebase_info v11 = info;
  double v12 = v6;
  double v13 = v12;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v13, OS_SIGNPOST_INTERVAL_END, v4, "suggestedPersonsForSharedLibraryContentInclusion", "", buf, 2u);
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 136315394;
    uint64_t v19 = "suggestedPersonsForSharedLibraryContentInclusion";
    __int16 v20 = 2048;
    double v21 = (float)((float)((float)((float)(v10 - v7) * (float)v11.numer) / (float)v11.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v9;
}

void __69__PGManager_People__suggestedPersonsForSharedLibraryContentInclusion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  __int16 v20 = [a2 graph];
  id v3 = +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:");
  os_signpost_id_t v4 = [v3 familyPersonNodes];
  uint64_t v19 = v3;
  uint64_t v5 = [v3 inferredFamilyPersonNodes];
  id v6 = [v4 collectionByFormingUnionWith:v5];

  uint64_t v18 = v6;
  uint64_t v7 = [v6 array];
  id v8 = [v7 sortedArrayUsingComparator:PGManagerPersonNodeComparisonBlock];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = [*(id *)(*((void *)&v22 + 1) + 8 * v13) localIdentifier];
        if ([v14 length])
        {
          char v15 = *(void **)(a1 + 32);
          id v26 = @"localIdentifier";
          uint64_t v27 = v14;
          id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          [v15 addObject:v16];
        }
        else
        {
          uint64_t v17 = +[PGLogging sharedLogging];
          id v16 = [v17 loggingConnection];

          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)uint64_t buf = 0;
            _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "[Person Knowledge] no local identifier found for person", buf, 2u);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v11);
  }
}

- (id)suggestedPersonsForSharedLibraryParticipants
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(PGManager *)self guessWhoLoggingConnection];
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  uint64_t v5 = v3;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "suggestedPersonsForSharedLibraryParticipants", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v7 = mach_absolute_time();
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__PGManager_People__suggestedPersonsForSharedLibraryParticipants__block_invoke;
  v15[3] = &unk_1E68F0848;
  id v9 = v8;
  id v16 = v9;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v15];
  uint64_t v10 = mach_absolute_time();
  mach_timebase_info v11 = info;
  uint64_t v12 = v6;
  uint64_t v13 = v12;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v13, OS_SIGNPOST_INTERVAL_END, v4, "suggestedPersonsForSharedLibraryParticipants", "", buf, 2u);
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 136315394;
    uint64_t v19 = "suggestedPersonsForSharedLibraryParticipants";
    __int16 v20 = 2048;
    double v21 = (float)((float)((float)((float)(v10 - v7) * (float)v11.numer) / (float)v11.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v9;
}

void __65__PGManager_People__suggestedPersonsForSharedLibraryParticipants__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 graph];
  os_signpost_id_t v4 = [MEMORY[0x1E4F1CA80] set];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __65__PGManager_People__suggestedPersonsForSharedLibraryParticipants__block_invoke_2;
  v22[3] = &unk_1E68EF528;
  id v5 = v4;
  id v23 = v5;
  [v3 enumeratePersonNodesIncludingMe:0 withBlock:v22];
  uint64_t v17 = v5;
  id v6 = [v5 allObjects];
  uint64_t v7 = [v6 sortedArrayUsingComparator:PGManagerPersonNodeComparisonBlock];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        double v14 = *(void **)(a1 + 32);
        long long v24 = @"localIdentifier";
        char v15 = [v13 localIdentifier];
        long long v25 = v15;
        id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        [v14 addObject:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v10);
  }
}

void __65__PGManager_People__suggestedPersonsForSharedLibraryParticipants__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isMyPartner] & 1) != 0 || objc_msgSend(v3, "isMyInferredPartner")) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)suggestedPersonsForHome
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(PGManager *)self guessWhoLoggingConnection];
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  id v5 = v3;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "SuggestedPersonsForHome", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v7 = mach_absolute_time();
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__PGManager_People__suggestedPersonsForHome__block_invoke;
  v15[3] = &unk_1E68F0848;
  id v9 = v8;
  id v16 = v9;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v15];
  uint64_t v10 = mach_absolute_time();
  mach_timebase_info v11 = info;
  uint64_t v12 = v6;
  uint64_t v13 = v12;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v13, OS_SIGNPOST_INTERVAL_END, v4, "SuggestedPersonsForHome", "", buf, 2u);
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 136315394;
    long long v19 = "SuggestedPersonsForHome";
    __int16 v20 = 2048;
    double v21 = (float)((float)((float)((float)(v10 - v7) * (float)v11.numer) / (float)v11.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v9;
}

void __44__PGManager_People__suggestedPersonsForHome__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 graph];
  os_signpost_id_t v4 = [MEMORY[0x1E4F1CA80] set];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __44__PGManager_People__suggestedPersonsForHome__block_invoke_2;
  v55[3] = &unk_1E68EF528;
  id v5 = v4;
  id v56 = v5;
  [v3 enumeratePersonNodesIncludingMe:1 withBlock:v55];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  uint64_t v40 = v3;
  uint64_t v7 = [v3 meNodeCollection];
  id v8 = [v7 homeNodes];
  id v9 = [v8 addressNodes];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __44__PGManager_People__suggestedPersonsForHome__block_invoke_3;
  v53[3] = &unk_1E68EDB30;
  id v10 = v6;
  id v54 = v10;
  [v9 enumerateIdentifiersAsCollectionsWithBlock:v53];

  unint64_t v11 = [v10 count];
  if (v11)
  {
    double v12 = (double)v11;
    long long v49 = 0u;
    long long v50 = 0u;
    double v13 = (double)(unint64_t)objc_msgSend(v10, "pg_accumulatedCount") / (double)v11;
    long long v51 = 0u;
    long long v52 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v61 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v50;
      double v18 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v50 != v17) {
            objc_enumerationMutation(v14);
          }
          unint64_t v20 = [v14 countForObject:*(void *)(*((void *)&v49 + 1) + 8 * i)];
          double v18 = v18 + ((double)v20 - v13) * ((double)v20 - v13);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v61 count:16];
      }
      while (v16);
    }
    else
    {
      double v18 = 0.0;
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v21 = v14;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v60 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      unint64_t v24 = (unint64_t)fmax(ceil(v13 + sqrt(v18 / v12) * -0.5), 2.0);
      uint64_t v25 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(v21);
          }
          uint64_t v27 = *(void *)(*((void *)&v45 + 1) + 8 * j);
          if ([v21 countForObject:v27] > v24) {
            [v5 addObject:v27];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v45 objects:v60 count:16];
      }
      while (v23);
    }
  }
  uint64_t v38 = v10;
  uint64_t v39 = v5;
  char v28 = [v5 allObjects];
  uint64_t v29 = [v28 sortedArrayUsingComparator:PGManagerPersonNodeComparisonBlock];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v30 = v29;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v41 objects:v59 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = [*(id *)(*((void *)&v41 + 1) + 8 * k) localIdentifier];
        if ([v35 length])
        {
          uint64_t v36 = *(void **)(a1 + 32);
          int v57 = @"localIdentifier";
          long long v58 = v35;
          uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          [v36 addObject:v37];
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v41 objects:v59 count:16];
    }
    while (v32);
  }
}

void __44__PGManager_People__suggestedPersonsForHome__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isFavorite] & 1) != 0
    || ([v3 isMemberOfMyFamily] & 1) != 0
    || ([v3 isInferredMemberOfMyFamily] & 1) != 0
    || [v3 isMeNode])
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __44__PGManager_People__suggestedPersonsForHome__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  os_signpost_id_t v4 = [a3 momentNodes];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PGManager_People__suggestedPersonsForHome__block_invoke_4;
  v5[3] = &unk_1E68EDD40;
  id v6 = *(id *)(a1 + 32);
  [v4 enumerateIdentifiersAsCollectionsWithBlock:v5];
}

void __44__PGManager_People__suggestedPersonsForHome__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = [a3 personNodes];
  os_signpost_id_t v4 = [v5 temporarySet];
  [v3 unionSet:v4];
}

- (id)relationshipInferencesForPersonLocalIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PGManager *)self guessWhoLoggingConnection];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  uint64_t v7 = v5;
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "RelationshipInferencesForPersonLocalIdentifiers", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = mach_absolute_time();
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v4 count])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __69__PGManager_People__relationshipInferencesForPersonLocalIdentifiers___block_invoke;
    v20[3] = &unk_1E68F0AF0;
    id v21 = v4;
    id v11 = v10;
    id v22 = v11;
    [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v20];
    uint64_t v12 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    uint64_t v15 = v8;
    uint64_t v16 = v15;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v16, OS_SIGNPOST_INTERVAL_END, v6, "RelationshipInferencesForPersonLocalIdentifiers", "", buf, 2u);
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 136315394;
      uint64_t v25 = "RelationshipInferencesForPersonLocalIdentifiers";
      __int16 v26 = 2048;
      double v27 = (float)((float)((float)((float)(v12 - v9) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    uint64_t v17 = v22;
    id v18 = v11;
  }
  return v10;
}

void __69__PGManager_People__relationshipInferencesForPersonLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 graph];
  [v3 _checkCanRead];
  uint64_t v35 = [v3 meNode];
  if (v35)
  {
    uint64_t v32 = a1;
    id v4 = [*(id *)(a1 + 32) allObjects];
    uint64_t v31 = v3;
    id v5 = [v3 personNodesForPersonLocalIdentifiers:v4];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    os_signpost_id_t v6 = v5;
    uint64_t v36 = [v6 countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v36)
    {
      uint64_t v33 = *(void *)v44;
      uint64_t v34 = v6;
      do
      {
        for (uint64_t i = 0; i != v36; uint64_t i = v27 + 1)
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(v6);
          }
          uint64_t v37 = i;
          id v8 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v9 = [v8 localIdentifier];
          id v10 = +[PGLogging sharedLogging];
          id v11 = [v10 loggingConnection];

          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 138412290;
            uint64_t v48 = v9;
            _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "[Person Knowledge] Querying for inferred relationships for person %@", buf, 0xCu);
          }
          uint64_t v38 = (void *)v9;

          uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
          double v13 = [v35 relationshipEdgesToPersonNode:v8 matchingQuery:2];
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v53 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v40 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                long long v19 = [v18 label];
                unint64_t v20 = PGRelationshipTypeFromRelationshipLabel(v19);
                id v21 = NSNumber;
                [v18 confidence];
                id v22 = objc_msgSend(v21, "numberWithDouble:");
                [v12 setObject:v22 forKeyedSubscript:v20];

                uint64_t v23 = +[PGLogging sharedLogging];
                unint64_t v24 = [v23 loggingConnection];

                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  [v18 confidence];
                  *(_DWORD *)uint64_t buf = 138412802;
                  uint64_t v48 = (uint64_t)v19;
                  __int16 v49 = 2112;
                  long long v50 = v38;
                  __int16 v51 = 2048;
                  uint64_t v52 = v25;
                  _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_INFO, "[Person Knowledge] Relationship of type %@ inferred for person %@ with confidence %.02f", buf, 0x20u);
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v53 count:16];
            }
            while (v15);
          }
          if ([v12 count])
          {
            __int16 v26 = v38;
            [*(id *)(v32 + 40) setObject:v12 forKeyedSubscript:v38];
            os_signpost_id_t v6 = v34;
            uint64_t v27 = v37;
          }
          else
          {
            uint64_t v28 = +[PGLogging sharedLogging];
            uint64_t v29 = [v28 loggingConnection];

            uint64_t v27 = v37;
            __int16 v26 = v38;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t buf = 138412290;
              uint64_t v48 = (uint64_t)v38;
              _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "[Person Knowledge] No inferred relationships found for person %@", buf, 0xCu);
            }

            os_signpost_id_t v6 = v34;
          }
        }
        uint64_t v36 = [v6 countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v36);
    }

    id v3 = v31;
  }
  else
  {
    id v30 = +[PGLogging sharedLogging];
    os_signpost_id_t v6 = [v30 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_INFO, "[Person Knowledge] No relationship inferences found due to nil me node", buf, 2u);
    }
  }
}

- (BOOL)mePersonContactIdentifierDidChangeWithGraphUpdate:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PGManager *)self loggingConnection];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  uint64_t v7 = v5;
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MePersonContactIdentifierDidChange", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = mach_absolute_time();
  *(void *)uint64_t buf = 0;
  id v21 = buf;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__PGManager_People__mePersonContactIdentifierDidChangeWithGraphUpdate___block_invoke;
  v17[3] = &unk_1E68F0A28;
  id v10 = v4;
  id v18 = v10;
  long long v19 = buf;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v17];
  uint64_t v11 = mach_absolute_time();
  mach_timebase_info v12 = info;
  double v13 = v8;
  uint64_t v14 = v13;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)uint64_t v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v14, OS_SIGNPOST_INTERVAL_END, v6, "MePersonContactIdentifierDidChange", "", v25, 2u);
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v25 = 136315394;
    __int16 v26 = "MePersonContactIdentifierDidChange";
    __int16 v27 = 2048;
    double v28 = (float)((float)((float)((float)(v11 - v9) * (float)v12.numer) / (float)v12.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v25, 0x16u);
  }
  BOOL v15 = v21[24] != 0;

  _Block_object_dispose(buf, 8);
  return v15;
}

void __71__PGManager_People__mePersonContactIdentifierDidChangeWithGraphUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 graph];
  id v4 = [v3 meNode];
  id v5 = [v4 inferredPersonNode];
  os_signpost_id_t v6 = [v4 localIdentifier];
  if ([v6 length]) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = v5;
  }
  id v8 = [v7 localIdentifier];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PGManager_People__mePersonContactIdentifierDidChangeWithGraphUpdate___block_invoke_2;
  v12[3] = &unk_1E68E58C8;
  id v10 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v13 = v8;
  uint64_t v14 = v9;
  id v11 = v8;
  [v10 enumerateConsolidatedChanges:v12];
}

void __71__PGManager_People__mePersonContactIdentifierDidChangeWithGraphUpdate___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  id v5 = (void *)MEMORY[0x1D25FED50]();
  if ([v9 type] == 6)
  {
    id v6 = v9;
    uint64_t v7 = [v6 personLocalIdentifier];
    id v8 = [v6 propertyNames];

    if ([v7 isEqualToString:*(void *)(a1 + 32)]
      && [v8 containsObject:@"cnid"])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

- (id)assetIdentifiersForPersonLocalIdentifiers:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__7687;
  uint64_t v37 = __Block_byref_object_dispose__7688;
  id v38 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __63__PGManager_People__assetIdentifiersForPersonLocalIdentifiers___block_invoke;
  v30[3] = &unk_1E68F0A28;
  id v6 = v4;
  id v31 = v6;
  uint64_t v32 = &v33;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v30];
  if ([(id)v34[5] count])
  {
    uint64_t v7 = [(PGManager *)self photoLibrary];
    id v8 = [v7 librarySpecificFetchOptions];

    id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __63__PGManager_People__assetIdentifiersForPersonLocalIdentifiers___block_invoke_2;
    v28[3] = &unk_1E68ED970;
    id v10 = v9;
    id v29 = v10;
    [v6 enumerateObjectsUsingBlock:v28];
    id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN (%@) AND ANY %K.%K IN (%@)", @"moment.uuid", v34[5], @"detectedFaces", @"personForFace.personUUID", v10];
    mach_timebase_info v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v41[0] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    [v8 setSortDescriptors:v13];

    [v8 setInternalPredicate:v11];
    [v8 setChunkSizeForFetch:2000];
    uint64_t v40 = *MEMORY[0x1E4F394A8];
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    [v8 setFetchPropertySets:v14];

    [v8 setIncludeAssetSourceTypes:5];
    BOOL v15 = [(PGManager *)self photoLibrary];
    [v8 setPhotoLibrary:v15];

    [v8 setIncludeGuestAssets:1];
    [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v8];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v39 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v16);
          }
          unint64_t v20 = [*(id *)(*((void *)&v24 + 1) + 8 * i) localIdentifier];
          [v5 addObject:v20];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v39 count:16];
      }
      while (v17);
    }
  }
  id v21 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    id v21 = v5;
  }
  id v22 = v21;

  _Block_object_dispose(&v33, 8);
  return v22;
}

void __63__PGManager_People__assetIdentifiersForPersonLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [a2 graph];
  id v10 = +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:v3 inGraph:v4];

  id v5 = [v10 socialGroupNodes];
  id v6 = [v5 momentNodes];
  uint64_t v7 = [v6 uuids];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __63__PGManager_People__assetIdentifiersForPersonLocalIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F391D0] uuidFromLocalIdentifier:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

- (id)assetCollectionsForPersonLocalIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__7687;
  uint64_t v18 = __Block_byref_object_dispose__7688;
  id v19 = 0;
  id v5 = [(PGManager *)self photoLibrary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PGManager_People__assetCollectionsForPersonLocalIdentifiers___block_invoke;
  void v10[3] = &unk_1E68E9F28;
  id v6 = v4;
  id v11 = v6;
  id v13 = &v14;
  id v7 = v5;
  id v12 = v7;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __63__PGManager_People__assetCollectionsForPersonLocalIdentifiers___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v14 = [v3 graph];
  uint64_t v4 = a1[4];
  id v5 = [v3 graph];

  id v6 = +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:v4 inGraph:v5];

  uint64_t v7 = [v6 count];
  if (v7)
  {
    if (v7 == 1)
    {
      id v8 = [v6 socialGroupNodes];
      id v9 = [v8 momentNodes];
    }
    else
    {
      id v9 = [v14 momentNodesForPersonNodes:v6];
    }
    id v10 = [v9 temporarySet];
    uint64_t v11 = [v14 momentsForMomentNodes:v10 inPhotoLibrary:a1[5] sortChronologically:1];
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (id)maximalSocialGroupsOverlappingMemberLocalIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__7687;
  uint64_t v18 = __Block_byref_object_dispose__7688;
  id v19 = 0;
  id v5 = [(PGManager *)self photoLibrary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__PGManager_People__maximalSocialGroupsOverlappingMemberLocalIdentifiers___block_invoke;
  void v10[3] = &unk_1E68E9F28;
  id v13 = &v14;
  id v6 = v4;
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __74__PGManager_People__maximalSocialGroupsOverlappingMemberLocalIdentifiers___block_invoke(void *a1, void *a2)
{
  id v9 = [a2 graph];
  uint64_t v3 = [v9 maximalSocialGroupsOverlappingMemberLocalIdentifiers:a1[4]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = +[PGPeopleUtilities validateSocialGroups:*(void *)(*(void *)(a1[6] + 8) + 40) withPhotoLibrary:a1[5] graph:v9];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)socialGroupsOverlappingMemberLocalIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__7687;
  uint64_t v18 = __Block_byref_object_dispose__7688;
  id v19 = 0;
  id v5 = [(PGManager *)self photoLibrary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__PGManager_People__socialGroupsOverlappingMemberLocalIdentifiers___block_invoke;
  void v10[3] = &unk_1E68E9F28;
  id v13 = &v14;
  id v6 = v4;
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __67__PGManager_People__socialGroupsOverlappingMemberLocalIdentifiers___block_invoke(void *a1, void *a2)
{
  id v9 = [a2 graph];
  uint64_t v3 = [v9 socialGroupsOverlappingMemberLocalIdentifiers:a1[4]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = +[PGPeopleUtilities validateSocialGroups:*(void *)(*(void *)(a1[6] + 8) + 40) withPhotoLibrary:a1[5] graph:v9];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)allSocialGroupsForMemberLocalIdentifier:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  unint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__7687;
  char v23 = __Block_byref_object_dispose__7688;
  id v24 = 0;
  id v8 = [(PGManager *)self photoLibrary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PGManager_People__allSocialGroupsForMemberLocalIdentifier_options___block_invoke;
  v14[3] = &unk_1E68EF5F0;
  uint64_t v18 = &v19;
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v14];
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __69__PGManager_People__allSocialGroupsForMemberLocalIdentifier_options___block_invoke(uint64_t a1, void *a2)
{
  id v11 = [a2 graph];
  uint64_t v3 = [v11 allSocialGroupsForMemberLocalIdentifier:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F8B040]];
  BOOL v7 = v6 != 0;

  uint64_t v8 = +[PGPeopleUtilities validateSocialGroups:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withPhotoLibrary:*(void *)(a1 + 48) graph:v11 usePersonMoments:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)sortedArrayForPersonLocalIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__PGManager_People__sortedArrayForPersonLocalIdentifiers___block_invoke;
  v11[3] = &unk_1E68F0AF0;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v11];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

void __58__PGManager_People__sortedArrayForPersonLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 graph];
  id v4 = [*(id *)(a1 + 32) allObjects];
  id v5 = [v3 personNodesForPersonLocalIdentifiers:v4];

  id v6 = [v5 sortedArrayUsingComparator:PGManagerPersonNodeComparisonBlock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(a1 + 40);
        id v12 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) localIdentifier];
        [v11 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (id)requestGraleSemanticLabelPropagationWithError:(id *)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)blockedFeatures
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PGManager *)self photoLibrary];
  uint64_t v4 = [v3 librarySpecificFetchOptions];

  id v31 = (void *)v4;
  id v30 = [MEMORY[0x1E4F39160] fetchBlockedMemoriesWithOptions:v4];
  id v5 = [v30 fetchedObjects];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v36 + 1) + 8 * i) blacklistedFeature];
        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v9);
  }
  id v29 = v7;

  long long v13 = [(PGManager *)self photoLibrary];
  long long v14 = [v13 librarySpecificFetchOptions];

  uint64_t v41 = *MEMORY[0x1E4F397E0];
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  [v14 setFetchPropertySets:v15];

  double v28 = v14;
  long long v16 = [MEMORY[0x1E4F391F0] fetchPersonsWithUserFeedbackWithOptions:v14];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        id v22 = [v21 userFeedbackProperties];
        char v23 = [v22 userFeedback];

        if ([v23 type] == 2 || objc_msgSend(v23, "type") == 3)
        {
          id v24 = (void *)MEMORY[0x1E4F39178];
          long long v25 = [v21 localIdentifier];
          long long v26 = [v24 peopleMemoryFeatureWithPersonLocalIdentifier:v25];

          if (v26) {
            [v6 addObject:v26];
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v18);
  }

  return v6;
}

- (BOOL)date:(id)a3 isEqualToDate:(id)a4
{
  if (a3 && a4) {
    return [a3 isEqualToDate:a4];
  }
  else {
    return a3 == a4;
  }
}

- (id)_changingPropertyKeysForPersonProperties:(id)a3 andPersonContactProperties:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToDictionary:v7])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    goto LABEL_67;
  }
  uint64_t v9 = [(PGManager *)self workingContext];
  uint64_t v10 = [v9 loggingConnection];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v12 = [v6 objectForKeyedSubscript:@"id"];
  long long v13 = [v7 objectForKeyedSubscript:@"id"];
  if (v13)
  {
    if ([(PGManager *)v12 length]
      && [v13 length]
      && ([(PGManager *)v12 isEqualToString:v13] & 1) == 0)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 138412546;
        id v76 = v13;
        __int16 v77 = 2112;
        uint64_t v78 = v12;
        _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "Trying to merge person local identifier %@ into person node with local identifier %@", buf, 0x16u);
      }
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
      goto LABEL_66;
    }
    if (!-[PGManager length](v12, "length") && [v13 length]) {
      [v11 addObject:@"id"];
    }
  }
  long long v72 = v13;
  long long v14 = [v6 objectForKeyedSubscript:@"cnid"];
  long long v15 = [v7 objectForKeyedSubscript:@"cnid"];
  if (v15)
  {
    if ([(PGManager *)v14 length]
      && [v15 length]
      && ([(PGManager *)v14 isEqualToString:v15] & 1) == 0
      && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 138412546;
      id v76 = v15;
      __int16 v77 = 2112;
      uint64_t v78 = v14;
      _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "Trying to merge person contact identifier %@ into person node with contact identifier %@", buf, 0x16u);
    }
    if (!-[PGManager length](v14, "length") && [v15 length]) {
      [v11 addObject:@"cnid"];
    }
  }
  double v70 = v15;
  long long v16 = [v6 objectForKeyedSubscript:@"shareparticipant"];
  uint64_t v17 = [v7 objectForKeyedSubscript:@"shareparticipant"];
  uint64_t v18 = v17;
  if (v17)
  {
    if ([v17 length]
      && [v16 length]
      && ([v16 isEqualToString:v18] & 1) == 0
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 138412802;
      id v76 = v18;
      __int16 v77 = 2112;
      uint64_t v78 = self;
      __int16 v79 = 2112;
      uint64_t v80 = v16;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Trying to merge ShareParticipantIdentifier %@ into person node %@ with share participant identifier %@", buf, 0x20u);
      if (!v16)
      {
LABEL_25:
        if ([v18 length]) {
          [v11 addObject:@"shareparticipant"];
        }
      }
    }
    else if (!v16)
    {
      goto LABEL_25;
    }
  }
  id v68 = v18;
  long long v73 = v12;
  long long v74 = v10;
  uint64_t v19 = [v6 objectForKeyedSubscript:@"name"];
  long long v66 = [v7 objectForKeyedSubscript:@"name"];
  unint64_t v20 = [v66 length];
  id v67 = v19;
  if (v20 > [v19 length]) {
    [v11 addObject:@"name"];
  }
  uint64_t v21 = [v6 objectForKeyedSubscript:@"sex"];
  uint64_t v22 = [v21 unsignedIntegerValue];

  char v23 = [v7 objectForKeyedSubscript:@"sex"];
  uint64_t v24 = [v23 unsignedIntegerValue];

  if (!v22 && v24) {
    [v11 addObject:@"sex"];
  }
  long long v25 = [v6 objectForKeyedSubscript:@"agecategory"];
  uint64_t v26 = [v25 unsignedIntegerValue];

  long long v27 = [v7 objectForKeyedSubscript:@"agecategory"];
  uint64_t v28 = [v27 unsignedIntegerValue];

  if (!v26 && v28) {
    [v11 addObject:@"agecategory"];
  }
  id v29 = [v6 objectForKeyedSubscript:@"fav"];
  char v30 = [v29 BOOLValue];

  id v31 = [v7 objectForKeyedSubscript:@"fav"];
  int v32 = [v31 BOOLValue];

  if ((v30 & 1) == 0 && v32) {
    [v11 addObject:@"fav"];
  }
  long long v33 = [v6 objectForKeyedSubscript:@"usercreated"];
  char v34 = [v33 BOOLValue];

  long long v35 = [v7 objectForKeyedSubscript:@"usercreated"];
  int v36 = [v35 BOOLValue];

  if ((v34 & 1) == 0 && v36) {
    [v11 addObject:@"usercreated"];
  }
  long long v37 = [v6 objectForKeyedSubscript:@"bday"];
  uint64_t v65 = v37;
  if (v37)
  {
    long long v38 = (void *)MEMORY[0x1E4F1C9C8];
    [v37 doubleValue];
    uint64_t v39 = objc_msgSend(v38, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    uint64_t v39 = 0;
  }
  uint64_t v40 = [v7 objectForKeyedSubscript:@"bday"];
  __int16 v63 = v40;
  if (v40)
  {
    uint64_t v41 = (void *)MEMORY[0x1E4F1C9C8];
    [v40 doubleValue];
    uint64_t v42 = objc_msgSend(v41, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    uint64_t v42 = 0;
  }
  uint64_t v62 = (void *)v42;
  if (![(PGManager *)self date:v39 isEqualToDate:v42]) {
    [v11 addObject:@"bday"];
  }
  uint64_t v43 = [v6 objectForKeyedSubscript:@"pbday"];
  char v71 = v14;
  long long v61 = v43;
  if (v43)
  {
    long long v44 = (void *)MEMORY[0x1E4F1C9C8];
    [v43 doubleValue];
    uint64_t v45 = objc_msgSend(v44, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    uint64_t v45 = 0;
  }
  long long v64 = (void *)v39;
  long long v46 = [v7 objectForKeyedSubscript:@"pbday"];
  long long v47 = v46;
  if (v46)
  {
    uint64_t v48 = (void *)MEMORY[0x1E4F1C9C8];
    [v46 doubleValue];
    __int16 v49 = objc_msgSend(v48, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    __int16 v49 = 0;
  }
  if (!-[PGManager date:isEqualToDate:](self, "date:isEqualToDate:", v45, v49, v45)) {
    [v11 addObject:@"pbday"];
  }
  long long v50 = v11;
  __int16 v51 = [v6 objectForKeyedSubscript:@"anniv"];
  uint64_t v52 = v51;
  long long v69 = v16;
  if (v51)
  {
    uint64_t v53 = (void *)MEMORY[0x1E4F1C9C8];
    [v51 doubleValue];
    id v54 = objc_msgSend(v53, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    id v54 = 0;
  }
  uint64_t v55 = [v7 objectForKeyedSubscript:@"anniv"];
  id v56 = v55;
  if (v55)
  {
    int v57 = (void *)MEMORY[0x1E4F1C9C8];
    [v55 doubleValue];
    long long v58 = objc_msgSend(v57, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    long long v58 = 0;
  }
  if (![(PGManager *)self date:v54 isEqualToDate:v58]) {
    [v50 addObject:@"anniv"];
  }
  id v8 = v50;

  id v11 = v50;
  id v12 = v73;
  uint64_t v10 = v74;
  long long v13 = v72;
LABEL_66:

LABEL_67:
  return v8;
}

- (id)_homeWorkNodesByPersonNodeForContactIdentifiers:(id)a3 inGraph:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a4;
  id v7 = [v5 setWithArray:a3];
  id v8 = +[PGGraphPersonNodeCollection personNodesForContactIdentifiers:v7 inGraph:v6];

  uint64_t v9 = (void *)MEMORY[0x1E4F71E88];
  uint64_t v10 = +[PGGraphPersonNode homeOrWorkOfPerson];
  id v11 = [v9 adjacencyWithSources:v8 relation:v10 targetsClass:objc_opt_class()];

  return v11;
}

- (id)graphUpdateForContactsChangesWithProgressReporter:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PGManager *)self graphLoggingConnection];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "GetGraphUpdateForContactChanges", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v32 = mach_absolute_time();
  uint64_t v9 = [(PGManager *)self workingContext];
  uint64_t v10 = [v9 loggingConnection];

  id v11 = [PGGraphUpdate alloc];
  id v12 = [(PGManager *)self photoLibrary];
  long long v13 = [(PGGraphUpdate *)v11 initWithPhotoLibrary:v12 updateType:1];

  id v14 = v4;
  long long v15 = v13;
  *(void *)uint64_t buf = 0;
  uint64_t v39 = buf;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  int v16 = [v14 isCancelledWithProgress:0.0];
  v39[24] = v16;
  if (!v16)
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __73__PGManager_Contacts__graphUpdateForContactsChangesWithProgressReporter___block_invoke;
    v33[3] = &unk_1E68E9920;
    v33[4] = self;
    long long v37 = buf;
    id v18 = v14;
    id v34 = v18;
    uint64_t v19 = v10;
    long long v35 = v19;
    unint64_t v20 = v15;
    int v36 = v20;
    [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v33];
    if (v39[24])
    {
      v39[24] = 1;
    }
    else
    {
      uint8_t v21 = [v18 isCancelledWithProgress:1.0];
      v39[24] = v21;
      if ((v21 & 1) == 0)
      {
        uint64_t v27 = mach_absolute_time();
        uint32_t numer = info.numer;
        uint32_t denom = info.denom;
        char v30 = v8;
        id v31 = v30;
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)uint64_t v43 = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v31, OS_SIGNPOST_INTERVAL_END, v6, "GetGraphUpdateForContactChanges", "", v43, 2u);
        }

        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t v43 = 136315394;
          *(void *)long long v44 = "GetGraphUpdateForContactChanges";
          *(_WORD *)&v44[8] = 2048;
          *(double *)&v44[10] = (float)((float)((float)((float)(v27 - v32) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v43, 0x16u);
        }
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
          goto LABEL_14;
        }
        *(_WORD *)uint64_t v43 = 0;
        char v23 = "PGManager (Contacts): finished proceeding with the graph update from Contacts";
        uint64_t v22 = v19;
        uint32_t v24 = 2;
        goto LABEL_13;
      }
    }
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
LABEL_14:
      long long v25 = v20;

      goto LABEL_15;
    }
    *(_DWORD *)uint64_t v43 = 67109378;
    *(_DWORD *)long long v44 = 92;
    *(_WORD *)&v44[4] = 2080;
    *(void *)&v44[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Core/PGManager+Contacts.m";
    uint64_t v22 = MEMORY[0x1E4F14500];
    char v23 = "Cancelled at line %d in file %s";
    uint32_t v24 = 18;
LABEL_13:
    _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, v23, v43, v24);
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v43 = 67109378;
    *(_DWORD *)long long v44 = 34;
    *(_WORD *)&v44[4] = 2080;
    *(void *)&v44[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Core/PGManager+Contacts.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v43, 0x12u);
  }
  uint64_t v17 = v15;
LABEL_15:
  _Block_object_dispose(buf, 8);

  return v15;
}

void __73__PGManager_Contacts__graphUpdateForContactsChangesWithProgressReporter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 graph];
  id v5 = +[PGGraphPersonNodeCollection personNodesIncludingMeInGraph:v4];
  if ([v5 count])
  {
    os_signpost_id_t v6 = *(void **)(a1 + 32);
    id v7 = [v5 contactIdentifiers];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __73__PGManager_Contacts__graphUpdateForContactsChangesWithProgressReporter___block_invoke_2;
    v29[3] = &unk_1E68EBE50;
    uint64_t v31 = *(void *)(a1 + 64);
    id v30 = *(id *)(a1 + 40);
    id v8 = [v6 clsPersonByContactIdentifierWithPersonContactIdentifiers:v7 progressBlock:v29];

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      uint64_t v9 = *(NSObject **)(a1 + 48);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "PGManager (Contacts): people in Contacts: %@", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v10 = *(void **)(a1 + 32);
      id v11 = [v8 allKeys];
      id v12 = [v10 _homeWorkNodesByPersonNodeForContactIdentifiers:v11 inGraph:v4];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v33 = 0x2020000000;
      uint64_t v34 = 0x3FE3333333333333;
      double v13 = 1.0 / (double)(unint64_t)[v5 count];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __73__PGManager_Contacts__graphUpdateForContactsChangesWithProgressReporter___block_invoke_259;
      void v18[3] = &unk_1E68E7C10;
      id v14 = v8;
      uint64_t v15 = *(void *)(a1 + 32);
      id v19 = v14;
      uint64_t v20 = v15;
      id v16 = v12;
      id v21 = v16;
      id v22 = v4;
      id v23 = *(id *)(a1 + 48);
      id v24 = *(id *)(a1 + 56);
      double v28 = v13;
      uint64_t v17 = *(void *)(a1 + 64);
      p_long long buf = &buf;
      uint64_t v27 = v17;
      id v25 = *(id *)(a1 + 40);
      [v5 enumerateNodesUsingBlock:v18];

      _Block_object_dispose(&buf, 8);
    }
  }
}

uint64_t __73__PGManager_Contacts__graphUpdateForContactsChangesWithProgressReporter___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:0.1];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v4 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

void __73__PGManager_Contacts__graphUpdateForContactsChangesWithProgressReporter___block_invoke_259(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  os_signpost_id_t v6 = (void *)MEMORY[0x1D25FED50]();
  id v7 = [v5 contactIdentifier];
  if ([v7 length])
  {
    id v8 = [v5 localIdentifier];
    uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
    if (v9)
    {
      id v19 = a3;
      uint64_t v10 = [v5 propertyDictionary];
      id v11 = +[PGGraphPersonNode propertiesWithPerson:v9];
      id v12 = [*(id *)(a1 + 40) _changingPropertyKeysForPersonProperties:v10 andPersonContactProperties:v11];
      if ([v12 count]
        || [*(id *)(a1 + 40) homeWorkAddressesDidChangeForPersonInContact:v9 andPersonNode:v5 withHomeWorkNodesByPersonNode:*(void *)(a1 + 48) graph:*(void *)(a1 + 56)])
      {
        double v13 = *(NSObject **)(a1 + 64);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          id v21 = v5;
          __int16 v22 = 2112;
          id v23 = v12;
          _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "PGManager (Contacts): Update %@ with information from Contacts for property keys = %@", buf, 0x16u);
        }
        id v14 = [[PGGraphPersonChange alloc] initWithPersonLocalIdentifier:v8 contactIdentifier:v7 propertyNames:v12];
        [*(id *)(a1 + 72) addChange:v14];
      }
      a3 = v19;
    }
    else
    {
      uint64_t v15 = +[PGGraphPersonNode changedPropertyNamesForContactsChange];
      id v16 = [[PGGraphPersonChange alloc] initWithPersonLocalIdentifier:v8 contactIdentifier:v7 propertyNames:v15];
      [*(id *)(a1 + 72) addChange:v16];
    }
    *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(double *)(a1 + 104)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 24);
    uint64_t v17 = *(void *)(*(void *)(a1 + 96) + 8);
    if (*(unsigned char *)(v17 + 24))
    {
      char v18 = 1;
    }
    else
    {
      char v18 = [*(id *)(a1 + 80) isCancelledWithProgress:*(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];
      uint64_t v17 = *(void *)(*(void *)(a1 + 96) + 8);
    }
    *(unsigned char *)(v17 + 24) = v18;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
      *a3 = 1;
    }
  }
}

- (id)libraryStatisticsForCurrentPhotoLibrary
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(PGManager *)self _momentsStatisticsForCurrentPhotoLibrary];
  if ([v4 count]) {
    [v3 addEntriesFromDictionary:v4];
  }
  id v5 = [(PGManager *)self _collectionStatisticsForCurrentPhotoLibrary];

  if ([v5 count]) {
    [v3 addEntriesFromDictionary:v5];
  }
  os_signpost_id_t v6 = [(PGManager *)self _yearsStatisticsForCurrentPhotoLibrary];

  if ([v6 count]) {
    [v3 addEntriesFromDictionary:v6];
  }

  return v3;
}

- (id)_yearsStatisticsForCurrentPhotoLibrary
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(PGManager *)self photoLibrary];
  id v5 = [v4 librarySpecificFetchOptions];

  os_signpost_id_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v16[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v5 setSortDescriptors:v7];

  id v8 = [MEMORY[0x1E4F39008] fetchMomentListsWithSubtype:2 options:v5];
  uint64_t v9 = [(PGManager *)self _extractYearStatsFromOrderedCollectionFetchResults:v8 fetchOptions:v5 yearEntryKey:@"startYear" numberOfYearsEntryKey:0];
  [v3 addEntriesFromDictionary:v9];
  uint64_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:0];
  uint64_t v15 = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  [v5 setSortDescriptors:v11];

  id v12 = [MEMORY[0x1E4F39008] fetchMomentListsWithSubtype:2 options:v5];
  double v13 = [(PGManager *)self _extractYearStatsFromOrderedCollectionFetchResults:v12 fetchOptions:v5 yearEntryKey:@"endYear" numberOfYearsEntryKey:@"numberOfYearsWithAsset"];
  [v3 addEntriesFromDictionary:v13];

  return v3;
}

- (id)_extractYearStatsFromOrderedCollectionFetchResults:(id)a3 fetchOptions:(id)a4 yearEntryKey:(id)a5 numberOfYearsEntryKey:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v26 = a4;
  id v23 = a5;
  id v25 = a6;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v10)
  {
    id v12 = 0;
    uint64_t v11 = 0;
    uint64_t v18 = -1;
    uint64_t v17 = obj;
    goto LABEL_18;
  }
  uint64_t v11 = 0;
  id v12 = 0;
  uint64_t v13 = *(void *)v33;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v33 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      id v16 = [MEMORY[0x1E4F38EE8] fetchMomentsInMomentList:v15 options:v26];
      uint64_t v28 = 0;
      id v29 = &v28;
      uint64_t v30 = 0x2020000000;
      uint64_t v31 = 0;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __125__PGManager_Diagnostics___extractYearStatsFromOrderedCollectionFetchResults_fetchOptions_yearEntryKey_numberOfYearsEntryKey___block_invoke;
      v27[3] = &unk_1E68E7DC0;
      v27[4] = &v28;
      [v16 enumerateObjectsUsingBlock:v27];
      if (v29[3])
      {
        if (!v12)
        {
          id v12 = [v15 startDate];
        }
        if (!v25)
        {
          _Block_object_dispose(&v28, 8);

          goto LABEL_15;
        }
        ++v11;
      }
      _Block_object_dispose(&v28, 8);
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_15:

  if (v12)
  {
    uint64_t v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v18 = [v17 component:4 fromDate:v12];
LABEL_18:

    goto LABEL_20;
  }
  uint64_t v18 = -1;
LABEL_20:
  id v19 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v20 = [NSNumber numberWithInteger:v18];
  [v19 setObject:v20 forKey:v23];

  if (v25)
  {
    id v21 = [NSNumber numberWithUnsignedInteger:v11];
    [v19 setObject:v21 forKey:v25];
  }
  return v19;
}

uint64_t __125__PGManager_Diagnostics___extractYearStatsFromOrderedCollectionFetchResults_fetchOptions_yearEntryKey_numberOfYearsEntryKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 estimatedAssetCount];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (id)_collectionStatisticsForCurrentPhotoLibrary
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v28 = [MEMORY[0x1E4F1CA60] dictionary];
  id v2 = [(PGManager *)self photoLibrary];
  uint64_t v31 = [v2 librarySpecificFetchOptions];

  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v42[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  [v31 setSortDescriptors:v4];

  id v5 = [MEMORY[0x1E4F39008] fetchMomentListsWithSubtype:1 options:v31];
  os_signpost_id_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v5;
  unint64_t v7 = 0;
  uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v8)
  {
    uint64_t v30 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v11 = [v10 localIdentifier];
        uint64_t v33 = 0;
        long long v34 = &v33;
        uint64_t v35 = 0x2020000000;
        uint64_t v36 = 0;
        id v12 = [MEMORY[0x1E4F38EE8] fetchMomentsInMomentList:v10 options:v31];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __69__PGManager_Diagnostics___collectionStatisticsForCurrentPhotoLibrary__block_invoke;
        v32[3] = &unk_1E68E7DC0;
        v32[4] = &v33;
        [v12 enumerateObjectsUsingBlock:v32];
        uint64_t v13 = [v6 objectForKeyedSubscript:v11];
        if (v13) {
          id v14 = (void *)v13;
        }
        else {
          id v14 = &unk_1F28D1710;
        }
        uint64_t v15 = [v14 unsignedIntegerValue];
        id v16 = [NSNumber numberWithUnsignedInteger:v34[3] + v15];
        [v6 setObject:v16 forKeyedSubscript:v11];

        uint64_t v17 = v34[3];
        _Block_object_dispose(&v33, 8);

        v7 += v17;
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v8);
  }

  unint64_t v18 = [v6 count];
  unint64_t v19 = v18;
  if (v18) {
    unint64_t v20 = v7 / v18;
  }
  else {
    unint64_t v20 = 0;
  }
  id v21 = [v6 allValues];
  unint64_t v22 = [(PGManager *)self medianValueFromUnsignedItegerArray:v21];

  id v23 = [NSNumber numberWithUnsignedInteger:v19];
  [v28 setObject:v23 forKey:@"numberOfCollections"];

  uint64_t v24 = [NSNumber numberWithUnsignedInteger:v20];
  [v28 setObject:v24 forKey:@"averageNumberOfAssetsInCollections"];

  id v25 = [NSNumber numberWithUnsignedInteger:v22];
  [v28 setObject:v25 forKey:@"medianNumberOfAssetsInCollections"];

  return v28;
}

uint64_t __69__PGManager_Diagnostics___collectionStatisticsForCurrentPhotoLibrary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 estimatedAssetCount];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (id)_momentsStatisticsForCurrentPhotoLibrary
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v28 = [MEMORY[0x1E4F1CA60] dictionary];
  id v26 = self;
  id v3 = [(PGManager *)self photoLibrary];
  uint64_t v4 = [v3 librarySpecificFetchOptions];

  uint64_t v27 = (void *)v4;
  id v5 = [MEMORY[0x1E4F38EE8] fetchMomentsWithOptions:v4];
  unint64_t v25 = [v5 count];
  os_signpost_id_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v15 = (void *)MEMORY[0x1D25FED50]();
        uint64_t v16 = [v14 estimatedAssetCount];
        uint64_t v17 = [NSNumber numberWithUnsignedInteger:v16];
        [v6 addObject:v17];

        v10 += v16;
        if (v16 == 1) {
          ++v11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
    uint64_t v11 = 0;
  }

  unint64_t v18 = v10 / v25;
  uint64_t v19 = [(PGManager *)v26 medianValueFromUnsignedItegerArray:v6];
  unint64_t v20 = [NSNumber numberWithUnsignedInteger:v25];
  [v28 setObject:v20 forKey:@"numberOfMoments"];

  id v21 = [NSNumber numberWithUnsignedInteger:v18];
  [v28 setObject:v21 forKey:@"averageNumberOfAssetsInMoments"];

  unint64_t v22 = [NSNumber numberWithUnsignedInteger:v19];
  [v28 setObject:v22 forKey:@"medianNumberOfAssetsInMoments"];

  id v23 = [NSNumber numberWithUnsignedInteger:v11];
  [v28 setObject:v23 forKey:@"numberOfMomentsWithSingleAsset"];

  return v28;
}

- (unint64_t)medianValueFromUnsignedItegerArray:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      uint64_t v4 = [v3 firstObject];
      unint64_t v5 = [v4 unsignedIntegerValue];
    }
    else
    {
      uint64_t v4 = [v3 sortedArrayUsingSelector:sel_compare_];
      char v6 = [v3 count];
      unint64_t v7 = (unint64_t)[v4 count] >> 1;
      if (v6)
      {
        uint64_t v8 = [v4 objectAtIndex:v7];
        unint64_t v5 = [v8 unsignedIntegerValue];
      }
      else
      {
        uint64_t v8 = [v4 objectAtIndex:v7 - 1];
        v13[0] = v8;
        uint64_t v9 = [v4 objectAtIndex:v7];
        v13[1] = v9;
        unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
        uint64_t v11 = [v10 valueForKeyPath:@"@avg.self"];
        unint64_t v5 = [v11 unsignedIntegerValue];
      }
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)diagnosticsSummaryInfoOnExistingMemoriesForCurrentPhotoLibrary
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PGManager *)self photoLibrary];
  uint64_t v4 = [v3 librarySpecificFetchOptions];

  [v4 setIncludePendingMemories:0];
  [v4 setIncludeRejectedMemories:0];
  unint64_t v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v23[0] = v5;
  char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v4 setSortDescriptors:v6];

  [v4 setFetchLimit:15];
  unint64_t v7 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v4];
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v15 = -[PGManager _diagnosticSummaryInfoForMemory:](self, "_diagnosticSummaryInfoForMemory:", v14, (void)v18);
        uint64_t v16 = [v14 localIdentifier];
        [v8 setValue:v15 forKey:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)_diagnosticSummaryInfoForMemory:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  char v6 = [v4 localizedTitle];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [v4 localizedTitle];
    [v5 setObject:v8 forKey:@"title"];
  }
  uint64_t v9 = [v4 assetCollectionType];
  uint64_t v10 = [NSNumber numberWithInteger:v9];
  [v5 setObject:v10 forKey:@"assetCollectionType"];

  uint64_t v11 = [v4 assetCollectionSubtype];
  uint64_t v12 = [NSNumber numberWithInteger:v11];
  [v5 setObject:v12 forKey:@"assetCollectionSubType"];

  uint64_t v13 = [v4 creationDate];

  if (v13)
  {
    id v14 = [v4 creationDate];
    [v5 setObject:v14 forKey:@"creationDate"];
  }
  uint64_t v15 = [v4 localIdentifier];

  if (v15)
  {
    uint64_t v16 = [v4 localIdentifier];
    [v5 setObject:v16 forKey:@"localIdentifier"];
  }
  uint64_t v17 = [v4 isRejected];
  long long v18 = [NSNumber numberWithBool:v17];
  [v5 setObject:v18 forKey:@"rejected"];

  uint64_t v19 = [v4 isFavorite];
  long long v20 = [NSNumber numberWithBool:v19];
  [v5 setObject:v20 forKey:@"favorite"];

  uint64_t v21 = [v4 pendingState];
  unint64_t v22 = [NSNumber numberWithUnsignedShort:v21];
  [v5 setObject:v22 forKey:@"pendingState"];

  uint64_t v23 = [v4 photosGraphVersion];
  uint64_t v24 = [NSNumber numberWithLongLong:v23];
  [v5 setObject:v24 forKey:@"photoGraphVersion"];

  unint64_t v25 = [v4 photosGraphProperties];
  if (v25)
  {
    id v26 = [(PGManager *)self _sanitizeGraphDataDictionaryForArchiving:v25 referencedMemory:v4];
    [v5 setObject:v26 forKey:@"photosGraphProperties"];
  }
  uint64_t v27 = [v4 movieData];
  if (v27) {
    [v5 setObject:v27 forKey:@"movieData"];
  }
  [v4 score];
  id v28 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v5 setObject:v28 forKey:@"score"];

  long long v29 = [v4 uuid];
  if (v29) {
    [v5 setObject:v29 forKey:@"uuid"];
  }
  long long v30 = [v4 lastViewedDate];
  if (v30) {
    [v5 setObject:v30 forKey:@"lastViewedDate"];
  }
  long long v31 = [v4 lastMoviePlayedDate];
  if (v31) {
    [v5 setObject:v31 forKey:@"lastMoviePlayedDate"];
  }
  uint64_t v32 = [v4 category];
  uint64_t v33 = [MEMORY[0x1E4F39160] stringForCategory:v32];
  [v5 setObject:v33 forKey:@"category"];
  uint64_t v34 = [v4 subcategory];
  uint64_t v35 = [MEMORY[0x1E4F39160] stringForSubcategory:v34];
  [v5 setObject:v35 forKey:@"subCategory"];
  uint64_t v36 = [(PGManager *)self _extractDatesAndAssetCountsFromMemory:v4];
  [v5 addEntriesFromDictionary:v36];

  return v5;
}

- (id)_extractDatesAndAssetCountsFromMemory:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v5 = [v3 photoLibrary];
  char v6 = [v5 librarySpecificFetchOptions];

  [v6 setIncludeGuestAssets:1];
  uint64_t v7 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v3 options:v6];
  uint64_t v8 = [v7 count];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v21 = 0;
    unint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy__26916;
    unint64_t v25 = __Block_byref_object_dispose__26917;
    id v26 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy__26916;
    uint64_t v19 = __Block_byref_object_dispose__26917;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__PGManager_Diagnostics___extractDatesAndAssetCountsFromMemory___block_invoke;
    v14[3] = &unk_1E68E7D98;
    void v14[4] = &v21;
    v14[5] = &v15;
    [v7 enumerateObjectsUsingBlock:v14];
    uint64_t v10 = v22[5];
    if (v10) {
      [v4 setObject:v10 forKey:@"startDate"];
    }
    uint64_t v11 = v16[5];
    if (v11) {
      [v4 setObject:v11 forKey:@"endDate"];
    }
    uint64_t v12 = [NSNumber numberWithUnsignedInteger:v9];
    [v4 setObject:v12 forKey:@"estimatedAssetCount"];

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);
  }
  return v4;
}

void __64__PGManager_Diagnostics___extractDatesAndAssetCountsFromMemory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 creationDate];
  id v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  obuint64_t j = v3;
  if (*(void *)(v5 + 40))
  {
    if (objc_msgSend(v3, "compare:") != -1) {
      goto LABEL_5;
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v4 = obj;
  }
  objc_storeStrong((id *)(v5 + 40), v4);
LABEL_5:
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v6 + 40))
  {
    if (objc_msgSend(obj, "compare:") != 1) {
      goto LABEL_9;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  objc_storeStrong((id *)(v6 + 40), obj);
LABEL_9:
}

- (id)_sanitizeGraphDataDictionaryForArchiving:(id)a3 referencedMemory:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKey:@"backingMoments"];
    uint64_t v9 = [v6 objectForKey:@"collectionsInfo"];
    id v40 = v7;
    uint64_t v43 = (void *)v9;
    if (!v8 || !v9)
    {
      uint64_t v10 = [(PGManager *)self photoLibrary];
      uint64_t v11 = [v10 librarySpecificFetchOptions];

      char v41 = (void *)v11;
      uint64_t v12 = [MEMORY[0x1E4F38EE8] fetchMomentsBackingMemory:v7 options:v11];
      uint64_t v13 = [v12 fetchedObjects];
      id v14 = [v6 objectForKeyedSubscript:@"info"];
      uint64_t v15 = [v14 objectForKeyedSubscript:@"meaningLabels"];

      uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
      uint64_t v17 = [(PGManager *)self memoryDebugInformationWithMoments:v13 meaningLabels:v16];

      uint64_t v18 = [v17 objectForKeyedSubscript:@"backingMoments"];
      uint64_t v19 = (void *)v18;
      if (v8 || !v18)
      {
        uint64_t v21 = +[PGLogging sharedLogging];
        unint64_t v22 = [v21 loggingConnection];

        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v52 = v13;
          _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "Memory backing moments debug information is not available for moments: %@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v8 = [v17 objectForKeyedSubscript:@"backingMoments"];
      }
      uint64_t v23 = [v17 objectForKeyedSubscript:@"collectionsInfo"];

      if (v43 || !v23)
      {
        uint64_t v24 = +[PGLogging sharedLogging];
        unint64_t v25 = [v24 loggingConnection];

        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          id v26 = [v15 componentsJoinedByString:@", "];
          *(_DWORD *)long long buf = 138412546;
          uint64_t v52 = v13;
          __int16 v53 = 2112;
          id v54 = v26;
          _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, "Memory graph collections debug information is not available for moments: '%@' and meanings: '%@'", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v43 = [v17 objectForKeyedSubscript:@"collectionsInfo"];
      }
    }
    id v42 = v6;
    long long v39 = (void *)[v6 mutableCopy];
    uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v28 = v8;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v34 = [v33 objectForKey:@"keywords"];
          if (v34)
          {
            uint64_t v35 = [MEMORY[0x1E4F1CA60] dictionary];
            v44[0] = MEMORY[0x1E4F143A8];
            v44[1] = 3221225472;
            v44[2] = __84__PGManager_Diagnostics___sanitizeGraphDataDictionaryForArchiving_referencedMemory___block_invoke;
            v44[3] = &unk_1E68E7D70;
            id v45 = v35;
            id v36 = v35;
            [v34 enumerateKeysAndObjectsUsingBlock:v44];
            long long v37 = (void *)[v33 mutableCopy];
            [v37 setObject:v36 forKey:@"keywords"];
            [v27 addObject:v37];
          }
          else
          {
            [v27 addObject:v33];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v30);
    }

    id v20 = v39;
    [v39 setObject:v27 forKey:@"backingMoments"];
    if (v43) {
      [v39 setObject:v43 forKey:@"collectionsInfo"];
    }

    id v7 = v40;
    id v6 = v42;
  }
  else
  {
    id v20 = [MEMORY[0x1E4F1C9E8] dictionary];
  }

  return v20;
}

void __84__PGManager_Diagnostics___sanitizeGraphDataDictionaryForArchiving_referencedMemory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 stringValue];

    id v5 = (id)v6;
  }
  [*(id *)(a1 + 32) setObject:v7 forKey:v5];
}

- (id)highlightDebugInformationWithHighlight:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [(PGManager *)self photoLibrary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__PGManager_Diagnostics__highlightDebugInformationWithHighlight___block_invoke;
  v12[3] = &unk_1E68F0898;
  id v13 = v4;
  id v14 = v6;
  id v7 = v5;
  id v15 = v7;
  uint64_t v16 = self;
  id v8 = v6;
  id v9 = v4;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v12];
  id v10 = v7;

  return v10;
}

void __65__PGManager_Diagnostics__highlightDebugInformationWithHighlight___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 graph];
  id v4 = [*(id *)(a1 + 32) uuid];
  id v5 = +[PGGraphHighlightNodeCollection highlightNodeForUUID:v4 inGraph:v3];
  uint64_t v6 = [v5 anyNode];

  if (v6)
  {
    uint64_t v30 = v3;
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(a1 + 32) nonDefaultCurationScorePercentageForPhotoLibrary:*(void *)(a1 + 40)];
    id v8 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v7 setObject:v8 forKeyedSubscript:@"curationScorePercentage"];

    [*(id *)(a1 + 32) faceAnalysisProgressForPhotoLibrary:*(void *)(a1 + 40)];
    id v9 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v7 setObject:v9 forKeyedSubscript:@"faceAnalysisProgress"];

    [*(id *)(a1 + 32) sceneAnalysisProgressForPhotoLibrary:*(void *)(a1 + 40)];
    id v10 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v7 setObject:v10 forKeyedSubscript:@"sceneAnalysisProgress"];

    [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:@"collectionsInfo"];
    uint64_t v11 = objc_alloc_init(PGNeighborScoreComputer);
    if ([v6 isTrip]) {
      id v12 = 0;
    }
    else {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v14 = [v6 collection];
    id v15 = [v14 momentNodes];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __65__PGManager_Diagnostics__highlightDebugInformationWithHighlight___block_invoke_2;
    v35[3] = &unk_1E68E7D48;
    uint64_t v16 = v11;
    id v36 = v16;
    id v37 = v3;
    id v17 = *(id *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 56);
    id v38 = v17;
    uint64_t v39 = v18;
    id v19 = v13;
    id v40 = v19;
    id v20 = v12;
    id v41 = v20;
    [v15 enumerateNodesUsingBlock:v35];

    [*(id *)(a1 + 48) setObject:v19 forKeyedSubscript:@"backingMoments"];
    if ([v20 count])
    {
      id v28 = v16;
      uint64_t v29 = v7;
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v22 = +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v42 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v32 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            if ([v20 containsObject:v27]) {
              [v21 addObject:v27];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v42 count:16];
        }
        while (v24);
      }
      [*(id *)(a1 + 48) setObject:v21 forKeyedSubscript:@"sortedMeaningLabels"];

      id v7 = v29;
      id v3 = v30;
      uint64_t v16 = v28;
    }
  }
}

void __65__PGManager_Diagnostics__highlightDebugInformationWithHighlight___block_invoke_2(uint64_t a1, void *a2)
{
  id v24 = a2;
  id v3 = (void *)MEMORY[0x1D25FED50]();
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "numberOfAssets"));
  [v4 setObject:v5 forKeyedSubscript:@"numberOfAssets"];

  uint64_t v6 = NSNumber;
  [v24 graphScore];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  [v4 setObject:v7 forKeyedSubscript:@"graphScore"];

  id v8 = NSNumber;
  [*(id *)(a1 + 32) neighborScoreWithMomentNode:v24];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  [v4 setObject:v9 forKeyedSubscript:@"neighborScore"];

  id v10 = NSNumber;
  [v24 contentScore];
  uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  [v4 setObject:v11 forKeyedSubscript:@"curationScore"];

  id v12 = [v24 keywordsForRelatedType:63 focusOnNodes:0];
  id v13 = (void *)[v12 mutableCopy];

  id v14 = [*(id *)(a1 + 40) momentForMomentNode:v24 inPhotoLibrary:*(void *)(a1 + 48)];
  if (v14)
  {
    id v15 = [v13 objectForKeyedSubscript:&unk_1F28D16F8];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = (id)[v15 mutableCopy];
    }
    id v17 = v16;
    uint64_t v18 = NSString;
    id v19 = MEMORY[0x1D25FE3C0]([v14 processedLocation]);
    id v20 = [v18 stringWithFormat:@"[processedLocationType] %@", v19];
    [v17 addObject:v20];

    [v13 setObject:v17 forKeyedSubscript:&unk_1F28D16F8];
  }
  if ([v13 count])
  {
    id v21 = [(id)objc_opt_class() exportableDictionaryFromKeywords:v13];
    [v4 setObject:v21 forKeyedSubscript:@"keywords"];
  }
  [*(id *)(a1 + 64) addObject:v4];
  unint64_t v22 = *(void **)(a1 + 72);
  uint64_t v23 = [v24 meaningLabels];
  [v22 unionSet:v23];
}

- (id)memoryDebugInformationWithMoments:(id)a3 meaningLabels:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  unint64_t v22 = __Block_byref_object_copy__26916;
  uint64_t v23 = __Block_byref_object_dispose__26917;
  id v24 = 0;
  id v8 = [(PGManager *)self serviceManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__PGManager_Diagnostics__memoryDebugInformationWithMoments_meaningLabels___block_invoke;
  v14[3] = &unk_1E68EF5F0;
  id v9 = v6;
  id v15 = v9;
  uint64_t v18 = &v19;
  id v10 = v7;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v14];
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __74__PGManager_Diagnostics__memoryDebugInformationWithMoments_meaningLabels___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v9), "uuid", (void)v17);
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v11 = [v3 graph];
  id v12 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:v4 inGraph:v11];

  id v13 = [v12 array];
  uint64_t v14 = +[PGMemoryDebugConvenience memoryDebugInformationWithMomentNodes:v13 meaningLabels:*(void *)(a1 + 40) serviceManager:*(void *)(a1 + 48)];
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicBag, 0);
  objc_storeStrong((id *)&self->_publicEventManager, 0);
  objc_storeStrong((id *)&self->_natureCache, 0);
  objc_storeStrong((id *)&self->_roiCache, 0);
  objc_storeStrong((id *)&self->_poiCache, 0);
  objc_storeStrong((id *)&self->_aoiCache, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_rebuildProgress, 0);
  objc_storeStrong((id *)&self->_graphConsistencyCheckLoggingConnection, 0);
  objc_storeStrong((id *)&self->_externalRelevanceLoggingConnection, 0);
  objc_storeStrong((id *)&self->_upNextLoggingConnection, 0);
  objc_storeStrong((id *)&self->_metricsLoggingConnection, 0);
  objc_storeStrong((id *)&self->_suggestionsLoggingConnection, 0);
  objc_storeStrong((id *)&self->_guessWhoLoggingConnection, 0);
  objc_storeStrong((id *)&self->_enrichmentLoggingConnection, 0);
  objc_storeStrong((id *)&self->_graphLoggingConnection, 0);
  objc_storeStrong((id *)&self->_ingestLoggingConnection, 0);
  objc_storeStrong((id *)&self->_relatedLoggingConnection, 0);
  objc_storeStrong((id *)&self->_memoriesLoggingConnection, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_metadataSnapshotOutputPathURL, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_coalescingGraphIsReady, 0);
  objc_storeStrong((id *)&self->_graphName, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_graphUpdateQueue, 0);
  objc_storeStrong((id *)&self->_graphAccessQueue, 0);
  objc_storeStrong((id *)&self->_mutableGraph, 0);
  objc_storeStrong((id *)&self->_musicCache, 0);
  objc_storeStrong((id *)&self->_cachedGraphPersistentStoreURL, 0);
  objc_storeStrong((id *)&self->_cachedGraphPersistenceParentDirectoryURL, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (void)setMusicBag:(id)a3
{
}

- (PGMusicBag)musicBag
{
  return self->_musicBag;
}

- (CLSPublicEventManager)publicEventManager
{
  return self->_publicEventManager;
}

- (CLSNatureCache)natureCache
{
  return self->_natureCache;
}

- (CLSROICache)roiCache
{
  return self->_roiCache;
}

- (CLSPOICache)poiCache
{
  return self->_poiCache;
}

- (CLSAOICache)aoiCache
{
  return self->_aoiCache;
}

- (CLSLocationCache)locationCache
{
  return self->_locationCache;
}

- (void)setRebuildProgress:(id)a3
{
}

- (NSProgress)rebuildProgress
{
  return self->_rebuildProgress;
}

- (OS_os_log)graphConsistencyCheckLoggingConnection
{
  return self->_graphConsistencyCheckLoggingConnection;
}

- (OS_os_log)externalRelevanceLoggingConnection
{
  return self->_externalRelevanceLoggingConnection;
}

- (OS_os_log)upNextLoggingConnection
{
  return self->_upNextLoggingConnection;
}

- (OS_os_log)metricsLoggingConnection
{
  return self->_metricsLoggingConnection;
}

- (OS_os_log)suggestionsLoggingConnection
{
  return self->_suggestionsLoggingConnection;
}

- (OS_os_log)guessWhoLoggingConnection
{
  return self->_guessWhoLoggingConnection;
}

- (OS_os_log)enrichmentLoggingConnection
{
  return self->_enrichmentLoggingConnection;
}

- (OS_os_log)graphLoggingConnection
{
  return self->_graphLoggingConnection;
}

- (OS_os_log)ingestLoggingConnection
{
  return self->_ingestLoggingConnection;
}

- (OS_os_log)relatedLoggingConnection
{
  return self->_relatedLoggingConnection;
}

- (OS_os_log)memoriesLoggingConnection
{
  return self->_memoriesLoggingConnection;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (BOOL)photoLibraryIsReadonly
{
  return self->_photoLibraryIsReadonly;
}

- (void)setMetadataSnapshotOutputPathURL:(id)a3
{
}

- (NSURL)metadataSnapshotOutputPathURL
{
  return self->_metadataSnapshotOutputPathURL;
}

- (CLSServiceManager)serviceManager
{
  return self->_serviceManager;
}

- (PGCurationManager)curationManager
{
  return self->_curationManager;
}

- (void)setLibraryAnalysisState:(unint64_t)a3
{
  self->_libraryAnalysisState = a3;
}

- (unint64_t)libraryAnalysisState
{
  return self->_libraryAnalysisState;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (OS_dispatch_queue)graphUpdateQueue
{
  return self->_graphUpdateQueue;
}

- (NSString)graphName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (id)workingContextForGraphConsistencyCheck
{
  id v2 = [[PGManagerWorkingContext alloc] initWithManager:self loggingConnection:self->_graphConsistencyCheckLoggingConnection];
  return v2;
}

- (id)workingContextForExternalRelevance
{
  id v2 = [[PGManagerWorkingContext alloc] initWithManager:self loggingConnection:self->_externalRelevanceLoggingConnection];
  return v2;
}

- (id)workingContextForUpNext
{
  id v2 = [[PGManagerWorkingContext alloc] initWithManager:self loggingConnection:self->_upNextLoggingConnection];
  return v2;
}

- (id)workingContextForMetrics
{
  id v2 = [[PGManagerWorkingContext alloc] initWithManager:self loggingConnection:self->_metricsLoggingConnection];
  return v2;
}

- (id)workingContextForSuggestions
{
  id v2 = [[PGManagerWorkingContext alloc] initWithManager:self loggingConnection:self->_suggestionsLoggingConnection];
  return v2;
}

- (id)workingContextForEnrichment
{
  id v2 = [[PGManagerWorkingContext alloc] initWithManager:self loggingConnection:self->_enrichmentLoggingConnection];
  return v2;
}

- (id)workingContextForRelated
{
  id v2 = [[PGManagerWorkingContext alloc] initWithManager:self loggingConnection:self->_relatedLoggingConnection];
  return v2;
}

- (id)workingContextForMemories
{
  id v2 = [[PGManagerWorkingContext alloc] initWithManager:self loggingConnection:self->_memoriesLoggingConnection];
  return v2;
}

- (id)workingContext
{
  id v2 = [[PGManagerWorkingContext alloc] initWithManager:self loggingConnection:self->_loggingConnection];
  return v2;
}

- (int64_t)validatePHObject:(id)a3 featureAggregationValidator:(id)a4 assetFetchOptionPropertySet:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(PGManager *)self isReady])
  {
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__30423;
    uint64_t v25 = __Block_byref_object_dispose__30424;
    id v26 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __92__PGManager_validatePHObject_featureAggregationValidator_assetFetchOptionPropertySet_error___block_invoke;
    v15[3] = &unk_1E68E8500;
    long long v19 = &v27;
    id v16 = v11;
    id v17 = v10;
    id v18 = v12;
    long long v20 = &v21;
    [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v15];
    int64_t v13 = v28[3];
    if (a6 && !v13)
    {
      *a6 = (id) v22[5];
      int64_t v13 = v28[3];
    }

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    int64_t v13 = [v11 isValidEntity:v10 graph:0 assetFetchOptionPropertySet:v12 error:a6];
  }

  return v13;
}

void __92__PGManager_validatePHObject_featureAggregationValidator_assetFetchOptionPropertySet_error___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = [a2 graph];
  uint64_t v6 = a1[6];
  uint64_t v7 = *(void *)(a1[8] + 8);
  obuint64_t j = *(id *)(v7 + 40);
  uint64_t v8 = [v3 isValidEntity:v4 graph:v5 assetFetchOptionPropertySet:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(void *)(*(void *)(a1[7] + 8) + 24) = v8;
}

- (int64_t)validatePHObject:(id)a3 graphRelationsFeatureValidator:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(PGManager *)self isReady])
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    long long v20 = __Block_byref_object_copy__30423;
    uint64_t v21 = __Block_byref_object_dispose__30424;
    id v22 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__PGManager_validatePHObject_graphRelationsFeatureValidator_error___block_invoke;
    v12[3] = &unk_1E68E84D8;
    uint64_t v15 = &v23;
    id v13 = v9;
    id v14 = v8;
    id v16 = &v17;
    [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v12];
    int64_t v10 = v24[3];
    if (a5 && !v10)
    {
      *a5 = (id) v18[5];
      int64_t v10 = v24[3];
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    int64_t v10 = [v9 isValidEntity:v8 graph:0 error:a5];
  }

  return v10;
}

void __67__PGManager_validatePHObject_graphRelationsFeatureValidator_error___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = [a2 graph];
  uint64_t v6 = *(void *)(a1[7] + 8);
  obuint64_t j = *(id *)(v6 + 40);
  uint64_t v7 = [v3 isValidEntity:v4 graph:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(void *)(*(void *)(a1[6] + 8) + 24) = v7;
}

- (id)assetCollectionFingerprintsWithVersion:(int64_t)a3 forAssetCollections:(id)a4 withTransformers:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if ([(PGManager *)self isReady])
  {
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__30423;
    long long v31 = __Block_byref_object_dispose__30424;
    id v32 = 0;
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__30423;
    uint64_t v25 = __Block_byref_object_dispose__30424;
    id v26 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __95__PGManager_assetCollectionFingerprintsWithVersion_forAssetCollections_withTransformers_error___block_invoke;
    v15[3] = &unk_1E68E8898;
    id v18 = &v27;
    int64_t v20 = a3;
    id v16 = v10;
    id v17 = v11;
    uint64_t v19 = &v21;
    [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v15];
    id v12 = (void *)v28[5];
    if (a6 && !v12)
    {
      *a6 = (id) v22[5];
      id v12 = (void *)v28[5];
    }
    id v13 = v12;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    id v13 = +[PGFingerprint assetCollectionFingerprintsWithVersion:a3 forAssetCollections:v10 withGraph:0 withTransformers:v11 error:a6];
  }

  return v13;
}

void __95__PGManager_assetCollectionFingerprintsWithVersion_forAssetCollections_withTransformers_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[8];
  uint64_t v4 = a1[4];
  id v5 = [a2 graph];
  uint64_t v6 = a1[5];
  uint64_t v7 = *(void *)(a1[7] + 8);
  obuint64_t j = *(id *)(v7 + 40);
  uint64_t v8 = +[PGFingerprint assetCollectionFingerprintsWithVersion:v3 forAssetCollections:v4 withGraph:v5 withTransformers:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)assetFingerprintsWithVersion:(int64_t)a3 forAssets:(id)a4 withTransformers:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if ([(PGManager *)self isReady])
  {
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__30423;
    long long v31 = __Block_byref_object_dispose__30424;
    id v32 = 0;
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__30423;
    uint64_t v25 = __Block_byref_object_dispose__30424;
    id v26 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__PGManager_assetFingerprintsWithVersion_forAssets_withTransformers_error___block_invoke;
    v15[3] = &unk_1E68E8898;
    id v18 = &v27;
    int64_t v20 = a3;
    id v16 = v10;
    id v17 = v11;
    uint64_t v19 = &v21;
    [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v15];
    id v12 = (void *)v28[5];
    if (a6 && !v12)
    {
      *a6 = (id) v22[5];
      id v12 = (void *)v28[5];
    }
    id v13 = v12;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    id v13 = +[PGFingerprint assetFingerprintsWithVersion:a3 forAssets:v10 withGraph:0 withTransformers:v11 error:a6];
  }

  return v13;
}

void __75__PGManager_assetFingerprintsWithVersion_forAssets_withTransformers_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[8];
  uint64_t v4 = a1[4];
  id v5 = [a2 graph];
  uint64_t v6 = a1[5];
  uint64_t v7 = *(void *)(a1[7] + 8);
  obuint64_t j = *(id *)(v7 + 40);
  uint64_t v8 = +[PGFingerprint assetFingerprintsWithVersion:v3 forAssets:v4 withGraph:v5 withTransformers:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (BOOL)canProceedWithFullGraphRebuildStamp:(unint64_t)a3
{
  unint64_t v3 = atomic_load(&self->_fullGraphRebuildStamp);
  return v3 == a3;
}

- (unint64_t)currentFullGraphRebuildStamp
{
  return atomic_load(&self->_fullGraphRebuildStamp);
}

- (void)stampFullGraphRebuild
{
}

- (BOOL)copyGraphToURL:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__PGManager_copyGraphToURL___block_invoke;
  v7[3] = &unk_1E68F0A28;
  uint64_t v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __28__PGManager_copyGraphToURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [a2 graph];
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = 0;
  char v5 = [v3 copyPersistentStoreToURL:v4 error:&v10];
  id v6 = v10;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 == 0;
  }
  if (!v7)
  {
    id v8 = +[PGLogging sharedLogging];
    uint64_t v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "requested graph copy failed: %@", buf, 0xCu);
    }
  }
}

- (BOOL)saveGraphToURL:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__PGManager_saveGraphToURL___block_invoke;
  v7[3] = &unk_1E68F0A28;
  uint64_t v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __28__PGManager_saveGraphToURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 graph];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 saveToURL:*(void *)(a1 + 32)];
}

- (void)matchWithVisualFormat:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__PGManager_matchWithVisualFormat_usingBlock___block_invoke;
  void v10[3] = &unk_1E68E84B0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v10];
}

void __46__PGManager_matchWithVisualFormat_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 graph];
  uint64_t v47 = a1;
  uint64_t v4 = *(void *)(a1 + 32);
  id v76 = 0;
  id v5 = [v3 matchWithVisualFormat:v4 elements:MEMORY[0x1E4F1CC08] error:&v76];
  id v46 = v76;

  long long v58 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v59 = v5;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  obuint64_t j = [v5 nodesNames];
  uint64_t v52 = [obj countByEnumeratingWithState:&v72 objects:v86 count:16];
  if (v52)
  {
    uint64_t v50 = *(void *)v73;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v73 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v54 = *(void *)(*((void *)&v72 + 1) + 8 * v6);
        uint64_t v56 = v6;
        id v7 = objc_msgSend(v59, "nodesForName:");
        id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:1];
        v85 = v8;
        id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
        uint64_t v10 = [v7 sortedArrayUsingDescriptors:v9];

        id v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v12 = v10;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v68 objects:v84 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v69;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v69 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(void **)(*((void *)&v68 + 1) + 8 * v16);
              id v18 = [MEMORY[0x1E4F1CA60] dictionary];
              uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "identifier"));
              [v18 setObject:v19 forKeyedSubscript:@"identifier"];

              int64_t v20 = [v17 label];
              [v18 setObject:v20 forKeyedSubscript:@"label"];

              uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v17, "domain"));
              [v18 setObject:v21 forKeyedSubscript:@"domain"];

              id v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "inEdgesCount"));
              [v18 setObject:v22 forKeyedSubscript:@"inEdgesCount"];

              uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "outEdgesCount"));
              [v18 setObject:v23 forKeyedSubscript:@"outEdgesCount"];

              id v24 = [v17 propertyDictionary];
              [v18 setObject:v24 forKeyedSubscript:@"properties"];

              [v11 addObject:v18];
              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v68 objects:v84 count:16];
          }
          while (v14);
        }

        v82[0] = @"count";
        uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
        v82[1] = @"nodes";
        v83[0] = v25;
        v83[1] = v11;
        id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
        [v58 setObject:v26 forKeyedSubscript:v54];

        uint64_t v6 = v56 + 1;
      }
      while (v56 + 1 != v52);
      uint64_t v52 = [obj countByEnumeratingWithState:&v72 objects:v86 count:16];
    }
    while (v52);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obja = [v59 edgesNames];
  uint64_t v53 = [obja countByEnumeratingWithState:&v64 objects:v81 count:16];
  if (v53)
  {
    uint64_t v51 = *(void *)v65;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v65 != v51) {
          objc_enumerationMutation(obja);
        }
        uint64_t v55 = *(void *)(*((void *)&v64 + 1) + 8 * v27);
        uint64_t v57 = v27;
        id v28 = objc_msgSend(v59, "edgesForName:");
        uint64_t v29 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:1];
        uint64_t v80 = v29;
        uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
        long long v31 = [v28 sortedArrayUsingDescriptors:v30];

        id v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v31, "count"));
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v33 = v31;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v60 objects:v79 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v61;
          do
          {
            uint64_t v37 = 0;
            do
            {
              if (*(void *)v61 != v36) {
                objc_enumerationMutation(v33);
              }
              id v38 = *(void **)(*((void *)&v60 + 1) + 8 * v37);
              uint64_t v39 = [MEMORY[0x1E4F1CA60] dictionary];
              id v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v38, "identifier"));
              [v39 setObject:v40 forKeyedSubscript:@"identifier"];

              id v41 = [v38 label];
              [v39 setObject:v41 forKeyedSubscript:@"label"];

              id v42 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v38, "domain"));
              [v39 setObject:v42 forKeyedSubscript:@"domain"];

              uint64_t v43 = [v38 propertyDictionary];
              [v39 setObject:v43 forKeyedSubscript:@"properties"];

              [v32 addObject:v39];
              ++v37;
            }
            while (v35 != v37);
            uint64_t v35 = [v33 countByEnumeratingWithState:&v60 objects:v79 count:16];
          }
          while (v35);
        }

        v77[0] = @"count";
        long long v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "count"));
        v77[1] = @"edges";
        v78[0] = v44;
        v78[1] = v32;
        id v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:2];
        [v58 setObject:v45 forKeyedSubscript:v55];

        uint64_t v27 = v57 + 1;
      }
      while (v57 + 1 != v53);
      uint64_t v53 = [obja countByEnumeratingWithState:&v64 objects:v81 count:16];
    }
    while (v53);
  }

  (*(void (**)(void))(*(void *)(v47 + 40) + 16))();
}

- (void)matchWithVisualFormat:(id)a3 elements:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__PGManager_matchWithVisualFormat_elements_usingBlock___block_invoke;
  v14[3] = &unk_1E68F17B0;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v14];
}

void __55__PGManager_matchWithVisualFormat_elements_usingBlock___block_invoke(void *a1, void *a2)
{
  id v3 = [a2 graph];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  id v8 = 0;
  uint64_t v6 = [v3 matchWithVisualFormat:v4 elements:v5 error:&v8];
  id v7 = v8;

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)waitUntilFinishedUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__PGManager_waitUntilFinishedUsingBlock___block_invoke;
  void v6[3] = &unk_1E68E83F0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PGManager *)self _waitLibraryUpdateUntilFinishedUsingBlock:v6];
}

void __41__PGManager_waitUntilFinishedUsingBlock___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__PGManager_waitUntilFinishedUsingBlock___block_invoke_2;
  v2[3] = &unk_1E68E9728;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _waitGraphUntilFinishedUsingBlock:v2];
}

uint64_t __41__PGManager_waitUntilFinishedUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_waitLibraryUpdateUntilFinishedUsingBlock:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PGManager__waitLibraryUpdateUntilFinishedUsingBlock___block_invoke;
  block[3] = &unk_1E68E83F0;
  block[4] = self;
  id v11 = v4;
  id v5 = v4;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PGManager__waitLibraryUpdateUntilFinishedUsingBlock___block_invoke_2;
  v8[3] = &unk_1E68E8488;
  id v9 = v6;
  id v7 = v6;
  [(PGManager *)self performAsynchronousGraphBarrierUsingBlock:v8];
}

uint64_t __55__PGManager__waitLibraryUpdateUntilFinishedUsingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _waitGraphUntilFinishedUsingBlock:*(void *)(a1 + 40)];
}

void __55__PGManager__waitLibraryUpdateUntilFinishedUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (void)_waitGraphUntilFinishedUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PGManager__waitGraphUntilFinishedUsingBlock___block_invoke;
  void v6[3] = &unk_1E68E8488;
  id v7 = v4;
  id v5 = v4;
  [(PGManager *)self performAsynchronousGraphBarrierUsingBlock:v6];
}

void __47__PGManager__waitGraphUntilFinishedUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__PGManager__waitGraphUntilFinishedUsingBlock___block_invoke_2;
  v3[3] = &unk_1E68E9728;
  id v4 = *(id *)(a1 + 32);
  [a2 performAsynchronousNotification:v3];
}

uint64_t __47__PGManager__waitGraphUntilFinishedUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)requiresReadOnly
{
  return 0;
}

- (BOOL)isBusy
{
  return [(PGManager *)self hasPendingGraphAccess] || self->_libraryAnalysisState == 1;
}

- (BOOL)_isReadyWithError:(id *)a3
{
  graph = self->_graph;
  if (a3 && !graph)
  {
    dispatch_block_t v6 = [(PGManager *)self graphPersistentStoreURL];
    if (v6 && +[PGGraph graphExistsAtURL:v6])
    {
      id v7 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "graphClass")), "initWithURL:persistenceOptions:error:", v6, 4, a3);
      if (v7) {
        [(PGManager *)self graphIsUsable:v7 error:a3];
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 27);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return graph != 0;
}

- (BOOL)isReady
{
  return [(PGManager *)self _isReadyWithError:0];
}

- (BOOL)_addressesDidChangeBetweenAddressesInGraph:(id)a3 andAddressesInContacts:(id)a4 addressType:(unint64_t)a5 person:(id)a6 graph:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = [v11 count];
  uint64_t v16 = [v12 count];
  if (v15 | v16)
  {
    if (!v15 || v16)
    {
      if (v15 || !v16)
      {
        uint64_t v24 = 0;
        uint64_t v25 = &v24;
        uint64_t v26 = 0x2020000000;
        uint64_t v27 = 0;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __104__PGManager__addressesDidChangeBetweenAddressesInGraph_andAddressesInContacts_addressType_person_graph___block_invoke;
        v20[3] = &unk_1E68E8460;
        id v22 = &v24;
        uint64_t v23 = 0x4062C00000000000;
        id v21 = v11;
        [v13 enumerateAddressesOfType:a5 asCLLocationsWithBlock:v20];
        BOOL v17 = v25[3] != 0;

        _Block_object_dispose(&v24, 8);
      }
      else
      {
        id v18 = +[PGGraphAddressNodeCollection addressNodesWithinDistance:v12 ofLocations:v14 inGraph:150.0];
        BOOL v17 = [v18 count] != 0;
      }
    }
    else
    {
      BOOL v17 = 1;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

void __104__PGManager__addressesDidChangeBetweenAddressesInGraph_andAddressesInContacts_addressType_person_graph___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [a2 coordinate];
  double v6 = v5;
  double v8 = v7;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "coordinate", (void)v16);
        if (+[PGLocationUtility coordinate:isCloseToCoordinate:threshold:](PGLocationUtility, "coordinate:isCloseToCoordinate:threshold:", v6, v8, v14, v15, *(double *)(a1 + 48)))
        {

          return;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *a3 = 1;
}

- (BOOL)homeWorkAddressesDidChangeForPersonInContact:(id)a3 andPersonNode:(id)a4 withHomeWorkNodesByPersonNode:(id)a5 graph:(id)a6
{
  id v9 = a3;
  id v34 = a6;
  id v10 = a5;
  uint64_t v37 = [a4 collection];
  uint64_t v11 = objc_msgSend(v10, "targetsForSources:");

  uint64_t v12 = +[PGGraphHomeWorkNode homeFilter];
  uint64_t v13 = [v11 nodesMatchingFilter:v12];

  double v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v36 = v13;
  double v15 = [v13 addressNodes];
  long long v16 = [v15 locations];
  long long v17 = [v14 setWithArray:v16];

  long long v18 = +[PGGraphHomeWorkNode workFilter];
  long long v19 = [v11 nodesMatchingFilter:v18];

  int64_t v20 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = [v19 addressNodes];
  id v22 = [v21 locations];
  uint64_t v23 = [v20 setWithArray:v22];

  uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = [v9 locationsByAddressTypes];
  uint64_t v26 = [v25 objectForKeyedSubscript:&unk_1F28D1B00];
  uint64_t v27 = [v24 setWithArray:v26];

  id v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = [v9 locationsByAddressTypes];
  uint64_t v30 = [v29 objectForKeyedSubscript:&unk_1F28D1B18];
  long long v31 = [v28 setWithArray:v30];

  BOOL v32 = [(PGManager *)self _addressesDidChangeBetweenAddressesInGraph:v17 andAddressesInContacts:v27 addressType:0 person:v9 graph:v34]|| [(PGManager *)self _addressesDidChangeBetweenAddressesInGraph:v23 andAddressesInContacts:v31 addressType:1 person:v9 graph:v34];
  return v32;
}

- (id)clsPersonByContactIdentifierWithPersonContactIdentifiers:(id)a3 progressBlock:(id)a4
{
  return (id)[(CLSServiceManager *)self->_serviceManager personsInContactStoreForContactIdentifiers:a3 needsRefetching:1 progressBlock:a4];
}

- (void)invalidatePersistentCaches
{
}

void __39__PGManager_invalidatePersistentCaches__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  [v5 _invalidatePersistentCaches];
  [v4 invalidateMemoryCaches];

  [v5 _invalidateTransientCaches];
}

- (void)invalidateTransientCaches
{
}

void __38__PGManager_invalidateTransientCaches__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 invalidateMemoryCaches];
  [v4 _invalidateTransientCaches];
}

- (void)_invalidatePersistentCaches
{
  [(CLSLocationCache *)self->_locationCache invalidateDiskCaches];
  [(CLSPOICache *)self->_poiCache invalidateDiskCaches];
  [(CLSROICache *)self->_roiCache invalidateDiskCaches];
  [(CLSAOICache *)self->_aoiCache invalidateDiskCaches];
  [(CLSNatureCache *)self->_natureCache invalidateDiskCaches];
  [(CLSServiceManager *)self->_serviceManager invalidatePermanentMemoryCaches];
  [(CLSPublicEventManager *)self->_publicEventManager invalidateDiskCaches];
  curationManager = self->_curationManager;
  [(PGCurationManager *)curationManager invalidateDiskCaches];
}

- (void)_invalidatePersistentCachesBeforeDateWithTimestamp:(double)a3
{
  -[CLSLocationCache invalidateCacheItemsBeforeDateWithTimestamp:](self->_locationCache, "invalidateCacheItemsBeforeDateWithTimestamp:");
  [(CLSPOICache *)self->_poiCache invalidateCacheItemsBeforeDateWithTimestamp:a3];
  [(CLSROICache *)self->_roiCache invalidateCacheItemsBeforeDateWithTimestamp:a3];
  [(CLSAOICache *)self->_aoiCache invalidateCacheItemsBeforeDateWithTimestamp:a3];
  [(CLSNatureCache *)self->_natureCache invalidateCacheItemsBeforeDateWithTimestamp:a3];
  [(CLSServiceManager *)self->_serviceManager invalidateMePerson];
  [(CLSServiceManager *)self->_serviceManager invalidatePermanentMemoryCaches];
  publicEventManager = self->_publicEventManager;
  [(CLSPublicEventManager *)publicEventManager invalidateCacheItemsBeforeDateWithTimestamp:a3];
}

- (void)_invalidatePersistentCachesForGeoServiceProviderChange
{
  id v3 = [MEMORY[0x1E4F8AB68] currentRevGeoProvider];
  [(CLSLocationCache *)self->_locationCache invalidateCacheForGeoServiceProviderChangeToProvider:v3];
  [(CLSPOICache *)self->_poiCache invalidateCacheForGeoServiceProviderChangeToProvider:v3];
  [(CLSROICache *)self->_roiCache invalidateCacheForGeoServiceProviderChangeToProvider:v3];
  [(CLSAOICache *)self->_aoiCache invalidateCacheForGeoServiceProviderChangeToProvider:v3];
  [(CLSNatureCache *)self->_natureCache invalidateCacheForGeoServiceProviderChangeToProvider:v3];
  [(CLSServiceManager *)self->_serviceManager invalidatePermanentMemoryCaches];
  [(CLSPublicEventManager *)self->_publicEventManager invalidateDiskCaches];
  [(PGCurationManager *)self->_curationManager invalidateDiskCaches];
}

- (void)_invalidateTransientCaches
{
  [(CLSLocationCache *)self->_locationCache invalidateMemoryCaches];
  [(CLSPOICache *)self->_poiCache invalidateMemoryCaches];
  [(CLSROICache *)self->_roiCache invalidateMemoryCaches];
  [(CLSAOICache *)self->_aoiCache invalidateMemoryCaches];
  [(CLSNatureCache *)self->_natureCache invalidateMemoryCaches];
  [(CLSServiceManager *)self->_serviceManager invalidateMomentaryMemoryCaches];
  [(PGCurationManager *)self->_curationManager invalidateMemoryCaches];
  publicEventManager = self->_publicEventManager;
  [(CLSPublicEventManager *)publicEventManager invalidateMemoryCaches];
}

- (void)performAsynchronousNotification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PGManager_performAsynchronousNotification___block_invoke;
    block[3] = &unk_1E68E9728;
    id v8 = v4;
    dispatch_async(notificationQueue, block);
  }
}

uint64_t __45__PGManager_performAsynchronousNotification___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasPendingGraphAccess
{
  unint64_t v2 = atomic_load(&self->_numberOfCurrentGraphAccesses);
  return v2 != 0;
}

- (void)legacyPerformAsynchronousBarrierGraphWriteUsingBlock:(id)a3
{
  id v4 = a3;
  atomic_fetch_add((atomic_ullong *volatile)&self->_numberOfCurrentGraphAccesses, 1uLL);
  graphAccessQueue = self->_graphAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PGManager_legacyPerformAsynchronousBarrierGraphWriteUsingBlock___block_invoke;
  v7[3] = &unk_1E68E83F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(graphAccessQueue, v7);
}

void __66__PGManager_legacyPerformAsynchronousBarrierGraphWriteUsingBlock___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate(*(os_log_t *)(*(void *)(a1 + 32) + 184));
  id v3 = *(id *)(*(void *)(a1 + 32) + 184);
  id v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "Perform Graph Transaction Barrier", "", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 64), 0xFFFFFFFFFFFFFFFFLL);
  id v5 = *(id *)(*(void *)(a1 + 32) + 184);
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)double v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v6, OS_SIGNPOST_INTERVAL_END, v2, "Perform Graph Transaction Barrier", "", v7, 2u);
  }
}

- (void)performAsynchronousGraphBarrierUsingBlock:(id)a3
{
  id v4 = a3;
  atomic_fetch_add((atomic_ullong *volatile)&self->_numberOfCurrentGraphAccesses, 1uLL);
  graphAccessQueue = self->_graphAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PGManager_performAsynchronousGraphBarrierUsingBlock___block_invoke;
  v7[3] = &unk_1E68E83F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(graphAccessQueue, v7);
}

void __55__PGManager_performAsynchronousGraphBarrierUsingBlock___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate(*(os_log_t *)(*(void *)(a1 + 32) + 184));
  id v3 = *(id *)(*(void *)(a1 + 32) + 184);
  id v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "Perform Graph Barrier", "", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [MEMORY[0x1E4F71E40] drainBitsetPool];
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 64), 0xFFFFFFFFFFFFFFFFLL);
  id v5 = *(id *)(*(void *)(a1 + 32) + 184);
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)double v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v6, OS_SIGNPOST_INTERVAL_END, v2, "Perform Graph Barrier", "", v7, 2u);
  }
}

- (void)performSynchronousConcurrentGraphReadUsingBlock:(id)a3
{
  id v4 = a3;
  atomic_fetch_add((atomic_ullong *volatile)&self->_numberOfCurrentGraphAccesses, 1uLL);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __61__PGManager_performSynchronousConcurrentGraphReadUsingBlock___block_invoke;
  id v10 = &unk_1E68E83F0;
  uint64_t v11 = self;
  id v5 = v4;
  id v12 = v5;
  id v6 = (void (**)(void))_Block_copy(&v7);
  if ([(PGGraph *)self->_graph isOnGraphQueue]) {
    v6[2](v6);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->_graphAccessQueue, v6);
  }
}

void __61__PGManager_performSynchronousConcurrentGraphReadUsingBlock___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  [v2 enableInTransactionCheck];
  [v2 enterBatch];
  id v3 = [[PGGraphEnabler alloc] initWithGraph:v2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [v2 leaveBatch];
  [MEMORY[0x1E4F71E40] drainBitsetPool];
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 64), 0xFFFFFFFFFFFFFFFFLL);
}

- (void)performAsynchronousGraphWriteUsingBlock:(id)a3
{
  id v4 = a3;
  atomic_fetch_add((atomic_ullong *volatile)&self->_numberOfCurrentGraphAccesses, 1uLL);
  graphAccessQueue = self->_graphAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PGManager_performAsynchronousGraphWriteUsingBlock___block_invoke;
  v7[3] = &unk_1E68E83F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(graphAccessQueue, v7);
}

void __53__PGManager_performAsynchronousGraphWriteUsingBlock___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate(*(os_log_t *)(*(void *)(a1 + 32) + 184));
  id v3 = *(id *)(*(void *)(a1 + 32) + 184);
  id v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "Perform Graph Transaction", "", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [MEMORY[0x1E4F71E40] drainBitsetPool];
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 64), 0xFFFFFFFFFFFFFFFFLL);
  id v5 = *(id *)(*(void *)(a1 + 32) + 184);
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v6, OS_SIGNPOST_INTERVAL_END, v2, "Perform Graph Transaction", "", v7, 2u);
  }
}

- (id)instantiateMutableGraphWithError:(id *)a3
{
  id v5 = self->_mutableGraph;
  if (!v5)
  {
    id v6 = [(PGManager *)self graphPersistentStoreURL];
    id v5 = [(PGGraph *)[PGMutableGraph alloc] initWithURL:v6 persistenceOptions:32 error:a3];
  }
  return v5;
}

- (double)timeIntervalSinceLastGraphFullRebuild
{
  uint64_t v5 = 0;
  id v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0x7FEFFFFFFFFFFFFFLL;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PGManager_timeIntervalSinceLastGraphFullRebuild__block_invoke;
  v4[3] = &unk_1E68F0A78;
  v4[4] = &v5;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __50__PGManager_timeIntervalSinceLastGraphFullRebuild__block_invoke(uint64_t a1, void *a2)
{
  id v7 = [a2 graph];
  id v3 = [v7 infoNode];
  id v4 = [v3 creationDate];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
    [v5 timeIntervalSinceDate:v4];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  }
}

- (void)setGraphInfoDateOfLastIncrementalUpdateInvocationWithDate:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__PGManager_setGraphInfoDateOfLastIncrementalUpdateInvocationWithDate_completionBlock___block_invoke;
  void v10[3] = &unk_1E68E8418;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PGManager *)self performAsynchronousGraphWriteUsingBlock:v10];
}

void __87__PGManager_setGraphInfoDateOfLastIncrementalUpdateInvocationWithDate_completionBlock___block_invoke(void *a1)
{
  double v2 = (void *)a1[4];
  id v5 = 0;
  id v3 = [v2 instantiateMutableGraphWithError:&v5];
  id v4 = v5;
  if (v3)
  {
    [v3 enableInTransactionCheck];
    [v3 enterBatch];
    +[PGGraphBuilder setLastIncrementalUpdateInvocationDate:a1[5] inGraph:v3];
    [v3 leaveBatch];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)setMutableGraph:(id)a3
{
  id v5 = (PGGraph *)a3;
  [(PGManager *)self _unloadGraph];
  objc_storeStrong((id *)&self->_mutableGraph, a3);
  graph = self->_graph;
  self->_graph = v5;
  id v7 = v5;

  [(PGGraph *)self->_graph setGraphQueue:self->_graphAccessQueue];
}

- (void)setGraph:(id)a3
{
  id v4 = (PGGraph *)a3;
  [(PGManager *)self _unloadGraph];
  graph = self->_graph;
  self->_graph = v4;
  id v6 = v4;

  [(PGGraph *)self->_graph setGraphQueue:self->_graphAccessQueue];
}

- (CPAnalytics)analytics
{
  analytics = self->_analytics;
  if (!analytics)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "PGManager: analytics instance is nil.", v6, 2u);
      analytics = self->_analytics;
    }
    else
    {
      analytics = 0;
    }
  }
  return analytics;
}

- (id)processSubdirectoryName
{
  double v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28F80] processInfo];
    id v4 = [v5 processName];
  }
  return v4;
}

- (id)graphPersistenceParentDirectoryCandidateURLs
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(PGManager *)self photoLibrary];
  id v5 = objc_msgSend(v4, "pg_urlForGraphApplicationData");

  if (v5) {
    [v3 addObject:v5];
  }

  return v3;
}

- (NSURL)graphPersistenceParentDirectoryURL
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  cachedGraphPersistenceParentDirectoryURL = self->_cachedGraphPersistenceParentDirectoryURL;
  if (cachedGraphPersistenceParentDirectoryURL)
  {
    id v3 = cachedGraphPersistenceParentDirectoryURL;
    goto LABEL_27;
  }
  id location = &self->_cachedGraphPersistenceParentDirectoryURL;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = [(PGManager *)self graphPersistenceParentDirectoryCandidateURLs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    id v10 = 0;
    uint64_t v11 = *(void *)v27;
    *(void *)&long long v8 = 138412290;
    long long v23 = v8;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
      double v14 = objc_msgSend(v13, "path", v23);
      if (([v5 fileExistsAtPath:v14] & 1) == 0)
      {
        id v25 = v10;
        char v15 = [v5 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v25];
        id v16 = v25;

        if ((v15 & 1) == 0)
        {
          long long v17 = +[PGLogging sharedLogging];
          long long v18 = [v17 loggingConnection];

          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v23;
            id v31 = v16;
            _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "Unable to create graph cache directory: %@", buf, 0xCu);
          }

          id v10 = v16;
          goto LABEL_16;
        }
        id v10 = v16;
      }
      if ([v5 isWritableFileAtPath:v14])
      {
        id v3 = v13;

        long long v19 = (id *)location;
        if (v3) {
          goto LABEL_26;
        }
        goto LABEL_23;
      }
LABEL_16:

      if (v9 == ++v12)
      {
        uint64_t v9 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_22;
      }
    }
  }
  id v10 = 0;
LABEL_22:

  long long v19 = (id *)location;
LABEL_23:
  int64_t v20 = +[PGLogging sharedLogging];
  uint64_t v21 = [v20 loggingConnection];

  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "Unable to find writable graph cache directory", buf, 2u);
  }

  id v3 = 0;
LABEL_26:
  objc_storeStrong(v19, v3);

LABEL_27:
  return v3;
}

- (void)setGraphPersistentStoreURL:(id)a3
{
}

- (id)graphPersistentStoreURL
{
  cachedGraphPersistentStoreURL = self->_cachedGraphPersistentStoreURL;
  if (cachedGraphPersistentStoreURL)
  {
    id v3 = cachedGraphPersistentStoreURL;
  }
  else
  {
    id v5 = [(PGManager *)self graphPersistenceParentDirectoryURL];
    if (v5)
    {
      graphName = self->_graphName;
      if (!graphName) {
        graphName = (NSString *)@"photosgraph";
      }
      uint64_t v7 = graphName;
      long long v8 = +[PGGraph graphURLForName:v7 parentDirectoryURL:v5];
      if (v8)
      {
        [(PGManager *)self setGraphPersistentStoreURL:v8];
        id v3 = self->_cachedGraphPersistentStoreURL;
      }
      else
      {
        id v10 = +[PGLogging sharedLogging];
        uint64_t v11 = [v10 loggingConnection];

        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v13 = 0;
          _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "Unable to construct writable graph persistence store URL", v13, 2u);
        }

        id v3 = 0;
      }
    }
    else
    {
      uint64_t v9 = +[PGLogging sharedLogging];
      uint64_t v7 = [v9 loggingConnection];

      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "Unable to construct writable graph persistence store URL", buf, 2u);
      }
      id v3 = 0;
    }
  }
  return v3;
}

- (void)notifyCoalescingBlocksGraphAnalysisFinished:(BOOL)a3 error:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = v6->_coalescingGraphIsReady;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(NSMutableArray *)v6->_coalescingGraphIsReady removeAllObjects];
  objc_sync_exit(v6);
}

- (void)registerCoalescingBlockWhenGraphAnalysisFinishes:(id)a3
{
  aBlocuint64_t k = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (aBlock)
  {
    if ([(PGManager *)v4 libraryAnalysisState])
    {
      coalescingGraphIsReady = v4->_coalescingGraphIsReady;
      id v6 = _Block_copy(aBlock);
      [(NSMutableArray *)coalescingGraphIsReady addObject:v6];
    }
    else
    {
      (*((void (**)(id, BOOL, void))aBlock + 2))(aBlock, [(PGManager *)v4 isReady], 0);
    }
  }
  objc_sync_exit(v4);
}

- (void)commonInitWithPhotoLibrary:(id)a3 progressBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_photoLibrary, a3);
  uint64_t v9 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "core");
  loggingConnection = self->_loggingConnection;
  self->_loggingConnection = v9;

  long long v11 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "memory");
  memoriesLoggingConnection = self->_memoriesLoggingConnection;
  self->_memoriesLoggingConnection = v11;

  long long v13 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "related");
  relatedLoggingConnection = self->_relatedLoggingConnection;
  self->_relatedLoggingConnection = v13;

  char v15 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "ingest");
  ingestLoggingConnection = self->_ingestLoggingConnection;
  self->_ingestLoggingConnection = v15;

  long long v17 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "graph");
  graphLoggingConnection = self->_graphLoggingConnection;
  self->_graphLoggingConnection = v17;

  long long v19 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "enrichment");
  enrichmentLoggingConnection = self->_enrichmentLoggingConnection;
  self->_enrichmentLoggingConnection = v19;

  uint64_t v21 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "suggestions");
  suggestionsLoggingConnection = self->_suggestionsLoggingConnection;
  self->_suggestionsLoggingConnection = v21;

  long long v23 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "guess");
  guessWhoLoggingConnection = self->_guessWhoLoggingConnection;
  self->_guessWhoLoggingConnection = v23;

  id v25 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "metrics");
  metricsLoggingConnection = self->_metricsLoggingConnection;
  self->_metricsLoggingConnection = v25;

  long long v27 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "upNext");
  upNextLoggingConnection = self->_upNextLoggingConnection;
  self->_upNextLoggingConnection = v27;

  long long v29 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "externalAssetRelevance");
  externalRelevanceLoggingConnection = self->_externalRelevanceLoggingConnection;
  self->_externalRelevanceLoggingConnection = v29;

  id v31 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "graphConsistencyCheck");
  graphConsistencyCheckLoggingConnection = self->_graphConsistencyCheckLoggingConnection;
  self->_graphConsistencyCheckLoggingConnection = v31;

  uint64_t v33 = [(id)objc_opt_class() graphServicesURLWithPhotoLibrary:v7];
  id v34 = [[PGCurationManager alloc] initWithPhotoLibrary:v7 cacheURL:v33];
  curationManager = self->_curationManager;
  self->_curationManager = v34;

  id v36 = objc_alloc(MEMORY[0x1E4F76CF8]);
  uint64_t v37 = [MEMORY[0x1E4F76CF8] urlWithParentURL:v33];
  id v38 = (CLSLocationCache *)[v36 initWithURL:v37];
  locationCache = self->_locationCache;
  self->_locationCache = v38;

  id v40 = (CLSServiceManager *)[objc_alloc(MEMORY[0x1E4F76D98]) initWithLocationCache:self->_locationCache];
  serviceManager = self->_serviceManager;
  self->_serviceManager = v40;

  id v42 = objc_alloc(MEMORY[0x1E4F76C38]);
  uint64_t v43 = [MEMORY[0x1E4F76C38] urlWithParentURL:v33];
  long long v44 = (CLSAOICache *)[v42 initWithURL:v43];
  aoiCache = self->_aoiCache;
  self->_aoiCache = v44;

  id v46 = objc_alloc(MEMORY[0x1E4F76D40]);
  uint64_t v47 = [MEMORY[0x1E4F76D40] urlWithParentURL:v33];
  long long v48 = (CLSPOICache *)[v46 initWithURL:v47];
  poiCache = self->_poiCache;
  self->_poiCache = v48;

  id v50 = objc_alloc(MEMORY[0x1E4F76D78]);
  uint64_t v51 = [MEMORY[0x1E4F76D78] urlWithParentURL:v33];
  uint64_t v52 = (CLSROICache *)[v50 initWithURL:v51];
  roiCache = self->_roiCache;
  self->_roiCache = v52;

  id v54 = objc_alloc(MEMORY[0x1E4F76D20]);
  uint64_t v55 = [MEMORY[0x1E4F76D20] urlWithParentURL:v33];
  uint64_t v56 = (CLSNatureCache *)[v54 initWithURL:v55];
  natureCache = self->_natureCache;
  self->_natureCache = v56;

  long long v58 = (CLSPublicEventManager *)[objc_alloc(MEMORY[0x1E4F76D70]) initWithURL:v33];
  publicEventManager = self->_publicEventManager;
  self->_publicEventManager = v58;

  long long v60 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  long long v61 = dispatch_queue_attr_make_initially_inactive(v60);
  long long v62 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.PhotosGraph.graphAccessQueue", v61);
  graphAccessQueue = self->_graphAccessQueue;
  self->_graphAccessQueue = v62;

  dispatch_set_qos_class_floor((dispatch_object_t)self->_graphAccessQueue, QOS_CLASS_UTILITY, 0);
  dispatch_activate((dispatch_object_t)self->_graphAccessQueue);
  long long v64 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  long long v65 = dispatch_queue_attr_make_initially_inactive(v64);
  long long v66 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.PhotosGraph.graphUpdateQueue", v65);
  graphUpdateQueue = self->_graphUpdateQueue;
  self->_graphUpdateQueue = v66;

  dispatch_set_qos_class_floor((dispatch_object_t)self->_graphUpdateQueue, QOS_CLASS_UTILITY, 0);
  dispatch_activate((dispatch_object_t)self->_graphUpdateQueue);
  long long v68 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  long long v69 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.PhotosGraph.notificationQueue", v68);
  notificationQueue = self->_notificationQueue;
  self->_notificationQueue = v69;

  atomic_store(0, &self->_numberOfCurrentGraphAccesses);
  if (!self->_graph && self->_photoLibrary)
  {
    long long v71 = self->_graphAccessQueue;
    uint64_t v74 = MEMORY[0x1E4F143A8];
    uint64_t v75 = 3221225472;
    id v76 = __54__PGManager_commonInitWithPhotoLibrary_progressBlock___block_invoke;
    __int16 v77 = &unk_1E68E83F0;
    uint64_t v78 = self;
    id v79 = v8;
    dispatch_sync(v71, &v74);
  }
  objc_msgSend(MEMORY[0x1E4F1CA48], "array", v74, v75, v76, v77, v78);
  long long v72 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  coalescingGraphIsReady = self->_coalescingGraphIsReady;
  self->_coalescingGraphIsReady = v72;
}

uint64_t __54__PGManager_commonInitWithPhotoLibrary_progressBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadGraphWithProgressBlock:*(void *)(a1 + 40)];
}

- (NSDate)dateOfLastIncrementalUpdateInvocation
{
  double v2 = [(PGGraph *)self->_graph infoNode];
  id v3 = [v2 dateOfLastIncrementalUpdateInvocation];

  return (NSDate *)v3;
}

- (unint64_t)currentGraphVersion
{
  return [(MAGraph *)self->_graph version];
}

- (void)unloadGraph
{
  graphAccessQueue = self->_graphAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__PGManager_unloadGraph__block_invoke;
  block[3] = &unk_1E68F0B18;
  void block[4] = self;
  dispatch_barrier_sync(graphAccessQueue, block);
}

uint64_t __24__PGManager_unloadGraph__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unloadGraph];
}

- (void)_unloadGraph
{
  if (self->_graph)
  {
    [(MAGraph *)self->_mutableGraph savePersistentStore];
    [(MAGraph *)self->_graph closePersistentStore];
    graph = self->_graph;
    self->_graph = 0;

    mutableGraph = self->_mutableGraph;
    self->_mutableGraph = 0;
  }
}

- (void)loadGraphWithProgressBlock:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = self->_graphLoggingConnection;
  id v6 = a3;
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)v5);
  id v8 = v5;
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "GraphLoading", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v10 = mach_absolute_time();
  long long v11 = (void (**)(void *, unsigned char *, double))_Block_copy(v6);

  double v12 = 0.0;
  if (!v11 || (double v13 = CFAbsoluteTimeGetCurrent(), v13 < 0.01))
  {
LABEL_10:
    long long v14 = [(PGManager *)self graphPersistentStoreURL];
    if (!v14 || !+[PGGraph graphExistsAtURL:v14])
    {
LABEL_30:
      uint64_t v20 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      long long v23 = v9;
      uint64_t v24 = v23;
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v24, OS_SIGNPOST_INTERVAL_END, v7, "GraphLoading", " enableTelemetry=YES ", buf, 2u);
      }

      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        *(void *)uint64_t v33 = "GraphLoading";
        *(_WORD *)&v33[8] = 2048;
        *(double *)&v33[10] = (float)((float)((float)((float)(v20 - v10) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      id v25 = v24;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        long long v26 = [MEMORY[0x1E4F71EE8] humanReadableMemoryFootprint];
        *(_DWORD *)long long buf = 136315394;
        *(void *)uint64_t v33 = "GraphLoading";
        *(_WORD *)&v33[8] = 2112;
        *(void *)&v33[10] = v26;
        _os_log_debug_impl(&dword_1D1805000, v25, OS_LOG_TYPE_DEBUG, "[Memory Footprint] %s : %@", buf, 0x16u);
      }
      if (v11)
      {
        if (CFAbsoluteTimeGetCurrent() - v12 >= 0.01)
        {
          char v30 = 0;
          v11[2](v11, &v30, 1.0);
          if (v30)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 67109378;
              *(_DWORD *)uint64_t v33 = 464;
              *(_WORD *)&v33[4] = 2080;
              *(void *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Core/PGManager.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_42;
    }
    id v29 = 0;
    char v15 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "graphClass")), "initWithURL:persistenceOptions:error:", v14, 36, &v29);
    id v27 = v29;
    if (!v15
      && (loggingConnection = self->_loggingConnection,
          os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)uint64_t v33 = v27;
      _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "Error loading existing graph due to internal error, graph database is corrupt or missing, rebuild required and will occur next time we attempt to open it: %@", buf, 0xCu);
      if (v11)
      {
LABEL_15:
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v12 >= 0.01)
        {
          char v30 = 0;
          v11[2](v11, &v30, 0.5);
          if (v30)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 67109378;
              *(_DWORD *)uint64_t v33 = 434;
              *(_WORD *)&v33[4] = 2080;
              *(void *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Core/PGManager.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

LABEL_42:
            goto LABEL_43;
          }
          double v12 = Current;
        }
      }
    }
    else if (v11)
    {
      goto LABEL_15;
    }
    if (v15)
    {
      id v28 = v27;
      BOOL v18 = [(PGManager *)self graphIsUsable:v15 error:&v28];
      id v19 = v28;

      if (!v18)
      {
        [v15 closePersistentStore];

        if ([v19 code] == 34)
        {
          [(PGManager *)self _invalidatePersistentCachesForGeoServiceProviderChange];
        }
        else
        {
          [(PGManager *)self _invalidateTransientCaches];
          [(PGManager *)self _invalidatePersistentCaches];
        }
        char v15 = 0;
      }
      [(PGManager *)self setGraph:v15];
    }
    else
    {
      id v19 = v27;
    }

    goto LABEL_30;
  }
  char v30 = 0;
  v11[2](v11, &v30, 0.0);
  if (!v30)
  {
    double v12 = v13;
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109378;
    *(_DWORD *)uint64_t v33 = 418;
    *(_WORD *)&v33[4] = 2080;
    *(void *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Core/PGManager.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_43:
}

- (BOOL)graphIsUsable:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_signpost_id_t v7 = [(PGManager *)self graphLoggingConnection];
  uint64_t v8 = [v6 version];
  if (v8 == 617)
  {
    uint64_t v9 = [v6 infoNode];
    if ([v9 curationAlgorithmsVersion] == 11)
    {
      if ([v9 meaningAlgorithmsVersion] == 5)
      {
        uint64_t v10 = objc_alloc_init(PGEventLabelingConfiguration);
        uint64_t v11 = [(PGEventLabelingConfiguration *)v10 modelVersion];
        if ([v9 eventLabelingV2ModelVersion] == v11)
        {
          if (_os_feature_enabled_impl())
          {
            id v12 = objc_alloc_init(MEMORY[0x1E4F8E848]);
            uint64_t v13 = [v12 configurationVersion];
          }
          else
          {
            uint64_t v13 = 0;
          }
          if ([v9 personalTraitsEntityNamesVersion] == v13)
          {
            long long v23 = [v9 localeIdentifier];
            uint64_t v24 = [MEMORY[0x1E4F1CA20] currentLocale];
            id v25 = [v24 localeIdentifier];
            char v26 = [v23 isEqualToString:v25];

            if (v26)
            {
              id v27 = (void *)MEMORY[0x1E4F1CAD0];
              id v28 = [MEMORY[0x1E4F1CA20] preferredLanguages];
              id v29 = [v27 setWithArray:v28];

              char v30 = (void *)MEMORY[0x1E4F1CAD0];
              id v31 = [v9 languageIdentifiers];
              BOOL v32 = [v30 setWithArray:v31];

              if ([v32 isEqualToSet:v29])
              {
                if (!+[PGManager geoServiceProviderDidChangeForGraph:v6])
                {
                  int v36 = [MEMORY[0x1E4F76D98] canAccessContactsStore];
                  int v37 = v36 ^ [v9 canAccessContactsStore];
                  if (v37 == 1)
                  {
                    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
                    {
                      LOWORD(v39) = 0;
                      _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging contacts store access permission", (uint8_t *)&v39, 2u);
                    }
                    if (a4)
                    {
                      objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 35);
                      *a4 = (id)objc_claimAutoreleasedReturnValue();
                    }
                  }
                  char v15 = v37 ^ 1;
                  goto LABEL_57;
                }
                if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v39) = 0;
                  _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging geo service provider id", (uint8_t *)&v39, 2u);
                }
                if (a4)
                {
                  uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v34 = 34;
LABEL_49:
                  objc_msgSend(v33, "pl_analysisErrorWithCode:", v34);
                  char v15 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_57:

                  goto LABEL_58;
                }
              }
              else
              {
                if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v39) = 0;
                  _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging keyboard languages", (uint8_t *)&v39, 2u);
                }
                if (a4)
                {
                  uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v34 = 33;
                  goto LABEL_49;
                }
              }
              char v15 = 0;
              goto LABEL_57;
            }
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v39) = 0;
              _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging locale", (uint8_t *)&v39, 2u);
            }
            if (a4)
            {
              uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v22 = 32;
              goto LABEL_43;
            }
LABEL_44:
            char v15 = 0;
            goto LABEL_58;
          }
          uint64_t v35 = v7;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            int v39 = 134218240;
            uint64_t v40 = [v9 personalTraitsEntityNamesVersion];
            __int16 v41 = 2048;
            uint64_t v42 = v13;
            _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging graph personalTraitsEntityNames version (%ld vs expected %ld)", (uint8_t *)&v39, 0x16u);
          }

          if (!a4) {
            goto LABEL_44;
          }
          uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v22 = 36;
        }
        else
        {
          uint64_t v20 = v7;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v39 = 134218240;
            uint64_t v40 = [v9 eventLabelingV2ModelVersion];
            __int16 v41 = 2048;
            uint64_t v42 = v11;
            _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging graph eventLabelingV2 model version (%ld vs expected %ld)", (uint8_t *)&v39, 0x16u);
          }

          if (!a4) {
            goto LABEL_44;
          }
          uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v22 = 31;
        }
LABEL_43:
        objc_msgSend(v21, "pl_analysisErrorWithCode:", v22);
        char v15 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_58:

        goto LABEL_59;
      }
      id v19 = v7;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 134218240;
        uint64_t v40 = [v9 meaningAlgorithmsVersion];
        __int16 v41 = 1024;
        LODWORD(v42) = 5;
        _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging graph meaning inference algorithm version (%lu vs expected %d)", (uint8_t *)&v39, 0x12u);
      }

      if (a4)
      {
        long long v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = 30;
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v16 = v7;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 134218240;
        uint64_t v40 = [v9 curationAlgorithmsVersion];
        __int16 v41 = 1024;
        LODWORD(v42) = 11;
        _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging curation algorithms version (%lu vs expected %d)", (uint8_t *)&v39, 0x12u);
      }

      if (a4)
      {
        long long v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = 29;
LABEL_20:
        objc_msgSend(v17, "pl_analysisErrorWithCode:", v18);
        char v15 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:

        goto LABEL_60;
      }
    }
    char v15 = 0;
    goto LABEL_59;
  }
  uint64_t v14 = v8;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = 134218240;
    uint64_t v40 = v14;
    __int16 v41 = 1024;
    LODWORD(v42) = 617;
    _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging graph versions (%lu vs expected %d)", (uint8_t *)&v39, 0x12u);
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 28);
    char v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v15 = 0;
  }
LABEL_60:

  return v15;
}

- (PGManager)initWithGraph:(id)a3 photoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGManager;
  uint64_t v8 = [(PGManager *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(PGManager *)v8 setMutableGraph:v6];
    [(PGManager *)v9 commonInitWithPhotoLibrary:v7 progressBlock:0];
  }

  return v9;
}

- (PGManager)initWithImmutableGraph:(id)a3 photoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGManager;
  uint64_t v8 = [(PGManager *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(PGManager *)v8 setGraph:v6];
    [(PGManager *)v9 commonInitWithPhotoLibrary:v7 progressBlock:0];
  }

  return v9;
}

- (PGManager)initWithImmutableGraph:(id)a3
{
  return [(PGManager *)self initWithImmutableGraph:a3 photoLibrary:0];
}

- (PGManager)initWithGraph:(id)a3
{
  return [(PGManager *)self initWithGraph:a3 photoLibrary:0];
}

- (id)initForTesting
{
  v5.receiver = self;
  v5.super_class = (Class)PGManager;
  double v2 = [(PGManager *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(PGManager *)v2 commonInitWithPhotoLibrary:0 progressBlock:0];
  }
  return v3;
}

- (PGManager)init
{
  return 0;
}

- (PGManager)initWithGraph:(id)a3 readonlyPhotoLibrary:(id)a4
{
  uint64_t result = [(PGManager *)self initWithGraph:a3 photoLibrary:a4];
  if (result) {
    result->_photoLibraryIsReadonly = 1;
  }
  return result;
}

- (PGManager)initWithReadonlyPhotoLibrary:(id)a3
{
  uint64_t result = [(PGManager *)self initWithPhotoLibrary:a3 progressBlock:&__block_literal_global_271];
  if (result) {
    result->_photoLibraryIsReadonly = 1;
  }
  return result;
}

- (PGManager)initWithGraphPersistentStoreURL:(id)a3 photoLibrary:(id)a4 analytics:(id)a5 progressBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PGManager;
  uint64_t v14 = [(PGManager *)&v17 init];
  char v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_analytics, a5);
    [(PGManager *)v15 setGraphPersistentStoreURL:v10];
    [(PGManager *)v15 commonInitWithPhotoLibrary:v11 progressBlock:v13];
  }

  return v15;
}

- (PGManager)initWithPhotoLibrary:(id)a3 progressBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGManager;
  uint64_t v8 = [(PGManager *)&v11 init];
  uint64_t v9 = v8;
  if (v8) {
    [(PGManager *)v8 commonInitWithPhotoLibrary:v6 progressBlock:v7];
  }

  return v9;
}

- (PGManager)initWithPhotoLibrary:(id)a3 analytics:(id)a4 progressBlock:(id)a5
{
  id v9 = a4;
  id v10 = [(PGManager *)self initWithPhotoLibrary:a3 progressBlock:a5];
  objc_super v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_analytics, a4);
  }

  return v11;
}

+ (BOOL)photosChallengeIsEnabled
{
  return +[PGUserDefaults isPhotosChallengeEnabled];
}

+ (id)stringFromPGDuration:(unint64_t)a3
{
  if (a3 > 0x17) {
    return @"invalid";
  }
  else {
    return off_1E68E8520[a3];
  }
}

+ (Class)graphClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)geoServiceProviderDidChangeForGraph:(id)a3
{
  id v3 = [a3 infoNode];
  id v4 = [v3 geoServiceProviderID];

  objc_super v5 = [MEMORY[0x1E4F8AB68] currentRevGeoProvider];
  char v6 = [v4 isEqualToString:v5] ^ 1;

  return v6;
}

+ (id)graphServicesURLWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28F80] processInfo];
  objc_super v5 = [v4 processName];

  if (([v5 isEqualToString:@"photoanalysisd"] & 1) != 0
    || [v5 isEqualToString:@"LifeCipher"])
  {
    char v6 = [v3 urlForApplicationDataFolderIdentifier:1];
    if (v6) {
      goto LABEL_19;
    }
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v24 = 0;
  uint64_t v8 = [v7 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v24];
  id v9 = v24;
  if (!v8)
  {
    char v6 = 0;
    goto LABEL_17;
  }
  char v6 = [v8 URLByAppendingPathComponent:v5];
  if (v3)
  {
    id v10 = [v3 databaseUUID];
    objc_super v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F29128] UUID];
      id v12 = [v13 UUIDString];
    }
    uint64_t v14 = [v6 URLByAppendingPathComponent:v12];

    char v6 = (void *)v14;
  }
  char v23 = 0;
  char v15 = [v6 path];
  char v16 = [v7 fileExistsAtPath:v15 isDirectory:&v23];

  if ((v16 & 1) == 0)
  {
    id v22 = v9;
    char v18 = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v22];
    id v17 = v22;

    if (v18) {
      goto LABEL_16;
    }
LABEL_15:

    char v6 = 0;
    goto LABEL_16;
  }
  id v17 = v9;
  if (!v23) {
    goto LABEL_15;
  }
  id v17 = v9;
LABEL_16:
  id v9 = v17;
LABEL_17:

  if (!v6)
  {
    id v19 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v20 = NSTemporaryDirectory();
    char v6 = [v19 fileURLWithPath:v20 isDirectory:1];
  }
LABEL_19:

  return v6;
}

+ (void)initialize
{
  if (initialize_onceToken_30637 != -1) {
    dispatch_once(&initialize_onceToken_30637, &__block_literal_global_30638);
  }
}

- (id)titleTupleForAlbum:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4)
  {
    id v9 = [(PGManager *)self photoLibrary];
    id v10 = [v9 librarySpecificFetchOptions];

    [v10 setIncludeGuestAssets:1];
    objc_super v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v39[0] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    [v10 setSortDescriptors:v12];

    id v13 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v8 options:v10];
    if ([v13 count])
    {
      uint64_t v14 = [v13 firstObject];
      char v15 = [v13 lastObject];
      char v16 = [v14 localCreationDate];
      id v17 = v16;
      if (v14 == v15)
      {
        id v18 = v16;
      }
      else
      {
        id v18 = [v15 localCreationDate];
      }
      int v37 = v18;
      uint64_t v22 = +[PGTimeUtility dateIntervalWithStartDate:v17 endDate:v18];
      id v38 = (void *)v22;
      if (a4 == 2) {
        goto LABEL_15;
      }
      uint64_t v23 = [v8 localizedTitle];
      if (!v23) {
        goto LABEL_15;
      }
      id v24 = (void *)v23;
      id v25 = [v8 localizedTitle];
      uint64_t v26 = [v25 length];

      uint64_t v22 = (uint64_t)v38;
      if (v26)
      {
        if (a4 == 3)
        {
          id v27 = 0;
        }
        else
        {
          uint64_t v35 = [v8 localizedTitle];
          id v27 = +[PGTitle titleWithString:v35 category:4];
        }
        char v30 = +[PGTimeTitleUtility timeTitleWithDateInterval:v38 allowedFormats:7];
        uint64_t v33 = +[PGTitle titleWithString:v30 category:5];
      }
      else
      {
LABEL_15:
        int v36 = v14;
        id v28 = v17;
        id v29 = v15;
        char v30 = +[PGTimeTitleUtility splitTimeTitleWithDateInterval:v22 allowedFormats:7];
        id v31 = [v30 firstObject];
        id v27 = +[PGTitle titleWithString:v31 category:5];

        if ((unint64_t)[v30 count] < 2)
        {
          uint64_t v33 = 0;
        }
        else
        {
          BOOL v32 = [v30 objectAtIndexedSubscript:1];
          uint64_t v33 = +[PGTitle titleWithString:v32 category:5];
        }
        char v15 = v29;
        id v17 = v28;
        uint64_t v14 = v36;
      }

      id v19 = [[PGTitleTuple alloc] initWithWithTitle:v27 subtitle:v33];
    }
    else
    {
      if (!a5)
      {
        id v19 = 0;
        goto LABEL_21;
      }
      uint64_t v20 = NSString;
      uint64_t v21 = [v8 localIdentifier];
      uint64_t v14 = [v20 stringWithFormat:@"Cannot create title from asset collection \"%@\" with no assets.", v21];

      [MEMORY[0x1E4F28C58] errorWithDomain:@"PGErrorDomain" code:-101 localizedDescription:v14];
      id v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_21:
    goto LABEL_22;
  }
  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"PGErrorDomain" code:-101 localizedDescription:@"Undefined format"];
    id v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v19 = 0;
  }
LABEL_22:

  return v19;
}

- (id)titleTupleForMoment:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = v8;
  if (a4)
  {
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy__31371;
    id v28 = __Block_byref_object_dispose__31372;
    id v29 = 0;
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__31371;
    uint64_t v22 = __Block_byref_object_dispose__31372;
    id v23 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PGManager_TitleSupport__titleTupleForMoment_format_error___block_invoke;
    v12[3] = &unk_1E68E8898;
    id v13 = v8;
    uint64_t v14 = self;
    char v16 = &v18;
    int64_t v17 = a4;
    char v15 = &v24;
    [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v12];
    if (a5) {
      *a5 = (id) v19[5];
    }
    id v10 = (id)v25[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"PGErrorDomain" code:-101 localizedDescription:@"Undefined format"];
    id v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __60__PGManager_TitleSupport__titleTupleForMoment_format_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 graph];
  id v4 = [v3 momentNodeForMoment:*(void *)(a1 + 32)];

  if (v4)
  {
    if (*(void *)(a1 + 64) == 2)
    {
      BOOL v5 = 1;
    }
    else
    {
      char v15 = [*(id *)(a1 + 32) localizedTitle];
      if (v15)
      {
        char v16 = [*(id *)(a1 + 32) localizedTitle];
        BOOL v5 = [v16 length] == 0;
      }
      else
      {
        BOOL v5 = 1;
      }
    }
    int64_t v17 = objc_alloc_init(PGTimeTitleOptions);
    uint64_t v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    [(PGTimeTitleOptions *)v17 setMomentNodes:v18];

    if (v5)
    {
      id v19 = +[PGTimeTitleUtility splitTimeTitleWithOptions:v17];
      uint64_t v20 = [v19 firstObject];
      uint64_t v21 = +[PGTitle titleWithString:v20 category:5];

      if ((unint64_t)[v19 count] < 2)
      {
        id v23 = 0;
      }
      else
      {
        uint64_t v22 = [v19 objectAtIndexedSubscript:1];
        id v23 = +[PGTitle titleWithString:v22 category:5];
      }
    }
    else
    {
      if (*(void *)(a1 + 64) == 3)
      {
        uint64_t v21 = 0;
      }
      else
      {
        uint64_t v24 = [*(id *)(a1 + 32) localizedTitle];
        uint64_t v21 = +[PGTitle titleWithString:v24 category:4];
      }
      id v19 = +[PGTimeTitleUtility timeTitleWithOptions:v17];
      id v23 = +[PGTitle titleWithString:v19 category:5];
    }

    id v25 = [[PGTitleTuple alloc] initWithWithTitle:v21 subtitle:v23];
    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
    id v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }
  else
  {
    char v6 = [*(id *)(a1 + 40) graphLoggingConnection];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(id *)(a1 + 32) localIdentifier];
      *(_DWORD *)long long buf = 138412290;
      char v30 = v7;
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_INFO, "Cannot find node for moment \"%@\". Generating without graph access.", buf, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    obuint64_t j = *(id *)(v11 + 40);
    uint64_t v12 = [v8 titleTupleForAlbum:v9 format:v10 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (id)titleTupleForAssetCollection:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [v8 assetCollectionType];
  if (v9 == 3)
  {
    uint64_t v10 = [(PGManager *)self titleTupleForMoment:v8 format:a4 error:a5];
LABEL_5:
    uint64_t v12 = (void *)v10;
    goto LABEL_11;
  }
  uint64_t v11 = v9;
  if ((unint64_t)(v9 - 1) <= 1)
  {
    uint64_t v10 = [(PGManager *)self titleTupleForAlbum:v8 format:a4 error:a5];
    goto LABEL_5;
  }
  uint64_t v13 = NSString;
  uint64_t v14 = [v8 localIdentifier];
  char v15 = [v13 stringWithFormat:@"Unsupported asset collection type \"%lu\" for asset collection \"%@\"", v11, v14];

  char v16 = [(PGManager *)self graphLoggingConnection];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v19 = v15;
    _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  if (a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGErrorDomain" code:-101 localizedDescription:v15];
  }

  uint64_t v12 = 0;
LABEL_11:

  return v12;
}

- (id)titleTupleForMomentList:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = v8;
  if (!a4)
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"PGErrorDomain" code:-101 localizedDescription:@"Undefined format"];
      int64_t v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_61;
    }
    goto LABEL_14;
  }
  uint64_t v10 = [v8 collectionListType];
  uint64_t v11 = [v9 collectionListSubtype];
  if (v10 != 1)
  {
    uint64_t v18 = NSString;
    id v19 = [v9 localIdentifier];
    char v15 = [v18 stringWithFormat:@"Unsupported collection list type \"%lu\" for collection list \"%@\".", v10, v19];

    char v16 = [(PGManager *)self graphLoggingConnection];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v68 = v15;
      goto LABEL_10;
    }
LABEL_11:

    if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGErrorDomain" code:-101 localizedDescription:v15];
    }

LABEL_14:
    int64_t v17 = 0;
    goto LABEL_61;
  }
  uint64_t v12 = v11;
  if ((unint64_t)(v11 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v13 = NSString;
    uint64_t v14 = [v9 localIdentifier];
    char v15 = [v13 stringWithFormat:@"Unsupported collection list sub type \"%lu\" for collection list \"%@\".", v12, v14];

    char v16 = [(PGManager *)self graphLoggingConnection];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v68 = v15;
LABEL_10:
      _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  uint64_t v20 = [(PGManager *)self photoLibrary];
  uint64_t v21 = [v20 librarySpecificFetchOptions];

  uint64_t v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  long long v66 = v22;
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
  [v21 setSortDescriptors:v23];

  uint64_t v24 = [MEMORY[0x1E4F38EE8] fetchMomentsInMomentList:v9 options:v21];
  id v25 = [v24 firstObject];
  long long v65 = v24;
  uint64_t v26 = [v24 lastObject];
  id v27 = (void *)v26;
  if (v25 && v26)
  {
    id v28 = objc_msgSend(v25, "cls_localStartDate");
    uint64_t v29 = objc_msgSend(v27, "cls_localEndDate");
    long long v62 = v27;
    if (v12 == 2)
    {
      uint64_t v30 = [MEMORY[0x1E4F76C68] yearFromDate:v28];
      if (v30 == [MEMORY[0x1E4F76C68] yearFromDate:v29]
        || (unint64_t)[v65 count] < 3)
      {
        id v27 = v62;
      }
      else
      {
        long long v59 = v21;
        uint64_t v31 = (void *)v29;
        long long v60 = v25;
        uint64_t v32 = [MEMORY[0x1E4F76C68] monthFromDate:v28];
        uint64_t v33 = [MEMORY[0x1E4F76C68] dayFromDate:v28];
        uint64_t v63 = [v65 count];
        uint64_t v34 = v63 - 2;
        uint64_t v35 = 2;
        while (v32 == 12 && v33 == 31)
        {
          int v36 = [v65 objectAtIndex:v35 - 1];
          uint64_t v37 = objc_msgSend(v36, "cls_localEndDate");

          uint64_t v32 = [MEMORY[0x1E4F76C68] monthFromDate:v37];
          uint64_t v33 = [MEMORY[0x1E4F76C68] dayFromDate:v37];

          ++v35;
          id v28 = (void *)v37;
          if (v63 == v35) {
            goto LABEL_33;
          }
        }
        uint64_t v37 = (uint64_t)v28;
LABEL_33:
        uint64_t v43 = [MEMORY[0x1E4F76C68] monthFromDate:v31];
        uint64_t v44 = [MEMORY[0x1E4F76C68] dayFromDate:v31];
        while (v43 == 1 && v44 == 1)
        {
          id v45 = [v65 objectAtIndex:v34];
          uint64_t v46 = objc_msgSend(v45, "cls_localStartDate");

          uint64_t v43 = [MEMORY[0x1E4F76C68] monthFromDate:v46];
          uint64_t v44 = [MEMORY[0x1E4F76C68] dayFromDate:v46];
          --v34;

          uint64_t v31 = (void *)v46;
          if (!v34)
          {
            uint64_t v29 = v46;
            id v28 = (void *)v37;
            uint64_t v21 = v59;
            id v25 = v60;
            id v27 = v62;
            goto LABEL_39;
          }
        }
        id v28 = (void *)v37;
        uint64_t v21 = v59;
        id v25 = v60;
        id v27 = v62;
        uint64_t v29 = (uint64_t)v31;
LABEL_39:
        uint64_t v12 = 2;
      }
    }
    uint64_t v47 = +[PGTimeUtility dateIntervalWithStartDate:v28 endDate:v29];
    long long v64 = (void *)v29;
    if (v12 == 2)
    {
      long long v48 = v21;
      long long v49 = +[PGTimeTitleUtility timeTitleWithDateInterval:v47 allowedFormats:4];
      uint64_t v50 = +[PGTitle titleWithString:v49 category:5];
      BOOL v51 = a4 == 3;
      if (a4 == 3) {
        uint64_t v52 = 0;
      }
      else {
        uint64_t v52 = (void *)v50;
      }
      if (v51) {
        uint64_t v53 = (void *)v50;
      }
      else {
        uint64_t v53 = 0;
      }
    }
    else
    {
      id v54 = [v9 localizedTitle];
      long long v49 = v54;
      if (a4 != 2 && v54 && [v54 length])
      {
        long long v48 = v21;
        if (a4 == 3)
        {
          uint64_t v52 = 0;
        }
        else
        {
          uint64_t v52 = +[PGTitle titleWithString:v49 category:4];
        }
        uint64_t v55 = +[PGTimeTitleUtility timeTitleWithDateInterval:v47 allowedFormats:7];
        uint64_t v53 = +[PGTitle titleWithString:v55 category:5];
      }
      else
      {
        long long v61 = v25;
        long long v48 = v21;
        uint64_t v55 = +[PGTimeTitleUtility splitTimeTitleWithDateInterval:v47 allowedFormats:7];
        uint64_t v56 = [v55 firstObject];
        uint64_t v52 = +[PGTitle titleWithString:v56 category:5];

        if ((unint64_t)[v55 count] < 2)
        {
          uint64_t v53 = 0;
        }
        else
        {
          uint64_t v57 = [v55 objectAtIndexedSubscript:1];
          uint64_t v53 = +[PGTitle titleWithString:v57 category:5];
        }
        id v25 = v61;
      }
      id v27 = v62;
    }
    int64_t v17 = [[PGTitleTuple alloc] initWithWithTitle:v52 subtitle:v53];

    uint64_t v21 = v48;
  }
  else
  {
    id v38 = (void *)v26;
    int v39 = v25;
    uint64_t v40 = NSString;
    __int16 v41 = [v9 localIdentifier];
    id v28 = [v40 stringWithFormat:@"Missing moments in collection list \"%@\".", v41];

    uint64_t v42 = [(PGManager *)self graphLoggingConnection];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v68 = v28;
      _os_log_impl(&dword_1D1805000, v42, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"PGErrorDomain" code:-101 localizedDescription:v28];
      int64_t v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int64_t v17 = 0;
    }
    id v25 = v39;
    id v27 = v38;
  }

LABEL_61:
  return v17;
}

- (id)titleTupleForPersonLocalIdentifiers:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = v8;
  if (!a4)
  {
    if (a5)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = @"Undefined format";
      goto LABEL_11;
    }
LABEL_12:
    id v12 = 0;
    goto LABEL_13;
  }
  if (!v8 || ![v8 count])
  {
    if (a5)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = @"No person identifiers given. Need at least one person identifier.";
LABEL_11:
      [v13 errorWithDomain:@"PGErrorDomain" code:-101 localizedDescription:v14];
      id v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__31371;
  uint64_t v32 = __Block_byref_object_dispose__31372;
  id v33 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__31371;
  uint64_t v26 = __Block_byref_object_dispose__31372;
  id v27 = 0;
  uint64_t v10 = [(PGManager *)self serviceManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __76__PGManager_TitleSupport__titleTupleForPersonLocalIdentifiers_format_error___block_invoke;
  v16[3] = &unk_1E68E8898;
  id v17 = v9;
  id v19 = &v22;
  id v11 = v10;
  uint64_t v20 = &v28;
  int64_t v21 = a4;
  id v18 = v11;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v16];
  if (a5) {
    *a5 = (id) v23[5];
  }
  id v12 = (id)v29[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

LABEL_13:
  return v12;
}

void __76__PGManager_TitleSupport__titleTupleForPersonLocalIdentifiers_format_error___block_invoke(uint64_t *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  id v30 = v3;
  BOOL v5 = [v3 graph];
  char v6 = +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:v4 inGraph:v5];

  if ([v6 isEmpty])
  {
    id v7 = [NSString stringWithFormat:@"Information Mismatch. Cannot find people for person id's %@.", a1[4]];
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGErrorDomain" code:-102 localizedDescription:v7];
    uint64_t v9 = *(void *)(a1[6] + 8);
    uint64_t v10 = *(PGPeopleMemoryTitleGenerator **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    id v11 = [v30 graph];
    id v7 = [v11 momentNodesForPersonNodes:v6];

    if ([v7 isEmpty])
    {
      uint64_t v10 = [NSString stringWithFormat:@"Information Mismatch. Cannot find moments for people nodes with id's %@.", a1[4]];
      uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGErrorDomain" code:-102 localizedDescription:v10];
      uint64_t v13 = *(void *)(a1[6] + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    else
    {
      uint64_t v15 = 2 * ((unint64_t)[(id)a1[4] count] > 1);
      char v16 = [PGPeopleMemoryTitleGenerator alloc];
      id v17 = [v7 temporarySet];
      id v18 = [v6 temporarySet];
      id v19 = [PGTitleGenerationContext alloc];
      uint64_t v20 = [v30 graph];
      int64_t v21 = [(PGTitleGenerationContext *)v19 initWithGraph:v20 serviceManager:a1[5]];
      uint64_t v10 = [(PGPeopleMemoryTitleGenerator *)v16 initWithMomentNodes:v17 personNodes:v18 timeTitleOptions:0 type:v15 titleGenerationContext:v21];

      uint64_t v22 = [(PGTitleGenerator *)v10 subtitle];
      id v23 = (void *)v22;
      uint64_t v24 = a1[8];
      if (v24 == 2)
      {
        id v25 = 0;
        uint64_t v14 = (void *)v22;
      }
      else
      {
        if (v24 == 3)
        {
          uint64_t v14 = 0;
        }
        else
        {
          uint64_t v14 = [(PGTitleGenerator *)v10 title];
        }
        id v25 = v23;
      }
      id v26 = v23;
      id v27 = [[PGTitleTuple alloc] initWithWithTitle:v14 subtitle:v25];

      uint64_t v28 = *(void *)(a1[7] + 8);
      uint64_t v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = v27;
    }
  }
}

- (id)searchSynonymsDictionariesWithProgressReporter:(id)a3
{
  id v4 = a3;
  if ([v4 isCancelledWithProgress:0.0])
  {
    id v5 = (id)MEMORY[0x1E4F1CC08];
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__32402;
    id v18 = __Block_byref_object_dispose__32403;
    id v19 = 0;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __68__PGManager_Search__searchSynonymsDictionariesWithProgressReporter___block_invoke;
    id v11 = &unk_1E68F0A28;
    id v6 = v4;
    id v12 = v6;
    uint64_t v13 = &v14;
    [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:&v8];
    if ((objc_msgSend(v6, "isCancelled", v8, v9, v10, v11) & 1) != 0
      || ([v6 isCancelledWithProgress:1.0] & 1) != 0)
    {
      id v5 = (id)MEMORY[0x1E4F1CC08];
    }
    else
    {
      id v5 = (id)v15[5];
    }

    _Block_object_dispose(&v14, 8);
  }

  return v5;
}

void __68__PGManager_Search__searchSynonymsDictionariesWithProgressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (([*(id *)(a1 + 32) isCancelledWithProgress:0.1] & 1) == 0)
  {
    id v3 = [v7 graph];
    uint64_t v4 = +[PGGraphSynonymSupportHelper synonymsByIndexCategoryMaskForGraph:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)searchableAssetUUIDsBySocialGroupWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 isFullAnalysis:(BOOL)a5 progressReporter:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__32402;
  id v30 = __Block_byref_object_dispose__32403;
  id v31 = 0;
  id v12 = [(PGManager *)self newSearchComputationCache];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __108__PGManager_Search__searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_isFullAnalysis_progressReporter___block_invoke;
  void v18[3] = &unk_1E68E8D48;
  id v13 = v12;
  id v19 = v13;
  id v23 = &v26;
  id v14 = v10;
  unint64_t v24 = a4;
  id v20 = v14;
  int64_t v21 = self;
  BOOL v25 = a5;
  id v15 = v11;
  id v22 = v15;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v18];
  [v13 save];
  id v16 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __108__PGManager_Search__searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_isFullAnalysis_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [PGSearchKeywordComputer alloc];
  uint64_t v5 = [v3 graph];

  id v6 = [(PGSearchKeywordComputer *)v4 initWithGraph:v5 searchComputationCache:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = [*(id *)(a1 + 48) photoLibrary];
  uint64_t v10 = *(unsigned __int8 *)(a1 + 80);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __108__PGManager_Search__searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_isFullAnalysis_progressReporter___block_invoke_2;
  v14[3] = &unk_1E68E8CD0;
  id v15 = *(id *)(a1 + 56);
  uint64_t v11 = [(PGSearchKeywordComputer *)v6 searchableAssetUUIDsBySocialGroupWithEventUUIDs:v8 ofType:v7 inPhotoLibrary:v9 isFullAnalysis:v10 progressBlock:v14];
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

uint64_t __108__PGManager_Search__searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_isFullAnalysis_progressReporter___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

- (id)assetSearchKeywordsByMomentUUIDWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 progressReporter:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  BOOL v25 = __Block_byref_object_copy__32402;
  uint64_t v26 = __Block_byref_object_dispose__32403;
  id v27 = 0;
  id v10 = [(PGManager *)self newSearchComputationCache];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __91__PGManager_Search__assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_progressReporter___block_invoke;
  v16[3] = &unk_1E68E8D20;
  id v11 = v10;
  id v17 = v11;
  id v20 = &v22;
  id v12 = v8;
  id v18 = v12;
  unint64_t v21 = a4;
  id v13 = v9;
  id v19 = v13;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v16];
  [v11 save];
  id v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __91__PGManager_Search__assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [PGSearchKeywordComputer alloc];
  uint64_t v5 = [v3 graph];

  id v6 = [(PGSearchKeywordComputer *)v4 initWithGraph:v5 searchComputationCache:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(a1 + 64);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__PGManager_Search__assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_progressReporter___block_invoke_2;
  v12[3] = &unk_1E68E8CD0;
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  uint64_t v9 = [(PGSearchKeywordComputer *)v6 assetSearchKeywordsByMomentUUIDWithEventUUIDs:v8 ofType:v7 progressBlock:v12];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t __91__PGManager_Search__assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_progressReporter___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

- (id)searchKeywordsByEventWithUUIDs:(id)a3 ofType:(unint64_t)a4 progressReporter:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__32402;
  id v30 = __Block_byref_object_dispose__32403;
  id v31 = 0;
  id v10 = [(PGManager *)self newSearchComputationCache];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __76__PGManager_Search__searchKeywordsByEventWithUUIDs_ofType_progressReporter___block_invoke;
  id v19 = &unk_1E68E8CF8;
  id v11 = v10;
  id v20 = v11;
  uint64_t v24 = &v26;
  id v12 = v8;
  unint64_t v25 = a4;
  id v21 = v12;
  uint64_t v22 = self;
  id v13 = v9;
  id v23 = v13;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:&v16];
  objc_msgSend(v11, "save", v16, v17, v18, v19);
  id v14 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v14;
}

void __76__PGManager_Search__searchKeywordsByEventWithUUIDs_ofType_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [PGSearchKeywordComputer alloc];
  uint64_t v5 = [v3 graph];

  id v6 = [(PGSearchKeywordComputer *)v4 initWithGraph:v5 searchComputationCache:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [*(id *)(a1 + 48) photoLibrary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__PGManager_Search__searchKeywordsByEventWithUUIDs_ofType_progressReporter___block_invoke_2;
  void v13[3] = &unk_1E68E8CD0;
  id v14 = *(id *)(a1 + 56);
  uint64_t v10 = [(PGSearchKeywordComputer *)v6 searchKeywordsByEventWithEventUUIDs:v8 ofType:v7 photoLibrary:v9 progressBlock:v13];
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

uint64_t __76__PGManager_Search__searchKeywordsByEventWithUUIDs_ofType_progressReporter___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

- (id)searchMetadataWithOptions:(id)a3 progressReporter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isCancelledWithProgress:0.0])
  {
    id v8 = (id)MEMORY[0x1E4F1CC08];
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__32402;
    id v19 = __Block_byref_object_dispose__32403;
    id v20 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__PGManager_Search__searchMetadataWithOptions_progressReporter___block_invoke;
    v11[3] = &unk_1E68E9F28;
    id v9 = v7;
    id v12 = v9;
    id v14 = &v15;
    id v13 = v6;
    [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v11];
    if ([v9 isCancelled] & 1) != 0 || (objc_msgSend(v9, "isCancelledWithProgress:", 1.0)) {
      id v8 = (id)MEMORY[0x1E4F1CC08];
    }
    else {
      id v8 = (id)v16[5];
    }

    _Block_object_dispose(&v15, 8);
  }

  return v8;
}

void __64__PGManager_Search__searchMetadataWithOptions_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (([*(id *)(a1 + 32) isCancelledWithProgress:0.1] & 1) == 0)
  {
    id v3 = [PGSearchMetadataComputer alloc];
    uint64_t v4 = [v9 graph];
    uint64_t v5 = [(PGSearchMetadataComputer *)v3 initWithGraph:v4];

    uint64_t v6 = [(PGSearchMetadataComputer *)v5 searchMetadataWithOptions:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (id)zeroKeywordsWithOptions:(id)a3 progressReporter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__32402;
  uint64_t v32 = __Block_byref_object_dispose__32403;
  id v33 = 0;
  id v8 = [(PGManager *)self newSearchComputationCache];
  id v9 = [(PGManager *)self photoLibrary];
  uint64_t v10 = [(PGManager *)self curationManager];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __62__PGManager_Search__zeroKeywordsWithOptions_progressReporter___block_invoke;
  id v21 = &unk_1E68F0B90;
  id v11 = v9;
  id v22 = v11;
  id v12 = v10;
  id v23 = v12;
  id v13 = v8;
  id v24 = v13;
  id v27 = &v28;
  id v14 = v6;
  id v25 = v14;
  id v15 = v7;
  id v26 = v15;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:&v18];
  objc_msgSend(v13, "save", v18, v19, v20, v21);
  id v16 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v16;
}

void __62__PGManager_Search__zeroKeywordsWithOptions_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[PGZeroKeywordComputer alloc] initWithPhotoLibrary:*(void *)(a1 + 32) curationManager:*(void *)(a1 + 40) searchComputationCache:*(void *)(a1 + 48)];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:*(void *)(a1 + 32)];
  id v6 = [v3 graph];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__PGManager_Search__zeroKeywordsWithOptions_progressReporter___block_invoke_2;
  v11[3] = &unk_1E68E8CD0;
  uint64_t v7 = *(void *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  uint64_t v8 = [(PGZeroKeywordComputer *)v4 zeroKeywordsWithGraph:v6 curationContext:v5 options:v7 progressBlock:v11];
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

uint64_t __62__PGManager_Search__zeroKeywordsWithOptions_progressReporter___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

- (id)newSearchComputationCache
{
  id v3 = +[PGSearchComputationCache persistentStoreURLWithManager:self];
  uint64_t v4 = [PGSearchComputationCache alloc];
  uint64_t v5 = [(PGManager *)self photoLibrary];
  id v6 = [(PGSearchComputationCache *)v4 initWithPersistentStoreURL:v3 photoLibrary:v5];

  return v6;
}

- (NSArray)availableMetricEvents
{
  void v16[4] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = [[PGCuratedLibraryIntelligenceMetricEvent alloc] initWithGraphManager:self];
  v16[0] = v4;
  uint64_t v5 = [[PGGraphStatisticsMetricEvent alloc] initWithGraphManager:self];
  v16[1] = v5;
  id v6 = [[PGGuessWhoRelationshipMetricEvent alloc] initWithGraphManager:self];
  void v16[2] = v6;
  uint64_t v7 = [PGGraphSyndicatedAssetsMetricEvent alloc];
  uint64_t v8 = [(PGManager *)self workingContext];
  uint64_t v9 = [(PGGraphSyndicatedAssetsMetricEvent *)v7 initWithWorkingContext:v8];
  v16[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  id v11 = [v3 arrayWithArray:v10];

  id v12 = +[PGGraphHolidayMetricEvent celebratedHolidayMetricEventsWithGraphManager:self];
  [v11 addObjectsFromArray:v12];
  if (PGIsAppleInternal_onceToken != -1) {
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8452);
  }
  if (PGIsAppleInternal_isAppleInternal && [(id)objc_opt_class() photosChallengeIsEnabled])
  {
    id v13 = +[PGPhotosChallengeMetricEvent allMetricEventsWithGraphManager:self];
    [v11 addObjectsFromArray:v13];
  }
  id v14 = [MEMORY[0x1E4F1C978] arrayWithArray:v11];

  return (NSArray *)v14;
}

- (void)updateGraphWithRecipe:(id)a3 keepExistingGraph:(BOOL)a4 progressBlock:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  [(PGManager *)self setLibraryAnalysisState:1];
  if (!a4) {
    [(PGManager *)self _unloadGraph];
  }
  [(PGManager *)self stampFullGraphRebuild];
  unint64_t v13 = [(PGManager *)self currentFullGraphRebuildStamp];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke;
  aBlock[3] = &unk_1E68E9800;
  id v22 = v11;
  unint64_t v23 = v13;
  aBlock[4] = self;
  id v20 = v10;
  id v21 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  uint64_t v17 = _Block_copy(aBlock);
  uint64_t v18 = [(PGManager *)self graphUpdateQueue];
  dispatch_async(v18, v17);
}

void __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  double v2 = *(void **)(a1 + 32);
  unint64_t v3 = atomic_load((unint64_t *)(a1 + 64));
  if ([v2 canProceedWithFullGraphRebuildStamp:v3])
  {
    uint64_t v4 = [*(id *)(a1 + 32) graphPersistenceParentDirectoryURL];
    uint64_t v5 = @"construction-photosgraph";
    id v6 = +[PGGraph graphURLForName:@"construction-photosgraph" parentDirectoryURL:v4];
    uint64_t v7 = @"validation-photosgraph";
    uint64_t v8 = +[PGGraph graphURLForName:@"validation-photosgraph" parentDirectoryURL:v4];
    if ([(id)objc_opt_class() graphConsistencyCheckIsEnabled]) {
      [*(id *)(a1 + 32) copyGraphToURL:v8];
    }
    uint64_t v9 = [*(id *)(a1 + 32) ingestLoggingConnection];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "[PGManager][updateGraphWithRecipe] Start performing library analysis", buf, 2u);
    }

    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v49 = 0;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_286;
    v46[3] = &unk_1E68E9760;
    id v12 = *(id *)(a1 + 56);
    v46[4] = *(void *)(a1 + 32);
    id v47 = v12;
    unint64_t v13 = atomic_load((unint64_t *)(a1 + 64));
    unint64_t v48 = v13;
    uint64_t v14 = [v10 performLibraryAnalysisWithGraphURL:v6 withRecipe:v11 processedGraphUpdate:&v49 progressBlock:v46];
    id v15 = v49;
    id v16 = [*(id *)(a1 + 32) ingestLoggingConnection];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v53 = v14;
      _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[PGManager][updateGraphWithRecipe] Finished performing library analysis with analysis result=%ld", buf, 0xCu);
    }

    if (v14 == 2)
    {
      dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
      id v25 = *(void **)(a1 + 32);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_290;
      v36[3] = &unk_1E68E97D8;
      id v26 = v6;
      id v37 = v26;
      id v27 = v8;
      id v38 = v27;
      uint64_t v28 = v24;
      int v39 = v28;
      [v25 performAsynchronousGraphBarrierUsingBlock:v36];
      dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v29 = [*(id *)(a1 + 32) ingestLoggingConnection];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = [v26 path];
        id v31 = [v27 path];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v53 = (uint64_t)v30;
        __int16 v54 = 2112;
        uint64_t v55 = v31;
        _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "[PGManager][updateGraphWithRecipe] Successfully destroy the two databases=%@ and %@", buf, 0x16u);
      }
    }
    else if (!v14)
    {
      dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
      uint64_t v18 = *(void **)(a1 + 32);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_287;
      v40[3] = &unk_1E68E97B0;
      id v41 = v6;
      id v44 = *(id *)(a1 + 56);
      id v45 = *(id *)(a1 + 48);
      id v42 = v15;
      uint64_t v19 = v17;
      uint64_t v43 = v19;
      [v18 performAsynchronousGraphBarrierUsingBlock:v40];
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
      id v20 = [*(id *)(a1 + 32) ingestLoggingConnection];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[PGManager][updateGraphWithRecipe] Successfully perform a graph full rebuild", buf, 2u);
      }

      goto LABEL_23;
    }
    [*(id *)(a1 + 32) setLibraryAnalysisState:0];
    uint64_t v32 = *(void **)(a1 + 48);
    if (!v32)
    {
LABEL_24:

      return;
    }
    id v33 = *(void **)(a1 + 32);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_291;
    void v34[3] = &unk_1E68E9728;
    uint64_t v35 = v32;
    [v33 performAsynchronousNotification:v34];
    uint64_t v19 = v35;
LABEL_23:

    goto LABEL_24;
  }
  id v21 = *(void **)(a1 + 48);
  if (v21)
  {
    id v22 = *(void **)(a1 + 32);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_2;
    v50[3] = &unk_1E68E9728;
    id v51 = v21;
    [v22 performAsynchronousNotification:v50];
  }
  unint64_t v23 = [*(id *)(a1 + 32) ingestLoggingConnection];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "[PGManager][updateGraphWithRecipe] Unable to proceed with the full graph rebuild stamp", buf, 2u);
  }

  [*(id *)(a1 + 32) setLibraryAnalysisState:0];
}

void __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[PGError errorForCode:-4];
  (*(void (**)(uint64_t, void, id, void))(v1 + 16))(v1, 0, v2, 0);
}

uint64_t __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_286(void *a1, unsigned char *a2, double a3)
{
  (*(void (**)(double))(a1[5] + 16))(a3 * 0.95);
  uint64_t v5 = (void *)a1[4];
  unint64_t v6 = atomic_load(a1 + 6);
  uint64_t result = [v5 canProceedWithFullGraphRebuildStamp:v6];
  if ((result & 1) == 0) {
    *a2 = 1;
  }
  return result;
}

void __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_287(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  id v17 = 0;
  char v6 = [v3 swapInGraphAtURL:v4 progressBlock:v5 error:&v17];
  id v7 = v17;
  [v3 setLibraryAnalysisState:0];
  uint64_t v8 = *(void **)(a1 + 64);
  if (v8)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_2_288;
    v11[3] = &unk_1E68E9788;
    id v15 = v8;
    char v16 = v6;
    id v12 = v7;
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    [v3 performAsynchronousNotification:v11];
  }
  else
  {
    uint64_t v9 = +[PGLogging sharedLogging];
    id v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v7;
      _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "Failed swapping the updated graph in: %@", buf, 0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

void __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_290(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v13 = 0;
  BOOL v3 = +[MAGraph destroyPersistentStoreAtURL:v2 error:&v13];
  id v4 = v13;
  if (!v3)
  {
    uint64_t v5 = +[PGLogging sharedLogging];
    char v6 = [v5 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v4;
      _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "An error occurred while destroying working (and possibly corrupt) database \"%@\"", buf, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  id v12 = v4;
  BOOL v8 = +[MAGraph destroyPersistentStoreAtURL:v7 error:&v12];
  id v9 = v12;

  if (!v8)
  {
    id v10 = +[PGLogging sharedLogging];
    uint64_t v11 = [v10 loggingConnection];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v9;
      _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "An error occurred while destroying validation graph database \"%@\"", buf, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_291(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[PGError errorForCode:-4];
  (*(void (**)(uint64_t, void, id, void))(v1 + 16))(v1, 0, v2, 0);
}

intptr_t __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_2_288(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v2);
}

- (void)startGraphUpdate:(id)a3 progressBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PGManager *)self ingestLoggingConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __78__PGManager_Analysis_Private__startGraphUpdate_progressBlock_completionBlock___block_invoke;
  v16[3] = &unk_1E68E9700;
  id v20 = v9;
  id v21 = v10;
  id v17 = v8;
  uint64_t v18 = self;
  id v19 = v11;
  id v12 = v11;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  [(PGManager *)self performAsynchronousGraphWriteUsingBlock:v16];
}

void __78__PGManager_Analysis_Private__startGraphUpdate_progressBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void (**)(void *, uint8_t *, double))_Block_copy(*(const void **)(a1 + 56));
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v25 = 0;
  id v26 = (double *)&v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  if (!v4) {
    goto LABEL_6;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - v26[3] >= 0.01)
  {
    v26[3] = Current;
    buf[0] = 0;
    v4[2](v4, buf, 0.0);
    int v8 = (*((unsigned char *)v30 + 24) | buf[0]);
    *((unsigned char *)v30 + 24) |= buf[0];
    if (v8) {
      goto LABEL_4;
    }
LABEL_6:
    id v9 = *(void **)(a1 + 40);
    id v24 = 0;
    id v10 = [v9 instantiateMutableGraphWithError:&v24];
    id v7 = v24;
    if (v10)
    {
      [v10 enableInTransactionCheck];
      [v10 enterBatch];
      uint64_t v11 = [PGGraphIngestRecipe alloc];
      id v12 = [v3 photoLibrary];
      id v13 = [(PGGraphIngestRecipe *)v11 initWithPhotoLibrary:v12];

      uint64_t v14 = *(void *)(a1 + 32);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __78__PGManager_Analysis_Private__startGraphUpdate_progressBlock_completionBlock___block_invoke_2;
      v19[3] = &unk_1E68F03F8;
      id v20 = v4;
      id v21 = &v25;
      id v22 = &v29;
      uint64_t v23 = 0x3F847AE147AE147BLL;
      if ([v3 updateGraph:v10 withGraphUpdate:v14 withRecipe:v13 progressBlock:v19])
      {

        id v15 = [MEMORY[0x1E4F1C9C8] date];
        +[PGGraphBuilder setLastIncrementalUpdateInvocationDate:v15 inGraph:v10];
        uint64_t v16 = *(NSObject **)(a1 + 48);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_DEFAULT, "Live update succeeded", buf, 2u);
        }
        [v10 leaveBatch];

LABEL_15:
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

        goto LABEL_16;
      }
      uint64_t v17 = +[PGError errorForCode:-4];

      id v7 = (id)v17;
    }
    uint64_t v18 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v34 = v7;
      _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "Live update failed, rolling back: %@", buf, 0xCu);
    }
    [v10 rollbackBatch];
    goto LABEL_15;
  }
  if (!*((unsigned char *)v30 + 24)) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v6 = *(void *)(a1 + 64);
  id v7 = +[PGError errorForCode:-4];
  (*(void (**)(uint64_t, void, id, void))(v6 + 16))(v6, 0, v7, *(void *)(a1 + 32));
LABEL_16:

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
}

void __78__PGManager_Analysis_Private__startGraphUpdate_progressBlock_completionBlock___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.8 + 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (BOOL)updateGraph:(id)a3 withGraphUpdate:(id)a4 withRecipe:(id)a5 progressBlock:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = _Block_copy(v13);
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v36 = 0;
  id v37 = (double *)&v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  if (!v14
    || (double v15 = CFAbsoluteTimeGetCurrent(), v15 - v37[3] < 0.01)
    || (v37[3] = v15,
        char v35 = 0,
        (*((void (**)(void *, char *, double))v14 + 2))(v14, &v35, 0.0),
        char v16 = *((unsigned char *)v41 + 24) | v35,
        (*((unsigned char *)v41 + 24) = v16) == 0))
  {
    uint64_t v18 = [[PGGraphBuilder alloc] initWithGraph:v10 manager:self];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __84__PGManager_Analysis_Private__updateGraph_withGraphUpdate_withRecipe_progressBlock___block_invoke;
    v30[3] = &unk_1E68F03F8;
    id v19 = v14;
    id v31 = v19;
    char v32 = &v36;
    id v33 = &v40;
    uint64_t v34 = 0x3F847AE147AE147BLL;
    [(PGManager *)self _precachePersonsInformationFromGraph:v10 progressBlock:v30];
    if (*((unsigned char *)v41 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109378;
        int v45 = 459;
        __int16 v46 = 2080;
        id v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGM"
              "anager+Analysis.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      BOOL v17 = 0;
      goto LABEL_23;
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __84__PGManager_Analysis_Private__updateGraph_withGraphUpdate_withRecipe_progressBlock___block_invoke_281;
    v25[3] = &unk_1E68F03F8;
    id v20 = v19;
    id v26 = v20;
    uint64_t v27 = &v36;
    uint64_t v28 = &v40;
    uint64_t v29 = 0x3F847AE147AE147BLL;
    [(PGGraphBuilder *)v18 performBatchUpdatesWithGraphUpdate:v11 withRecipe:v12 progressBlock:v25];
    [(PGManager *)self _invalidateTransientCaches];
    if (*((unsigned char *)v41 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109378;
        int v45 = 468;
        __int16 v46 = 2080;
        id v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGM"
              "anager+Analysis.m";
        id v21 = MEMORY[0x1E4F14500];
LABEL_14:
        _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (!v14
        || (double Current = CFAbsoluteTimeGetCurrent(), Current - v37[3] < 0.01)
        || (v37[3] = Current,
            char v35 = 0,
            (*((void (**)(id, char *, double))v20 + 2))(v20, &v35, 1.0),
            char v23 = *((unsigned char *)v41 + 24) | v35,
            (*((unsigned char *)v41 + 24) = v23) == 0))
      {
        BOOL v17 = 1;
        goto LABEL_22;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109378;
        int v45 = 470;
        __int16 v46 = 2080;
        id v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGM"
              "anager+Analysis.m";
        id v21 = MEMORY[0x1E4F14500];
        goto LABEL_14;
      }
    }
    BOOL v17 = 0;
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109378;
    int v45 = 451;
    __int16 v46 = 2080;
    id v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGManager+Analysis.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  BOOL v17 = 0;
LABEL_24:
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v17;
}

void __84__PGManager_Analysis_Private__updateGraph_withGraphUpdate_withRecipe_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __84__PGManager_Analysis_Private__updateGraph_withGraphUpdate_withRecipe_progressBlock___block_invoke_281(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.9 + 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (BOOL)swapInGraphAtURL:(id)a3 progressBlock:(id)a4 error:(id *)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  id v8 = a4;
  id v9 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v8);
  uint64_t v85 = 0;
  uint64_t v86 = &v85;
  uint64_t v87 = 0x2020000000;
  char v88 = 0;
  uint64_t v81 = 0;
  long long v82 = (double *)&v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  long long v66 = v8;
  if (!v9
    || (double v10 = CFAbsoluteTimeGetCurrent(), v10 - v82[3] < 0.01)
    || (v82[3] = v10,
        LOBYTE(info.numer) = 0,
        v9[2](v9, &info, 0.0),
        char v11 = *((unsigned char *)v86 + 24) | LOBYTE(info.numer),
        (*((unsigned char *)v86 + 24) = v11) == 0))
  {
    uint64_t v13 = [(PGManager *)self graphName];
    uint64_t v14 = (void *)v13;
    double v15 = @"photosgraph";
    if (v13) {
      double v15 = (__CFString *)v13;
    }
    long long v68 = v15;

    char v16 = [(PGManager *)self graphPersistenceParentDirectoryURL];
    BOOL v17 = +[PGGraph graphURLForName:v68 parentDirectoryURL:v16];
    uint64_t v69 = +[PGGraph graphURLForName:@"photosgraph-tmp" parentDirectoryURL:v16];
    if (v9)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v82[3] >= 0.01)
      {
        v82[3] = Current;
        LOBYTE(info.numer) = 0;
        v9[2](v9, &info, 0.2);
        char v19 = *((unsigned char *)v86 + 24) | LOBYTE(info.numer);
        *((unsigned char *)v86 + 24) = v19;
        if (v19)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67109378;
            *(_DWORD *)id v90 = 372;
            *(_WORD *)&v90[4] = 2080;
            *(void *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Core/PGManager+Analysis.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_30:
          LOBYTE(v12) = 0;
LABEL_71:

          goto LABEL_72;
        }
      }
    }
    if (!v69 || !v17)
    {
      id v33 = +[PGLogging sharedLogging];
      uint64_t v34 = [v33 loggingConnection];

      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)id v90 = v69;
        *(_WORD *)&v90[8] = 2112;
        *(void *)&v90[10] = v17;
        _os_log_error_impl(&dword_1D1805000, v34, OS_LOG_TYPE_ERROR, "Cannot access URLs: %@, %@", buf, 0x16u);
      }

      goto LABEL_30;
    }
    long long v65 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v20 = [(PGManager *)self graphLoggingConnection];
    os_signpost_id_t v21 = os_signpost_id_generate(v20);
    id v22 = v20;
    char v23 = v22;
    os_signpost_id_t spid = v21;
    unint64_t v63 = v21 - 1;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "SwapGraph", "", buf, 2u);
    }
    long long v64 = v23;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v61 = mach_absolute_time();
    [(PGManager *)self _unloadGraph];
    id v24 = [v17 path];
    int v25 = [v65 fileExistsAtPath:v24];

    if (v25)
    {
      id v79 = 0;
      BOOL v26 = +[MAGraph migratePersistentStoreFromURL:v17 toURL:v69 error:&v79];
      id v27 = v79;
      if (!v26)
      {
        uint64_t v28 = +[PGLogging sharedLogging];
        uint64_t v29 = [v28 loggingConnection];

        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)id v90 = v27;
          _os_log_error_impl(&dword_1D1805000, v29, OS_LOG_TYPE_ERROR, "Error when renaming previous graph library: \"%@\"", buf, 0xCu);
        }
      }
    }
    id v78 = 0;
    BOOL v12 = +[MAGraph migratePersistentStoreFromURL:v67 toURL:v17 error:&v78];
    id v30 = v78;
    id v31 = v30;
    if (v12)
    {
      id v32 = v30;
    }
    else
    {
      char v35 = +[PGLogging sharedLogging];
      uint64_t v36 = [v35 loggingConnection];

      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)id v90 = v31;
        _os_log_error_impl(&dword_1D1805000, v36, OS_LOG_TYPE_ERROR, "Error when moving new graph to Library directory, trying to rollback the old one \"%@\"", buf, 0xCu);
      }

      if (a5) {
        *a5 = v31;
      }
      id v77 = v31;
      BOOL v37 = +[MAGraph migratePersistentStoreFromURL:v69 toURL:v17 error:&v77];
      id v32 = v77;

      if (!v37)
      {
        uint64_t v38 = +[PGLogging sharedLogging];
        uint64_t v39 = [v38 loggingConnection];

        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)id v90 = v32;
          _os_log_error_impl(&dword_1D1805000, v39, OS_LOG_TYPE_ERROR, "Error when rolling back the previous graph library \"%@\"", buf, 0xCu);
        }
      }
    }

    if (v9)
    {
      double v40 = CFAbsoluteTimeGetCurrent();
      if (v40 - v82[3] >= 0.01)
      {
        v82[3] = v40;
        char v76 = 0;
        v9[2](v9, (mach_timebase_info *)&v76, 0.6);
        char v41 = *((unsigned char *)v86 + 24) | v76;
        *((unsigned char *)v86 + 24) = v41;
        if (v41)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67109378;
            *(_DWORD *)id v90 = 415;
            *(_WORD *)&v90[4] = 2080;
            *(void *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Core/PGManager+Analysis.m";
            uint64_t v42 = MEMORY[0x1E4F14500];
LABEL_62:
            _os_log_impl(&dword_1D1805000, v42, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_63;
          }
          goto LABEL_63;
        }
      }
    }
    if (v12)
    {
      id v75 = 0;
      BOOL v43 = +[MAGraph destroyPersistentStoreAtURL:v69 error:&v75];
      id v44 = v75;
      if (!v43)
      {
        int v45 = +[PGLogging sharedLogging];
        __int16 v46 = [v45 loggingConnection];

        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)id v90 = v44;
          _os_log_error_impl(&dword_1D1805000, v46, OS_LOG_TYPE_ERROR, "Error when destroying temporary library \"%@\"", buf, 0xCu);
        }
      }
      id v47 = +[PGLogging sharedLogging];
      uint64_t v48 = [v47 loggingConnection];

      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D1805000, v48, OS_LOG_TYPE_INFO, "Updated graph successfully!", buf, 2u);
      }
    }
    uint64_t v49 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    uint64_t v52 = v64;
    uint64_t v53 = v52;
    if (v63 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v53, OS_SIGNPOST_INTERVAL_END, spid, "SwapGraph", "", buf, 2u);
    }

    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)id v90 = "SwapGraph";
      *(_WORD *)&v90[8] = 2048;
      *(double *)&v90[10] = (float)((float)((float)((float)(v49 - v61) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v53, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    if (v9)
    {
      double v54 = CFAbsoluteTimeGetCurrent();
      if (v54 - v82[3] >= 0.01)
      {
        v82[3] = v54;
        char v76 = 0;
        v9[2](v9, (mach_timebase_info *)&v76, 0.8);
        char v55 = *((unsigned char *)v86 + 24) | v76;
        *((unsigned char *)v86 + 24) = v55;
        if (v55)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67109378;
            *(_DWORD *)id v90 = 429;
            *(_WORD *)&v90[4] = 2080;
            *(void *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Core/PGManager+Analysis.m";
            uint64_t v42 = MEMORY[0x1E4F14500];
            goto LABEL_62;
          }
LABEL_63:
          LOBYTE(v12) = 0;
LABEL_70:

          goto LABEL_71;
        }
      }
    }
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __69__PGManager_Analysis_Internal__swapInGraphAtURL_progressBlock_error___block_invoke;
    v70[3] = &unk_1E68F03F8;
    uint64_t v56 = v9;
    long long v71 = v56;
    long long v72 = &v81;
    long long v73 = &v85;
    uint64_t v74 = 0x3F847AE147AE147BLL;
    [(PGManager *)self loadGraphWithProgressBlock:v70];
    if (*((unsigned char *)v86 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109378;
        *(_DWORD *)id v90 = 434;
        *(_WORD *)&v90[4] = 2080;
        *(void *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Core/PGManager+Analysis.m";
        uint64_t v57 = MEMORY[0x1E4F14500];
LABEL_67:
        _os_log_impl(&dword_1D1805000, v57, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (!v9) {
        goto LABEL_69;
      }
      double v59 = CFAbsoluteTimeGetCurrent();
      if (v59 - v82[3] < 0.01) {
        goto LABEL_69;
      }
      v82[3] = v59;
      char v76 = 0;
      v56[2](v56, (mach_timebase_info *)&v76, 1.0);
      char v60 = *((unsigned char *)v86 + 24) | v76;
      *((unsigned char *)v86 + 24) = v60;
      if (!v60) {
        goto LABEL_69;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109378;
        *(_DWORD *)id v90 = 436;
        *(_WORD *)&v90[4] = 2080;
        *(void *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Core/PGManager+Analysis.m";
        uint64_t v57 = MEMORY[0x1E4F14500];
        goto LABEL_67;
      }
    }
    LOBYTE(v12) = 0;
LABEL_69:

    goto LABEL_70;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109378;
    *(_DWORD *)id v90 = 365;
    *(_WORD *)&v90[4] = 2080;
    *(void *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Core/PGManager+Analysis.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  LOBYTE(v12) = 0;
LABEL_72:
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);

  return v12;
}

void __69__PGManager_Analysis_Internal__swapInGraphAtURL_progressBlock_error___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.8);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (int64_t)performLibraryAnalysisWithGraphURL:(id)a3 withRecipe:(id)a4 processedGraphUpdate:(id *)a5 progressBlock:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v29 = a4;
  id v11 = a6;
  BOOL v12 = _Block_copy(v11);
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v44 = 0;
  int v45 = (double *)&v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  if (!v12
    || (double v13 = CFAbsoluteTimeGetCurrent(), v13 - v45[3] < 0.01)
    || (v45[3] = v13,
        char v43 = 0,
        (*((void (**)(void *, char *, double))v12 + 2))(v12, &v43, 0.0),
        char v14 = *((unsigned char *)v49 + 24) | v43,
        (*((unsigned char *)v49 + 24) = v14) == 0))
  {
    id v41 = 0;
    id v42 = 0;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __113__PGManager_Analysis_Internal__performLibraryAnalysisWithGraphURL_withRecipe_processedGraphUpdate_progressBlock___block_invoke;
    v36[3] = &unk_1E68F03F8;
    id v16 = v12;
    id v37 = v16;
    uint64_t v38 = &v44;
    uint64_t v39 = &v48;
    uint64_t v40 = 0x3F847AE147AE147BLL;
    id v35 = 0;
    BOOL v17 = [(PGManager *)self graphForLibraryFullAnalysisAtURL:v10 alreadyIngestedMomentIdentifiers:&v42 alreadyIngestedHighlightIdentifiers:&v41 progressBlock:v36 error:&v35];
    id v27 = v42;
    id v28 = v41;
    id v18 = v35;
    if (*((unsigned char *)v49 + 24))
    {
LABEL_8:
      [v17 closePersistentStore];
      int64_t v15 = 1;
LABEL_22:

      goto LABEL_23;
    }
    if (v17)
    {
      if ([v17 noFatalError])
      {
        if (v12)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          if (Current - v45[3] >= 0.01)
          {
            v45[3] = Current;
            buf[0] = 0;
            (*((void (**)(id, uint8_t *, double))v16 + 2))(v16, buf, 0.05);
            *((unsigned char *)v49 + 24) |= buf[0];
          }
        }
        if (*((unsigned char *)v49 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67109378;
            int v53 = 318;
            __int16 v54 = 2080;
            char v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core"
                  "/PGManager+Analysis.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else
        {
          os_signpost_id_t v21 = [MEMORY[0x1E4F1C9C8] date];
          [v21 timeIntervalSince1970];
          double v23 = v22;

          [(PGManager *)self _invalidatePersistentCachesBeforeDateWithTimestamp:v23 + -7776000.0];
          if (v12)
          {
            double v24 = CFAbsoluteTimeGetCurrent();
            if (v24 - v45[3] >= 0.01)
            {
              v45[3] = v24;
              buf[0] = 0;
              (*((void (**)(id, uint8_t *, double))v16 + 2))(v16, buf, 0.09);
              *((unsigned char *)v49 + 24) |= buf[0];
            }
          }
          if (!*((unsigned char *)v49 + 24))
          {
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __113__PGManager_Analysis_Internal__performLibraryAnalysisWithGraphURL_withRecipe_processedGraphUpdate_progressBlock___block_invoke_270;
            v30[3] = &unk_1E68F03F8;
            id v25 = v16;
            id v31 = v25;
            id v32 = &v44;
            id v33 = &v48;
            uint64_t v34 = 0x3F847AE147AE147BLL;
            [(PGManager *)self performFullLibraryAnalysisInGraph:v17 withRecipe:v29 withAlreadyIngestedMomentIdentifiers:v27 alreadyIngestedHighlightIdentifiers:v28 processedGraphUpdate:a5 progressBlock:v30];
            [(PGManager *)self _invalidateTransientCaches];
            if (*((unsigned char *)v49 + 24))
            {
              [v17 closePersistentStore];
              int64_t v15 = 1;
            }
            else if ([v17 noFatalError])
            {
              [v17 closePersistentStore];
              if (v12)
              {
                double v26 = CFAbsoluteTimeGetCurrent();
                if (v26 - v45[3] >= 0.01)
                {
                  v45[3] = v26;
                  buf[0] = 0;
                  (*((void (**)(id, uint8_t *, double))v25 + 2))(v25, buf, 1.0);
                  *((unsigned char *)v49 + 24) |= buf[0];
                }
              }
              if (*((unsigned char *)v49 + 24))
              {
                int64_t v15 = 1;
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 67109378;
                  int v53 = 355;
                  __int16 v54 = 2080;
                  char v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Core/PGManager+Analysis.m";
                  int64_t v15 = 1;
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
              }
              else
              {
                int64_t v15 = 0;
              }
            }
            else
            {
              [v17 closePersistentStore];
              int64_t v15 = 2;
            }

            goto LABEL_22;
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67109378;
            int v53 = 328;
            __int16 v54 = 2080;
            char v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core"
                  "/PGManager+Analysis.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        goto LABEL_8;
      }
      [v17 closePersistentStore];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      int64_t v15 = 2;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not get a valid graph to perform full analysis, aborting", buf, 2u);
      goto LABEL_22;
    }
    int64_t v15 = 2;
    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109378;
    int v53 = 291;
    __int16 v54 = 2080;
    char v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGManager+Analysis.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  int64_t v15 = 1;
LABEL_23:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  return v15;
}

void __113__PGManager_Analysis_Internal__performLibraryAnalysisWithGraphURL_withRecipe_processedGraphUpdate_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.05);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __113__PGManager_Analysis_Internal__performLibraryAnalysisWithGraphURL_withRecipe_processedGraphUpdate_progressBlock___block_invoke_270(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.8 + 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)performFullLibraryAnalysisInGraph:(id)a3 withRecipe:(id)a4 withAlreadyIngestedMomentIdentifiers:(id)a5 alreadyIngestedHighlightIdentifiers:(id)a6 processedGraphUpdate:(id *)a7 progressBlock:(id)a8
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v70 = a3;
  id v69 = a4;
  id v74 = a5;
  id v73 = a6;
  id v65 = a8;
  uint64_t v98 = 0;
  char v99 = &v98;
  uint64_t v100 = 0x2020000000;
  char v101 = 0;
  uint64_t v94 = 0;
  v95 = (double *)&v94;
  uint64_t v96 = 0x2020000000;
  uint64_t v97 = 0;
  long long v66 = _Block_copy(v65);
  if (v66
    && (double v13 = CFAbsoluteTimeGetCurrent(), v13 - v95[3] >= 0.01)
    && ((v95[3] = v13,
         char v93 = 0,
         (*((void (**)(void *, char *, double))v66 + 2))(v66, &v93, 0.0),
         char v55 = *((unsigned char *)v99 + 24) | v93,
         (*((unsigned char *)v99 + 24) = v55) != 0)
     || ([v70 noFatalError] & 1) == 0))
  {
    uint64_t v56 = MEMORY[0x1E4F14500];
    id v57 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      int v58 = *((unsigned __int8 *)v99 + 24);
      int v59 = [v70 noFatalError];
      *(_DWORD *)long long buf = 67109890;
      int v105 = v58;
      __int16 v106 = 1024;
      *(_DWORD *)uint64_t v107 = v59 ^ 1;
      *(_WORD *)&v107[4] = 1024;
      *(_DWORD *)&v107[6] = 202;
      __int16 v108 = 2080;
      v109 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGMa"
             "nager+Analysis.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
    }
  }
  else
  {
    char v14 = [v69 momentsToIngest];
    long long v64 = a7;
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    obuint64_t j = v14;
    uint64_t v17 = [obj countByEnumeratingWithState:&v89 objects:v103 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v90;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v90 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          os_signpost_id_t v21 = [v20 uuid];
          int v22 = [v74 containsObject:v21];

          if (v22) {
            double v23 = v16;
          }
          else {
            double v23 = v15;
          }
          [v23 addObject:v20];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v89 objects:v103 count:16];
      }
      while (v17);
    }

    double v24 = [PGGraphUpdate alloc];
    id v25 = [(PGManager *)self photoLibrary];
    long long v68 = [(PGGraphUpdate *)v24 initWithPhotoLibrary:v25];

    if ([v15 count])
    {
      double v26 = [[PGGraphMomentsInsertion alloc] initWithMoments:v15];
      [(PGGraphUpdate *)v68 addChange:v26];
    }
    id v27 = [v69 highlightsToIngest];
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v71 = v27;
    uint64_t v30 = [v71 countByEnumeratingWithState:&v85 objects:v102 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v86;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v86 != v31) {
            objc_enumerationMutation(v71);
          }
          id v33 = *(void **)(*((void *)&v85 + 1) + 8 * j);
          uint64_t v34 = [v33 uuid];
          int v35 = [v73 containsObject:v34];

          if (v35) {
            uint64_t v36 = v29;
          }
          else {
            uint64_t v36 = v28;
          }
          [v36 addObject:v33];
        }
        uint64_t v30 = [v71 countByEnumeratingWithState:&v85 objects:v102 count:16];
      }
      while (v30);
    }

    if ([v28 count])
    {
      id v37 = [[PGGraphHighlightsInsertion alloc] initWithHighlights:v28];
      [(PGGraphUpdate *)v68 addChange:v37];
    }
    [(PGGraphUpdate *)v68 setIsResumingFullAnalysis:1];
    uint64_t v38 = [[PGGraphBuilder alloc] initWithGraph:v70 manager:self];
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __185__PGManager_Analysis_Internal__performFullLibraryAnalysisInGraph_withRecipe_withAlreadyIngestedMomentIdentifiers_alreadyIngestedHighlightIdentifiers_processedGraphUpdate_progressBlock___block_invoke;
    v80[3] = &unk_1E68F03F8;
    id v39 = v66;
    id v81 = v39;
    long long v82 = &v94;
    uint64_t v83 = &v98;
    uint64_t v84 = 0x3F847AE147AE147BLL;
    [(PGManager *)self _precachePersonsInformationFromGraph:v70 progressBlock:v80];
    if (*((unsigned char *)v99 + 24) || ([v70 noFatalError] & 1) == 0)
    {
      char v51 = MEMORY[0x1E4F14500];
      id v52 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        int v53 = *((unsigned __int8 *)v99 + 24);
        int v54 = [v70 noFatalError];
        *(_DWORD *)long long buf = 67109890;
        int v105 = v53;
        __int16 v106 = 1024;
        *(_DWORD *)uint64_t v107 = v54 ^ 1;
        *(_WORD *)&v107[4] = 1024;
        *(_DWORD *)&v107[6] = 259;
        __int16 v108 = 2080;
        v109 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PG"
               "Manager+Analysis.m";
        _os_log_impl(&dword_1D1805000, v51, OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
      }
    }
    else
    {
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __185__PGManager_Analysis_Internal__performFullLibraryAnalysisInGraph_withRecipe_withAlreadyIngestedMomentIdentifiers_alreadyIngestedHighlightIdentifiers_processedGraphUpdate_progressBlock___block_invoke_269;
      v75[3] = &unk_1E68F03F8;
      uint64_t v40 = v39;
      char v76 = v40;
      id v77 = &v94;
      id v78 = &v98;
      uint64_t v79 = 0x3F847AE147AE147BLL;
      [(PGGraphBuilder *)v38 performBatchUpdatesWithGraphUpdate:v68 withRecipe:v69 progressBlock:v75];
      if (*((unsigned char *)v99 + 24) || ([v70 noFatalError] & 1) == 0)
      {
        char v60 = MEMORY[0x1E4F14500];
        id v61 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          int v62 = *((unsigned __int8 *)v99 + 24);
          int v63 = [v70 noFatalError];
          *(_DWORD *)long long buf = 67109890;
          int v105 = v62;
          __int16 v106 = 1024;
          *(_DWORD *)uint64_t v107 = v63 ^ 1;
          *(_WORD *)&v107[4] = 1024;
          *(_DWORD *)&v107[6] = 267;
          __int16 v108 = 2080;
          v109 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/"
                 "PGManager+Analysis.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
        }
      }
      else
      {
        if (v64) {
          *long long v64 = v68;
        }
        uint64_t v41 = [v70 numberOfMomentNodes];
        uint64_t v42 = [v16 count];
        uint64_t v43 = [v15 count] + v42;
        if (v41 != v43)
        {
          uint64_t v44 = +[PGLogging sharedLogging];
          int v45 = [v44 loggingConnection];

          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 67109376;
            int v105 = v41;
            __int16 v106 = 1024;
            *(_DWORD *)uint64_t v107 = v43;
            _os_log_error_impl(&dword_1D1805000, v45, OS_LOG_TYPE_ERROR, "Moment nodes count & moment asset collections count are different %u - %u", buf, 0xEu);
          }
        }
        uint64_t v46 = [(PGManager *)self analytics];
        uint64_t v47 = [(PGManager *)self photoLibrary];
        uint64_t v48 = [(PGManager *)self serviceManager];
        [v70 reportMetricsLogsWithAnalytics:v46 photoLibrary:v47 serviceManager:v48];

        if (v66)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          if (Current - v95[3] >= 0.01)
          {
            v95[3] = Current;
            char v93 = 0;
            ((void (*)(NSObject *, char *, double))v40[2].isa)(v40, &v93, 1.0);
            char v50 = *((unsigned char *)v99 + 24) | v93;
            *((unsigned char *)v99 + 24) = v50;
            if (v50)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 67109378;
                int v105 = 283;
                __int16 v106 = 2080;
                *(void *)uint64_t v107 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Core/PGManager+Analysis.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
            }
          }
        }
      }
      char v51 = v76;
    }
  }
  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v98, 8);
}

void __185__PGManager_Analysis_Internal__performFullLibraryAnalysisInGraph_withRecipe_withAlreadyIngestedMomentIdentifiers_alreadyIngestedHighlightIdentifiers_processedGraphUpdate_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __185__PGManager_Analysis_Internal__performFullLibraryAnalysisInGraph_withRecipe_withAlreadyIngestedMomentIdentifiers_alreadyIngestedHighlightIdentifiers_processedGraphUpdate_progressBlock___block_invoke_269(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.7 + 0.2);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)graphForLibraryFullAnalysisAtURL:(id)a3 alreadyIngestedMomentIdentifiers:(id *)a4 alreadyIngestedHighlightIdentifiers:(id *)a5 progressBlock:(id)a6 error:(id *)a7
{
  *(void *)&v56[5] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  double v13 = (void (**)(void *, unsigned char *, double))_Block_copy(a6);
  double v14 = 0.0;
  if (v13)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v54 = 0;
      v13[2](v13, &v54, 0.0);
      if (v54)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109378;
          v56[0] = 82;
          LOWORD(v56[1]) = 2080;
          *(void *)((char *)&v56[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Core/PGManager+Analysis.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_16;
      }
      double v14 = Current;
    }
  }
  id v16 = [(PGGraph *)[PGMutableGraph alloc] initWithURL:v12 persistenceOptions:32 error:a7];
  if (!v16) {
    goto LABEL_16;
  }
  uint64_t v17 = v16;
  if (![(MAGraph *)v16 version] || [(PGManager *)self graphIsUsable:v17 error:0])
  {
LABEL_12:
    if (v13)
    {
      double v20 = CFAbsoluteTimeGetCurrent();
      if (v20 - v14 >= 0.01)
      {
        buf[0] = 0;
        v13[2](v13, buf, 0.5);
        if (buf[0])
        {
          [(MAGraph *)v17 closePersistentStore];
LABEL_21:
          os_signpost_id_t v21 = 0;
          goto LABEL_60;
        }
        double v14 = v20;
      }
    }
    double v24 = [(PGGraph *)v17 momentNodes];
    id v25 = [v24 localIdentifiers];
    double v26 = (void *)[v25 mutableCopy];

    char v50 = +[PGGraphHighlightNodeCollection dayHighlightNodesInGraph:v17];
    id v27 = [v50 localIdentifiers];
    id v51 = (id)[v27 mutableCopy];

    if (v13)
    {
      double v28 = CFAbsoluteTimeGetCurrent();
      if (v28 - v14 >= 0.01)
      {
        buf[0] = 0;
        v13[2](v13, buf, 0.6);
        if (buf[0])
        {
          [(MAGraph *)v17 closePersistentStore];
          os_signpost_id_t v21 = 0;
          id v29 = v50;
LABEL_59:

          goto LABEL_60;
        }
        double v14 = v28;
      }
    }
    uint64_t v49 = v24;
    if (!objc_msgSend(v26, "count", a5) && !objc_msgSend(v51, "count"))
    {
      BOOL v36 = 1;
LABEL_38:
      *a4 = v26;
      *uint64_t v47 = v51;
      if (v13)
      {
        double v42 = CFAbsoluteTimeGetCurrent();
        double v24 = v49;
        id v29 = v50;
        if (v42 - v14 >= 0.01)
        {
          buf[0] = 0;
          v13[2](v13, buf, 0.8);
          if (buf[0])
          {
LABEL_48:
            [(MAGraph *)v17 closePersistentStore];
LABEL_58:
            os_signpost_id_t v21 = 0;
            goto LABEL_59;
          }
          double v14 = v42;
        }
      }
      else
      {
        double v24 = v49;
        id v29 = v50;
      }
      if (v36)
      {
        +[PGGraphBuilder prepareGraphForRebuild:v17];
        uint64_t v43 = [(PGManager *)self curationManager];
        [v43 invalidateMemoryCaches];
        [v43 invalidateDiskCaches];
      }
      if (!v13 || CFAbsoluteTimeGetCurrent() - v14 < 0.01 || (buf[0] = 0, v13[2](v13, buf, 1.0), !buf[0]))
      {
        uint64_t v17 = v17;
        os_signpost_id_t v21 = v17;
        goto LABEL_59;
      }
      goto LABEL_48;
    }
    id v48 = v26;
    uint64_t v30 = [(PGGraph *)v17 infoNode];
    uint64_t v31 = [v30 creationDate];
    id v32 = [MEMORY[0x1E4F1C9C8] date];
    [v31 timeIntervalSinceDate:v32];
    double v34 = v33;

    double v35 = -v34;
    if (v34 >= 0.0) {
      double v35 = v34;
    }
    BOOL v36 = v35 > 172800.0;
    if (v35 > 172800.0)
    {
      [(MAGraph *)v17 closePersistentStore];
      id v37 = +[PGLogging sharedLogging];
      uint64_t v38 = [v37 loggingConnection];

      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)uint64_t v56 = v12;
        _os_log_impl(&dword_1D1805000, v38, OS_LOG_TYPE_DEFAULT, "Invalidating graph (%@), because it needs to be rebuilt", buf, 0xCu);
      }

      id v52 = 0;
      BOOL v39 = +[MAGraph destroyPersistentStoreAtURL:v12 error:&v52];
      id v40 = v52;
      if (v39)
      {
        [v48 removeAllObjects];
        [v51 removeAllObjects];
        uint64_t v41 = [(PGGraph *)[PGMutableGraph alloc] initWithURL:v12 persistenceOptions:32 error:a7];

        uint64_t v17 = v41;
        if (v41) {
          goto LABEL_37;
        }
        double v26 = v48;
        double v24 = v49;
        id v29 = v50;
      }
      else
      {
        uint64_t v44 = +[PGLogging sharedLogging];
        int v45 = [v44 loggingConnection];

        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)uint64_t v56 = v40;
          _os_log_error_impl(&dword_1D1805000, v45, OS_LOG_TYPE_ERROR, "An error occurred while destroying temporary database \"%@\"", buf, 0xCu);
        }

        double v24 = v49;
        id v29 = v50;
        if (a7) {
          *a7 = v40;
        }

        double v26 = v48;
      }

      goto LABEL_58;
    }
LABEL_37:

    double v26 = v48;
    goto LABEL_38;
  }
  [(MAGraph *)v17 closePersistentStore];

  id v53 = 0;
  BOOL v18 = +[MAGraph destroyPersistentStoreAtURL:v12 error:&v53];
  uint64_t v17 = (PGMutableGraph *)v53;
  if (v18)
  {
    char v19 = [(PGGraph *)[PGMutableGraph alloc] initWithURL:v12 persistenceOptions:0 error:a7];

    uint64_t v17 = v19;
    if (v19) {
      goto LABEL_12;
    }
LABEL_16:
    os_signpost_id_t v21 = 0;
    goto LABEL_61;
  }
  int v22 = +[PGLogging sharedLogging];
  double v23 = [v22 loggingConnection];

  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)uint64_t v56 = v17;
    _os_log_error_impl(&dword_1D1805000, v23, OS_LOG_TYPE_ERROR, "An error occurred while destroying temporary database \"%@\"", buf, 0xCu);
  }

  if (!a7) {
    goto LABEL_21;
  }
  uint64_t v17 = v17;
  os_signpost_id_t v21 = 0;
  *a7 = v17;
LABEL_60:

LABEL_61:
  return v21;
}

- (void)_precachePersonsInformationFromGraph:(id)a3 progressBlock:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  double v8 = 0.0;
  if (v7)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v31 = 0;
      v7[2](v7, &v31, 0.0);
      if (v31)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109378;
          int v34 = 56;
          __int16 v35 = 2080;
          BOOL v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/P"
                "GManager+Analysis.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_30;
      }
      double v8 = Current;
    }
  }
  double v26 = [(PGManager *)self photoLibrary];
  id v10 = +[PGGraphPersonNodeCollection personNodesIncludingMeInGraph:v6];
  if ([v10 count])
  {
    id v25 = v6;
    unint64_t v11 = [v10 count];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    double v24 = v10;
    id v12 = [v10 localIdentifiers];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      double v15 = 1.0 / (double)v11;
      uint64_t v16 = *(void *)v28;
      double v17 = 0.0;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v12);
          }
          char v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          double v17 = v15 + v17;
          if (v7)
          {
            double v20 = CFAbsoluteTimeGetCurrent();
            if (v20 - v8 >= 0.01)
            {
              char v31 = 0;
              v7[2](v7, &v31, v17);
              if (v31)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 67109378;
                  int v34 = 69;
                  __int16 v35 = 2080;
                  BOOL v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Core/PGManager+Analysis.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                id v10 = v24;
                id v6 = v25;
                goto LABEL_29;
              }
              double v8 = v20;
            }
          }
          if ([v19 length])
          {
            os_signpost_id_t v21 = (void *)MEMORY[0x1E4F76CC8];
            int v22 = [(PGManager *)self serviceManager];
            double v23 = [v21 clueWithPersonLocalIdentifier:v19 inPhotoLibrary:v26 serviceManager:v22];

            [v23 prepareIfNeeded];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v10 = v24;
    id v6 = v25;
    if (v7)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
      {
        char v31 = 0;
        v7[2](v7, &v31, 1.0);
        if (v31)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67109378;
            int v34 = 76;
            __int16 v35 = 2080;
            BOOL v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core"
                  "/PGManager+Analysis.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
  }
LABEL_29:

LABEL_30:
}

- (void)startLibraryAnalysisWithRecipe:(id)a3 progressBlock:(id)a4 keepExistingGraph:(BOOL)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = &__block_literal_global_36676;
  }
  uint64_t v14 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:10000];
  [(PGManager *)self setRebuildProgress:v14];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__PGManager_Analysis__startLibraryAnalysisWithRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_2;
  aBlock[3] = &unk_1E68E9828;
  aBlock[4] = self;
  id v26 = v13;
  double v15 = _Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __102__PGManager_Analysis__startLibraryAnalysisWithRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_3;
  v19[3] = &unk_1E68E9878;
  BOOL v24 = a5;
  id v20 = v10;
  os_signpost_id_t v21 = self;
  id v22 = v15;
  id v23 = v12;
  id v16 = v12;
  id v17 = v15;
  id v18 = v10;
  [(PGManager *)self performAsynchronousGraphBarrierUsingBlock:v19];
}

void __102__PGManager_Analysis__startLibraryAnalysisWithRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_2(uint64_t a1, double a2)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = [*(id *)(a1 + 32) rebuildProgress];
  [v4 setCompletedUnitCount:(int)(a2 * 10000.0)];
}

void __102__PGManager_Analysis__startLibraryAnalysisWithRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __102__PGManager_Analysis__startLibraryAnalysisWithRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_4;
  void v6[3] = &unk_1E68E9850;
  uint64_t v4 = *(void *)(a1 + 32);
  void v6[4] = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [a2 updateGraphWithRecipe:v4 keepExistingGraph:v3 progressBlock:v5 completionBlock:v6];
}

void __102__PGManager_Analysis__startLibraryAnalysisWithRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  [*(id *)(a1 + 32) setRebuildProgress:0];
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v8 + 16))(v8, a2, v9, v7);
  }
  [*(id *)(a1 + 32) notifyCoalescingBlocksGraphAnalysisFinished:a2 error:v9];
}

- (void)startLibraryAnalysis:(id)a3 keepExistingGraph:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [PGGraphIngestRecipe alloc];
  id v11 = [(PGManager *)self photoLibrary];
  id v12 = [(PGGraphIngestRecipe *)v10 initWithPhotoLibrary:v11];

  [(PGManager *)self startLibraryAnalysisWithRecipe:v12 progressBlock:v9 keepExistingGraph:v5 completionBlock:v8];
}

- (BOOL)_supportsSemanticalDedupingForMemory:(id)a3
{
  uint64_t v3 = [a3 subcategory];
  BOOL v4 = v3 != 401;
  if (v3 == 217) {
    BOOL v4 = 0;
  }
  return v3 != 212 && v4;
}

- (id)_curationDebugInformationForHighlight:(id)a3 options:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [PGHighlightTailor alloc];
  id v9 = [(PGManager *)self workingContextForEnrichment];
  id v10 = [(PGHighlightTailor *)v8 initWithWorkingContext:v9];

  id v11 = [(PGHighlightTailor *)v10 bestEnrichmentProfileForHighlight:v6 options:255];
  [v11 setCollectsDebugInfo:1];
  if (v11)
  {
    uint64_t v12 = [v7 objectForKeyedSubscript:@"extendedCurationOptions"];
    uint64_t v43 = (void *)v12;
    if (v12) {
      uint64_t v13 = [[PGDejunkerDeduperOptions alloc] initWithDictionaryRepresentation:v12];
    }
    else {
      uint64_t v13 = 0;
    }
    double v15 = [v7 objectForKeyedSubscript:@"setGlobally"];
    int v16 = [v15 BOOLValue];

    if (v16)
    {
      id v17 = [(PGDejunkerDeduperOptions *)v13 dictionaryRepresentationRestrictingToGlobalOptions:1];
      +[PGUserDefaults setExtendedCurationOptions:v17];
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    char v19 = [(PGManager *)self photoLibrary];
    id v20 = [(PGManager *)self serviceManager];
    [(PGManager *)self enrichmentLoggingConnection];
    os_signpost_id_t v21 = v42 = v13;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __69__PGManager_Curation___curationDebugInformationForHighlight_options___block_invoke;
    v45[3] = &unk_1E68E9970;
    id v46 = v19;
    id v47 = v20;
    id v48 = v21;
    id v49 = v7;
    char v50 = v10;
    id v22 = v6;
    id v51 = v22;
    id v52 = v11;
    id v23 = v18;
    id v53 = v23;
    char v54 = self;
    uint64_t v41 = v11;
    id v24 = v21;
    id v40 = v20;
    id v39 = v19;
    [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v45];
    id v25 = [PGCompleteEnrichmentProfile alloc];
    [(PGManager *)self curationManager];
    id v44 = v7;
    v27 = id v26 = v6;
    [(PGManager *)self enrichmentLoggingConnection];
    v29 = long long v28 = v10;
    long long v30 = [(PGDefaultEnrichmentProfile *)v25 initWithCurationManager:v27 loggingConnection:v29];

    [(PGDefaultEnrichmentProfile *)v30 setCollectsDebugInfo:1];
    char v31 = [PGHighlightTailorHighlightInfo alloc];
    id v32 = [(PGManager *)self serviceManager];
    double v33 = [(PGHighlightTailorHighlightInfo *)v31 initWithHighlight:v22 serviceManager:v32 loggingConnection:v24];

    [(PGHighlightTailorHighlightInfo *)v33 setPromotionScore:0.4];
    int v34 = [(PGDefaultEnrichmentProfile *)v30 summaryCurationWithHighlightInfo:v33 sharingFilter:2 progressBlock:&__block_literal_global_448];
    __int16 v35 = [(PGDefaultEnrichmentProfile *)v30 debugInfos];
    BOOL v36 = [v35 objectForKeyedSubscript:@"curation"];
    [v23 setObject:v36 forKeyedSubscript:@"onDemandCuration"];

    id v10 = v28;
    id v6 = v26;
    id v7 = v44;

    id v14 = v23;
    id v11 = v41;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = [v6 uuid];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v56 = v38;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not find enrichment profile for highlight %@", buf, 0xCu);
    }
    id v14 = (id)MEMORY[0x1E4F1CC08];
  }

  return v14;
}

void __69__PGManager_Curation___curationDebugInformationForHighlight_options___block_invoke(uint64_t a1, void *a2)
{
  v47[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 graph];
  BOOL v4 = [[PGHighlightTailorContext alloc] initWithPhotoLibrary:*(void *)(a1 + 32) graph:v3 serviceManager:*(void *)(a1 + 40) loggingConnection:*(void *)(a1 + 48)];
  BOOL v5 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"includeCuration"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    uint64_t v7 = 1073742079;
  }
  else {
    uint64_t v7 = 1073742063;
  }
  id v8 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"includeKeyAsset"];
  int v9 = [v8 BOOLValue];

  if (v9) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = v7 & 0x400000F7;
  }
  id v11 = [*(id *)(a1 + 64) enrichmentValuesForHighlight:*(void *)(a1 + 72) usingEnrichmentProfile:*(void *)(a1 + 80) graph:v3 options:v10 reportChangedValuesOnly:1 highlightTailorContext:v4 progressBlock:&__block_literal_global_433];
  uint64_t v12 = *(void **)(a1 + 88);
  uint64_t v13 = [*(id *)(a1 + 80) debugInfos];
  [v12 addEntriesFromDictionary:v13];

  id v14 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"includeDetailedHighlightInfo"];
  LODWORD(v13) = [v14 BOOLValue];

  if (v13)
  {
    __int16 v35 = v11;
    BOOL v36 = v4;
    uint64_t v38 = v3;
    v46[0] = @"startDate";
    double v15 = [*(id *)(a1 + 72) startDate];
    v47[0] = v15;
    v46[1] = @"endDate";
    int v16 = [*(id *)(a1 + 72) endDate];
    v47[1] = v16;
    v46[2] = @"estimatedAssetCount";
    id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 72), "estimatedAssetCount"));
    v47[2] = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];
    [*(id *)(a1 + 88) setObject:v18 forKeyedSubscript:@"detailedHighlightInfo"];

    char v19 = [*(id *)(a1 + 96) photoLibrary];
    uint64_t v20 = [v19 librarySpecificFetchOptions];

    uint64_t v37 = a1;
    int v34 = (void *)v20;
    os_signpost_id_t v21 = [MEMORY[0x1E4F38EE8] fetchMomentsInHighlight:*(void *)(a1 + 72) options:v20];
    id v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v23 = v21;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v23);
          }
          long long v28 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v43[0] = @"startDate";
          long long v29 = [v28 startDate];
          v44[0] = v29;
          v43[1] = @"endDate";
          long long v30 = [v28 endDate];
          v44[1] = v30;
          v43[2] = @"estimatedAssetCount";
          char v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "estimatedAssetCount"));
          v44[2] = v31;
          id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];
          double v33 = [v28 uuid];
          [v22 setObject:v32 forKeyedSubscript:v33];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v25);
    }

    [*(id *)(v37 + 88) setObject:v22 forKeyedSubscript:@"momentsInHighlightInfo"];
    uint64_t v3 = v38;
    id v11 = v35;
    BOOL v4 = v36;
  }
}

- (id)curationDebugInformationForAssetCollection:(id)a3 options:(id)a4 curationContext:(id)a5
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v72 = a4;
  id v71 = a5;
  id v73 = v8;
  uint64_t v9 = [v8 assetCollectionType];
  if (v9 == 6)
  {
    uint64_t v10 = [(PGManager *)self _curationDebugInformationForHighlight:v8 options:v72];
  }
  else
  {
    uint64_t v11 = v9;
    uint64_t v12 = [v8 photoLibrary];
    uint64_t v13 = [v12 librarySpecificFetchOptions];

    id v14 = +[PGCurationManager assetPropertySetsForCuration];
    [v13 addFetchPropertySets:v14];

    double v15 = [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:2];
    [v15 setPersonsPrefetchMode:2];
    [v15 setFaceInformationPrefetchMode:2];
    long long v68 = v15;
    id v69 = v13;
    int v16 = [MEMORY[0x1E4F76CF0] feederForAssetCollection:v8 options:v13 feederPrefetchOptions:v15 curationContext:v71];
    id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v17 = [[PGCurationOptions alloc] initWithDuration:12];
    id v18 = [v72 objectForKeyedSubscript:@"includeAllFaces"];
    id v67 = v18;
    if (v18) {
      uint64_t v19 = [v18 BOOLValue];
    }
    else {
      uint64_t v19 = 1;
    }
    [(PGCurationOptions *)v17 setIncludesAllFaces:v19];
    BOOL v20 = v11 == 4
       && [(PGManager *)self _supportsSemanticalDedupingForMemory:v8];
    [(PGCurationOptions *)v17 setSemanticalDedupingEnabled:v20];
    [(PGCurationOptions *)v17 setMovieDedupingEnabled:v11 == 4];
    os_signpost_id_t v21 = [v72 objectForKeyedSubscript:@"includeKeyAsset"];
    int v22 = [v21 BOOLValue];

    if (v22)
    {
      BOOL v23 = v11 == 4;
      uint64_t v24 = [PGKeyCurator alloc];
      uint64_t v25 = [(PGManager *)self curationManager];
      uint64_t v26 = [v25 curationCriteriaFactory];
      long long v27 = [(PGKeyCurator *)v24 initWithCurationCriteriaFactory:v26];

      id v28 = objc_alloc(MEMORY[0x1E4F76C78]);
      long long v29 = [v16 allItems];
      long long v30 = (void *)[v28 initWithItems:v29];

      char v31 = objc_alloc_init(PGKeyAssetCurationOptions);
      [(PGKeyAssetCurationOptions *)v31 setIsForMemories:v23];
      id v32 = [(PGKeyCurator *)v27 keyItemWithFeeder:v16 options:v31 criteria:0 debugInfo:v30 progressBlock:0];
      double v33 = [v30 dictionaryRepresentationWithAppendExtraItemInfoBlock:0];
      [v70 setObject:v33 forKeyedSubscript:@"keyAsset"];
    }
    int v34 = objc_alloc_init(PGCurator_PHAsset);
    __int16 v35 = [(PGManager *)self curationManager];
    BOOL v36 = [v35 curationLoggingConnection];
    [(PGCurator *)v34 setLoggingConnection:v36];

    uint64_t v37 = [v16 allItems];
    uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F76C78]) initWithItems:v37];
    long long v39 = [(PGCurator_PHAsset *)v34 bestAssetsForFeeder:v16 options:v17 debugInfo:v38 progressBlock:0];
    if (v39)
    {
      id v65 = v39;
      context = (void *)MEMORY[0x1D25FED50]();
      long long v66 = v34;
      id v40 = objc_alloc_init(MEMORY[0x1E4F8E778]);
      long long v41 = [v8 photoLibrary];
      long long v42 = [v41 librarySpecificFetchOptions];

      v77[0] = *MEMORY[0x1E4F39608];
      uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:1];
      [v42 setFetchPropertySets:v43];

      [v42 setIncludedDetectionTypes:&unk_1F28D4098];
      id v44 = [MEMORY[0x1E4F39050] fetchFacesGroupedByAssetLocalIdentifierForAssets:v37 options:v42];
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __90__PGManager_Curation__curationDebugInformationForAssetCollection_options_curationContext___block_invoke;
      v74[3] = &unk_1E68E9948;
      id v75 = v40;
      id v76 = v44;
      id v45 = v44;
      id v63 = v40;
      [v38 dictionaryRepresentationWithAppendExtraItemInfoBlock:v74];
      v47 = id v46 = v16;
      id v48 = (void *)[v47 mutableCopy];
      [(PGCurationOptions *)v17 dictionaryRepresentation];
      v50 = id v49 = v17;
      [v48 setObject:v50 forKeyedSubscript:@"curationOptions"];

      id v17 = v49;
      int v34 = v66;
      [v70 setObject:v48 forKeyedSubscript:@"summary"];

      int v16 = v46;
      long long v39 = v65;
    }

    id v51 = objc_alloc(MEMORY[0x1E4F76C78]);
    id v52 = [v16 allItems];
    id v53 = (void *)[v51 initWithItems:v52];

    char v54 = (void *)[(PGCurationOptions *)v17 copy];
    [v54 setDuration:16];
    [v54 setFocusOnInterestingItems:0];
    char v55 = [(PGCurator_PHAsset *)v34 bestAssetsForFeeder:v16 options:v54 debugInfo:v53 progressBlock:0];
    uint64_t v10 = v70;
    if (v55)
    {
      [v53 dictionaryRepresentationWithAppendExtraItemInfoBlock:0];
      v57 = uint64_t v56 = v34;
      int v58 = (void *)[v57 mutableCopy];
      [v54 dictionaryRepresentation];
      int v59 = v17;
      v61 = char v60 = v16;
      [v58 setObject:v61 forKeyedSubscript:@"curationOptions"];

      int v16 = v60;
      id v17 = v59;
      [v70 setObject:v58 forKeyedSubscript:@"extended"];

      int v34 = v56;
    }
  }
  return v10;
}

void __90__PGManager_Curation__curationDebugInformationForAssetCollection_options_curationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v87[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = NSNumber;
  [v5 curationScore];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  [v6 setObject:v8 forKeyedSubscript:@"persistedCurationScore"];

  uint64_t v9 = [v5 creationDate];
  [v6 setObject:v9 forKeyedSubscript:@"creationDate"];

  uint64_t v10 = [v5 localCreationDate];
  [v6 setObject:v10 forKeyedSubscript:@"localCreationDate"];

  uint64_t v11 = [v5 location];
  id v75 = v11;
  if (v11)
  {
    [v11 coordinate];
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1E750];
    double v15 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  v88.latitude = v13;
  v88.longitude = v15;
  if (CLLocationCoordinate2DIsValid(v88))
  {
    v86[0] = @"latitude";
    int v16 = [NSNumber numberWithDouble:v13];
    v86[1] = @"longitude";
    v87[0] = v16;
    id v17 = [NSNumber numberWithDouble:v15];
    v87[1] = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:2];
    [v6 setObject:v18 forKeyedSubscript:@"location"];
  }
  else
  {
    [v6 setObject:&unk_1F28D59F0 forKeyedSubscript:@"location"];
  }
  uint64_t v19 = [v5 clsSceneprint];
  if (v19)
  {
    uint64_t v82 = 0;
    BOOL v20 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v82];
    [v6 setObject:v20 forKeyedSubscript:@"sceneprint"];
  }
  os_signpost_id_t v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsInterestingVideo", v19));
  [v6 setObject:v21 forKeyedSubscript:@"isInterestingVideo"];

  int v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsInterestingLivePhoto"));
  [v6 setObject:v22 forKeyedSubscript:@"isInterestingLivePhoto"];

  BOOL v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsInterestingPanorama"));
  [v6 setObject:v23 forKeyedSubscript:@"isInterestingPanorama"];

  uint64_t v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsInterestingSDOF"));
  [v6 setObject:v24 forKeyedSubscript:@"isInterestingSDOF"];

  uint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsInterestingHDR"));
  [v6 setObject:v25 forKeyedSubscript:@"isInterestingHDR"];

  uint64_t v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsHasInterestingAudioClassification"));
  [v6 setObject:v26 forKeyedSubscript:@"hasInterestingAudioClassification"];

  long long v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsHasCustomPlaybackVariation"));
  [v6 setObject:v27 forKeyedSubscript:@"hasCustomPlaybackVariation"];

  id v28 = NSNumber;
  [v5 clsSharpnessScore];
  long long v29 = objc_msgSend(v28, "numberWithDouble:");
  [v6 setObject:v29 forKeyedSubscript:@"sharpnessScore"];

  long long v30 = NSNumber;
  [v5 clsExposureScore];
  char v31 = objc_msgSend(v30, "numberWithDouble:");
  [v6 setObject:v31 forKeyedSubscript:@"exposureScore"];

  id v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsBlurry"));
  [v6 setObject:v32 forKeyedSubscript:@"isBlurry"];

  double v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsInhabited"));
  [v6 setObject:v33 forKeyedSubscript:@"isInhabited"];

  int v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsHasInterestingScenes"));
  [v6 setObject:v34 forKeyedSubscript:@"hasInterestingScenes"];

  __int16 v35 = [v5 clsPersonLocalIdentifiers];
  [v6 setObject:v35 forKeyedSubscript:@"peopleNames"];

  BOOL v36 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isVideo"));
  [v6 setObject:v36 forKeyedSubscript:@"isVideo"];

  uint64_t v37 = +[PGCurationManager sceneInfoWithAsset:v5 curationSession:*(void *)(a1 + 32)];
  [v6 setObject:v37 forKeyedSubscript:@"scenes"];

  uint64_t v38 = NSNumber;
  [v5 clsBehavioralScore];
  long long v39 = objc_msgSend(v38, "numberWithFloat:");
  [v6 setObject:v39 forKeyedSubscript:@"behavioralScore"];

  id v40 = NSNumber;
  [v5 clsInteractionScore];
  long long v41 = objc_msgSend(v40, "numberWithFloat:");
  [v6 setObject:v41 forKeyedSubscript:@"interactionScore"];

  long long v42 = NSNumber;
  [v5 clsHighlightVisibilityScore];
  uint64_t v43 = objc_msgSend(v42, "numberWithDouble:");
  [v6 setObject:v43 forKeyedSubscript:@"highlightVisibilityScore"];

  id v44 = NSNumber;
  [v5 clsAutoplaySuggestionScore];
  id v45 = objc_msgSend(v44, "numberWithDouble:");
  [v6 setObject:v45 forKeyedSubscript:@"autoplaySuggestionScore"];

  id v46 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isShinyGem"));
  [v6 setObject:v46 forKeyedSubscript:@"isShinyGem"];

  id v47 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isRegularGem"));
  [v6 setObject:v47 forKeyedSubscript:@"isRegularGem"];

  id v48 = NSNumber;
  [v5 clsFaceScore];
  id v49 = objc_msgSend(v48, "numberWithDouble:");
  [v6 setObject:v49 forKeyedSubscript:@"faceScore"];

  char v50 = NSNumber;
  [v5 clsDuration];
  id v51 = objc_msgSend(v50, "numberWithDouble:");
  [v6 setObject:v51 forKeyedSubscript:@"duration"];

  id v52 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsNonMemorable"));
  [v6 setObject:v52 forKeyedSubscript:@"isNonMemorable"];

  id v53 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsLoopOrBounce"));
  [v6 setObject:v53 forKeyedSubscript:@"isLoopOrBounce"];

  char v54 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsLongExposure"));
  [v6 setObject:v54 forKeyedSubscript:@"isLongExposure"];

  char v55 = NSNumber;
  [v5 clsSquareCropScore];
  uint64_t v56 = objc_msgSend(v55, "numberWithDouble:");
  [v6 setObject:v56 forKeyedSubscript:@"squareCropScore"];

  uint64_t v57 = [v5 clsFaceInformationSummary];
  int v58 = [v57 dictionaryRepresentation];
  id v76 = v6;
  [v6 setObject:v58 forKeyedSubscript:@"faceInformationSummary"];

  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  char v60 = *(void **)(a1 + 40);
  id v77 = v5;
  id v61 = [v5 localIdentifier];
  int v62 = [v60 objectForKeyedSubscript:v61];

  uint64_t v63 = [v62 countByEnumeratingWithState:&v78 objects:v85 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        if (*(void *)v79 != v65) {
          objc_enumerationMutation(v62);
        }
        id v67 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        long long v68 = [v67 personLocalIdentifier];
        if (v68)
        {
          id v69 = [v67 faceClusteringProperties];
          id v70 = [v69 faceprint];

          if (v70)
          {
            v83[0] = @"faceprintData";
            id v71 = [v70 faceprintData];
            v83[1] = @"faceprintVersion";
            v84[0] = v71;
            id v72 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v70, "faceprintVersion"));
            v84[1] = v72;
            id v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:2];
            [v59 setObject:v73 forKeyedSubscript:v68];
          }
        }
      }
      uint64_t v64 = [v62 countByEnumeratingWithState:&v78 objects:v85 count:16];
    }
    while (v64);
  }

  [v76 setObject:v59 forKeyedSubscript:@"faceprints"];
}

- (BOOL)isInterestingForMoment:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PGManager_Curation__isInterestingForMoment___block_invoke;
  v7[3] = &unk_1E68E9F28;
  id v5 = v4;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  id v8 = v5;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __46__PGManager_Curation__isInterestingForMoment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 graph];
  id v4 = [v3 momentNodeForMoment:*(void *)(a1 + 32)];

  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 isInteresting];
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) graphLoggingConnection];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "Cannot find node for moment: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)isSmartInterestingForMoment:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PGManager_Curation__isSmartInterestingForMoment___block_invoke;
  v7[3] = &unk_1E68E9F28;
  id v5 = v4;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  id v8 = v5;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __51__PGManager_Curation__isSmartInterestingForMoment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 graph];
  id v4 = [v3 momentNodeForMoment:*(void *)(a1 + 32)];

  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 isSmartInteresting];
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) graphLoggingConnection];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "Cannot find node for moment: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (double)neighborScoreForMoment:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PGManager_Curation__neighborScoreForMoment___block_invoke;
  v8[3] = &unk_1E68E9F28;
  id v5 = v4;
  uint64_t v10 = self;
  uint64_t v11 = &v12;
  id v9 = v5;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v8];
  double v6 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __46__PGManager_Curation__neighborScoreForMoment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 graph];
  id v4 = objc_alloc_init(PGNeighborScoreComputer);
  id v5 = [v3 momentNodeForMoment:*(void *)(a1 + 32)];
  if (v5)
  {
    [(PGNeighborScoreComputer *)v4 neighborScoreWithMomentNode:v5];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
  }
  else
  {
    int v7 = [*(id *)(a1 + 40) graphLoggingConnection];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "Cannot find node for moment: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (double)graphScoreForMoment:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PGManager_Curation__graphScoreForMoment___block_invoke;
  v8[3] = &unk_1E68F0A28;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v8];
  double v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __43__PGManager_Curation__graphScoreForMoment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 graph];
  id v6 = [v3 momentNodeForMoment:*(void *)(a1 + 32)];

  id v4 = v6;
  if (v6)
  {
    [v6 graphScore];
    id v4 = v6;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  }
}

- (id)curatedKeyAssetForAssetCollection:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 curationContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(PGManager *)self curationManager];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__37156;
  char v31 = __Block_byref_object_dispose__37157;
  id v32 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __104__PGManager_Curation__curatedKeyAssetForAssetCollection_curatedAssetCollection_options_curationContext___block_invoke;
  v21[3] = &unk_1E68E9920;
  uint64_t v26 = &v27;
  id v15 = v14;
  id v22 = v15;
  id v16 = v10;
  id v23 = v16;
  id v17 = v12;
  id v24 = v17;
  id v18 = v13;
  id v25 = v18;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v21];
  uint64_t v19 = [v15 curatedKeyAssetForAssetCollection:v16 curatedAssetCollection:v11 options:v17 criteria:v28[5] curationContext:v18];

  _Block_object_dispose(&v27, 8);
  return v19;
}

void __104__PGManager_Curation__curatedKeyAssetForAssetCollection_curatedAssetCollection_options_curationContext___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v8 = [a2 graph];
  uint64_t v5 = [v3 criteriaForKeyAssetCurationWithAssetCollection:v4 graph:v8 options:a1[6] curationContext:a1[7]];
  uint64_t v6 = *(void *)(a1[8] + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

+ (id)summaryCurationForHighlight:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = MEMORY[0x1E4F14500];
  id v5 = MEMORY[0x1E4F14500];
  uint64_t v6 = v4;
  os_signpost_id_t v7 = os_signpost_id_generate(v4);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v8 = v4;
  unint64_t v9 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v7, "SummaryCuration", "", buf, 2u);
  }
  os_signpost_id_t spid = v7;
  uint64_t v10 = MEMORY[0x1E4F14500];

  uint64_t v34 = mach_absolute_time();
  id v11 = [v3 photoLibrary];
  uint64_t v12 = +[PGManager graphServicesURLWithPhotoLibrary:v11];

  id v13 = [PGCurationManager alloc];
  uint64_t v14 = [v3 photoLibrary];
  BOOL v36 = (void *)v12;
  uint64_t v15 = [(PGCurationManager *)v13 initWithPhotoLibrary:v14 cacheURL:v12];

  __int16 v35 = (void *)v15;
  id v16 = [(PGDefaultEnrichmentProfile *)[PGCompleteEnrichmentProfile alloc] initWithCurationManager:v15 loggingConnection:v10];
  id v17 = [[PGHighlightTailorHighlightInfo alloc] initWithHighlight:v3 serviceManager:0 loggingConnection:v10];
  [(PGHighlightTailorHighlightInfo *)v17 setPromotionScore:0.4];
  id v18 = [(PGDefaultEnrichmentProfile *)v16 summaryCurationWithHighlightInfo:v17 sharingFilter:2 progressBlock:&__block_literal_global_37160];
  uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "uuid", spid);
        [v19 addObject:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v22);
  }

  uint64_t v26 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v29 = MEMORY[0x1E4F14500];
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, spid, "SummaryCuration", "", buf, 2u);
  }
  long long v30 = MEMORY[0x1E4F14500];

  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v43 = "SummaryCuration";
    __int16 v44 = 2048;
    double v45 = (float)((float)((float)((float)(v26 - v34) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  char v31 = (void *)MEMORY[0x1E4F14500];
  return v19;
}

- (BOOL)suggestsToStartSharedLibraryWithError:(id *)a3
{
  id v3 = [(PGManager *)self suggestedPersonsForSharedLibraryParticipants];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)_summaryOfInferencesForMomentNodes:(id)a3 inGraph:(id)a4
{
  v68[2] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v55 = a4;
  id v6 = a3;
  id v54 = objc_alloc_init(v5);
  id v52 = +[PGGraphNodeCollection nodesInGraph:v55];
  os_signpost_id_t v7 = (void *)MEMORY[0x1E4F71E88];
  id v8 = +[PGGraphMomentNode personInMoment];
  id v49 = [v7 adjacencyWithSources:v6 relation:v8 targetsClass:objc_opt_class()];

  unint64_t v9 = (void *)MEMORY[0x1E4F71E88];
  uint64_t v10 = +[PGGraphMomentNode publicEventOfMoment];
  uint64_t v47 = [v9 adjacencyWithSources:v6 relation:v10 targetsClass:objc_opt_class()];

  id v11 = (void *)MEMORY[0x1E4F71F18];
  uint64_t v12 = +[PGGraphMomentNode roiOfMoment];
  v68[0] = v12;
  id v13 = +[PGGraphROINode natureFilter];
  uint64_t v14 = [v13 relation];
  v68[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
  id v53 = [v11 chain:v15];

  double v45 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v6 relation:v53 targetsClass:objc_opt_class()];
  id v16 = (void *)MEMORY[0x1E4F71F18];
  id v17 = +[PGGraphMomentNode roiOfMoment];
  v67[0] = v17;
  id v18 = +[PGGraphROINode mountainFilter];
  uint64_t v19 = [v18 relation];
  v67[1] = v19;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
  id v51 = [v16 chain:v20];

  uint64_t v21 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v6 relation:v51 targetsClass:objc_opt_class()];
  uint64_t v22 = (void *)MEMORY[0x1E4F71F18];
  uint64_t v23 = +[PGGraphMomentNode roiOfMoment];
  v66[0] = v23;
  id v24 = +[PGGraphROINode beachFilter];
  id v25 = [v24 relation];
  v66[1] = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  id v46 = [v22 chain:v26];

  uint64_t v27 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v6 relation:v46 targetsClass:objc_opt_class()];
  id v28 = (void *)MEMORY[0x1E4F71E88];
  id v29 = +[PGGraphMomentNode frequentLocationOfMoment];
  long long v30 = [v28 adjacencyWithSources:v6 relation:v29 targetsClass:objc_opt_class()];

  char v31 = (void *)MEMORY[0x1E4F71E88];
  id v32 = +[PGGraphMomentNode celebratedHolidayOfMoment];
  double v33 = [v31 adjacencyWithSources:v6 relation:v32 targetsClass:objc_opt_class()];

  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __70__PGManager_KnowledgeSPI___summaryOfInferencesForMomentNodes_inGraph___block_invoke;
  v56[3] = &unk_1E68E9F50;
  id v57 = v45;
  id v58 = v27;
  id v59 = v21;
  id v60 = v52;
  id v61 = v30;
  id v62 = v33;
  id v63 = v47;
  id v64 = v49;
  id v65 = v34;
  id v35 = v34;
  id v50 = v49;
  id v48 = v47;
  id v36 = v33;
  id v37 = v30;
  id v38 = v52;
  id v39 = v21;
  id v40 = v27;
  id v41 = v45;
  [v6 enumerateNodesSortedByFloatPropertyForName:@"utcs" usingBlock:v56];

  [v54 setObject:v35 forKeyedSubscript:@"events"];
  long long v42 = [v55 infoNode];

  uint64_t v43 = [v42 creationDate];
  [v54 setObject:v43 forKeyedSubscript:@"graphCreationDate"];

  return v54;
}

void __70__PGManager_KnowledgeSPI___summaryOfInferencesForMomentNodes_inGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v3 hasMeanings])
  {
    id v6 = [v3 meaningLabelsIncludingParents];
    [v5 unionSet:v6];
  }
  if ([v3 isTrip]) {
    [v5 addObject:@"trip"];
  }
  if ([v3 petIsPresent]) {
    [v5 addObject:@"pet"];
  }
  uint64_t v7 = [v3 identifier];
  id v29 = [*(id *)(a1 + 32) targetsForSourceIdentifier:v7];
  if ([v29 count]) {
    [v5 addObject:@"nature"];
  }
  id v28 = [*(id *)(a1 + 40) targetsForSourceIdentifier:v7];
  if ([v28 count]) {
    [v5 addObject:@"beach"];
  }
  uint64_t v27 = [*(id *)(a1 + 48) targetsForSourceIdentifier:v7];
  if ([v27 count]) {
    [v5 addObject:@"mountain"];
  }
  if ([v3 happensPartiallyAtHomeOfPersonNodes:*(void *)(a1 + 56)]) {
    [v5 addObject:@"home"];
  }
  if ([v3 happensPartiallyAtWorkOfPersonNodes:*(void *)(a1 + 56)]) {
    [v5 addObject:@"work"];
  }
  uint64_t v26 = [*(id *)(a1 + 64) targetsForSourceIdentifier:v7];
  if ([v26 count]) {
    [v5 addObject:@"frequentLocation"];
  }
  id v25 = [*(id *)(a1 + 72) targetsForSourceIdentifier:v7];
  id v8 = [v25 holidayNames];
  if ([v8 count])
  {
    unint64_t v9 = [v8 allObjects];
    [v4 setObject:v9 forKeyedSubscript:@"holidays"];
  }
  id v24 = v8;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = [*(id *)(a1 + 80) targetsForSourceIdentifier:v7];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __70__PGManager_KnowledgeSPI___summaryOfInferencesForMomentNodes_inGraph___block_invoke_2;
  v33[3] = &unk_1E68ED920;
  id v12 = v10;
  id v34 = v12;
  uint64_t v23 = v11;
  [v11 enumerateNodesUsingBlock:v33];
  if ([v12 count]) {
    [v4 setObject:v12 forKeyedSubscript:@"publicEvents"];
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = objc_msgSend(*(id *)(a1 + 88), "targetsForSourceIdentifier:", objc_msgSend(v3, "identifier"));
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __70__PGManager_KnowledgeSPI___summaryOfInferencesForMomentNodes_inGraph___block_invoke_3;
  v30[3] = &unk_1E68F0820;
  id v15 = v5;
  id v31 = v15;
  id v16 = v13;
  id v32 = v16;
  [v14 enumerateNodesUsingBlock:v30];
  if ([v16 count]) {
    [v4 setObject:v16 forKeyedSubscript:@"persons"];
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v18 = [v3 universalStartDate];
  uint64_t v19 = [v3 universalEndDate];
  id v20 = (void *)[v17 initWithStartDate:v18 endDate:v19];

  [v4 setObject:v20 forKeyedSubscript:@"eventUniversalDateInterval"];
  uint64_t v21 = [v3 localIdentifier];
  [v4 setObject:v21 forKeyedSubscript:@"localIdentifier"];

  if ([v15 count])
  {
    uint64_t v22 = [v15 allObjects];
    [v4 setObject:v22 forKeyedSubscript:@"inferences"];
  }
  [*(id *)(a1 + 96) addObject:v4];
}

void __70__PGManager_KnowledgeSPI___summaryOfInferencesForMomentNodes_inGraph___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [v11 name];
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  id v5 = [v11 performers];
  if ([v5 count])
  {
    id v6 = [v5 allObjects];
    [v3 setObject:v6 forKeyedSubscript:@"performers"];
  }
  uint64_t v7 = [v11 collection];
  id v8 = [v7 businessNodes];

  unint64_t v9 = [v8 businessNames];
  if ([v9 count])
  {
    id v10 = [v9 anyObject];
    [v3 setObject:v10 forKeyedSubscript:@"venue"];
  }
  [*(id *)(a1 + 32) addObject:v3];
}

void __70__PGManager_KnowledgeSPI___summaryOfInferencesForMomentNodes_inGraph___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [v8 localIdentifier];
  if ([v4 length]) {
    [v3 setObject:v4 forKeyedSubscript:@"localIdentifier"];
  }
  id v5 = [v8 contactIdentifier];
  if ([v5 length]) {
    [v3 setObject:v5 forKeyedSubscript:@"contactIdentifier"];
  }
  id v6 = [v8 name];
  if ([v6 length]) {
    [v3 setObject:v6 forKeyedSubscript:@"name"];
  }
  if ([v8 isMemberOfMyFamily])
  {
    uint64_t v7 = @"confirmed";
  }
  else
  {
    if (![v8 isInferredMemberOfMyFamily]) {
      goto LABEL_12;
    }
    uint64_t v7 = @"inferred";
  }
  [v3 setObject:v7 forKeyedSubscript:@"family"];
LABEL_12:
  if ([v8 ageCategory] == 1) {
    [*(id *)(a1 + 32) addObject:@"baby"];
  }
  if ([v3 count]) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (id)summaryOfInferencesPerMomentInDateInterval:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__40289;
  id v17 = __Block_byref_object_dispose__40290;
  id v18 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PGManager_KnowledgeSPI__summaryOfInferencesPerMomentInDateInterval_error___block_invoke;
  v9[3] = &unk_1E68E9F28;
  id v6 = v5;
  id v11 = self;
  id v12 = &v13;
  id v10 = v6;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __76__PGManager_KnowledgeSPI__summaryOfInferencesPerMomentInDateInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v7 = [a2 graph];
  id v3 = +[PGGraphMomentNodeCollection momentNodesInUniversalDateInterval:*(void *)(a1 + 32) inGraph:v7];
  uint64_t v4 = [*(id *)(a1 + 40) _summaryOfInferencesForMomentNodes:v3 inGraph:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)summaryOfInferencesPerMomentByLocalIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = [MEMORY[0x1E4F391A0] uuidFromLocalIdentifier:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        [v6 addObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__40289;
  uint64_t v23 = __Block_byref_object_dispose__40290;
  id v24 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__PGManager_KnowledgeSPI__summaryOfInferencesPerMomentByLocalIdentifiers_error___block_invoke;
  v15[3] = &unk_1E68E9F28;
  id v12 = v6;
  id v17 = self;
  id v18 = &v19;
  id v16 = v12;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v15];
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __80__PGManager_KnowledgeSPI__summaryOfInferencesPerMomentByLocalIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  id v7 = [a2 graph];
  id v3 = +[PGGraphMomentNodeCollection momentNodesForUUIDs:*(void *)(a1 + 32) inGraph:v7];
  uint64_t v4 = [*(id *)(a1 + 40) _summaryOfInferencesForMomentNodes:v3 inGraph:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)momentLocalIdentifiersInDateInterval:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PGManager_KnowledgeSPI__momentLocalIdentifiersInDateInterval_error___block_invoke;
  v12[3] = &unk_1E68F0AF0;
  id v13 = v5;
  id v7 = v6;
  id v14 = v7;
  id v8 = v5;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v12];
  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

void __70__PGManager_KnowledgeSPI__momentLocalIdentifiersInDateInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 graph];
  uint64_t v4 = +[PGGraphMomentNodeCollection momentNodesInUniversalDateInterval:*(void *)(a1 + 32) inGraph:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__PGManager_KnowledgeSPI__momentLocalIdentifiersInDateInterval_error___block_invoke_2;
  v5[3] = &unk_1E68EF578;
  id v6 = *(id *)(a1 + 40);
  [v4 enumerateNodesSortedByFloatPropertyForName:@"utcs" usingBlock:v5];
}

void __70__PGManager_KnowledgeSPI__momentLocalIdentifiersInDateInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 localIdentifier];
  [v2 addObject:v3];
}

- (double)libraryDuration
{
  uint64_t v5 = 0;
  id v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__PGManager_MoodKeywords__libraryDuration__block_invoke;
  v4[3] = &unk_1E68F0A78;
  v4[4] = &v5;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __42__PGManager_MoodKeywords__libraryDuration__block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 graph];
  [v4 libraryDuration];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

- (id)_recentlyUsedSongAdamIDsFromCurationOptions:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = [v5 recentlyUsedSongAdamIDs];
  uint64_t v7 = [v4 setWithArray:v6];

  uint64_t v8 = [v5 rootMemoryLocalIdentifier];

  if (v8)
  {
    uint64_t v9 = [(PGManager *)self photoLibrary];
    id v10 = [v9 librarySpecificFetchOptions];

    [v10 setIncludeLocalMemories:1];
    id v11 = (void *)MEMORY[0x1E4F39160];
    v18[0] = v8;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v13 = [v11 fetchAssetCollectionsWithLocalIdentifiers:v12 options:v10];

    id v14 = [v13 firstObject];
    if (v14)
    {
      uint64_t v15 = +[PGKeySongExtractor appleMusicKeySongIDFromMemory:v14];
      if (v15) {
        [v7 addObject:v15];
      }
    }
  }
  id v16 = [v7 allObjects];

  return v16;
}

- (id)musicCurationInflationContextWithInflationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if (v7->_musicCache) {
    goto LABEL_3;
  }
  uint64_t v8 = [(PGManager *)v7 photoLibrary];
  uint64_t v9 = +[PGMusicCache cacheWithPhotoLibrary:v8 error:a4];
  musicCache = v7->_musicCache;
  v7->_musicCache = (PGMusicCache *)v9;

  if (v7->_musicCache)
  {
LABEL_3:
    id v11 = +[PGMusicCurationInflationOptions stringFromInflationActionSource:](PGMusicCurationInflationOptions, "stringFromInflationActionSource:", [v6 inflationActionSource]);
    id v12 = +[PGMusicCurationInflationContext contextWithMusicCache:actionSource:shouldForceMetadataRefetch:](PGMusicCurationInflationContext, "contextWithMusicCache:actionSource:shouldForceMetadataRefetch:", v7->_musicCache, v11, [v6 shouldForceMetadataRefetch]);
  }
  else
  {
    id v12 = 0;
  }
  objc_sync_exit(v7);

  return v12;
}

- (id)musicCuratorContextWithCurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if (v7->_musicCache) {
    goto LABEL_3;
  }
  uint64_t v8 = [(PGManager *)v7 photoLibrary];
  uint64_t v9 = +[PGMusicCache cacheWithPhotoLibrary:v8 error:a4];
  musicCache = v7->_musicCache;
  v7->_musicCache = (PGMusicCache *)v9;

  if (v7->_musicCache)
  {
LABEL_3:
    id v11 = [(PGManager *)v7 musicBag];

    if (!v11)
    {
      id v12 = [[PGMusicBag alloc] initWithCache:v7->_musicCache];
      [(PGManager *)v7 setMusicBag:v12];
    }
    if (+[PGUserDefaults musicCurationAllowExplicitMusicContent])
    {
      uint64_t v13 = MEMORY[0x1E4F1CC38];
    }
    else
    {
      uint64_t v13 = MEMORY[0x1E4F1CC28];
    }
    id v14 = [v6 musicCurationSpecificationOptions];
    if (!v14) {
      goto LABEL_11;
    }
    uint64_t v15 = [v6 musicCurationSpecificationOptions];
    id v16 = [v15 genres];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      id v18 = [v6 musicCurationSpecificationOptions];
      uint64_t v19 = [v18 genres];
      id v32 = [v19 firstObject];
    }
    else
    {
LABEL_11:
      id v32 = 0;
    }
    if ([v6 useMemoryCreationMusicCuratorConfiguration])
    {
      id v20 = +[PGMusicCuratorConfigurationWrapper memoryCreationConfiguration];
      uint64_t v21 = v13;
      uint64_t v22 = a4;
      uint64_t v23 = MEMORY[0x1E4F1CC38];
    }
    else
    {
      uint64_t v21 = v13;
      uint64_t v22 = a4;
      id v20 = 0;
      uint64_t v23 = MEMORY[0x1E4F1CC28];
    }
    id v24 = [(PGManager *)v7 photoLibrary];
    long long v25 = v7->_musicCache;
    long long v26 = [(PGManager *)v7 musicBag];
    long long v27 = +[PGMusicCuratorContext contextWithPhotoLibrary:v24 adamIDsWithNegativeUserFeedback:0 allowExplicitMusicContent:v21 cache:v25 musicBag:v26 recentlyUsedSongs:0 genre:v32 isMemoryCreationCuration:v23 configuration:v20 error:v22];

    long long v28 = [(PGManager *)v7 _recentlyUsedSongAdamIDsFromCurationOptions:v6];
    if (v28)
    {
      id v29 = [v27 recentlyUsedSongs];
      uint64_t v30 = [MEMORY[0x1E4F1C9C8] date];
      [v29 addSongIDs:v28 date:v30];
    }
    objc_msgSend(v27, "setUseOnlyMusicForTopicInTopPickSuggestions:", objc_msgSend(v6, "useOnlyMusicForTopicInTopPickSuggestions"));
    objc_msgSend(v27, "setAllowChillMixElection:", objc_msgSend(v6, "includeChillMixInMusicForYou"));
    objc_msgSend(v27, "setAllowGetUpMixElection:", objc_msgSend(v6, "includeGetUpMixInMusicForYou"));
    objc_msgSend(v27, "setRefreshSongMetadata:", objc_msgSend(v6, "shouldRefreshSongMetadata"));
    objc_msgSend(v27, "setForceShareableInBestSuggestions:", objc_msgSend(v6, "shouldForceShareableInBestSuggestions"));
  }
  else
  {
    long long v27 = 0;
  }
  objc_sync_exit(v7);

  return v27;
}

- (id)musicCuratorContextWithRecentlyUsedSongAdamIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if (v7->_musicCache) {
    goto LABEL_3;
  }
  uint64_t v8 = [(PGManager *)v7 photoLibrary];
  uint64_t v9 = +[PGMusicCache cacheWithPhotoLibrary:v8 error:a4];
  musicCache = v7->_musicCache;
  v7->_musicCache = (PGMusicCache *)v9;

  if (v7->_musicCache)
  {
LABEL_3:
    id v11 = [(PGManager *)v7 musicBag];

    if (!v11)
    {
      id v12 = [[PGMusicBag alloc] initWithCache:v7->_musicCache];
      [(PGManager *)v7 setMusicBag:v12];
    }
    BOOL v13 = +[PGUserDefaults musicCurationAllowExplicitMusicContent];
    uint64_t v14 = MEMORY[0x1E4F1CC28];
    if (v13) {
      uint64_t v15 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v15 = MEMORY[0x1E4F1CC28];
    }
    id v16 = [(PGManager *)v7 photoLibrary];
    uint64_t v17 = v7->_musicCache;
    id v18 = [(PGManager *)v7 musicBag];
    uint64_t v19 = +[PGMusicCuratorContext contextWithPhotoLibrary:v16 adamIDsWithNegativeUserFeedback:0 allowExplicitMusicContent:v15 cache:v17 musicBag:v18 recentlyUsedSongs:0 genre:0 isMemoryCreationCuration:v14 configuration:0 error:a4];

    if (v6)
    {
      id v20 = [v19 recentlyUsedSongs];
      uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
      [v20 addSongIDs:v6 date:v21];
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  objc_sync_exit(v7);

  return v19;
}

- (id)requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[PGOneUpRelatedRequestHandler alloc] initWithGraphManager:self error:0];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__50808;
  id v18 = __Block_byref_object_dispose__50809;
  id v19 = 0;
  uint64_t v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__PGManager_OneUpRelated__requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier_error___block_invoke;
  v11[3] = &unk_1E68EB2B0;
  BOOL v13 = &v14;
  uint64_t v8 = v7;
  id v12 = v8;
  [(PGOneUpRelatedRequestHandler *)v6 requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:v5 error:v11];
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __102__PGManager_OneUpRelated__requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[PGOneUpRelatedRequestHandler alloc] initWithGraphManager:self error:0];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__50808;
  id v18 = __Block_byref_object_dispose__50809;
  id v19 = 0;
  uint64_t v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __104__PGManager_OneUpRelated__requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier_error___block_invoke;
  v11[3] = &unk_1E68EB2B0;
  BOOL v13 = &v14;
  uint64_t v8 = v7;
  id v12 = v8;
  [(PGOneUpRelatedRequestHandler *)v6 requestAssetLocalIdentifiersTakenNearCoordinatesFromAssetLocalIdentifier:v5 error:v11];
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __104__PGManager_OneUpRelated__requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)_stringDescriptionForMusicWithGraph:(id)a3 summaryOnly:(BOOL)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PGManager *)self _dateFormatter];
  uint64_t v7 = [MEMORY[0x1E4F28E78] string];
  uint64_t v8 = [v5 musicSessions];
  uint64_t v9 = [v8 count];
  objc_msgSend(v7, "appendFormat:", @"\nMusic Sessions: %lu\n", v9);
  if (v9)
  {
    uint64_t v30 = v8;
    id v31 = v5;
    id v10 = [v8 allObjects];
    id v11 = +[PGGraphMusicSessionNode musicSessionDateSortDescriptors];
    id v12 = [v10 sortedArrayUsingDescriptors:v11];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obuint64_t j = v12;
    uint64_t v37 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v37)
    {
      uint64_t v35 = *(void *)v45;
      uint64_t v13 = 1;
      id v32 = v6;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v45 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          uint64_t v16 = [v15 localStartDate];
          uint64_t v17 = [v15 localEndDate];
          id v18 = [v6 stringFromDate:v16];
          id v19 = [v6 stringFromDate:v17];
          [v7 appendFormat:@"\tSession %lu:\t[%@ - %@]\n", v13, v18, v19];

          if (!a4)
          {
            id v34 = [v15 trackNodes];
            id v20 = [v34 allObjects];
            uint64_t v21 = +[PGGraphMusicTrackNode musicTrackTitleSortDescriptors];
            uint64_t v22 = [v20 sortedArrayUsingDescriptors:v21];

            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            id v23 = v22;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v48 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v41;
              do
              {
                for (uint64_t j = 0; j != v25; ++j)
                {
                  if (*(void *)v41 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  [v7 appendFormat:@"\t\tTrack:\t%@\n", *(void *)(*((void *)&v40 + 1) + 8 * j)];
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v48 count:16];
              }
              while (v25);
            }

            id v6 = v32;
          }
          ++v13;
        }
        uint64_t v37 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v37);
    }

    uint64_t v8 = v30;
    id v5 = v31;
  }
  if (!a4)
  {
    [v7 appendFormat:@"\n"];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PGManager_Debug___stringDescriptionForMusicWithGraph_summaryOnly___block_invoke;
    aBlock[3] = &unk_1E68EBE28;
    id v39 = v7;
    long long v28 = (void (**)(void *, id, uint64_t))_Block_copy(aBlock);
    v28[2](v28, v5, 1);
    v28[2](v28, v5, 0);
  }
  [v7 appendFormat:@"\n"];

  return v7;
}

void __68__PGManager_Debug___stringDescriptionForMusicWithGraph_summaryOnly___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a2, "musicGenreDistributionUsingTaggedGenres:");
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v5 count];
  uint64_t v8 = @"original";
  if (a3) {
    uint64_t v8 = @"tagged";
  }
  [v6 appendFormat:@"\nMusic genre distribution for %lu %@ genre(s)", v7, v8];
  uint64_t v9 = [v5 allKeys];
  id v10 = [v9 sortedArrayUsingSelector:sel_compare_];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v17 = *(void **)(a1 + 32);
        id v18 = [v5 objectForKeyedSubscript:v16];
        [v17 appendFormat:@"\n%@\t%@", v16, v18, (void)v19];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  if ([v11 count]) {
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
}

- (id)_behavioralStatisticsWithGraph:(id)a3
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E78] string];
  [v5 appendString:@"Personal Aesthetic Thresholds\n\n"];
  id v6 = [v4 infoNode];
  [v6 personalHighAestheticsThreshold];
  uint64_t v8 = v7;
  char v99 = v6;
  [v6 personalGoodAestheticsThreshold];
  uint64_t v10 = v9;
  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"\tHigh Threshold: %f", v8);
  [v5 appendString:v11];

  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"\tGood Threshold: %f", v10);
  [v5 appendString:v12];

  [v5 appendString:@"\n\nInteraction Score Distribution\n\n"];
  float v13 = 0.0;
  do
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(computedAttributes.interactionScore <= %f) AND (computedAttributes.interactionScore > %f) ", v13, (float)(v13 + -0.1));
    unint64_t v15 = [(PGManager *)self _numberOfAssetsMatchingInternalPredicate:v14];
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"\t%0.2f < score <= %0.2f : %lu assets\n", (float)(v13 + -0.1), v13, v15);
    [v5 appendString:v16];

    float v13 = v13 + 0.1;
  }
  while (v13 <= 1.1);
  [v5 appendString:@"\n\nBehavioral Score Distribution\n\n"];
  float v17 = 0.0;
  do
  {
    id v18 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(computedAttributes.behavioralScore <= %f) AND (computedAttributes.behavioralScore > %f) ", v17, (float)(v17 + -0.1));
    unint64_t v19 = [(PGManager *)self _numberOfAssetsMatchingInternalPredicate:v18];
    long long v20 = objc_msgSend(NSString, "stringWithFormat:", @"\t%0.2f < score <= %0.2f : %lu assets\n", (float)(v17 + -0.1), v17, v19);
    [v5 appendString:v20];

    float v17 = v17 + 0.1;
  }
  while (v17 <= 1.1);
  long long v21 = [[PGBehavioralScoreProcessor alloc] initWithGraphManager:self algorithm:1];
  [v5 appendString:@"\n\nGold and Gem Assets\n\n"];
  long long v22 = (void *)MEMORY[0x1E4F28F60];
  id v23 = [(PGBehavioralScoreProcessor *)v21 goldAssetUUIDs];
  uint64_t v24 = [v22 predicateWithFormat:@"uuid IN %@", v23];

  uint64_t v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(computedAttributes.behavioralScore < 1 AND computedAttributes.behavioralScore >= 0.9)"];
  uint64_t v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(computedAttributes.behavioralScore < 0.9 AND computedAttributes.behavioralScore >= 0.7)"];
  v103 = (void *)v24;
  long long v27 = objc_msgSend(NSString, "stringWithFormat:", @"\tGold Assets : %lu", -[PGManager _numberOfAssetsMatchingInternalPredicate:](self, "_numberOfAssetsMatchingInternalPredicate:", v24));
  [v5 appendString:v27];

  id v102 = (void *)v25;
  long long v28 = objc_msgSend(NSString, "stringWithFormat:", @"\tShiny Gems Assets : %lu", -[PGManager _numberOfAssetsMatchingInternalPredicate:](self, "_numberOfAssetsMatchingInternalPredicate:", v25));
  [v5 appendString:v28];

  v104 = self;
  char v101 = (void *)v26;
  id v29 = objc_msgSend(NSString, "stringWithFormat:", @"\tRegular Gems Assets : %lu", -[PGManager _numberOfAssetsMatchingInternalPredicate:](self, "_numberOfAssetsMatchingInternalPredicate:", v26));
  [v5 appendString:v29];

  [v5 appendString:@"\n\nPerson Features:\n"];
  long long v114 = [(PGBehavioralScoreProcessor *)v21 peopleFeatures];
  uint64_t v30 = [v114 keysSortedByValueUsingComparator:&__block_literal_global_1713];
  uint64_t v100 = v4;
  uint64_t v97 = +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:v30 inGraph:v4];
  long long v113 = [v97 personNodeByLocalIdentifier];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  obuint64_t j = v30;
  uint64_t v31 = [obj countByEnumeratingWithState:&v123 objects:v129 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v124;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v124 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = *(void *)(*((void *)&v123 + 1) + 8 * i);
        id v36 = [v114 objectForKeyedSubscript:v35];
        uint64_t v37 = [v113 objectForKeyedSubscript:v35];
        id v38 = v37;
        if (v37)
        {
          id v39 = NSString;
          long long v40 = [v37 stringDescription];
          long long v41 = [v39 stringWithFormat:@"\t\t%@: %@\n", v40, v36];
          [v5 appendString:v41];
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v123 objects:v129 count:16];
    }
    while (v32);
  }

  [v5 appendString:@"\n\nScenes Features:\n"];
  uint64_t v98 = v21;
  uint64_t v112 = [(PGBehavioralScoreProcessor *)v21 sceneFeatures];
  long long v42 = [v112 keysSortedByValueUsingComparator:&__block_literal_global_1721];
  v111 = (void *)[objc_alloc(MEMORY[0x1E4F8E790]) initForSceneNetOnly:1];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v107 = v42;
  uint64_t v43 = [v107 countByEnumeratingWithState:&v119 objects:v128 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v120;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v120 != v45) {
          objc_enumerationMutation(v107);
        }
        long long v47 = *(void **)(*((void *)&v119 + 1) + 8 * j);
        id v48 = [v112 objectForKeyedSubscript:v47];
        id v49 = objc_msgSend(v111, "nodeForIdentifier:", objc_msgSend(v47, "integerValue"));
        uint64_t v50 = [v49 name];
        id v51 = [NSString stringWithFormat:@"\t\t%@: %@\n", v50, v48];
        [v5 appendString:v51];
      }
      uint64_t v44 = [v107 countByEnumeratingWithState:&v119 objects:v128 count:16];
    }
    while (v44);
  }

  id v52 = [NSString stringWithFormat:@"\n\nCuration Scores among BC assets:\n"];
  [v5 appendString:v52];

  id v53 = [NSString stringWithFormat:@"\n\tCuration Score\t\t%%Gold Assets\t\t%%Shiny Gems\t\t%%Regular Gems"];
  [v5 appendString:v53];

  id v54 = [MEMORY[0x1E4F1CA80] set];
  id v55 = [MEMORY[0x1E4F28BD0] set];
  uint64_t v56 = [(PGManager *)v104 _fetchResultMatchingInternalPredicate:v103];
  uint64_t v57 = [v56 count];
  if (v57)
  {
    for (uint64_t k = 0; k != v57; ++k)
    {
      id v59 = [v56 objectAtIndexedSubscript:k];
      id v60 = NSNumber;
      [v59 curationScore];
      id v61 = objc_msgSend(v60, "numberWithDouble:");
      [v55 addObject:v61];
      [v54 addObject:v61];
    }
  }
  unint64_t v95 = v57;
  id v62 = [MEMORY[0x1E4F28BD0] set];
  id v63 = [(PGManager *)v104 _fetchResultMatchingInternalPredicate:v102];
  uint64_t v64 = [v63 count];
  __int16 v106 = v63;
  if (v64)
  {
    for (uint64_t m = 0; m != v64; ++m)
    {
      long long v66 = [v63 objectAtIndexedSubscript:m];
      id v67 = NSNumber;
      [v66 curationScore];
      long long v68 = objc_msgSend(v67, "numberWithDouble:");
      [v62 addObject:v68];
      [v54 addObject:v68];

      id v63 = v106;
    }
  }
  unint64_t v93 = v64;
  v109 = v62;
  uint64_t v110 = v55;
  uint64_t v96 = v56;
  id v69 = [MEMORY[0x1E4F28BD0] set];
  id v70 = [(PGManager *)v104 _fetchResultMatchingInternalPredicate:v101];
  unint64_t v71 = [v70 count];
  if (v71)
  {
    for (uint64_t n = 0; n != v71; ++n)
    {
      id v73 = [v70 objectAtIndexedSubscript:n];
      id v74 = NSNumber;
      [v73 curationScore];
      id v75 = objc_msgSend(v74, "numberWithDouble:");
      [v69 addObject:v75];
      [v54 addObject:v75];
    }
  }
  uint64_t v94 = v70;
  int v105 = v54;
  id v76 = [v54 allObjects];
  id v77 = [v76 sortedArrayUsingSelector:sel_compare_];

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v78 = v77;
  uint64_t v79 = [v78 countByEnumeratingWithState:&v115 objects:v127 count:16];
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = *(void *)v116;
    double v82 = (double)v71;
    do
    {
      for (iuint64_t i = 0; ii != v80; ++ii)
      {
        uint64_t v84 = v5;
        if (*(void *)v116 != v81) {
          objc_enumerationMutation(v78);
        }
        long long v85 = *(void **)(*((void *)&v115 + 1) + 8 * ii);
        double v86 = (double)(unint64_t)[v110 countForObject:v85] / (double)v95 * 100.0;
        double v87 = (double)(unint64_t)[v109 countForObject:v85] / (double)v93 * 100.0;
        double v88 = (double)(unint64_t)[v69 countForObject:v85] / v82 * 100.0;
        long long v89 = NSString;
        [v85 doubleValue];
        long long v91 = objc_msgSend(v89, "stringWithFormat:", @"\n\t%0.3f\t\t\t%0.3f\t\t\t%0.3f\t\t\t%0.3f", v90, *(void *)&v86, *(void *)&v87, *(void *)&v88);
        id v5 = v84;
        [v84 appendString:v91];
      }
      uint64_t v80 = [v78 countByEnumeratingWithState:&v115 objects:v127 count:16];
    }
    while (v80);
  }

  return v5;
}

uint64_t __51__PGManager_Debug___behavioralStatisticsWithGraph___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __51__PGManager_Debug___behavioralStatisticsWithGraph___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (unint64_t)_numberOfAssetsMatchingInternalPredicate:(id)a3
{
  uint64_t v3 = [(PGManager *)self _fetchResultMatchingInternalPredicate:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)_fetchResultMatchingInternalPredicate:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PGManager *)self photoLibrary];
  id v6 = [v5 librarySpecificFetchOptions];

  [v6 setIncludeGuestAssets:1];
  v10[0] = *MEMORY[0x1E4F39458];
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v6 addFetchPropertySets:v7];

  [v6 setInternalPredicate:v4];
  uint64_t v8 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v6];

  return v8;
}

- (id)_stringDescriptionForPetsWithGraph:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PGManager *)self _dateFormatter];
  id v6 = +[PGGraphNodeCollection nodesInGraph:v4];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"\nNumber of Pets: %lu\n", objc_msgSend(v6, "count"));
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55__PGManager_Debug___stringDescriptionForPetsWithGraph___block_invoke;
  v21[3] = &unk_1E68EBDE0;
  id v9 = v5;
  id v22 = v9;
  id v10 = v8;
  id v23 = v10;
  [v6 enumerateNodesUsingBlock:v21];
  [v10 sortUsingSelector:sel_caseInsensitiveCompare_];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        [v7 appendString:*(void *)(*((void *)&v17 + 1) + 8 * i)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v24 count:16];
    }
    while (v13);
  }

  return v7;
}

void __55__PGManager_Debug___stringDescriptionForPetsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  v59[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [v2 collection];
  id v5 = [v4 ownerNodes];
  id v6 = +[PGGraphPersonNode personSortDescriptors];
  uint64_t v7 = [v5 sortedArrayUsingDescriptors:v6];

  uint64_t v8 = +[PGGraphPetNode stringFromPetSpecies:](PGGraphPetNode, "stringFromPetSpecies:", [v2 petSpecies]);
  id v9 = [v2 name];
  id v10 = [v2 localIdentifier];
  [v3 appendFormat:@"%@ with name \"%@\" and local identifier \"%@\" owned by:", v8, v9, v10];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v53 + 1) + 8 * i) name];
        long long v17 = (void *)v16;
        if (v16) {
          long long v18 = (__CFString *)v16;
        }
        else {
          long long v18 = @"Unnamed owner";
        }
        [v3 appendFormat:@"%@, ", v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v13);
  }
  long long v46 = v11;

  long long v47 = v2;
  long long v19 = [v2 collection];
  long long v20 = [v19 momentNodes];
  long long v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  v59[0] = v21;
  id v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
  v59[1] = v22;
  id v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  v59[2] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];

  uint64_t v25 = [v20 sortedArrayUsingDescriptors:v24];

  uint64_t v26 = [v25 firstObject];
  uint64_t v27 = [v26 localStartDate];

  long long v28 = [v25 lastObject];
  uint64_t v29 = [v28 localStartDate];

  uint64_t v30 = [v25 count];
  uint64_t v45 = (void *)v27;
  uint64_t v31 = [*(id *)(a1 + 32) stringFromDate:v27];
  uint64_t v44 = (void *)v29;
  uint64_t v32 = [*(id *)(a1 + 32) stringFromDate:v29];
  [v3 appendFormat:@"\n\t\t%lu moments from %@ to %@:\n", v30, v31, v32];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v33 = v25;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v50 != v36) {
          objc_enumerationMutation(v33);
        }
        id v38 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        id v39 = *(void **)(a1 + 32);
        long long v40 = [v38 localStartDate];
        long long v41 = [v39 stringFromDate:v40];
        [v3 appendFormat:@"\t\t%@", v41];

        long long v42 = [v38 bestAddressNode];
        uint64_t v43 = [v42 keywordDescription];
        [v3 appendFormat:@"\t\t\t%@\n", v43];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v35);
  }

  [*(id *)(a1 + 40) addObject:v3];
}

- (id)_sortedTextFeaturesFromTextFeatures:(id)a3
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F29008];
  id v4 = a3;
  id v5 = [v3 sortDescriptorWithKey:@"type" ascending:1];
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"origin" ascending:1];
  v10[0] = v5;
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v8 = [v4 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (id)sharingMessageSuggestionDebugInformationForAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __79__PGManager_Debug__sharingMessageSuggestionDebugInformationForAssetCollection___block_invoke;
  void v10[3] = &unk_1E68F0960;
  id v11 = v4;
  id v6 = v5;
  id v12 = v6;
  uint64_t v13 = self;
  id v7 = v4;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v10];
  id v8 = v6;

  return v8;
}

void __79__PGManager_Debug__sharingMessageSuggestionDebugInformationForAssetCollection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 uuid];
  id v6 = [v4 graph];

  id v7 = +[PGGraphMomentNodeCollection momentNodeForUUID:v5 inGraph:v6];
  id v8 = [v7 anyNode];

  if (v8)
  {
    v22[0] = @"title";
    uint64_t v9 = [*(id *)(a1 + 32) localizedTitle];
    id v10 = (void *)v9;
    id v11 = &stru_1F283BC78;
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    v23[0] = v11;
    v23[1] = &unk_1F28D26D0;
    v22[1] = @"numberOfMoments";
    v22[2] = @"numberOfHighlights";
    void v23[2] = &unk_1F28D26E8;
    v23[3] = &unk_1F28D25E0;
    v22[3] = @"graphSchemaVersion";
    void v22[4] = @"curationAlgorithmsVersion";
    void v23[4] = &unk_1F28D25F8;
    v23[5] = &unk_1F28D2490;
    v22[5] = @"relatedAlgorithmsVersion";
    v22[6] = @"memoriesAlgorithmsVersion";
    v23[6] = &unk_1F28D2610;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
    [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:@"info"];

    uint64_t v13 = *(void **)(a1 + 48);
    uint64_t v14 = [v8 naturalLanguageFeatures];
    unint64_t v15 = [v13 _sortedTextFeaturesFromTextFeatures:v14];

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __79__PGManager_Debug__sharingMessageSuggestionDebugInformationForAssetCollection___block_invoke_1629;
    v20[3] = &unk_1E68EBDB8;
    id v21 = v16;
    id v17 = v16;
    [v15 enumerateObjectsUsingBlock:v20];
    [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:@"textFeatures"];
  }
  else
  {
    long long v18 = +[PGLogging sharedLogging];
    unint64_t v15 = [v18 loggingConnection];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v25 = v19;
      _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "No moment node found for %@", buf, 0xCu);
    }
  }
}

void __79__PGManager_Debug__sharingMessageSuggestionDebugInformationForAssetCollection___block_invoke_1629(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSString;
  id v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", @"%lu", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 description];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
}

- (id)_dayOfWeekStatisticsWithGraph:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v23 = [MEMORY[0x1E4F28E78] string];
  [v23 appendFormat:@"Number of moments by day of week:\n"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v3 = 0;
  uint64_t v4 = [&unk_1F28D4740 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(&unk_1F28D4740);
        }
        id v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v25 = 0;
        uint64_t v26 = &v25;
        uint64_t v27 = 0x2020000000;
        uint64_t v28 = 0;
        id v8 = objc_msgSend(v22, "dayOfWeekNodeForDayOfWeek:", objc_msgSend(v7, "integerValue"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __50__PGManager_Debug___dayOfWeekStatisticsWithGraph___block_invoke;
        v24[3] = &unk_1E68EBAC0;
        v24[4] = &v25;
        [v8 enumerateNeighborNodesThroughEdgesWithLabel:@"DAYOFWEEK" domain:400 usingBlock:v24];
        uint64_t v9 = [v8 name];
        id v10 = [NSNumber numberWithUnsignedInteger:v26[3]];
        [v23 appendFormat:@"\t%@: %@ moments\n", v9, v10];

        uint64_t v11 = v26[3];
        v3 += v11;
        _Block_object_dispose(&v25, 8);
      }
      uint64_t v4 = [&unk_1F28D4740 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v4);
  }
  id v12 = [NSNumber numberWithUnsignedInteger:v3];
  [v23 appendFormat:@"\n\tTotal: %@ moments\n", v12];

  uint64_t v13 = [v22 anyNodeForLabel:@"Weekend" domain:400 properties:0];
  uint64_t v14 = v13;
  if (v13) {
    uint64_t v15 = [v13 edgesCount];
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:v15];
  [v23 appendFormat:@"\n\tWeekend: %@ moments\n", v16];

  id v17 = [v22 anyNodeForLabel:@"Weekday" domain:400 properties:0];
  long long v18 = v17;
  if (v17) {
    uint64_t v19 = [v17 edgesCount];
  }
  else {
    uint64_t v19 = 0;
  }
  long long v20 = [NSNumber numberWithUnsignedInteger:v19];
  [v23 appendFormat:@"\tWeekday: %@ moments\n", v20];

  return v23;
}

void __50__PGManager_Debug___dayOfWeekStatisticsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 collection];
  uint64_t v4 = [v3 momentNodes];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PGManager_Debug___dayOfWeekStatisticsWithGraph___block_invoke_2;
  v5[3] = &unk_1E68EB798;
  void v5[4] = *(void *)(a1 + 32);
  [v4 enumerateNodesUsingBlock:v5];
}

uint64_t __50__PGManager_Debug___dayOfWeekStatisticsWithGraph___block_invoke_2(uint64_t result)
{
  return result;
}

- (id)snapshotOuputFilePathURLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PGManager *)self defaultSnapshotRootPath];
  id v6 = [(PGManager *)self _snapshotFilenameForLookupKey:v4];

  if (v6)
  {
    id v7 = [v5 stringByAppendingPathComponent:v6];
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  }

  return v8;
}

- (id)_snapshotFilenameForLookupKey:(id)a3
{
  id v3 = a3;
  if (_snapshotFilenameForLookupKey__onceToken != -1) {
    dispatch_once(&_snapshotFilenameForLookupKey__onceToken, &__block_literal_global_1572);
  }
  if (_snapshotFilenameForLookupKey__snapshotFilenameLookup)
  {
    id v4 = [(id)_snapshotFilenameForLookupKey__snapshotFilenameLookup valueForKey:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __50__PGManager_Debug___snapshotFilenameForLookupKey___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Graph.plist", @"snapshotFilenameForGraphState", @"photosgraph.kgdb", @"filenameForGraphKGDBSnapshot", @"CurationResult.bundle", @"snapshotFilenameForCurationResults", @"DebugInfoForRelated.plist", @"snapshotFilenameForDebugInfoForRelated", @"Memories.plist", @"snapshotFilenameForMemories", @"LibraryStatistics.plist", @"snapshotFilenameForLibraryStatistics", @"Errors.txt", @"snapshotFilenameForErrors", @"GraphStatistics.txt", @"snapshotFilenameForGraphStatistics", 0);
  uint64_t v1 = (void *)_snapshotFilenameForLookupKey__snapshotFilenameLookup;
  _snapshotFilenameForLookupKey__snapshotFilenameLookup = v0;
}

- (id)defaultPeopleClustersExportIntermediatePath
{
  id v2 = [NSString stringWithString:@"/var/mobile/Media/PhotoData"];
  id v3 = [v2 stringByAppendingPathComponent:@"PeopleClusters"];

  return v3;
}

- (id)fastGraphExportFullPath
{
  id v2 = [(PGManager *)self graphPersistenceParentDirectoryURL];
  id v3 = [v2 path];

  id v4 = [v3 stringByAppendingPathComponent:@"Graph.plist"];

  return v4;
}

- (id)defaultGraphExportFullPath
{
  id v2 = [NSString stringWithString:@"/var/mobile/Media/PhotoData"];
  id v3 = [v2 stringByAppendingPathComponent:@"Graph.plist"];

  return v3;
}

- (id)defaultSnapshotRootPath
{
  return (id)[@"/var/mobile/Media/PhotoData" stringByAppendingPathComponent:@"Caches/Internal/MemoriesRelated/Memories"];
}

- (id)_getDefaultOutputPathForMetadataSnapshot
{
  id v2 = [(PGManager *)self metadataSnapshotOutputPathURL];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 path];
  }
  else
  {
    uint64_t v5 = NSTemporaryDirectory();
    id v4 = [v5 stringByAppendingPathComponent:@"Caches/Internal/MemoriesRelated/Memories"];
  }
  return v4;
}

- (id)utilityAssetInformation
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v2 = [(PGManager *)self photoLibrary];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v2];
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [v2 librarySpecificFetchOptions];
  [v4 setIncludeGuestAssets:1];
  uint64_t v5 = +[PGCurationManager assetPropertySetsForCuration];
  uint64_t v26 = v4;
  [v4 setFetchPropertySets:v5];

  id v23 = v2;
  id v22 = [v2 librarySpecificFetchOptions];
  objc_msgSend(MEMORY[0x1E4F38EE8], "fetchAssetCollectionsWithType:subtype:options:", 3, 0x7FFFFFFFFFFFFFFFLL);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v37;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v6;
        uint64_t v7 = *(void *)(*((void *)&v36 + 1) + 8 * v6);
        context = (void *)MEMORY[0x1D25FED50]();
        uint64_t v28 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v7 options:v26];
        id v8 = objc_msgSend(MEMORY[0x1E4F38EB8], "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:");
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v33 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              uint64_t v14 = [v13 curationModel];
              unsigned int v15 = [v14 isUtilityWithAsset:v13];
              uint64_t v16 = [v3 userFeedbackCalculator];
              int v17 = [v14 isUtilityForMemoriesWithAsset:v13 userFeedbackCalculator:v16];

              uint64_t v18 = 4;
              if (!v17) {
                uint64_t v18 = 0;
              }
              if (v18 | v15)
              {
                uint64_t v19 = objc_msgSend(NSNumber, "numberWithInteger:");
                long long v20 = [v13 uuid];
                [v31 setObject:v19 forKeyedSubscript:v20];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v30 + 1;
      }
      while (v30 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v27);
  }

  return v31;
}

- (id)sharingSuggestionDebugInformationForSuggestion:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [(PGManager *)self photoLibrary];
  uint64_t v7 = [v6 librarySpecificFetchOptions];

  long long v53 = (void *)v7;
  id v8 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v4 options:v7];
  uint64_t v9 = [MEMORY[0x1E4F38EB8] fetchRepresentativeAssetsInAssetCollection:v4];
  long long v54 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v70 objects:v78 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v71 != v13) {
          objc_enumerationMutation(v10);
        }
        unsigned int v15 = [*(id *)(*((void *)&v70 + 1) + 8 * i) localIdentifier];
        [v54 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v70 objects:v78 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [MEMORY[0x1E4F391A0] fetchMomentsForAssetsWithLocalIdentifiers:v54 options:v53];
  int v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __67__PGManager_Debug__sharingSuggestionDebugInformationForSuggestion___block_invoke;
  v63[3] = &unk_1E68EBD30;
  id v18 = v16;
  id v64 = v18;
  id v19 = v17;
  id v65 = v19;
  id v51 = v4;
  id v66 = v51;
  id v52 = v5;
  id v67 = v52;
  id v49 = v10;
  id v68 = v49;
  id v48 = v8;
  id v69 = v48;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v63];
  long long v20 = objc_opt_new();
  [v20 setSharingStream:1];
  long long v46 = [(PGManager *)self workingContextForSuggestions];
  uint64_t v45 = [[PGSharingManager alloc] initWithWorkingContext:v46];
  long long v50 = v19;
  long long v47 = v20;
  id v21 = [(PGSharingManager *)v45 suggestionResultsForAssetLocalIdentifiers:0 momentLocalIdentifiers:v19 options:v20];
  id v22 = (void *)MEMORY[0x1E4F1CA60];
  id v76 = @"numberOfPeopleSuggestions";
  id v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
  id v77 = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  uint64_t v25 = [v22 dictionaryWithDictionary:v24];

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v26 = v21;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v59 objects:v75 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v60 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = *(void **)(*((void *)&v59 + 1) + 8 * j);
        long long v32 = [v31 sourceNames];
        long long v33 = [v31 person];
        long long v34 = [v33 keywordDescription];
        [v25 setObject:v32 forKeyedSubscript:v34];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v59 objects:v75 count:16];
    }
    while (v28);
  }

  [v52 setObject:v25 forKeyedSubscript:@"people"];
  long long v35 = objc_opt_new();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v36 = v18;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v55 objects:v74 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v38; ++k)
      {
        if (*(void *)v56 != v39) {
          objc_enumerationMutation(v36);
        }
        long long v41 = [(PGManager *)self keywordsForAssetCollection:*(void *)(*((void *)&v55 + 1) + 8 * k) relatedType:63];
        if (v41)
        {
          uint64_t v42 = [(id)objc_opt_class() exportableDictionaryFromKeywords:v41];
          [v35 addEntriesFromDictionary:v42];
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v55 objects:v74 count:16];
    }
    while (v38);
  }

  [v52 setObject:v35 forKeyedSubscript:@"content"];
  id v43 = v52;

  return v43;
}

void __67__PGManager_Debug__sharingSuggestionDebugInformationForSuggestion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v45 = a2;
  uint64_t v63 = 0;
  id v64 = (double *)&v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 0;
  uint64_t v59 = 0;
  long long v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  uint64_t v55 = 0;
  long long v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  id v3 = objc_alloc_init(PGNeighborScoreComputer);
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v51 objects:v69 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v52 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        id v10 = *(void **)(a1 + 40);
        uint64_t v11 = [v9 localIdentifier];
        [v10 addObject:v11];

        uint64_t v12 = [v9 uuid];
        [v4 addObject:v12];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v51 objects:v69 count:16];
    }
    while (v6);
  }

  uint64_t v13 = [v45 graph];
  uint64_t v44 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:v4 inGraph:v13];

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __67__PGManager_Debug__sharingSuggestionDebugInformationForSuggestion___block_invoke_2;
  void v46[3] = &unk_1E68EBD08;
  uint64_t v30 = v3;
  long long v47 = v30;
  id v48 = &v63;
  id v49 = &v59;
  long long v50 = &v55;
  [v44 enumerateNodesUsingBlock:v46];
  uint64_t v14 = [*(id *)(a1 + 48) featuresProperties];
  id v31 = [v14 objectForKeyedSubscript:@"deviceInformation"];

  v67[0] = @"title";
  id v43 = [*(id *)(a1 + 48) localizedTitle];
  unsigned int v15 = v43;
  if (!v43) {
    unsigned int v15 = &stru_1F283BC78;
  }
  v68[0] = v15;
  v67[1] = @"subtitle";
  uint64_t v42 = [*(id *)(a1 + 48) localizedSubtitle];
  uint64_t v16 = v42;
  if (!v42) {
    uint64_t v16 = &stru_1F283BC78;
  }
  v68[1] = v16;
  void v67[2] = @"creationDate";
  long long v41 = [*(id *)(a1 + 48) creationDate];
  int v17 = v41;
  if (!v41) {
    int v17 = &stru_1F283BC78;
  }
  v68[2] = v17;
  v67[3] = @"activationDate";
  long long v40 = [*(id *)(a1 + 48) activationDate];
  id v18 = v40;
  if (!v40) {
    id v18 = &stru_1F283BC78;
  }
  v68[3] = v18;
  v67[4] = @"relevantUntilDate";
  uint64_t v39 = [*(id *)(a1 + 48) relevantUntilDate];
  id v19 = v39;
  if (!v39) {
    id v19 = &stru_1F283BC78;
  }
  void v68[4] = v19;
  v67[5] = @"expungeDate";
  uint64_t v38 = [*(id *)(a1 + 48) expungeDate];
  long long v20 = v38;
  if (!v38) {
    long long v20 = &stru_1F283BC78;
  }
  v68[5] = v20;
  v67[6] = @"type";
  [*(id *)(a1 + 48) type];
  uint64_t v37 = PHSuggestionStringWithType();
  v68[6] = v37;
  v67[7] = @"subtype";
  [*(id *)(a1 + 48) subtype];
  id v36 = PHSuggestionStringWithSubtype();
  v68[7] = v36;
  v67[8] = @"state";
  long long v35 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 48), "state"));
  v68[8] = v35;
  v67[9] = @"notificationState";
  [*(id *)(a1 + 48) notificationState];
  long long v34 = PHSuggestionNotificationStateStringWithNotificationState();
  v68[9] = v34;
  v67[10] = @"version";
  long long v33 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "version"));
  v68[10] = v33;
  v67[11] = @"neighborScore";
  long long v32 = [NSNumber numberWithDouble:v64[3]];
  v68[11] = v32;
  v67[12] = @"neighborScoreInteresting";
  id v21 = [NSNumber numberWithInt:v64[3] > 0.43];
  v68[12] = v21;
  v67[13] = @"neighborScoreHighlyInteresting";
  id v22 = [NSNumber numberWithInt:v64[3] > 0.6];
  v68[13] = v22;
  v67[14] = @"isInteresting";
  id v23 = [NSNumber numberWithBool:*((unsigned __int8 *)v60 + 24)];
  v68[14] = v23;
  v67[15] = @"isSmartInteresting";
  uint64_t v24 = [NSNumber numberWithBool:*((unsigned __int8 *)v56 + 24)];
  v68[15] = v24;
  v67[16] = @"representativeAssetsCount";
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 64), "count"));
  v68[16] = v25;
  v67[17] = @"keyAssetsCount";
  id v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 72), "count"));
  v68[17] = v26;
  v67[18] = @"numberOfMoments";
  uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v68[18] = v27;
  v68[19] = &unk_1F28D25E0;
  v67[19] = @"graphSchemaVersion";
  v67[20] = @"curationAlgorithmsVersion";
  v68[20] = &unk_1F28D25F8;
  v68[21] = &unk_1F28D2490;
  v67[21] = @"relatedAlgorithmsVersion";
  v67[22] = @"memoriesAlgorithmsVersion";
  v67[23] = @"deviceInfo";
  uint64_t v28 = v31;
  if (!v31) {
    uint64_t v28 = &stru_1F283BC78;
  }
  v68[22] = &unk_1F28D2610;
  v68[23] = v28;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:24];
  [*(id *)(a1 + 56) setObject:v29 forKeyedSubscript:@"info"];

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
}

void __67__PGManager_Debug__sharingSuggestionDebugInformationForSuggestion___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  [v3 neighborScoreWithMomentNode:v4];
  uint64_t v6 = *(void *)(a1[5] + 8);
  if (v5 > *(double *)(v6 + 24)) {
    *(double *)(v6 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v5;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) |= [v4 isInteresting];
  char v7 = [v4 isSmartInteresting];

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) |= v7;
}

- (id)_debugInformationForRelated:(id)a3 referenceKeywords:(id)a4 andRelatedMoment:(id)a5 relatedType:(unint64_t)a6 curationContext:(id)a7
{
  id v12 = a3;
  id v42 = a7;
  id v13 = a5;
  id v14 = a4;
  uint64_t v44 = [(PGManager *)self keywordsForAssetCollection:v13 relatedType:a6];
  if (!v44)
  {
    unsigned int v15 = [v12 keywords];
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:256];
    int v17 = [v15 objectForKeyedSubscript:v16];
    id v18 = [v17 firstObject];
    uint64_t v44 = [(PGManager *)self keywordsForMomentNodeName:v18 relatedType:a6];
  }
  id v19 = [(PGManager *)self curationManager];
  long long v20 = [MEMORY[0x1E4F1CA60] dictionary];
  id v21 = NSNumber;
  [v12 score];
  id v22 = objc_msgSend(v21, "numberWithDouble:");
  [v20 setObject:v22 forKeyedSubscript:@"relatedScore"];

  id v23 = NSNumber;
  [v12 matchingScore];
  uint64_t v24 = objc_msgSend(v23, "numberWithDouble:");
  [v20 setObject:v24 forKeyedSubscript:@"matchingScore"];

  uint64_t v25 = [NSNumber numberWithUnsignedInteger:a6];
  [v20 setObject:v25 forKeyedSubscript:@"relatedType"];

  id v26 = [v12 debugDescription];
  [v20 setObject:v26 forKeyedSubscript:@"debugDescription"];

  uint64_t v27 = [v12 keywords];
  uint64_t v28 = +[PGManager exportableDictionaryFromKeywords:v27];
  [v20 setObject:v28 forKeyedSubscript:@"matchingKeywords"];

  uint64_t v29 = +[PGGraph matchingWeightToDictionary];
  [v20 setObject:v29 forKeyedSubscript:@"matchingWeight"];

  uint64_t v30 = +[PGManager exportableDictionaryFromKeywords:v14];

  [v20 setObject:v30 forKeyedSubscript:@"referenceKeywords"];
  id v31 = +[PGManager exportableDictionaryFromKeywords:v44];
  [v20 setObject:v31 forKeyedSubscript:@"relatedKeywords"];

  long long v32 = NSNumber;
  [v19 contentScoreForAssetCollection:v13 curationContext:v43];
  long long v33 = objc_msgSend(v32, "numberWithDouble:");
  [v20 setObject:v33 forKeyedSubscript:@"curationScore"];

  long long v34 = NSNumber;
  [(PGManager *)self neighborScoreForMoment:v13];
  long long v35 = objc_msgSend(v34, "numberWithDouble:");
  [v20 setObject:v35 forKeyedSubscript:@"neighborScore"];

  id v36 = NSNumber;
  [(PGManager *)self graphScoreForMoment:v13];
  uint64_t v37 = objc_msgSend(v36, "numberWithDouble:");
  [v20 setObject:v37 forKeyedSubscript:@"graphScore"];

  uint64_t v38 = NSNumber;
  uint64_t v39 = [v19 isAssetCollectionInteresting:v13 curationContext:v43];

  long long v40 = [v38 numberWithBool:v39];
  [v20 setObject:v40 forKeyedSubscript:@"isInteresting"];

  return v20;
}

- (id)relatedDebugInformationBetweenReferenceAssetCollection:(id)a3 andRelatedAssetCollection:(id)a4 relatedType:(unint64_t)a5 curationContext:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = [(PGManager *)self workingContextForRelated];
  id v14 = [PGRelatedComputer alloc];
  unsigned int v15 = [(PGManager *)self blockedFeatures];
  uint64_t v16 = [(PGRelatedComputer *)v14 initWithWorkingContext:v13 blockedFeatures:v15];

  int v17 = [(PGRelatedComputer *)v16 relatedCollectionBetweenAssetCollection:v12 andAssetCollection:v10 relatedType:a5 curationContext:v11 needsDebugInfo:1];
  id v18 = [(PGManager *)self keywordsForAssetCollection:v12 relatedType:a5];

  if (!v18)
  {
    uint64_t v24 = [v17 keywords];
    id v19 = [NSNumber numberWithUnsignedInteger:512];
    long long v20 = [v24 objectForKeyedSubscript:v19];
    [v20 firstObject];
    id v21 = v25 = v13;
    id v18 = [(PGManager *)self keywordsForMomentNodeName:v21 relatedType:a5];

    id v13 = v25;
  }
  id v22 = [(PGManager *)self _debugInformationForRelated:v17 referenceKeywords:v18 andRelatedMoment:v10 relatedType:a5 curationContext:v11];

  return v22;
}

- (id)relatedDebugInformationBetweenAsset:(id)a3 andRelatedAssetCollection:(id)a4 relatedType:(unint64_t)a5 curationContext:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PGManager *)self workingContextForRelated];
  id v14 = [PGRelatedComputer alloc];
  unsigned int v15 = [(PGManager *)self blockedFeatures];
  uint64_t v16 = [(PGRelatedComputer *)v14 initWithWorkingContext:v13 blockedFeatures:v15];

  int v17 = [(PGRelatedComputer *)v16 relatedCollectionBetweenAsset:v12 andAssetCollection:v11 relatedType:a5 needsDebugInfo:1];
  id v18 = [(PGManager *)self keywordsForAsset:v12 relatedType:a5];

  id v19 = [(PGManager *)self _debugInformationForRelated:v17 referenceKeywords:v18 andRelatedMoment:v11 relatedType:a5 curationContext:v10];

  return v19;
}

- (id)_domainLabelCountStatisticsWithGraph:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28E78] stringWithString:@"\nCounts by domain and label:\nnodes:"];
  double v5 = [v3 nodesDomains];
  uint64_t v6 = [v3 nodesLabels];
  char v7 = [v6 allObjects];
  id v8 = (void *)[v7 mutableCopy];

  [v8 sortUsingComparator:&__block_literal_global_1451];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __57__PGManager_Debug___domainLabelCountStatisticsWithGraph___block_invoke_2;
  v49[3] = &unk_1E68EFDD8;
  id v9 = v3;
  id v50 = v9;
  id v10 = v4;
  id v51 = v10;
  uint64_t v37 = v5;
  [v5 enumerateIndexesUsingBlock:v49];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v46;
    uint64_t v15 = (unsigned __int16)*MEMORY[0x1E4F71F38];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v18 = [v9 nodesCountForLabel:v17 domain:v15];
        if (v18) {
          [v10 appendFormat:@"\nlabel %@ %lu", v17, v18];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v13);
  }

  [v10 appendString:@"\nedges:"];
  id v19 = [v9 edgesDomains];
  long long v20 = [v9 edgesLabels];
  id v21 = [v20 allObjects];
  id v22 = (void *)[v21 mutableCopy];

  [v22 sortUsingComparator:&__block_literal_global_1462];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __57__PGManager_Debug___domainLabelCountStatisticsWithGraph___block_invoke_4;
  void v42[3] = &unk_1E68EFDD8;
  id v23 = v9;
  id v43 = v23;
  id v24 = v10;
  id v44 = v24;
  id v36 = v19;
  [v19 enumerateIndexesUsingBlock:v42];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v25 = v22;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v39;
    uint64_t v29 = (unsigned __int16)*MEMORY[0x1E4F71F38];
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v31 = *(void *)(*((void *)&v38 + 1) + 8 * j);
        uint64_t v32 = [v23 edgesCountForLabel:v31 domain:v29];
        if (v32) {
          [v24 appendFormat:@"\nlabel %@ %lu", v31, v32];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v27);
  }

  long long v33 = v44;
  id v34 = v24;

  return v34;
}

uint64_t __57__PGManager_Debug___domainLabelCountStatisticsWithGraph___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) nodesCountForDomain:(unsigned __int16)a2];
  if (result) {
    return objc_msgSend(*(id *)(a1 + 40), "appendFormat:", @"\ndomain %lu %lu", a2, result);
  }
  return result;
}

uint64_t __57__PGManager_Debug___domainLabelCountStatisticsWithGraph___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) edgesCountForLabel:0 domain:(unsigned __int16)a2];
  if (result) {
    return objc_msgSend(*(id *)(a1 + 40), "appendFormat:", @"\ndomain %lu %lu", a2, result);
  }
  return result;
}

uint64_t __57__PGManager_Debug___domainLabelCountStatisticsWithGraph___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __57__PGManager_Debug___domainLabelCountStatisticsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)_mobilityStatisticsWithGraph:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 momentNodesSortedByDate];
  id v4 = [MEMORY[0x1E4F28E78] stringWithFormat:@"\nLocation Mobility:"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unint64_t v11 = [v10 locationMobilityType];
        if (v11)
        {
          if (v11 > 4) {
            uint64_t v12 = 0;
          }
          else {
            uint64_t v12 = off_1E68E4F68[v11];
          }
          uint64_t v13 = v12;
          uint64_t v14 = [v10 name];
          [v4 appendFormat:@"\n\tMoment \"%@\", mobility %@", v14, v13, (void)v16];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_titleStatisticsWithGraph:(id)a3 titleGenerationContext:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v53 = v6;
  uint64_t v8 = [v6 momentNodesSortedByDate];
  id v50 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v9 = [v8 count];
  id v49 = self;
  id v51 = [(PGManager *)self photoLibrary];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
  long long v52 = v7;
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v48 = v9;
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    id v57 = *(id *)v64;
    float v14 = 0.0;
    do
    {
      uint64_t v15 = 0;
      uint64_t v54 = v11;
      do
      {
        if (*(id *)v64 != v57) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v63 + 1) + 8 * v15);
        long long v17 = [[PGTitleGenerator alloc] initWithMomentNode:v16 type:0 titleGenerationContext:v7];
        long long v18 = [(PGTitleGenerator *)v17 title];
        long long v19 = [v18 stringValue];

        long long v20 = [(PGTitleGenerator *)v17 subtitle];
        uint64_t v21 = [v20 stringValue];

        unint64_t v22 = [(__CFString *)v19 length];
        if ((unint64_t)[(__CFString *)v19 length] > 0x18) {
          ++v13;
        }
        if ([v16 isInteresting])
        {
          uint64_t v56 = v12 + 1;
          id v23 = [v53 momentForMomentNode:v16 inPhotoLibrary:v51];
          id v24 = [(PGManager *)v49 _dateFormatter];
          id v25 = [v23 startDate];
          uint64_t v26 = [v24 stringFromDate:v25];

          uint64_t v27 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v28 = [v23 localizedTitle];
          uint64_t v29 = (void *)v28;
          if (v28) {
            uint64_t v30 = (__CFString *)v28;
          }
          else {
            uint64_t v30 = @"N/A";
          }
          [v27 setObject:v30 forKeyedSubscript:@"assetCollectionTitle"];

          uint64_t v11 = v54;
          if (v26) {
            uint64_t v31 = v26;
          }
          else {
            uint64_t v31 = @"N/A";
          }
          [v27 setObject:v31 forKeyedSubscript:@"assetCollectionStartDate"];
          if (v19) {
            uint64_t v32 = v19;
          }
          else {
            uint64_t v32 = &stru_1F283BC78;
          }
          [v27 setObject:v32 forKeyedSubscript:@"graphMomentTitle"];
          if (v21) {
            long long v33 = v21;
          }
          else {
            long long v33 = &stru_1F283BC78;
          }
          [v27 setObject:v33 forKeyedSubscript:@"graphMomentSubtitle"];
          [v50 addObject:v27];

          uint64_t v12 = v56;
          id v7 = v52;
        }
        float v14 = v14 + (float)v22;

        ++v15;
      }
      while (v11 != v15);
      uint64_t v11 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v11);
    float v34 = (float)v13;
    unint64_t v9 = v48;
  }
  else
  {
    uint64_t v12 = 0;
    float v14 = 0.0;
    float v34 = 0.0;
  }

  if (v9)
  {
    float v14 = v14 / (float)v9;
    double v35 = (float)((float)(1.0 - (float)(v34 / (float)v9)) * 100.0);
  }
  else
  {
    double v35 = 0.0;
  }
  id v36 = [MEMORY[0x1E4F28E78] stringWithFormat:@"\n\nInteresting Moment Titles (%lu):\nAverage #characters: %f, %.f%% <= %lu characters\n", v12, v14, *(void *)&v35, 24];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v58 = v50;
  uint64_t v37 = [v58 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v60 != v39) {
          objc_enumerationMutation(v58);
        }
        long long v41 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        id v42 = [v41 objectForKeyedSubscript:@"assetCollectionTitle"];
        id v43 = [v41 objectForKeyedSubscript:@"graphMomentTitle"];
        id v44 = [v41 objectForKeyedSubscript:@"graphMomentSubtitle"];
        uint64_t v45 = [v42 length];
        long long v46 = [v41 objectForKeyedSubscript:@"assetCollectionStartDate"];
        [v36 appendFormat:@"\n\tMoment: \"%@\" (#%lu, %@)\n\t\ttitle: \"%@\" (#%lu)\n\t\tsubtitle: \"%@\" (#%lu)\n", v42, v45, v46, v43, objc_msgSend(v43, "length"), v44, objc_msgSend(v44, "length")];
      }
      uint64_t v38 = [v58 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v38);
  }

  return v36;
}

- (id)_highlightTitleStatisticsWithGraph:(id)a3 titleGenerationContext:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v42 = a4;
  uint64_t v39 = v5;
  id v6 = [v5 dayHighlightNodesSortedByDate];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v7 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  uint64_t v8 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  [v7 setTimeZone:v8];

  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"\n\nHighlight Titles (%lu):", objc_msgSend(v6, "count"));
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(obj);
        }
        unint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        float v14 = [[PGHighlightTitleGenerator alloc] initWithCollection:v13 curatedAssetCollection:0 keyAsset:0 createVerboseTitle:0 titleGenerationContext:v42];
        uint64_t v15 = [(PGHighlightTitleGenerator *)v14 titleTuple];
        long long v16 = [v15 title];
        long long v17 = [v16 stringValue];

        long long v18 = [v13 localStartDate];
        long long v19 = [v7 stringFromDate:v18];

        long long v20 = [v13 localEndDate];
        uint64_t v21 = [v7 stringFromDate:v20];

        unint64_t v22 = [NSString stringWithFormat:@"\n\t highlight:\t[%@ - %@]", v19, v21];
        [v43 appendFormat:@"%@ \ttitle:\t\"%@\"", v22, v17];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v10);
  }

  id v23 = [v39 highlightGroupNodesSortedByDate];
  objc_msgSend(v43, "appendFormat:", @"\n\nHighlight Group Titles (%lu):", objc_msgSend(v23, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v40 = v23;
  uint64_t v24 = [v40 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v45 != v26) {
          objc_enumerationMutation(v40);
        }
        uint64_t v28 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        uint64_t v29 = [[PGHighlightTitleGenerator alloc] initWithCollection:v28 curatedAssetCollection:0 keyAsset:0 createVerboseTitle:0 titleGenerationContext:v42];
        uint64_t v30 = [(PGHighlightTitleGenerator *)v29 titleTuple];
        uint64_t v31 = [v30 title];
        uint64_t v32 = [v31 stringValue];

        long long v33 = [v28 localStartDate];
        float v34 = [v7 stringFromDate:v33];

        double v35 = [v28 localEndDate];
        id v36 = [v7 stringFromDate:v35];

        uint64_t v37 = [NSString stringWithFormat:@"\n\t highlight:\t[%@ - %@]", v34, v36];
        [v43 appendFormat:@"%@ \ttitle:\t\"%@\"", v37, v32];
      }
      uint64_t v25 = [v40 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v25);
  }

  return v43;
}

- (id)_stringDescriptionForPublicEventsWithGraph:(id)a3 verbose:(BOOL)a4
{
  BOOL v106 = a4;
  v146[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v5 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  id v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  id v107 = v5;
  [v5 setTimeZone:v6];

  uint64_t v83 = v4;
  id v7 = [v4 nodesForLabel:@"PublicEvent" domain:900];
  uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
  v146[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v146 count:1];
  double v82 = v7;
  uint64_t v10 = [v7 sortedArrayUsingDescriptors:v9];

  int v105 = [MEMORY[0x1E4F1CA80] set];
  id v111 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v89 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  obuint64_t j = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v132 objects:v145 count:16];
  uint64_t v12 = &selRef_isGreat;
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v112 = *(void *)v133;
    do
    {
      uint64_t v14 = 0;
      uint64_t v15 = v12[310];
      do
      {
        if (*(void *)v133 != v112) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v132 + 1) + 8 * v14);
        long long v17 = [v16 categories];
        long long v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 selector:v15];
        v144 = v18;
        long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v144 count:1];
        long long v20 = [v17 sortedArrayUsingDescriptors:v19];

        if ([v20 count])
        {
          uint64_t v21 = [v20 firstObject];
        }
        else
        {
          uint64_t v21 = @"No category";
        }
        unint64_t v22 = v15;
        id v23 = [v89 objectForKeyedSubscript:v21];
        if (!v23)
        {
          id v23 = [MEMORY[0x1E4F1CA60] dictionary];
          [v89 setObject:v23 forKeyedSubscript:v21];
        }
        uint64_t v24 = [v16 businessNode];
        uint64_t v25 = [v24 name];
        uint64_t v26 = (void *)v25;
        uint64_t v27 = @"No business";
        if (v25) {
          uint64_t v27 = (__CFString *)v25;
        }
        uint64_t v28 = v27;

        uint64_t v29 = [v23 objectForKeyedSubscript:v28];
        if (!v29)
        {
          uint64_t v29 = [MEMORY[0x1E4F1CA80] set];
          [v23 setObject:v29 forKeyedSubscript:v28];
        }
        [v29 addObject:v16];

        ++v14;
        uint64_t v15 = v22;
      }
      while (v13 != v14);
      uint64_t v13 = [obj countByEnumeratingWithState:&v132 objects:v145 count:16];
      uint64_t v12 = &selRef_isGreat;
    }
    while (v13);
  }
  else
  {
    uint64_t v15 = sel_localizedCompare_;
  }

  uint64_t v30 = [v89 allKeys];
  uint64_t v31 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 selector:v15];
  long long v143 = v31;
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v143 count:1];
  long long v33 = [v30 sortedArrayUsingDescriptors:v32];

  float v34 = [(PGManager *)self publicEventManager];
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id v84 = v33;
  uint64_t v87 = [v84 countByEnumeratingWithState:&v128 objects:v142 count:16];
  if (v87)
  {
    uint64_t v86 = *(void *)v129;
    uint64_t v98 = v34;
    char v99 = v15;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v129 != v86) {
          objc_enumerationMutation(v84);
        }
        uint64_t v88 = v35;
        id v36 = *(void **)(*((void *)&v128 + 1) + 8 * v35);
        uint64_t v37 = [v36 stringByReplacingOccurrencesOfString:@"GEOSpatialEventLookupCategory" withString:&stru_1F283BC78];
        [v111 appendFormat:@"[%@]\n", v37];

        long long v92 = [v89 objectForKeyedSubscript:v36];
        uint64_t v38 = [v92 allKeys];
        uint64_t v39 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 selector:v15];
        v141 = v39;
        id v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v141 count:1];
        long long v41 = [v38 sortedArrayUsingDescriptors:v40];

        long long v126 = 0u;
        long long v127 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        id v90 = v41;
        uint64_t v93 = [v90 countByEnumeratingWithState:&v124 objects:v140 count:16];
        if (v93)
        {
          uint64_t v91 = *(void *)v125;
          do
          {
            uint64_t v42 = 0;
            do
            {
              if (*(void *)v125 != v91) {
                objc_enumerationMutation(v90);
              }
              uint64_t v95 = v42;
              uint64_t v43 = *(void *)(*((void *)&v124 + 1) + 8 * v42);
              [v111 appendFormat:@"\t%@\n", v43];
              long long v44 = [v92 objectForKeyedSubscript:v43];
              long long v45 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
              v139 = v45;
              long long v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v139 count:1];
              uint64_t v94 = v44;
              long long v47 = [v44 sortedArrayUsingDescriptors:v46];

              long long v122 = 0u;
              long long v123 = 0u;
              long long v120 = 0u;
              long long v121 = 0u;
              id v100 = v47;
              uint64_t v110 = [v100 countByEnumeratingWithState:&v120 objects:v138 count:16];
              if (v110)
              {
                uint64_t v108 = *(void *)v121;
                do
                {
                  for (uint64_t i = 0; i != v110; ++i)
                  {
                    if (*(void *)v121 != v108) {
                      objc_enumerationMutation(v100);
                    }
                    long long v49 = *(void **)(*((void *)&v120 + 1) + 8 * i);
                    long long v50 = objc_msgSend(v34, "cachedPublicEventsForMuid:", objc_msgSend(v49, "muid"));
                    if (![v50 count])
                    {
                      uint64_t v51 = [v49 muid];
                      long long v52 = [v49 keywordDescription];
                      [v111 appendFormat:@"\t\t! Cannot find event %lu in cache: %@\n", v51, v52];
                    }
                    long long v53 = [MEMORY[0x1E4F1CA80] set];
                    uint64_t v54 = [MEMORY[0x1E4F1CA48] array];
                    uint64_t v55 = [v49 collection];
                    uint64_t v56 = [v55 momentNodes];
                    v114[0] = MEMORY[0x1E4F143A8];
                    v114[1] = 3221225472;
                    v114[2] = __71__PGManager_Debug___stringDescriptionForPublicEventsWithGraph_verbose___block_invoke;
                    v114[3] = &unk_1E68EB890;
                    id v115 = v105;
                    id v116 = v107;
                    id v57 = v54;
                    id v117 = v57;
                    id v113 = v50;
                    id v118 = v113;
                    id v58 = v53;
                    id v119 = v58;
                    [v56 enumerateNodesUsingBlock:v114];

                    [v57 sortUsingSelector:v15];
                    uint64_t v59 = [v57 componentsJoinedByString:@", "];
                    long long v60 = (void *)v59;
                    if (v106)
                    {
                      v103 = (void *)v59;
                      long long v61 = [v49 localizedCategories];
                      [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 selector:v15];
                      v63 = long long v62 = v58;
                      uint64_t v137 = v63;
                      long long v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v137 count:1];
                      long long v65 = [v61 sortedArrayUsingDescriptors:v64];

                      long long v66 = [v49 performers];
                      id v67 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 selector:v15];
                      v136 = v67;
                      id v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v136 count:1];
                      uint64_t v69 = [v66 sortedArrayUsingDescriptors:v68];

                      uint64_t v70 = [v65 componentsJoinedByString:@", "];
                      id v102 = v69;
                      long long v71 = [v69 componentsJoinedByString:@", "];
                      v104 = v62;
                      long long v72 = [v62 allObjects];
                      long long v73 = [v72 componentsJoinedByString:&stru_1F283BC78];

                      uint64_t v74 = [v49 expectedAttendance];
                      uint64_t v75 = v74;
                      char v101 = (void *)v70;
                      id v76 = @"N/A";
                      if (v74 && v74 != 0x7FFFFFFFFFFFFFFFLL)
                      {
                        uint64_t v97 = [NSNumber numberWithInteger:v74];
                        uint64_t v96 = [v97 stringValue];
                        id v76 = v96;
                      }
                      id v77 = v76;
                      id v78 = v98;
                      if (v75 && v75 != 0x7FFFFFFFFFFFFFFFLL)
                      {
                      }
                      uint64_t v79 = [v49 name];
                      [v111 appendFormat:@"\t\t%@ %@\n\t\t\tattendance %@,\n\t\t\tcategories: %@,\n\t\t\tperformers: %@ -> %@ \n", v79, v73, v77, v101, v71, v103];

                      long long v60 = v103;
                      uint64_t v15 = v99;
                      id v58 = v104;
                    }
                    else
                    {
                      id v78 = v34;
                      long long v65 = [v49 name];
                      [v111 appendFormat:@"\t\t%@ -> %@ \n", v65, v60];
                    }

                    float v34 = v78;
                  }
                  uint64_t v110 = [v100 countByEnumeratingWithState:&v120 objects:v138 count:16];
                }
                while (v110);
              }

              uint64_t v42 = v95 + 1;
            }
            while (v95 + 1 != v93);
            uint64_t v93 = [v90 countByEnumeratingWithState:&v124 objects:v140 count:16];
          }
          while (v93);
        }

        uint64_t v35 = v88 + 1;
      }
      while (v88 + 1 != v87);
      uint64_t v87 = [v84 countByEnumeratingWithState:&v128 objects:v142 count:16];
    }
    while (v87);
  }

  uint64_t v80 = [NSString stringWithFormat:@"\nPublic Events: %lu, Moments %lu\n%@", objc_msgSend(v82, "count"), objc_msgSend(v105, "count"), v111];

  return v80;
}

void __71__PGManager_Debug___stringDescriptionForPublicEventsWithGraph_verbose___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) addObject:v3];
  id v4 = *(void **)(a1 + 40);
  id v5 = [v3 localStartDate];
  uint64_t v6 = [v4 stringFromDate:v5];

  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v3 localEndDate];
  uint64_t v9 = [v7 stringFromDate:v8];

  uint64_t v10 = *(void **)(a1 + 48);
  uint64_t v29 = (void *)v9;
  uint64_t v30 = (void *)v6;
  uint64_t v11 = [NSString stringWithFormat:@"\n\t\t\tmoment: [%@ - %@]", v6, v9];
  [v10 addObject:v11];

  uint64_t v12 = [v3 universalStartDate];
  uint64_t v31 = v3;
  uint64_t v27 = [v3 universalEndDate];
  uint64_t v28 = (void *)v12;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v12 endDate:v27];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v14 = *(id *)(a1 + 56);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = [*(id *)(*((void *)&v32 + 1) + 8 * v18) universalDateIntervalIncludingTime];
        if ([v13 intersectsDateInterval:v19])
        {
          long long v20 = *(void **)(a1 + 40);
          uint64_t v21 = [v19 startDate];
          unint64_t v22 = [v20 stringFromDate:v21];

          id v23 = *(void **)(a1 + 40);
          uint64_t v24 = [v19 endDate];
          uint64_t v25 = [v23 stringFromDate:v24];

          uint64_t v26 = [NSString stringWithFormat:@"[%@ - %@]", v22, v25];
          [*(id *)(a1 + 64) addObject:v26];
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v16);
  }
}

- (id)_poiStatisticsWithGraph:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  [v4 setTimeZone:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v21 = 0;
  unint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  id v7 = [v3 poiNodes];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __44__PGManager_Debug___poiStatisticsWithGraph___block_invoke;
  uint64_t v17 = &unk_1E68EBCC0;
  long long v20 = &v21;
  id v8 = v6;
  id v18 = v8;
  id v9 = v4;
  id v19 = v9;
  [v7 enumerateNodesUsingBlock:&v14];
  uint64_t v10 = NSString;
  uint64_t v11 = [v7 count];
  uint64_t v12 = [v10 stringWithFormat:@"\nPOI: %lu, Moments: %lu\n%@", v11, v22[3], v8, v14, v15, v16, v17];

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __44__PGManager_Debug___poiStatisticsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 collection];
  id v5 = [v4 momentNodes];

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v5 count];
  id v6 = [v3 label];

  [*(id *)(a1 + 32) appendFormat:@"\n%@: %lu\n", v6, objc_msgSend(v5, "count")];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PGManager_Debug___poiStatisticsWithGraph___block_invoke_2;
  v7[3] = &unk_1E68F0768;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  [v5 enumerateNodesUsingBlock:v7];
}

void __44__PGManager_Debug___poiStatisticsWithGraph___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 localStartDate];
  id v9 = [v3 stringFromDate:v5];

  id v6 = *(void **)(a1 + 32);
  id v7 = [v4 localEndDate];

  id v8 = [v6 stringFromDate:v7];

  [*(id *)(a1 + 40) appendFormat:@"\tmoment:\t[%@ - %@]\n", v9, v8];
}

- (id)_stringDescriptionForBusinessItemsWithGraph:(id)a3 includingInferredThroughPublicEvents:(BOOL)a4 verbose:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v52[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v8 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  id v9 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  [v8 setTimeZone:v9];

  uint64_t v38 = v7;
  uint64_t v10 = [v7 businessNodes];
  uint64_t v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
  v52[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  v52[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  uint64_t v37 = v10;
  uint64_t v14 = [v10 sortedArrayUsingDescriptors:v13];

  uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
  id v16 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v17 = v14;
  id v18 = v8;
  obuint64_t j = v17;
  uint64_t v41 = [v17 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v41)
  {
    uint64_t v19 = *(void *)v48;
    uint64_t v39 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (!v6)
        {
          unint64_t v22 = [*(id *)(*((void *)&v47 + 1) + 8 * i) publicEventNodes];
          uint64_t v23 = [v22 count];

          if (v23) {
            continue;
          }
        }
        uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __109__PGManager_Debug___stringDescriptionForBusinessItemsWithGraph_includingInferredThroughPublicEvents_verbose___block_invoke;
        void v42[3] = &unk_1E68EBC98;
        id v43 = v15;
        id v44 = v18;
        BOOL v46 = v5;
        id v25 = v24;
        id v45 = v25;
        [v21 enumerateMomentEdgesAndNodesUsingBlock:v42];
        [v25 sortUsingSelector:sel_localizedCompare_];
        uint64_t v26 = [v21 keywordDescription];
        if (v5)
        {
          uint64_t v27 = [v21 UUID];
          [v26 stringByAppendingFormat:@" [muid:%@]", v27];
          id v28 = v16;
          uint64_t v29 = v15;
          BOOL v30 = v5;
          BOOL v31 = v6;
          uint64_t v33 = v32 = v18;

          uint64_t v26 = (void *)v33;
          id v18 = v32;
          BOOL v6 = v31;
          BOOL v5 = v30;
          uint64_t v15 = v29;
          id v16 = v28;
          uint64_t v19 = v39;
        }
        long long v34 = [v25 componentsJoinedByString:@","];
        [v16 appendFormat:@"\t%@ -> %@ \n", v26, v34];
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v41);
  }

  long long v35 = [NSString stringWithFormat:@"\nBusiness Items: %lu, Moments: %lu\n%@", objc_msgSend(v37, "count"), objc_msgSend(v15, "count"), v16];

  return v35;
}

void __109__PGManager_Debug___stringDescriptionForBusinessItemsWithGraph_includingInferredThroughPublicEvents_verbose___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v32 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) addObject:v5];
  BOOL v6 = *(void **)(a1 + 40);
  id v7 = [v5 localStartDate];
  id v8 = [v6 stringFromDate:v7];

  id v9 = *(void **)(a1 + 40);
  uint64_t v10 = [v5 localEndDate];
  uint64_t v11 = [v9 stringFromDate:v10];

  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v12 = [v32 universalStartDate];
    BOOL v31 = (void *)v12;
    if (v12)
    {
      uint64_t v13 = [*(id *)(a1 + 40) stringFromDate:v12];
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v15 = [v32 universalEndDate];
    if (v15)
    {
      id v16 = [*(id *)(a1 + 40) stringFromDate:v15];
    }
    else
    {
      id v16 = 0;
    }
    int v17 = [v32 hasRoutineInfo];
    id v18 = @"location cluster";
    if (v17) {
      id v18 = @"routine";
    }
    uint64_t v19 = v18;
    BOOL v30 = (void *)v13;
    uint64_t v29 = v8;
    if (v13)
    {
      long long v20 = [NSString stringWithFormat:@"%@ - %@", v13, v16];
    }
    else
    {
      long long v20 = @"N/A";
    }
    uint64_t v21 = *(void **)(a1 + 40);
    unint64_t v22 = [v5 universalStartDate];
    uint64_t v23 = [v21 stringFromDate:v22];

    uint64_t v24 = *(void **)(a1 + 40);
    id v25 = [v5 universalEndDate];
    uint64_t v26 = [v24 stringFromDate:v25];

    uint64_t v27 = NSString;
    [v32 confidence];
    uint64_t v14 = [v27 stringWithFormat:@"\n\t\tmoment:\t[%@ - %@],\n\t\t\tconfidence %.2f,\n\t\t\tmoment (utc): [%@ - %@],\n\t\t\t%@ visit (utc): [%@]", v29, v11, v28, v23, v26, v19, v20];

    id v8 = v29;
  }
  else
  {
    uint64_t v14 = [NSString stringWithFormat:@"\n\t\tmoment:\t[%@ - %@]", v8, v11];
  }
  [*(id *)(a1 + 48) addObject:v14];
}

- (id)_stringDescriptionForLanguagesWithGraph:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 inferredUserLocales];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) localeIdentifier];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v11 = NSString;
  uint64_t v12 = [v4 componentsJoinedByString:@", "];
  uint64_t v13 = [v11 stringWithFormat:@"\nUser Languages: %@", v12];

  return v13;
}

- (id)_stringDescriptionForLocationsWithGraph:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __60__PGManager_Debug___stringDescriptionForLocationsWithGraph___block_invoke;
  v26[3] = &unk_1E68EBC70;
  id v5 = v4;
  id v27 = v5;
  uint64_t v19 = v3;
  [v3 enumerateNodesWithLabel:@"City" domain:200 usingBlock:v26];
  uint64_t v6 = [v5 allKeys];
  uint64_t v7 = [v6 sortedArrayUsingSelector:sel_compare_];

  uint64_t v8 = [MEMORY[0x1E4F28E78] string];
  uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
  [v8 appendString:@"CITIES: \n\n"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [v5 objectForKeyedSubscript:v13];
        long long v15 = [v5 objectForKeyedSubscript:v13];
        long long v16 = [v15 allObjects];
        long long v17 = [v16 componentsJoinedByString:@"\n\t"];
        [v8 appendFormat:@"%@\n\t%@\n", v13, v17];

        if ((unint64_t)[v14 count] >= 2) {
          [v20 addObject:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v10);
  }

  [v8 appendString:@"POTIENTIAL DUPLICATES: \n\n"];
  [v8 appendFormat:@"%@", v20];

  return v8;
}

void __60__PGManager_Debug___stringDescriptionForLocationsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = [v3 fullname];
  id v4 = [v3 collection];
  id v5 = [v4 addressNodes];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [v3 name];

  uint64_t v8 = [NSString stringWithFormat:@"%lu: %@", v6, v11];
  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (v9)
  {
    uint64_t v10 = v9;
    [v9 addObject:v8];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithObject:v8];
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v7];
  }
}

- (id)_stringDescriptionForDisambiguatedPOIsInMomentNodes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  id v4 = [MEMORY[0x1E4F28E78] string];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __72__PGManager_Debug___stringDescriptionForDisambiguatedPOIsInMomentNodes___block_invoke;
        v12[3] = &unk_1E68EBC48;
        long long v15 = &v20;
        id v13 = v4;
        uint64_t v14 = v9;
        [v9 enumeratePOIEdgesAndNodesUsingBlock:v12];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [MEMORY[0x1E4F28E78] stringWithFormat:@"\n\nDisambiguated POI Info: %lu\n%@", v21[3], v4];

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __72__PGManager_Debug___stringDescriptionForDisambiguatedPOIsInMomentNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  if ([a2 poiIsImproved])
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v8 label];
    uint64_t v7 = [*(id *)(a1 + 40) name];
    [v5 appendFormat:@"- Improved: %@ - %@\n", v6, v7];
  }
}

- (id)_stringDescriptionForDisambiguatedLocationsWithGraph:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v4 = [v3 infoNode];
  id v5 = v4;
  if (v4)
  {
    [v4 routineInfo];
  }
  else
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
  }

  uint64_t v6 = @"YES";
  if (!(_BYTE)v45) {
    uint64_t v6 = @"NO";
  }
  uint64_t v7 = [MEMORY[0x1E4F28E78] stringWithFormat:@"\n\nDisambiguated Locations Info:\nRoutine available %@ #LOI %lu, #Visits %lu, Pinning %.2f\n#Requests %lu, #timeMatches %lu, #closeByLocationMatches %lu, #remoteLocationMatches %lu\n\n", v6, *((void *)&v45 + 1), (void)v46, *((void *)&v48 + 1), (void)v48, *((void *)&v46 + 1), v47];
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __73__PGManager_Debug___stringDescriptionForDisambiguatedLocationsWithGraph___block_invoke;
  void v42[3] = &unk_1E68EBC20;
  id v9 = v7;
  id v43 = v9;
  id v10 = v8;
  id v44 = v10;
  BOOL v30 = v3;
  [v3 enumerateNodesWithLabel:@"Address" domain:200 usingBlock:v42];
  uint64_t v33 = v10;
  id v11 = [v10 allKeys];
  uint64_t v12 = [v11 sortedArrayUsingSelector:sel_compare_];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v32 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(obj);
        }
        long long v16 = [v33 objectForKeyedSubscript:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v49 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v35 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void **)(*((void *)&v34 + 1) + 8 * j);
              uint64_t v22 = [v21 sourceNode];
              [v21 photoCoordinate];
              uint64_t v24 = v23;
              uint64_t v26 = v25;
              id v27 = [v22 name];
              [v9 appendFormat:@"- Remote: %@ {%f, %f}\n", v27, v24, v26];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v49 count:16];
          }
          while (v18);
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v14);
  }

  [v9 appendString:@"\n"];
  id v28 = v9;

  return v28;
}

void __73__PGManager_Debug___stringDescriptionForDisambiguatedLocationsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D25FED50]();
  if ([v3 isImproved])
  {
    [v3 coordinate];
    [*(id *)(a1 + 32) appendFormat:@"- Improved: {%f, %f}\n", v5, v6];
    uint64_t v7 = [v3 edgesForLabel:@"ADDRESS" domain:200];
    id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 comparator:&__block_literal_global_52609];
    v15[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v10 = [v7 sortedArrayUsingDescriptors:v9];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__PGManager_Debug___stringDescriptionForDisambiguatedLocationsWithGraph___block_invoke_3;
    void v13[3] = &unk_1E68EBBD0;
    id v14 = *(id *)(a1 + 32);
    [v10 enumerateObjectsUsingBlock:v13];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PGManager_Debug___stringDescriptionForDisambiguatedLocationsWithGraph___block_invoke_4;
  v11[3] = &unk_1E68EBBF8;
  id v12 = *(id *)(a1 + 40);
  [v3 enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:@"REMOTE_ADDRESS" domain:200 usingBlock:v11];
}

void __73__PGManager_Debug___stringDescriptionForDisambiguatedLocationsWithGraph___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 photoCoordinate];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  id v10 = [v3 sourceNode];

  id v8 = *(void **)(a1 + 32);
  id v9 = [v10 name];
  [v8 appendFormat:@"\t %@ {%f, %f}\n", v9, v5, v7];
}

void __73__PGManager_Debug___stringDescriptionForDisambiguatedLocationsWithGraph___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = NSNumber;
  [a3 timestampUTCStart];
  uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
  }
  [v7 addObject:v8];
}

uint64_t __73__PGManager_Debug___stringDescriptionForDisambiguatedLocationsWithGraph___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 sourceNode];
  uint64_t v6 = [v4 sourceNode];

  uint64_t v7 = [v5 name];
  id v8 = [v6 name];
  uint64_t v9 = [v7 compare:v8];

  return v9;
}

- (id)_stringDescriptionForMeNode:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = a3;
  uint64_t v5 = [v4 localIdentifier];
  uint64_t v6 = [v4 name];
  uint64_t v7 = [v4 contactIdentifier];
  id v8 = [v3 stringWithFormat:@"Me node information: localIdentifier:'%@', name:'%@', contact:'%@'", v5, v6, v7];

  uint64_t v9 = [MEMORY[0x1E4F28E78] string];
  id v10 = [MEMORY[0x1E4F28E78] string];
  id v11 = [MEMORY[0x1E4F1CA80] set];
  id v12 = [MEMORY[0x1E4F1CA80] set];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48__PGManager_Debug___stringDescriptionForMeNode___block_invoke;
  v20[3] = &unk_1E68EBB88;
  id v21 = v10;
  id v22 = v9;
  id v23 = v12;
  id v24 = v11;
  id v13 = v11;
  id v14 = v12;
  long long v15 = v9;
  long long v16 = v10;
  [v4 enumerateHomeOrWorkAddressNodesUsingBlock:v20];

  if ([(__CFString *)v15 length]) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = @"–";
  }
  [v8 appendFormat:@"\n\tHome addresses: %@", v17];
  if ([(__CFString *)v16 length]) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = @"–";
  }
  [v8 appendFormat:@"\n\tWork addresses: %@\n\n", v18];

  return v8;
}

void __48__PGManager_Debug___stringDescriptionForMeNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 collection];
  id v8 = [v7 streetNodes];
  id v20 = [v8 anyNode];

  uint64_t v9 = [v20 name];
  id v10 = [v6 collection];

  id v11 = [v10 cityNodes];
  id v12 = [v11 anyNode];

  id v13 = [v12 name];
  id v14 = [NSString stringWithFormat:@"{%@, %@}", v9, v13];
  long long v15 = [v5 label];

  int v16 = [v15 isEqualToString:@"Work"];
  uint64_t v17 = 40;
  if (v16) {
    uint64_t v17 = 32;
  }
  id v18 = *(id *)(a1 + v17);
  if (([v18 containsString:v14] & 1) == 0)
  {
    if (![v18 length])
    {
      [v18 appendString:v14];
      if (!v13) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    [v18 appendFormat:@", %@", v14];
  }
  if (!v13) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v19 = 56;
  if (v16) {
    uint64_t v19 = 48;
  }
  [*(id *)(a1 + v19) addObject:v13];
LABEL_10:
}

- (id)_stringDescriptionForPeopleEventsWithGraph:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v11 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
  [v10 setTimeZone:v11];

  [v10 setDateFormat:@"yyyy-MM-dd"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke;
  aBlock[3] = &unk_1E68EBB38;
  id v12 = v5;
  id v69 = v12;
  id v70 = v10;
  id v13 = v6;
  id v71 = v13;
  id v14 = v7;
  id v72 = v14;
  id v47 = v10;
  long long v15 = _Block_copy(aBlock);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  void v66[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_2;
  v66[3] = &unk_1E68EBB60;
  id v67 = v15;
  id v46 = v15;
  [v4 enumeratePersonNodesIncludingMe:1 withBlock:v66];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_3;
  v63[3] = &unk_1E68F1AA0;
  id v16 = v8;
  id v64 = v16;
  id v17 = v9;
  id v65 = v17;
  [v4 enumerateEdgesWithLabel:0 domain:301 usingBlock:v63];

  id v18 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"Birthday Dates: %ld\n", objc_msgSend(v12, "count"));
  uint64_t v19 = [v12 allKeys];
  id v20 = [v19 sortedArrayUsingSelector:sel_localizedCompare_];

  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_4;
  v60[3] = &unk_1E68EC628;
  id v61 = v12;
  id v21 = v18;
  id v62 = v21;
  id v45 = v12;
  [v20 enumerateObjectsUsingBlock:v60];
  id v22 = [v16 allValues];
  id v23 = [v22 valueForKeyPath:@"@unionOfArrays.self"];
  objc_msgSend(v21, "appendFormat:", @"\nCelebrated Birthdays: %ld\n", objc_msgSend(v23, "count"));

  id v24 = [v16 allKeys];
  uint64_t v25 = [v24 sortedArrayUsingSelector:sel_localizedCompare_];

  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_5;
  v57[3] = &unk_1E68EC628;
  id v58 = v16;
  id v26 = v21;
  id v59 = v26;
  id v44 = v16;
  [v25 enumerateObjectsUsingBlock:v57];
  objc_msgSend(v26, "appendFormat:", @"\nPotential Birthday Dates: %ld\n", objc_msgSend(v13, "count"));
  id v27 = [v13 allKeys];
  id v28 = [v27 sortedArrayUsingSelector:sel_localizedCompare_];

  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_6;
  v54[3] = &unk_1E68EC628;
  id v55 = v13;
  id v29 = v26;
  id v56 = v29;
  id v30 = v13;
  [v28 enumerateObjectsUsingBlock:v54];
  objc_msgSend(v29, "appendFormat:", @"\nAnniversary Dates: %ld\n", objc_msgSend(v14, "count"));
  BOOL v31 = [v14 allKeys];
  uint64_t v32 = [v31 sortedArrayUsingSelector:sel_localizedCompare_];

  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_7;
  v51[3] = &unk_1E68EC628;
  id v52 = v14;
  id v33 = v29;
  id v53 = v33;
  id v34 = v14;
  [v32 enumerateObjectsUsingBlock:v51];
  long long v35 = [v17 allValues];
  long long v36 = [v35 valueForKeyPath:@"@unionOfArrays.self"];
  objc_msgSend(v33, "appendFormat:", @"\nCelebrated Anniversaries: %ld\n", objc_msgSend(v36, "count"));

  long long v37 = [v17 allKeys];
  long long v38 = [v37 sortedArrayUsingSelector:sel_localizedCompare_];

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_8;
  v48[3] = &unk_1E68EC628;
  id v49 = v17;
  id v39 = v33;
  id v50 = v39;
  id v40 = v17;
  [v38 enumerateObjectsUsingBlock:v48];
  long long v41 = v50;
  id v42 = v39;

  return v42;
}

void __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v13 = [v3 stringDescription];
  id v4 = [v3 birthdayDateComponents];
  id v5 = [v3 anniversaryDateComponents];
  id v6 = [v3 potentialBirthdayDateComponents];

  if (v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F76C68] dateFromComponents:v4 inTimeZone:0];
    id v8 = [a1[5] stringFromDate:v7];
    [a1[4] setObject:v8 forKeyedSubscript:v13];
  }
  if (v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F76C68] dateFromComponents:v6 inTimeZone:0];
    id v10 = [a1[5] stringFromDate:v9];
    [a1[6] setObject:v10 forKeyedSubscript:v13];
  }
  if (v5)
  {
    id v11 = [MEMORY[0x1E4F76C68] dateFromComponents:v5 inTimeZone:0];
    id v12 = [a1[5] stringFromDate:v11];
    [a1[7] setObject:v12 forKeyedSubscript:v13];
  }
}

uint64_t __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_3(uint64_t a1, void *a2)
{
  id v16 = a2;
  id v3 = [v16 targetNode];
  id v4 = [v3 stringDescription];
  id v5 = [v16 sourceNode];
  id v6 = [v5 name];
  uint64_t v7 = [v16 label];
  int v8 = [v7 isEqualToString:@"BIRTHDAY"];

  if (v8)
  {
    uint64_t v9 = (id *)(a1 + 32);
LABEL_5:
    id v12 = *v9;
    goto LABEL_7;
  }
  id v10 = [v16 label];
  int v11 = [v10 isEqualToString:@"ANNIVERSARY"];

  if (v11)
  {
    uint64_t v9 = (id *)(a1 + 40);
    goto LABEL_5;
  }
  id v12 = 0;
LABEL_7:
  id v13 = [v12 objectForKeyedSubscript:v4];

  if (!v13)
  {
    id v14 = [MEMORY[0x1E4F1CA48] array];
    [v12 setObject:v14 forKeyedSubscript:v4];
  }
  long long v15 = [v12 objectForKeyedSubscript:v4];
  [v15 addObject:v6];
}

void __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  [*(id *)(a1 + 40) appendFormat:@"\t%@: %@\n", v4, v5];
}

void __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = [v3 objectForKeyedSubscript:v4];
  id v5 = [v8 sortedArrayUsingSelector:sel_localizedCompare_];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = [v5 componentsJoinedByString:@", "];
  [v6 appendFormat:@"\t%@: %@\n", v4, v7];
}

void __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  [*(id *)(a1 + 40) appendFormat:@"\t%@: %@\n", v4, v5];
}

void __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  [*(id *)(a1 + 40) appendFormat:@"\t%@: %@\n", v4, v5];
}

void __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = [v3 objectForKeyedSubscript:v4];
  id v5 = [v8 sortedArrayUsingSelector:sel_localizedCompare_];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = [v5 componentsJoinedByString:@", "];
  [v6 appendFormat:@"\t%@: %@\n", v4, v7];
}

- (id)_stringDescriptionForInterestingAreas:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v19 = (id)objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v10 = [v9 name];
        if (v10)
        {
          int v11 = [v9 collection];
          id v12 = [v11 addressNodes];
          id v13 = [v12 momentNodes];

          id v14 = [v13 interestingForMemoriesSubset];
          long long v15 = NSString;
          id v16 = [v9 name];
          id v17 = [v15 stringWithFormat:@"\t%@: %d interesting moments (out of %d moments)\n", v16, objc_msgSend(v14, "count"), objc_msgSend(v13, "count")];
          [v19 appendString:v17];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  return v19;
}

- (id)_stringDescriptionForInterestingCities:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v28 = (id)objc_opt_new();
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        int v11 = [v10 name];
        if (v11)
        {
          id v12 = [v10 collection];
          id v13 = [v12 addressNodes];
          id v14 = [v13 momentNodes];

          long long v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
          [v4 setObject:v15 forKeyedSubscript:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v7);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v5;
  uint64_t v16 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        long long v21 = NSString;
        long long v22 = [v20 name];
        long long v23 = [v20 name];
        id v24 = [v4 objectForKeyedSubscript:v23];
        uint64_t v25 = [v21 stringWithFormat:@"\t%@: %d moments\n", v22, objc_msgSend(v24, "intValue")];
        [v28 appendString:v25];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v17);
  }

  return v28;
}

- (id)_stringDescriptionForUrbanCities:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v22 = (id)objc_opt_new();
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __53__PGManager_Debug___stringDescriptionForUrbanCities___block_invoke;
  v27[3] = &unk_1E68EBB10;
  id v5 = v4;
  id v28 = v5;
  [v3 enumerateIdentifiersAsCollectionsWithBlock:v27];
  uint64_t v6 = [v3 set];
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
  v30[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  uint64_t v9 = [v6 sortedArrayUsingDescriptors:v8];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v15 = NSString;
        uint64_t v16 = [v14 name];
        uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "identifier"));
        uint64_t v18 = [v5 objectForKeyedSubscript:v17];
        id v19 = [v15 stringWithFormat:@"\t%@: %@ moments\n", v16, v18];
        [v22 appendString:v19];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v11);
  }

  return v22;
}

void __53__PGManager_Debug___stringDescriptionForUrbanCities___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 addressNodes];
  uint64_t v6 = [v5 momentNodes];
  uint64_t v7 = [v6 count];

  id v10 = [NSNumber numberWithUnsignedInteger:v7];
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:a2];
  [v8 setObject:v10 forKeyedSubscript:v9];
}

- (id)_dateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateStyle:1];
  [v2 setTimeStyle:0];
  id v3 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  [v2 setTimeZone:v3];

  return v2;
}

- (id)_stringDescriptionForMeaningfulEvents:(id)a3 isTrip:(BOOL)a4 forDiagnostics:(BOOL)a5 titleGenerationContext:(id)a6
{
  BOOL v50 = a4;
  BOOL v51 = a5;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v54 = a6;
  id v52 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v52 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  uint64_t v8 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  [v52 setTimeZone:v8];

  id v55 = (id)objc_opt_new();
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  obuint64_t j = v7;
  uint64_t v53 = [obj countByEnumeratingWithState:&v87 objects:v94 count:16];
  if (v53)
  {
    uint64_t v49 = *(void *)v88;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v88 != v49)
        {
          uint64_t v10 = v9;
          objc_enumerationMutation(obj);
          uint64_t v9 = v10;
        }
        uint64_t v56 = v9;
        uint64_t v11 = *(void **)(*((void *)&v87 + 1) + 8 * v9);
        uint64_t v12 = [v11 eventCollection];
        id v13 = [v12 eventMomentNodes];
        id v64 = [v13 firstAndLastMomentNodes];

        long long v63 = [v64 firstObject];
        id v62 = [v64 lastObject];
        uint64_t v81 = 0;
        double v82 = &v81;
        uint64_t v83 = 0x3032000000;
        id v84 = __Block_byref_object_copy__52615;
        long long v85 = __Block_byref_object_dispose__52616;
        id v86 = 0;
        uint64_t v75 = 0;
        id v76 = &v75;
        uint64_t v77 = 0x3032000000;
        id v78 = __Block_byref_object_copy__52615;
        uint64_t v79 = __Block_byref_object_dispose__52616;
        id v80 = 0;
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke;
        v74[3] = &unk_1E68EBAC0;
        void v74[4] = &v81;
        [v63 enumerateDateNodesUsingBlock:v74];
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke_2;
        v73[3] = &unk_1E68EBAC0;
        v73[4] = &v75;
        [v62 enumerateDateNodesUsingBlock:v73];
        id v14 = [PGCollectionTitleGenerator alloc];
        long long v15 = [v11 enrichableEvent];
        long long v60 = [(PGCollectionTitleGenerator *)v14 initWithCollection:v15 titleGenerationContext:v54];

        [(PGCollectionTitleGenerator *)v60 setForDiagnostics:v51];
        id v59 = [(PGCollectionTitleGenerator *)v60 titleTuple];
        uint64_t v16 = [v59 title];
        uint64_t v17 = [v16 stringValue];
        id v57 = [v17 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];

        uint64_t v18 = [v59 subtitle];
        id v61 = [v18 stringValue];

        id v58 = [v63 localStartDate];
        id v19 = [v62 localEndDate];
        long long v20 = [v52 stringFromDate:v58];
        long long v21 = [v52 stringFromDate:v19];
        if (v50)
        {
          [(id)v76[5] timeIntervalSinceDate:v82[5]];
          unint64_t v23 = vcvtpd_u64_f64(v22 / 86400.0) + 1;
          if (v23 <= 1) {
            long long v24 = &stru_1F283BC78;
          }
          else {
            long long v24 = @"s";
          }
          [v55 appendFormat:@"\t[%@ - %@] Legacy title: \"%@\", \"%@\" (%lu day%@)", v20, v21, v57, v61, v23, v24];
          long long v25 = [v11 highlightGroupNode];
          long long v26 = v25;
          if (v25)
          {
            id v47 = [v25 collection];
            long long v48 = [v47 tripFeatureNodes];
            id v27 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            v71[0] = 0;
            v71[1] = v71;
            v71[2] = 0x2020000000;
            char v72 = 1;
            v68[0] = MEMORY[0x1E4F143A8];
            v68[1] = 3221225472;
            v68[2] = __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke_3;
            v68[3] = &unk_1E68EE6A8;
            id v28 = v27;
            id v69 = v28;
            id v70 = v71;
            [v48 enumerateIdentifiersAsCollectionsWithBlock:v68];
            long long v29 = [v54 locationHelper];
            id v67 = 0;
            long long v30 = +[PGTripTitleGenerator titleForTripNodeAsCollection:v47 locationHelper:v29 error:&v67];
            id v31 = v67;

            id v32 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            long long v33 = v32;
            if (v30)
            {
              [v32 appendFormat:@"\n\t\tCurrent title: \"%@\", \"%@\" (%lu day%@)", v30, v61, v23, v24];
            }
            else
            {
              long long v41 = MEMORY[0x1E4F14500];
              id v42 = MEMORY[0x1E4F14500];
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                id v43 = v31;
                id v44 = [v31 localizedDescription];
                *(_DWORD *)long long buf = 138412290;
                uint64_t v93 = v44;
                _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

                id v31 = v43;
                long long v41 = MEMORY[0x1E4F14500];
              }
            }
            if (v28) {
              [v33 appendFormat:@", with featured location nodes: [%@]", v28];
            }
            [v55 appendString:v33];

            _Block_object_dispose(v71, 8);
          }
          [v55 appendString:@"\n"];
        }
        else
        {
          long long v26 = [v11 meaningfulEvent];
          if (v26)
          {
            long long v34 = [MEMORY[0x1E4F1CA80] set];
            v65[0] = MEMORY[0x1E4F143A8];
            v65[1] = 3221225472;
            v65[2] = __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke_1235;
            v65[3] = &unk_1E68EBAE8;
            id v35 = v34;
            id v66 = v35;
            [v26 enumerateMeaningEdgesAndNodesUsingBlock:v65];
            long long v36 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 selector:sel_localizedCompare_];
            uint64_t v91 = v36;
            long long v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
            long long v38 = [v35 sortedArrayUsingDescriptors:v37];

            uint64_t v39 = [v11 UUID];
            id v40 = [v38 componentsJoinedByString:@" "];
            [v55 appendFormat:@"\t[%@ - %@] %@, \"%@\", \"%@\" %@\n", v20, v21, v39, v57, v61, v40];
          }
          else
          {
            [v55 appendFormat:@"\t[%@ - %@] \"%@\", \"%@\" Unknown event, not a trip nor a meaningful event\n", v20, v21, v57, v61];
            long long v26 = 0;
          }
        }

        _Block_object_dispose(&v75, 8);
        _Block_object_dispose(&v81, 8);

        uint64_t v9 = v56 + 1;
      }
      while (v53 != v56 + 1);
      uint64_t v53 = [obj countByEnumeratingWithState:&v87 objects:v94 count:16];
    }
    while (v53);
  }

  return v55;
}

void __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 localDate];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  id v6 = v3;
  if (v5)
  {
    if (objc_msgSend(v5, "compare:") != 1) {
      goto LABEL_5;
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v3 = v6;
  }
  objc_storeStrong((id *)(v4 + 40), v3);
LABEL_5:
}

void __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 localDate];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  obuint64_t j = v3;
  if (v5)
  {
    uint64_t v6 = [v5 compare:v3];
    id v3 = obj;
    if (v6 != -1) {
      goto LABEL_5;
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v4 + 40), v3);
  id v3 = obj;
LABEL_5:
}

void __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 anyNode];
  id v8 = v4;
  id v5 = *(void **)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    uint64_t v6 = @"%@";
  }
  else {
    uint64_t v6 = @", %@";
  }
  id v7 = [v4 name];
  objc_msgSend(v5, "appendFormat:", v6, v7);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
}

void __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke_1235(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v12 = [a3 label];
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = NSString;
  if ([v5 isReliable]) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  [v5 confidence];
  uint64_t v10 = v9;

  uint64_t v11 = [v7 stringWithFormat:@"(%@, reliable %@, %.2f)", v12, v8, v10];
  [v6 addObject:v11];
}

- (id)_stringDescriptionForSocialGroups:(id)a3 includeImportance:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [v11 collection];
        id v13 = [v12 memberNodes];

        if (v4)
        {
          [v11 importance];
          objc_msgSend(v6, "appendFormat:", @"\t[%.4f] ", v14);
        }
        long long v15 = [v13 names];
        uint64_t v16 = [v15 componentsJoinedByString:@","];
        [v6 appendString:v16];

        [v6 appendString:@"\n"];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)_highlightEstimatesStatisticsWithCurationContext:(id)a3
{
  id v4 = a3;
  id v5 = [(PGManager *)self workingContext];
  uint64_t v6 = [[PGHighlightStatisticsEstimator alloc] initWithWorkingContext:v5];
  uint64_t v7 = [(PGHighlightStatisticsEstimator *)v6 highlightEstimatesDescriptionWithCurationContext:v4];

  return v7;
}

- (id)_peopleNameBiologicalSexStatisticsWithGraph:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = [MEMORY[0x1E4F1CA48] array];
  id v6 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v7 = [v4 nodesForLabel:@"Contact" domain:303];
  uint64_t v8 = (void *)[v6 initWithSet:v7];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v15 = [v14 contactIdentifier];
        unint64_t v16 = [(PGManager *)self _sexHintForGivenNameOfContactForIdentifier:v15 inGraph:v4];

        uint64_t v17 = [v14 name];
        if (!v16)
        {
          uint64_t v18 = v25;
LABEL_11:
          [v18 addObject:v17];
          goto LABEL_12;
        }
        uint64_t v18 = v5;
        if (v16 == 1) {
          goto LABEL_11;
        }
        uint64_t v18 = v26;
        if (v16 == 2) {
          goto LABEL_11;
        }
LABEL_12:
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  long long v19 = NSString;
  long long v20 = [v5 componentsJoinedByString:@"\n\t\t"];
  long long v21 = [v26 componentsJoinedByString:@"\n\t\t"];
  long long v22 = [v25 componentsJoinedByString:@"\n\t\t"];
  unint64_t v23 = [v19 stringWithFormat:@"BiologicalSex from Name\n\tFemale BiologicalSex Type:\n\t\t%@\n\tMale BiologicalSex Type:\n\t\t%@\n\tUndefined BiologicalSex Type:\n\t\t%@\n", v20, v21, v22];

  return v23;
}

- (unint64_t)_sexHintForGivenNameOfContactForIdentifier:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PGManager *)self serviceManager];
  id v9 = [v8 personForIdentifier:v7];

  uint64_t v10 = [v6 inferredUserLocales];

  unint64_t v11 = [v8 sexHintForPerson:v9 usingLocales:v10];
  return v11;
}

- (id)_peopleVisionBiologicalSexStatisticsWithGraph:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [v3 personNodesIncludingMe:1];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [v12 stringDescription];
        uint64_t v14 = [v12 sex];
        if (!v14)
        {
          long long v15 = v6;
LABEL_11:
          [v15 addObject:v13];
          goto LABEL_12;
        }
        long long v15 = v4;
        if (v14 == 1) {
          goto LABEL_11;
        }
        long long v15 = v5;
        if (v14 == 2) {
          goto LABEL_11;
        }
LABEL_12:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
  unint64_t v16 = NSString;
  uint64_t v17 = [v4 componentsJoinedByString:@"\n\t\t"];
  uint64_t v18 = [v5 componentsJoinedByString:@"\n\t\t"];
  long long v19 = [v6 componentsJoinedByString:@"\n\t\t"];
  long long v20 = [v16 stringWithFormat:@"BiologicalSex from Vision\n\tFemale BiologicalSex Type:\n\t\t%@\n\tMale BiologicalSex Type:\n\t\t%@\n\tUndefined BiologicalSex Type:\n\t\t%@\n", v17, v18, v19];

  return v20;
}

- (id)_peopleVisionAgeStatisticsWithGraph:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v44 = [MEMORY[0x1E4F1CA48] array];
  id v45 = [MEMORY[0x1E4F1CA48] array];
  id v43 = v3;
  uint64_t v8 = [v3 personNodesIncludingMe:1];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v14 = [v13 stringDescription];
        [v13 ageCategory];
        long long v15 = v4;
        switch((unint64_t)v4)
        {
          case 0uLL:
            long long v15 = v45;
            goto LABEL_12;
          case 1uLL:
            goto LABEL_12;
          case 2uLL:
            long long v15 = v5;
            goto LABEL_12;
          case 3uLL:
            long long v15 = v6;
            goto LABEL_12;
          case 4uLL:
            long long v15 = v7;
            goto LABEL_12;
          case 5uLL:
            long long v15 = v44;
LABEL_12:
            [v15 addObject:v14];
            break;
          default:
            break;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v10);
  }
  unint64_t v16 = [MEMORY[0x1E4F1CA48] arrayWithObject:@"None"];
  if ([v4 count]) {
    uint64_t v17 = v4;
  }
  else {
    uint64_t v17 = v16;
  }
  id v18 = v17;
  id v42 = v18;

  if ([v5 count]) {
    long long v19 = v5;
  }
  else {
    long long v19 = v16;
  }
  id v20 = v19;
  long long v41 = v20;

  if ([v6 count]) {
    long long v21 = v6;
  }
  else {
    long long v21 = v16;
  }
  id v22 = v21;
  id v40 = v22;

  if ([v7 count]) {
    long long v23 = v7;
  }
  else {
    long long v23 = v16;
  }
  id v24 = v23;
  uint64_t v39 = v24;

  if ([v44 count]) {
    long long v25 = v44;
  }
  else {
    long long v25 = v16;
  }
  id v26 = v25;
  long long v38 = v26;

  if ([v45 count]) {
    uint64_t v27 = v45;
  }
  else {
    uint64_t v27 = v16;
  }
  id v28 = v27;

  long long v29 = NSString;
  long long v30 = [v18 componentsJoinedByString:@"\n\t\t"];
  id v31 = [v20 componentsJoinedByString:@"\n\t\t"];
  uint64_t v32 = [v22 componentsJoinedByString:@"\n\t\t"];
  long long v33 = [v24 componentsJoinedByString:@"\n\t\t"];
  long long v34 = [v26 componentsJoinedByString:@"\n\t\t"];
  id v35 = [v28 componentsJoinedByString:@"\n\t\t"];
  long long v36 = [v29 stringWithFormat:@"Age from Vision\n\tBaby Age Category:\n\t\t%@\n\tChild Age Category:\n\t\t%@\n\tYoung Adult Age Category:\n\t\t%@\n\tAdult Age Category:\n\t\t%@\n\tSenior Age Category:\n\t\t%@\n\tUnspecified Age Category:\n\t\t%@\n", v30, v31, v32, v33, v34, v35];

  return v36;
}

- (id)_oneOnOneTripsWithGraph:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 trips];
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v37 = v3;
  id v6 = [v3 meNode];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v4;
  uint64_t v38 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v38)
  {
    uint64_t v35 = *(void *)v51;
    long long v36 = v5;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v51 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v50 + 1) + 8 * v7);
        long long v41 = [MEMORY[0x1E4F1CA80] set];
        id v40 = [MEMORY[0x1E4F1CA80] set];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v55 count:16];
        uint64_t v39 = v7;
        if (v10)
        {
          uint64_t v11 = v10;
          unint64_t v12 = 0;
          uint64_t v13 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v47 != v13) {
                objc_enumerationMutation(v9);
              }
              long long v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              unint64_t v16 = [v15 personNodes];
              unint64_t v17 = [v16 count];
              int v18 = [v16 containsObject:v6];
              if (v17 == 1) {
                int v19 = v18;
              }
              else {
                int v19 = 1;
              }
              if (v17 == 2) {
                int v20 = v18;
              }
              else {
                int v20 = 0;
              }
              if (v19 == 1 && v20 == 0)
              {
                uint64_t v23 = v17 > 1;
              }
              else
              {
                id v22 = [v16 allObjects];
                [v41 addObjectsFromArray:v22];

                [v40 addObject:v15];
                uint64_t v23 = 1;
              }
              v12 += v23;
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v55 count:16];
          }
          while (v11);
        }
        else
        {
          unint64_t v12 = 0;
        }

        id v24 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithSet:v40 graph:v37];
        long long v25 = [(MAElementCollection *)[PGGraphPersonNodeCollection alloc] initWithSet:v41 graph:v37];
        id v26 = +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:v24 amongPersonNodes:v25];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v54 count:16];
        id v5 = v36;
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v43;
          double v30 = (double)v12;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v43 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v32 = *(void **)(*((void *)&v42 + 1) + 8 * j);
              if (([v32 isMeNode] & 1) == 0
                && (double)(unint64_t)[v26 countForObject:v32] / v30 >= 0.75)
              {
                [v36 addObject:v9];
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v54 count:16];
          }
          while (v28);
        }

        uint64_t v7 = v39 + 1;
      }
      while (v39 + 1 != v38);
      uint64_t v38 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v38);
  }

  return v5;
}

- (unint64_t)_numberOfNightOutMomentsWithGraph:(id)a3
{
  id v3 = [a3 momentNodesWithMeaning:8];
  unint64_t v4 = [v3 count];

  return v4;
}

- (unint64_t)_numberOfFamilyHolidayMomentsWithGraph:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PGManager_Debug___numberOfFamilyHolidayMomentsWithGraph___block_invoke;
  void v6[3] = &unk_1E68EBA98;
  void v6[4] = &v7;
  [v3 enumerateCelebratedHolidayNodesUsingBlock:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __59__PGManager_Debug___numberOfFamilyHolidayMomentsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 category] == 2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __59__PGManager_Debug___numberOfFamilyHolidayMomentsWithGraph___block_invoke_2;
    v4[3] = &unk_1E68EB798;
    v4[4] = *(void *)(a1 + 32);
    [v3 enumerateCelebratingMomentNodesUsingBlock:v4];
  }
}

uint64_t __59__PGManager_Debug___numberOfFamilyHolidayMomentsWithGraph___block_invoke_2(uint64_t result)
{
  return result;
}

- (unint64_t)_numberOfMomentsOverWeekendsWithGraph:(id)a3
{
  id v3 = [a3 anyNodeForLabel:@"Weekend" domain:400 properties:0];
  unint64_t v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 edgesCount];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)_peopleRelationshipsStatisticsWithGraph:(id)a3 includingDebugInfo:(BOOL)a4
{
  BOOL v4 = a4;
  v116[13] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v89 = [v5 meNode];
  if (v89)
  {
    uint64_t v81 = v5;
    id v6 = [MEMORY[0x1E4F28E78] stringWithString:@"PEOPLE RELATIONSHIPS:\n\n"];
    v115[0] = @"PARTNER";
    v115[1] = @"FAMILY";
    v116[0] = &unk_1F28D24C0;
    v116[1] = &unk_1F28D24D8;
    v115[2] = @"PARENT";
    v115[3] = @"CHILD";
    v116[2] = &unk_1F28D24F0;
    v116[3] = &unk_1F28D2508;
    v115[4] = @"FRIEND";
    v115[5] = @"COWORKER";
    v116[4] = &unk_1F28D2520;
    v116[5] = &unk_1F28D2538;
    v115[6] = @"PARTNER";
    v115[7] = @"MOTHER";
    v116[6] = &unk_1F28D24C0;
    v116[7] = &unk_1F28D2550;
    v115[8] = @"FATHER";
    v115[9] = @"SISTER";
    v116[8] = &unk_1F28D2568;
    v116[9] = &unk_1F28D2580;
    v115[10] = @"BROTHER";
    v115[11] = @"DAUGHTER";
    v116[10] = &unk_1F28D2598;
    v116[11] = &unk_1F28D25B0;
    v115[12] = @"SON";
    v116[12] = &unk_1F28D25C8;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:13];
    BOOL v83 = v4;
    uint64_t v8 = 3;
    long long v107 = 0u;
    long long v108 = 0u;
    if (v4) {
      uint64_t v8 = 7;
    }
    id v86 = (id)v8;
    long long v109 = 0uLL;
    long long v110 = 0uLL;
    obuint64_t j = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v107 objects:v114 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v108;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v108 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v107 + 1) + 8 * i);
          uint64_t v14 = [obj objectForKeyedSubscript:v13];
          uint64_t v15 = [v14 unsignedIntegerValue];

          unint64_t v16 = [MEMORY[0x1E4F1CA48] array];
          unint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
          v103[0] = MEMORY[0x1E4F143A8];
          v103[1] = 3221225472;
          v103[2] = __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke;
          v103[3] = &unk_1E68EB9F8;
          id v18 = v16;
          id v104 = v18;
          BOOL v106 = v83;
          id v19 = v17;
          id v105 = v19;
          [v89 enumeratePersonNodesWithRelationship:v15 matchingQuery:v86 usingBlock:v103];
          int v20 = [NSString stringWithFormat:@"%@:\n", v13];
          [v6 appendString:v20];

          uint64_t v21 = [v18 count];
          if (!(v21 + [v19 count]))
          {
            id v22 = [NSString stringWithFormat:@"None\n"];
            [v6 appendString:v22];
LABEL_15:

            goto LABEL_16;
          }
          if ([v18 count])
          {
            uint64_t v23 = NSString;
            id v24 = [v18 componentsJoinedByString:@"\n\t"];
            long long v25 = [v23 stringWithFormat:@"\t%@\n", v24];
            [v6 appendString:v25];
          }
          if ([v19 count])
          {
            id v26 = [v19 keysSortedByValueUsingSelector:sel_compare_];
            uint64_t v27 = [v26 reverseObjectEnumerator];
            id v22 = [v27 allObjects];

            uint64_t v28 = NSString;
            uint64_t v29 = [v22 componentsJoinedByString:@"\n\t"];
            double v30 = [v28 stringWithFormat:@"\t%@\n", v29];
            [v6 appendString:v30];

            goto LABEL_15;
          }
LABEL_16:
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v107 objects:v114 count:16];
      }
      while (v10);
    }

    double v82 = [MEMORY[0x1E4F28E78] stringWithString:@"\nSOCIAL GROUPS RELATIONSHIPS:\n"];
    v112[0] = @"FAMILY";
    v112[1] = @"COWORKER";
    v113[0] = &unk_1F28D24D8;
    v113[1] = &unk_1F28D2538;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:2];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v87 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [v87 countByEnumeratingWithState:&v99 objects:v111 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v100;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v100 != v33) {
            objc_enumerationMutation(v87);
          }
          uint64_t v35 = *(void *)(*((void *)&v99 + 1) + 8 * j);
          long long v36 = [MEMORY[0x1E4F1CA48] array];
          long long v37 = [v87 objectForKeyedSubscript:v35];
          uint64_t v38 = [v37 unsignedIntegerValue];

          v96[0] = MEMORY[0x1E4F143A8];
          v96[1] = 3221225472;
          v96[2] = __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_2;
          v96[3] = &unk_1E68EBA20;
          id v39 = v36;
          id v97 = v39;
          uint64_t v98 = self;
          [v89 enumerateSocialGroupNodesWithRelationship:v38 usingBlock:v96];
          uint64_t v40 = [v39 count];
          long long v41 = NSString;
          if (v40)
          {
            long long v42 = [v39 componentsJoinedByString:@"\n\t\t"];
            long long v43 = [v41 stringWithFormat:@"%@ SG:\n\t\t%@\n", v35, v42];
            [v82 appendString:v43];
          }
          else
          {
            long long v42 = [NSString stringWithFormat:@"\tNo %@ Social Group\n", v35];
            [v82 appendString:v42];
          }
        }
        uint64_t v32 = [v87 countByEnumeratingWithState:&v99 objects:v111 count:16];
      }
      while (v32);
    }

    long long v44 = [v89 collection];
    long long v45 = [v44 ownedPetNodes];

    unint64_t v46 = 0x1E4F29000uLL;
    long long v47 = [NSString stringWithFormat:@"\n\nPETS\n"];
    [v6 appendString:v47];

    long long v48 = [NSString stringWithFormat:@"The user currently has %lu pets, based on the important entities inference\n", objc_msgSend(v45, "count")];
    [v6 appendString:v48];

    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_3;
    v94[3] = &unk_1E68EBA48;
    id v49 = v6;
    id v95 = v49;
    [v45 enumerateNodesUsingBlock:v94];
    if (v83)
    {
      id v5 = v81;
      unint64_t v50 = [(PGManager *)self _numberOfFamilyHolidayMomentsWithGraph:v81];
      objc_msgSend(NSString, "stringWithFormat:", @"\nMISCELLANEOUS:\nNumber of family holiday moments: %lu", v50);
      uint64_t v79 = v84 = v49;
      unint64_t v51 = [(PGManager *)self _numberOfNightOutMomentsWithGraph:v81];
      long long v52 = objc_msgSend(NSString, "stringWithFormat:", @"\nNumber of night out moments: %lu", v51);
      id v78 = [(PGManager *)self _oneOnOneTripsWithGraph:v81];
      uint64_t v53 = [v78 count];
      id v54 = objc_msgSend(NSString, "stringWithFormat:", @"\nNumber of one on one trips not including short trips: %lu", v53);
      id v55 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v56 = [v81 trips];
      [v81 weekends];
      v57 = id v80 = v45;
      id v58 = [v56 arrayByAddingObjectsFromArray:v57];
      id v59 = [v55 setWithArray:v58];

      [v59 minusSet:v78];
      uint64_t v60 = [v59 count];
      id v61 = objc_msgSend(NSString, "stringWithFormat:", @"\nNumber of non one on one trips including short trips: %lu", v60);
      unint64_t v62 = [(PGManager *)self _numberOfMomentsOverWeekendsWithGraph:v81];
      long long v63 = objc_msgSend(NSString, "stringWithFormat:", @"\nNumber of moments over weekends: %lu", v62);
      id v64 = [v81 momentNodes];
      id v65 = +[PGPeopleInferencesConveniences momentNodesAtWorkInMomentNodes:v64];

      uint64_t v66 = [v65 count];
      id v67 = objc_msgSend(NSString, "stringWithFormat:", @"\nNumber of moments at work: %lu", v66);
      id v68 = v82;
      uint64_t v69 = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@", v84, v82, v79, v52, v54, v61, v63, v67];

      long long v45 = v80;
      unint64_t v46 = 0x1E4F29000;

      id v70 = (__CFString *)v69;
      id v49 = v84;
    }
    else
    {
      id v70 = &stru_1F283BC78;
      id v5 = v81;
      id v68 = v82;
    }
    char v72 = [MEMORY[0x1E4F28E78] stringWithString:@"STORYTELLING (HIGH RECALL) RELATIONSHIPS:\n\n"];
    long long v73 = +[PGGraphEdgeCollection edgesInGraph:v5];
    id v74 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_4;
    v92[3] = &unk_1E68EC6A0;
    id v93 = v74;
    id v75 = v74;
    [v73 enumerateEdgesUsingBlock:v92];
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_5;
    v90[3] = &unk_1E68EBA70;
    id v91 = v72;
    id v76 = v72;
    [v75 enumerateKeysAndObjectsUsingBlock:v90];
    id v71 = [*(id *)(v46 + 24) stringWithFormat:@"%@\n\n%@\n\n%@\n\n%@", v49, v68, v70, v76];
  }
  else
  {
    id v71 = @"There is no menode in the graph -> cannot generate relationship report";
  }

  return v71;
}

void __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a3;
  id v5 = [a2 stringDescription];
  uint64_t v6 = [v18 status];
  uint64_t v7 = +[PGGraphRelationshipEdge relationshipSourceToString:](PGGraphRelationshipEdge, "relationshipSourceToString:", [v18 source]);
  if (v6)
  {
    [v18 confidence];
    double v9 = v8;
    uint64_t v10 = @"FILTERED OUT";
    if (v6 == 1) {
      uint64_t v10 = @"INFERRED";
    }
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v11 = v10;
      unint64_t v12 = [v18 description];
      uint64_t v13 = NSString;
      uint64_t v14 = [(__CFString *)v12 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
      uint64_t v15 = [v13 stringWithFormat:@"%@ (%@ %0.2f) (Source: %@) : %@", v5, v11, *(void *)&v9, v7, v14];
    }
    else
    {
      unint64_t v16 = NSString;
      unint64_t v12 = v10;
      uint64_t v15 = [v16 stringWithFormat:@"%@ (%@ %0.2f) (Source: %@)", v5, v12, *(void *)&v9, v7];
    }

    unint64_t v17 = [NSNumber numberWithDouble:v9];
    [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:v15];
  }
  else
  {
    uint64_t v15 = [NSString stringWithFormat:@"%@ (GROUND TRUTH) (Source: %@)", v5, v7];
    [*(id *)(a1 + 32) addObject:v15];
  }
}

void __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  double v8 = a2;
  BOOL v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  uint64_t v6 = [v4 arrayWithObjects:&v8 count:1];
  uint64_t v7 = objc_msgSend(v3, "_stringDescriptionForSocialGroups:includeImportance:", v6, 0, v8, v9);
  [v2 addObject:v7];
}

void __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = NSString;
  id v5 = [a2 description];
  BOOL v4 = [v3 stringWithFormat:@"\t%@\n", v5];
  [v2 appendString:v4];
}

void __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v14 = [v3 targetNode];
  BOOL v4 = NSString;
  id v5 = [v14 name];
  uint64_t v6 = [v14 localIdentifier];
  if (v6)
  {
    uint64_t v7 = [v14 localIdentifier];
    double v8 = [v4 stringWithFormat:@"%@ (%@)", v5, v7];
  }
  else
  {
    double v8 = [v4 stringWithFormat:@"%@ (%@)", v5, @"n/a"];
  }

  uint64_t v9 = [v3 label];

  uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  uint64_t v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  uint64_t v13 = v12;

  [v13 addObject:v9];
  [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v8];
}

void __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = NSString;
  id v6 = a2;
  id v9 = [a3 allObjects];
  uint64_t v7 = [v9 componentsJoinedByString:@", "];
  double v8 = [v5 stringWithFormat:@"%@ - %@\n", v6, v7];

  [v4 appendString:v8];
}

- (id)_partOfDayStatisticsWithGraph:(id)a3 titleGenerationContext:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v23 = a4;
  id v6 = [MEMORY[0x1E4F28E78] string];
  int v20 = v5;
  [v5 momentNodesSortedByDate];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v22 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v11 = [[PGTitleGenerator alloc] initWithMomentNode:v10 type:0 titleGenerationContext:v23];
        id v12 = [(PGTitleGenerator *)v11 title];
        uint64_t v13 = [v12 stringValue];
        id v14 = [v13 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];

        uint64_t v15 = [(PGTitleGenerator *)v11 subtitle];
        unint64_t v16 = [v15 stringValue];
        unint64_t v17 = [v16 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];

        [v6 appendFormat:@"%@ - %@: ", v14, v17];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __73__PGManager_Debug___partOfDayStatisticsWithGraph_titleGenerationContext___block_invoke;
        v24[3] = &unk_1E68EB9D0;
        id v18 = v6;
        id v25 = v18;
        [v10 enumeratePartOfDayEdgesAndNodesUsingBlock:v24];
        [v18 appendString:@"\n"];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  return v6;
}

void __73__PGManager_Debug___partOfDayStatisticsWithGraph_titleGenerationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v9 = [a3 name];
  id v6 = *(void **)(a1 + 32);
  [v5 ratio];
  uint64_t v8 = v7;

  [v6 appendFormat:@"[%@ %.2f] ", v9, v8];
}

- (id)_interestingStatisticsWithGraph:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  long long v43 = [(PGManager *)self photoLibrary];
  uint64_t v40 = [v43 librarySpecificFetchOptions];
  BOOL v4 = [MEMORY[0x1E4F38EE8] fetchMomentsWithOptions:v40];
  id v5 = [v42 momentNodesSortedByDate];
  uint64_t v39 = [v5 count];
  long long v41 = [MEMORY[0x1E4F1CA80] set];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
  if (v6)
  {
    uint64_t v52 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v76 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        unsigned int v11 = [v10 isInteresting];
        if ([v10 isSmartInteresting])
        {
          id v12 = [v42 momentForMomentNode:v10 inPhotoLibrary:v43];
          if (v12) {
            [v41 addObject:v12];
          }

          ++v52;
        }
        [v10 isInterestingForMemories];
        [v10 contentScore];
        v7 += v11;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v52 = 0;
    uint64_t v7 = 0;
  }

  unint64_t v51 = [MEMORY[0x1E4F28E60] indexSet];
  [v51 addIndex:4];
  [v51 addIndex:10];
  long long v48 = objc_opt_new();
  unint64_t v50 = objc_opt_new();
  id v49 = [v43 librarySpecificFetchOptions];
  uint64_t v13 = +[PGCurationManager assetPropertySetsForCuration];
  [v49 addFetchPropertySets:v13];

  long long v47 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v43];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v44 = v4;
  uint64_t v14 = [v44 countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v14)
  {
    uint64_t v46 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v72 != v46) {
          objc_enumerationMutation(v44);
        }
        uint64_t v16 = *(void *)(*((void *)&v71 + 1) + 8 * j);
        unint64_t v17 = (void *)MEMORY[0x1D25FED50]();
        id v18 = [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:2];
        id v19 = [MEMORY[0x1E4F76CF0] feederForAssetCollection:v16 options:v49 feederPrefetchOptions:v18 curationContext:v47];
        int v20 = [v19 allItems];
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        void v66[2] = __52__PGManager_Debug___interestingStatisticsWithGraph___block_invoke;
        v66[3] = &unk_1E68EB980;
        id v67 = v20;
        id v68 = v48;
        id v69 = v50;
        uint64_t v70 = v16;
        id v21 = v20;
        [v51 enumerateIndexesUsingBlock:v66];
      }
      uint64_t v14 = [v44 countByEnumeratingWithState:&v71 objects:v79 count:16];
    }
    while (v14);
  }

  uint64_t v22 = [MEMORY[0x1E4F28E78] stringWithString:@"Interesting Moments Analysis:\n\n"];
  objc_msgSend(v22, "appendFormat:", @"Total Smart Interesting Moments %lu/%lu\n", v52, v39);
  uint64_t v60 = 0;
  id v61 = &v60;
  uint64_t v62 = 0x3032000000;
  long long v63 = __Block_byref_object_copy__52615;
  id v64 = __Block_byref_object_dispose__52616;
  id v65 = [MEMORY[0x1E4F1CA80] setWithSet:v41];
  id v23 = (void *)v61[5];
  id v24 = [v50 objectForKey:&unk_1F28D2490];
  [v23 intersectSet:v24];

  objc_msgSend(v22, "appendFormat:", @"Total Current (Related) Interesting Moments %lu/%lu (%lu)\n", v7, v39, objc_msgSend((id)v61[5], "count"));
  uint64_t v25 = [MEMORY[0x1E4F1CA80] setWithSet:v41];
  long long v26 = (void *)v61[5];
  v61[5] = v25;

  long long v27 = (void *)v61[5];
  long long v28 = [v50 objectForKey:&unk_1F28D24A8];
  [v27 intersectSet:v28];

  long long v29 = [v48 objectForKey:&unk_1F28D24A8];
  uint64_t v30 = [v44 count];
  [v22 appendFormat:@"Total Current (Memories) Interesting Moments %@/%lu (%lu)\n\n", v29, v30, objc_msgSend((id)v61[5], "count")];

  [v22 appendFormat:@"Total Interesting Moments:\n"];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __52__PGManager_Debug___interestingStatisticsWithGraph___block_invoke_1059;
  v53[3] = &unk_1E68EB9A8;
  id v59 = &v60;
  id v31 = v41;
  id v54 = v31;
  id v32 = v50;
  id v55 = v32;
  id v33 = v22;
  id v56 = v33;
  id v34 = v48;
  id v57 = v34;
  id v35 = v44;
  id v58 = v35;
  [v51 enumerateIndexesUsingBlock:v53];
  long long v36 = v58;
  id v37 = v33;

  _Block_object_dispose(&v60, 8);
  return v37;
}

void __52__PGManager_Debug___interestingStatisticsWithGraph___block_invoke(void *a1, uint64_t a2)
{
  BOOL v4 = (void *)MEMORY[0x1D25FED50]();
  if (+[PGCurationManager areAssetsInteresting:a1[4] minimumNumberOfCuratedAssets:a2 duration:2])
  {
    id v5 = (void *)a1[5];
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:a2];
    uint64_t v7 = [v5 objectForKey:v6];

    uint64_t v8 = (void *)a1[5];
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") + 1);
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:a2];
    [v8 setObject:v9 forKey:v10];

    unsigned int v11 = (void *)a1[6];
    id v12 = [NSNumber numberWithUnsignedInteger:a2];
    uint64_t v13 = [v11 objectForKey:v12];

    if (!v13)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v14 = (void *)a1[6];
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:a2];
      [v14 setObject:v13 forKey:v15];
    }
    [v13 addObject:a1[7]];
  }
}

void __52__PGManager_Debug___interestingStatisticsWithGraph___block_invoke_1059(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [MEMORY[0x1E4F1CA80] setWithSet:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v8 = *(void **)(a1 + 40);
  id v9 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v10 = [v8 objectForKey:v9];
  [v7 intersectSet:v10];

  unsigned int v11 = *(void **)(a1 + 48);
  id v12 = *(void **)(a1 + 56);
  id v14 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v13 = [v12 objectForKey:v14];
  [v11 appendFormat:@"\tminimumCurated=%lu %@/%lu (%lu)\n", a2, v13, objc_msgSend(*(id *)(a1 + 64), "count"), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "count")];
}

- (id)_moodStatisticsWithGraph:(id)a3
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v74 = 0;
  long long v75 = &v74;
  uint64_t v76 = 0x3032000000;
  long long v77 = __Block_byref_object_copy__52615;
  long long v78 = __Block_byref_object_dispose__52616;
  id v79 = [MEMORY[0x1E4F28BD0] set];
  uint64_t v68 = 0;
  id v69 = &v68;
  uint64_t v70 = 0x3032000000;
  long long v71 = __Block_byref_object_copy__52615;
  long long v72 = __Block_byref_object_dispose__52616;
  id v73 = [MEMORY[0x1E4F28BD0] set];
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x3032000000;
  id v65 = __Block_byref_object_copy__52615;
  uint64_t v66 = __Block_byref_object_dispose__52616;
  id v67 = [MEMORY[0x1E4F28BD0] set];
  uint64_t v56 = 0;
  id v57 = &v56;
  uint64_t v58 = 0x3032000000;
  id v59 = __Block_byref_object_copy__52615;
  uint64_t v60 = __Block_byref_object_dispose__52616;
  id v61 = [MEMORY[0x1E4F28BD0] set];
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  uint64_t v7 = [(PGManager *)self photoLibrary];
  id v34 = [v7 librarySpecificFetchOptions];

  uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v81[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
  [v34 setSortDescriptors:v9];

  uint64_t v10 = [MEMORY[0x1E4F38EE8] fetchMomentsWithOptions:v34];
  unsigned int v11 = [(PGManager *)self workingContext];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke;
  void v42[3] = &unk_1E68EB958;
  id v12 = v4;
  id v43 = v12;
  id v13 = v11;
  id v44 = v13;
  long long v47 = &v74;
  long long v48 = &v68;
  id v49 = &v62;
  unint64_t v50 = &v56;
  id v36 = v5;
  id v45 = v36;
  unint64_t v51 = &v52;
  id v37 = v6;
  id v46 = v37;
  [v10 enumerateObjectsUsingBlock:v42];
  unint64_t v14 = v53[3];
  if (v14 >= 2) {
    [v37 multiplyByWeight:1.0 / ((double)v14 + -1.0)];
  }
  uint64_t v15 = [MEMORY[0x1E4F28E78] stringWithString:@"Moods:\nMood Suggested Possible Recommended Forbidden Mean Stddev"];
  id v32 = v10;
  id v33 = v13;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v16 = [&unk_1F28D4728 countByEnumeratingWithState:&v38 objects:v80 count:16];
  if (v16)
  {
    char v17 = 0;
    uint64_t v35 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(&unk_1F28D4728);
        }
        uint64_t v19 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        [v15 appendFormat:@"\n%@", v19];
        int v20 = (void *)v57[5];
        id v21 = [NSString stringWithFormat:@"%@", v19];
        objc_msgSend(v15, "appendFormat:", @" %lu", objc_msgSend(v20, "countForObject:", v21));

        uint64_t v22 = (void *)v63[5];
        id v23 = [NSString stringWithFormat:@"%@", v19];
        objc_msgSend(v15, "appendFormat:", @" %lu", objc_msgSend(v22, "countForObject:", v23));

        id v24 = (void *)v75[5];
        uint64_t v25 = [NSString stringWithFormat:@"%@", v19];
        objc_msgSend(v15, "appendFormat:", @" %lu", objc_msgSend(v24, "countForObject:", v25));

        long long v26 = (void *)v69[5];
        long long v27 = [NSString stringWithFormat:@"%@", v19];
        objc_msgSend(v15, "appendFormat:", @" %lu", objc_msgSend(v26, "countForObject:", v27));

        uint64_t v28 = 1 << (v17 + i);
        [v36 valueForMood:v28];
        [v15 appendFormat:@" %.2f", v29];
        [v37 valueForMood:v28];
        [v15 appendFormat:@" %.2f", sqrt(v30)];
      }
      uint64_t v16 = [&unk_1F28D4728 countByEnumeratingWithState:&v38 objects:v80 count:16];
      v17 += i;
    }
    while (v16);
  }
  [v15 appendString:@"\n\n"];

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  return v15;
}

void __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) momentNodeForMoment:v3];
  if ([v4 isInteresting])
  {
    context = (void *)MEMORY[0x1D25FED50]();
    uint64_t v5 = [PGMoodGenerator alloc];
    uint64_t v6 = [*(id *)(a1 + 40) photoLibrary];
    uint64_t v7 = [(PGMoodGenerator *)v5 initWithAssetCollection:v3 photoLibrary:v6 options:0];

    uint64_t v8 = [(PGMoodGenerator *)v7 positiveMoodVectorWithGraph:*(void *)(a1 + 32)];
    id v9 = [(PGMoodGenerator *)v7 negativeMoodVectorWithGraph:*(void *)(a1 + 32)];
    [(PGMoodGenerator *)v7 positiveThreshold];
    uint64_t v11 = v10;
    [(PGMoodGenerator *)v7 negativeThreshold];
    double v13 = v12;
    unint64_t v14 = (void *)[v8 copy];
    objc_msgSend(v14, "filterWithMoods:", ~objc_msgSend(v9, "moodsWithThreshold:", v13));
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke_2;
    v24[3] = &unk_1E68EB930;
    void v24[5] = v11;
    void v24[4] = *(void *)(a1 + 64);
    [v8 enumerateWithBlock:v24];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke_3;
    v23[3] = &unk_1E68EB930;
    *(double *)&v23[5] = v13;
    void v23[4] = *(void *)(a1 + 72);
    [v9 enumerateWithBlock:v23];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke_4;
    v22[3] = &unk_1E68EB930;
    v22[5] = v11;
    void v22[4] = *(void *)(a1 + 80);
    [v14 enumerateWithBlock:v22];
    uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    [(PGMoodGenerator *)v7 suggestedMoodWithGraph:*(void *)(a1 + 32)];
    uint64_t v16 = PHStringForMemoryMood();
    [v15 addObject:v16];

    char v17 = (void *)[v14 copy];
    [v17 substractMoodVector:*(void *)(a1 + 48)];
    id v18 = (void *)[v17 copy];
    [v18 multiplyByWeight:1.0 / ((double)*(unint64_t *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) + 1.0)];
    [*(id *)(a1 + 48) addMoodVector:v18];
    uint64_t v19 = (void *)[v14 copy];
    [v19 substractMoodVector:*(void *)(a1 + 48)];
    id v20 = v17;

    [v20 multiplyMoodVector:v19];
    [*(id *)(a1 + 56) addMoodVector:v20];

    ++*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  }
}

void __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke_2(uint64_t a1, double a2)
{
  if (*(double *)(a1 + 40) <= a2)
  {
    id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    PHStringForMemoryMood();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 addObject:v3];
  }
}

void __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke_3(uint64_t a1, double a2)
{
  if (*(double *)(a1 + 40) <= a2)
  {
    id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    PHStringForMemoryMood();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 addObject:v3];
  }
}

void __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke_4(uint64_t a1, double a2)
{
  if (*(double *)(a1 + 40) <= a2)
  {
    id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    PHStringForMemoryMood();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 addObject:v3];
  }
}

- (id)_stringDescriptionForMemoriesNotification
{
  id v3 = objc_opt_new();
  id v4 = [(PGManager *)self _dateFormatter];
  uint64_t v5 = [(PGManager *)self photoLibrary];
  uint64_t v6 = +[PGMemoryNotificationHelper lastTriggeredNotificationDateWithPhotoLibrary:v5];
  uint64_t v7 = [v4 stringFromDate:v6];
  [v3 appendFormat:@"\tLast notification triggered: %@\n", v7];

  uint64_t v8 = [(PGManager *)self photoLibrary];
  id v9 = +[PGMemoryNotificationHelper nextPossibleNotificationDateWithPhotoLibrary:v8];
  uint64_t v10 = [v4 stringFromDate:v9];
  [v3 appendFormat:@"\tNext possible notification: %@\n", v10];

  int v11 = [(PGManager *)self memoriesOfTheDayAreWorthNotifying];
  double v12 = @"NO";
  if (v11) {
    double v12 = @"YES";
  }
  [v3 appendFormat:@"\tToday's Memories are worth notifying: %@\n", v12];

  return v3;
}

- (id)_socialGroupsDebugStringWithGraph:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = a3;
  uint64_t v5 = [v3 string];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  [MEMORY[0x1E4F1CA48] array];
  float v16 = 0.0;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__PGManager_Debug___socialGroupsDebugStringWithGraph___block_invoke;
  v14[3] = &unk_1E68EB908;
  id v15 = v6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__PGManager_Debug___socialGroupsDebugStringWithGraph___block_invoke_2;
  v12[3] = &unk_1E68EB908;
  id v7 = v13;
  id v8 = v6;
  +[PGSocialGroupsQuestionFactory enumerateSocialGroupsWithGraph:v4 withLinkage:4 validGroupsBlock:v14 invalidGroupsBlock:v12 averageWeight:&v16];

  [v5 appendFormat:@"Social Groups from new algorithm with thresholds: [avgWeight=%.2f, minCohesion=%.2f]\n", v16, 0x3FD3333333333333];
  objc_msgSend(v5, "appendFormat:", @"Valid Social Groups: %ld\n", objc_msgSend(v8, "count"));
  id v9 = [v8 componentsJoinedByString:&stru_1F283BC78];
  [v5 appendString:v9];

  objc_msgSend(v5, "appendFormat:", @"Candidate Social Groups: %ld\n", objc_msgSend(v7, "count"));
  uint64_t v10 = [v7 componentsJoinedByString:&stru_1F283BC78];
  [v5 appendString:v10];

  return v5;
}

void __54__PGManager_Debug___socialGroupsDebugStringWithGraph___block_invoke(uint64_t a1, void *a2, float a3, double a4, double a5, double a6, float a7, float a8, float a9, float a10, uint64_t a11, void *a12, void *a13, float a14, float a15)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v26 = a12;
  id v27 = a13;
  id v44 = NSString;
  uint64_t v28 = [a2 sortedArrayUsingComparator:PGManagerPersonNodeComparisonBlock];
  uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v30 = v28;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v47;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void **)(*((void *)&v46 + 1) + 8 * v34);
        id v36 = [v35 name];
        if ([v36 length])
        {
          if (!v36) {
            goto LABEL_9;
          }
LABEL_8:
          [v29 addObject:v36];
          goto LABEL_9;
        }
        id v37 = [v35 stringDescription];
        uint64_t v38 = [v37 lowercaseString];

        id v36 = (void *)v38;
        if (v38) {
          goto LABEL_8;
        }
LABEL_9:

        ++v34;
      }
      while (v32 != v34);
      uint64_t v39 = [v30 countByEnumeratingWithState:&v46 objects:v50 count:16];
      uint64_t v32 = v39;
    }
    while (v39);
  }

  long long v40 = NSString;
  long long v41 = [v29 componentsJoinedByString:@", "];
  id v42 = [v40 stringWithFormat:@"%@ [wgt=%.4f, mom=%ld, supMom=%ld, excMomF=%.2f, supMomF=%.2f, familyF=%.2f, recF=%.2f, semCohF=%.2f, peoCohF=%.2f, rank=%.4f]", v41, a3, objc_msgSend(v26, "count"), objc_msgSend(v27, "count"), a7, a8, a9, a14, a10, *(void *)&a4, a15];

  id v43 = [v44 stringWithFormat:@"\t%@\n", v42];

  [*(id *)(a1 + 32) addObject:v43];
}

void __54__PGManager_Debug___socialGroupsDebugStringWithGraph___block_invoke_2(uint64_t a1, void *a2, float a3, double a4, double a5, double a6, float a7, float a8, float a9, float a10, uint64_t a11, void *a12, void *a13, float a14, float a15)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v26 = a12;
  id v27 = a13;
  id v44 = NSString;
  uint64_t v28 = [a2 sortedArrayUsingComparator:PGManagerPersonNodeComparisonBlock];
  uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v30 = v28;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v47;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void **)(*((void *)&v46 + 1) + 8 * v34);
        id v36 = [v35 name];
        if ([v36 length])
        {
          if (!v36) {
            goto LABEL_9;
          }
LABEL_8:
          [v29 addObject:v36];
          goto LABEL_9;
        }
        id v37 = [v35 stringDescription];
        uint64_t v38 = [v37 lowercaseString];

        id v36 = (void *)v38;
        if (v38) {
          goto LABEL_8;
        }
LABEL_9:

        ++v34;
      }
      while (v32 != v34);
      uint64_t v39 = [v30 countByEnumeratingWithState:&v46 objects:v50 count:16];
      uint64_t v32 = v39;
    }
    while (v39);
  }

  long long v40 = NSString;
  long long v41 = [v29 componentsJoinedByString:@", "];
  id v42 = [v40 stringWithFormat:@"%@ [wgt=%.4f, mom=%ld, supMom=%ld, excMomF=%.2f, supMomF=%.2f, familyF=%.2f, recF=%.2f, semCohF=%.2f, peoCohF=%.2f, rank=%.4f]", v41, a3, objc_msgSend(v26, "count"), objc_msgSend(v27, "count"), a7, a8, a9, a14, a10, *(void *)&a4, a15];

  id v43 = [v44 stringWithFormat:@"\t%@\n", v42];

  [*(id *)(a1 + 32) addObject:v43];
}

- (id)_socialGroupsDebugStringIncludingMeNode:(BOOL)a3 withGraph:(id)a4
{
  BOOL v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F28E78];
  id v6 = a4;
  id v7 = [v5 string];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  [MEMORY[0x1E4F1CA48] array];
  float v22 = 0.0;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __70__PGManager_Debug___socialGroupsDebugStringIncludingMeNode_withGraph___block_invoke;
  v20[3] = &unk_1E68EB8E0;
  id v21 = v8;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  char v17 = __70__PGManager_Debug___socialGroupsDebugStringIncludingMeNode_withGraph___block_invoke_2;
  id v18 = &unk_1E68EB8E0;
  id v9 = v19;
  id v10 = v8;
  [v6 enumerateSocialGroupsIncludingMeNode:v4 socialGroupsVersion:1 simulateMeNodeNotSet:0 validGroupsBlock:v20 invalidGroupsBlock:&v15 averageWeight:&v22];

  int v11 = @"Including MeNode ";
  if (!v4) {
    int v11 = &stru_1F283BC78;
  }
  [v7 appendFormat:@"Social Groups from current algorithm %@with thresholds: [avgWeight=%.2f, minCohesion=%.2f]\n", v11, v22, 0x3FD3333333333333, v15, v16, v17, v18];
  objc_msgSend(v7, "appendFormat:", @"Valid Social Groups: %ld\n", objc_msgSend(v10, "count"));
  double v12 = [v10 componentsJoinedByString:&stru_1F283BC78];
  [v7 appendString:v12];

  objc_msgSend(v7, "appendFormat:", @"Candidate Social Groups: %ld\n", objc_msgSend(v9, "count"));
  id v13 = [v9 componentsJoinedByString:&stru_1F283BC78];
  [v7 appendString:v13];

  return v7;
}

void __70__PGManager_Debug___socialGroupsDebugStringIncludingMeNode_withGraph___block_invoke(uint64_t a1, void *a2, float a3, double a4, uint64_t a5, void *a6)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = NSString;
  int v11 = [a2 sortedArrayUsingComparator:PGManagerPersonNodeComparisonBlock];
  double v12 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v28 + 1) + 8 * v17);
        id v19 = [v18 name];
        if ([v19 length])
        {
          if (!v19) {
            goto LABEL_9;
          }
LABEL_8:
          [v12 addObject:v19];
          goto LABEL_9;
        }
        id v20 = [v18 stringDescription];
        uint64_t v21 = [v20 lowercaseString];

        id v19 = (void *)v21;
        if (v21) {
          goto LABEL_8;
        }
LABEL_9:

        ++v17;
      }
      while (v15 != v17);
      uint64_t v22 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v15 = v22;
    }
    while (v22);
  }

  id v23 = NSString;
  id v24 = [v12 componentsJoinedByString:@", "];
  uint64_t v25 = [v23 stringWithFormat:@"%@ [moments=%ld, weight=%.4f, cohesion=%.2f]", v24, objc_msgSend(v9, "count"), a3, *(void *)&a4];

  id v26 = [v10 stringWithFormat:@"\t%@\n", v25];

  [*(id *)(a1 + 32) addObject:v26];
}

void __70__PGManager_Debug___socialGroupsDebugStringIncludingMeNode_withGraph___block_invoke_2(uint64_t a1, void *a2, float a3, double a4, uint64_t a5, void *a6)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = NSString;
  int v11 = [a2 sortedArrayUsingComparator:PGManagerPersonNodeComparisonBlock];
  double v12 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v28 + 1) + 8 * v17);
        id v19 = [v18 name];
        if ([v19 length])
        {
          if (!v19) {
            goto LABEL_9;
          }
LABEL_8:
          [v12 addObject:v19];
          goto LABEL_9;
        }
        id v20 = [v18 stringDescription];
        uint64_t v21 = [v20 lowercaseString];

        id v19 = (void *)v21;
        if (v21) {
          goto LABEL_8;
        }
LABEL_9:

        ++v17;
      }
      while (v15 != v17);
      uint64_t v22 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v15 = v22;
    }
    while (v22);
  }

  id v23 = NSString;
  id v24 = [v12 componentsJoinedByString:@", "];
  uint64_t v25 = [v23 stringWithFormat:@"%@ [moments=%ld, weight=%.4f, cohesion=%.2f]", v24, objc_msgSend(v9, "count"), a3, *(void *)&a4];

  id v26 = [v10 stringWithFormat:@"\t%@\n", v25];

  [*(id *)(a1 + 32) addObject:v26];
}

- (id)_entityTagsStatistics:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  uint64_t v5 = +[PGGraphNodeCollection nodesInGraph:v3];

  objc_msgSend(v4, "appendFormat:", @"Number of person relationship tags %lu\n", objc_msgSend(v5, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PGManager_Debug___entityTagsStatistics___block_invoke;
  v8[3] = &unk_1E68ED438;
  id v6 = v4;
  id v9 = v6;
  [v5 enumerateNodesUsingBlock:v8];

  return v6;
}

void __42__PGManager_Debug___entityTagsStatistics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 collection];
  uint64_t v5 = [v4 personNodes];

  id v6 = *(void **)(a1 + 32);
  id v7 = [v3 label];
  [v6 appendFormat:@"\tTag: %@. Total number of persons: %lu. List of persons:\n", v7, objc_msgSend(v5, "count")];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PGManager_Debug___entityTagsStatistics___block_invoke_2;
  v8[3] = &unk_1E68EB8B8;
  id v9 = *(id *)(a1 + 32);
  [v3 enumerateNeighborEdgesAndNodesThroughInEdgesUsingBlock:v8];
}

void __42__PGManager_Debug___entityTagsStatistics___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v8 = [a3 name];
  [v5 confidence];
  uint64_t v7 = v6;

  [v4 appendFormat:@"\t\t%@, confidence: %.2f\n", v8, v7];
}

- (id)_sharedLibraryStatistics:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  id v5 = +[PGGraphNodeCollection nodesInGraph:v3];
  uint64_t v6 = [v5 subsetWithOnlyPrivateAssets];
  uint64_t v7 = [v6 count];

  id v8 = [v5 subsetWithOnlySharedAssets];
  uint64_t v9 = [v8 count];

  id v10 = [v5 subsetWithBothPrivateAndSharedAssets];
  uint64_t v11 = [v10 count];

  objc_msgSend(v4, "appendFormat:", @"Moment nodes with both private and shared assets:\t%lu\nMoment nodes with only private assets:\t%lu\nMoment nodes with only shared assets:\t%lu\n\n", v11, v7, v9);
  double v12 = +[PGGraphPersonNodeCollection personNodesForSharedLibraryParticipantsInGraph:v3];

  objc_msgSend(v4, "appendFormat:", @"Person nodes for share participants in the graph: %lu\n", objc_msgSend(v12, "count"));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __45__PGManager_Debug___sharedLibraryStatistics___block_invoke;
  v15[3] = &unk_1E68EF528;
  id v13 = v4;
  id v16 = v13;
  [v12 enumerateNodesUsingBlock:v15];

  return v13;
}

void __45__PGManager_Debug___sharedLibraryStatistics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 collection];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v3 shareParticipantLocalIdentifier];
  uint64_t v7 = [v3 description];

  [v5 appendFormat:@"\tPerson with share participant identifier: %@, Description: %@\n", v6, v7];
  id v8 = [v4 authoredMomentNodes];
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"\tMoments authored: %lu", objc_msgSend(v8, "count"));
  uint64_t v9 = +[PGGraphPeoplePersonIsAroundEdge filter];
  id v10 = [v9 outRelation];
  uint64_t v11 = +[MANodeCollection nodesRelatedToNodes:v4 withRelation:v10];

  double v12 = +[PGGraphPersonProximityEdge filter];
  id v13 = [v12 outRelation];
  uint64_t v14 = +[MANodeCollection nodesRelatedToNodes:v4 withRelation:v13];

  uint64_t v15 = +[PGGraphPersonPresentEdge filter];
  id v16 = [v15 outRelation];
  uint64_t v17 = +[MANodeCollection nodesRelatedToNodes:v4 withRelation:v16];

  [*(id *)(a1 + 32) appendFormat:@"\tMoments where pressent: CoreRoutine: %lu, PeopleProximity: %lu, Face Detection: %lu", objc_msgSend(v11, "count"), objc_msgSend(v14, "count"), objc_msgSend(v17, "count")];
  id v18 = [v4 momentNodesWithPresence];
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"\tMoments where physically pressent: %lu", objc_msgSend(v18, "count"));
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __45__PGManager_Debug___sharedLibraryStatistics___block_invoke_2;
  v23[3] = &unk_1E68EB890;
  id v24 = v8;
  id v25 = v11;
  id v26 = v14;
  id v27 = v17;
  id v28 = *(id *)(a1 + 32);
  id v19 = v17;
  id v20 = v14;
  id v21 = v11;
  id v22 = v8;
  [v18 enumerateNodesUsingBlock:v23];
}

void __45__PGManager_Debug___sharedLibraryStatistics___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = (void *)MEMORY[0x1D25FED50]();
  BOOL v4 = [v9 collection];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([*(id *)(a1 + 32) intersectsCollection:v4]) {
    [v5 addObject:@"Author"];
  }
  if ([*(id *)(a1 + 40) intersectsCollection:v4]) {
    [v5 addObject:@"CoreRoutine"];
  }
  if ([*(id *)(a1 + 48) intersectsCollection:v4]) {
    [v5 addObject:@"PeopleProximity"];
  }
  if ([*(id *)(a1 + 56) intersectsCollection:v4]) {
    [v5 addObject:@"FaceDetection"];
  }
  if ([v5 count])
  {
    uint64_t v6 = [v5 componentsJoinedByString:@"/"];
  }
  else
  {
    uint64_t v6 = @"undefined";
  }
  uint64_t v7 = *(void **)(a1 + 64);
  id v8 = [v9 uuid];
  [v7 appendFormat:@"\t\t%@ - %@\n", v8, v6];
}

- (id)_socialGroupsDebugStatistics:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [(PGManager *)self _socialGroupsDebugStringIncludingMeNode:0 withGraph:v4];
  [v5 appendFormat:@"%@\n", v6];
  uint64_t v7 = [(PGManager *)self _socialGroupsDebugStringWithGraph:v4];

  [v5 appendFormat:@"%@\n", v7];
  return v5;
}

- (id)_socialGroupsStatistics:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v42 = objc_opt_new();
  uint64_t v37 = [v4 numberOfSocialGroupNodes];
  context = (void *)MEMORY[0x1D25FED50]();
  id v43 = v4;
  [v4 socialGroupNodesSortedByImportance];
  long long v40 = v44 = self;
  id v5 = -[PGManager _stringDescriptionForSocialGroups:includeImportance:](self, "_stringDescriptionForSocialGroups:includeImportance:");
  long long v46 = [MEMORY[0x1E4F1CA80] set];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v6 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  uint64_t v39 = v5;
  uint64_t v7 = [v5 componentsSeparatedByCharactersInSet:v6];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if ([v12 hasPrefix:@"\t["])
        {
          id v13 = [v12 componentsSeparatedByString:@"] "];
          uint64_t v14 = [v13 lastObject];
          uint64_t v15 = objc_msgSend(v14, "componentsSeparatedByString:", @" (");
          id v16 = [v15 firstObject];

          uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
          id v18 = [v16 componentsSeparatedByString:@", "];
          id v19 = [v17 setWithArray:v18];
          [v46 addObject:v19];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v9);
  }

  id v20 = [(PGManager *)v44 _socialGroupsDebugStringIncludingMeNode:0 withGraph:v43];
  id v45 = [MEMORY[0x1E4F1CA80] set];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v21 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  uint64_t v38 = v20;
  id v22 = [v20 componentsSeparatedByCharactersInSet:v21];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    unint64_t v25 = 0;
    uint64_t v26 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v48 != v26) {
          objc_enumerationMutation(v22);
        }
        id v28 = *(void **)(*((void *)&v47 + 1) + 8 * j);
        if ([v28 hasPrefix:@"\t["])
        {
          long long v29 = [v28 componentsSeparatedByString:@"] "];
          long long v30 = [v29 lastObject];
          long long v31 = objc_msgSend(v30, "componentsSeparatedByString:", @" (");
          uint64_t v32 = [v31 firstObject];

          uint64_t v33 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v34 = [v32 componentsSeparatedByString:@", "];
          uint64_t v35 = [v33 setWithArray:v34];
          [v45 addObject:v35];
        }
        else
        {
          if (v25 > 1) {
            goto LABEL_21;
          }
          ++v25;
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v24);
  }
LABEL_21:

  if (([v46 isEqualToSet:v45] & 1) == 0)
  {
    objc_msgSend(v42, "appendFormat:", @"Social Groups in graph: %lu\n", v37);
    [v42 appendFormat:@"%@\n", v39];
  }
  [v42 appendFormat:@"%@\n", v38];

  return v42;
}

- (id)_checkConsistencyOfGraph:(id)a3
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v113 = 0;
  long long v114 = &v113;
  uint64_t v115 = 0x3032000000;
  id v116 = __Block_byref_object_copy__52615;
  id v117 = __Block_byref_object_dispose__52616;
  id v118 = &stru_1F283BC78;
  id v4 = [v3 nodesLabels];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v109 objects:v123 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v110;
    uint64_t v8 = (unsigned __int16)*MEMORY[0x1E4F71F38];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v110 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [v3 nodesForLabel:*(void *)(*((void *)&v109 + 1) + 8 * i) domain:v8];
        if ([v10 intersectsSet:v5])
        {
          uint64_t v11 = (void *)[v10 mutableCopy];
          [v11 intersectSet:v5];
          double v12 = (void *)[v5 mutableCopy];
          [v12 intersectSet:v10];
          uint64_t v13 = [(id)v114[5] stringByAppendingFormat:@"Some nodes are registered for two labels:\n%@\n%@", v11, v12];
          uint64_t v14 = (void *)v114[5];
          v114[5] = v13;
        }
        [v5 unionSet:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v109 objects:v123 count:16];
    }
    while (v6);
  }

  uint64_t v15 = [v5 count];
  if (v15 != [v3 nodesCount])
  {
    uint64_t v16 = [(id)v114[5] stringByAppendingFormat:@"(nodesForLabel:@).count found %d, nodesCount found %d\n", objc_msgSend(v5, "count"), objc_msgSend(v3, "nodesCount")];
    uint64_t v17 = (void *)v114[5];
    v114[5] = v16;
  }
  id v18 = [v3 edgesLabels];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v72 = v18;
  uint64_t v20 = [v72 countByEnumeratingWithState:&v105 objects:v122 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v106;
    uint64_t v22 = (unsigned __int16)*MEMORY[0x1E4F71F38];
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v106 != v21) {
          objc_enumerationMutation(v72);
        }
        uint64_t v24 = [v3 edgesForLabel:*(void *)(*((void *)&v105 + 1) + 8 * j) domain:v22];
        if ([v24 intersectsSet:v19])
        {
          unint64_t v25 = (void *)[v24 mutableCopy];
          [v25 intersectSet:v19];
          uint64_t v26 = (void *)[v19 mutableCopy];
          [v26 intersectSet:v24];
          uint64_t v27 = [(id)v114[5] stringByAppendingFormat:@"Some edges are registered for two labels:\n%@\n%@", v25, v26];
          id v28 = (void *)v114[5];
          v114[5] = v27;
        }
        [v19 unionSet:v24];
      }
      uint64_t v20 = [v72 countByEnumeratingWithState:&v105 objects:v122 count:16];
    }
    while (v20);
  }

  uint64_t v29 = [v19 count];
  if (v29 != [v3 edgesCount])
  {
    uint64_t v30 = [(id)v114[5] stringByAppendingFormat:@"(edgesForLabel:@).count found %d, edgesCount found %d\n", objc_msgSend(v19, "count"), objc_msgSend(v3, "edgesCount")];
    long long v31 = (void *)v114[5];
    v114[5] = v30;
  }
  id v32 = objc_alloc_init(MEMORY[0x1E4F71E60]);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v33 = v5;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v101 objects:v121 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v102;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v102 != v35) {
          objc_enumerationMutation(v33);
        }
        uint64_t v37 = [*(id *)(*((void *)&v101 + 1) + 8 * k) identifier];
        if ([v32 containsIdentifier:v37])
        {
          uint64_t v38 = objc_msgSend((id)v114[5], "stringByAppendingFormat:", @"Identifier %u is being used by more than one node\n", v37);
          uint64_t v39 = (void *)v114[5];
          v114[5] = v38;
        }
        [v32 addIdentifier:v37];
      }
      uint64_t v34 = [v33 countByEnumeratingWithState:&v101 objects:v121 count:16];
    }
    while (v34);
  }

  id v40 = objc_alloc_init(MEMORY[0x1E4F71E60]);
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v41 = v19;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v97 objects:v120 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v98;
    do
    {
      for (uint64_t m = 0; m != v42; ++m)
      {
        if (*(void *)v98 != v43) {
          objc_enumerationMutation(v41);
        }
        uint64_t v45 = [*(id *)(*((void *)&v97 + 1) + 8 * m) identifier];
        if ([v40 containsIdentifier:v45])
        {
          uint64_t v46 = objc_msgSend((id)v114[5], "stringByAppendingFormat:", @"Identifier %u is being used by more than one edge\n", v45);
          long long v47 = (void *)v114[5];
          v114[5] = v46;
        }
        [v40 addIdentifier:v45];
      }
      uint64_t v42 = [v41 countByEnumeratingWithState:&v97 objects:v120 count:16];
    }
    while (v42);
  }

  long long v48 = [v3 momentNodes];
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke;
  v96[3] = &unk_1E68EB798;
  void v96[4] = &v113;
  [v48 enumerateNodesUsingBlock:v96];

  id v49 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  unint64_t v50 = [v3 nodesCountForLabel:@"Me" domain:300];
  if (v50 >= 2)
  {
    uint64_t v51 = objc_msgSend((id)v114[5], "stringByAppendingFormat:", @"Graph has %d Me nodes!\n", v50);
    long long v52 = (void *)v114[5];
    v114[5] = v51;
  }
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_2;
  v92[3] = &unk_1E68EB7C0;
  id v53 = v49;
  id v93 = v53;
  id v54 = v3;
  id v94 = v54;
  id v95 = &v113;
  [v54 enumerateNodesWithLabel:@"Me" domain:300 usingBlock:v92];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_3;
  v89[3] = &unk_1E68EF708;
  id v91 = &v113;
  id v55 = v53;
  id v90 = v55;
  [v54 enumeratePersonNodesIncludingMe:0 withBlock:v89];
  long long v71 = v54;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v56 = v55;
  uint64_t v57 = [v56 countByEnumeratingWithState:&v85 objects:v119 count:16];
  if (v57)
  {
    uint64_t v58 = *(void *)v86;
    do
    {
      for (uint64_t n = 0; n != v57; ++n)
      {
        if (*(void *)v86 != v58) {
          objc_enumerationMutation(v56);
        }
        uint64_t v60 = *(void *)(*((void *)&v85 + 1) + 8 * n);
        unint64_t v61 = [v56 countForObject:v60];
        if (v61 >= 2)
        {
          uint64_t v62 = [(id)v114[5] stringByAppendingFormat:@"%lu people nodes found for local identifier %@\n", v61, v60];
          long long v63 = (void *)v114[5];
          v114[5] = v62;
        }
      }
      uint64_t v57 = [v56 countByEnumeratingWithState:&v85 objects:v119 count:16];
    }
    while (v57);
  }

  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  void v84[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_4;
  v84[3] = &unk_1E68EF118;
  v84[4] = &v113;
  [v71 enumerateNodesWithLabel:@"SocialGroup" domain:302 usingBlock:v84];
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  void v83[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_5;
  v83[3] = &unk_1E68EB7E8;
  v83[4] = &v113;
  [v71 enumerateNodesWithLabel:0 domain:200 usingBlock:v83];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  void v82[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_6;
  v82[3] = &unk_1E68EB810;
  v82[4] = &v113;
  [v71 enumerateNodesWithLabel:@"Area" domain:201 usingBlock:v82];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_7;
  void v81[3] = &unk_1E68EC3A0;
  v81[4] = &v113;
  [v71 enumerateNodesWithLabel:0 domain:400 usingBlock:v81];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_8;
  v80[3] = &unk_1E68EC3A0;
  void v80[4] = &v113;
  [v71 enumerateNodesWithLabel:@"Holiday" domain:401 usingBlock:v80];
  uint64_t v64 = [MEMORY[0x1E4F1CA60] dictionary];
  id v65 = +[PGGraphNodeCollection nodesInGraph:v71];
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  void v77[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_9;
  void v77[3] = &unk_1E68EB840;
  id v66 = v64;
  id v78 = v66;
  id v79 = &v113;
  [v65 enumerateNodesUsingBlock:v77];
  id v67 = [MEMORY[0x1E4F1CA60] dictionary];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_10;
  v74[3] = &unk_1E68EB868;
  id v68 = v67;
  id v75 = v68;
  uint64_t v76 = &v113;
  [v71 enumerateNodesWithBlock:v74];
  id v69 = (id)v114[5];

  _Block_object_dispose(&v113, 8);
  return v69;
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  context = (void *)MEMORY[0x1D25FED50]();
  [v3 edgesForLabel:@"NEXT" domain:101];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    int v7 = 0;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = [v10 sourceNode];
        int v12 = [v11 isSameNodeAsNode:v3];

        uint64_t v13 = [v10 targetNode];
        int v14 = [v13 isSameNodeAsNode:v3];

        if ((v12 & v7) == 1)
        {
          uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingFormat:@"Moment node can have at most one next edge, moment %@\n", v3];
          uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
          uint64_t v17 = *(void **)(v16 + 40);
          *(void *)(v16 + 40) = v15;
        }
        if ((v14 & v6) == 1)
        {
          uint64_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingFormat:@"Moment node can have at most one previous edge, moment %@\n", v3];
          uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
          uint64_t v20 = *(void **)(v19 + 40);
          *(void *)(v19 + 40) = v18;
        }
        v7 |= v12;
        v6 |= v14;
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v5);
  }
  uint64_t v21 = [v3 dateNodes];
  if (![v21 count])
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingFormat:@"Moment node is not linked to any date node, which is not supposed to happen\n%@\n", v3, v25];
    goto LABEL_16;
  }
  if ((unint64_t)[v21 count] >= 3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingFormat:@"Moment node is linked to more than two date nodes, which is not supposed to happen\n%@ - %@\n", v3, v21];
    uint64_t v22 = LABEL_16:;
    uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_2(uint64_t a1, void *a2)
{
  id v21 = a2;
  id v3 = [v21 localIdentifier];
  if ([v3 length]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  uint64_t v4 = [*(id *)(a1 + 40) infoNode];
  int v5 = [v4 canAccessContactsStore];

  int v6 = [v21 name];
  if (!v6)
  {
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v9 = @"Me node has no name\n";
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v20 = v6;
    uint64_t v9 = @"Me node has a non-string name '%@'\n";
    goto LABEL_12;
  }
  if ([v6 length]) {
    int v7 = 0;
  }
  else {
    int v7 = v5;
  }
  if (v7 == 1)
  {
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v9 = @"Me node has an empty name\n";
LABEL_12:
    uint64_t v10 = objc_msgSend(v8, "stringByAppendingFormat:", v9, v20);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  uint64_t v13 = [v21 contactIdentifier];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v13 length]) {
        int v14 = 0;
      }
      else {
        int v14 = v5;
      }
      if (v14 != 1) {
        goto LABEL_23;
      }
      uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v16 = @"Me node has an empty cnid\n";
    }
    else
    {
      uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v20 = v13;
      uint64_t v16 = @"Me node has a non-string cnid '%@'\n";
    }
  }
  else
  {
    uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v16 = @"Me node has no cnid\n";
  }
  uint64_t v17 = objc_msgSend(v15, "stringByAppendingFormat:", v16, v20);
  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

LABEL_23:
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = [a2 localIdentifier];
  if (!v9)
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v4 = @"People node has no uuid\n";
LABEL_8:
    objc_msgSend(v3, "stringByAppendingFormat:", v4, v8);
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v9 length])
    {
      [*(id *)(a1 + 32) addObject:v9];
      goto LABEL_10;
    }
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v4 = @"People node has an empty uuid\n";
    goto LABEL_8;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingFormat:@"People node has a non-string uuid '%@'\n", v9];
  uint64_t v5 = LABEL_9:;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

LABEL_10:
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_4(uint64_t a1, void *a2)
{
  id v9 = [a2 UUID];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v9 length]) {
        goto LABEL_8;
      }
      id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v4 = @"Social Group node has an empty uuid\n";
    }
    else
    {
      id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      id v8 = v9;
      uint64_t v4 = @"Social Group node has a non-string uuid '%@'\n";
    }
  }
  else
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v4 = @"Social Group node has no uuid\n";
  }
  uint64_t v5 = objc_msgSend(v3, "stringByAppendingFormat:", v4, v8);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

LABEL_8:
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_5(uint64_t a1, void *a2)
{
  id v34 = a2;
  id v3 = [v34 label];
  if (![v3 isEqualToString:@"Address"])
  {
    if ([v3 isEqualToString:@"Country"])
    {
      id v7 = [v34 name];
      if (v7)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v7 length])
          {
LABEL_32:

            goto LABEL_33;
          }
          id v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          id v9 = [v34 label];
          [v8 stringByAppendingFormat:@"%@ node has an empty name\n", v9, v33];
        }
        else
        {
          uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          id v9 = [v34 label];
          [v17 stringByAppendingFormat:@"%@ node has a non-string name '%@'\n", v9, v7];
        }
      }
      else
      {
        uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        id v9 = [v34 label];
        [v15 stringByAppendingFormat:@"%@ node has no name\n", v9, v33];
      uint64_t v18 = };
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

LABEL_31:
      goto LABEL_32;
    }
    id v7 = v34;
    id v9 = [v7 name];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v9 length]) {
          goto LABEL_23;
        }
        uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        int v14 = [v7 label];
        [v13 stringByAppendingFormat:@"%@ node has an empty name\n", v14, v33];
      }
      else
      {
        id v21 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        int v14 = [v7 label];
        [v21 stringByAppendingFormat:@"%@ node has a non-string name '%@'\n", v14, v9];
      }
    }
    else
    {
      uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v14 = [v7 label];
      [v16 stringByAppendingFormat:@"%@ node has no name\n", v14, v33];
    uint64_t v22 = };
    uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

LABEL_23:
    uint64_t v25 = [v7 UUID];
    if (v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v25 length])
        {
LABEL_30:

          goto LABEL_31;
        }
        uint64_t v26 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        uint64_t v27 = [v7 label];
        [v26 stringByAppendingFormat:@"%@ node has an empty uuid\n", v27, v33];
      }
      else
      {
        long long v29 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        uint64_t v27 = [v7 label];
        [v29 stringByAppendingFormat:@"%@ node has a non-string uuid '%@'\n", v27, v25];
      }
    }
    else
    {
      long long v28 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v27 = [v7 label];
      [v28 stringByAppendingFormat:@"%@ node has no uuid\n", v27, v33];
    uint64_t v30 = };
    uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 8);
    id v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;

    goto LABEL_30;
  }
  [v34 coordinate];
  double latitude = v36.latitude;
  double longitude = v36.longitude;
  if (!CLLocationCoordinate2DIsValid(v36))
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v7 = [v34 label];
    [v10 stringByAppendingFormat:@"%@ node has invalid coordinates\n", v7];
    goto LABEL_12;
  }
  if (longitude == 0.0 && latitude == 0.0)
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v7 = [v34 label];
    [v6 stringByAppendingFormat:@"%@ node has null latitude and longitude\n", v7];
    uint64_t v11 = LABEL_12:;
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
    goto LABEL_31;
  }
LABEL_33:
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_6(uint64_t a1, void *a2)
{
  id v9 = [a2 name];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v9 length]) {
        goto LABEL_8;
      }
      id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v4 = @"Area node has an empty name\n";
    }
    else
    {
      id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      id v8 = v9;
      uint64_t v4 = @"Area node has a non-string name '%@'\n";
    }
  }
  else
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v4 = @"Area node has no name\n";
  }
  uint64_t v5 = objc_msgSend(v3, "stringByAppendingFormat:", v4, v8);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

LABEL_8:
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_7(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 label];
  if (([v3 isEqualToString:@"Date"] & 1) != 0
    || ([v3 isEqualToString:@"Season"] & 1) != 0
    || ([v3 isEqualToString:@"PartOfDay"] & 1) != 0
    || [v3 isEqualToString:@"DayOfWeek"])
  {
    uint64_t v4 = [v9 name];
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingFormat:@"%@ node has a non-string name '%@'\n", v3, v4];
        goto LABEL_17;
      }
      if (![v4 length])
      {
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingFormat:@"%@ node has an empty name\n", v3, v8];
        uint64_t v5 = LABEL_17:;
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
        id v7 = *(void **)(v6 + 40);
        *(void *)(v6 + 40) = v5;
      }
LABEL_18:

      goto LABEL_19;
    }
    goto LABEL_16;
  }
  if (([v3 isEqualToString:@"Weekend"] & 1) == 0
    && ([v3 isEqualToString:@"Weekday"] & 1) == 0)
  {
    uint64_t v4 = [v9 name];
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingFormat:@"%@ node has a string name '%@'\n", v3, v4];
        goto LABEL_17;
      }
      if ([v4 integerValue] < 0)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingFormat:@"%@ node has negative name\n", v3, v8];
        goto LABEL_17;
      }
      goto LABEL_18;
    }
LABEL_16:
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingFormat:@"%@ node has no name\n", v3, v8];
    goto LABEL_17;
  }
LABEL_19:
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_8(uint64_t a1, void *a2)
{
  id v9 = [a2 name];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v9 length]) {
        goto LABEL_8;
      }
      id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v4 = @"Holiday node has an empty name\n";
    }
    else
    {
      id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      id v8 = v9;
      uint64_t v4 = @"Holiday node has a non-string name '%@'\n";
    }
  }
  else
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v4 = @"Holiday node has no name\n";
  }
  uint64_t v5 = objc_msgSend(v3, "stringByAppendingFormat:", v4, v8);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

LABEL_8:
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 uniqueMemoryIdentifier];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v4)
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingFormat:@"Two memory nodes have the same unique identifier %@: %@, %@\n", v7, v4, v3];

    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v3 = *(id *)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v7];
  }
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_10(uint64_t a1, void *a2)
{
  id v11 = a2;
  int v3 = [v11 conformsToProtocol:&unk_1F28DE280];
  uint64_t v4 = v11;
  if (v3)
  {
    id v5 = v11;
    uint64_t v6 = [v5 featureIdentifier];
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    if (v7)
    {
      uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingFormat:@"Two feature nodes have the same unique identifier %@: %@, %@\n", v6, v7, v5];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    else
    {
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
    }

    uint64_t v4 = v11;
  }
}

- (id)_defaultStatisticsWithGraph:(id)a3 verbose:(BOOL)a4 forDiagnostics:(BOOL)a5
{
  MEMORY[0x1F4188790](self);
  unsigned int v386 = v5;
  unsigned int v340 = v6;
  v366 = v7;
  v541[1] = *MEMORY[0x1E4F143B8];
  id v349 = v8;
  v406 = [MEMORY[0x1E4F28E78] string];
  uint64_t v9 = (void *)MEMORY[0x1D25FED50]();
  uint64_t v10 = [v366 _checkConsistencyOfGraph:v349];
  id v11 = v10;
  if (v10 && [v10 length]) {
    [v406 appendFormat:@"Critical - Graph has inconsistencies:\n%@\n\n", v11];
  }

  v346 = [v349 infoNode];
  uint64_t v12 = (void *)MEMORY[0x1D25FED50]();
  uint64_t v13 = [v346 creationDate];
  [v406 appendFormat:@"Graph Date creation: %@\n", v13];

  if ([v346 canUseLocationDomain]) {
    int v14 = @"YES";
  }
  else {
    int v14 = @"NO";
  }
  [v406 appendFormat:@"Can Use Domain Location: %@\n", v14];
  if ([v346 canAccessContactsStore]) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  [v406 appendFormat:@"Can Use Contacts Store: %@\n", v15];
  objc_msgSend(v406, "appendFormat:", @"Graph Version: %lu\n", objc_msgSend(v349, "version"));
  unint64_t v16 = [v349 nodesCount];
  unint64_t v17 = [v349 edgesCount];
  unint64_t v18 = v17;
  if (v16) {
    double v19 = (double)v17 / (double)v16;
  }
  else {
    double v19 = 0.0;
  }
  objc_msgSend(v406, "appendFormat:", @"Node Count: %lu\n", v16);
  objc_msgSend(v406, "appendFormat:", @"Edge Count: %lu\n", v18);
  objc_msgSend(v406, "appendFormat:", @"Average Edge by Node: %0.2f\n", *(void *)&v19);
  id v348 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v351 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v350 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v347 = [v366 photoLibrary];
  uint64_t v20 = &unk_1D1F4E000;
  if ((v386 & 1) == 0)
  {
    id v358 = (id)MEMORY[0x1D25FED50]();
    uint64_t v515 = 0;
    v516 = &v515;
    uint64_t v517 = 0x2020000000;
    uint64_t v518 = 0;
    uint64_t v511 = 0;
    v512 = &v511;
    uint64_t v513 = 0x2020000000;
    uint64_t v514 = 0;
    uint64_t v507 = 0;
    v508 = &v507;
    uint64_t v509 = 0x2020000000;
    uint64_t v510 = 0;
    uint64_t v503 = 0;
    v504 = &v503;
    uint64_t v505 = 0x2020000000;
    uint64_t v506 = 0;
    uint64_t v499 = 0;
    v500 = &v499;
    uint64_t v501 = 0x2020000000;
    uint64_t v502 = 0;
    id v383 = [v347 librarySpecificFetchOptions];
    long long v52 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
    v541[0] = v52;
    id v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v541 count:1];
    [v383 setSortDescriptors:v53];

    [v383 setChunkSizeForFetch:100];
    v395 = (void *)MEMORY[0x1D25FED50](objc_msgSend(v383, "setCacheSizeForFetch:", objc_msgSend(v383, "chunkSizeForFetch")));
    id v54 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000301 options:v383];
    id v356 = (id)[v54 count];
    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v498 = 0u;
    long long v497 = 0u;
    long long v496 = 0u;
    long long v495 = 0u;
    id v401 = v54;
    uint64_t v56 = [v401 countByEnumeratingWithState:&v495 objects:v540 count:16];
    if (v56)
    {
      uint64_t v57 = *(void *)v496;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v496 != v57) {
            objc_enumerationMutation(v401);
          }
          id v59 = *(void **)(*((void *)&v495 + 1) + 8 * i);
          uint64_t v60 = (void *)MEMORY[0x1D25FED50]();
          unint64_t v61 = [v59 uuid];
          [v351 addObject:v61];

          uint64_t v62 = [MEMORY[0x1E4F38EE8] fetchMomentsInHighlight:v59 options:0];
          long long v494 = 0u;
          long long v493 = 0u;
          long long v492 = 0u;
          long long v491 = 0u;
          id v63 = v62;
          uint64_t v64 = [v63 countByEnumeratingWithState:&v491 objects:v539 count:16];
          if (v64)
          {
            uint64_t v65 = *(void *)v492;
            do
            {
              for (uint64_t j = 0; j != v64; ++j)
              {
                if (*(void *)v492 != v65) {
                  objc_enumerationMutation(v63);
                }
                id v67 = [*(id *)(*((void *)&v491 + 1) + 8 * j) uuid];
                [v55 addObject:v67];
              }
              uint64_t v64 = [v63 countByEnumeratingWithState:&v491 objects:v539 count:16];
            }
            while (v64);
          }
        }
        uint64_t v56 = [v401 countByEnumeratingWithState:&v495 objects:v540 count:16];
      }
      while (v56);
    }

    id v354 = (id)[v55 count];
    v396 = (void *)MEMORY[0x1D25FED50]();
    id v68 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000304 options:v383];
    uint64_t v352 = [v68 count];
    id v69 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v490 = 0u;
    long long v489 = 0u;
    long long v488 = 0u;
    long long v487 = 0u;
    id v402 = v68;
    uint64_t v70 = [v402 countByEnumeratingWithState:&v487 objects:v538 count:16];
    if (v70)
    {
      uint64_t v71 = *(void *)v488;
      do
      {
        for (uint64_t k = 0; k != v70; ++k)
        {
          if (*(void *)v488 != v71) {
            objc_enumerationMutation(v402);
          }
          id v73 = *(void **)(*((void *)&v487 + 1) + 8 * k);
          uint64_t v74 = (void *)MEMORY[0x1D25FED50]();
          id v75 = [v73 uuid];
          [v350 addObject:v75];

          uint64_t v76 = [MEMORY[0x1E4F39238] fetchChildDayGroupHighlightsForHighlight:v73 options:v383];
          long long v486 = 0u;
          long long v485 = 0u;
          long long v484 = 0u;
          long long v483 = 0u;
          id v77 = v76;
          uint64_t v78 = [v77 countByEnumeratingWithState:&v483 objects:v537 count:16];
          if (v78)
          {
            uint64_t v79 = *(void *)v484;
            do
            {
              for (uint64_t m = 0; m != v78; ++m)
              {
                if (*(void *)v484 != v79) {
                  objc_enumerationMutation(v77);
                }
                uint64_t v81 = [*(id *)(*((void *)&v483 + 1) + 8 * m) uuid];
                [v69 addObject:v81];
              }
              uint64_t v78 = [v77 countByEnumeratingWithState:&v483 objects:v537 count:16];
            }
            while (v78);
          }
        }
        uint64_t v70 = [v402 countByEnumeratingWithState:&v487 objects:v538 count:16];
      }
      while (v70);
    }

    uint64_t v339 = [v69 count];
    id v360 = [v347 librarySpecificFetchOptions];
    double v82 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
    v536 = v82;
    BOOL v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v536 count:1];
    [v360 setSortDescriptors:v83];

    [v360 setChunkSizeForFetch:100];
    objc_msgSend(v360, "setCacheSizeForFetch:", objc_msgSend(v360, "chunkSizeForFetch"));
    id v84 = [MEMORY[0x1E4F38EE8] fetchMomentsWithOptions:v360];
    long long v85 = [v84 firstObject];
    v344 = objc_msgSend(v85, "cls_localStartDateComponents");

    long long v86 = [v84 lastObject];
    v342 = objc_msgSend(v86, "cls_localEndDateComponents");

    uint64_t v337 = [v84 count];
    [v346 topTierAestheticScore];
    uint64_t v88 = v87;
    +[PGGraphBuilder topTierAestheticScoreForRatio:v347 inPhotoLibrary:0.01];
    uint64_t v90 = v89;
    [v346 topTierAestheticScoreForTripKeyAsset];
    uint64_t v92 = v91;
    +[PGGraphBuilder topTierAestheticScoreForRatio:v347 inPhotoLibrary:0.05];
    uint64_t v94 = v93;
    v369 = [v347 librarySpecificFetchOptions];
    [v369 setIncludeGuestAssets:1];
    id v95 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"curationScore > 0.0"];
    [v369 setInternalPredicate:v95];

    [v369 setChunkSizeForFetch:1000];
    [v369 setCacheSizeForFetch:1000];
    uint64_t v96 = MEMORY[0x1E4F14500];
    id v97 = MEMORY[0x1E4F14500];
    os_signpost_id_t v98 = os_signpost_id_generate(v96);
    long long v99 = v96;
    if (v98 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v98, "AssetScoreStatistics", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    v332 = (void *)mach_absolute_time();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke;
    aBlock[3] = &unk_1E68EB628;
    void aBlock[4] = &v499;
    void aBlock[5] = &v503;
    aBlock[6] = &v507;
    aBlock[7] = &v515;
    aBlock[8] = &v511;
    long long v100 = _Block_copy(aBlock);
    contexta = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v347];
    long long v481 = 0u;
    long long v480 = 0u;
    long long v479 = 0u;
    long long v478 = 0u;
    id obja = v84;
    uint64_t v101 = [obja countByEnumeratingWithState:&v478 objects:v535 count:16];
    if (v101)
    {
      uint64_t v367 = v101;
      uint64_t v377 = 0;
      uint64_t v364 = *(void *)v479;
      long long v102 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t n = 0; n != v367; ++n)
        {
          if (*(void *)v479 != v364) {
            objc_enumerationMutation(obja);
          }
          v381 = *(void **)(*((void *)&v478 + 1) + 8 * n);
          v374 = (void *)MEMORY[0x1D25FED50]();
          long long v103 = [v381 uuid];
          [v348 addObject:v103];

          long long v104 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v381 options:v369];
          unint64_t v375 = [v104 count];
          long long v477 = 0u;
          long long v476 = 0u;
          long long v475 = 0u;
          long long v474 = 0u;
          id v105 = v104;
          uint64_t v106 = [v105 countByEnumeratingWithState:&v474 objects:v534 count:16];
          if (v106)
          {
            uint64_t v107 = *(void *)v475;
            do
            {
              for (iuint64_t i = 0; ii != v106; ++ii)
              {
                if (*(void *)v475 != v107) {
                  objc_enumerationMutation(v105);
                }
                (*((void (**)(void *, void, void))v100 + 2))(v100, *(void *)(*((void *)&v474 + 1) + 8 * ii), 0);
              }
              uint64_t v106 = [v105 countByEnumeratingWithState:&v474 objects:v534 count:16];
            }
            while (v106);
          }

          v377 += v375;
          unint64_t v371 = [v381 estimatedAssetCount];
          if (v375 < v371)
          {
            long long v109 = [v347 librarySpecificFetchOptions];
            [v109 setIncludeGuestAssets:1];
            long long v110 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"curationScore == 0.0"];
            [v109 setInternalPredicate:v110];

            long long v111 = +[PGCurationManager assetPropertySetsForCuration];
            [v109 setFetchPropertySets:v111];

            [v109 setChunkSizeForFetch:1000];
            [v109 setCacheSizeForFetch:1000];
            v392 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v381 options:v109];
            unint64_t v403 = [v392 count];
            if (v403)
            {
              for (juint64_t j = 0; jj < v403; jj += 1000)
              {
                v397 = (void *)MEMORY[0x1D25FED50]();
                if (v403 - jj >= 0x3E8) {
                  uint64_t v113 = 1000;
                }
                else {
                  uint64_t v113 = v403 - jj;
                }
                long long v114 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", jj, v113);
                uint64_t v115 = [v392 objectsAtIndexes:v114];

                [MEMORY[0x1E4F38EB8] prefetchOnAssets:v115 options:31 curationContext:contexta];
                long long v473 = 0u;
                long long v472 = 0u;
                long long v471 = 0u;
                long long v470 = 0u;
                id v116 = v115;
                uint64_t v117 = [v116 countByEnumeratingWithState:&v470 objects:v533 count:16];
                if (v117)
                {
                  uint64_t v118 = *(void *)v471;
                  do
                  {
                    for (kuint64_t k = 0; kk != v117; ++kk)
                    {
                      if (*(void *)v471 != v118) {
                        objc_enumerationMutation(v116);
                      }
                      (*((void (**)(void *, void, uint64_t))v100 + 2))(v100, *(void *)(*((void *)&v470 + 1) + 8 * kk), 1);
                    }
                    uint64_t v117 = [v116 countByEnumeratingWithState:&v470 objects:v533 count:16];
                  }
                  while (v117);
                }
              }
            }
            if (v403 + v375 != v371)
            {
              long long v120 = v102;
              if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 67109890;
                *(_DWORD *)&uint8_t buf[4] = v375;
                *(_WORD *)&uint8_t buf[8] = 1024;
                *(_DWORD *)&buf[10] = v403;
                *(_WORD *)&buf[14] = 1024;
                *(_DWORD *)&uint8_t buf[16] = v371;
                *(_WORD *)&buf[20] = 2112;
                *(void *)&buf[22] = v381;
                _os_log_error_impl(&dword_1D1805000, v102, OS_LOG_TYPE_ERROR, "Numbers of fetched assets with curation score %d and without curation score %d don't match expected number of assets %d for moment %@", buf, 0x1Eu);
              }
            }
            v377 += v403;
          }
        }
        uint64_t v367 = [obja countByEnumeratingWithState:&v478 objects:v535 count:16];
      }
      while (v367);
    }
    else
    {
      uint64_t v377 = 0;
    }

    uint64_t v320 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    id v323 = MEMORY[0x1E4F14500];
    if (v98 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, v98, "AssetScoreStatistics", "", buf, 2u);
    }

    v324 = MEMORY[0x1E4F14500];
    id v325 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v324, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "AssetScoreStatistics";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v320 - (unint64_t)v332) * (float)numer) / (float)denom)
                                  / 1000000.0);
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    objc_msgSend(v406, "appendFormat:", @"Photo Count: %lu\n", v377);
    objc_msgSend(v406, "appendFormat:", @"Moment Count: %lu\n", v337);
    [v406 appendFormat:@"Highlight Count: %lu, covering %lu moments\n", v356, v354];
    [v406 appendFormat:@"Highlight Group Count: %lu, covering %lu highlights\n", v352, v339];
    objc_msgSend(v406, "appendFormat:", @"Date Range: %lu - %lu\n\n", objc_msgSend(v344, "year"), objc_msgSend(v342, "year"));
    uint64_t v326 = *((unsigned int *)v504 + 6);
    uint64_t v327 = [v346 numberOfBetterAssets];
    uint64_t v328 = *((unsigned int *)v508 + 6);
    uint64_t v329 = [v346 numberOfImprovedAssets];
    uint64_t v330 = *((unsigned int *)v512 + 6);
    uint64_t v331 = [v346 numberOfDefaultAssets];
    objc_msgSend(v406, "appendFormat:", @"Assets Counts:\n\tBetter: %d (graph: %d)\n\tImproved: %d (graph: %d)\n\tDefault: %d (graph: %d)\n\tUtility: %d (graph: %d)\nTotal: %d (graph: %d)\n", v326, v327, v328, v329, v330, v331, *((unsigned int *)v516 + 6), objc_msgSend(v346, "numberOfUtilityAssets"), v377, objc_msgSend(v346, "numberOfAssets"));
    objc_msgSend(v406, "appendFormat:", @"Current Graph Top-tier Aesthetic Score: %f\n", v88);
    objc_msgSend(v406, "appendFormat:", @"Library Top-tier Aesthetic Score: %f\n\n", v90);
    objc_msgSend(v406, "appendFormat:", @"Current Graph Top-tier Aesthetic Score for Trip Key Asset: %f\n", v92);
    objc_msgSend(v406, "appendFormat:", @"Library Top-tier Aesthetic Score for Trip Key Asset: %f\n\n", v94);

    _Block_object_dispose(&v499, 8);
    _Block_object_dispose(&v503, 8);
    _Block_object_dispose(&v507, 8);
    _Block_object_dispose(&v511, 8);
    _Block_object_dispose(&v515, 8);

    uint64_t v20 = (void *)&unk_1D1F4E000;
  }
  id v373 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v515 = 0;
  v516 = &v515;
  uint64_t v21 = v20[295];
  uint64_t v517 = v21;
  uint64_t v518 = 0;
  uint64_t v511 = 0;
  v512 = &v511;
  uint64_t v513 = v21;
  uint64_t v514 = 0;
  uint64_t v507 = 0;
  v508 = &v507;
  uint64_t v509 = v21;
  uint64_t v510 = 0;
  uint64_t v503 = 0;
  v504 = &v503;
  uint64_t v505 = v21;
  uint64_t v506 = 0;
  uint64_t v499 = 0;
  v500 = &v499;
  uint64_t v501 = v21;
  uint64_t v502 = 0;
  context = (void *)MEMORY[0x1D25FED50]();
  uint64_t v22 = [v349 momentNodesSortedByDate];
  uint64_t v23 = [v22 count];
  id v400 = [MEMORY[0x1E4F1CA80] set];
  v394 = [MEMORY[0x1E4F1CA80] set];
  long long v469 = 0u;
  long long v468 = 0u;
  long long v467 = 0u;
  long long v466 = 0u;
  obuint64_t j = v22;
  uint64_t v24 = [obj countByEnumeratingWithState:&v466 objects:v532 count:16];
  uint64_t v391 = v23;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  if (v24)
  {
    uint64_t v27 = *(void *)v467;
    do
    {
      for (muint64_t m = 0; mm != v24; ++mm)
      {
        if (*(void *)v467 != v27) {
          objc_enumerationMutation(obj);
        }
        long long v29 = *(void **)(*((void *)&v466 + 1) + 8 * mm);
        uint64_t v30 = [v29 uuid];
        [v373 addObject:v30];

        if ([v29 isInteresting]) {
          [v400 addObject:v29];
        }
        if ([v29 isSmartInteresting]) {
          [v394 addObject:v29];
        }
        unsigned int v31 = [v29 isInterestingForMemories];
        [v29 contentScore];
        double v33 = v32;
        v465[0] = MEMORY[0x1E4F143A8];
        v465[1] = 3221225472;
        v465[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_438;
        v465[3] = &unk_1E68EB650;
        v465[4] = &v515;
        v465[5] = &v511;
        v465[6] = &v507;
        v465[7] = &v503;
        v465[8] = &v499;
        [v29 enumerateAddressEdgesAndNodesUsingBlock:v465];
        v26 += v31;
        if (v33 < 0.5) {
          ++v25;
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v466 objects:v532 count:16];
    }
    while (v24);
  }

  id v34 = (void *)[v400 mutableCopy];
  [v34 intersectSet:v394];
  uint64_t v35 = (void *)[v400 mutableCopy];
  [v35 minusSet:v394];
  CLLocationCoordinate2D v36 = (void *)[v394 mutableCopy];
  [v36 minusSet:v400];
  uint64_t v37 = [MEMORY[0x1E4F1CA80] setWithArray:obj];
  [v37 minusSet:v400];
  [v37 minusSet:v394];
  objc_msgSend(v406, "appendFormat:", @"Moment nodes count: %lu\n", v391);
  objc_msgSend(v406, "appendFormat:", @"\tInteresting: %.lu\n", objc_msgSend(v400, "count"));
  objc_msgSend(v406, "appendFormat:", @"\tSmart: %.lu\n", objc_msgSend(v394, "count"));
  objc_msgSend(v406, "appendFormat:", @"\tInteresting and smart: %.lu\n", objc_msgSend(v34, "count"));
  objc_msgSend(v406, "appendFormat:", @"\tInteresting and not smart: %.lu\n", objc_msgSend(v35, "count"));
  objc_msgSend(v406, "appendFormat:", @"\tSmart and not interesting: %.lu\n", objc_msgSend(v36, "count"));
  objc_msgSend(v406, "appendFormat:", @"\tNot smart and not interesting: %.lu\n", objc_msgSend(v37, "count"));
  objc_msgSend(v406, "appendFormat:", @"\tInteresting for Memories: %.lu\n", v26);
  objc_msgSend(v406, "appendFormat:", @"\tJunk (contentScore < 0.5): %.lu\n\n", v25);

  if ((v386 & 1) == 0)
  {
    uint64_t v38 = (void *)MEMORY[0x1D25FED50]();
    [v406 appendFormat:@"Graph <-> Library Matching\n"];
    uint64_t v39 = (void *)[v373 mutableCopy];
    [v39 intersectSet:v348];
    uint64_t v40 = [v39 count];
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Moments: %lu\n", objc_msgSend(v348, "count"));
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Moment nodes: %lu\n", objc_msgSend(v373, "count"));
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Moment nodes matching moments: %lu\n", v40);
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Moment nodes without moment: %lu\n", objc_msgSend(v373, "count") - v40);
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Moments without moment nodes: %lu\n\n", objc_msgSend(v348, "count") - v40);
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v463[0] = MEMORY[0x1E4F143A8];
    v463[1] = 3221225472;
    v463[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_2;
    v463[3] = &unk_1E68EB678;
    id v42 = v41;
    id v464 = v42;
    [v349 enumerateDayHighlightNodesWithBlock:v463];
    uint64_t v43 = (void *)[v42 mutableCopy];
    [v43 intersectSet:v351];
    uint64_t v44 = [v43 count];
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Highlights: %lu\n", objc_msgSend(v351, "count"));
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Highlight nodes: %lu\n", objc_msgSend(v42, "count"));
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Highlight nodes matching highlights: %lu\n", v44);
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Highlight nodes without highlights: %lu\n", objc_msgSend(v42, "count") - v44);
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Highlights without highlight nodes: %lu\n\n", objc_msgSend(v351, "count") - v44);
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v461[0] = MEMORY[0x1E4F143A8];
    v461[1] = 3221225472;
    v461[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_3;
    v461[3] = &unk_1E68EB6A0;
    id v46 = v45;
    id v462 = v46;
    [v349 enumerateHighlightGroupNodesWithBlock:v461];
    long long v47 = (void *)[v46 mutableCopy];
    [v47 intersectSet:v350];
    uint64_t v48 = [v47 count];
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Highlight groups: %lu\n", objc_msgSend(v350, "count"));
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Highlight group nodes: %lu\n", objc_msgSend(v46, "count"));
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Highlight group nodes matching highlight groups: %lu\n", v48);
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Highlight group nodes without highlight groups: %lu\n", objc_msgSend(v46, "count") - v48);
    objc_msgSend(v406, "appendFormat:", @"\tNumber of Highlight groups without highlight group nodes: %lu\n\n", objc_msgSend(v350, "count") - v48);
  }
  objc_msgSend(v406, "appendFormat:", @"People: %lu\n", objc_msgSend(v349, "numberOfPersonNodesIncludingMe:", 0));
  id v49 = [v366 _socialGroupsStatistics:v349];
  [v406 appendFormat:@"%@\n", v49];

  v338 = [v349 meNode];
  v336 = [v338 localIdentifier];
  if (v338)
  {
    unint64_t v50 = objc_msgSend(v366, "_stringDescriptionForMeNode:");
    [v406 appendString:v50];

    uint64_t v51 = [v349 nodesForLabel:@"Me" domain:300];
    v457[0] = MEMORY[0x1E4F143A8];
    v457[1] = 3221225472;
    v457[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_4;
    v457[3] = &unk_1E68EEC70;
    id v458 = v338;
    id v459 = v406;
    v460 = v366;
    [v51 enumerateObjectsUsingBlock:v457];
  }
  else
  {
    [v406 appendFormat:@"No Me node!!!\n"];
  }
  long long v121 = [v349 meNode];
  v341 = [v121 inferredPersonNode];

  if (!v341)
  {
    uint64_t v124 = @"No Suggested Me node.\n\n";
    goto LABEL_101;
  }
  long long v122 = [v341 localIdentifier];
  char v123 = [v336 isEqualToString:v122];

  if (v123)
  {
    uint64_t v124 = @"### Suggested Me node matches Me node.\n\n";
LABEL_101:
    [v406 appendFormat:v124];
    goto LABEL_105;
  }
  if ([v336 length]) {
    [v406 appendFormat:@"### Suggested Me node mismatch.\n\n"];
  }
  long long v125 = [v341 localIdentifier];
  long long v126 = [v341 name];
  long long v127 = [v341 contactIdentifier];
  [v406 appendFormat:@"Suggested Me node found: id:'%@', name:'%@', contact:'%@'\n\n", v125, v126, v127];

LABEL_105:
  v393 = [v366 _dateFormatter];
  [v406 appendFormat:@"Persons with age category child:\n"];
  long long v128 = [v349 personNodesIncludingMe:0];
  long long v129 = +[PGGraphPersonNode personSortDescriptors];
  long long v130 = [v128 sortedArrayUsingDescriptors:v129];

  long long v456 = 0u;
  long long v455 = 0u;
  long long v454 = 0u;
  long long v453 = 0u;
  id v361 = v130;
  uint64_t v131 = [v361 countByEnumeratingWithState:&v453 objects:v531 count:16];
  if (v131)
  {
    uint64_t v132 = *(void *)v454;
    do
    {
      for (nuint64_t n = 0; nn != v131; ++nn)
      {
        if (*(void *)v454 != v132) {
          objc_enumerationMutation(v361);
        }
        long long v134 = *(void **)(*((void *)&v453 + 1) + 8 * nn);
        if ([v134 ageCategory] == 2)
        {
          long long v135 = [v134 birthdayDate];
          if (v135)
          {
            v136 = [v393 stringFromDate:v135];
            uint64_t v137 = [v134 name];
            [v406 appendFormat:@"\t%@, with birthday:%@\n", v137, v136];
          }
          else
          {
            uint64_t v138 = [v134 name];
            v136 = (void *)v138;
            if (v138) {
              v139 = (__CFString *)v138;
            }
            else {
              v139 = @"Unnamed child";
            }
            [v406 appendFormat:@"\t%@\n", v139];
          }
        }
      }
      uint64_t v131 = [v361 countByEnumeratingWithState:&v453 objects:v531 count:16];
    }
    while (v131);
  }

  uint64_t v140 = [v406 appendString:@"\n"];
  if ((v386 & 1) == 0)
  {
    v141 = (void *)MEMORY[0x1D25FED50](v140);
    v142 = [v366 blockedFeatures];
    uint64_t v143 = [(__CFString *)v142 count];
    v144 = @"none";
    if (v143) {
      v144 = v142;
    }
    [v406 appendFormat:@"Blocked Memory Features: %@\n\n", v144];
  }
  v145 = (void *)MEMORY[0x1D25FED50](v140);
  id v146 = [v366 _stringDescriptionForPeopleEventsWithGraph:v349];
  [v406 appendFormat:@"%@\n", v146];

  v147 = (void *)MEMORY[0x1D25FED50]();
  v148 = [MEMORY[0x1E4F76C68] currentLocalDate];
  v149 = objc_opt_class();
  v150 = [v148 dateByAddingTimeInterval:604800.0];
  uint64_t v151 = [v366 serviceManager];
  v152 = [v366 locationCache];
  v153 = [v149 _calendarEventsBetweenDate:v150 andDate:v148 atLocation:0 withPersonLocalIdentifiers:0 inPhotoLibrary:0 serviceManager:v151 locationCache:v152];

  objc_msgSend(v406, "appendFormat:", @"Number of significant calendar events in the past week: %d\n\n", objc_msgSend(v153, "count"));
  v398 = (void *)MEMORY[0x1D25FED50]();
  id v404 = [v349 supersets];
  objc_msgSend(v406, "appendFormat:", @"\nSupersets: %zu\n", objc_msgSend(v404, "count"));
  v154 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalDateInterval" ascending:1];
  v530 = v154;
  v155 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v530 count:1];
  v156 = [v404 sortedArrayUsingDescriptors:v155];

  long long v452 = 0u;
  long long v451 = 0u;
  long long v450 = 0u;
  long long v449 = 0u;
  id v157 = v156;
  uint64_t v158 = [v157 countByEnumeratingWithState:&v449 objects:v529 count:16];
  if (v158)
  {
    uint64_t v159 = *(void *)v450;
    do
    {
      for (uint64_t i1 = 0; i1 != v158; ++i1)
      {
        if (*(void *)v450 != v159) {
          objc_enumerationMutation(v157);
        }
        v161 = *(void **)(*((void *)&v449 + 1) + 8 * i1);
        v162 = [v161 addressNode];
        v163 = [v162 keywordDescription];

        v164 = [v161 universalStartDate];
        v165 = [v393 stringFromDate:v164];

        v166 = [v161 universalEndDate];
        v167 = [v393 stringFromDate:v166];

        v168 = [v161 collection];
        v169 = [v168 momentNodes];
        [v406 appendFormat:@"\t%@ from %@ to %@ (%lu moments)\n", v163, v165, v167, objc_msgSend(v169, "count")];
      }
      uint64_t v158 = [v157 countByEnumeratingWithState:&v449 objects:v529 count:16];
    }
    while (v158);
  }

  v170 = [PGTitleGenerationContext alloc];
  v171 = [v366 serviceManager];
  v365 = [(PGTitleGenerationContext *)v170 initWithGraph:v349 serviceManager:v171];

  v172 = (void *)MEMORY[0x1D25FED50]();
  v173 = [v349 longTripNodes];
  v174 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  *(void *)long long buf = v174;
  v175 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
  *(void *)&uint8_t buf[8] = v175;
  v176 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  *(void *)&uint8_t buf[16] = v176;
  v177 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

  v178 = [v173 sortedArrayUsingDescriptors:v177];

  objc_msgSend(v406, "appendFormat:", @"\nTrips: %lu\n", objc_msgSend(v178, "count"));
  v179 = [v366 _stringDescriptionForMeaningfulEvents:v178 isTrip:1 forDiagnostics:v386 titleGenerationContext:v365];
  [v406 appendFormat:@"%@\n", v179];

  v180 = (void *)MEMORY[0x1D25FED50]();
  v181 = [v349 shortTripNodes];
  v182 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  *(void *)long long buf = v182;
  v183 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
  *(void *)&uint8_t buf[8] = v183;
  v184 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  *(void *)&uint8_t buf[16] = v184;
  v185 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

  v186 = [v181 sortedArrayUsingDescriptors:v185];

  objc_msgSend(v406, "appendFormat:", @"Weekends: %lu\n", objc_msgSend(v186, "count"));
  v187 = [v366 _stringDescriptionForMeaningfulEvents:v186 isTrip:1 forDiagnostics:v386 titleGenerationContext:v365];
  [v406 appendFormat:@"%@\n", v187];

  v333 = (void *)MEMORY[0x1D25FED50]();
  v345 = +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels];
  v188 = [v349 edgesForLabel:@"MEANING" domain:700];
  contextb = [MEMORY[0x1E4F1CA60] dictionary];
  id v405 = [MEMORY[0x1E4F1CA60] dictionary];
  v378 = [MEMORY[0x1E4F1CA60] dictionary];
  v343 = [v349 meaningfulEvents];
  v376 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v343, "count"));
  v399 = [MEMORY[0x1E4F1CA60] dictionary];
  v353 = objc_alloc_init(PGEventLabelingConfiguration);
  if (+[PGEventLabelingConfiguration isEventLabelingEnabled])
  {
    v189 = [MEMORY[0x1E4F1CA80] setWithArray:v345];
    v190 = [(PGEventLabelingConfiguration *)v353 meaningLabels];
    [v189 unionSet:v190];

    uint64_t v191 = [v189 allObjects];

    v345 = (void *)v191;
  }
  long long v448 = 0u;
  long long v447 = 0u;
  long long v446 = 0u;
  long long v445 = 0u;
  id v359 = v188;
  uint64_t v192 = [v359 countByEnumeratingWithState:&v445 objects:v528 count:16];
  if (v192)
  {
    uint64_t v193 = *(void *)v446;
    do
    {
      for (uint64_t i2 = 0; i2 != v192; ++i2)
      {
        if (*(void *)v446 != v193) {
          objc_enumerationMutation(v359);
        }
        v195 = *(void **)(*((void *)&v445 + 1) + 8 * i2);
        v196 = [v195 meaningLabel];
        v197 = [v195 sourceNode];
        if (!+[PGEventLabelingConfiguration isEventLabelingEnabled](PGEventLabelingConfiguration, "isEventLabelingEnabled")|| (-[PGEventLabelingConfiguration thresholdsBy:](v353, "thresholdsBy:", v196), v198 = objc_claimAutoreleasedReturnValue(), [v198 highPrecisionThreshold], double v200 = v199, v198, objc_msgSend(v195, "confidence"), v201 >= v200))
        {
          v202 = [v197 alternativeMeaningLabels];
          int v203 = [v202 containsObject:v196];

          if (v203)
          {
            v204 = NSNumber;
            v205 = [v378 objectForKeyedSubscript:v196];
            v206 = objc_msgSend(v204, "numberWithInteger:", objc_msgSend(v205, "integerValue") + 1);
            [v378 setObject:v206 forKeyedSubscript:v196];
          }
          v207 = [v399 objectForKeyedSubscript:v196];
          BOOL v208 = v207 == 0;

          if (v208)
          {
            v209 = [MEMORY[0x1E4F1CA48] array];
            [v399 setObject:v209 forKeyedSubscript:v196];
          }
          v210 = [v399 objectForKeyedSubscript:v196];
          [v210 addObject:v197];

          [v376 addObject:v197];
        }
      }
      uint64_t v192 = [v359 countByEnumeratingWithState:&v445 objects:v528 count:16];
    }
    while (v192);
  }

  v211 = [v345 sortedArrayUsingSelector:sel_compare_];
  [v406 appendFormat:@"\nMeaningful Events: %lu events, %lu meanings\n", objc_msgSend(v343, "count"), objc_msgSend(v349, "edgesCountForLabel:domain:", @"MEANING", 700)];
  long long v443 = 0u;
  long long v444 = 0u;
  long long v441 = 0u;
  long long v442 = 0u;
  id v384 = v211;
  uint64_t v212 = [v384 countByEnumeratingWithState:&v441 objects:v527 count:16];
  if (v212)
  {
    uint64_t v213 = *(void *)v442;
    do
    {
      for (uint64_t i3 = 0; i3 != v212; ++i3)
      {
        if (*(void *)v442 != v213) {
          objc_enumerationMutation(v384);
        }
        uint64_t v215 = *(void *)(*((void *)&v441 + 1) + 8 * i3);
        v216 = [v399 objectForKeyedSubscript:v215];
        if ([v216 count])
        {
          v217 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
          *(void *)long long buf = v217;
          v218 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
          *(void *)&uint8_t buf[8] = v218;
          v219 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
          *(void *)&uint8_t buf[16] = v219;
          v220 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

          [v216 sortUsingDescriptors:v220];
          [v406 appendFormat:@"%@: %lu\n", v215, objc_msgSend(v216, "count")];
          v221 = [v366 _stringDescriptionForMeaningfulEvents:v216 isTrip:0 forDiagnostics:v386 titleGenerationContext:v365];
          [v406 appendFormat:@"%@\n", v221];
        }
        v222 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v216, "count"));
        [contextb setObject:v222 forKeyedSubscript:v215];
      }
      uint64_t v212 = [v384 countByEnumeratingWithState:&v441 objects:v527 count:16];
    }
    while (v212);
  }

  unint64_t v223 = [v376 count];
  if (v223 < [v343 count])
  {
    v224 = [MEMORY[0x1E4F1CA48] array];
    long long v439 = 0u;
    long long v440 = 0u;
    long long v437 = 0u;
    long long v438 = 0u;
    id v225 = v343;
    uint64_t v226 = [v225 countByEnumeratingWithState:&v437 objects:v526 count:16];
    if (v226)
    {
      uint64_t v227 = *(void *)v438;
      do
      {
        for (uint64_t i4 = 0; i4 != v226; ++i4)
        {
          if (*(void *)v438 != v227) {
            objc_enumerationMutation(v225);
          }
          uint64_t v229 = *(void *)(*((void *)&v437 + 1) + 8 * i4);
          if (([v376 containsObject:v229] & 1) == 0) {
            [v224 addObject:v229];
          }
        }
        uint64_t v226 = [v225 countByEnumeratingWithState:&v437 objects:v526 count:16];
      }
      while (v226);
    }

    [v406 appendFormat:@"Other meaningful events:\n"];
    v230 = [v366 _stringDescriptionForMeaningfulEvents:v224 isTrip:0 forDiagnostics:v386 titleGenerationContext:v365];
    [v406 appendFormat:@"%@\n", v230];
  }
  objc_msgSend(v406, "appendFormat:", @"Number of alternative meanings: %lu \n", objc_msgSend(v349, "edgesCountForLabel:domain:", @"MEANING", 702));
  v370 = [MEMORY[0x1E4F1CA80] set];
  v231 = [v349 edgesForLabel:@"MEANING" domain:702];
  long long v435 = 0u;
  long long v436 = 0u;
  long long v433 = 0u;
  long long v434 = 0u;
  id v357 = v231;
  uint64_t v232 = [v357 countByEnumeratingWithState:&v433 objects:v525 count:16];
  if (v232)
  {
    uint64_t v233 = *(void *)v434;
    do
    {
      for (uint64_t i5 = 0; i5 != v232; ++i5)
      {
        if (*(void *)v434 != v233) {
          objc_enumerationMutation(v357);
        }
        v235 = *(void **)(*((void *)&v433 + 1) + 8 * i5);
        v236 = [v235 meaningLabel];
        v237 = NSNumber;
        v238 = [v405 objectForKeyedSubscript:v236];
        v239 = objc_msgSend(v237, "numberWithInteger:", objc_msgSend(v238, "integerValue") + 1);
        [v405 setObject:v239 forKeyedSubscript:v236];

        v240 = [v235 sourceNode];
        [v370 addObject:v240];
      }
      uint64_t v232 = [v357 countByEnumeratingWithState:&v433 objects:v525 count:16];
    }
    while (v232);
  }

  objc_msgSend(v406, "appendFormat:", @"Number of moments connected with alternative meanings: %lu\n", objc_msgSend(v370, "count"));
  v335 = [NSString stringWithFormat:@"%@|   A   |   B   |  A\\B  |  B\\A  |  A⋂B  |  A⋃B  |", @"Meaning (A) / Alternative (B) "];
  uint64_t v241 = objc_msgSend(&stru_1F283BC78, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v335, "length"), @"_", 0);
  [v406 appendFormat:@"%@\n%@\n", v335, v241];
  os_signpost_id_t spid = (void *)v241;
  long long v431 = 0u;
  long long v432 = 0u;
  long long v429 = 0u;
  long long v430 = 0u;
  id v355 = v384;
  uint64_t v242 = [v355 countByEnumeratingWithState:&v429 objects:v524 count:16];
  if (v242)
  {
    uint64_t v387 = 0;
    uint64_t v243 = 0;
    v244 = 0;
    uint64_t v245 = 0;
    uint64_t v246 = 0;
    uint64_t v247 = 0;
    uint64_t v368 = *(void *)v430;
    do
    {
      uint64_t v248 = 0;
      uint64_t v372 = v242;
      do
      {
        if (*(void *)v430 != v368) {
          objc_enumerationMutation(v355);
        }
        uint64_t v382 = v247;
        v385 = v244;
        v249 = *(void **)(*((void *)&v429 + 1) + 8 * v248);
        v250 = [contextb objectForKeyedSubscript:v249];
        uint64_t v251 = [v250 unsignedLongValue];
        uint64_t v380 = v246;
        uint64_t v252 = v243;

        v253 = [v405 objectForKeyedSubscript:v249];
        uint64_t v254 = [v253 unsignedLongValue];

        v255 = [v378 objectForKeyedSubscript:v249];
        uint64_t v256 = [v255 unsignedLongValue];

        v257 = [v249 stringByPaddingToLength:objc_msgSend(@"Meaning (A) / Alternative (B) ", "length"), @" ", 0 withString startingAtIndex];
        uint64_t v258 = v251 - v256;
        uint64_t v259 = v254 - v256;
        uint64_t v260 = v254 - v256 + v251;
        [v406 appendFormat:@"%@|%7lu|%7lu|%7lu|%7lu|%7lu|%7lu|\n", v257, v251, v254, v251 - v256, v254 - v256, v256, v260];

        v387 += v251;
        uint64_t v243 = v254 + v252;
        v244 = &v385[v256];
        uint64_t v247 = v260 + v382;
        v245 += v258;
        uint64_t v246 = v259 + v380;
        ++v248;
      }
      while (v372 != v248);
      uint64_t v242 = [v355 countByEnumeratingWithState:&v429 objects:v524 count:16];
    }
    while (v242);
  }
  else
  {
    uint64_t v387 = 0;
    uint64_t v243 = 0;
    v244 = 0;
    uint64_t v245 = 0;
    uint64_t v246 = 0;
    uint64_t v247 = 0;
  }
  uint64_t v261 = v247;

  v262 = [@"Totals" stringByPaddingToLength:objc_msgSend(@"Meaning (A) / Alternative (B) ", "length"), @" ", 0 withString startingAtIndex];
  [v406 appendFormat:@"%@\n%@|%7lu|%7lu|%7lu|%7lu|%7lu|%7lu|\n", spid, v262, v387, v243, v245, v246, v244, v261];

  v263 = (void *)MEMORY[0x1D25FED50]();
  v264 = [v349 mainUrbanCityNodes];
  objc_msgSend(v406, "appendFormat:", @"\n\nMain Urban Cities: %lu\n", objc_msgSend(v264, "count"));
  v265 = [v366 _stringDescriptionForUrbanCities:v264];
  [v406 appendFormat:@"%@\n", v265];

  v266 = (void *)MEMORY[0x1D25FED50]();
  v267 = [v349 interestingCityNodes];
  v268 = [v267 set];
  v269 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
  v523 = v269;
  v270 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v523 count:1];
  v271 = [v268 sortedArrayUsingDescriptors:v270];

  objc_msgSend(v406, "appendFormat:", @"Interesting Cities: %lu\n", objc_msgSend(v271, "count"));
  v272 = [v366 _stringDescriptionForInterestingCities:v271];
  [v406 appendFormat:@"%@\n", v272];

  v273 = (void *)MEMORY[0x1D25FED50]();
  v274 = [v349 edgesForLabel:@"CELEBRATING" domain:401];
  v275 = [v274 valueForKeyPath:@"targetNode.name"];
  v276 = [v275 allObjects];

  objc_msgSend(v406, "appendFormat:", @"Celebrated Events: %lu\n", objc_msgSend(v276, "count"));
  if ([v276 count])
  {
    v277 = [v276 componentsJoinedByString:@", "];
    [v406 appendFormat:@"%@\n", v277];
  }
  v278 = (void *)MEMORY[0x1D25FED50]();
  v279 = [v366 _stringDescriptionForPetsWithGraph:v349];
  [v406 appendString:v279];

  v280 = (void *)MEMORY[0x1D25FED50]();
  v281 = [v366 _stringDescriptionForMusicWithGraph:v349 summaryOnly:1];
  [v406 appendString:v281];

  v282 = (void *)MEMORY[0x1D25FED50]();
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = v21;
  *(void *)&unsigned char buf[24] = 0;
  mach_timebase_info info = 0;
  p_mach_timebase_info info = &info;
  uint64_t v427 = v21;
  uint64_t v428 = 0;
  v283 = objc_alloc_init(PGNeighborScoreComputer);
  v284 = [v349 momentNodes];
  v421[0] = MEMORY[0x1E4F143A8];
  v421[1] = 3221225472;
  v421[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_5;
  v421[3] = &unk_1E68EB6C8;
  v285 = v283;
  v422 = v285;
  v423 = buf;
  v424 = &info;
  [v284 enumerateNodesUsingBlock:v421];

  objc_msgSend(v406, "appendFormat:", @"[Neighbor] Interesting Events: %lu\n", *(void *)(*(void *)&buf[8] + 24));
  objc_msgSend(v406, "appendFormat:", @"[Neighbor] Highly Interesting Events: %lu\n", *(void *)&p_info[3]);

  _Block_object_dispose(&info, 8);
  _Block_object_dispose(buf, 8);
  v286 = (void *)MEMORY[0x1D25FED50]();
  v287 = [MEMORY[0x1E4F1CA48] array];
  v419[0] = MEMORY[0x1E4F143A8];
  v419[1] = 3221225472;
  v419[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_6;
  v419[3] = &unk_1E68EF008;
  id v288 = v287;
  id v420 = v288;
  [v349 enumerateNodesWithLabel:@"Area" domain:201 usingBlock:v419];
  [v288 sortUsingSelector:sel_localizedCompare_];
  uint64_t v289 = [v288 count];
  v290 = [v288 componentsJoinedByString:@"\n"];
  [v406 appendFormat:@"\nBlocked AOIs: %lu %@", v289, v290];

  objc_msgSend(v406, "appendFormat:", @"\nNumber of Default Addresses: %lu", v516[3]);
  objc_msgSend(v406, "appendFormat:", @"\nNumber of Improved Addresses: %lu", v512[3]);
  objc_msgSend(v406, "appendFormat:", @"\nNumber of Coarse Addresses: %lu", v508[3]);
  v291 = (void *)MEMORY[0x1D25FED50](objc_msgSend(v406, "appendFormat:", @"\nNumber of Ocean Addresses: %lu (far away from projection: %lu)", v504[3], v500[3]));
  v292 = [v366 _stringDescriptionForDisambiguatedLocationsWithGraph:v349];
  [v406 appendString:v292];

  v293 = (void *)MEMORY[0x1D25FED50]();
  v294 = [v366 _stringDescriptionForDisambiguatedPOIsInMomentNodes:obj];
  [v406 appendString:v294];

  v295 = (void *)MEMORY[0x1D25FED50]();
  v296 = [v366 _stringDescriptionForBusinessItemsWithGraph:v349 includingInferredThroughPublicEvents:0 verbose:v340];
  [v406 appendString:v296];

  v297 = (void *)MEMORY[0x1D25FED50]();
  v298 = [v366 _stringDescriptionForPublicEventsWithGraph:v349 verbose:v340];
  [v406 appendString:v298];

  v299 = (void *)MEMORY[0x1D25FED50]();
  [v406 appendFormat:@"\n\nPlaces:\n"];
  v300 = [MEMORY[0x1E4F1CA48] array];
  v417[0] = MEMORY[0x1E4F143A8];
  v417[1] = 3221225472;
  v417[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_7;
  v417[3] = &unk_1E68ED8A8;
  id v301 = v300;
  id v418 = v301;
  [v349 enumerateNodesWithLabel:0 domain:501 usingBlock:v417];
  v302 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"label" ascending:1];
  v521 = v302;
  v303 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v521 count:1];
  [v301 sortUsingDescriptors:v303];

  v415[0] = MEMORY[0x1E4F143A8];
  v415[1] = 3221225472;
  v415[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_8;
  v415[3] = &unk_1E68EB6F0;
  id v304 = v406;
  id v416 = v304;
  [v301 enumerateObjectsUsingBlock:v415];
  [v304 appendString:@"\n"];
  v305 = [MEMORY[0x1E4F1CA48] array];
  v413[0] = MEMORY[0x1E4F143A8];
  v413[1] = 3221225472;
  v413[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_9;
  v413[3] = &unk_1E68ED8D0;
  id v306 = v305;
  id v414 = v306;
  [v349 enumerateNodesWithLabel:0 domain:502 usingBlock:v413];
  v307 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"label" ascending:1];
  v520 = v307;
  v308 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v520 count:1];
  [v306 sortUsingDescriptors:v308];

  v411[0] = MEMORY[0x1E4F143A8];
  v411[1] = 3221225472;
  v411[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_10;
  v411[3] = &unk_1E68EB718;
  id v309 = v304;
  id v412 = v309;
  [v306 enumerateObjectsUsingBlock:v411];

  v310 = (void *)MEMORY[0x1D25FED50]();
  [v309 appendFormat:@"\n\nScene:\n"];
  v311 = +[PGGraphNodeCollection nodesInGraph:v349];
  v312 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"label" ascending:1];
  v519 = v312;
  v313 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v519 count:1];
  v314 = [v311 sortedArrayUsingDescriptors:v313];

  v409[0] = MEMORY[0x1E4F143A8];
  v409[1] = 3221225472;
  v409[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_11;
  v409[3] = &unk_1E68EB740;
  id v315 = v309;
  id v410 = v315;
  [v314 enumerateObjectsUsingBlock:v409];
  v316 = +[PGGraphNodeCollection nodesInGraph:v349];
  objc_msgSend(v315, "appendFormat:", @"\n\nVisual Lookup Scenes: %lu \n", objc_msgSend(v316, "count"));
  v407[0] = MEMORY[0x1E4F143A8];
  v407[1] = 3221225472;
  v407[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_12;
  v407[3] = &unk_1E68EB768;
  id v317 = v315;
  id v408 = v317;
  [v316 enumerateNodesUsingBlock:v407];

  [v317 appendFormat:@"\n\nGraph Description:\n%@", v349];
  id v318 = v317;

  _Block_object_dispose(&v499, 8);
  _Block_object_dispose(&v503, 8);
  _Block_object_dispose(&v507, 8);
  _Block_object_dispose(&v511, 8);
  _Block_object_dispose(&v515, 8);

  return v318;
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v7 = a2;
  if (a3) {
    [v7 clsContentScore];
  }
  else {
    [v7 curationScore];
  }
  if (v5 >= *MEMORY[0x1E4F8E730])
  {
    uint64_t v6 = a1 + 32;
  }
  else if (v5 >= *MEMORY[0x1E4F8E738])
  {
    uint64_t v6 = a1 + 40;
  }
  else if (v5 >= *MEMORY[0x1E4F8E748])
  {
    uint64_t v6 = a1 + 48;
  }
  else if (v5 <= *MEMORY[0x1E4F8E750])
  {
    uint64_t v6 = a1 + 56;
  }
  else
  {
    uint64_t v6 = a1 + 64;
  }
  ++*(void *)(*(void *)(*(void *)v6 + 8) + 24);
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_438(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  switch([v6 locationMode])
  {
    case 0:
      uint64_t v7 = a1[4];
      goto LABEL_7;
    case 1:
      uint64_t v7 = a1[5];
      goto LABEL_7;
    case 2:
      uint64_t v7 = a1[6];
      goto LABEL_7;
    case 3:
      ++*(void *)(*(void *)(a1[7] + 8) + 24);
      [v6 coordinate];
      [v5 photoCoordinate];
      CLLocationCoordinate2DGetDistanceFrom();
      if (v8 != 0.0) {
        goto LABEL_8;
      }
      uint64_t v7 = a1[8];
LABEL_7:
      ++*(void *)(*(void *)(v7 + 8) + 24);
LABEL_8:

      return;
    default:
      goto LABEL_8;
  }
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  [v2 addObject:v3];
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  [v2 addObject:v3];
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isSameNodeAsNode:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 48) _stringDescriptionForMeNode:v5];
    [v3 appendFormat:@"### Additional %@", v4];
  }
}

uint64_t __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) neighborScoreWithMomentNode:a2];
  if (v4 > 0.43) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  if (v4 > 0.6) {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  return result;
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_6(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 isBlocked])
  {
    id v3 = *(void **)(a1 + 32);
    double v4 = NSString;
    id v5 = [v7 name];
    id v6 = [v4 stringWithFormat:@"- %@", v5];
    [v3 addObject:v6];
  }
}

uint64_t __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 label];
  uint64_t v4 = [v3 edgesCount];

  [v2 appendFormat:@"[POI] Number of %@: %lu\n", v5, v4];
}

uint64_t __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 label];
  uint64_t v4 = [v3 edgesCount];

  [v2 appendFormat:@"[ROI] Number of %@: %lu\n", v5, v4];
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 edgesForLabel:@"SCENE" domain:600];
  uint64_t v16 = [v3 count];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v7 += [v13 numberOfAssets];
        v8 += [v13 numberOfHighConfidenceAssets];
        v9 += [v13 numberOfSearchConfidenceAssets];
        v10 += [v13 numberOfDominantSceneAssets];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }

  int v14 = *(void **)(a1 + 32);
  uint64_t v15 = [v2 label];
  [v14 appendFormat:@"[Scene] Number of %@: %lu, all assets %lu, high conf. assets %lu, search conf. assets %lu, dominant scene assets %lu\n", v15, v16, v7, v8, v9, v10];
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 name];
  uint64_t v4 = [v3 inEdgesCount];

  [v2 appendFormat:@"[Visual Lookup Scene]: %@, linked moments:%lu \n", v5, v4];
}

- (id)statisticsWithTypeStrings:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    uint64_t v8 = 2;
    goto LABEL_64;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:buf count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v22 = v4;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v11 isEqualToString:@"default"]) {
          v8 |= 2uLL;
        }
        v8 |= [v11 isEqualToString:@"diagnostics"];
        if ([v11 isEqualToString:@"verbose"]) {
          v8 |= 4uLL;
        }
        if ([v11 isEqualToString:@"mood"]) {
          v8 |= 8uLL;
        }
        if ([v11 isEqualToString:@"title"]) {
          v8 |= 0x10uLL;
        }
        if ([v11 isEqualToString:@"highlighttitle"]) {
          v8 |= 0x1000000uLL;
        }
        if ([v11 isEqualToString:@"mobility"]) {
          v8 |= 0x20uLL;
        }
        if ([v11 isEqualToString:@"interesting"]) {
          v8 |= 0x40uLL;
        }
        if ([v11 isEqualToString:@"partofday"]) {
          v8 |= 0x80uLL;
        }
        if ([v11 isEqualToString:@"highlightestimates"]) {
          v8 |= 0x100uLL;
        }
        if ([v11 isEqualToString:@"relationships"]) {
          v8 |= 0x800uLL;
        }
        if ([v11 isEqualToString:@"relationshipsdebug"]) {
          v8 |= 0x1000uLL;
        }
        if ([v11 isEqualToString:@"dayofweek"]) {
          v8 |= 0x8000uLL;
        }
        if ([v11 isEqualToString:@"publicevents"]) {
          v8 |= 0x2000uLL;
        }
        if ([v11 isEqualToString:@"businessitems"]) {
          v8 |= 0x4000uLL;
        }
        if ([v11 isEqualToString:@"poi"]) {
          v8 |= 0x2000000uLL;
        }
        if ([v11 isEqualToString:@"locations"]) {
          v8 |= 0x10000uLL;
        }
        if ([v11 isEqualToString:@"languages"]) {
          v8 |= 0x8000000uLL;
        }
        if ([v11 isEqualToString:@"pets"]) {
          v8 |= 0x20000uLL;
        }
        if ([v11 isEqualToString:@"behavioral"]) {
          v8 |= 0x400000uLL;
        }
        if ([v11 isEqualToString:@"music"]) {
          v8 |= 0x200000uLL;
        }
        if ([v11 isEqualToString:@"domainlabelcounts"]) {
          v8 |= 0x800000uLL;
        }
        if ([v11 isEqualToString:@"peopleattributes"]) {
          v8 |= 0x4000000uLL;
        }
        if ([v11 isEqualToString:@"socialgroups"]) {
          v8 |= 0x10000000uLL;
        }
        if ([v11 isEqualToString:@"socialgroupsdebug"]) {
          v8 |= 0x20000000uLL;
        }
        if ([v11 isEqualToString:@"sharedlibrary"]) {
          v8 |= 0x40000000uLL;
        }
        if ([v11 isEqualToString:@"entityTags"]) {
          v8 |= 0xFFFFFFFF80000000;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:buf count:16];
    }
    while (v7);

    if (v8 == 4)
    {
      uint64_t v8 = 6;
      id v4 = v22;
LABEL_64:

LABEL_65:
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v13 = [MEMORY[0x1E4F28E78] string];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      void v23[2] = __46__PGManager_Debug__statisticsWithTypeStrings___block_invoke;
      v23[3] = &unk_1E68EB600;
      id v14 = v13;
      uint64_t v25 = self;
      uint64_t v26 = v8;
      id v24 = v14;
      [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v23];
      double v15 = CFAbsoluteTimeGetCurrent();
      uint64_t v16 = +[PGLogging sharedLogging];
      unint64_t v17 = [v16 loggingConnection];

      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134217984;
        double v32 = (v15 - Current) * 1000.0;
        _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "Generating statistics took %.2f ms", buf, 0xCu);
      }

      long long v18 = v14;
      long long v19 = (__CFString *)v18;
      goto LABEL_73;
    }

    id v4 = v22;
    if (v8) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  long long v20 = +[PGLogging sharedLogging];
  long long v18 = [v20 loggingConnection];

  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    double v32 = *(double *)&v5;
    _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "No valid type specified for statistics. Input: \"%@\"", buf, 0xCu);
  }
  long long v19 = &stru_1F283BC78;
LABEL_73:

  return v19;
}

void __46__PGManager_Debug__statisticsWithTypeStrings___block_invoke(uint64_t a1, void *a2)
{
  id v37 = [a2 graph];
  if (!v37)
  {
    [*(id *)(a1 + 32) setString:@"Graph is nil. Please retry to analyze your library."];
    goto LABEL_32;
  }
  unint64_t v3 = *(void *)(a1 + 48);
  id v4 = [PGTitleGenerationContext alloc];
  id v5 = [*(id *)(a1 + 40) serviceManager];
  uint64_t v6 = [(PGTitleGenerationContext *)v4 initWithGraph:v37 serviceManager:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F8E768]);
  uint64_t v8 = [*(id *)(a1 + 40) photoLibrary];
  uint64_t v9 = (void *)[v7 initWithPhotoLibrary:v8];

  if ((v3 & 3) != 0)
  {
    uint64_t v10 = [*(id *)(a1 + 40) _defaultStatisticsWithGraph:v37 verbose:(v3 >> 2) & 1 forDiagnostics:v3 & 1];
    [*(id *)(a1 + 32) appendString:v10];
  }
  if ((v3 & 8) != 0)
  {
    uint64_t v13 = [*(id *)(a1 + 40) _moodStatisticsWithGraph:v37];
    [*(id *)(a1 + 32) appendString:v13];

    if ((v3 & 0x10) == 0)
    {
LABEL_6:
      if ((v3 & 0x1000000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_37;
    }
  }
  else if ((v3 & 0x10) == 0)
  {
    goto LABEL_6;
  }
  id v14 = [*(id *)(a1 + 40) _titleStatisticsWithGraph:v37 titleGenerationContext:v6];
  [*(id *)(a1 + 32) appendString:v14];

  if ((v3 & 0x1000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  double v15 = [*(id *)(a1 + 40) _highlightTitleStatisticsWithGraph:v37 titleGenerationContext:v6];
  [*(id *)(a1 + 32) appendString:v15];

  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v16 = [*(id *)(a1 + 40) _mobilityStatisticsWithGraph:v37];
  [*(id *)(a1 + 32) appendString:v16];

  if ((v3 & 0x40) == 0)
  {
LABEL_9:
    if ((v3 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  unint64_t v17 = [*(id *)(a1 + 40) _interestingStatisticsWithGraph:v37];
  [*(id *)(a1 + 32) appendString:v17];

  if ((v3 & 0x80) == 0)
  {
LABEL_10:
    if ((v3 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  long long v18 = [*(id *)(a1 + 40) _partOfDayStatisticsWithGraph:v37 titleGenerationContext:v6];
  [*(id *)(a1 + 32) appendString:v18];

  if ((v3 & 0x100) == 0)
  {
LABEL_11:
    if ((v3 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  long long v19 = [*(id *)(a1 + 40) _highlightEstimatesStatisticsWithCurationContext:v9];
  [*(id *)(a1 + 32) appendString:v19];

  if ((v3 & 0x800) == 0)
  {
LABEL_12:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  long long v20 = [*(id *)(a1 + 40) _peopleRelationshipsStatisticsWithGraph:v37 includingDebugInfo:0];
  [*(id *)(a1 + 32) appendString:v20];

  if ((v3 & 0x1000) == 0)
  {
LABEL_13:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  long long v21 = [*(id *)(a1 + 40) _peopleRelationshipsStatisticsWithGraph:v37 includingDebugInfo:1];
  [*(id *)(a1 + 32) appendString:v21];

  if ((v3 & 0x8000) == 0)
  {
LABEL_14:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  id v22 = [*(id *)(a1 + 40) _dayOfWeekStatisticsWithGraph:v37];
  [*(id *)(a1 + 32) appendString:v22];

  if ((v3 & 0x2000) == 0)
  {
LABEL_15:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v23 = [*(id *)(a1 + 40) _stringDescriptionForPublicEventsWithGraph:v37 verbose:1];
  [*(id *)(a1 + 32) appendString:v23];

  if ((v3 & 0x4000) == 0)
  {
LABEL_16:
    if ((v3 & 0x2000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  id v24 = [*(id *)(a1 + 40) _stringDescriptionForBusinessItemsWithGraph:v37 includingInferredThroughPublicEvents:1 verbose:1];
  [*(id *)(a1 + 32) appendString:v24];

  if ((v3 & 0x2000000) == 0)
  {
LABEL_17:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v25 = [*(id *)(a1 + 40) _poiStatisticsWithGraph:v37];
  [*(id *)(a1 + 32) appendString:v25];

  if ((v3 & 0x10000) == 0)
  {
LABEL_18:
    if ((v3 & 0x8000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v26 = [*(id *)(a1 + 40) _stringDescriptionForLocationsWithGraph:v37];
  [*(id *)(a1 + 32) appendString:v26];

  if ((v3 & 0x8000000) == 0)
  {
LABEL_19:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  long long v27 = [*(id *)(a1 + 40) _stringDescriptionForLanguagesWithGraph:v37];
  [*(id *)(a1 + 32) appendString:v27];

  if ((v3 & 0x20000) == 0)
  {
LABEL_20:
    if ((v3 & 0x400000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  long long v28 = [*(id *)(a1 + 40) _stringDescriptionForPetsWithGraph:v37];
  [*(id *)(a1 + 32) appendString:v28];

  if ((v3 & 0x400000) == 0)
  {
LABEL_21:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  long long v29 = [*(id *)(a1 + 40) _behavioralStatisticsWithGraph:v37];
  [*(id *)(a1 + 32) appendString:v29];

  if ((v3 & 0x200000) == 0)
  {
LABEL_22:
    if ((v3 & 0x800000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  long long v30 = [*(id *)(a1 + 40) _stringDescriptionForMusicWithGraph:v37 summaryOnly:0];
  [*(id *)(a1 + 32) appendString:v30];

  if ((v3 & 0x800000) == 0)
  {
LABEL_23:
    if ((v3 & 0x4000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  unsigned int v31 = [*(id *)(a1 + 40) _domainLabelCountStatisticsWithGraph:v37];
  [*(id *)(a1 + 32) appendString:v31];

  if ((v3 & 0x4000000) == 0)
  {
LABEL_24:
    if ((v3 & 0x10000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  double v32 = [*(id *)(a1 + 40) _peopleVisionAgeStatisticsWithGraph:v37];
  uint64_t v33 = [*(id *)(a1 + 40) _peopleVisionBiologicalSexStatisticsWithGraph:v37];
  id v34 = [*(id *)(a1 + 40) _peopleNameBiologicalSexStatisticsWithGraph:v37];
  [*(id *)(a1 + 32) appendString:v32];
  [*(id *)(a1 + 32) appendString:@"\n"];
  [*(id *)(a1 + 32) appendString:v33];
  [*(id *)(a1 + 32) appendString:@"\n"];
  [*(id *)(a1 + 32) appendString:v34];

  if ((v3 & 0x10000000) == 0)
  {
LABEL_25:
    if ((v3 & 0x20000000) == 0) {
      goto LABEL_26;
    }
LABEL_56:
    CLLocationCoordinate2D v36 = [*(id *)(a1 + 40) _socialGroupsDebugStatistics:v37];
    [*(id *)(a1 + 32) appendString:v36];

    if ((v3 & 0x40000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_55:
  uint64_t v35 = [*(id *)(a1 + 40) _socialGroupsStatistics:v37];
  [*(id *)(a1 + 32) appendString:v35];

  if ((v3 & 0x20000000) != 0) {
    goto LABEL_56;
  }
LABEL_26:
  if ((v3 & 0x40000000) != 0)
  {
LABEL_27:
    uint64_t v11 = [*(id *)(a1 + 40) _sharedLibraryStatistics:v37];
    [*(id *)(a1 + 32) appendString:v11];
  }
LABEL_28:
  if (v3 >> 31)
  {
    uint64_t v12 = [*(id *)(a1 + 40) _entityTagsStatistics:v37];
    [*(id *)(a1 + 32) appendString:v12];
  }
LABEL_32:
}

- (id)graphAndAlgorithmVersionsWithGraph:(id)a3
{
  unint64_t v3 = (objc_class *)MEMORY[0x1E4F28E78];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 infoNode];
  id v7 = [v6 creationDate];
  [v5 appendFormat:@"Graph Date creation: %@\n", v7];

  uint64_t v8 = [v4 version];
  objc_msgSend(v5, "appendFormat:", @"Graph Version: %lu\n", v8);
  objc_msgSend(v5, "appendFormat:", @"Graph Curation Algorithms Version: %lu\n", objc_msgSend(v6, "curationAlgorithmsVersion"));
  objc_msgSend(v5, "appendFormat:", @"Graph Memories Algorithms Version: %lu\n", objc_msgSend(v6, "memoriesAlgorithmsVersion"));
  objc_msgSend(v5, "appendFormat:", @"Graph Meanings Algorithms Version: %lu\n", objc_msgSend(v6, "meaningAlgorithmsVersion"));
  objc_msgSend(v5, "appendFormat:", @"Graph EventLabelingV2 Model Version: %ld\n", objc_msgSend(v6, "eventLabelingV2ModelVersion"));
  objc_msgSend(v5, "appendFormat:", @"Graph Personal Traits Entity Names Version: %ld\n", objc_msgSend(v6, "personalTraitsEntityNamesVersion"));
  objc_msgSend(v5, "appendFormat:", @"Graph Memories Algorithms Version: %lu\n", objc_msgSend(v6, "memoriesAlgorithmsVersion"));

  return v5;
}

- (unsigned)identifierForMoment:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = *MEMORY[0x1E4F71F40];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__PGManager_Debug__identifierForMoment___block_invoke;
  v7[3] = &unk_1E68F0A28;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v7];
  LODWORD(self) = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return self;
}

void __40__PGManager_Debug__identifierForMoment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [a2 graph];
  id v4 = [v3 momentNodeForMoment:*(void *)(a1 + 32)];

  if (v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = [v4 identifier];
  }
  else
  {
    id v5 = +[PGLogging sharedLogging];
    uint64_t v6 = [v5 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "Cannot find node for moment: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)UUIDForMoment:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__52615;
  double v15 = __Block_byref_object_dispose__52616;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__PGManager_Debug__UUIDForMoment___block_invoke;
  v8[3] = &unk_1E68F0A28;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __34__PGManager_Debug__UUIDForMoment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [a2 graph];
  id v4 = [v3 momentNodeForMoment:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v5 = [v4 UUID];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    int v8 = +[PGLogging sharedLogging];
    id v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "Cannot find node for moment: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (id)keywordsForAsset:(id)a3 relatedType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  unint64_t v17 = __Block_byref_object_copy__52615;
  long long v18 = __Block_byref_object_dispose__52616;
  id v19 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __49__PGManager_Debug__keywordsForAsset_relatedType___block_invoke;
  void v10[3] = &unk_1E68EB5D8;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = &v14;
  unint64_t v13 = a4;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __49__PGManager_Debug__keywordsForAsset_relatedType___block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  unint64_t v3 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:a1[4] withType:3 options:0];
  if ([v3 count])
  {
    id v4 = [v13 graph];
    uint64_t v5 = a1[4];
    id v6 = [v3 firstObject];
    id v7 = +[PGRelatedComputer searchNodesInGraph:v4 forAsset:v5 inMoment:v6];

    id v8 = [v3 firstObject];
    id v9 = [v4 momentNodeForMoment:v8];

    uint64_t v10 = [v9 keywordsForRelatedType:a1[6] focusOnNodes:v7];
    uint64_t v11 = *(void *)(a1[5] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)keywordsForMomentNodeName:(id)a3 relatedType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__52615;
  id v19 = __Block_byref_object_dispose__52616;
  id v20 = 0;
  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__PGManager_Debug__keywordsForMomentNodeName_relatedType___block_invoke;
    v11[3] = &unk_1E68EB5D8;
    id v12 = v6;
    id v13 = &v15;
    unint64_t v14 = a4;
    [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v11];
    id v8 = v12;
  }
  else
  {
    id v8 = 0;
    id v20 = (id)MEMORY[0x1E4F1CC08];
  }

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __58__PGManager_Debug__keywordsForMomentNodeName_relatedType___block_invoke(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [a2 graph];
  uint64_t v4 = a1[4];
  uint64_t v10 = @"name";
  v11[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v6 = [v3 anyNodeForLabel:@"Moment" domain:100 properties:v5];

  uint64_t v7 = [v6 keywordsForRelatedType:a1[6] focusOnNodes:0];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)keywordsForAssetCollection:(id)a3 relatedType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__52615;
  id v19 = __Block_byref_object_dispose__52616;
  id v20 = 0;
  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __59__PGManager_Debug__keywordsForAssetCollection_relatedType___block_invoke;
    v11[3] = &unk_1E68EB5D8;
    id v12 = v6;
    id v13 = &v15;
    unint64_t v14 = a4;
    [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:v11];
    uint64_t v8 = v12;
  }
  else
  {
    uint64_t v8 = 0;
    id v20 = (id)MEMORY[0x1E4F1CC08];
  }

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __59__PGManager_Debug__keywordsForAssetCollection_relatedType___block_invoke(void *a1, void *a2)
{
  unint64_t v3 = [a2 graph];
  uint64_t v4 = [v3 eventNodeForAssetCollection:a1[4]];
  id v8 = [v4 relatableEvent];

  uint64_t v5 = [v8 keywordsForRelatedType:a1[6] focusOnNodes:0];
  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

+ (id)_calendarEventsBetweenDate:(id)a3 andDate:(id)a4 atLocation:(id)a5 withPersonLocalIdentifiers:(id)a6 inPhotoLibrary:(id)a7 serviceManager:(id)a8 locationCache:(id)a9
{
  void v39[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (!v19) {
    __assert_rtn("+[PGManager(Debug) _calendarEventsBetweenDate:andDate:atLocation:withPersonLocalIdentifiers:inPhotoLibrary:serviceManager:locationCache:]", "PGManager+Debug.m", 4200, "serviceManager != nil");
  }
  long long v21 = v20;
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F76C70]) initWithServiceManager:v19];
  uint64_t v23 = (void *)MEMORY[0x1E4F76CD0];
  uint64_t v35 = v15;
  CLLocationCoordinate2D v36 = v14;
  v39[0] = v14;
  v39[1] = v15;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  uint64_t v25 = [v23 clueWithDates:v24 serviceManager:v19];

  uint64_t v38 = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  [v22 mergeClues:v26];

  if (v16)
  {
    long long v27 = [v21 fetchPlacemarkForLocation:v16 withQueryAccuracy:*MEMORY[0x1E4F1E718]];
    if (v27)
    {
      long long v28 = [MEMORY[0x1E4F76CC0] clueWithLocation:v27 locationCache:v21];
      id v37 = v28;
      long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      [v22 mergeClues:v29];
    }
    else
    {
      long long v28 = 0;
    }

    if (!v17) {
      goto LABEL_11;
    }
  }
  else
  {
    long long v28 = 0;
    if (!v17) {
      goto LABEL_11;
    }
  }
  uint64_t v30 = [MEMORY[0x1E4F76CC8] cluesWithPersonLocalIdentifiers:v17 inPhotoLibrary:v18 serviceManager:v19];
  if (v30)
  {
    unsigned int v31 = (void *)v30;
    [v22 mergeClues:v30];

LABEL_12:
    uint64_t v32 = [v19 eventsForClueCollection:v22];
    goto LABEL_14;
  }
LABEL_11:
  if (v28) {
    goto LABEL_12;
  }
  uint64_t v32 = [v25 events];
LABEL_14:
  uint64_t v33 = (void *)v32;

  return v33;
}

+ (id)exportableDictionaryFromKeywords:(id)a3
{
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  uint64_t v5 = [v3 dictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__PGManager_Debug__exportableDictionaryFromKeywords___block_invoke;
  v8[3] = &unk_1E68EB5B0;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __53__PGManager_Debug__exportableDictionaryFromKeywords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [a2 unsignedIntegerValue];
  if (v5 > 31)
  {
    if (v5 > 63)
    {
      if (v5 == 64)
      {
        id v6 = @"Diversity";
      }
      else
      {
        if (v5 != 128) {
          goto LABEL_18;
        }
        id v6 = @"Related";
      }
    }
    else if (v5 == 32)
    {
      id v6 = @"Scene";
    }
    else
    {
      if (v5 != 63) {
        goto LABEL_18;
      }
      id v6 = @"Any";
    }
  }
  else
  {
    id v6 = @"People";
    switch(v5)
    {
      case 1:
        break;
      case 2:
        id v6 = @"Time";
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_18;
      case 4:
        id v6 = @"Location";
        break;
      case 8:
        id v6 = @"Event";
        break;
      default:
        if (v5 != 16) {
          goto LABEL_18;
        }
        id v6 = @"Place";
        break;
    }
  }
  [*(id *)(a1 + 32) setObject:v7 forKey:v6];
LABEL_18:
}

- (id)performerIdentifiersForMomentUUIDs:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__67168;
  id v18 = __Block_byref_object_dispose__67169;
  id v19 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __62__PGManager_PublicEvents__performerIdentifiersForMomentUUIDs___block_invoke;
  uint64_t v11 = &unk_1E68F0A28;
  id v5 = v4;
  id v12 = v5;
  id v13 = &v14;
  [(PGManager *)self performSynchronousConcurrentGraphReadUsingBlock:&v8];
  id v6 = objc_msgSend((id)v15[5], "allObjects", v8, v9, v10, v11);

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __62__PGManager_PublicEvents__performerIdentifiersForMomentUUIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [a2 graph];
  id v10 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:v3 inGraph:v4];

  id v5 = [v10 publicEventNodes];
  id v6 = [v5 performerNodes];
  uint64_t v7 = [v6 performerIdentifiers];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

@end