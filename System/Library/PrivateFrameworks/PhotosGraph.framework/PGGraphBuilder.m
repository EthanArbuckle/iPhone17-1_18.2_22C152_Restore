@interface PGGraphBuilder
+ (BOOL)isSharedLibraryEnabledForLibrary:(id)a3;
+ (double)topTierAestheticScoreForRatio:(double)a3 inPhotoLibrary:(id)a4;
+ (id)expandedRelationshipLabelsForRelationship:(unint64_t)a3;
+ (id)memoryLabelForCategory:(unint64_t)a3;
+ (id)reducedRelationshipLabelForRelationshipLabels:(id)a3;
+ (id)sharedLibraryParticipantsForLibrary:(id)a3;
+ (unint64_t)memoryCategoryForLabel:(id)a3;
+ (unsigned)edgeDomainForMeaningNodeLabel:(id)a3 isV1Algorithm:(BOOL)a4;
+ (void)prepareGraphForRebuild:(id)a3;
+ (void)setLastIncrementalUpdateInvocationDate:(id)a3 inGraph:(id)a4;
- (BOOL)_shouldUpdateCurationScore:(double)a3 withNewCurationScore:(double)a4;
- (BOOL)isSharedLibraryEnabled;
- (BOOL)keepsExistingAssetCurationScores;
- (BOOL)shouldUpdatePersonRepresentativeAssetUUIDsWithPositiveSceneCriteria:(id)a3 actionValueString:(id)a4 assetIsPassingSceneCriteria:(BOOL)a5 personLocalIdentifierIsDoingActionInAsset:(BOOL)a6;
- (CLSAOICache)aoiCache;
- (CLSCurationContext)curationContext;
- (CLSFocusPeopleCache)focusPeopleIngestCache;
- (CLSLocationCache)locationCache;
- (CLSNatureCache)natureCache;
- (CLSPOICache)poiCache;
- (CLSPublicEventManager)publicEventManager;
- (CLSROICache)roiCache;
- (CLSSceneTaxonomyHierarchy)entityNetSceneTaxonomy;
- (CLSSceneTaxonomyHierarchy)sceneTaxonomy;
- (CLSServiceManager)serviceManager;
- (NSDictionary)personActivityMeaningCriteriaDictionaryByMeaningLabel;
- (NSSet)sharedLibraryParticipants;
- (OS_os_log)loggingConnection;
- (PGCurationManager)curationManager;
- (PGEventLabelingFeaturesFileCache)eventLabelingFeaturesCache;
- (PGGraphBuilder)initWithGraph:(id)a3;
- (PGGraphBuilder)initWithGraph:(id)a3 locationCache:(id)a4;
- (PGGraphBuilder)initWithGraph:(id)a3 manager:(id)a4;
- (PGMutableGraph)graph;
- (PHPhotoLibrary)photoLibrary;
- (id)_anniversaryEventEdgeFromMomentNode:(id)a3 toPersonNode:(id)a4 confidence:(double)a5 insertIfNeededToChangeRequest:(id)a6;
- (id)_birthdayEventEdgeFromMomentNode:(id)a3 toPersonNode:(id)a4 confidence:(double)a5 insertIfNeededToChangeRequest:(id)a6;
- (id)_cleanUpMoments:(id)a3;
- (id)_findAlternativeMeaningEdgeToMeaningfulEventNode:(id)a3 withMeaningNode:(id)a4;
- (id)_findMeaningEdgeToMeaningfulEventNode:(id)a3 withMeaningNode:(id)a4;
- (id)_insertMomentNodeForClueCollection:(id)a3 feeder:(id)a4 insertedAndUpdatedPersonNodes:(id *)a5 graphUpdate:(id)a6 progressBlock:(id)a7;
- (id)_insertScene:(id)a3 fromMomentNode:(id)a4 changeRequest:(id)a5;
- (id)_momentNodesFromPersonNodes:(id)a3;
- (id)_propertiesFromIngestHighlight:(id)a3;
- (id)_removeInvalidPeopleEventEdgesFromMomentNode:(id)a3 edgesToUpsert:(id)a4;
- (id)_upsertPeopleEventEdgesFromMomentNode:(id)a3 matchingResults:(id)a4 changeRequest:(id)a5;
- (id)_uuidForPlacemark:(id)a3 forNodeLabel:(id)a4;
- (id)connectPublicEventNode:(id)a3 withBusinessNode:(id)a4;
- (id)criteriaEvaluatorsByValidPersonActivityMeaningLabelFromAssets:(id)a3 withPersonActivityMeaningCriteriaDictionaryByMeaningLabel:(id)a4;
- (id)criteriaEvaluatorsByValidPersonActivityMeaningLabelFromMomentNode:(id)a3 sceneEdges:(id)a4 withPersonActivityMeaningCriteriaDictionaryByMeaningLabel:(id)a5;
- (id)featureProviderWithProgressBlock:(id)a3;
- (id)feederForInsertingAssetCollection:(id)a3;
- (id)insertAddressNodeWithPlacemark:(id)a3 location:(id)a4 relevance:(double)a5 numberOfAssets:(unint64_t)a6 duringDateInterval:(id)a7 fromMomentNode:(id)a8;
- (id)insertAddressNodeWithProjectedPlacemark:(id)a3 atEventLocation:(id)a4 usingImprovedPlacemark:(BOOL)a5;
- (id)insertAddressNodeWithProjectedPlacemark:(id)a3 atEventLocation:(id)a4 usingImprovedPlacemark:(BOOL)a5 changeRequest:(id)a6;
- (id)insertBusiness:(id)a3 fromMomentNode:(id)a4;
- (id)insertContactSuggestion:(id)a3 forPersonNode:(id)a4 confidence:(double)a5 edgeProperties:(id)a6;
- (id)insertDateNodeHierarchyWithDateComponents:(id)a3;
- (id)insertDateNodesFromEventNode:(id)a3;
- (id)insertDateNodesFromLocalStartDate:(id)a3 toLocalEndDate:(id)a4 fromEventNode:(id)a5;
- (id)insertDateNodesWithClueCollection:(id)a3 fromMomentNode:(id)a4;
- (id)insertHighlightGroupNodeWithHighlight:(id)a3;
- (id)insertHighlightNodeWithHighlight:(id)a3;
- (id)insertHomeWorkNodeForPerson:(id)a3 personNode:(id)a4 fromAddressNodes:(id)a5;
- (id)insertLocationHierarchyWithClueCollection:(id)a3 fromMomentNode:(id)a4;
- (id)insertLocationMobilityNodeWithClueCollection:(id)a3 fromMomentNode:(id)a4;
- (id)insertLocationMobilityNodeWithMobility:(id)a3 fromMomentNode:(id)a4 confidence:(double)a5;
- (id)insertMemoryNodeFromMemory:(id)a3;
- (id)insertMemoryNodeFromMemory:(id)a3 changeRequest:(id)a4;
- (id)insertMomentNodeForClueCollection:(id)a3 feeder:(id)a4 progressBlock:(id)a5;
- (id)insertMomentNodeForMoment:(id)a3;
- (id)insertMonthDayNodeForMonth:(int64_t)a3 day:(int64_t)a4;
- (id)insertMusicAlbumNodeWithAlbumTitle:(id)a3;
- (id)insertMusicGenreNodeWithGenreName:(id)a3;
- (id)insertMusicSessionNodeWithLocalStartDate:(id)a3 localEndDate:(id)a4;
- (id)insertMusicTrackWithTrackTitle:(id)a3 durationInSeconds:(double)a4;
- (id)insertOrUpdateMePersonNodeIfNeeded;
- (id)insertOverTheYearsNode;
- (id)insertPOINodeWithPlace:(id)a3 fromMomentNode:(id)a4 hasInsertedSpecialPOIAmusementParkNode:(BOOL)a5;
- (id)insertPOIWithFeeder:(id)a3 fromMomentNode:(id)a4 isNearHomeOrWork:(BOOL)a5;
- (id)insertPartOfDayNodeWithPartOfDayName:(id)a3 fromMomentNode:(id)a4 ratio:(double)a5;
- (id)insertPartOfDayNodesWithClueCollection:(id)a3 fromMomentNode:(id)a4;
- (id)insertPeopleWithClueCollection:(id)a3 fromMomentNode:(id)a4 addressNodes:(id)a5 isNearPeopleAddress:(BOOL *)a6;
- (id)insertPersonNodeForPerson:(id)a3;
- (id)insertPersonNodeForPerson:(id)a3 fromEventNode:(id)a4 numberOfAssetsWithPerson:(unint64_t)a5 edgeWeight:(float)a6;
- (id)insertPersonNodeForPerson:(id)a3 fromMomentNode:(id)a4 numberOfAssetsWithPerson:(unint64_t)a5 importanceInMoment:(double)a6 includeMergeCandidates:(BOOL)a7;
- (id)insertPet:(id)a3;
- (id)insertPresentEdgeFromPersonNode:(id)a3 toEventNode:(id)a4 numberOfAssetsWithPerson:(unint64_t)a5 edgeWeight:(float)a6;
- (id)insertPresentEdgeFromPersonNode:(id)a3 toMomentNode:(id)a4 numberOfAssetsWithPerson:(unint64_t)a5 importance:(double)a6 includeMergeCandidates:(BOOL)a7;
- (id)insertProximityEdgeFromPersonNode:(id)a3 toMomentNode:(id)a4;
- (id)insertPublicEvent:(id)a3 fromEventNode:(id)a4;
- (id)insertROINodeWithPlace:(id)a3 fromMomentNode:(id)a4;
- (id)insertROINodeWithType:(unint64_t)a3;
- (id)insertROINodeWithType:(unint64_t)a3 fromMomentNode:(id)a4 confidence:(double)a5;
- (id)insertROIWithClueCollection:(id)a3 fromMomentNode:(id)a4;
- (id)insertScene:(id)a3 fromMomentNode:(id)a4;
- (id)insertScenesWithClueCollection:(id)a3 fromMomentNode:(id)a4;
- (id)insertSpecialPOIAmusementParkNodeFromMomentNode:(id)a3;
- (id)insertTimeNodesWithDateComponents:(id)a3 fromEventNode:(id)a4;
- (id)momentForMomentNode:(id)a3;
- (id)momentNodesWhereMeIsPresent;
- (id)nodesForHighlightsInHighlightDayGroup:(id)a3;
- (id)nodesForMomentsInHighlight:(id)a3;
- (id)updateMeNode:(id)a3 withPropertiesFromPerson:(id)a4;
- (signed)generativeMemoryCreationEligibleStateWithAsset:(id)a3;
- (unint64_t)_roiTypeForPlaceInterestType:(id)a3;
- (void)_buildSceneNodeCache;
- (void)_cleanGraphBuildCachesAfterUpdate;
- (void)_connectPersonActivityMeaningNode:(id)a3 toMomentNode:(id)a4 withChangeRequest:(id)a5 representativeAssetUUIDsByPersonLocalIdentifier:(id)a6;
- (void)_deleteMomentsWithGraphUpdate:(id)a3;
- (void)_deleteSocialGroupsWithGraphUpdate:(id)a3;
- (void)_insertEntityNetScene:(id)a3 fromMomentNode:(id)a4 withEntityNetSceneTaxonomy:(id)a5 changeRequest:(id)a6;
- (void)_insertMomentFeaturesForMomentNode:(id)a3 momentEnvelope:(id)a4 assets:(id)a5 photoLibrary:(id)a6 featureProvider:(id)a7 atMomentIngest:(BOOL)a8 curationContext:(id)a9;
- (void)_onGraphDidUpdate;
- (void)_persistCurationScores:(id)a3;
- (void)_persistGenerativeMemoryCreationEligibilityState:(id)a3;
- (void)_persistInteractionScores:(id)a3;
- (void)_registerInsertedMomentNodes:(id)a3 inGraphUpdate:(id)a4;
- (void)_removeEdgesFromMomentNode:(id)a3 forUpdateTypes:(unint64_t)a4;
- (void)_updatePersonActivitiesOfMomentNode:(id)a3 assets:(id)a4 graph:(id)a5 withPositiveSceneCriteriaByValidPersonActivityMeaningLabel:(id)a6 andActionCriteriaByValidPersonActivityMeaningLabel:(id)a7 validPersonActivityMeaningLabelByActionValue:(id)a8 changeRequest:(id)a9;
- (void)addCurationScore:(double)a3 forAsset:(id)a4;
- (void)addGenerativeMemoryCreationEligibilityState:(signed __int16)a3 forAsset:(id)a4;
- (void)addInteractionScore:(float)a3 forAsset:(id)a4;
- (void)addMeaningToMeaningfulEventNode:(id)a3 meaningLabel:(id)a4 meaningConfidence:(double)a5 meaningIsHighPrecision:(BOOL)a6 isV1Algorithm:(BOOL)a7;
- (void)addMeaningToMeaningfulEventNode:(id)a3 meaningLabel:(id)a4 meaningIsReliable:(BOOL)a5;
- (void)addParentMeaningHierarchyForMeaningNode:(id)a3;
- (void)addRelationshipEdgesBetweenPersonNode:(id)a3 andPersonNode:(id)a4 forRelationship:(unint64_t)a5 confidence:(double)a6 properties:(id)a7;
- (void)addStorytellingRelationshipsToMeNode:(id)a3 relationshipByPerson:(id)a4;
- (void)checkAndInsertPersonIsAroundEdgeFromMeNode:(id)a3 toMomentNode:(id)a4 withClueCollection:(id)a5;
- (void)clearPersonActivityMeaningCriteriaDictionaryByMeaningLabel;
- (void)computeAndPersistAssetStatistics;
- (void)computeAndPersistTopTierAestheticScores;
- (void)deleteAllMeaningNodesAndEdges;
- (void)deleteAllMemoryNodesAndEdges;
- (void)deleteAllMemoryNodesAndEdgesForMemoryCategories:(id)a3;
- (void)deleteAllMemoryNodesAndEdgesForMemoryCategory:(unint64_t)a3;
- (void)deleteHighlightsWithGraphUpdate:(id)a3;
- (void)deletePersonsWithGraphUpdate:(id)a3 progressBlock:(id)a4;
- (void)enumerateDateComponentsBetweenLocalStartDate:(id)a3 andLocalEndDate:(id)a4 usingBlock:(id)a5;
- (void)inferPersonNodeForMeNode:(id)a3;
- (void)insertAreasOfInterestForProjectedPlacemark:(id)a3 fromAddressNode:(id)a4 changeRequest:(id)a5;
- (void)insertAssetCurationScoreInLibraryForFeeder:(id)a3 progressBlock:(id)a4;
- (void)insertEntityNetScenesWithClueCollection:(id)a3 fromMomentNode:(id)a4;
- (void)insertHighlightDayGroupsWithGraphUpdate:(id)a3 progressBlock:(id)a4;
- (void)insertHighlightDaysWithGraphUpdate:(id)a3 progressBlock:(id)a4;
- (void)insertHighlightsWithGraphUpdate:(id)a3 progressBlock:(id)a4;
- (void)insertInferredEdgeFromMeNode:(id)a3 toInferredPersonNode:(id)a4;
- (void)insertLocationHierarchyWithProjectedPlacemark:(id)a3 fromAddressNode:(id)a4 changeRequest:(id)a5;
- (void)insertMeAsAuthor:(id)a3 forMomentNode:(id)a4;
- (void)insertMomentFeaturesForMomentNode:(id)a3 momentEnvelope:(id)a4 assets:(id)a5 featureProvider:(id)a6 atMomentIngest:(BOOL)a7 curationContext:(id)a8;
- (void)insertMomentFeaturesForMomentNode:(id)a3 momentEnvelope:(id)a4 photoLibrary:(id)a5 featureProvider:(id)a6 atMomentIngest:(BOOL)a7 curationContext:(id)a8;
- (void)insertMomentsWithGraphUpdate:(id)a3 progressBlock:(id)a4;
- (void)insertOwner:(id)a3 forPets:(id)a4;
- (void)insertPersonNodeForShareParticipant:(id)a3;
- (void)insertPersonNodesForShareParticipants:(id)a3;
- (void)insertShareParticipantsAsAuthors:(id)a3 forMomentNode:(id)a4;
- (void)insertStorytellingRelationshipsWithRelationshipsForPersonNodes:(id)a3 meNode:(id)a4;
- (void)performBatchUpdatesWithGraphUpdate:(id)a3 withRecipe:(id)a4 progressBlock:(id)a5;
- (void)performChangeForGraphUpdate:(id)a3 progressBlock:(id)a4;
- (void)performPostprocessingWithGraphUpdate:(id)a3 withRecipe:(id)a4 progressBlock:(id)a5;
- (void)performPreprocessingWithGraphUpdate:(id)a3 withRecipe:(id)a4 progressBlock:(id)a5;
- (void)performProcessingSteps:(id)a3 withGraphUpdate:(id)a4 progressBlock:(id)a5;
- (void)persistPendingScores;
- (void)persistPersonalHighAestheticsThreshold:(double)a3 personalGoodAestheticsThreshold:(double)a4;
- (void)prepareGraphForRebuild;
- (void)setAgeCategory:(unint64_t)a3 onPersonNodeForIdentifier:(unint64_t)a4;
- (void)setBiologicalSex:(unint64_t)a3 onPersonNodeForIdentifier:(unint64_t)a4;
- (void)setCanUseLocationDomain:(BOOL)a3;
- (void)setContactsAccessStatus:(BOOL)a3;
- (void)setCurationAlgorithmsVersion:(unint64_t)a3;
- (void)setFocusPeopleIngestCache:(id)a3;
- (void)setGeoServiceProviderID:(id)a3;
- (void)setKeepsExistingAssetCurationScores:(BOOL)a3;
- (void)setLanguageIdentifiers:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)updateHighlightNode:(id)a3 withHighlight:(id)a4;
- (void)updateHighlightsForHighlightDayGroupNode:(id)a3 nodesForHighlightsInHighlightDayGroup:(id)a4;
- (void)updateMomentsForHighlightNode:(id)a3 nodesForMomentsInHighlight:(id)a4;
- (void)updatePersonNodeForIdentifier:(unint64_t)a3 withPerson:(id)a4 forPropertyNames:(id)a5;
- (void)upsertPeopleEventEdgesOfMomentNode:(id)a3 matchingResults:(id)a4;
@end

@implementation PGGraphBuilder

- (void)checkAndInsertPersonIsAroundEdgeFromMeNode:(id)a3 toMomentNode:(id)a4 withClueCollection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v11 = [(PGGraphBuilder *)self serviceManager];
  v12 = [v10 universalDateInterval];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __103__PGGraphBuilder_Presence__checkAndInsertPersonIsAroundEdgeFromMeNode_toMomentNode_withClueCollection___block_invoke;
  v17[3] = &unk_1E68E5A38;
  id v13 = v11;
  id v18 = v13;
  id v14 = v12;
  id v19 = v14;
  v20 = &v21;
  [v10 enumerateLocationClues:v17];
  if (*((unsigned char *)v22 + 24))
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    id v16 = [[PGGraphPeoplePersonIsAroundEdge alloc] initFromPersonNode:v8 toMomentNode:v9];
    [v15 addEdge:v16];
    [(MAGraph *)self->_graph executeGraphChangeRequest:v15];
  }
  _Block_object_dispose(&v21, 8);
}

void __103__PGGraphBuilder_Presence__checkAndInsertPersonIsAroundEdgeFromMeNode_toMomentNode_withClueCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v6 = [a2 location];
  v7 = (void *)MEMORY[0x1E4F8A930];
  id v9 = v6;
  [v6 horizontalAccuracy];
  if ((objc_msgSend(v7, "horizontalAccuracyIsCoarse:") & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 32) locationOfInterestCloseToLocation:v9 inDateInterval:*(void *)(a1 + 40)];

    if (v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (signed)generativeMemoryCreationEligibleStateWithAsset:(id)a3
{
  safeAssetAnalyzer = self->_safeAssetAnalyzer;
  id v5 = a3;
  v6 = [(PGGraphBuilder *)self curationContext];
  LOWORD(safeAssetAnalyzer) = [(PNSafeAssetAnalyzer *)safeAssetAnalyzer eligibilityStateWithAsset:v5 curationContext:v6];

  return (__int16)safeAssetAnalyzer;
}

- (void)computeAndPersistAssetStatistics
{
  id v12 = [(PGGraphBuilder *)self photoLibrary];
  v3 = [v12 librarySpecificFetchOptions];
  v4 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:210 options:v3];
  id v5 = [v4 firstObject];

  v6 = [v12 librarySpecificFetchOptions];
  [v6 setShouldPrefetchCount:1];
  v7 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v6];
  uint64_t v8 = [v7 count];
  id v9 = [(PGGraph *)self->_graph infoNode];
  uint64_t v10 = [v9 identifier];

  v11 = +[PGGraphInfoNode numberOfSelfies:v8];
  [(MAGraph *)self->_graph persistModelProperties:v11 forNodeWithIdentifier:v10 clobberExisting:0];
}

- (void)persistPersonalHighAestheticsThreshold:(double)a3 personalGoodAestheticsThreshold:(double)a4
{
  v7 = [(PGGraph *)self->_graph infoNode];
  uint64_t v8 = [v7 identifier];

  id v9 = +[PGGraphInfoNode personalAestheticsPropertiesWithHighAestheticsThreshold:a3 goodAestheticsThreshold:a4];
  [(MAGraph *)self->_graph persistModelProperties:v9 forNodeWithIdentifier:v8 clobberExisting:0];
}

- (void)computeAndPersistTopTierAestheticScores
{
  id v9 = [(PGGraphBuilder *)self photoLibrary];
  [(id)objc_opt_class() topTierAestheticScoreForRatio:v9 inPhotoLibrary:0.01];
  self->_topTierAestheticScore = v3;
  [(id)objc_opt_class() topTierAestheticScoreForRatio:v9 inPhotoLibrary:0.05];
  double v5 = v4;
  v6 = [(PGGraph *)self->_graph infoNode];
  uint64_t v7 = [v6 identifier];

  uint64_t v8 = +[PGGraphInfoNode topTierScorePropertiesWithAestheticScore:self->_topTierAestheticScore aestheticScoreForTripKeyAsset:v5];
  [(MAGraph *)self->_graph persistModelProperties:v8 forNodeWithIdentifier:v7 clobberExisting:0];
}

- (void)insertAssetCurationScoreInLibraryForFeeder:(id)a3 progressBlock:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void *, unsigned char *, double))_Block_copy(v7);
  double v9 = 0.0;
  if (v8)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v56 = 0;
      v8[2](v8, &v56, 0.0);
      if (v56)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v58 = 218;
          *(_WORD *)&v58[4] = 2080;
          *(void *)&v58[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/PGGraphBuilder+Curation.m";
          v11 = MEMORY[0x1E4F14500];
          goto LABEL_53;
        }
        goto LABEL_54;
      }
      double v9 = Current;
    }
  }
  if (!v6 || [(PGGraphBuilder *)self keepsExistingAssetCurationScores]) {
    goto LABEL_48;
  }
  id v41 = v7;
  id v42 = v6;
  id v12 = [v6 allItems];
  v51 = [MEMORY[0x1E4F8E778] scoringContextWithAssets:v12 aestheticScoreThresholdToBeAwesome:self->_topTierAestheticScore];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (!v13)
  {
    uint64_t v50 = 0;
    *(void *)&v47[4] = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    goto LABEL_47;
  }
  uint64_t v14 = v13;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  *(_DWORD *)&v47[8] = 0;
  uint64_t v50 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = *(void *)v53;
  double v17 = *MEMORY[0x1E4F8E738];
  double v18 = *MEMORY[0x1E4F8E748];
  double v44 = *MEMORY[0x1E4F8E750];
  int v19 = (unsigned __int16)*MEMORY[0x1E4F8AE00];
  *(void *)v47 = (unsigned __int16)*MEMORY[0x1E4F8ADF8];
  while (2)
  {
    uint64_t v20 = 0;
    uint64_t v49 = v15;
    uint64_t v43 = v15 + v14;
    do
    {
      if (*(void *)v53 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = *(void **)(*((void *)&v52 + 1) + 8 * v20);
      v22 = (void *)MEMORY[0x1D25FED50]();
      if (v8)
      {
        if (!((v49 + v20) % 10))
        {
          double v23 = CFAbsoluteTimeGetCurrent();
          if (v23 - v9 >= 0.01)
          {
            buf[0] = 0;
            v8[2](v8, buf, 0.1);
            double v9 = v23;
            if (buf[0])
            {

              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v58 = 306;
                *(_WORD *)&v58[4] = 2080;
                *(void *)&v58[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Ingest/PGGraphBuilder+Curation.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              id v7 = v41;
              id v6 = v42;
              goto LABEL_54;
            }
          }
        }
      }
      [v21 clsInteractionScore];
      float v25 = v24;
      v26 = [v21 curationModel];
      [v26 interactionScoreWithAsset:v21];
      float v28 = v27;

      if (vabds_f32(v28, v25) >= 0.001)
      {
        *(float *)&double v29 = v28;
        [(PGGraphBuilder *)self addInteractionScore:v21 forAsset:v29];
      }
      [v21 scoreInContext:v51];
      double v31 = v30;
      if (v30 >= v17)
      {
        ++v50;
      }
      else if (v30 >= v18)
      {
        ++*(void *)&v47[4];
      }
      else if (v30 <= v44)
      {
        ++v45;
      }
      else
      {
        ++v46;
      }
      v32 = [v21 sceneAnalysisProperties];
      BOOL v33 = v19 != (unsigned __int16)[v32 sceneAnalysisVersion]
         && *(_DWORD *)v47 != (unsigned __int16)[v21 faceAnalysisVersion];

      [v21 curationScore];
      double v35 = v34;
      if ([MEMORY[0x1E4F38EB8] isScore:v31 closeToValue:v34]) {
        goto LABEL_34;
      }
      if (v33
        || [(PGGraphBuilder *)self _shouldUpdateCurationScore:v35 withNewCurationScore:v31])
      {
        [(PGGraphBuilder *)self addCurationScore:v21 forAsset:v31];
LABEL_34:
        if (v33)
        {
          uint64_t v36 = [(PGGraphBuilder *)self generativeMemoryCreationEligibleStateWithAsset:v21];
          if (v36 != [v21 generativeMemoryCreationEligibilityState]) {
            [(PGGraphBuilder *)self addGenerativeMemoryCreationEligibilityState:v36 forAsset:v21];
          }
        }
        goto LABEL_40;
      }
      v37 = [(PGGraphBuilder *)self loggingConnection];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = [v21 localIdentifier];
        *(_DWORD *)buf = 134218498;
        *(double *)v58 = v35;
        *(_WORD *)&v58[8] = 2048;
        *(double *)&v58[10] = v31;
        __int16 v59 = 2114;
        v60 = v38;
        _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "Keeping previous curationScore (%.3f) over the new one (%.3f) for asset %{public}@", buf, 0x20u);
      }
LABEL_40:
      ++v20;
    }
    while (v14 != v20);
    uint64_t v14 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
    uint64_t v15 = v43;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_47:

  unint64_t v39 = self->_numberOfDefaultAssets + v46;
  self->_numberOfUtilityAssets += v45;
  self->_numberOfDefaultAssets = v39;
  unint64_t v40 = self->_numberOfBetterAssets + v50;
  self->_numberOfImprovedAssets += *(void *)&v47[4];
  self->_numberOfBetterAssets = v40;

  id v7 = v41;
  id v6 = v42;
LABEL_48:
  if (v8)
  {
    if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
    {
      char v56 = 0;
      v8[2](v8, &v56, 1.0);
      if (v56)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v58 = 316;
          *(_WORD *)&v58[4] = 2080;
          *(void *)&v58[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/PGGraphBuilder+Curation.m";
          v11 = MEMORY[0x1E4F14500];
LABEL_53:
          _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }
LABEL_54:
}

- (void)addGenerativeMemoryCreationEligibilityState:(signed __int16)a3 forAsset:(id)a4
{
  uint64_t v4 = a3;
  id v9 = a4;
  id v6 = self->_generativeMemoryCreationEligibilityStateByAsset;
  objc_sync_enter(v6);
  id v7 = [NSNumber numberWithShort:v4];
  [(NSMutableDictionary *)self->_generativeMemoryCreationEligibilityStateByAsset setObject:v7 forKeyedSubscript:v9];

  if ((unint64_t)[(NSMutableDictionary *)self->_generativeMemoryCreationEligibilityStateByAsset count] < 0xC8)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = (void *)[(NSMutableDictionary *)self->_generativeMemoryCreationEligibilityStateByAsset copy];
    [(NSMutableDictionary *)self->_generativeMemoryCreationEligibilityStateByAsset removeAllObjects];
  }
  objc_sync_exit(v6);

  if (v8) {
    [(PGGraphBuilder *)self _persistGenerativeMemoryCreationEligibilityState:v8];
  }
}

- (void)addInteractionScore:(float)a3 forAsset:(id)a4
{
  id v10 = a4;
  id v6 = self->_interactionScoreByAsset;
  objc_sync_enter(v6);
  *(float *)&double v7 = a3;
  uint64_t v8 = [NSNumber numberWithFloat:v7];
  [(NSMutableDictionary *)self->_interactionScoreByAsset setObject:v8 forKeyedSubscript:v10];

  if ((unint64_t)[(NSMutableDictionary *)self->_interactionScoreByAsset count] < 0xC8)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = (void *)[(NSMutableDictionary *)self->_interactionScoreByAsset copy];
    [(NSMutableDictionary *)self->_interactionScoreByAsset removeAllObjects];
  }
  objc_sync_exit(v6);

  if (v9) {
    [(PGGraphBuilder *)self _persistInteractionScores:v9];
  }
}

- (void)_persistGenerativeMemoryCreationEligibilityState:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    double v5 = [(PGGraphBuilder *)self photoLibrary];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__PGGraphBuilder_Curation___persistGenerativeMemoryCreationEligibilityState___block_invoke;
    v10[3] = &unk_1E68F0B18;
    id v11 = v4;
    id v9 = 0;
    char v6 = [v5 performChangesAndWait:v10 error:&v9];
    id v7 = v9;

    if ((v6 & 1) == 0)
    {
      uint64_t v8 = [(PGGraphBuilder *)self loggingConnection];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v7;
        _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "Error persisting eligibility state to database: %@", buf, 0xCu);
      }
    }
  }
}

uint64_t __77__PGGraphBuilder_Curation___persistGenerativeMemoryCreationEligibilityState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_235];
}

void __77__PGGraphBuilder_Curation___persistGenerativeMemoryCreationEligibilityState___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F38ED0];
  id v5 = a3;
  id v7 = [v4 changeRequestForAsset:a2];
  uint64_t v6 = [v5 shortValue];

  [v7 setGenerativeMemoryCreationEligibilityState:v6];
}

- (void)_persistInteractionScores:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(PGGraphBuilder *)self photoLibrary];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__PGGraphBuilder_Curation___persistInteractionScores___block_invoke;
    v10[3] = &unk_1E68F0B18;
    id v11 = v4;
    id v9 = 0;
    char v6 = [v5 performChangesAndWait:v10 error:&v9];
    id v7 = v9;

    if ((v6 & 1) == 0)
    {
      uint64_t v8 = [(PGGraphBuilder *)self loggingConnection];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v7;
        _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "Error saving interaction scores to database: %@", buf, 0xCu);
      }
    }
  }
}

uint64_t __54__PGGraphBuilder_Curation___persistInteractionScores___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_233];
}

void __54__PGGraphBuilder_Curation___persistInteractionScores___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F38ED0];
  id v5 = a3;
  id v9 = [v4 changeRequestForAsset:a2];
  [v5 floatValue];
  int v7 = v6;

  LODWORD(v8) = v7;
  [v9 setInteractionScore:v8];
}

- (void)persistPendingScores
{
  double v3 = self->_curationScoreByAsset;
  objc_sync_enter(v3);
  id v8 = (id)[(NSMutableDictionary *)self->_curationScoreByAsset copy];
  [(NSMutableDictionary *)self->_curationScoreByAsset removeAllObjects];
  objc_sync_exit(v3);

  [(PGGraphBuilder *)self _persistCurationScores:v8];
  id v4 = self->_interactionScoreByAsset;
  objc_sync_enter(v4);
  id v5 = (void *)[(NSMutableDictionary *)self->_interactionScoreByAsset copy];
  [(NSMutableDictionary *)self->_interactionScoreByAsset removeAllObjects];
  objc_sync_exit(v4);

  [(PGGraphBuilder *)self _persistInteractionScores:v5];
  int v6 = self->_generativeMemoryCreationEligibilityStateByAsset;
  objc_sync_enter(v6);
  int v7 = (void *)[(NSMutableDictionary *)self->_generativeMemoryCreationEligibilityStateByAsset copy];
  [(NSMutableDictionary *)self->_generativeMemoryCreationEligibilityStateByAsset removeAllObjects];
  objc_sync_exit(v6);

  [(PGGraphBuilder *)self _persistGenerativeMemoryCreationEligibilityState:v7];
}

- (void)addCurationScore:(double)a3 forAsset:(id)a4
{
  id v9 = a4;
  [v9 cacheCurationScore:a3];
  int v6 = self->_curationScoreByAsset;
  objc_sync_enter(v6);
  int v7 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)self->_curationScoreByAsset setObject:v7 forKeyedSubscript:v9];

  if ((unint64_t)[(NSMutableDictionary *)self->_curationScoreByAsset count] < 0xC8)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = (void *)[(NSMutableDictionary *)self->_curationScoreByAsset copy];
    [(NSMutableDictionary *)self->_curationScoreByAsset removeAllObjects];
  }
  objc_sync_exit(v6);

  if (v8) {
    [(PGGraphBuilder *)self _persistCurationScores:v8];
  }
}

- (void)_persistCurationScores:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(PGGraphBuilder *)self photoLibrary];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__PGGraphBuilder_Curation___persistCurationScores___block_invoke;
    v10[3] = &unk_1E68F0B18;
    id v11 = v4;
    id v9 = 0;
    char v6 = [v5 performChangesAndWait:v10 error:&v9];
    id v7 = v9;

    if ((v6 & 1) == 0)
    {
      id v8 = [(PGGraphBuilder *)self loggingConnection];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v7;
        _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "Error saving curation scores to database: %@", buf, 0xCu);
      }
    }
  }
}

uint64_t __51__PGGraphBuilder_Curation___persistCurationScores___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_1210];
}

void __51__PGGraphBuilder_Curation___persistCurationScores___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F38ED0];
  id v5 = a3;
  id v8 = [v4 changeRequestForAsset:a2];
  [v5 doubleValue];
  double v7 = v6;

  [v8 setCurationScore:v7];
}

- (BOOL)_shouldUpdateCurationScore:(double)a3 withNewCurationScore:(double)a4
{
  if (a3 != 0.0 && *MEMORY[0x1E4F8E740] != a3 && *MEMORY[0x1E4F8E740] == a4) {
    return 0;
  }
  double v5 = *MEMORY[0x1E4F8E738];
  double v6 = *MEMORY[0x1E4F8E730];
  BOOL v7 = a3 <= a4 || v6 <= a3;
  BOOL v8 = v7 || v5 > a3;
  BOOL v9 = v8 || v5 > a4;
  if (!v9 && v6 > a4) {
    return 0;
  }
  double v11 = *MEMORY[0x1E4F8E748];
  if (a3 > a4)
  {
    BOOL v12 = v5 <= a3 || v11 > a3;
    BOOL v13 = v12 || v5 <= a4;
    if (!v13 && v11 <= a4) {
      return 0;
    }
  }
  BOOL v16 = v11 <= a4;
  if (*MEMORY[0x1E4F8E740] > a4) {
    BOOL v16 = 1;
  }
  if (*MEMORY[0x1E4F8E740] > a3) {
    BOOL v16 = 1;
  }
  if (v11 <= a3) {
    BOOL v16 = 1;
  }
  return a3 <= a4 || v16;
}

+ (double)topTierAestheticScoreForRatio:(double)a3 inPhotoLibrary:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = [v5 librarySpecificFetchOptions];
  [v6 setShouldPrefetchCount:1];
  BOOL v7 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v6];
  unint64_t v8 = (unint64_t)((double)(unint64_t)[v7 count] * a3);
  BOOL v9 = [v5 librarySpecificFetchOptions];

  id v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"overallAestheticScore" ascending:0];
  v18[0] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v9 setSortDescriptors:v11];

  BOOL v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"overallAestheticScore != %f", *MEMORY[0x1E4F8EB00]);
  [v9 setInternalPredicate:v12];

  [v9 setFetchLimit:v8 + 1];
  [v9 setChunkSizeForFetch:1];
  [v9 setCacheSizeForFetch:1];
  BOOL v13 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v9];
  uint64_t v14 = [v13 lastObject];

  if (v14)
  {
    [v14 overallAestheticScore];
    double v16 = v15;
  }
  else
  {
    double v16 = 1.0;
  }

  return v16;
}

- (id)_findMeaningEdgeToMeaningfulEventNode:(id)a3 withMeaningNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = __Block_byref_object_copy__10822;
  double v17 = __Block_byref_object_dispose__10823;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__PGGraphBuilder_Meaning___findMeaningEdgeToMeaningfulEventNode_withMeaningNode___block_invoke;
  v10[3] = &unk_1E68E5C78;
  id v7 = v6;
  id v11 = v7;
  BOOL v12 = &v13;
  [v5 enumerateMeaningEdgesAndNodesUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __81__PGGraphBuilder_Meaning___findMeaningEdgeToMeaningfulEventNode_withMeaningNode___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isSameNodeAsNode:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_findAlternativeMeaningEdgeToMeaningfulEventNode:(id)a3 withMeaningNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = __Block_byref_object_copy__10822;
  double v17 = __Block_byref_object_dispose__10823;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__PGGraphBuilder_Meaning___findAlternativeMeaningEdgeToMeaningfulEventNode_withMeaningNode___block_invoke;
  v10[3] = &unk_1E68E5C78;
  id v7 = v6;
  id v11 = v7;
  BOOL v12 = &v13;
  [v5 enumerateMeaningEdgesAndNodesWithDomain:702 block:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __92__PGGraphBuilder_Meaning___findAlternativeMeaningEdgeToMeaningfulEventNode_withMeaningNode___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isSameNodeAsNode:*(void *)(a1 + 32)])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

- (void)addParentMeaningHierarchyForMeaningNode:(id)a3
{
  id v4 = a3;
  id v5 = [v4 label];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PGGraphBuilder_Meaning__addParentMeaningHierarchyForMeaningNode___block_invoke;
  v7[3] = &unk_1E68E5C50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[PGGraph traverseParentMeaningsForMeaningLabel:v5 usingBlock:v7];
}

void __67__PGGraphBuilder_Meaning__addParentMeaningHierarchyForMeaningNode___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = v5;
  char v10 = 0;
  if (v5 && [v5 length])
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 8) addUniqueNodeWithLabel:v6 domain:700 properties:0 didCreate:&v10];
    id v8 = (id)[*(id *)(*(void *)(a1 + 32) + 8) addUniqueEdgeWithLabel:@"SUBMEANING_OF" sourceNode:*(void *)(a1 + 40) targetNode:v7 domain:700 properties:0];
    *a3 = v10 ^ 1;
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) loggingConnection];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "[PGGraphBuilder+Meaning] Trying to insert a node with empty meaningLabel", v9, 2u);
    }
  }
}

- (void)addMeaningToMeaningfulEventNode:(id)a3 meaningLabel:(id)a4 meaningConfidence:(double)a5 meaningIsHighPrecision:(BOOL)a6 isV1Algorithm:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  if ([v13 length])
  {
    char v21 = 0;
    uint64_t v14 = [(PGMutableGraph *)self->_graph addUniqueNodeWithLabel:v13 domain:700 properties:0 didCreate:&v21];
    if (v21) {
      [(PGGraphBuilder *)self addParentMeaningHierarchyForMeaningNode:v14];
    }
    uint64_t v15 = [(id)objc_opt_class() edgeDomainForMeaningNodeLabel:v13 isV1Algorithm:v7];
    if (v21)
    {
      double v16 = 0;
    }
    else
    {
      if (v15 == 702) {
        [(PGGraphBuilder *)self _findAlternativeMeaningEdgeToMeaningfulEventNode:v12 withMeaningNode:v14];
      }
      else {
      double v16 = [(PGGraphBuilder *)self _findMeaningEdgeToMeaningfulEventNode:v12 withMeaningNode:v14];
      }
    }
    id v18 = +[PGGraphMeaningEdge propertyDictionaryWithConfidence:v8 isHighPrecision:a5];
    if (v16)
    {
      [v16 confidence];
      if (v19 < a5) {
        -[MAGraph persistModelProperties:forEdgeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forEdgeWithIdentifier:clobberExisting:", v18, [v16 identifier], 0);
      }
    }
    else
    {
      id v20 = [(PGMutableGraph *)self->_graph addUniqueEdgeWithLabel:@"MEANING" sourceNode:v12 targetNode:v14 domain:v15 properties:v18];
    }
  }
  else
  {
    double v17 = [(PGGraphBuilder *)self loggingConnection];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1805000, v17, OS_LOG_TYPE_FAULT, "[PGGraphBuilder+Meaning] Trying to ingest meaning node with an empty meaningLabel", buf, 2u);
    }
  }
}

- (void)addMeaningToMeaningfulEventNode:(id)a3 meaningLabel:(id)a4 meaningIsReliable:(BOOL)a5
{
  double v5 = 0.0;
  if (a5) {
    double v5 = 1.0;
  }
  -[PGGraphBuilder addMeaningToMeaningfulEventNode:meaningLabel:meaningConfidence:meaningIsHighPrecision:isV1Algorithm:](self, "addMeaningToMeaningfulEventNode:meaningLabel:meaningConfidence:meaningIsHighPrecision:isV1Algorithm:", a3, a4, v5);
}

- (void)deleteAllMeaningNodesAndEdges
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  double v3 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
  [v4 removeNodes:v3];
  [(MAGraph *)self->_graph executeGraphChangeRequest:v4];
}

+ (unsigned)edgeDomainForMeaningNodeLabel:(id)a3 isV1Algorithm:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned __int16 v5 = 700;
  if (+[PGEventLabelingConfiguration isEventLabelingEnabled])
  {
    BOOL v6 = +[PGEventLabelingConfiguration usePrimaryMeaningDomainForEventLabelingMeanings];
    if (v4) {
      unsigned __int16 v7 = 700;
    }
    else {
      unsigned __int16 v7 = 702;
    }
    if (v4) {
      unsigned __int16 v8 = 702;
    }
    else {
      unsigned __int16 v8 = 700;
    }
    if (v6) {
      return v8;
    }
    else {
      return v7;
    }
  }
  return v5;
}

- (id)connectPublicEventNode:(id)a3 withBusinessNode:(id)a4
{
  return [(PGMutableGraph *)self->_graph addUniqueEdgeWithLabel:@"PUBLIC_EVENT_BUSINESS" sourceNode:a3 targetNode:a4 domain:900 properties:0];
}

- (id)insertBusiness:(id)a3 fromMomentNode:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  uint64_t v9 = [v6 muid];
  char v10 = [v6 name];
  if (![(__CFString *)v10 length])
  {
    id v11 = +[PGLogging sharedLogging];
    id v12 = [v11 loggingConnection];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v77 = v9;
      _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "Inserting business w/o name: muid %lu", buf, 0xCu);
    }

    char v10 = &stru_1F283BC78;
  }
  id v13 = +[PGGraphBusinessNodeCollection businessNodeForBusinessMuid:v9 inGraph:self->_graph];
  if ([v13 count])
  {
    uint64_t v14 = [v7 collection];
    uint64_t v15 = +[PGGraphEdgeCollection edgesFromNodes:v14 toNodes:v13];

    double v16 = [v13 anyNode];
  }
  else
  {
    v66 = v13;
    double v17 = [v6 region];
    [v17 center];
    double v19 = v18;
    double v21 = v20;
    v22 = [PGGraphBusinessNode alloc];
    uint64_t v23 = [v6 venueCapacity];
    v58 = v17;
    [v17 radius];
    double v16 = -[PGGraphBusinessNode initWithMuid:name:venueCapacity:coordinates:radius:](v22, "initWithMuid:name:venueCapacity:coordinates:radius:", v9, v10, v23, v19, v21, v24);
    [v8 addNode:v16];
    float v25 = (void *)MEMORY[0x1E4F1CAD0];
    id v59 = v6;
    v26 = [v6 businessCategories];
    float v27 = [v25 setWithArray:v26];

    float v28 = +[PGGraphBusinessCategoryNodeCollection businessCategoryNodesForCategories:v27 inGraph:self->_graph];
    double v29 = (void *)MEMORY[0x1E4F1CA48];
    double v30 = [v28 array];
    double v31 = [v29 arrayWithArray:v30];

    v60 = v28;
    unint64_t v32 = [v28 count];
    v61 = v27;
    if (v32 < [v27 count])
    {
      uint64_t v62 = self;
      v64 = v10;
      BOOL v33 = [v28 categories];
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v34 = v27;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v72 objects:v81 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v73 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = *(void *)(*((void *)&v72 + 1) + 8 * i);
            if (([v33 containsObject:v39] & 1) == 0)
            {
              unint64_t v40 = [[PGGraphBusinessCategoryNode alloc] initWithLabel:v39];
              [v8 addNode:v40];
              [v31 addObject:v40];
            }
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v72 objects:v81 count:16];
        }
        while (v36);
      }

      self = v62;
      char v10 = v64;
    }
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v41 = v31;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v68 objects:v80 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v69 != v44) {
            objc_enumerationMutation(v41);
          }
          id v46 = [[PGGraphBusinessCategoryEdge alloc] initFromBusinessNode:v16 toBusinessCategoryNode:*(void *)(*((void *)&v68 + 1) + 8 * j)];
          [v8 addEdge:v46];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v68 objects:v80 count:16];
      }
      while (v43);
    }

    uint64_t v15 = 0;
    id v6 = v59;
    id v13 = v66;
  }
  if (![v15 count])
  {
    v65 = v10;
    v47 = [v6 dateInterval];
    v63 = self;
    v67 = v13;
    if (v47) {
      uint64_t v48 = [v6 hasRoutineVisit];
    }
    else {
      uint64_t v48 = 0;
    }
    uint64_t v49 = [PGGraphPlaceBusinessEdge alloc];
    [v6 routineVisitConfidence];
    double v51 = v50;
    long long v52 = [v47 startDate];
    long long v53 = [v47 endDate];
    id v54 = [(PGGraphPlaceBusinessEdge *)v49 initFromMomentNode:v7 toBusinessNode:v16 confidence:v48 hasRoutineInfo:v52 universalStartDate:v53 universalEndDate:v51];

    [v8 addEdge:v54];
    self = v63;
    char v10 = v65;
    id v13 = v67;
  }
  [(MAGraph *)self->_graph executeGraphChangeRequest:v8];
  long long v55 = [(PGGraphBuilder *)self loggingConnection];
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    v57 = [v7 localStartDate];
    *(_DWORD *)buf = 138478083;
    uint64_t v77 = (uint64_t)v10;
    __int16 v78 = 2113;
    v79 = v57;
    _os_log_debug_impl(&dword_1D1805000, v55, OS_LOG_TYPE_DEBUG, "Insert business %{private}@ to momentNode %{private}@", buf, 0x16u);
  }
  return v16;
}

- (id)insertPOIWithFeeder:(id)a3 fromMomentNode:(id)a4 isNearHomeOrWork:(BOOL)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = [MEMORY[0x1E4F1CA48] array];
  if (!a5)
  {
    id v11 = [(PGGraphBuilder *)self insertSpecialPOIAmusementParkNodeFromMomentNode:v9];
    id v12 = [(PGGraphBuilder *)self poiCache];
    id v13 = +[PGGraphPlacesResolver resolvePlacesForMomentNode:v9 feeder:v8 poiCache:v12];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = -[PGGraphBuilder insertPOINodeWithPlace:fromMomentNode:hasInsertedSpecialPOIAmusementParkNode:](self, "insertPOINodeWithPlace:fromMomentNode:hasInsertedSpecialPOIAmusementParkNode:", *(void *)(*((void *)&v21 + 1) + 8 * i), v9, v11 != 0, (void)v21);
          if (v19) {
            [v10 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }
  }
  return v10;
}

- (id)insertROIWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a3;
  id v9 = [v7 array];
  char v10 = [v8 uniqueMeaningCluesForKey:@"ROI"];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__PGGraphBuilder_Place__insertROIWithClueCollection_fromMomentNode___block_invoke;
  v16[3] = &unk_1E68E62B8;
  v16[4] = self;
  id v17 = v6;
  id v11 = v9;
  id v18 = v11;
  id v12 = v6;
  [v10 enumerateObjectsUsingBlock:v16];
  id v13 = v18;
  id v14 = v11;

  return v14;
}

void __68__PGGraphBuilder_Place__insertROIWithClueCollection_fromMomentNode___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = [*(id *)(a1 + 32) insertROINodeWithPlace:a2 fromMomentNode:*(void *)(a1 + 40)];
  if (v3)
  {
    BOOL v4 = v3;
    [*(id *)(a1 + 48) addObject:v3];
    double v3 = v4;
  }
}

- (id)insertROINodeWithType:(unint64_t)a3
{
  double v3 = (PGGraphROINode *)a3;
  if (a3)
  {
    unsigned __int16 v5 = +[PGGraphROINodeCollection roiNodesOfType:a3 inGraph:self->_graph];
    if ([v5 count])
    {
      double v3 = [v5 anyNode];
    }
    else
    {
      double v3 = [[PGGraphROINode alloc] initWithROIType:v3];
      id v6 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
      [v6 addNode:v3];
      [(MAGraph *)self->_graph executeGraphChangeRequest:v6];
    }
  }
  return v3;
}

- (id)insertROINodeWithType:(unint64_t)a3 fromMomentNode:(id)a4 confidence:(double)a5
{
  id v8 = a4;
  if (a3)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    char v10 = +[PGGraphROINodeCollection roiNodesOfType:a3 inGraph:self->_graph];
    if ([v10 count])
    {
      a3 = [v10 anyNode];
      id v11 = [v8 collection];
      id v12 = +[PGGraphEdgeCollection edgesFromNodes:v11 toNodes:v10];
    }
    else
    {
      a3 = [[PGGraphROINode alloc] initWithROIType:a3];
      [v9 addNode:a3];
      id v12 = 0;
    }
    if (![v12 count])
    {
      id v13 = [[PGGraphROIEdge alloc] initFromMomentNode:v8 toROINode:a3 confidence:a5];
      [v9 addEdge:v13];
    }
    [(MAGraph *)self->_graph executeGraphChangeRequest:v9];
  }
  return (id)a3;
}

- (unint64_t)_roiTypeForPlaceInterestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F76B70]])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F76B58]])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F76B60]])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F76B68]])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F76B78]])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)insertROINodeWithPlace:(id)a3 fromMomentNode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 placeInterestType];
  unint64_t v9 = [(PGGraphBuilder *)self _roiTypeForPlaceInterestType:v8];

  if (v9)
  {
    [v6 confidence];
    char v10 = -[PGGraphBuilder insertROINodeWithType:fromMomentNode:confidence:](self, "insertROINodeWithType:fromMomentNode:confidence:", v9, v7);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)insertPOINodeWithPlace:(id)a3 fromMomentNode:(id)a4 hasInsertedSpecialPOIAmusementParkNode:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  char v10 = [v8 placeInterestType];
  id v11 = +[PGGraph poiLabelForPOIType:v10];
  id v12 = v11;
  if (v11)
  {
    if (!v5
      || (char v13 = [v11 isEqualToString:@"AmusementPark"],
          char v14 = [v12 isEqualToString:@"Entertainment"],
          uint64_t v15 = 0,
          (v13 & 1) == 0)
      && (v14 & 1) == 0)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
      id v17 = +[PGGraphPOINodeCollection poiNodesForLabel:v12 inGraph:self->_graph];
      if ([v17 count])
      {
        uint64_t v15 = [v17 anyNode];
        id v18 = [v9 collection];
        double v19 = +[PGGraphEdgeCollection edgesFromNodes:v18 toNodes:v17];
      }
      else
      {
        uint64_t v15 = [[PGGraphPOINode alloc] initWithLabel:v12];
        [v16 addNode:v15];
        double v19 = 0;
      }
      if (![v19 count])
      {
        double v20 = [PGGraphPOIEdge alloc];
        [v8 confidence];
        id v21 = -[PGGraphPOIEdge initFromMomentNode:toPOINode:confidence:poiIsImproved:poiIsSpecial:](v20, "initFromMomentNode:toPOINode:confidence:poiIsImproved:poiIsSpecial:", v9, v15, 0, 0);
        [v16 addEdge:v21];
      }
      [(MAGraph *)self->_graph executeGraphChangeRequest:v16];
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)insertSpecialPOIAmusementParkNodeFromMomentNode:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [PGSpecialPOIResolver alloc];
  v15[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v7 = [(PGSpecialPOIResolver *)v5 initWithMomentNodes:v6];

  if ([(PGSpecialPOIResolver *)v7 anyMomentHasPOIAmusementPark])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    id v9 = +[PGGraphPOINodeCollection poiNodesForLabel:@"AmusementPark" inGraph:self->_graph];
    if ([v9 count])
    {
      char v10 = [v9 anyNode];
      id v11 = [v4 collection];
      id v12 = +[PGGraphEdgeCollection edgesFromNodes:v11 toNodes:v9];
    }
    else
    {
      char v10 = [[PGGraphPOINode alloc] initWithLabel:@"AmusementPark"];
      [v8 addNode:v10];
      id v12 = 0;
    }
    if (![v12 count])
    {
      id v13 = [[PGGraphPOIEdge alloc] initFromMomentNode:v4 toPOINode:v10 confidence:0 poiIsImproved:1 poiIsSpecial:1.0];
      [v8 addEdge:v13];
    }
    [(MAGraph *)self->_graph executeGraphChangeRequest:v8];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)insertEntityNetScenesWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6 = a4;
  id v7 = [a3 meaningCluesForKey:@"EntityNetScene"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__PGGraphBuilder_Scene__insertEntityNetScenesWithClueCollection_fromMomentNode___block_invoke;
  v11[3] = &unk_1E68E6318;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v10 = v8;
  id v13 = v10;
  [v7 enumerateObjectsUsingBlock:v11];
  if ([v10 numberOfChanges]) {
    [(MAGraph *)self->_graph executeGraphChangeRequest:v10];
  }
}

void __80__PGGraphBuilder_Scene__insertEntityNetScenesWithClueCollection_fromMomentNode___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  id v6 = [v3 entityNetSceneTaxonomy];
  [v3 _insertEntityNetScene:v5 fromMomentNode:v4 withEntityNetSceneTaxonomy:v6 changeRequest:a1[6]];
}

- (id)insertScenesWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6 = a4;
  id v7 = [a3 meaningCluesForKey:@"Scene"];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  id v9 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __71__PGGraphBuilder_Scene__insertScenesWithClueCollection_fromMomentNode___block_invoke;
  double v19 = &unk_1E68E62E8;
  double v20 = self;
  id v21 = v6;
  id v22 = v9;
  id v10 = v8;
  id v23 = v10;
  id v11 = v9;
  id v12 = v6;
  [v7 enumerateObjectsUsingBlock:&v16];
  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v11, v16, v17, v18, v19, v20);
  id v13 = v23;
  id v14 = v10;

  return v14;
}

void __71__PGGraphBuilder_Scene__insertScenesWithClueCollection_fromMomentNode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _insertScene:a2 fromMomentNode:*(void *)(a1 + 40) changeRequest:*(void *)(a1 + 48)];
  if (v3)
  {
    uint64_t v4 = v3;
    [*(id *)(a1 + 56) addObject:v3];
    id v3 = v4;
  }
}

- (id)_insertScene:(id)a3 fromMomentNode:(id)a4 changeRequest:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 identifier];
  sceneNodeBySceneName = self->_sceneNodeBySceneName;
  if (!sceneNodeBySceneName) {
    __assert_rtn("-[PGGraphBuilder(Scene) _insertScene:fromMomentNode:changeRequest:]", "PGGraphBuilder+Scene.m", 72, "_sceneNodeBySceneName != nil");
  }
  id v13 = [(NSMutableDictionary *)sceneNodeBySceneName objectForKeyedSubscript:v11];
  if (v13) {
    goto LABEL_3;
  }
  uint64_t v17 = [(PGGraphBuilder *)self sceneTaxonomy];
  id v18 = [v17 nodeForName:v11];

  if (v18)
  {
    double v19 = [PGGraphSceneNode alloc];
    [v8 relevance];
    id v13 = [(PGGraphSceneNode *)v19 initWithSceneTaxonomyNode:v18 level:(unint64_t)v20];
    [v10 addNode:v13];
    [(NSMutableDictionary *)self->_sceneNodeBySceneName setObject:v13 forKeyedSubscript:v11];

    if (v13)
    {
LABEL_3:
      id v14 = [PGGraphSceneEdge alloc];
      [v8 confidence];
      id v16 = -[PGGraphSceneEdge initFromMomentNode:toSceneNode:confidence:isReliable:numberOfAssets:numberOfHighConfidenceAssets:numberOfSearchConfidenceAssets:numberOfDominantSceneAssets:](v14, "initFromMomentNode:toSceneNode:confidence:isReliable:numberOfAssets:numberOfHighConfidenceAssets:numberOfSearchConfidenceAssets:numberOfDominantSceneAssets:", v9, v13, [v8 isReliable], objc_msgSend(v8, "numberOfAssets"), objc_msgSend(v8, "numberOfHighConfidenceAssets"), objc_msgSend(v8, "numberOfSearchConfidenceAssets"), v15, objc_msgSend(v8, "numberOfDominantSceneAssets"));
      [v10 addEdge:v16];
      goto LABEL_11;
    }
  }
  else
  {
    id v21 = [(PGGraphBuilder *)self loggingConnection];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v24 = v11;
      _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "Unknown scene '%@'", buf, 0xCu);
    }

    id v13 = 0;
  }
  id v16 = 0;
LABEL_11:

  return v16;
}

- (id)insertScene:(id)a3 fromMomentNode:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  id v10 = [(PGGraphBuilder *)self _insertScene:v8 fromMomentNode:v7 changeRequest:v9];

  [(MAGraph *)self->_graph executeGraphChangeRequest:v9];
  return v10;
}

- (void)_insertEntityNetScene:(id)a3 fromMomentNode:(id)a4 withEntityNetSceneTaxonomy:(id)a5 changeRequest:(id)a6
{
  id v22 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v22 identifier];
  if (v13)
  {
    id v14 = [(NSMutableDictionary *)self->_sceneNodeBySceneName objectForKeyedSubscript:v13];
    if (v14
      || ([(NSMutableSet *)self->_entityNetSceneTaxonomyNodesNotIndexedInSearch containsObject:v13] & 1) != 0)
    {
      goto LABEL_7;
    }
    if (![v22 numberOfSearchConfidenceAssets]) {
      goto LABEL_8;
    }
    uint64_t v15 = [(NSMutableDictionary *)self->_entityNetSceneNodeBySceneName objectForKeyedSubscript:v13];
    if (v15) {
      goto LABEL_6;
    }
    double v19 = [v11 nodeForName:v13];
    if (v19)
    {
      id v14 = v19;
      if (([v19 isIndexed] & 1) == 0)
      {
        [(NSMutableSet *)self->_entityNetSceneTaxonomyNodesNotIndexedInSearch addObject:v13];
        goto LABEL_7;
      }
      double v20 = [PGGraphEntityNetSceneNode alloc];
      [v22 relevance];
      uint64_t v15 = [(PGGraphSceneNode *)v20 initWithSceneTaxonomyNode:v14 level:(unint64_t)v21];
      [v12 addNode:v15];
      [(NSMutableDictionary *)self->_entityNetSceneNodeBySceneName setObject:v15 forKeyedSubscript:v13];

      if (v15)
      {
LABEL_6:
        id v16 = [PGGraphEntityNetSceneEdge alloc];
        [v22 confidence];
        id v18 = -[PGGraphSceneEdge initFromMomentNode:toSceneNode:confidence:isReliable:numberOfAssets:numberOfHighConfidenceAssets:numberOfSearchConfidenceAssets:numberOfDominantSceneAssets:](v16, "initFromMomentNode:toSceneNode:confidence:isReliable:numberOfAssets:numberOfHighConfidenceAssets:numberOfSearchConfidenceAssets:numberOfDominantSceneAssets:", v10, v15, [v22 isReliable], objc_msgSend(v22, "numberOfAssets"), objc_msgSend(v22, "numberOfHighConfidenceAssets"), objc_msgSend(v22, "numberOfSearchConfidenceAssets"), v17, objc_msgSend(v22, "numberOfDominantSceneAssets"));
        [v12 addEdge:v18];

        id v14 = (void *)v15;
LABEL_7:
      }
    }
  }
LABEL_8:
}

- (void)insertPersonNodeForShareParticipant:(id)a3
{
  id v15 = a3;
  if ([v15 isCurrentUser])
  {
    uint64_t v4 = [(PGGraphBuilder *)self serviceManager];
    id v5 = [v4 mePerson];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F391F0];
    id v7 = [(PGGraphBuilder *)self photoLibrary];
    id v8 = [v7 librarySpecificFetchOptions];
    id v9 = [v6 fetchPersonForShareParticipant:v15 options:v8];
    uint64_t v4 = [v9 firstObject];

    if (v4)
    {
      id v10 = [(PGGraphBuilder *)self serviceManager];
      id v11 = [v4 localIdentifier];
      id v12 = [(PGGraphBuilder *)self photoLibrary];
      id v5 = [v10 personForName:v11 inPhotoLibrary:v12];
    }
    else
    {
      id v5 = 0;
    }
  }

  id v13 = [[PGGraphIngestShareParticipantContainer alloc] initWithShareParticipant:v15 person:v5];
  id v14 = [(PGGraphBuilder *)self insertPersonNodeForPerson:v13];
  [(PGGraphPeopleDomainBuildingHelper *)self->_peopleDomainBuildingHelper cacheAuthorNode:v14 forShareParticipant:v15];
}

- (void)insertPersonNodesForShareParticipants:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v12 = [v11 localIdentifier];
        [v5 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }

  id v13 = (void *)MEMORY[0x1E4F1CAD0];
  id v14 = [v5 allKeys];
  id v15 = [v13 setWithArray:v14];

  id v16 = [(PGGraphBuilder *)self graph];
  double v17 = +[PGGraphPersonNodeCollection personNodesForShareParticipantIdentifiers:v15 inGraph:v16];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __71__PGGraphBuilder_SharedLibrary__insertPersonNodesForShareParticipants___block_invoke;
  v28[3] = &unk_1E68F0820;
  id v18 = v5;
  id v29 = v18;
  double v30 = self;
  [v17 enumerateNodesUsingBlock:v28];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v19 = objc_msgSend(v18, "allValues", 0);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v35 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        [(PGGraphBuilder *)self insertPersonNodeForShareParticipant:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v35 count:16];
    }
    while (v21);
  }
}

void __71__PGGraphBuilder_SharedLibrary__insertPersonNodesForShareParticipants___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 shareParticipantLocalIdentifier];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v9 shareParticipantLocalIdentifier];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (*(void *)(a1 + 32))
    {
      [*(id *)(*(void *)(a1 + 40) + 96) cacheAuthorNode:v9 forShareParticipant:v6];
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = [v9 shareParticipantLocalIdentifier];
      [v7 removeObjectForKey:v8];
    }
  }
}

+ (id)sharedLibraryParticipantsForLibrary:(id)a3
{
  id v3 = [a3 librarySpecificFetchOptions];
  id v4 = [MEMORY[0x1E4F39110] fetchActiveLibraryScopeWithOptions:v3];
  id v5 = [v4 firstObject];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F392E8] fetchParticipantsInShare:v5 options:v3];
    uint64_t v7 = [v6 fetchedObjects];

    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v7];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v8;
}

+ (BOOL)isSharedLibraryEnabledForLibrary:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F39110];
  id v4 = [a3 librarySpecificFetchOptions];
  id v5 = [v3 fetchActiveLibraryScopeWithOptions:v4];
  id v6 = [v5 firstObject];

  return v6 != 0;
}

- (void)setCanUseLocationDomain:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PGGraph *)self->_graph infoNode];
  uint64_t v6 = [v5 identifier];

  id v7 = +[PGGraphInfoNode locationPropertiesWithCanUseLocationDomain:v3];
  [(MAGraph *)self->_graph persistModelProperties:v7 forNodeWithIdentifier:v6 clobberExisting:0];
}

- (id)insertLocationMobilityNodeWithMobility:(id)a3 fromMomentNode:(id)a4 confidence:(double)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  id v12 = [[PGGraphMobilityNode alloc] initWithLabel:v10];

  if (![(MAGraph *)self->_graph findAndResolveUniqueNode:v12]) {
    [v11 addNode:v12];
  }
  id v13 = [[PGGraphMobilityEdge alloc] initFromMomentNode:v9 toMobilityNode:v12 confidence:a5];

  if (![(MAGraph *)self->_graph findAndResolveUniqueEdge:v13]) {
    [v11 addEdge:v13];
  }
  [(MAGraph *)self->_graph executeGraphChangeRequest:v11];

  return v12;
}

- (id)insertLocationMobilityNodeWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PGGraphBuilder *)self serviceManager];
  id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v10 = [v7 universalStartDate];
  id v11 = [v7 universalEndDate];
  id v12 = (void *)[v9 initWithStartDate:v10 endDate:v11];

  double v21 = 0.0;
  id v13 = [v8 predominantLocationMobilityForDateInterval:v12 confidence:&v21];
  if (v13)
  {
    double v14 = v21;
    if (v21 >= 0.2) {
      goto LABEL_7;
    }
  }
  id v15 = [v6 locationMobilityClue];
  id v16 = v15;
  if (v15)
  {
    uint64_t v17 = [v15 value];

    [v16 confidence];
    double v21 = v18;
    id v13 = (void *)v17;
  }

  if (v13)
  {
    double v14 = v21;
LABEL_7:
    double v19 = [(PGGraphBuilder *)self insertLocationMobilityNodeWithMobility:v13 fromMomentNode:v7 confidence:v14];
    goto LABEL_9;
  }
  double v19 = 0;
LABEL_9:

  return v19;
}

- (id)insertAddressNodeWithPlacemark:(id)a3 location:(id)a4 relevance:(double)a5 numberOfAssets:(unint64_t)a6 duringDateInterval:(id)a7 fromMomentNode:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  double v18 = 0;
  if (v14 && v15)
  {
    double v19 = [(PGGraphBuilder *)self serviceManager];
    unint64_t v38 = a6;
    if ([MEMORY[0x1E4F8A930] locationIsCoarse:v15])
    {
      uint64_t v20 = 0;
    }
    else
    {
      double v21 = [v19 locationOfInterestCloseToLocation:v15 inDateInterval:v16];
      uint64_t v22 = [(PGGraphBuilder *)self locationCache];
      id v23 = [v21 placemarkWithLocationCache:v22];

      if (v23 && ([v23 isEqual:v14] & 1) == 0)
      {
        id v24 = v23;

        uint64_t v20 = 1;
        id v14 = v24;
      }
      else
      {
        uint64_t v20 = 0;
      }
    }
    [v15 coordinate];
    double v26 = v25;
    double v28 = v27;
    id v29 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    double v30 = [(PGGraphBuilder *)self insertAddressNodeWithProjectedPlacemark:v14 atEventLocation:v15 usingImprovedPlacemark:v20 changeRequest:v29];
    double v18 = v30;
    if (v30)
    {
      uint64_t v37 = v19;
      if ([v30 isPrecise]
        && [v19 isRemoteLocation:v15 inDateInterval:v16])
      {
        long long v31 = PGGraphRemoteAddressEdge;
      }
      else
      {
        long long v31 = PGGraphAddressEdge;
      }
      id v32 = [v31 alloc];
      long long v33 = [v16 startDate];
      long long v34 = [v16 endDate];
      uint64_t v35 = objc_msgSend(v32, "initFromMomentNode:toAddressNode:relevance:universalStartDate:universalEndDate:photoCoordinate:numberOfAssets:", v17, v18, v33, v34, v38, a5, v26, v28);

      if (![(MAGraph *)self->_graph findAndResolveUniqueEdge:v35]) {
        [v29 addEdge:v35];
      }

      double v19 = v37;
    }
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v29, v37);
  }
  return v18;
}

- (id)insertLocationHierarchyWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  id v9 = [MEMORY[0x1E4F1CA48] array];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __85__PGGraphBuilder_Location__insertLocationHierarchyWithClueCollection_fromMomentNode___block_invoke;
  v26[3] = &unk_1E68E6B10;
  id v10 = v9;
  id v27 = v10;
  [v6 enumerateTimeClues:v26];
  uint64_t v11 = [v10 count];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __85__PGGraphBuilder_Location__insertLocationHierarchyWithClueCollection_fromMomentNode___block_invoke_2;
  v19[3] = &unk_1E68E6B38;
  uint64_t v25 = v11;
  id v20 = v10;
  id v21 = v6;
  uint64_t v22 = self;
  id v23 = v7;
  id v12 = v8;
  id v24 = v12;
  id v13 = v7;
  id v14 = v6;
  id v15 = v10;
  [v14 enumerateLocationClues:v19];
  id v16 = v24;
  id v17 = v12;

  return v17;
}

uint64_t __85__PGGraphBuilder_Location__insertLocationHierarchyWithClueCollection_fromMomentNode___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __85__PGGraphBuilder_Location__insertLocationHierarchyWithClueCollection_fromMomentNode___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 placemark];
  if (v6)
  {
    if (*(void *)(a1 + 72) <= a3)
    {
      uint64_t v8 = [*(id *)(a1 + 40) universalStartDate];
      id v9 = [*(id *)(a1 + 40) universalEndDate];
      id v10 = +[PGLogging sharedLogging];
      uint64_t v11 = [v10 loggingConnection];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [*(id *)(a1 + 32) count];
        int v18 = 134218498;
        unint64_t v19 = a3;
        __int16 v20 = 2048;
        uint64_t v21 = v17;
        __int16 v22 = 2112;
        id v23 = v8;
        _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "Index of location (%lu) mismatches number of time input clues (%lu). Will use start date of clue collection %@", (uint8_t *)&v18, 0x20u);
      }
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
      uint64_t v8 = [v7 universalStartDate];
      id v9 = [v7 universalEndDate];
    }
    id v12 = [v5 location];
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v9];
    id v14 = *(void **)(a1 + 48);
    [v5 score];
    id v16 = objc_msgSend(v14, "insertAddressNodeWithPlacemark:location:relevance:numberOfAssets:duringDateInterval:fromMomentNode:", v6, v12, objc_msgSend(v5, "numberOfAssets"), v13, *(void *)(a1 + 56), v15);
    if (v16) {
      [*(id *)(a1 + 64) addObject:v16];
    }
  }
}

- (id)insertAddressNodeWithProjectedPlacemark:(id)a3 atEventLocation:(id)a4 usingImprovedPlacemark:(BOOL)a5 changeRequest:(id)a6
{
  BOOL v7 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 location];
  [v13 coordinate];
  double v15 = v14;
  double v17 = v16;

  [v11 coordinate];
  double v19 = v18;
  double v21 = v20;
  double v28 = v18;
  double v30 = v20;
  v43.latitude = v15;
  v43.longitude = v17;
  if (!CLLocationCoordinate2DIsValid(v43)
    || v15 == 0.0 && v17 == 0.0
    || (v44.latitude = v19, v44.longitude = v21, !CLLocationCoordinate2DIsValid(v44))
    || v19 == 0.0 && v21 == 0.0)
  {
    __int16 v22 = +[PGLogging sharedLogging];
    id v23 = [v22 loggingConnection];

    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478851;
      id v32 = v10;
      __int16 v33 = 2049;
      double v34 = v15;
      __int16 v35 = 2049;
      double v36 = v17;
      __int16 v37 = 2049;
      double v38 = v19;
      __int16 v39 = 2049;
      double v40 = v21;
      _os_log_error_impl(&dword_1D1805000, v23, OS_LOG_TYPE_ERROR, "Coordinate invalid for placemark %{private}@ projection(%{private}f, %{private}f), photoCoordinate (%{private}f, %{private}f).", buf, 0x34u);
    }
    uint64_t v24 = 0;
  }
  else
  {
    if (objc_msgSend(v10, "isOcean", *(void *)&v28))
    {
      CLLocationCoordinate2DGetDistanceFrom();
      if (v26 >= 10000.0)
      {
        double v15 = v29;
        double v17 = v30;
      }
      uint64_t v27 = 3;
    }
    else if ([MEMORY[0x1E4F8A930] locationIsCoarse:v11])
    {
      uint64_t v27 = 2;
    }
    else
    {
      uint64_t v27 = v7;
    }
    id v23 = [(PGGraphBuilder *)self _uuidForPlacemark:v10 forNodeLabel:@"Number"];
    uint64_t v24 = -[PGGraphAddressNode initWithLocationMode:coordinate:name:]([PGGraphAddressNode alloc], "initWithLocationMode:coordinate:name:", v27, v23, v15, v17);
    if (![(MAGraph *)self->_graph findAndResolveUniqueNode:v24]) {
      [v12 addNode:v24];
    }
    [(PGGraphBuilder *)self insertAreasOfInterestForProjectedPlacemark:v10 fromAddressNode:v24 changeRequest:v12];
    [(PGGraphBuilder *)self insertLocationHierarchyWithProjectedPlacemark:v10 fromAddressNode:v24 changeRequest:v12];
  }

  return v24;
}

- (id)insertAddressNodeWithProjectedPlacemark:(id)a3 atEventLocation:(id)a4 usingImprovedPlacemark:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  id v12 = [(PGGraphBuilder *)self insertAddressNodeWithProjectedPlacemark:v10 atEventLocation:v9 usingImprovedPlacemark:v5 changeRequest:v11];

  [(MAGraph *)self->_graph executeGraphChangeRequest:v11];
  return v12;
}

- (void)insertLocationHierarchyWithProjectedPlacemark:(id)a3 fromAddressNode:(id)a4 changeRequest:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 identifier])
  {
    id v11 = (PGGraphLocationStreetNode *)v9;
    id v12 = [v8 subThoroughfare];

    if (v12)
    {
      id v13 = [(PGGraphBuilder *)self _uuidForPlacemark:v8 forNodeLabel:@"Number"];
      double v14 = [PGGraphLocationNumberNode alloc];
      double v15 = [v8 subThoroughfare];
      double v16 = [(PGGraphNamedLocationNode *)v14 initWithName:v15 uuid:v13];

      BOOL v17 = [(MAGraph *)self->_graph findAndResolveUniqueNode:v16];
      if (!v17) {
        [v10 addNode:v16];
      }
      id v18 = [[PGGraphLocationNumberEdge alloc] initFromLocationNode:v11 toLocationNumberNode:v16];
      if (![(MAGraph *)self->_graph findAndResolveUniqueEdge:v18]) {
        [v10 addEdge:v18];
      }
      if (v17) {
        goto LABEL_40;
      }
    }
    else
    {
      double v16 = (PGGraphLocationNumberNode *)v11;
    }
    double v19 = [v8 thoroughfare];

    if (v19)
    {
      double v20 = [(PGGraphBuilder *)self _uuidForPlacemark:v8 forNodeLabel:@"Street"];
      double v21 = [PGGraphLocationStreetNode alloc];
      __int16 v22 = [v8 thoroughfare];
      id v11 = [(PGGraphNamedLocationNode *)v21 initWithName:v22 uuid:v20];

      BOOL v23 = [(MAGraph *)self->_graph findAndResolveUniqueNode:v11];
      if (!v23) {
        [v10 addNode:v11];
      }
      id v24 = [[PGGraphLocationStreetEdge alloc] initFromLocationNode:v16 toStreetNode:v11];
      if (![(MAGraph *)self->_graph findAndResolveUniqueEdge:v24]) {
        [v10 addEdge:v24];
      }
      if (v23) {
        goto LABEL_49;
      }
    }
    else
    {
      id v11 = (PGGraphLocationStreetNode *)v16;
    }
    uint64_t v25 = [v8 subLocality];

    if (v25)
    {
      id v13 = [(PGGraphBuilder *)self _uuidForPlacemark:v8 forNodeLabel:@"District"];
      double v26 = [PGGraphLocationDistrictNode alloc];
      uint64_t v27 = [v8 subLocality];
      double v16 = [(PGGraphNamedLocationNode *)v26 initWithName:v27 uuid:v13];

      BOOL v28 = [(MAGraph *)self->_graph findAndResolveUniqueNode:v16];
      if (!v28) {
        [v10 addNode:v16];
      }
      id v18 = [[PGGraphLocationDistrictEdge alloc] initFromLocationNode:v11 toDistrictNode:v16];
      if (![(MAGraph *)self->_graph findAndResolveUniqueEdge:v18]) {
        [v10 addEdge:v18];
      }
      if (v28) {
        goto LABEL_40;
      }
    }
    else
    {
      double v16 = (PGGraphLocationNumberNode *)v11;
    }
    double v29 = [v8 locality];

    if (v29)
    {
      double v20 = [(PGGraphBuilder *)self _uuidForPlacemark:v8 forNodeLabel:@"City"];
      double v30 = [PGGraphLocationCityNode alloc];
      long long v31 = [v8 locality];
      id v11 = [(PGGraphNamedLocationNode *)v30 initWithName:v31 uuid:v20];

      BOOL v32 = [(MAGraph *)self->_graph findAndResolveUniqueNode:v11];
      if (!v32) {
        [v10 addNode:v11];
      }
      id v24 = [[PGGraphLocationCityEdge alloc] initFromLocationNode:v16 toCityNode:v11];
      if (![(MAGraph *)self->_graph findAndResolveUniqueEdge:v24]) {
        [v10 addEdge:v24];
      }
      if (v32) {
        goto LABEL_49;
      }
    }
    else
    {
      id v11 = (PGGraphLocationStreetNode *)v16;
    }
    __int16 v33 = [v8 subAdministrativeArea];

    if (v33)
    {
      id v13 = [(PGGraphBuilder *)self _uuidForPlacemark:v8 forNodeLabel:@"County"];
      double v34 = [PGGraphLocationCountyNode alloc];
      __int16 v35 = [v8 subAdministrativeArea];
      double v16 = [(PGGraphNamedLocationNode *)v34 initWithName:v35 uuid:v13];

      BOOL v36 = [(MAGraph *)self->_graph findAndResolveUniqueNode:v16];
      if (!v36) {
        [v10 addNode:v16];
      }
      id v18 = [[PGGraphLocationCountyEdge alloc] initFromLocationNode:v11 toCountyNode:v16];
      if (![(MAGraph *)self->_graph findAndResolveUniqueEdge:v18]) {
        [v10 addEdge:v18];
      }
      if (v36)
      {
LABEL_40:

LABEL_50:
        goto LABEL_51;
      }
    }
    else
    {
      double v16 = (PGGraphLocationNumberNode *)v11;
    }
    __int16 v37 = [v8 administrativeArea];

    if (v37)
    {
      double v20 = [(PGGraphBuilder *)self _uuidForPlacemark:v8 forNodeLabel:@"State"];
      double v38 = [PGGraphLocationStateNode alloc];
      __int16 v39 = [v8 administrativeArea];
      id v11 = [(PGGraphNamedLocationNode *)v38 initWithName:v39 uuid:v20];

      BOOL v40 = [(MAGraph *)self->_graph findAndResolveUniqueNode:v11];
      if (!v40) {
        [v10 addNode:v11];
      }
      id v24 = [[PGGraphLocationStateEdge alloc] initFromLocationNode:v16 toStateNode:v11];
      if (![(MAGraph *)self->_graph findAndResolveUniqueEdge:v24]) {
        [v10 addEdge:v24];
      }
      if (v40)
      {
LABEL_49:

        id v11 = (PGGraphLocationStreetNode *)v16;
        goto LABEL_50;
      }
    }
    else
    {
      id v11 = (PGGraphLocationStreetNode *)v16;
    }
    uint64_t v41 = [v8 ISOcountryCode];

    if (v41)
    {
      uint64_t v42 = [v8 ISOcountryCode];
      CLLocationCoordinate2D v43 = [PGGraphLocationCountryNode alloc];
      CLLocationCoordinate2D v44 = [v8 ISOcountryCode];
      uint64_t v45 = [(PGGraphNamedLocationNode *)v43 initWithName:v44 uuid:v42];

      BOOL v46 = [(MAGraph *)self->_graph findAndResolveUniqueNode:v45];
      if (!v46) {
        [v10 addNode:v45];
      }
      id v47 = [[PGGraphLocationCountryEdge alloc] initFromLocationNode:v11 toCountryNode:v45];
      if (![(MAGraph *)self->_graph findAndResolveUniqueEdge:v47]) {
        [v10 addEdge:v47];
      }
      if (!v46)
      {
        id v62 = v47;
        v63 = v42;
        v64 = v11;
        id v65 = v9;
        uint64_t v48 = (void *)MEMORY[0x1E4F1CA20];
        id v66 = v8;
        uint64_t v49 = [v8 ISOcountryCode];
        double v50 = [v48 languagesForRegion:v49 subdivision:0 withThreshold:2 filter:0];

        double v51 = +[PGGraphLanguageNodeCollection nodesWithLocaleIdentifiers:v50 inGraph:self->_graph];
        id v52 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __104__PGGraphBuilder_Location__insertLocationHierarchyWithProjectedPlacemark_fromAddressNode_changeRequest___block_invoke;
        v71[3] = &unk_1E68EE5E0;
        id v53 = v52;
        id v72 = v53;
        [v51 enumerateNodesUsingBlock:v71];
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v54 = v50;
        uint64_t v55 = [v54 countByEnumeratingWithState:&v67 objects:v73 count:16];
        if (v55)
        {
          uint64_t v56 = v55;
          uint64_t v57 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v56; ++i)
            {
              if (*(void *)v68 != v57) {
                objc_enumerationMutation(v54);
              }
              uint64_t v59 = *(void *)(*((void *)&v67 + 1) + 8 * i);
              v60 = [v53 objectForKeyedSubscript:v59];
              if (!v60)
              {
                v60 = [[PGGraphLanguageNode alloc] initWithLocaleIdentifier:v59];
                [v10 addNode:v60];
              }
              id v61 = [[PGGraphLanguageEdge alloc] initFromLocationNode:v45 toLanguageNode:v60];
              [v10 addEdge:v61];
            }
            uint64_t v56 = [v54 countByEnumeratingWithState:&v67 objects:v73 count:16];
          }
          while (v56);
        }

        id v9 = v65;
        id v8 = v66;
        uint64_t v42 = v63;
        id v11 = v64;
        id v47 = v62;
      }
    }
    goto LABEL_50;
  }
LABEL_51:
}

void __104__PGGraphBuilder_Location__insertLocationHierarchyWithProjectedPlacemark_fromAddressNode_changeRequest___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 localeIdentifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (void)insertAreasOfInterestForProjectedPlacemark:(id)a3 fromAddressNode:(id)a4 changeRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  id v12 = [v8 areasOfInterest];
  id v13 = (void *)[v11 initWithArray:v12];

  uint64_t v14 = [v13 count];
  double v15 = [v8 popularityScoresOrderedByAOI];
  if (v14 == [v15 count])
  {
    if (v14)
    {
      if (v14 == 1) {
        char v16 = [v8 isIsland];
      }
      else {
        char v16 = 0;
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __101__PGGraphBuilder_Location__insertAreasOfInterestForProjectedPlacemark_fromAddressNode_changeRequest___block_invoke;
      v18[3] = &unk_1E68E6AE8;
      uint64_t v22 = v14;
      v18[4] = self;
      id v19 = v15;
      char v23 = v16;
      id v20 = v10;
      id v21 = v9;
      BOOL v24 = v14 != 1;
      [v13 enumerateObjectsUsingBlock:v18];
    }
  }
  else
  {
    BOOL v17 = [(PGGraphBuilder *)self loggingConnection];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Length of areasOfInterest and popularityScoresOrderedByAOI arrays are different", buf, 2u);
    }
  }
}

void __101__PGGraphBuilder_Location__insertAreasOfInterestForProjectedPlacemark_fromAddressNode_changeRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = (double)(unint64_t)(*(void *)(a1 + 64) - a3) * 0.5 / (double)*(unint64_t *)(a1 + 64) + 0.5;
  BOOL v7 = +[PGGraphAreaNode filterWithName:v5];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 8) anyNodeMatchingFilter:v7];
  id v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  [v9 doubleValue];
  double v11 = v10;
  if (!v8)
  {
    id v8 = [[PGGraphAreaNode alloc] initWithName:v5 isBlocked:*(unsigned __int8 *)(a1 + 72) popularityScore:v10];
    [*(id *)(a1 + 48) addNode:v8];
    id v12 = [[PGGraphAreaEdge alloc] initFromAddressNode:*(void *)(a1 + 56) toAreaNode:v8 relevance:v6];
LABEL_17:
    [*(id *)(a1 + 48) addEdge:v12];
    goto LABEL_18;
  }
  if (!*(unsigned char *)(a1 + 73) && *(unsigned __int8 *)(a1 + 72) != [(PGGraphAreaNode *)v8 isBlocked])
  {
    if (*(unsigned char *)(a1 + 72))
    {
      +[PGGraphAreaNode setIsBlocked:1 onNodeForIdentifier:[(MANode *)v8 identifier] inGraph:*(void *)(*(void *)(a1 + 32) + 8)];
    }
    else
    {
      id v13 = [*(id *)(a1 + 32) loggingConnection];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138477827;
        id v19 = v5;
        _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "Inconsistent blocked state for area %{private}@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  [(PGGraphAreaNode *)v8 popularityScore];
  if (v14 != v11)
  {
    double v15 = v14;
    [(id)*MEMORY[0x1E4F76BF8] doubleValue];
    if (v15 == v16)
    {
      +[PGGraphAreaNode setPopularityScore:[(MANode *)v8 identifier] onNodeForIdentifier:*(void *)(*(void *)(a1 + 32) + 8) inGraph:v11];
    }
    else
    {
      BOOL v17 = [*(id *)(a1 + 32) loggingConnection];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v18 = 138477827;
        id v19 = v5;
        _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "Inconsistent popularity score for area %{private}@.", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  id v12 = [[PGGraphAreaEdge alloc] initFromAddressNode:*(void *)(a1 + 56) toAreaNode:v8 relevance:v6];
  if (([*(id *)(*(void *)(a1 + 32) + 8) findAndResolveUniqueEdge:v12] & 1) == 0) {
    goto LABEL_17;
  }
LABEL_18:
}

- (id)_uuidForPlacemark:(id)a3 forNodeLabel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4F28E78] string];
  if ([v6 isEqualToString:@"Number"])
  {
    uint64_t v8 = [v5 subThoroughfare];
    id v9 = (void *)v8;
    if (v8) {
      [v7 appendFormat:@"%@", v8];
    }

    goto LABEL_6;
  }
  if ([v6 isEqualToString:@"Street"])
  {
LABEL_6:
    uint64_t v10 = [v5 thoroughfare];
    double v11 = (void *)v10;
    if (v10) {
      [v7 appendFormat:@"%@", v10];
    }

    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"District"])
  {
LABEL_9:
    uint64_t v12 = [v5 subLocality];
    id v13 = (void *)v12;
    if (v12) {
      [v7 appendFormat:@"%@", v12];
    }

    goto LABEL_12;
  }
  if ([v6 isEqualToString:@"City"])
  {
LABEL_12:
    uint64_t v14 = [v5 locality];
    double v15 = (void *)v14;
    if (v14) {
      [v7 appendFormat:@"%@", v14];
    }

    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"County"])
  {
LABEL_15:
    uint64_t v16 = [v5 subAdministrativeArea];
    BOOL v17 = (void *)v16;
    if (v16) {
      [v7 appendFormat:@"%@", v16];
    }

    goto LABEL_18;
  }
  if (![v6 isEqualToString:@"State"])
  {
    if (![v6 isEqualToString:@"Country"]) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v18 = [v5 administrativeArea];
  id v19 = (void *)v18;
  if (v18) {
    [v7 appendFormat:@"%@", v18];
  }

LABEL_21:
  uint64_t v20 = [v5 ISOcountryCode];
  id v21 = (void *)v20;
  if (v20) {
    [v7 appendFormat:@"%@", v20];
  }

LABEL_24:
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicEventManager, 0);
  objc_storeStrong((id *)&self->_natureCache, 0);
  objc_storeStrong((id *)&self->_roiCache, 0);
  objc_storeStrong((id *)&self->_poiCache, 0);
  objc_storeStrong((id *)&self->_aoiCache, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_eventLabelingFeaturesCache, 0);
  objc_storeStrong((id *)&self->_sharedLibraryParticipants, 0);
  objc_storeStrong((id *)&self->_entityNetSceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_personActivityMeaningCriteriaDictionaryByMeaningLabel, 0);
  objc_storeStrong((id *)&self->_focusPeopleIngestCache, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_featureProvider, 0);
  objc_storeStrong((id *)&self->_safeAssetAnalyzer, 0);
  objc_storeStrong((id *)&self->_entityNetSceneTaxonomyNodesNotIndexedInSearch, 0);
  objc_storeStrong((id *)&self->_entityNetSceneNodeBySceneName, 0);
  objc_storeStrong((id *)&self->_sceneNodeBySceneName, 0);
  objc_storeStrong((id *)&self->_peopleDomainBuildingHelper, 0);
  objc_storeStrong((id *)&self->_timeDomainBuildingHelper, 0);
  objc_storeStrong((id *)&self->_momentNodesWhereMeIsPresent, 0);
  objc_storeStrong((id *)&self->_generativeMemoryCreationEligibilityStateByAsset, 0);
  objc_storeStrong((id *)&self->_interactionScoreByAsset, 0);
  objc_storeStrong((id *)&self->_curationScoreByAsset, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (CLSPublicEventManager)publicEventManager
{
  return (CLSPublicEventManager *)objc_getProperty(self, a2, 280, 1);
}

- (CLSNatureCache)natureCache
{
  return (CLSNatureCache *)objc_getProperty(self, a2, 272, 1);
}

- (CLSROICache)roiCache
{
  return (CLSROICache *)objc_getProperty(self, a2, 264, 1);
}

- (CLSPOICache)poiCache
{
  return (CLSPOICache *)objc_getProperty(self, a2, 256, 1);
}

- (CLSAOICache)aoiCache
{
  return (CLSAOICache *)objc_getProperty(self, a2, 248, 1);
}

- (CLSLocationCache)locationCache
{
  return (CLSLocationCache *)objc_getProperty(self, a2, 240, 1);
}

- (PGEventLabelingFeaturesFileCache)eventLabelingFeaturesCache
{
  return (PGEventLabelingFeaturesFileCache *)objc_getProperty(self, a2, 232, 1);
}

- (NSSet)sharedLibraryParticipants
{
  return (NSSet *)objc_getProperty(self, a2, 224, 1);
}

- (BOOL)isSharedLibraryEnabled
{
  return self->_isSharedLibraryEnabled;
}

- (CLSSceneTaxonomyHierarchy)entityNetSceneTaxonomy
{
  return (CLSSceneTaxonomyHierarchy *)objc_getProperty(self, a2, 216, 1);
}

- (CLSSceneTaxonomyHierarchy)sceneTaxonomy
{
  return (CLSSceneTaxonomyHierarchy *)objc_getProperty(self, a2, 208, 1);
}

- (void)setKeepsExistingAssetCurationScores:(BOOL)a3
{
  self->_keepsExistingAssetCurationScores = a3;
}

- (BOOL)keepsExistingAssetCurationScores
{
  return self->_keepsExistingAssetCurationScores;
}

- (void)setFocusPeopleIngestCache:(id)a3
{
}

- (CLSFocusPeopleCache)focusPeopleIngestCache
{
  return self->_focusPeopleIngestCache;
}

- (OS_os_log)loggingConnection
{
  return (OS_os_log *)objc_getProperty(self, a2, 176, 1);
}

- (CLSServiceManager)serviceManager
{
  return (CLSServiceManager *)objc_getProperty(self, a2, 168, 1);
}

- (PGCurationManager)curationManager
{
  return (PGCurationManager *)objc_getProperty(self, a2, 160, 1);
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_getProperty(self, a2, 152, 1);
}

- (PGMutableGraph)graph
{
  return (PGMutableGraph *)objc_getProperty(self, a2, 8, 1);
}

- (void)_onGraphDidUpdate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = +[PGLogging sharedLogging];
  id v4 = [v3 loggingConnection];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v4, OS_LOG_TYPE_INFO, "[GraphBuilder] - signaling availability state did change", buf, 2u);
  }

  id v5 = [(PHPhotoLibrary *)self->_photoLibrary photoLibrary];
  id v6 = [v5 assetsdClient];
  BOOL v7 = [v6 libraryInternalClient];
  id v12 = 0;
  int v8 = [v7 signalAvailabilityStateDidChangeWithError:&v12];
  id v9 = v12;

  uint64_t v10 = +[PGLogging sharedLogging];
  double v11 = [v10 loggingConnection];

  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "[GraphBuilder] - successfully updated availability state", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v9;
    _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "[GraphBuilder] - failed to update availability state, error: %@", buf, 0xCu);
  }
}

- (void)_cleanGraphBuildCachesAfterUpdate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  eventLabelingFeaturesCache = self->_eventLabelingFeaturesCache;
  if (eventLabelingFeaturesCache)
  {
    id v7 = 0;
    BOOL v3 = [(PGEventLabelingFeaturesFileCache *)eventLabelingFeaturesCache clearCacheWithError:&v7];
    id v4 = v7;
    if (!v3)
    {
      id v5 = +[PGLogging sharedLogging];
      id v6 = [v5 loggingConnection];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v4;
        _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "[PGGraphBuilder] Error clearing features cache: %@", buf, 0xCu);
      }
    }
  }
}

- (void)clearPersonActivityMeaningCriteriaDictionaryByMeaningLabel
{
  personActivityMeaningCriteriaDictionaryByMeaningLabel = self->_personActivityMeaningCriteriaDictionaryByMeaningLabel;
  self->_personActivityMeaningCriteriaDictionaryByMeaningLabel = 0;
}

- (NSDictionary)personActivityMeaningCriteriaDictionaryByMeaningLabel
{
  v2 = self;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  personActivityMeaningCriteriaDictionaryByMeaningLabel = self->_personActivityMeaningCriteriaDictionaryByMeaningLabel;
  if (!personActivityMeaningCriteriaDictionaryByMeaningLabel)
  {
    double v29 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = +[PGTrialSession newTrialSession];
    id v5 = [v4 arrayForFactorName:@"personActivityMeaning" withNamespaceType:3];
    if (![v5 count])
    {
      id v6 = +[PGLogging sharedLogging];
      id v7 = [v6 loggingConnection];

      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "[PERSON ACTIVITY MEANING CRITERIA] nil personActivityMeaningLabels found", buf, 2u);
      }
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      unint64_t v11 = 0x1E4F29000uLL;
      id v12 = @"%@.plist";
      do
      {
        uint64_t v13 = 0;
        uint64_t v27 = v9;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * v13);
          uint64_t v15 = objc_msgSend(*(id *)(v11 + 24), "stringWithFormat:", v12, v14);
          uint64_t v16 = [v4 dictionaryForFactorName:v15 withNamespaceType:3];

          if (v16)
          {
            BOOL v17 = +[PGMeaningCriteriaEvaluator meaningCriteriaEvaluatorsForMeaningLabel:v14 withDictionary:v16 serviceManager:v2->_serviceManager];
            [(NSDictionary *)v29 setObject:v17 forKeyedSubscript:v14];
          }
          else
          {
            uint64_t v18 = v10;
            id v19 = v12;
            id v20 = v4;
            unint64_t v21 = v11;
            uint64_t v22 = v2;
            char v23 = +[PGLogging sharedLogging];
            BOOL v24 = [v23 loggingConnection];

            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v35 = v14;
              _os_log_error_impl(&dword_1D1805000, v24, OS_LOG_TYPE_ERROR, "[PERSON ACTIVITY MEANING CRITERIA] nil personActivityMeaning criteria dictionary found for meaning %@", buf, 0xCu);
            }

            [(NSDictionary *)v29 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:v14];
            v2 = v22;
            unint64_t v11 = v21;
            id v4 = v20;
            id v12 = v19;
            uint64_t v10 = v18;
            uint64_t v9 = v27;
          }

          ++v13;
        }
        while (v9 != v13);
        uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }

    uint64_t v25 = v2->_personActivityMeaningCriteriaDictionaryByMeaningLabel;
    v2->_personActivityMeaningCriteriaDictionaryByMeaningLabel = v29;

    personActivityMeaningCriteriaDictionaryByMeaningLabel = v2->_personActivityMeaningCriteriaDictionaryByMeaningLabel;
  }
  return personActivityMeaningCriteriaDictionaryByMeaningLabel;
}

- (void)setContactsAccessStatus:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(PGGraph *)self->_graph infoNode];
  id v5 = [v10 creationDate];
  id v6 = [v10 localeIdentifier];
  id v7 = [v10 languageIdentifiers];
  uint64_t v8 = [v10 geoServiceProviderID];
  uint64_t v9 = +[PGGraphInfoNode genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:](PGGraphInfoNode, "genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:", v5, v6, v7, v8, [v10 curationAlgorithmsVersion], v3);

  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v9, [v10 identifier], 0);
}

- (void)setCurationAlgorithmsVersion:(unint64_t)a3
{
  id v10 = [(PGGraph *)self->_graph infoNode];
  id v5 = [v10 creationDate];
  id v6 = [v10 localeIdentifier];
  id v7 = [v10 languageIdentifiers];
  uint64_t v8 = [v10 geoServiceProviderID];
  uint64_t v9 = +[PGGraphInfoNode genericPropertiesWithCreationDate:v5 localeIdentifier:v6 languageIdentifiers:v7 geoServiceProviderID:v8 curationAlgorithmsVersion:a3 contactsStoreAccess:1];

  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v9, [v10 identifier], 0);
}

- (void)setGeoServiceProviderID:(id)a3
{
  graph = self->_graph;
  id v5 = a3;
  id v10 = [(PGGraph *)graph infoNode];
  id v6 = [v10 creationDate];
  id v7 = [v10 localeIdentifier];
  uint64_t v8 = [v10 languageIdentifiers];
  uint64_t v9 = +[PGGraphInfoNode genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:](PGGraphInfoNode, "genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:", v6, v7, v8, v5, [v10 curationAlgorithmsVersion], 1);

  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v9, [v10 identifier], 0);
}

- (void)setLanguageIdentifiers:(id)a3
{
  graph = self->_graph;
  id v5 = a3;
  id v10 = [(PGGraph *)graph infoNode];
  id v6 = [v10 creationDate];
  id v7 = [v10 localeIdentifier];
  uint64_t v8 = [v10 geoServiceProviderID];
  uint64_t v9 = +[PGGraphInfoNode genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:](PGGraphInfoNode, "genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:", v6, v7, v5, v8, [v10 curationAlgorithmsVersion], 1);

  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v9, [v10 identifier], 0);
}

- (void)setLocaleIdentifier:(id)a3
{
  graph = self->_graph;
  id v5 = a3;
  id v10 = [(PGGraph *)graph infoNode];
  id v6 = [v10 creationDate];
  id v7 = [v10 languageIdentifiers];
  uint64_t v8 = [v10 geoServiceProviderID];
  uint64_t v9 = +[PGGraphInfoNode genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:](PGGraphInfoNode, "genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:", v6, v5, v7, v8, [v10 curationAlgorithmsVersion], 1);

  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v9, [v10 identifier], 0);
}

- (id)insertMomentNodeForClueCollection:(id)a3 feeder:(id)a4 progressBlock:(id)a5
{
  return [(PGGraphBuilder *)self _insertMomentNodeForClueCollection:a3 feeder:a4 insertedAndUpdatedPersonNodes:0 graphUpdate:0 progressBlock:a5];
}

- (id)_momentNodesFromPersonNodes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
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
        id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) collection];
        unint64_t v11 = [v10 momentNodes];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __46__PGGraphBuilder__momentNodesFromPersonNodes___block_invoke;
        v13[3] = &unk_1E68EF578;
        id v14 = v4;
        [v11 enumerateNodesUsingBlock:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t __46__PGGraphBuilder__momentNodesFromPersonNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)feederForInsertingAssetCollection:(id)a3
{
  photoLibrary = self->_photoLibrary;
  id v5 = a3;
  uint64_t v6 = [(PHPhotoLibrary *)photoLibrary librarySpecificFetchOptions];
  uint64_t v7 = +[PGGraph assetPropertySetsForIngest];
  [v6 addFetchPropertySets:v7];

  [v6 setIncludeGuestAssets:1];
  uint64_t v8 = [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:2];
  uint64_t v9 = (void *)MEMORY[0x1E4F76CF0];
  id v10 = [(PGGraphBuilder *)self curationContext];
  unint64_t v11 = objc_msgSend(v9, "feederForAssetCollection:options:feederPrefetchOptions:curationContext:sharedLibraryEnabled:", v5, v6, v8, v10, -[PGGraphBuilder isSharedLibraryEnabled](self, "isSharedLibraryEnabled"));

  id v12 = [(CLSFocusPeopleCache *)self->_focusPeopleIngestCache personLocalIdentifiers];
  [v11 setFocusPersonLocalIdentifiers:v12];

  return v11;
}

- (id)momentForMomentNode:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 localIdentifier];
  if (v4)
  {
    id v5 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    [v5 setFetchLimit:1];
    uint64_t v6 = (void *)MEMORY[0x1E4F38EE8];
    v11[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    uint64_t v8 = [v6 fetchAssetCollectionsWithLocalIdentifiers:v7 options:v5];

    uint64_t v9 = [v8 firstObject];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_registerInsertedMomentNodes:(id)a3 inGraphUpdate:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v6 isResumingFullAnalysis])
  {
    uint64_t v7 = [(PGGraph *)self->_graph momentNodes];
    uint64_t v8 = [v7 set];
    [v6 setInsertedMomentNodes:v8];
  }
  else
  {
    [v6 setInsertedMomentNodes:v9];
  }
}

- (void)insertMomentsWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  id v54 = a4;
  id v62 = _Block_copy(v54);
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x2020000000;
  char v107 = 0;
  uint64_t v100 = 0;
  v101 = (double *)&v100;
  uint64_t v102 = 0x2020000000;
  uint64_t v103 = 0;
  id v6 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [v67 momentsToIngest];
    uint64_t v8 = [v7 count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1D1805000, (os_log_t)v6, OS_LOG_TYPE_INFO, "Batch Updates - About to insert %lu new moments", (uint8_t *)&buf, 0xCu);
  }
  id v9 = [v67 momentsToIngest];
  id v10 = [(PGGraphBuilder *)self _cleanUpMoments:v9];

  uint64_t v11 = objc_opt_new();
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = objc_alloc_init(PGUnfairLock);
  v60 = (void *)v12;
  v58 = objc_alloc_init(PGUnfairLock);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v118 = 0x2020000000;
  uint64_t v119 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x2020000000;
  double v99 = 0.0;
  uint64_t v55 = v13;
  uint64_t v57 = (void *)v11;
  double v99 = 0.95 / (double)(unint64_t)[v10 count];
  id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v94 objects:v116 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v95 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = [*(id *)(*((void *)&v94 + 1) + 8 * i) uuid];
        [v14 addObject:v19];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v94 objects:v116 count:16];
    }
    while (v16);
  }

  v64 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:v14 inGraph:self->_graph];
  id v65 = [v64 uuids];
  uint64_t v20 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = [v64 count];
    LODWORD(v112) = 134217984;
    *(void *)((char *)&v112 + 4) = v21;
    _os_log_impl(&dword_1D1805000, (os_log_t)v20, OS_LOG_TYPE_INFO, "Batch Updates - %lu moments are already ingested", (uint8_t *)&v112, 0xCu);
  }

  [(MAGraph *)self->_graph enterBatch];
  if ([v67 isResumingFullAnalysis] && !objc_msgSend(v65, "count"))
  {
    [(PGGraphBuilder *)self computeAndPersistTopTierAestheticScores];
    [(PGGraphBuilder *)self computeAndPersistAssetStatistics];
  }
  uint64_t v22 = [(PGGraphBuilder *)self insertOrUpdateMePersonNodeIfNeeded];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    LODWORD(v112) = 138412290;
    *(void *)((char *)&v112 + 4) = v22;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[PGGraphBuilder][insertMomentsWithGraphUpdate:progressBlock:] Me node=%@", (uint8_t *)&v112, 0xCu);
  }
  if ([(PGGraphBuilder *)self isSharedLibraryEnabled])
  {
    BOOL v24 = [(PGGraphBuilder *)self sharedLibraryParticipants];
    [(PGGraphBuilder *)self insertPersonNodesForShareParticipants:v24];
  }
  uint64_t v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:0];
  v115[0] = v25;
  double v26 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v115[1] = v26;
  uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:2];
  BOOL v28 = [v15 sortedArrayUsingDescriptors:v27];

  double v29 = (void *)[objc_alloc(MEMORY[0x1E4F76CE8]) initWithServiceManager:self->_serviceManager locationCache:self->_locationCache aoiCache:self->_aoiCache poiCache:self->_poiCache roiCache:self->_roiCache natureCache:self->_natureCache];
  id v30 = objc_alloc_init(MEMORY[0x1E4F76CD8]);
  long long v31 = self->_graph;
  *(void *)&long long v112 = 0;
  *((void *)&v112 + 1) = &v112;
  uint64_t v113 = 0x2020000000;
  uint64_t v114 = 0;
  v93[0] = 0;
  v93[1] = v93;
  v93[2] = 0x2020000000;
  v93[3] = 0;
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x2020000000;
  CFAbsoluteTime Current = 0.0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PGGraphBuilder_insertMomentsWithGraphUpdate_progressBlock___block_invoke;
  aBlock[3] = &unk_1E68E6EA8;
  double v50 = v58;
  long long v71 = v50;
  v83 = &v104;
  id v52 = v28;
  id v72 = v52;
  id v51 = v65;
  id v73 = v51;
  uint64_t v90 = 0x3F847AE147AE147BLL;
  v84 = &v100;
  p_long long buf = &buf;
  v86 = v98;
  id v66 = v62;
  id v82 = v66;
  uint64_t v74 = self;
  id v49 = v60;
  id v75 = v49;
  id v53 = v29;
  id v76 = v53;
  id v59 = v30;
  id v77 = v59;
  uint64_t v56 = v55;
  __int16 v78 = v56;
  id v68 = v67;
  id v79 = v68;
  id v61 = v31;
  v80 = v61;
  id v63 = v57;
  id v81 = v63;
  v87 = &v112;
  v88 = v93;
  v89 = v91;
  long long v32 = _Block_copy(aBlock);
  size_t v33 = [v15 count];
  double v34 = (void *)[v32 copy];
  dispatch_apply(v33, 0, v34);

  uint64_t v35 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
  BOOL v36 = [v35 anyNode];

  uint64_t v37 = [v36 localIdentifier];
  LODWORD(v34) = [v37 length] == 0;

  if (v34)
  {
    double v38 = self->_loggingConnection;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      LOWORD(v108) = 0;
      _os_log_impl(&dword_1D1805000, v38, OS_LOG_TYPE_INFO, "[PGGraphBuilder][insertMomentsWithGraphUpdate:progressBlock:] Me node gets inferred", (uint8_t *)&v108, 2u);
    }
    [(PGGraphBuilder *)self inferPersonNodeForMeNode:v36];
  }
  [(MAGraph *)self->_graph leaveBatch];
  if (*((unsigned char *)v105 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v108 = 67109378;
      int v109 = 1279;
      __int16 v110 = 2080;
      v111 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Ing"
             "est/PGGraphBuilder.m";
      __int16 v39 = MEMORY[0x1E4F14500];
LABEL_26:
      _os_log_impl(&dword_1D1805000, v39, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v108, 0x12u);
    }
  }
  else
  {
    [(PGGraphBuilder *)self clearPersonActivityMeaningCriteriaDictionaryByMeaningLabel];
    if (v66)
    {
      double v40 = CFAbsoluteTimeGetCurrent();
      if (v40 - v101[3] >= 0.01)
      {
        v101[3] = v40;
        char v69 = 0;
        (*((void (**)(id, char *, double))v66 + 2))(v66, &v69, 0.9);
        char v41 = *((unsigned char *)v105 + 24) | v69;
        *((unsigned char *)v105 + 24) = v41;
        if (v41)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_41;
          }
          int v108 = 67109378;
          int v109 = 1283;
          __int16 v110 = 2080;
          v111 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph"
                 "/Ingest/PGGraphBuilder.m";
          __int16 v39 = MEMORY[0x1E4F14500];
          goto LABEL_26;
        }
      }
    }
    [(PGGraphBuilder *)self persistPendingScores];
    [(MAGraph *)self->_graph enterBatch];
    id v42 = +[PGGraphInfoNode assetPropertiesWithNumberOfUtilityAssets:self->_numberOfUtilityAssets numberOfDefaultAssets:self->_numberOfDefaultAssets numberOfImprovedAssets:self->_numberOfImprovedAssets numberOfBetterAssets:self->_numberOfBetterAssets];
    CLLocationCoordinate2D v43 = v42;
    if ([v68 isResumingFullAnalysis])
    {
      CLLocationCoordinate2D v43 = (void *)[v42 mutableCopy];
      CLLocationCoordinate2D v44 = +[PGGraphInfoNode routineInfoPropertiesWithServiceManager:self->_serviceManager];
      [v43 addEntriesFromDictionary:v44];
    }
    uint64_t v45 = [(PGGraph *)self->_graph infoNode];
    uint64_t v46 = [v45 identifier];

    [(MAGraph *)self->_graph persistModelProperties:v43 forNodeWithIdentifier:v46 clobberExisting:0];
    [(MAGraph *)self->_graph leaveBatch];
    [(PGGraph *)self->_graph invalidateMemoryCaches];
    if (v66
      && (double v47 = CFAbsoluteTimeGetCurrent(), v47 - v101[3] >= 0.01)
      && (v101[3] = v47,
          char v69 = 0,
          (*((void (**)(id, char *, double))v66 + 2))(v66, &v69, 1.0),
          char v48 = *((unsigned char *)v105 + 24) | v69,
          (*((unsigned char *)v105 + 24) = v48) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v108 = 67109378;
        int v109 = 1305;
        __int16 v110 = 2080;
        v111 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/I"
               "ngest/PGGraphBuilder.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v108, 0x12u);
      }
    }
    else
    {
      [(PGGraphBuilder *)self _registerInsertedMomentNodes:v63 inGraphUpdate:v68];
    }
  }
LABEL_41:

  _Block_object_dispose(v91, 8);
  _Block_object_dispose(v93, 8);
  _Block_object_dispose(&v112, 8);

  _Block_object_dispose(v98, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v104, 8);
}

void __61__PGGraphBuilder_insertMomentsWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v57[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) lock];
  int v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 128) + 8) + 24);
  [*(id *)(a1 + 32) unlock];
  if (!v4)
  {
    id v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
    id v6 = *(void **)(a1 + 48);
    uint64_t v7 = [v5 uuid];
    int v8 = [v6 containsObject:v7];

    if (*(void *)(a1 + 120))
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [*(id *)(a1 + 32) lock];
      uint64_t v10 = *(void *)(*(void *)(a1 + 136) + 8);
      if (Current - *(double *)(v10 + 24) >= *(double *)(a1 + 184))
      {
        *(double *)(v10 + 24) = Current;
        buf[0] = 0;
        (*(void (**)(double))(*(void *)(a1 + 120) + 16))(*(double *)(*(void *)(*(void *)(a1 + 144)
                                                                                              + 8)
                                                                                  + 24));
        *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8)
                                                                               + 24);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24)) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) unlock];
    }
    if (!v8)
    {
      unint64_t v11 = [v5 estimatedAssetCount];
      if (v11 <= *MEMORY[0x1E4F76BF0])
      {
        uint64_t v12 = (void *)MEMORY[0x1D25FED50]();
        uint64_t v13 = [*(id *)(a1 + 56) feederForInsertingAssetCollection:v5];
        [v13 setLocationClusteringAlgorithm:0];
        id v14 = objc_alloc(MEMORY[0x1E4F76CE0]);
        v57[0] = *(void *)(a1 + 64);
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
        uint64_t v16 = (void *)[v14 initWithFeeder:v13 profiles:v15 helper:*(void *)(a1 + 72)];

        [v16 setPrecision:1];
        uint64_t v17 = *(void **)(a1 + 80);
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __61__PGGraphBuilder_insertMomentsWithGraphUpdate_progressBlock___block_invoke_2;
        v43[3] = &unk_1E68E6E58;
        id v45 = *(id *)(a1 + 120);
        id v44 = *(id *)(a1 + 32);
        uint64_t v48 = *(void *)(a1 + 184);
        long long v46 = *(_OWORD *)(a1 + 136);
        uint64_t v47 = *(void *)(a1 + 128);
        [v17 performInvestigation:v16 progressBlock:v43];
        [*(id *)(a1 + 32) lock];
        LODWORD(v17) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 128) + 8) + 24);
        [*(id *)(a1 + 32) unlock];
        if (!v17)
        {
          [*(id *)(a1 + 88) lock];
          long long v18 = *(void **)(a1 + 56);
          id v19 = [v16 clueCollection];
          id v42 = 0;
          uint64_t v20 = *(void *)(a1 + 96);
          uint64_t v32 = MEMORY[0x1E4F143A8];
          uint64_t v33 = 3221225472;
          double v34 = __61__PGGraphBuilder_insertMomentsWithGraphUpdate_progressBlock___block_invoke_3;
          uint64_t v35 = &unk_1E68E6E80;
          id v38 = *(id *)(a1 + 120);
          id v36 = *(id *)(a1 + 32);
          uint64_t v41 = *(void *)(a1 + 184);
          long long v39 = *(_OWORD *)(a1 + 136);
          uint64_t v40 = *(void *)(a1 + 128);
          id v37 = *(id *)(a1 + 104);
          uint64_t v21 = [v18 _insertMomentNodeForClueCollection:v19 feeder:v13 insertedAndUpdatedPersonNodes:&v42 graphUpdate:v20 progressBlock:&v32];
          id v22 = v42;

          objc_msgSend(*(id *)(a1 + 32), "lock", v32, v33, v34, v35);
          LODWORD(v19) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 128) + 8) + 24);
          [*(id *)(a1 + 32) unlock];
          if (v19)
          {
            [*(id *)(a1 + 88) unlock];
          }
          else
          {
            if (v21)
            {
              [*(id *)(a1 + 112) addObject:v21];
              if (v22) {
                [*(id *)(a1 + 96) registerInsertedAndUpdatedPersonNodes:v22];
              }
            }
            else
            {
              char v23 = +[PGLogging sharedLogging];
              BOOL v24 = [v23 loggingConnection];

              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v50 = (uint64_t)v5;
                _os_log_error_impl(&dword_1D1805000, v24, OS_LOG_TYPE_ERROR, "Failed to insert moment collection: \"%@\"", buf, 0xCu);
              }
            }
            [*(id *)(a1 + 32) lock];
            *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 152)
                                                                                                 + 8)
                                                                                     + 24)
                                                                         + *(double *)(*(void *)(*(void *)(a1 + 144)
                                                                                                 + 8)
                                                                                     + 24);
            [*(id *)(a1 + 32) unlock];

            ++*(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 24);
            *(void *)(*(void *)(*(void *)(a1 + 168) + 8) + 24) += [v13 numberOfItems];
            if (0x8F5C28F5C28F5C29 * [*(id *)(a1 + 112) count] <= 0xA3D70A3D70A3D70)
            {
              [*(id *)(a1 + 56) persistPendingScores];
              [*(id *)(a1 + 104) leaveBatch];
              [*(id *)(a1 + 104) invalidateMemoryCaches];
              [*(id *)(a1 + 104) enterBatch];
              double v25 = CFAbsoluteTimeGetCurrent();
              double v26 = +[PGLogging sharedLogging];
              uint64_t v27 = [v26 loggingConnection];

              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                uint64_t v28 = [*(id *)(a1 + 112) count];
                uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 24);
                uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 168) + 8) + 24);
                double v31 = v25 - *(double *)(*(void *)(*(void *)(a1 + 176) + 8) + 24);
                *(_DWORD *)long long buf = 134218752;
                uint64_t v50 = v28;
                __int16 v51 = 2048;
                uint64_t v52 = v29;
                __int16 v53 = 2048;
                uint64_t v54 = v30;
                __int16 v55 = 2048;
                double v56 = v31;
                _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "Saved graph for %lu moments, batch is %lu moments, %lu assets, took %.3f seconds", buf, 0x2Au);
              }

              *(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 24) = 0;
              *(void *)(*(void *)(*(void *)(a1 + 168) + 8) + 24) = 0;
              *(double *)(*(void *)(*(void *)(a1 + 176) + 8) + 24) = v25;
            }
            [*(id *)(a1 + 88) unlock];
          }
        }

        goto LABEL_25;
      }
    }
    [*(id *)(a1 + 32) lock];
    *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 152) + 8)
                                                                             + 24)
                                                                 + *(double *)(*(void *)(*(void *)(a1 + 144) + 8)
                                                                             + 24);
LABEL_9:
    [*(id *)(a1 + 32) unlock];
LABEL_25:
  }
}

uint64_t __61__PGGraphBuilder_insertMomentsWithGraphUpdate_progressBlock___block_invoke_2(uint64_t result, unsigned char *a2)
{
  if (*(void *)(result + 40))
  {
    uint64_t v3 = result;
    double Current = CFAbsoluteTimeGetCurrent();
    [*(id *)(v3 + 32) lock];
    uint64_t v5 = *(void *)(*(void *)(v3 + 48) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(v3 + 72))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(void *)(v3 + 40) + 16))(*(double *)(*(void *)(*(void *)(v3 + 56) + 8)
                                                                               + 24));
      *(unsigned char *)(*(void *)(*(void *)(v3 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(v3 + 64) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(v3 + 64) + 8) + 24)) {
        *a2 = 1;
      }
    }
    return [*(id *)(v3 + 32) unlock];
  }
  return result;
}

uint64_t __61__PGGraphBuilder_insertMomentsWithGraphUpdate_progressBlock___block_invoke_3(uint64_t result, char *a2)
{
  if (*(void *)(result + 48))
  {
    uint64_t v3 = result;
    double Current = CFAbsoluteTimeGetCurrent();
    [*(id *)(v3 + 32) lock];
    uint64_t v5 = *(void *)(*(void *)(v3 + 56) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(v3 + 80))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(void *)(v3 + 48) + 16))(*(double *)(*(void *)(*(void *)(v3 + 64) + 8)
                                                                               + 24));
      *(unsigned char *)(*(void *)(*(void *)(v3 + 72) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(v3 + 72) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(v3 + 72) + 8) + 24))
      {
        char v6 = 1;
LABEL_7:
        *a2 = v6;
        return [*(id *)(v3 + 32) unlock];
      }
      if (([*(id *)(v3 + 40) noFatalError] & 1) == 0)
      {
        char v6 = *(unsigned char *)(*(void *)(*(void *)(v3 + 72) + 8) + 24);
        goto LABEL_7;
      }
    }
    return [*(id *)(v3 + 32) unlock];
  }
  return result;
}

- (void)_removeEdgesFromMomentNode:(id)a3 forUpdateTypes:(unint64_t)a4
{
  char v4 = a4;
  id v21 = [a3 collection];
  id v6 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  if ((v4 & 2) != 0)
  {
    uint64_t v7 = +[PGGraphDateEdge filter];
    int v8 = +[MAEdgeCollection edgesFromNodes:v21 matchingFilter:v7];

    [v6 removeEdges:v8];
  }
  if ((v4 & 4) != 0)
  {
    id v9 = +[PGGraphAddressEdge filter];
    uint64_t v10 = +[MAEdgeCollection edgesFromNodes:v21 matchingFilter:v9];

    [v6 removeEdges:v10];
    if ((v4 & 8) == 0)
    {
LABEL_8:
      uint64_t v13 = +[PGGraphPOIEdge filter];
      id v14 = +[MAEdgeCollection edgesFromNodes:v21 matchingFilter:v13];

      [v6 removeEdges:v14];
      id v15 = +[PGGraphROIEdge filter];
      uint64_t v16 = +[MAEdgeCollection edgesFromNodes:v21 matchingFilter:v15];

      [v6 removeEdges:v16];
      goto LABEL_9;
    }
LABEL_7:
    unint64_t v11 = +[PGGraphBasePresentEdge filter];
    uint64_t v12 = +[MAEdgeCollection edgesFromNodes:v21 matchingFilter:v11];

    [v6 removeEdges:v12];
    goto LABEL_8;
  }
  if ((v4 & 8) != 0) {
    goto LABEL_7;
  }
LABEL_9:
  if ((v4 & 0x19) != 0)
  {
    uint64_t v17 = +[PGGraphSceneEdge filter];
    long long v18 = +[MAEdgeCollection edgesFromNodes:v21 matchingFilter:v17];

    [v6 removeEdges:v18];
    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    {
      id v19 = +[PGGraphSceneEdge filter];
      uint64_t v20 = +[MAEdgeCollection edgesFromNodes:v21 matchingFilter:v19];

      [v6 removeEdges:v20];
    }
  }
  [(MAGraph *)self->_graph executeGraphChangeRequest:v6];
}

- (void)performChangeForGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v42 = a4;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  char v82 = 0;
  uint64_t v75 = 0;
  id v76 = (double *)&v75;
  uint64_t v77 = 0x2020000000;
  uint64_t v78 = 0;
  long long v46 = _Block_copy(v42);
  if (!v46
    || (double v6 = CFAbsoluteTimeGetCurrent(), v6 - v76[3] < 0.01)
    || (v76[3] = v6,
        LOBYTE(v83) = 0,
        (*((void (**)(void *, int *, double))v46 + 2))(v46, &v83, 0.0),
        char v7 = *((unsigned char *)v80 + 24) | v83,
        (*((unsigned char *)v80 + 24) = v7) == 0))
  {
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v37 = self->_loggingConnection;
    int v8 = [v47 uuidsOfMomentsToUpdate];
    id v45 = +[PGGraphMomentNodeCollection momentNodesForUUIDs:v8 inGraph:self->_graph];

    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v45, "count"));
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke;
    v73[3] = &unk_1E68EF578;
    id v10 = v9;
    id v74 = v10;
    [v45 enumerateNodesUsingBlock:v73];
    unint64_t v11 = [v47 uuidsOfHighlightsToUpdate];
    id v44 = +[PGGraphHighlightNodeCollection highlightNodesForUUIDs:v11 inGraph:self->_graph];

    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v44, "count"));
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_2;
    v71[3] = &unk_1E68EB678;
    id v13 = v12;
    id v72 = v13;
    [v44 enumerateNodesUsingBlock:v71];
    id v14 = [v47 localIdentifiersOfPersonsToUpdate];
    CLLocationCoordinate2D v43 = +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:v14 inGraph:self->_graph];

    id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v43, "count"));
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_3;
    v69[3] = &unk_1E68EF528;
    id v16 = v15;
    id v70 = v16;
    [v43 enumerateNodesUsingBlock:v69];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v18 = [v47 contactIdentifiersOfPersonsToUpdate];
    BOOL v19 = [v18 count] == 0;

    if (!v19)
    {
      uint64_t v20 = [v47 contactIdentifiersOfPersonsToUpdate];
      id v21 = +[PGGraphPersonNodeCollection personNodesForContactIdentifiers:v20 inGraph:self->_graph];

      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_4;
      v67[3] = &unk_1E68EF528;
      id v68 = v17;
      [v21 enumerateNodesUsingBlock:v67];
    }
    id v22 = objc_alloc_init(MEMORY[0x1E4F76CD8]);
    char v23 = (void *)[objc_alloc(MEMORY[0x1E4F76CE8]) initWithServiceManager:self->_serviceManager locationCache:self->_locationCache aoiCache:self->_aoiCache poiCache:self->_poiCache roiCache:self->_roiCache natureCache:self->_natureCache];
    [(MAGraph *)self->_graph enterBatch];
    uint64_t buf = 0;
    *(void *)&long long v88 = &buf;
    *((void *)&v88 + 1) = 0x2020000000;
    uint64_t v89 = 0;
    double v24 = 1.0 / (double)(unint64_t)[v47 numberOfConsolidatedChanges];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_5;
    v49[3] = &unk_1E68E6E30;
    id v36 = v10;
    id v50 = v36;
    id v25 = v47;
    id v51 = v25;
    uint64_t v52 = self;
    id v38 = v37;
    __int16 v53 = v38;
    id v26 = v23;
    id v54 = v26;
    id v27 = v22;
    id v55 = v27;
    p_uint64_t buf = &buf;
    double v65 = v24;
    id v28 = v46;
    id v61 = v28;
    uint64_t v66 = 0x3F847AE147AE147BLL;
    id v63 = &v75;
    v64 = &v79;
    id v41 = v40;
    id v56 = v41;
    id v29 = v16;
    id v57 = v29;
    id v30 = v17;
    id v58 = v30;
    id v31 = v39;
    id v59 = v31;
    id v32 = v13;
    id v60 = v32;
    [v25 enumerateConsolidatedChanges:v49];
    [(MAGraph *)self->_graph leaveBatch];
    if (*((unsigned char *)v80 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_17:

        _Block_object_dispose(&buf, 8);
        goto LABEL_18;
      }
      int v83 = 67109378;
      int v84 = 972;
      __int16 v85 = 2080;
      v86 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/PGGraphBuilder.m";
      uint64_t v33 = MEMORY[0x1E4F14500];
    }
    else
    {
      objc_msgSend(v25, "registerInsertedAndUpdatedPersonNodes:", v41, v36, v38);
      [v25 registerUpdatedPersonNodesUnrelatedToMomentChange:v31];
      [(PGGraphBuilder *)self persistPendingScores];
      if (!v46) {
        goto LABEL_17;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v76[3] < 0.01) {
        goto LABEL_17;
      }
      v76[3] = Current;
      char v48 = 0;
      (*((void (**)(id, char *, double))v28 + 2))(v28, &v48, 1.0);
      char v35 = *((unsigned char *)v80 + 24) | v48;
      *((unsigned char *)v80 + 24) = v35;
      if (!v35 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      int v83 = 67109378;
      int v84 = 979;
      __int16 v85 = 2080;
      v86 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/PGGraphBuilder.m";
      uint64_t v33 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v83, 0x12u);
    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0x2BF04000202;
    LOWORD(v88) = 2080;
    *(void *)((char *)&v88 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/PGGraphBuilder.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_18:
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);
}

void __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 uuid];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 uuid];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 localIdentifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 contactIdentifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_5(uint64_t a1, void *a2, unsigned char *a3)
{
  v147[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = (void *)MEMORY[0x1D25FED50]();
  if ([v5 type] == 3)
  {
    id v7 = v5;
    int v8 = *(void **)(a1 + 32);
    id v9 = [v7 momentUUID];
    id v10 = [v8 objectForKeyedSubscript:v9];

    if (!v10)
    {
      id v25 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = v25;
        id v27 = [v7 momentUUID];
        *(_DWORD *)uint64_t buf = 138412290;
        v144 = v27;
        _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "No momentNode found for UUID %@", buf, 0xCu);
      }
      goto LABEL_46;
    }
    uint64_t v11 = [*(id *)(a1 + 40) cachedDataModelObjectForGraphChange:v7];
    uint64_t v12 = (void *)v11;
    if (!v11)
    {
LABEL_45:

LABEL_46:
      goto LABEL_47;
    }
    uint64_t v119 = v10;
    uint64_t v120 = (void *)v11;
    v125 = v6;
    v127 = a3;
    v123 = [*(id *)(a1 + 48) feederForInsertingAssetCollection:v11];
    [v123 setLocationClusteringAlgorithm:0];
    id v13 = *(id *)(a1 + 56);
    os_signpost_id_t v14 = os_signpost_id_generate(v13);
    id v15 = v13;
    id v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Investigation", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v17 = mach_absolute_time();
    id v18 = objc_alloc(MEMORY[0x1E4F76CE0]);
    BOOL v19 = objc_opt_new();
    v147[0] = v19;
    int v20 = 1;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v147 count:1];
    uint64_t v22 = [v18 initWithFeeder:v123 profiles:v21 helper:*(void *)(a1 + 64)];

    char v23 = *(void **)(a1 + 72);
    v135[0] = MEMORY[0x1E4F143A8];
    v135[1] = 3221225472;
    v135[2] = __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_321;
    v135[3] = &unk_1E68F0380;
    uint64_t v138 = *(void *)(a1 + 152);
    long long v121 = *(_OWORD *)(a1 + 120);
    id v24 = (id)v121;
    long long v136 = v121;
    uint64_t v139 = *(void *)(a1 + 160);
    long long v137 = *(_OWORD *)(a1 + 136);
    v122 = (void *)v22;
    [v23 performInvestigation:v22 progressBlock:v135];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 144) + 8) + 24))
    {
      double v6 = v125;
      a3 = v127;
      unsigned char *v127 = 1;
      id v10 = v119;
      goto LABEL_43;
    }
    uint64_t v28 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    id v31 = v16;
    id v32 = v31;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v32, OS_SIGNPOST_INTERVAL_END, v14, "Investigation", "", buf, 2u);
    }

    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 136315394;
      v144 = "Investigation";
      __int16 v145 = 2048;
      double v146 = (float)((float)((float)((float)(v28 - v17) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    uint64_t v33 = [v122 clueCollection];
    unsigned __int8 v134 = 0;
    id v10 = v119;
    objc_msgSend(*(id *)(a1 + 48), "_removeEdgesFromMomentNode:forUpdateTypes:", v119, objc_msgSend(v7, "updateTypes"));
    id v117 = [[PGGraphIngestMomentContainer alloc] initMomentContainerWithFeeder:v123 clueCollection:v33 curationManager:*(void *)(*(void *)(a1 + 48) + 160) topTierAestheticScore:*(void *)(*(void *)(a1 + 48) + 200) curationContext:*(double *)(*(void *)(a1 + 48) + 40)];
    id v118 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v6 = v125;
    a3 = v127;
    if (([v7 updateTypes] & 2) != 0)
    {
      double v34 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        char v35 = v34;
        id v36 = [v7 momentUUID];
        *(_DWORD *)uint64_t buf = 138412290;
        v144 = v36;
        _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "MomentNode UUID %@ for moment update related to date", buf, 0xCu);
      }
      id v37 = (id)[*(id *)(a1 + 48) insertDateNodesWithClueCollection:v33 fromMomentNode:v119];
      id v38 = +[PGGraphMomentNode timeBasedPropertiesWithMoment:v117];
      [v118 addEntriesFromDictionary:v38];
      [*(id *)(a1 + 40) updatedMomentNode:v119 forUpdateChangeType:2];
    }
    if (([v7 updateTypes] & 4) != 0)
    {
      id v39 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        id v40 = v39;
        id v41 = [v7 momentUUID];
        *(_DWORD *)uint64_t buf = 138412290;
        v144 = v41;
        _os_log_impl(&dword_1D1805000, v40, OS_LOG_TYPE_INFO, "MomentNode UUID %@ for moment update related to location", buf, 0xCu);
      }
      id v42 = (id)[*(id *)(a1 + 48) insertLocationHierarchyWithClueCollection:v33 fromMomentNode:v119];
      [*(id *)(a1 + 40) updatedMomentNode:v119 forUpdateChangeType:4];
      if (([v7 updateTypes] & 8) == 0) {
        goto LABEL_29;
      }
    }
    else if (([v7 updateTypes] & 8) == 0)
    {
LABEL_30:
      if (([v7 updateTypes] & 0x19) != 0)
      {
        id v50 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          id v51 = v50;
          uint64_t v52 = [v7 momentUUID];
          *(_DWORD *)uint64_t buf = 138412290;
          v144 = v52;
          _os_log_impl(&dword_1D1805000, v51, OS_LOG_TYPE_INFO, "MomentNode UUID %@ for moment update related to curation content", buf, 0xCu);
        }
        __int16 v53 = *(void **)(a1 + 48);
        v129[0] = MEMORY[0x1E4F143A8];
        v129[1] = 3221225472;
        v129[2] = __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_324;
        v129[3] = &unk_1E68F0380;
        uint64_t v132 = *(void *)(a1 + 152);
        long long v116 = *(_OWORD *)(a1 + 120);
        id v54 = (id)v116;
        uint64_t v133 = *(void *)(a1 + 160);
        long long v55 = *(_OWORD *)(a1 + 136);
        long long v130 = v116;
        long long v131 = v55;
        [v53 insertAssetCurationScoreInLibraryForFeeder:v123 progressBlock:v129];
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 144) + 8) + 24))
        {
          id v56 = (void *)v33;
          int v20 = 1;
          unsigned char *v127 = 1;
          id v57 = (void *)v130;
LABEL_42:

LABEL_43:
          uint64_t v12 = v120;
          if (v20)
          {

            goto LABEL_104;
          }
          goto LABEL_45;
        }
        id v58 = +[PGGraphMomentNode contentBasedPropertiesWithMoment:v117];
        [v118 addEntriesFromDictionary:v58];
        id v59 = *(void **)(*(void *)(a1 + 48) + 160);
        id v60 = (void *)MEMORY[0x1E4F1CAD0];
        id v61 = [v7 momentUUID];
        id v62 = [v60 setWithObject:v61];
        [v59 invalidateCurationCacheForMomentUUIDs:v62];

        id v63 = (id)[*(id *)(a1 + 48) insertScenesWithClueCollection:v33 fromMomentNode:v119];
        if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl()) {
          objc_msgSend(*(id *)(a1 + 48), "insertEntityNetScenesWithClueCollection:fromMomentNode:", v33, v119, v116);
        }
        objc_msgSend(*(id *)(a1 + 40), "updatedMomentNode:forUpdateChangeType:", v119, 25, v116);

        double v6 = v125;
        a3 = v127;
      }
      id v56 = (void *)v33;
      id v57 = [v119 changingPropertiesWithProperties:v118];
      if ([v57 count]) {
        objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v57, objc_msgSend(v119, "identifier"), 0);
      }
      int v20 = 0;
      goto LABEL_42;
    }
    CLLocationCoordinate2D v43 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      id v44 = v43;
      id v45 = [v7 momentUUID];
      *(_DWORD *)uint64_t buf = 138412290;
      v144 = v45;
      _os_log_impl(&dword_1D1805000, v44, OS_LOG_TYPE_INFO, "MomentNode UUID %@ for moment update related to person changes", buf, 0xCu);
    }
    long long v46 = [v119 addressNodes];
    id v47 = [*(id *)(a1 + 48) insertPeopleWithClueCollection:v33 fromMomentNode:v119 addressNodes:v46 isNearPeopleAddress:&v134];
    [*(id *)(a1 + 80) unionSet:v47];
    [*(id *)(a1 + 40) updatedMomentNode:v119 forUpdateChangeType:8];

LABEL_29:
    id v48 = (id)[*(id *)(a1 + 48) insertPOIWithFeeder:v123 fromMomentNode:v119 isNearHomeOrWork:v134];
    id v49 = (id)[*(id *)(a1 + 48) insertROIWithClueCollection:v33 fromMomentNode:v119];
    [*(id *)(a1 + 40) updatedMomentNode:v119 forUpdateChangeType:4];
    goto LABEL_30;
  }
LABEL_47:
  if (objc_msgSend(v5, "type", v116) == 6)
  {
    v128 = a3;
    id v64 = v5;
    double v65 = [v64 personLocalIdentifier];
    uint64_t v66 = [v64 contactIdentifier];
    if ([v65 length])
    {
      id v67 = *(void **)(a1 + 88);
      uint64_t v68 = [v64 personLocalIdentifier];
    }
    else
    {
      if (![v66 length]) {
        goto LABEL_55;
      }
      id v67 = *(void **)(a1 + 96);
      uint64_t v68 = [v64 contactIdentifier];
    }
    char v69 = (void *)v68;
    id v70 = [v67 objectForKeyedSubscript:v68];

    if (v70)
    {
      if ([v65 length])
      {
        long long v71 = *(void **)(*(void *)(a1 + 48) + 168);
        v142 = v65;
        id v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v142 count:1];
        [v71 invalidatePersonsCacheForPersonsWithNames:v72];

        id v73 = [MEMORY[0x1E4F76CC8] clueWithPersonLocalIdentifier:v65 inPhotoLibrary:*(void *)(*(void *)(a1 + 48) + 152) serviceManager:*(void *)(*(void *)(a1 + 48) + 168)];
      }
      else
      {
        id v73 = 0;
      }
      if (![v66 length])
      {
        uint64_t v77 = v65;
        uint64_t v78 = v6;
        uint64_t v79 = [v70 contactIdentifier];
        uint64_t v80 = [v79 length];

        if (v80)
        {
          uint64_t v81 = [v70 contactIdentifier];

          uint64_t v66 = (void *)v81;
        }
        double v6 = v78;
        double v65 = v77;
      }
      v126 = v6;
      if ([v66 length])
      {
        char v82 = *(void **)(*(void *)(a1 + 48) + 168);
        v141 = v66;
        int v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v141 count:1];
        [v82 invalidatePersonsCacheForPersonsWithContactIdentifiers:v83];

        if (v73) {
          goto LABEL_66;
        }
        id v73 = [MEMORY[0x1E4F76CC8] clueWithPersonContactIdentifier:v66 inPhotoLibrary:*(void *)(*(void *)(a1 + 48) + 152) serviceManager:*(void *)(*(void *)(a1 + 48) + 168)];
      }
      if (!v73)
      {
LABEL_69:
        v92 = [*(id *)(a1 + 40) relatedDetails];
        [v92 accumulateDetailsForUpdatedPersonNode:v70 personChange:v64];

        [*(id *)(a1 + 80) addObject:v70];
        [*(id *)(a1 + 104) addObject:v70];

        double v6 = v126;
LABEL_70:
        a3 = v128;

        goto LABEL_71;
      }
LABEL_66:
      int v84 = [v73 person];
      if (v84)
      {
        v124 = *(void **)(a1 + 48);
        __int16 v85 = v73;
        v86 = v66;
        v87 = v65;
        id v88 = v5;
        uint64_t v89 = [v70 identifier];
        uint64_t v90 = [v64 propertyNames];
        uint64_t v91 = v89;
        id v5 = v88;
        double v65 = v87;
        uint64_t v66 = v86;
        id v73 = v85;
        [v124 updatePersonNodeForIdentifier:v91 withPerson:v84 forPropertyNames:v90];
      }
      goto LABEL_69;
    }
LABEL_55:
    id v74 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      uint64_t v75 = v74;
      id v76 = [v64 personLocalIdentifier];
      *(_DWORD *)uint64_t buf = 138412290;
      v144 = v76;
      _os_log_impl(&dword_1D1805000, v75, OS_LOG_TYPE_INFO, "No personNode found for localIdentifier %@", buf, 0xCu);
    }
    goto LABEL_70;
  }
LABEL_71:
  if ([v5 type] == 9)
  {
    id v93 = v5;
    if (([v93 updateTypes] & 4) != 0 || (objc_msgSend(v93, "updateTypes") & 2) != 0)
    {
      long long v94 = *(void **)(a1 + 112);
      long long v95 = [v93 highlightUUID];
      long long v96 = [v94 objectForKeyedSubscript:v95];

      if (v96)
      {
        long long v97 = [*(id *)(a1 + 40) cachedDataModelObjectForGraphChange:v93];
        if (v97)
        {
          [*(id *)(a1 + 48) updateHighlightNode:v96 withHighlight:v97];
          if (([v93 updateTypes] & 4) != 0) {
            [*(id *)(a1 + 40) updatedHighlightNode:v96 forUpdateChangeType:4];
          }
          if (([v93 updateTypes] & 2) != 0) {
            [*(id *)(a1 + 40) updatedHighlightNode:v96 forUpdateChangeType:2];
          }
        }
        else
        {
          v101 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t buf = 138412290;
            v144 = v96;
            _os_log_error_impl(&dword_1D1805000, v101, OS_LOG_TYPE_ERROR, "GraphUpdate instance does not have cached PhotosHighlight data model but graph has Highlight node: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        v98 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
        {
          double v99 = v98;
          uint64_t v100 = [v93 highlightUUID];
          *(_DWORD *)uint64_t buf = 138412290;
          v144 = v100;
          _os_log_impl(&dword_1D1805000, v99, OS_LOG_TYPE_INFO, "No highlightNode found for uuid %@", buf, 0xCu);
        }
      }
    }
    if (([v93 updateTypes] & 8) != 0)
    {
      uint64_t v102 = *(void **)(a1 + 112);
      uint64_t v103 = [v93 highlightUUID];
      uint64_t v104 = [v102 objectForKeyedSubscript:v103];

      if (v104)
      {
        v105 = [*(id *)(a1 + 40) cachedDataModelObjectForGraphChange:v93];
        uint64_t v106 = v105;
        if (v105)
        {
          int v107 = [v105 kind];
          int v108 = *(void **)(a1 + 48);
          if (v107 == 3)
          {
            int v109 = [v108 nodesForHighlightsInHighlightDayGroup:v106];
            [*(id *)(a1 + 48) updateHighlightsForHighlightDayGroupNode:v104 nodesForHighlightsInHighlightDayGroup:v109];
          }
          else
          {
            int v109 = [v108 nodesForMomentsInHighlight:v106];
            [*(id *)(a1 + 48) updateMomentsForHighlightNode:v104 nodesForMomentsInHighlight:v109];
          }

          [*(id *)(a1 + 40) updatedHighlightNode:v104 forUpdateChangeType:8];
        }
        else
        {
          uint64_t v113 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t buf = 138412290;
            v144 = v104;
            _os_log_error_impl(&dword_1D1805000, v113, OS_LOG_TYPE_ERROR, "GraphUpdate instance does not have cached PhotosHighlight data model but graph has Highlight node: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        __int16 v110 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          v111 = v110;
          long long v112 = [v93 highlightUUID];
          *(_DWORD *)uint64_t buf = 138412290;
          v144 = v112;
          _os_log_impl(&dword_1D1805000, v111, OS_LOG_TYPE_INFO, "No highlightNode found for uuid %@", buf, 0xCu);
        }
      }
    }
  }
  *(double *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = *(double *)(a1 + 152)
                                                               + *(double *)(*(void *)(*(void *)(a1 + 128) + 8)
                                                                           + 24);
  if (*(void *)(a1 + 120))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v115 = *(void *)(*(void *)(a1 + 136) + 8);
    if (Current - *(double *)(v115 + 24) >= *(double *)(a1 + 160))
    {
      *(double *)(v115 + 24) = Current;
      buf[0] = 0;
      (*(void (**)(double))(*(void *)(a1 + 120) + 16))(*(double *)(*(void *)(*(void *)(a1 + 128) + 8)
                                                                                + 24));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) |= buf[0];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 144) + 8) + 24)) {
        *a3 = 1;
      }
    }
  }
LABEL_104:
}

void __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_321(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    double v7 = *(double *)(a1 + 64);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6 + v7 * (a3 * 0.5));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_324(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    double v7 = *(double *)(a1 + 64);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6 + v7 * (a3 * 0.5 + 0.5));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)_deleteSocialGroupsWithGraphUpdate:(id)a3
{
  id v6 = [a3 uuidsOfSocialGroupsToDelete];
  id v4 = +[PGGraphSocialGroupNodeCollection socialGroupNodesForPersistedUUIDs:inGraph:](PGGraphSocialGroupNodeCollection, "socialGroupNodesForPersistedUUIDs:inGraph:");
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    [v5 removeNodes:v4];
    [(MAGraph *)self->_graph executeGraphChangeRequest:v5];
  }
}

- (void)deletePersonsWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void (**)(id, int *, double))a4;
  int v8 = [v6 localIdentifiersOfPersonsToDelete];
  uint64_t v9 = [v8 count];
  serviceManager = self->_serviceManager;
  uint64_t v11 = [v8 allObjects];
  [(CLSServiceManager *)serviceManager invalidatePersonsCacheForPersonsWithNames:v11];

  uint64_t v12 = +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:v8 inGraph:self->_graph];
  uint64_t v13 = [v12 count];
  if (v13)
  {
    os_signpost_id_t v14 = [v6 relatedDetails];
    [v14 accumulateDetailsForDeletedPersonNodes:v12];

    id v15 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    [v15 removeNodes:v12];
    [(MAGraph *)self->_graph executeGraphChangeRequest:v15];
    [v6 setHasDeletedPersonNodes:1];
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int v17 = 134218240;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "Batch Updates - Deleted %lu persons (%lu persons requested)", (uint8_t *)&v17, 0x16u);
  }
  LOBYTE(v17) = 0;
  v7[2](v7, &v17, 1.0);
}

- (void)_deleteMomentsWithGraphUpdate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uuidsOfMomentsToDelete];
  uint64_t v6 = [v5 count];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int v16 = 134217984;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "Batch Updates - About to delete %lu Moments", (uint8_t *)&v16, 0xCu);
  }
  [(PGCurationManager *)self->_curationManager invalidateCurationCacheForMomentUUIDs:v5];
  int v8 = +[PGGraphMomentNodeCollection momentNodesForUUIDs:v5 inGraph:self->_graph];
  uint64_t v9 = [v8 count];
  if (v9 != v6)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v5];
    uint64_t v11 = [v8 uuids];
    [v10 minusSet:v11];

    uint64_t v12 = self->_loggingConnection;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      uint64_t v17 = (uint64_t)v10;
      _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "Failed to lookup Moment nodes for deletion with UUIDs: \"%@\"", (uint8_t *)&v16, 0xCu);
    }
  }
  if (v9)
  {
    uint64_t v13 = [v4 relatedDetails];
    [v13 accumulateDetailsForDeletedMomentNodes:v8];

    id v14 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    [v14 removeNodes:v8];
    [(MAGraph *)self->_graph executeGraphChangeRequest:v14];
    [v4 setHasDeletedMomentNodes:1];
  }
  id v15 = self->_loggingConnection;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = 134218240;
    uint64_t v17 = v9;
    __int16 v18 = 2048;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Batch Updates - Deleted %lu Moments (%lu requested)", (uint8_t *)&v16, 0x16u);
  }
}

- (void)performBatchUpdatesWithGraphUpdate:(id)a3 withRecipe:(id)a4 progressBlock:(id)a5
{
  uint64_t v198 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v147 = a4;
  id v9 = a5;
  id v10 = _Block_copy(v9);
  uint64_t v190 = 0;
  v191 = &v190;
  uint64_t v192 = 0x2020000000;
  char v193 = 0;
  uint64_t v186 = 0;
  v187 = (double *)&v186;
  uint64_t v188 = 0x2020000000;
  uint64_t v189 = 0;
  if (!v10
    || (double v11 = CFAbsoluteTimeGetCurrent(), v11 - v187[3] < 0.01)
    || (v187[3] = v11,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v10 + 2))(v10, &info, 0.0),
        char v18 = *((unsigned char *)v191 + 24) | LOBYTE(info.numer),
        (*((unsigned char *)v191 + 24) = v18) == 0)
    && [(MAGraph *)self->_graph noFatalError])
  {
    uint64_t v12 = self->_loggingConnection;
    os_signpost_id_t v13 = os_signpost_id_generate((os_log_t)v12);
    id v14 = v12;
    id v15 = v14;
    unint64_t v145 = v13 - 1;
    os_signpost_id_t spid = v13;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PerformBatchUpdate", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v144 = mach_absolute_time();
    if ([v8 hasAnythingToDo])
    {
      int v16 = (void *)MEMORY[0x1D25FED50]();
      v179[0] = MEMORY[0x1E4F143A8];
      v179[1] = 3221225472;
      v179[2] = __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke;
      v179[3] = &unk_1E68ECB50;
      int64x2_t v183 = vdupq_n_s64(0x3FB999999999999AuLL);
      id v180 = v10;
      v181 = &v186;
      uint64_t v184 = 0x3F847AE147AE147BLL;
      v182 = &v190;
      [(PGGraphBuilder *)self performPreprocessingWithGraphUpdate:v8 withRecipe:v147 progressBlock:v179];
      if (*((unsigned char *)v191 + 24) || ![(MAGraph *)self->_graph noFatalError])
      {
        char v23 = MEMORY[0x1E4F14500];
        id v24 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v25 = *((unsigned __int8 *)v191 + 24);
          BOOL v26 = [(MAGraph *)self->_graph noFatalError];
          *(_DWORD *)uint64_t buf = 67109890;
          *(_DWORD *)v195 = v25;
          *(_WORD *)&v195[4] = 1024;
          *(_DWORD *)&v195[6] = !v26;
          double v196 = 1.51430681e-269;
          v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph"
                 "/Ingest/PGGraphBuilder.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
        }

        int v17 = 0;
      }
      else
      {
        int v17 = 1;
      }

      if (!v17) {
        goto LABEL_130;
      }
    }
    if ([v8 hasHighlightsToDelete])
    {
      id v27 = v15;
      os_signpost_id_t v28 = os_signpost_id_generate(v27);
      id v29 = v27;
      id v30 = v29;
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "DeleteHighlights", "", buf, 2u);
      }

      mach_timebase_info v178 = 0;
      mach_timebase_info(&v178);
      uint64_t v31 = mach_absolute_time();
      [(PGGraphBuilder *)self deleteHighlightsWithGraphUpdate:v8];
      uint64_t v32 = mach_absolute_time();
      mach_timebase_info v33 = v178;
      double v34 = v30;
      char v35 = v34;
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v35, OS_SIGNPOST_INTERVAL_END, v28, "DeleteHighlights", "", buf, 2u);
      }

      id v36 = v35;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 136315394;
        *(void *)v195 = "DeleteHighlights";
        *(_WORD *)&v195[8] = 2048;
        double v196 = (float)((float)((float)((float)(v32 - v31) * (float)v33.numer) / (float)v33.denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }

      if (*((unsigned char *)v191 + 24) || ![(MAGraph *)self->_graph noFatalError])
      {
        id v67 = MEMORY[0x1E4F14500];
        id v68 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          int v69 = *((unsigned __int8 *)v191 + 24);
          BOOL v70 = [(MAGraph *)self->_graph noFatalError];
          *(_DWORD *)uint64_t buf = 67109890;
          *(_DWORD *)v195 = v69;
          *(_WORD *)&v195[4] = 1024;
          *(_DWORD *)&v195[6] = !v70;
          double v196 = 1.51430681e-269;
          v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph"
                 "/Ingest/PGGraphBuilder.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
        }
        goto LABEL_70;
      }

      double v37 = 0.2;
    }
    else
    {
      double v37 = 0.1;
    }
    if (![v8 hasMomentsToDelete])
    {
LABEL_44:
      if ([v8 hasPersonsToDelete])
      {
        id v47 = v15;
        os_signpost_id_t v48 = os_signpost_id_generate(v47);
        id v49 = v47;
        id v50 = v49;
        if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v50, OS_SIGNPOST_INTERVAL_BEGIN, v48, "DeletePersons", "", buf, 2u);
        }

        mach_timebase_info v178 = 0;
        mach_timebase_info(&v178);
        uint64_t v51 = mach_absolute_time();
        double v37 = v37 + 0.1;
        v172[0] = MEMORY[0x1E4F143A8];
        v172[1] = 3221225472;
        v172[2] = __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_298;
        v172[3] = &unk_1E68ECB50;
        double v176 = v37;
        id v173 = v10;
        v174 = &v186;
        long long v177 = xmmword_1D1F4F1B0;
        v175 = &v190;
        [(PGGraphBuilder *)self deletePersonsWithGraphUpdate:v8 progressBlock:v172];
        uint64_t v52 = mach_absolute_time();
        mach_timebase_info v53 = v178;
        id v54 = v50;
        long long v55 = v54;
        if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v55, OS_SIGNPOST_INTERVAL_END, v48, "DeletePersons", "", buf, 2u);
        }

        id v56 = v55;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 136315394;
          *(void *)v195 = "DeletePersons";
          *(_WORD *)&v195[8] = 2048;
          double v196 = (float)((float)((float)((float)(v52 - v51) * (float)v53.numer) / (float)v53.denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v56, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        if (*((unsigned char *)v191 + 24) || ![(MAGraph *)self->_graph noFatalError])
        {
          uint64_t v75 = MEMORY[0x1E4F14500];
          id v76 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
          {
            int v77 = *((unsigned __int8 *)v191 + 24);
            BOOL v78 = [(MAGraph *)self->_graph noFatalError];
            *(_DWORD *)uint64_t buf = 67109890;
            *(_DWORD *)v195 = v77;
            *(_WORD *)&v195[4] = 1024;
            *(_DWORD *)&v195[6] = !v78;
            double v196 = 1.51430681e-269;
            v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
          }

          goto LABEL_130;
        }
      }
      if ([v8 hasMomentsToInsert])
      {
        id v57 = v15;
        os_signpost_id_t v58 = os_signpost_id_generate(v57);
        id v59 = v57;
        id v60 = v59;
        if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v60, OS_SIGNPOST_INTERVAL_BEGIN, v58, "InsertMoments", "", buf, 2u);
        }

        mach_timebase_info v178 = 0;
        mach_timebase_info(&v178);
        uint64_t v61 = mach_absolute_time();
        double v37 = v37 + 0.1;
        v166[0] = MEMORY[0x1E4F143A8];
        v166[1] = 3221225472;
        v166[2] = __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_300;
        v166[3] = &unk_1E68ECB50;
        double v170 = v37;
        id v167 = v10;
        v168 = &v186;
        long long v171 = xmmword_1D1F4F1B0;
        v169 = &v190;
        [(PGGraphBuilder *)self insertMomentsWithGraphUpdate:v8 progressBlock:v166];
        uint64_t v62 = mach_absolute_time();
        mach_timebase_info v63 = v178;
        id v64 = v60;
        double v65 = v64;
        if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v65, OS_SIGNPOST_INTERVAL_END, v58, "InsertMoments", "", buf, 2u);
        }

        uint64_t v66 = v65;
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 136315394;
          *(void *)v195 = "InsertMoments";
          *(_WORD *)&v195[8] = 2048;
          double v196 = (float)((float)((float)((float)(v62 - v61) * (float)v63.numer) / (float)v63.denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v66, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        if (*((unsigned char *)v191 + 24) || ![(MAGraph *)self->_graph noFatalError])
        {
          __int16 v110 = MEMORY[0x1E4F14500];
          id v111 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
          {
            int v112 = *((unsigned __int8 *)v191 + 24);
            BOOL v113 = [(MAGraph *)self->_graph noFatalError];
            *(_DWORD *)uint64_t buf = 67109890;
            *(_DWORD *)v195 = v112;
            *(_WORD *)&v195[4] = 1024;
            *(_DWORD *)&v195[6] = !v113;
            double v196 = 1.51430681e-269;
            v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
          }

          goto LABEL_130;
        }
      }
      else
      {
        uint64_t v66 = [MEMORY[0x1E4F1CAD0] set];
        [(PGGraphBuilder *)self _registerInsertedMomentNodes:v66 inGraphUpdate:v8];
      }

      if ([v8 hasHighlightsToInsert])
      {
        uint64_t v79 = v15;
        os_signpost_id_t v80 = os_signpost_id_generate(v79);
        uint64_t v81 = v79;
        char v82 = v81;
        if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v82, OS_SIGNPOST_INTERVAL_BEGIN, v80, "InsertHighlights", "", buf, 2u);
        }

        mach_timebase_info v178 = 0;
        mach_timebase_info(&v178);
        uint64_t v83 = mach_absolute_time();
        double v37 = v37 + 0.1;
        v160[0] = MEMORY[0x1E4F143A8];
        v160[1] = 3221225472;
        v160[2] = __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_302;
        v160[3] = &unk_1E68ECB50;
        double v164 = v37;
        id v161 = v10;
        v162 = &v186;
        long long v165 = xmmword_1D1F4F1B0;
        v163 = &v190;
        [(PGGraphBuilder *)self insertHighlightsWithGraphUpdate:v8 progressBlock:v160];
        uint64_t v84 = mach_absolute_time();
        mach_timebase_info v85 = v178;
        v86 = v82;
        v87 = v86;
        if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v87, OS_SIGNPOST_INTERVAL_END, v80, "InsertHighlights", "", buf, 2u);
        }

        id v88 = v87;
        if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 136315394;
          *(void *)v195 = "InsertHighlights";
          *(_WORD *)&v195[8] = 2048;
          double v196 = (float)((float)((float)((float)(v84 - v83) * (float)v85.numer) / (float)v85.denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v88, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        if (*((unsigned char *)v191 + 24) || ![(MAGraph *)self->_graph noFatalError])
        {
          uint64_t v114 = MEMORY[0x1E4F14500];
          id v115 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
          {
            int v116 = *((unsigned __int8 *)v191 + 24);
            BOOL v117 = [(MAGraph *)self->_graph noFatalError];
            *(_DWORD *)uint64_t buf = 67109890;
            *(_DWORD *)v195 = v116;
            *(_WORD *)&v195[4] = 1024;
            *(_DWORD *)&v195[6] = !v117;
            double v196 = 1.51430681e-269;
            v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
          }

          goto LABEL_130;
        }
      }
      if ([v8 hasSocialGroupsToDelete])
      {
        uint64_t v89 = v15;
        os_signpost_id_t v90 = os_signpost_id_generate(v89);
        uint64_t v91 = v89;
        v92 = v91;
        if (v90 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v92, OS_SIGNPOST_INTERVAL_BEGIN, v90, "DeleteSocialGroups", "", buf, 2u);
        }

        mach_timebase_info v178 = 0;
        mach_timebase_info(&v178);
        uint64_t v93 = mach_absolute_time();
        [(PGGraphBuilder *)self _deleteSocialGroupsWithGraphUpdate:v8];
        uint64_t v94 = mach_absolute_time();
        mach_timebase_info v95 = v178;
        long long v96 = v92;
        long long v97 = v96;
        if (v90 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v97, OS_SIGNPOST_INTERVAL_END, v90, "DeleteSocialGroups", "", buf, 2u);
        }

        v98 = v97;
        if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 136315394;
          *(void *)v195 = "DeleteSocialGroups";
          *(_WORD *)&v195[8] = 2048;
          double v196 = (float)((float)((float)((float)(v94 - v93) * (float)v95.numer) / (float)v95.denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v98, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        if (*((unsigned char *)v191 + 24) || ![(MAGraph *)self->_graph noFatalError])
        {
          v122 = MEMORY[0x1E4F14500];
          id v123 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
          {
            int v124 = *((unsigned __int8 *)v191 + 24);
            BOOL v125 = [(MAGraph *)self->_graph noFatalError];
            *(_DWORD *)uint64_t buf = 67109890;
            *(_DWORD *)v195 = v124;
            *(_WORD *)&v195[4] = 1024;
            *(_DWORD *)&v195[6] = !v125;
            double v196 = 1.51430681e-269;
            v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
          }

          goto LABEL_130;
        }

        double v37 = v37 + 0.1;
      }
      if (([v8 hasMomentsToUpdate] & 1) != 0
        || ([v8 hasPersonsToUpdate] & 1) != 0
        || [v8 hasHighlightsToUpdate])
      {
        double v99 = v15;
        os_signpost_id_t v100 = os_signpost_id_generate(v99);
        v101 = v99;
        uint64_t v102 = v101;
        if (v100 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v102, OS_SIGNPOST_INTERVAL_BEGIN, v100, "PerformChanges", "", buf, 2u);
        }

        mach_timebase_info v178 = 0;
        mach_timebase_info(&v178);
        uint64_t v103 = mach_absolute_time();
        double v37 = v37 + 0.1;
        v154[0] = MEMORY[0x1E4F143A8];
        v154[1] = 3221225472;
        v154[2] = __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_305;
        v154[3] = &unk_1E68ECB50;
        double v158 = v37;
        id v155 = v10;
        v156 = &v186;
        long long v159 = xmmword_1D1F4F1B0;
        v157 = &v190;
        [(PGGraphBuilder *)self performChangeForGraphUpdate:v8 progressBlock:v154];
        uint64_t v104 = mach_absolute_time();
        mach_timebase_info v105 = v178;
        uint64_t v106 = v102;
        int v107 = v106;
        if (v100 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v107, OS_SIGNPOST_INTERVAL_END, v100, "PerformChanges", "", buf, 2u);
        }

        int v108 = v107;
        if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 136315394;
          *(void *)v195 = "PerformChanges";
          *(_WORD *)&v195[8] = 2048;
          double v196 = (float)((float)((float)((float)(v104 - v103) * (float)v105.numer) / (float)v105.denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v108, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        if (*((unsigned char *)v191 + 24) || ![(MAGraph *)self->_graph noFatalError])
        {
          id v118 = MEMORY[0x1E4F14500];
          id v119 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
          {
            int v120 = *((unsigned __int8 *)v191 + 24);
            BOOL v121 = [(MAGraph *)self->_graph noFatalError];
            *(_DWORD *)uint64_t buf = 67109890;
            *(_DWORD *)v195 = v120;
            *(_WORD *)&v195[4] = 1024;
            *(_DWORD *)&v195[6] = !v121;
            double v196 = 1.51430681e-269;
            v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
          }

          goto LABEL_130;
        }
      }
      [v8 prepareForPostProcessingWithGraph:self->_graph];
      if ([v8 hasSocialGroupsToInsert]) {
        int v109 = 1;
      }
      else {
        int v109 = [v8 hasSocialGroupsToUpdate];
      }
      if (([v8 didProcessNodes] | v109) == 1)
      {
        v126 = (void *)MEMORY[0x1D25FED50]();
        v148[0] = MEMORY[0x1E4F143A8];
        v148[1] = 3221225472;
        v148[2] = __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_307;
        v148[3] = &unk_1E68F0420;
        double v152 = v37 + 0.1;
        id v149 = v10;
        v150 = &v186;
        uint64_t v153 = 0x3F847AE147AE147BLL;
        v151 = &v190;
        [(PGGraphBuilder *)self performPostprocessingWithGraphUpdate:v8 withRecipe:v147 progressBlock:v148];
        if (*((unsigned char *)v191 + 24) || ![(MAGraph *)self->_graph noFatalError])
        {
          v128 = MEMORY[0x1E4F14500];
          id v129 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
          {
            int v130 = *((unsigned __int8 *)v191 + 24);
            BOOL v131 = [(MAGraph *)self->_graph noFatalError];
            *(_DWORD *)uint64_t buf = 67109890;
            *(_DWORD *)v195 = v130;
            *(_WORD *)&v195[4] = 1024;
            *(_DWORD *)&v195[6] = !v131;
            double v196 = 1.51430681e-269;
            v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
          }

          int v127 = 0;
        }
        else
        {
          int v127 = 1;
        }

        if (!v127) {
          goto LABEL_130;
        }
        [(PGGraphBuilder *)self _onGraphDidUpdate];
      }
      [(PGGraph *)self->_graph invalidateMemoryCaches];
      [(MAGraph *)self->_graph savePersistentStore];
      [(PGGraphBuilder *)self _cleanGraphBuildCachesAfterUpdate];
      uint64_t v132 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      v135 = v15;
      long long v136 = v135;
      if (v145 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v135))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v136, OS_SIGNPOST_INTERVAL_END, spid, "PerformBatchUpdate", "", buf, 2u);
      }

      long long v137 = v136;
      if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 136315394;
        *(void *)v195 = "PerformBatchUpdate";
        *(_WORD *)&v195[8] = 2048;
        double v196 = (float)((float)((float)((float)(v132 - v144) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v137, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }

      if (v10)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v187[3] >= 0.01)
        {
          v187[3] = Current;
          LOBYTE(v178.numer) = 0;
          (*((void (**)(void *, mach_timebase_info *, double))v10 + 2))(v10, &v178, 1.0);
          char v139 = *((unsigned char *)v191 + 24) | LOBYTE(v178.numer);
          *((unsigned char *)v191 + 24) = v139;
          if (v139 || ![(MAGraph *)self->_graph noFatalError])
          {
            v140 = MEMORY[0x1E4F14500];
            id v141 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
            {
              int v142 = *((unsigned __int8 *)v191 + 24);
              BOOL v143 = [(MAGraph *)self->_graph noFatalError];
              *(_DWORD *)uint64_t buf = 67109890;
              *(_DWORD *)v195 = v142;
              *(_WORD *)&v195[4] = 1024;
              *(_DWORD *)&v195[6] = !v143;
              double v196 = 1.51430681e-269;
              v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/G"
                     "raph/Ingest/PGGraphBuilder.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
            }
          }
        }
      }
LABEL_130:

      goto LABEL_131;
    }
    id v38 = v15;
    os_signpost_id_t v39 = os_signpost_id_generate(v38);
    id v40 = v38;
    id v41 = v40;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "DeleteMoments", "", buf, 2u);
    }

    mach_timebase_info v178 = 0;
    mach_timebase_info(&v178);
    uint64_t v42 = mach_absolute_time();
    [(PGGraphBuilder *)self _deleteMomentsWithGraphUpdate:v8];
    uint64_t v43 = mach_absolute_time();
    mach_timebase_info v44 = v178;
    id v45 = v41;
    long long v46 = v45;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v46, OS_SIGNPOST_INTERVAL_END, v39, "DeleteMoments", "", buf, 2u);
    }

    id v36 = v46;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 136315394;
      *(void *)v195 = "DeleteMoments";
      *(_WORD *)&v195[8] = 2048;
      double v196 = (float)((float)((float)((float)(v43 - v42) * (float)v44.numer) / (float)v44.denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    if (!*((unsigned char *)v191 + 24) && [(MAGraph *)self->_graph noFatalError])
    {

      double v37 = v37 + 0.1;
      goto LABEL_44;
    }
    long long v71 = MEMORY[0x1E4F14500];
    id v72 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      int v73 = *((unsigned __int8 *)v191 + 24);
      BOOL v74 = [(MAGraph *)self->_graph noFatalError];
      *(_DWORD *)uint64_t buf = 67109890;
      *(_DWORD *)v195 = v73;
      *(_WORD *)&v195[4] = 1024;
      *(_DWORD *)&v195[6] = !v74;
      double v196 = 1.51430681e-269;
      v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Ing"
             "est/PGGraphBuilder.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
    }
LABEL_70:

    goto LABEL_130;
  }
  uint64_t v19 = MEMORY[0x1E4F14500];
  id v20 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v21 = *((unsigned __int8 *)v191 + 24);
    BOOL v22 = [(MAGraph *)self->_graph noFatalError];
    *(_DWORD *)uint64_t buf = 67109890;
    *(_DWORD *)v195 = v21;
    *(_WORD *)&v195[4] = 1024;
    *(_DWORD *)&v195[6] = !v22;
    double v196 = 1.51430681e-269;
    v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inges"
           "t/PGGraphBuilder.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
  }

LABEL_131:
  _Block_object_dispose(&v186, 8);
  _Block_object_dispose(&v190, 8);
}

void __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(a1 + 56);
    double v7 = *(double *)(a1 + 64);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6 + v7 * a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_298(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(a1 + 56);
    double v7 = *(double *)(a1 + 64);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6 + v7 * a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_300(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(a1 + 56);
    double v7 = *(double *)(a1 + 64);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6 + v7 * a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_302(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(a1 + 56);
    double v7 = *(double *)(a1 + 64);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6 + v7 * a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_305(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(a1 + 56);
    double v7 = *(double *)(a1 + 64);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6 + v7 * a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_307(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(a1 + 56);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v8 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v8 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6 + a3 * 0.3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)_buildSceneNodeCache
{
  id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sceneNodeBySceneName = self->_sceneNodeBySceneName;
  self->_sceneNodeBySceneName = v3;

  id v5 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__PGGraphBuilder__buildSceneNodeCache__block_invoke;
  v12[3] = &unk_1E68EDB80;
  v12[4] = self;
  [v5 enumerateNodesUsingBlock:v12];
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    double v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    entityNetSceneNodeBySceneName = self->_entityNetSceneNodeBySceneName;
    self->_entityNetSceneNodeBySceneName = v6;

    uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    entityNetSceneTaxonomyNodesNotIndexedInSearch = self->_entityNetSceneTaxonomyNodesNotIndexedInSearch;
    self->_entityNetSceneTaxonomyNodesNotIndexedInSearch = v8;

    id v10 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __38__PGGraphBuilder__buildSceneNodeCache__block_invoke_2;
    v11[3] = &unk_1E68E6E08;
    v11[4] = self;
    [v10 enumerateNodesUsingBlock:v11];
  }
}

void __38__PGGraphBuilder__buildSceneNodeCache__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 104);
  id v3 = a2;
  id v4 = [v3 sceneName];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __38__PGGraphBuilder__buildSceneNodeCache__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 sceneName];
  if (v3) {
    [*(id *)(*(void *)(a1 + 32) + 112) setObject:v4 forKeyedSubscript:v3];
  }
}

- (id)momentNodesWhereMeIsPresent
{
  momentNodesWhereMeIsPresent = self->_momentNodesWhereMeIsPresent;
  if (!momentNodesWhereMeIsPresent)
  {
    id v4 = [(PGGraphBuilder *)self graph];
    id v5 = [v4 meNodeCollection];

    double v6 = [v5 momentNodesWithPresence];
    double v7 = self->_momentNodesWhereMeIsPresent;
    self->_momentNodesWhereMeIsPresent = v6;

    momentNodesWhereMeIsPresent = self->_momentNodesWhereMeIsPresent;
  }
  return momentNodesWhereMeIsPresent;
}

- (id)_insertMomentNodeForClueCollection:(id)a3 feeder:(id)a4 insertedAndUpdatedPersonNodes:(id *)a5 graphUpdate:(id)a6 progressBlock:(id)a7
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  int v16 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v15);
  uint64_t v138 = 0;
  char v139 = &v138;
  uint64_t v140 = 0x2020000000;
  char v141 = 0;
  uint64_t v134 = 0;
  v135 = (double *)&v134;
  uint64_t v136 = 0x2020000000;
  uint64_t v137 = 0;
  if (v16)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v135[3] >= 0.01)
    {
      v135[3] = Current;
      LOBYTE(info.numer) = 0;
      v16[2](v16, &info, 0.0);
      char v18 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer);
      *((unsigned char *)v139 + 24) = v18;
      if (v18)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 67109378;
          *(_DWORD *)BOOL v143 = 324;
          *(_WORD *)&v143[4] = 2080;
          *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Ingest/PGGraphBuilder.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
LABEL_10:
        id v25 = 0;
        goto LABEL_144;
      }
    }
  }
  uint64_t v114 = a5;
  uint64_t v19 = [v12 universalEndDate];
  id v20 = [v12 universalStartDate];
  [v19 timeIntervalSinceDate:v20];
  BOOL v22 = v21 > 172800.0;

  if (v22)
  {
    char v23 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_INFO))
    {
      id v24 = [v13 assetCollection];
      *(_DWORD *)uint64_t buf = 138412290;
      *(void *)BOOL v143 = v24;
      _os_log_impl(&dword_1D1805000, (os_log_t)v23, OS_LOG_TYPE_INFO, "Don't insert [%@] because its time interval is more than 2 days", buf, 0xCu);
    }
    goto LABEL_10;
  }
  context = (void *)MEMORY[0x1D25FED50]();
  if (v16)
  {
    double v26 = CFAbsoluteTimeGetCurrent();
    if (v26 - v135[3] >= 0.01)
    {
      v135[3] = v26;
      LOBYTE(info.numer) = 0;
      v16[2](v16, &info, 0.1);
      char v27 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer);
      *((unsigned char *)v139 + 24) = v27;
      if (v27)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 67109378;
          *(_DWORD *)BOOL v143 = 336;
          *(_WORD *)&v143[4] = 2080;
          *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Ingest/PGGraphBuilder.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        os_signpost_id_t v28 = 0;
        id v29 = 0;
        int v30 = 1;
        goto LABEL_138;
      }
    }
  }
  id v113 = [[PGGraphIngestMomentContainer alloc] initMomentContainerWithFeeder:v13 clueCollection:v12 curationManager:self->_curationManager topTierAestheticScore:self->_curationContext curationContext:self->_topTierAestheticScore];
  v129[0] = MEMORY[0x1E4F143A8];
  v129[1] = 3221225472;
  v129[2] = __116__PGGraphBuilder__insertMomentNodeForClueCollection_feeder_insertedAndUpdatedPersonNodes_graphUpdate_progressBlock___block_invoke;
  v129[3] = &unk_1E68F03F8;
  uint64_t v31 = v16;
  int v130 = v31;
  BOOL v131 = &v134;
  uint64_t v132 = &v138;
  uint64_t v133 = 0x3F847AE147AE147BLL;
  [(PGGraphBuilder *)self insertAssetCurationScoreInLibraryForFeeder:v13 progressBlock:v129];
  uint64_t v32 = [v13 assetCollection];
  id v115 = [v32 uuid];

  if (v115)
  {
    curationManager = self->_curationManager;
    double v34 = [MEMORY[0x1E4F1CAD0] setWithObject:v115];
    [(PGCurationManager *)curationManager invalidateCurationCacheForMomentUUIDs:v34];
  }
  if (!v16
    || (double v35 = CFAbsoluteTimeGetCurrent(), v35 - v135[3] < 0.01)
    || (v135[3] = v35,
        LOBYTE(info.numer) = 0,
        v31[2](v31, &info, 0.2),
        char v36 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer),
        (*((unsigned char *)v139 + 24) = v36) == 0))
  {
    id v29 = [(PGGraphBuilder *)self insertMomentNodeForMoment:v113];
    if (!v29)
    {
      long long v46 = +[PGLogging sharedLogging];
      id v47 = [v46 loggingConnection];

      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        long long v97 = [v13 assetCollection];
        *(_DWORD *)uint64_t buf = 138412290;
        *(void *)BOOL v143 = v97;
        _os_log_error_impl(&dword_1D1805000, v47, OS_LOG_TYPE_ERROR, "Failed to insert moment: \"%@\"", buf, 0xCu);
      }
      goto LABEL_45;
    }
    if (v16)
    {
      double v37 = CFAbsoluteTimeGetCurrent();
      if (v37 - v135[3] >= 0.01)
      {
        v135[3] = v37;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.4);
        char v38 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer);
        *((unsigned char *)v139 + 24) = v38;
        if (v38)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)BOOL v143 = 357;
            *(_WORD *)&v143[4] = 2080;
            *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          os_signpost_id_t v28 = 0;
          goto LABEL_46;
        }
      }
    }
    os_signpost_id_t v39 = [[PGGraphBuilderMomentEnvelope alloc] initWithMomentNode:v29];
    id v40 = [(PGGraphBuilder *)self insertDateNodesWithClueCollection:v12 fromMomentNode:v29];
    __int16 v110 = v39;
    if (v16)
    {
      double v41 = CFAbsoluteTimeGetCurrent();
      if (v41 - v135[3] >= 0.01)
      {
        v135[3] = v41;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.5);
        char v42 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer);
        *((unsigned char *)v139 + 24) = v42;
        if (v42)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)BOOL v143 = 363;
            *(_WORD *)&v143[4] = 2080;
            *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          os_signpost_id_t v28 = 0;
          int v30 = 1;
          goto LABEL_136;
        }
      }
    }
    id v111 = [(PGGraphBuilder *)self insertScenesWithClueCollection:v12 fromMomentNode:v29];
    [(PGGraphBuilderMomentEnvelope *)v39 setSceneEdges:v111];
    if (v16)
    {
      double v43 = CFAbsoluteTimeGetCurrent();
      if (v43 - v135[3] >= 0.01)
      {
        v135[3] = v43;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.6);
        char v44 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer);
        *((unsigned char *)v139 + 24) = v44;
        if (v44)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)BOOL v143 = 368;
            *(_WORD *)&v143[4] = 2080;
            *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            id v45 = MEMORY[0x1E4F14500];
LABEL_54:
            _os_log_impl(&dword_1D1805000, v45, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_55;
          }
          goto LABEL_55;
        }
      }
    }
    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    {
      [(PGGraphBuilder *)self insertEntityNetScenesWithClueCollection:v12 fromMomentNode:v29];
      if (v16)
      {
        double v48 = CFAbsoluteTimeGetCurrent();
        if (v48 - v135[3] >= 0.01)
        {
          v135[3] = v48;
          LOBYTE(info.numer) = 0;
          v31[2](v31, &info, 0.75);
          char v49 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer);
          *((unsigned char *)v139 + 24) = v49;
          if (v49)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t buf = 67109378;
              *(_DWORD *)BOOL v143 = 372;
              *(_WORD *)&v143[4] = 2080;
              *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/PGGraphBuilder.m";
              id v45 = MEMORY[0x1E4F14500];
              goto LABEL_54;
            }
LABEL_55:
            os_signpost_id_t v28 = 0;
            int v30 = 1;
LABEL_135:

LABEL_136:
            goto LABEL_137;
          }
        }
      }
    }
    int v109 = [(PGGraphBuilder *)self insertLocationHierarchyWithClueCollection:v12 fromMomentNode:v29];
    if (v16)
    {
      double v50 = CFAbsoluteTimeGetCurrent();
      if (v50 - v135[3] >= 0.01)
      {
        v135[3] = v50;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.8);
        char v51 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer);
        *((unsigned char *)v139 + 24) = v51;
        if (v51)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)BOOL v143 = 377;
            *(_WORD *)&v143[4] = 2080;
            *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          os_signpost_id_t v28 = 0;
LABEL_67:
          int v30 = 1;
LABEL_134:

          goto LABEL_135;
        }
      }
    }
    unsigned __int8 v128 = 0;
    os_signpost_id_t v28 = [(PGGraphBuilder *)self insertPeopleWithClueCollection:v12 fromMomentNode:v29 addressNodes:v109 isNearPeopleAddress:&v128];
    if (v16)
    {
      double v52 = CFAbsoluteTimeGetCurrent();
      if (v52 - v135[3] >= 0.01)
      {
        v135[3] = v52;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.9);
        char v53 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer);
        *((unsigned char *)v139 + 24) = v53;
        if (v53)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)BOOL v143 = 383;
            *(_WORD *)&v143[4] = 2080;
            *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_67;
        }
      }
    }
    int v108 = [(PGGraph *)self->_graph meNode];
    if ([(PGGraphBuilder *)self isSharedLibraryEnabled]
      && [v29 sharingComposition])
    {
      id v54 = [v13 shareParticipants];
      [(PGGraphBuilder *)self insertShareParticipantsAsAuthors:v54 forMomentNode:v29];

      if (v108 && [v29 sharingComposition] == 1) {
        [(PGGraphBuilder *)self checkAndInsertPersonIsAroundEdgeFromMeNode:v108 toMomentNode:v29 withClueCollection:v12];
      }
    }
    else if (v108)
    {
      [(PGGraphBuilder *)self insertMeAsAuthor:v108 forMomentNode:v29];
    }
    else
    {
      long long v55 = self->_loggingConnection;
      if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_fault_impl(&dword_1D1805000, (os_log_t)v55, OS_LOG_TYPE_FAULT, "[PGGraphBuilder][_insertMomentNodeForClueCollection:feeder:] Graph should have Me node during moment ingestion", buf, 2u);
      }
    }
    if (v16)
    {
      double v56 = CFAbsoluteTimeGetCurrent();
      if (v56 - v135[3] >= 0.01)
      {
        v135[3] = v56;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.91);
        char v57 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer);
        *((unsigned char *)v139 + 24) = v57;
        if (v57)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)BOOL v143 = 399;
            *(_WORD *)&v143[4] = 2080;
            *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            os_signpost_id_t v58 = MEMORY[0x1E4F14500];
LABEL_95:
            _os_log_impl(&dword_1D1805000, v58, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_96;
          }
          goto LABEL_96;
        }
      }
    }
    if ([v109 count]) {
      id v59 = [(PGGraphBuilder *)self insertPOIWithFeeder:v13 fromMomentNode:v29 isNearHomeOrWork:v128];
    }
    id v60 = [(PGGraphBuilder *)self insertROIWithClueCollection:v12 fromMomentNode:v29];
    if (v16)
    {
      double v61 = CFAbsoluteTimeGetCurrent();
      if (v61 - v135[3] >= 0.01)
      {
        v135[3] = v61;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.93);
        char v62 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer);
        *((unsigned char *)v139 + 24) = v62;
        if (v62)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)BOOL v143 = 407;
            *(_WORD *)&v143[4] = 2080;
            *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            os_signpost_id_t v58 = MEMORY[0x1E4F14500];
            goto LABEL_95;
          }
LABEL_96:
          int v30 = 1;
LABEL_133:

          goto LABEL_134;
        }
      }
    }
    id v63 = [(PGGraphBuilder *)self insertPartOfDayNodesWithClueCollection:v12 fromMomentNode:v29];
    if (v16)
    {
      double v64 = CFAbsoluteTimeGetCurrent();
      if (v64 - v135[3] >= 0.01)
      {
        v135[3] = v64;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.97);
        char v65 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer);
        *((unsigned char *)v139 + 24) = v65;
        if (v65)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)BOOL v143 = 411;
            *(_WORD *)&v143[4] = 2080;
            *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            os_signpost_id_t v58 = MEMORY[0x1E4F14500];
            goto LABEL_95;
          }
          goto LABEL_96;
        }
      }
    }
    id v66 = [(PGGraphBuilder *)self insertLocationMobilityNodeWithClueCollection:v12 fromMomentNode:v29];
    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = __116__PGGraphBuilder__insertMomentNodeForClueCollection_feeder_insertedAndUpdatedPersonNodes_graphUpdate_progressBlock___block_invoke_289;
    v123[3] = &unk_1E68F03F8;
    int v107 = v31;
    int v124 = v107;
    BOOL v125 = &v134;
    v126 = &v138;
    uint64_t v127 = 0x3F847AE147AE147BLL;
    id v67 = [(PGGraphBuilder *)self featureProviderWithProgressBlock:v123];
    if (v16
      && (double v68 = CFAbsoluteTimeGetCurrent(), v68 - v135[3] >= 0.01)
      && (v135[3] = v68,
          LOBYTE(info.numer) = 0,
          v107[2](v107, &info, 0.98),
          char v69 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer),
          (*((unsigned char *)v139 + 24) = v69) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        *(_DWORD *)BOOL v143 = 418;
        *(_WORD *)&v143[4] = 2080;
        *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Ingest/PGGraphBuilder.m";
        BOOL v70 = MEMORY[0x1E4F14500];
LABEL_107:
        _os_log_impl(&dword_1D1805000, v70, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      long long v71 = [v13 allItems];
      [(PGGraphBuilder *)self insertMomentFeaturesForMomentNode:v29 momentEnvelope:v110 assets:v71 featureProvider:v67 atMomentIngest:1 curationContext:self->_curationContext];
      uint64_t v106 = v67;

      if (!v16
        || (double v72 = CFAbsoluteTimeGetCurrent(), v72 - v135[3] < 0.01)
        || (v135[3] = v72,
            LOBYTE(info.numer) = 0,
            v107[2](v107, &info, 0.99),
            char v73 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer),
            (*((unsigned char *)v139 + 24) = v73) == 0))
      {
        if (self->_eventLabelingFeaturesCache)
        {
          BOOL v74 = self->_loggingConnection;
          os_signpost_id_t v75 = os_signpost_id_generate((os_log_t)v74);
          id v76 = v74;
          int v77 = v76;
          os_signpost_id_t spid = v75;
          unint64_t v102 = v75 - 1;
          if (v75 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
          {
            *(_WORD *)uint64_t buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v77, OS_SIGNPOST_INTERVAL_BEGIN, v75, "PGEventLabelingFeaturesFileCache", "", buf, 2u);
          }

          mach_timebase_info info = 0;
          mach_timebase_info(&info);
          uint64_t v100 = mach_absolute_time();
          uint64_t v104 = v77;
          BOOL v78 = (void *)MEMORY[0x1E4F71F08];
          v117[0] = MEMORY[0x1E4F143A8];
          v117[1] = 3221225472;
          v117[2] = __116__PGGraphBuilder__insertMomentNodeForClueCollection_feeder_insertedAndUpdatedPersonNodes_graphUpdate_progressBlock___block_invoke_290;
          v117[3] = &unk_1E68F03F8;
          id v118 = v107;
          id v119 = &v134;
          int v120 = &v138;
          uint64_t v121 = 0x3F847AE147AE147BLL;
          mach_timebase_info v105 = [v78 progressReporterWithProgressBlock:v117];
          eventLabelingFeaturesCache = self->_eventLabelingFeaturesCache;
          os_signpost_id_t v80 = [v13 assetFetchResult];
          photoLibrary = self->_photoLibrary;
          id v116 = 0;
          BOOL v82 = [(PGEventLabelingFeaturesFileCache *)eventLabelingFeaturesCache writeFeaturesForMomentNode:v29 assetFetchResult:v80 photoLibrary:photoLibrary progressReporter:v105 error:&v116];
          id v103 = v116;

          uint64_t v83 = v104;
          if (!v82)
          {
            uint64_t v84 = +[PGLogging sharedLogging];
            mach_timebase_info v85 = [v84 loggingConnection];

            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              v98 = [v29 localIdentifier];
              double v99 = [v103 description];
              *(_DWORD *)uint64_t buf = 138412546;
              *(void *)BOOL v143 = v98;
              *(_WORD *)&v143[8] = 2112;
              *(void *)&v143[10] = v99;
              _os_log_error_impl(&dword_1D1805000, v85, OS_LOG_TYPE_ERROR, "[EventLabeling] Error caching features for moment %@: %@", buf, 0x16u);

              uint64_t v83 = v104;
            }
          }
          uint64_t v86 = mach_absolute_time();
          uint32_t numer = info.numer;
          uint32_t denom = info.denom;
          uint64_t v89 = v83;
          os_signpost_id_t v90 = v89;
          if (v102 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
          {
            *(_WORD *)uint64_t buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v90, OS_SIGNPOST_INTERVAL_END, spid, "PGEventLabelingFeaturesFileCache", "", buf, 2u);
          }

          uint64_t v91 = v90;
          if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 136315394;
            *(void *)BOOL v143 = "PGEventLabelingFeaturesFileCache";
            *(_WORD *)&v143[8] = 2048;
            *(double *)&v143[10] = (float)((float)((float)((float)(v86 - v100) * (float)numer) / (float)denom)
                                         / 1000000.0);
            _os_log_impl(&dword_1D1805000, v91, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }
        }
        if (v16)
        {
          double v92 = CFAbsoluteTimeGetCurrent();
          id v67 = v106;
          if (v92 - v135[3] < 0.01
            || (v135[3] = v92,
                LOBYTE(info.numer) = 0,
                v107[2](v107, &info, 1.0),
                char v93 = *((unsigned char *)v139 + 24) | LOBYTE(info.numer),
                (*((unsigned char *)v139 + 24) = v93) == 0))
          {
            int v30 = 0;
            goto LABEL_132;
          }
          uint64_t v94 = MEMORY[0x1E4F14500];
          id v95 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)BOOL v143 = 439;
            *(_WORD *)&v143[4] = 2080;
            *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          int v30 = 1;
        }
        else
        {
          int v30 = 0;
        }
        id v67 = v106;
        goto LABEL_132;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        *(_DWORD *)BOOL v143 = 422;
        *(_WORD *)&v143[4] = 2080;
        *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Ingest/PGGraphBuilder.m";
        BOOL v70 = MEMORY[0x1E4F14500];
        goto LABEL_107;
      }
    }
    int v30 = 1;
LABEL_132:

    goto LABEL_133;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    *(_DWORD *)BOOL v143 = 349;
    *(_WORD *)&v143[4] = 2080;
    *(void *)&v143[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Ingest/PGGraphBuilder.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_45:
  os_signpost_id_t v28 = 0;
  id v29 = 0;
LABEL_46:
  int v30 = 1;
LABEL_137:

LABEL_138:
  if (v30)
  {
    id v25 = 0;
  }
  else
  {
    if (v114) {
      *uint64_t v114 = v28;
    }
    id v25 = v29;
  }

LABEL_144:
  _Block_object_dispose(&v134, 8);
  _Block_object_dispose(&v138, 8);

  return v25;
}

void __116__PGGraphBuilder__insertMomentNodeForClueCollection_feeder_insertedAndUpdatedPersonNodes_graphUpdate_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
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

void __116__PGGraphBuilder__insertMomentNodeForClueCollection_feeder_insertedAndUpdatedPersonNodes_graphUpdate_progressBlock___block_invoke_289(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.97);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __116__PGGraphBuilder__insertMomentNodeForClueCollection_feeder_insertedAndUpdatedPersonNodes_graphUpdate_progressBlock___block_invoke_290(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.01 + 0.99);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)_cleanUpMoments:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if ([v3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v4 = v3;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v4);
          }
          id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          double v11 = [v10 startDate];
          uint64_t v12 = [v10 endDate];
          id v13 = (void *)v12;
          if (v11) {
            BOOL v14 = v12 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (v14
            || [v11 compare:v12] == 1
            || [MEMORY[0x1E4F76C68] yearFromDate:v11] < 1826
            || [MEMORY[0x1E4F76C68] yearFromDate:v13] >= 2201)
          {
            [v5 addObject:v10];
            id v15 = +[PGLogging sharedLogging];
            int v16 = [v15 loggingConnection];

            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t buf = 138412546;
              uint64_t v28 = (uint64_t)v11;
              __int16 v29 = 2112;
              int v30 = v13;
              _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "Moment to insert has bogus dates (%@ -> %@)", buf, 0x16u);
            }
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v7);
    }

    uint64_t v17 = [v5 count];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = (void *)[v4 mutableCopy];
      [v19 minusSet:v5];

      id v20 = +[PGLogging sharedLogging];
      double v21 = [v20 loggingConnection];

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 134217984;
        uint64_t v28 = v18;
        _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "Found %lu bogus moments, removing them from Moments to insert", buf, 0xCu);
      }

      id v4 = v19;
    }
  }
  return v4;
}

- (void)prepareGraphForRebuild
{
  id v3 = objc_opt_class();
  graph = self->_graph;
  [v3 prepareGraphForRebuild:graph];
}

- (id)featureProviderWithProgressBlock:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_featureProvider) {
    goto LABEL_2;
  }
  uint64_t v7 = [[PGMomentFeatureSpecificationFactory alloc] initWithSceneTaxonomy:v5->_sceneTaxonomy loggingConnection:v5->_loggingConnection];
  uint64_t v8 = [(PGMomentFeatureSpecificationFactory *)v7 allSupportedFeatureTypes];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v10 = [v8 count];
  if (v10)
  {
    double v11 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:v4];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F71F10]) initWithProgressReporter:v11];
    *(void *)uint64_t buf = 0;
    uint64_t v32 = buf;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = 0;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    *(double *)&v30[3] = 1.0 / (double)v10;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    BOOL v22 = __51__PGGraphBuilder_featureProviderWithProgressBlock___block_invoke;
    long long v23 = &unk_1E68E6DE0;
    uint64_t v28 = buf;
    __int16 v29 = v30;
    id v13 = v12;
    id v24 = v13;
    id v14 = v9;
    id v25 = v14;
    long long v26 = v7;
    id v15 = v11;
    id v27 = v15;
    [v8 enumerateIndexesUsingBlock:&v20];
    if (objc_msgSend(v15, "isCancelled", v20, v21, v22, v23))
    {
      int v16 = 1;
    }
    else
    {
      uint64_t v17 = [[PGAssetCollectionFeatureProvider alloc] initWithFeatureSpecifications:v14];
      featureProvider = v5->_featureProvider;
      v5->_featureProvider = v17;

      int v16 = 0;
    }

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PGGraphBuilder] No supported feature types", buf, 2u);
    }
    int v16 = 1;
  }

  if (!v16)
  {
LABEL_2:
    objc_sync_exit(v5);

    uint64_t v6 = v5->_featureProvider;
  }
  else
  {
    objc_sync_exit(v5);

    uint64_t v6 = 0;
  }

  return v6;
}

void __51__PGGraphBuilder_featureProviderWithProgressBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 24);
  uint64_t v6 = [*(id *)(a1 + 32) childProgressReporterToCheckpoint:*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  uint64_t v7 = *(void **)(a1 + 40);
  id v9 = (id)v6;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 48), "specificationsForFeatureType:progressReporter:", a2);
  [v7 addObjectsFromArray:v8];

  if ([*(id *)(a1 + 56) isCancelled]) {
    *a3 = 1;
  }
}

- (CLSCurationContext)curationContext
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_curationContext)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v2->_photoLibrary];
    curationContext = v2->_curationContext;
    v2->_curationContext = (CLSCurationContext *)v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_curationContext;
  return v5;
}

- (PGGraphBuilder)initWithGraph:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F76CF8];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = (void *)MEMORY[0x1E4F76CF8];
  uint64_t v8 = +[PGManager graphServicesURLWithPhotoLibrary:0];
  id v9 = [v7 urlWithParentURL:v8];
  unint64_t v10 = (void *)[v6 initWithURL:v9];

  double v11 = [(PGGraphBuilder *)self initWithGraph:v5 locationCache:v10];
  return v11;
}

- (PGGraphBuilder)initWithGraph:(id)a3 locationCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PGGraphBuilder;
  id v9 = [(PGGraphBuilder *)&v22 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graph, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F8E790]) initForSceneNetOnly:1];
    sceneTaxonomy = v10->_sceneTaxonomy;
    v10->_sceneTaxonomy = (CLSSceneTaxonomyHierarchy *)v11;

    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    {
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F8E790]) initForSceneNetOnly:0];
      entityNetSceneTaxonomy = v10->_entityNetSceneTaxonomy;
      v10->_entityNetSceneTaxonomy = (CLSSceneTaxonomyHierarchy *)v13;
    }
    else
    {
      entityNetSceneTaxonomy = v10->_entityNetSceneTaxonomy;
      v10->_entityNetSceneTaxonomy = 0;
    }

    objc_storeStrong((id *)&v10->_loggingConnection, MEMORY[0x1E4F14500]);
    id v15 = [[PGGraphTimeDomainBuildingHelper alloc] initWithGraph:v10->_graph];
    timeDomainBuildingHelper = v10->_timeDomainBuildingHelper;
    v10->_timeDomainBuildingHelper = v15;

    uint64_t v17 = objc_alloc_init(PGGraphPeopleDomainBuildingHelper);
    peopleDomainBuildingHelper = v10->_peopleDomainBuildingHelper;
    v10->_peopleDomainBuildingHelper = v17;

    [(PGGraphBuilder *)v10 _buildSceneNodeCache];
    objc_storeStrong((id *)&v10->_locationCache, a4);
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F76D98]) initWithLocationCache:v10->_locationCache];
    serviceManager = v10->_serviceManager;
    v10->_serviceManager = (CLSServiceManager *)v19;
  }
  return v10;
}

- (PGGraphBuilder)initWithGraph:(id)a3 manager:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v60.receiver = self;
  v60.super_class = (Class)PGGraphBuilder;
  id v9 = [(PGGraphBuilder *)&v60 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graph, a3);
    uint64_t v11 = [v8 photoLibrary];
    photoLibrary = v10->_photoLibrary;
    v10->_photoLibrary = (PHPhotoLibrary *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F8E790]) initForSceneNetOnly:1];
    sceneTaxonomy = v10->_sceneTaxonomy;
    v10->_sceneTaxonomy = (CLSSceneTaxonomyHierarchy *)v13;

    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    {
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F8E790]) initForSceneNetOnly:0];
      entityNetSceneTaxonomy = v10->_entityNetSceneTaxonomy;
      v10->_entityNetSceneTaxonomy = (CLSSceneTaxonomyHierarchy *)v15;
    }
    else
    {
      entityNetSceneTaxonomy = v10->_entityNetSceneTaxonomy;
      v10->_entityNetSceneTaxonomy = 0;
    }

    uint64_t v17 = [v8 curationManager];
    curationManager = v10->_curationManager;
    v10->_curationManager = (PGCurationManager *)v17;

    uint64_t v19 = [v8 serviceManager];
    serviceManager = v10->_serviceManager;
    v10->_serviceManager = (CLSServiceManager *)v19;

    uint64_t v21 = [v8 ingestLoggingConnection];
    loggingConnection = v10->_loggingConnection;
    v10->_loggingConnection = (OS_os_log *)v21;

    v10->_keepsExistingAssetCurationScores = [v8 photoLibraryIsReadonly];
    long long v23 = [(PGGraph *)v10->_graph infoNode];
    [v23 topTierAestheticScore];
    v10->_topTierAestheticScore = v24;
    v10->_numberOfUtilityAssets = [v23 numberOfUtilityAssets];
    v10->_numberOfDefaultAssets = [v23 numberOfDefaultAssets];
    v10->_numberOfImprovedAssets = [v23 numberOfImprovedAssets];
    v10->_numberOfBetterAssets = [v23 numberOfBetterAssets];
    id v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    curationScoreByAsset = v10->_curationScoreByAsset;
    v10->_curationScoreByAsset = v25;

    id v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    interactionScoreByAsset = v10->_interactionScoreByAsset;
    v10->_interactionScoreByAsset = v27;

    __int16 v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    generativeMemoryCreationEligibilityStateByAsset = v10->_generativeMemoryCreationEligibilityStateByAsset;
    v10->_generativeMemoryCreationEligibilityStateByAsset = v29;

    if (v10->_photoLibrary)
    {
      uint64_t v31 = [objc_alloc(MEMORY[0x1E4F8E838]) initWithPhotoLibrary:v10->_photoLibrary];
      safeAssetAnalyzer = v10->_safeAssetAnalyzer;
      v10->_safeAssetAnalyzer = (PNSafeAssetAnalyzer *)v31;
    }
    else
    {
      safeAssetAnalyzer = v10->_safeAssetAnalyzer;
      v10->_safeAssetAnalyzer = 0;
    }

    uint64_t v33 = [[PGGraphTimeDomainBuildingHelper alloc] initWithGraph:v10->_graph];
    timeDomainBuildingHelper = v10->_timeDomainBuildingHelper;
    v10->_timeDomainBuildingHelper = v33;

    double v35 = objc_alloc_init(PGGraphPeopleDomainBuildingHelper);
    peopleDomainBuildingHelper = v10->_peopleDomainBuildingHelper;
    v10->_peopleDomainBuildingHelper = v35;

    [(PGGraphBuilder *)v10 _buildSceneNodeCache];
    if (v10->_photoLibrary)
    {
      v10->_isSharedLibraryEnabled = +[PGGraphBuilder isSharedLibraryEnabledForLibrary:](PGGraphBuilder, "isSharedLibraryEnabledForLibrary:");
      +[PGGraphBuilder sharedLibraryParticipantsForLibrary:v10->_photoLibrary];
    }
    else
    {
      v10->_isSharedLibraryEnabled = 0;
      [MEMORY[0x1E4F1CAD0] set];
    uint64_t v37 = };
    sharedLibraryParticipants = v10->_sharedLibraryParticipants;
    v10->_sharedLibraryParticipants = (NSSet *)v37;

    if (+[PGEventLabelingConfiguration isEventLabelingEnabled])
    {
      os_signpost_id_t v39 = [(PHPhotoLibrary *)v10->_photoLibrary urlForApplicationDataFolderIdentifier:1];
      graph = v10->_graph;
      id v59 = 0;
      uint64_t v41 = +[PGEventLabelingFeaturesFileCache cacheForMomentGraphRebuildWithGraphServiceURL:v39 graph:graph error:&v59];
      id v42 = v59;
      eventLabelingFeaturesCache = v10->_eventLabelingFeaturesCache;
      v10->_eventLabelingFeaturesCache = (PGEventLabelingFeaturesFileCache *)v41;

      if (!v10->_eventLabelingFeaturesCache)
      {
        char v44 = +[PGLogging sharedLogging];
        id v45 = [v44 loggingConnection];

        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t buf = 138412290;
          id v62 = v42;
          _os_log_error_impl(&dword_1D1805000, v45, OS_LOG_TYPE_ERROR, "[PGGraphBuilder] Error initializing EventLabeling cache: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      os_signpost_id_t v39 = v10->_eventLabelingFeaturesCache;
      v10->_eventLabelingFeaturesCache = 0;
    }

    uint64_t v46 = [v8 locationCache];
    locationCache = v10->_locationCache;
    v10->_locationCache = (CLSLocationCache *)v46;

    uint64_t v48 = [v8 aoiCache];
    aoiCache = v10->_aoiCache;
    v10->_aoiCache = (CLSAOICache *)v48;

    uint64_t v50 = [v8 poiCache];
    poiCache = v10->_poiCache;
    v10->_poiCache = (CLSPOICache *)v50;

    uint64_t v52 = [v8 roiCache];
    roiCache = v10->_roiCache;
    v10->_roiCache = (CLSROICache *)v52;

    uint64_t v54 = [v8 natureCache];
    natureCache = v10->_natureCache;
    v10->_natureCache = (CLSNatureCache *)v54;

    uint64_t v56 = [v8 publicEventManager];
    publicEventManager = v10->_publicEventManager;
    v10->_publicEventManager = (CLSPublicEventManager *)v56;
  }
  return v10;
}

+ (void)setLastIncrementalUpdateInvocationDate:(id)a3 inGraph:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 infoNode];
  if (v7)
  {
    id v8 = +[PGGraphInfoNode propertiesWithLastIncrementalUpdateInvocationOnDate:v5];
    objc_msgSend(v6, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v8, objc_msgSend(v7, "identifier"), 0);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v9 = 0;
    _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PGGraphBuilder] PGGraphInfoNode should not be nil when updating the dateOfLastIncrementalUpdateInvocation", v9, 2u);
  }
}

+ (void)prepareGraphForRebuild:(id)a3
{
  id v12 = a3;
  [v12 enterBatch];
  [v12 setVersion:617];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v5 = [v4 localeIdentifier];

  id v6 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v7 = [MEMORY[0x1E4F8AB68] currentRevGeoProvider];
  uint64_t v8 = [MEMORY[0x1E4F76D98] canAccessContactsStore];
  uint64_t v9 = [v12 infoNode];
  if (v9)
  {
    unint64_t v10 = (PGGraphInfoNode *)v9;
    id v11 = +[PGGraphInfoNode genericPropertiesWithCreationDate:v3 localeIdentifier:v5 languageIdentifiers:v6 geoServiceProviderID:v7 curationAlgorithmsVersion:11 contactsStoreAccess:v8];
    objc_msgSend(v12, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v11, -[MANode identifier](v10, "identifier"), 1);
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    unint64_t v10 = [[PGGraphInfoNode alloc] initWithCreationDate:v3 localeIdentifier:v5 languageIdentifiers:v6 geoServiceProviderID:v7 curationAlgorithmsVersion:11 contactsStoreAccess:v8];
    [v11 addNode:v10];
    [v12 executeGraphChangeRequest:v11];
  }

  [v12 leaveBatch];
}

- (void)insertOwner:(id)a3 forPets:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        uint64_t v15 = [PGGraphIsOwnerOfPetEdge alloc];
        id v16 = -[PGGraphIsOwnerOfPetEdge initFromPersonNode:toPetNode:](v15, "initFromPersonNode:toPetNode:", v6, v14, (void)v17);
        [v8 addEdge:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [(MAGraph *)self->_graph executeGraphChangeRequest:v8];
}

- (id)insertPet:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 name];
  id v5 = (void *)v4;
  id v6 = &stru_1F283BC78;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = v6;

  id v8 = [PGGraphPetNode alloc];
  id v9 = [v3 localIdentifier];
  os_signpost_id_t v39 = v7;
  uint64_t v10 = -[PGGraphPetNode initWithLocalIdentifier:petSpecies:name:isFavorite:](v8, "initWithLocalIdentifier:petSpecies:name:isFavorite:", v9, [v3 species], v7, objc_msgSend(v3, "isFavorite"));

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v13 = [v3 momentNodes];
  uint64_t v14 = [v13 temporarySet];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v54 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [[PGGraphPetPresentEdge alloc] initFromPetNode:v10 toMomentNode:*(void *)(*((void *)&v53 + 1) + 8 * i)];
        [v11 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v16);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v20 = [v3 ownerNodes];
  uint64_t v21 = [v20 temporarySet];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = [[PGGraphIsOwnerOfPetEdge alloc] initFromPersonNode:*(void *)(*((void *)&v49 + 1) + 8 * j) toPetNode:v10];
        [v12 addObject:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v23);
  }

  id v27 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  [v27 addNode:v10];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v28 = v11;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v46 != v31) {
          objc_enumerationMutation(v28);
        }
        [v27 addEdge:*(void *)(*((void *)&v45 + 1) + 8 * k)];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v30);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v33 = v12;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v41 objects:v57 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v42;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(v33);
        }
        [v27 addEdge:*(void *)(*((void *)&v41 + 1) + 8 * m)];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v41 objects:v57 count:16];
    }
    while (v35);
  }

  [(MAGraph *)self->_graph executeGraphChangeRequest:v27];
  return v10;
}

- (BOOL)shouldUpdatePersonRepresentativeAssetUUIDsWithPositiveSceneCriteria:(id)a3 actionValueString:(id)a4 assetIsPassingSceneCriteria:(BOOL)a5 personLocalIdentifierIsDoingActionInAsset:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  if ((int)[v10 intValue] >= 1 && objc_msgSend(v9, "length"))
  {
    BOOL v11 = a5 && v6;
  }
  else if ((int)[v10 intValue] >= 1 && a5 || (BOOL v11 = 0, objc_msgSend(v9, "length")) && v6)
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (void)_connectPersonActivityMeaningNode:(id)a3 toMomentNode:(id)a4 withChangeRequest:(id)a5 representativeAssetUUIDsByPersonLocalIdentifier:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v19 = [[PGGraphPersonActivityMeaningEdge alloc] initFromMomentNode:v11 toPersonActivityMeaningNode:v12];
  [v10 addEdge:v19];
  uint64_t v13 = [v12 personLocalIdentifier];
  uint64_t v14 = [v9 objectForKeyedSubscript:v13];

  uint64_t v15 = [v14 allObjects];
  uint64_t v16 = [v15 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  uint64_t v17 = [v16 componentsJoinedByString:@","];

  id v18 = -[PGGraphMomentFeaturesEdge initFromMomentNode:toFeatureNode:numberOfRelevantAssets:allAssetUUIDs:]([PGGraphMomentFeaturesEdge alloc], "initFromMomentNode:toFeatureNode:numberOfRelevantAssets:allAssetUUIDs:", v11, v12, [v14 count], v17);
  [v10 addEdge:v18];
}

- (void)_updatePersonActivitiesOfMomentNode:(id)a3 assets:(id)a4 graph:(id)a5 withPositiveSceneCriteriaByValidPersonActivityMeaningLabel:(id)a6 andActionCriteriaByValidPersonActivityMeaningLabel:(id)a7 validPersonActivityMeaningLabelByActionValue:(id)a8 changeRequest:(id)a9
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v77 = a3;
  id v14 = a4;
  id v76 = a5;
  id v15 = a6;
  id v16 = a7;
  id v74 = a8;
  id v73 = a9;
  uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
  os_signpost_id_t v75 = v15;
  id v18 = [v15 allKeys];
  id v19 = [v17 setWithArray:v18];
  uint64_t v83 = v16;
  long long v20 = [v16 allKeys];
  uint64_t v21 = [v19 setByAddingObjectsFromArray:v20];

  if ([v21 count])
  {
    BOOL v70 = v21;
    id v86 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v87 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v69 = v14;
    id obj = v14;
    uint64_t v22 = [obj countByEnumeratingWithState:&v121 objects:v128 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v122;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v122 != v24) {
            objc_enumerationMutation(obj);
          }
          id v26 = *(void **)(*((void *)&v121 + 1) + 8 * i);
          id v27 = objc_msgSend(v26, "curationModel", v69);
          id v28 = [v27 sceneModel];
          uint64_t v29 = [v26 clsSceneClassifications];
          uint64_t v30 = [v28 sceneNamesFromSceneClassifications:v29 passingThresholdOfType:1];

          if ([v30 count])
          {
            uint64_t v31 = [v26 uuid];
            [v86 setObject:v30 forKeyedSubscript:v31];
          }
          uint64_t v32 = [v26 mediaAnalysisProperties];
          uint64_t v33 = [v32 mediaAnalysisVersion];

          uint64_t v34 = [v26 clsFaceInformationSummary];
          uint64_t v35 = [v34 faceInformationByConsolidatedPersonLocalIdentifier];

          v115[0] = MEMORY[0x1E4F143A8];
          v115[1] = 3221225472;
          void v115[2] = __252__PGGraphBuilder_MomentFeatures___updatePersonActivitiesOfMomentNode_assets_graph_withPositiveSceneCriteriaByValidPersonActivityMeaningLabel_andActionCriteriaByValidPersonActivityMeaningLabel_validPersonActivityMeaningLabelByActionValue_changeRequest___block_invoke;
          v115[3] = &unk_1E68EA738;
          id v116 = v87;
          BOOL v117 = v26;
          id v118 = v74;
          uint64_t v120 = v33;
          id v119 = v83;
          [v35 enumerateKeysAndObjectsUsingBlock:v115];
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v121 objects:v128 count:16];
      }
      while (v23);
    }

    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v71 = v70;
    uint64_t v78 = [v71 countByEnumeratingWithState:&v111 objects:v127 count:16];
    if (v78)
    {
      uint64_t v72 = *(void *)v112;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v112 != v72) {
            objc_enumerationMutation(v71);
          }
          uint64_t v82 = v36;
          uint64_t v37 = *(void *)(*((void *)&v111 + 1) + 8 * v36);
          uint64_t v38 = objc_msgSend(v75, "objectForKeyedSubscript:", v37, v69);
          uint64_t v81 = v37;
          os_signpost_id_t v39 = +[PGMeaningActionCriteria actionValueStringUsingActionCriteriaByValidPersonActivityMeaningLabel:v83 withPersonActivityMeaningLabel:v37];
          id v93 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v107 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          id v84 = obj;
          uint64_t v88 = [v84 countByEnumeratingWithState:&v107 objects:v126 count:16];
          if (v88)
          {
            uint64_t v85 = *(void *)v108;
            do
            {
              uint64_t v40 = 0;
              do
              {
                if (*(void *)v108 != v85) {
                  objc_enumerationMutation(v84);
                }
                uint64_t v90 = v40;
                long long v41 = *(void **)(*((void *)&v107 + 1) + 8 * v40);
                long long v42 = [v41 clsConsolidatedPersonLocalIdentifiers];
                long long v43 = [v41 uuid];
                long long v44 = [v87 objectForKeyedSubscript:v43];
                long long v45 = [v44 objectForKeyedSubscript:v39];

                uint64_t v91 = v41;
                long long v46 = [v41 uuid];
                long long v47 = [v86 objectForKeyedSubscript:v46];

                uint64_t v89 = v47;
                uint64_t v48 = [v47 intersectsSet:v38];
                long long v103 = 0u;
                long long v104 = 0u;
                long long v105 = 0u;
                long long v106 = 0u;
                id v49 = v42;
                uint64_t v50 = [v49 countByEnumeratingWithState:&v103 objects:v125 count:16];
                if (v50)
                {
                  uint64_t v51 = v50;
                  uint64_t v52 = *(void *)v104;
                  do
                  {
                    for (uint64_t j = 0; j != v51; ++j)
                    {
                      if (*(void *)v104 != v52) {
                        objc_enumerationMutation(v49);
                      }
                      uint64_t v54 = *(void *)(*((void *)&v103 + 1) + 8 * j);
                      if (-[PGGraphBuilder shouldUpdatePersonRepresentativeAssetUUIDsWithPositiveSceneCriteria:actionValueString:assetIsPassingSceneCriteria:personLocalIdentifierIsDoingActionInAsset:](self, "shouldUpdatePersonRepresentativeAssetUUIDsWithPositiveSceneCriteria:actionValueString:assetIsPassingSceneCriteria:personLocalIdentifierIsDoingActionInAsset:", v38, v39, v48, [v45 containsObject:v54]))
                      {
                        long long v55 = v39;
                        uint64_t v56 = v38;
                        id v57 = [v93 objectForKeyedSubscript:v54];
                        if (!v57)
                        {
                          id v57 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                          [v93 setObject:v57 forKeyedSubscript:v54];
                        }
                        os_signpost_id_t v58 = [v91 uuid];
                        [v57 addObject:v58];

                        uint64_t v38 = v56;
                        os_signpost_id_t v39 = v55;
                      }
                    }
                    uint64_t v51 = [v49 countByEnumeratingWithState:&v103 objects:v125 count:16];
                  }
                  while (v51);
                }

                uint64_t v40 = v90 + 1;
              }
              while (v90 + 1 != v88);
              uint64_t v88 = [v84 countByEnumeratingWithState:&v107 objects:v126 count:16];
            }
            while (v88);
          }
          os_signpost_id_t v80 = (void *)v38;

          id v59 = (void *)MEMORY[0x1E4F1CA80];
          objc_super v60 = [v93 allKeys];
          uint64_t v61 = [v59 setWithArray:v60];

          id v62 = +[PGGraphPersonActivityMeaningNodeCollection personActivityMeaningNodesForActivityLabel:v81 personLocalIdentifiers:v61 inGraph:v76];
          v99[0] = MEMORY[0x1E4F143A8];
          v99[1] = 3221225472;
          v99[2] = __252__PGGraphBuilder_MomentFeatures___updatePersonActivitiesOfMomentNode_assets_graph_withPositiveSceneCriteriaByValidPersonActivityMeaningLabel_andActionCriteriaByValidPersonActivityMeaningLabel_validPersonActivityMeaningLabelByActionValue_changeRequest___block_invoke_2;
          v99[3] = &unk_1E68EA760;
          v99[4] = self;
          id v63 = v77;
          id v100 = v63;
          id v64 = v73;
          id v101 = v64;
          id v65 = v93;
          id v102 = v65;
          double v92 = v62;
          [v62 enumerateNodesUsingBlock:v99];
          id v66 = [v62 personLocalIdentifiers];
          [v61 minusSet:v66];
          id v67 = +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:v61 inGraph:v76];
          v95[0] = MEMORY[0x1E4F143A8];
          v95[1] = 3221225472;
          v95[2] = __252__PGGraphBuilder_MomentFeatures___updatePersonActivitiesOfMomentNode_assets_graph_withPositiveSceneCriteriaByValidPersonActivityMeaningLabel_andActionCriteriaByValidPersonActivityMeaningLabel_validPersonActivityMeaningLabelByActionValue_changeRequest___block_invoke_3;
          v95[3] = &unk_1E68EA788;
          v95[4] = self;
          v95[5] = v81;
          id v96 = v64;
          id v97 = v63;
          id v98 = v65;
          id v68 = v65;
          [v67 enumerateNodesUsingBlock:v95];

          uint64_t v36 = v82 + 1;
        }
        while (v82 + 1 != v78);
        uint64_t v78 = [v71 countByEnumeratingWithState:&v111 objects:v127 count:16];
      }
      while (v78);
    }

    id v14 = v69;
    uint64_t v21 = v70;
  }
}

void __252__PGGraphBuilder_MomentFeatures___updatePersonActivitiesOfMomentNode_assets_graph_withPositiveSceneCriteriaByValidPersonActivityMeaningLabel_andActionCriteriaByValidPersonActivityMeaningLabel_validPersonActivityMeaningLabelByActionValue_changeRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v5 = [a3 traits];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v10 type] == 1)
        {
          id v11 = *(void **)(a1 + 32);
          id v12 = [*(id *)(a1 + 40) uuid];
          id v13 = [v11 objectForKeyedSubscript:v12];

          if (!v13)
          {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            id v14 = *(void **)(a1 + 32);
            id v15 = [*(id *)(a1 + 40) uuid];
            [v14 setObject:v13 forKeyedSubscript:v15];
          }
          id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%i", (int)objc_msgSend(v10, "value"));
          uint64_t v17 = [*(id *)(a1 + 48) objectForKeyedSubscript:v16];
          +[PGMeaningActionCriteria actionHighRecallThresholdForAssetMediaAnalysisVersion:*(void *)(a1 + 64) usingActionCriteriaByValidPersonActivityMeaningLabel:*(void *)(a1 + 56) andValidPersonActivity:v17];
          double v19 = v18;
          [v10 score];
          if (v20 >= v19)
          {
            id v21 = [v13 objectForKeyedSubscript:v16];
            if (!v21)
            {
              id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              [v13 setObject:v21 forKeyedSubscript:v16];
            }
            [v21 addObject:v22];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }
}

uint64_t __252__PGGraphBuilder_MomentFeatures___updatePersonActivitiesOfMomentNode_assets_graph_withPositiveSceneCriteriaByValidPersonActivityMeaningLabel_andActionCriteriaByValidPersonActivityMeaningLabel_validPersonActivityMeaningLabelByActionValue_changeRequest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _connectPersonActivityMeaningNode:a2 toMomentNode:*(void *)(a1 + 40) withChangeRequest:*(void *)(a1 + 48) representativeAssetUUIDsByPersonLocalIdentifier:*(void *)(a1 + 56)];
}

void __252__PGGraphBuilder_MomentFeatures___updatePersonActivitiesOfMomentNode_assets_graph_withPositiveSceneCriteriaByValidPersonActivityMeaningLabel_andActionCriteriaByValidPersonActivityMeaningLabel_validPersonActivityMeaningLabelByActionValue_changeRequest___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 localIdentifier];
  if (v4)
  {
    id v5 = [[PGGraphPersonActivityMeaningNode alloc] initWithPersonLocalIdentifier:v4 activity:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) addNode:v5];
    id v6 = [[PGGraphPracticesActivityEdge alloc] initFromPersonNode:v3 toActivityNode:v5];
    [*(id *)(a1 + 48) addEdge:v6];
    [*(id *)(a1 + 32) _connectPersonActivityMeaningNode:v5 toMomentNode:*(void *)(a1 + 56) withChangeRequest:*(void *)(a1 + 48) representativeAssetUUIDsByPersonLocalIdentifier:*(void *)(a1 + 64)];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) loggingConnection];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v3 name];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "[PGGraphBuilder+MomentFeatures] No person Local identifier for person node with name %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (id)criteriaEvaluatorsByValidPersonActivityMeaningLabelFromAssets:(id)a3 withPersonActivityMeaningCriteriaDictionaryByMeaningLabel:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v19 = v6;
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = v6;
    uint64_t v22 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v22)
    {
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v7);
          }
          uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v10 = objc_msgSend(v7, "objectForKeyedSubscript:", v9, v19);
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v12 = v10;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v24 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                if ([v17 allCriteriaPassForAssets:v5]) {
                  [v11 addObject:v17];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v14);
          }

          if ([v11 count]) {
            [v20 setObject:v11 forKeyedSubscript:v9];
          }
        }
        uint64_t v22 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v22);
    }

    id v6 = v19;
  }
  else
  {
    id v20 = (id)MEMORY[0x1E4F1CC08];
  }

  return v20;
}

- (id)criteriaEvaluatorsByValidPersonActivityMeaningLabelFromMomentNode:(id)a3 sceneEdges:(id)a4 withPersonActivityMeaningCriteriaDictionaryByMeaningLabel:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = [[PGMeaningCriteriaMomentNodeCache alloc] initWithMomentNode:v7];
    id v23 = v8;
    [(PGMeaningCriteriaMomentNodeCache *)v10 setSceneEdges:v8];
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v22 = v9;
    id obj = v9;
    uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v26)
    {
      uint64_t v25 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(obj, "objectForKeyedSubscript:", v12, v22);
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v15 = v13;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v29 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                if ([v20 allCriteriaPassForMomentNode:v7 momentNodeCache:v10]) {
                  [v14 addObject:v20];
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v17);
          }

          if ([v14 count]) {
            [v24 setObject:v14 forKeyedSubscript:v12];
          }
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v26);
    }

    id v9 = v22;
    id v8 = v23;
  }
  else
  {
    id v24 = (id)MEMORY[0x1E4F1CC08];
  }

  return v24;
}

- (void)_insertMomentFeaturesForMomentNode:(id)a3 momentEnvelope:(id)a4 assets:(id)a5 photoLibrary:(id)a6 featureProvider:(id)a7 atMomentIngest:(BOOL)a8 curationContext:(id)a9
{
  BOOL v9 = a8;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v88 = a9;
  id v91 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  uint64_t v81 = v19;
  id v20 = [v19 featureInstancesWithMomentNode:v15 atMomentIngest:v9];
  if (v9)
  {
    uint64_t v21 = [(PGGraphBuilder *)self personActivityMeaningCriteriaDictionaryByMeaningLabel];
    id v22 = [v16 sceneEdges];
    uint64_t v23 = [(PGGraphBuilder *)self criteriaEvaluatorsByValidPersonActivityMeaningLabelFromMomentNode:v15 sceneEdges:v22 withPersonActivityMeaningCriteriaDictionaryByMeaningLabel:v21];
  }
  else
  {
    uint64_t v23 = 0;
  }
  BOOL v24 = ([v20 count] | v23) != 0;
  double v92 = self;
  id v80 = v16;
  uint64_t v82 = v20;
  uint64_t v83 = (void *)v23;
  if (v17 || !v24) {
    goto LABEL_17;
  }
  id v25 = objc_alloc_init(MEMORY[0x1E4F76C98]);
  uint64_t v26 = v25;
  if (v23)
  {
    [v25 setScenesPrefetchMode:2];
    [v26 setPersonsPrefetchMode:2];
    [v26 setFaceInformationPrefetchMode:2];
  }
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v27 = v20;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v109 objects:v119 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v110 != v30) {
          objc_enumerationMutation(v27);
        }
        long long v32 = [*(id *)(*((void *)&v109 + 1) + 8 * i) specification];
        long long v33 = [v32 assetFeederPrefetchOptions];
        [v26 mergeWithFeederPrefetchOptions:v33];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v109 objects:v119 count:16];
    }
    while (v29);
  }

  long long v34 = [v18 librarySpecificFetchOptions];
  [v34 setFetchLimit:1];
  long long v35 = (void *)MEMORY[0x1E4F38EE8];
  uint64_t v36 = [v15 localIdentifier];
  id v118 = v36;
  uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v118 count:1];
  uint64_t v38 = [v35 fetchAssetCollectionsWithLocalIdentifiers:v37 options:v34];
  os_signpost_id_t v39 = [v38 firstObject];

  if (v39)
  {
    uint64_t v40 = (void *)MEMORY[0x1E4F76CF0];
    long long v41 = [(PGGraphBuilder *)v92 curationContext];
    long long v42 = [v40 feederForAssetCollection:v39 options:0 feederPrefetchOptions:v26 curationContext:v41];

    id v17 = [v42 allItems];

    id v20 = v82;
LABEL_17:
    id v89 = v17;
    id v90 = v15;
    id v79 = v18;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v43 = v20;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v105 objects:v115 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v106;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v106 != v46) {
            objc_enumerationMutation(v43);
          }
          uint64_t v48 = *(void **)(*((void *)&v105 + 1) + 8 * j);
          id v49 = [v48 specification];
          id v50 = (id)[v49 addFeatureNodeIfNeededWithGraphBuilder:v92];
          v102[0] = MEMORY[0x1E4F143A8];
          v102[1] = 3221225472;
          v102[2] = __151__PGGraphBuilder_MomentFeatures___insertMomentFeaturesForMomentNode_momentEnvelope_assets_photoLibrary_featureProvider_atMomentIngest_curationContext___block_invoke;
          v102[3] = &unk_1E68EA710;
          id v103 = v15;
          id v104 = v91;
          [v49 enumerateFeatureNodesWithInstance:v48 assets:v89 curationContext:v88 usingBlock:v102];
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v105 objects:v115 count:16];
      }
      while (v45);
    }

    uint64_t v26 = v89;
    uint64_t v51 = v92;
    if (v9)
    {
      uint64_t v52 = [(PGGraphBuilder *)v92 criteriaEvaluatorsByValidPersonActivityMeaningLabelFromAssets:v89 withPersonActivityMeaningCriteriaDictionaryByMeaningLabel:v83];
      id v93 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v53 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v54 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v98 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      id obj = v52;
      uint64_t v85 = [obj countByEnumeratingWithState:&v98 objects:v114 count:16];
      if (v85)
      {
        uint64_t v84 = *(void *)v99;
        do
        {
          uint64_t v55 = 0;
          do
          {
            if (*(void *)v99 != v84) {
              objc_enumerationMutation(obj);
            }
            uint64_t v87 = v55;
            uint64_t v56 = *(void *)(*((void *)&v98 + 1) + 8 * v55);
            id v57 = [obj objectForKeyedSubscript:v56];
            long long v94 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            long long v97 = 0u;
            uint64_t v58 = [v57 countByEnumeratingWithState:&v94 objects:v113 count:16];
            if (v58)
            {
              uint64_t v59 = v58;
              uint64_t v60 = *(void *)v95;
              do
              {
                for (uint64_t k = 0; k != v59; ++k)
                {
                  if (*(void *)v95 != v60) {
                    objc_enumerationMutation(v57);
                  }
                  id v62 = *(void **)(*((void *)&v94 + 1) + 8 * k);
                  id v63 = [v62 meaningSceneCriteria];

                  if (v63)
                  {
                    id v64 = [v62 meaningSceneCriteria];
                    id v65 = [v64 positiveScenes];

                    id v66 = [MEMORY[0x1E4F1CAD0] setWithArray:v65];
                    [v93 setObject:v66 forKeyedSubscript:v56];
                  }
                  id v67 = [v62 meaningActionCriteria];

                  if (v67)
                  {
                    id v68 = [v62 meaningActionCriteria];
                    [v54 setObject:v68 forKeyedSubscript:v56];

                    id v69 = NSString;
                    BOOL v70 = [v62 meaningActionCriteria];
                    id v71 = objc_msgSend(v69, "stringWithFormat:", @"%ld", objc_msgSend(v70, "actionValue"));

                    [v53 setObject:v56 forKeyedSubscript:v71];
                  }
                }
                uint64_t v59 = [v57 countByEnumeratingWithState:&v94 objects:v113 count:16];
              }
              while (v59);
            }

            uint64_t v55 = v87 + 1;
          }
          while (v87 + 1 != v85);
          uint64_t v85 = [obj countByEnumeratingWithState:&v98 objects:v114 count:16];
        }
        while (v85);
      }

      uint64_t v51 = v92;
      uint64_t v26 = v89;
      [(PGGraphBuilder *)v92 _updatePersonActivitiesOfMomentNode:v90 assets:v89 graph:v92->_graph withPositiveSceneCriteriaByValidPersonActivityMeaningLabel:v93 andActionCriteriaByValidPersonActivityMeaningLabel:v54 validPersonActivityMeaningLabelByActionValue:v53 changeRequest:v91];
    }
    graph = v51->_graph;
    id v73 = v91;
    [(MAGraph *)graph executeGraphChangeRequest:v91];
    id v15 = v90;
    id v18 = v79;
    id v74 = v80;
    os_signpost_id_t v75 = v82;
    id v76 = v83;
    goto LABEL_45;
  }
  id v77 = [(PGGraphBuilder *)v92 loggingConnection];
  id v76 = v83;
  if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
  {
    uint64_t v78 = [v15 name];
    *(_DWORD *)uint64_t buf = 138412290;
    BOOL v117 = v78;
    _os_log_impl(&dword_1D1805000, v77, OS_LOG_TYPE_INFO, "[PGGraphBuilder+MomentFeatures] No moment found for moment node %@, database out of date", buf, 0xCu);
  }
  id v73 = v91;
  os_signpost_id_t v75 = v82;
  id v74 = v80;
LABEL_45:
}

void __151__PGGraphBuilder_MomentFeatures___insertMomentFeaturesForMomentNode_momentEnvelope_assets_photoLibrary_featureProvider_atMomentIngest_curationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v11 = [v5 componentsJoinedByString:@","];
  id v7 = [PGGraphMomentFeaturesEdge alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [v5 count];

  id v10 = [(PGGraphMomentFeaturesEdge *)v7 initFromMomentNode:v8 toFeatureNode:v6 numberOfRelevantAssets:v9 allAssetUUIDs:v11];
  [*(id *)(a1 + 40) addEdge:v10];
}

- (void)insertMomentFeaturesForMomentNode:(id)a3 momentEnvelope:(id)a4 assets:(id)a5 featureProvider:(id)a6 atMomentIngest:(BOOL)a7 curationContext:(id)a8
{
  BOOL v9 = a7;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if ([v16 count])
  {
    [(PGGraphBuilder *)self _insertMomentFeaturesForMomentNode:v14 momentEnvelope:v15 assets:v16 photoLibrary:0 featureProvider:v17 atMomentIngest:v9 curationContext:v18];
  }
  else
  {
    id v19 = +[PGLogging sharedLogging];
    id v20 = [v19 loggingConnection];

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = [v14 localIdentifier];
      *(_DWORD *)uint64_t buf = 138412290;
      uint64_t v23 = v21;
      _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "No assets passed in to insertMomentFeaturesForMomentNode for moment node with local identifier %@", buf, 0xCu);
    }
  }
}

- (void)insertMomentFeaturesForMomentNode:(id)a3 momentEnvelope:(id)a4 photoLibrary:(id)a5 featureProvider:(id)a6 atMomentIngest:(BOOL)a7 curationContext:(id)a8
{
}

- (id)_removeInvalidPeopleEventEdgesFromMomentNode:(id)a3 edgesToUpsert:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PGGraphAnniversaryEventEdge filter];
  uint64_t v8 = [v7 labels];
  BOOL v9 = +[PGGraphBirthdayEventEdge filter];
  id v10 = [v9 labels];
  id v11 = [v8 setByAddingObjectsFromSet:v10];

  id v12 = objc_alloc(MEMORY[0x1E4F71EB0]);
  uint64_t v13 = (void *)[v12 initWithLabels:v11 domain:301 properties:MEMORY[0x1E4F1CC08]];
  id v14 = [v6 collection];

  id v15 = +[MAEdgeCollection edgesFromNodes:v14 matchingFilter:v13];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __91__PGGraphBuilder_PeopleEvents___removeInvalidPeopleEventEdgesFromMomentNode_edgesToUpsert___block_invoke;
  v22[3] = &unk_1E68F1AA0;
  id v23 = v5;
  id v17 = v16;
  id v24 = v17;
  id v18 = v5;
  [v15 enumerateEdgesUsingBlock:v22];
  id v19 = v24;
  id v20 = v17;

  return v20;
}

void __91__PGGraphBuilder_PeopleEvents___removeInvalidPeopleEventEdgesFromMomentNode_edgesToUpsert___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(v3, "isSameEdgeAsEdge:", *(void *)(*((void *)&v9 + 1) + 8 * v8), (void)v9))
        {

          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  [*(id *)(a1 + 40) addObject:v3];
LABEL_11:
}

- (id)_anniversaryEventEdgeFromMomentNode:(id)a3 toPersonNode:(id)a4 confidence:(double)a5 insertIfNeededToChangeRequest:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v10 collection];
  uint64_t v14 = [v11 collection];
  id v15 = +[PGGraphEdgeCollection edgesFromNodes:v13 toNodes:v14];
  id v16 = [v15 anyEdge];

  if (v16)
  {
    id v17 = [v16 propertyDictionary];
    id v18 = +[PGGraphAnniversaryEventEdge propertyDictionaryWithConfidence:a5];
    if (([v17 isEqualToDictionary:v18] & 1) == 0)
    {
      -[MAGraph persistModelProperties:forEdgeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forEdgeWithIdentifier:clobberExisting:", v18, [v16 identifier], 1);
      id v19 = +[PGGraphEdgeCollection edgesFromNodes:v13 toNodes:v14];
      uint64_t v20 = [v19 anyEdge];

      id v16 = (id)v20;
    }
  }
  else
  {
    id v16 = [[PGGraphAnniversaryEventEdge alloc] initFromMomentNode:v10 toPersonNode:v11 confidence:a5];
    [v12 addEdge:v16];
  }

  return v16;
}

- (id)_birthdayEventEdgeFromMomentNode:(id)a3 toPersonNode:(id)a4 confidence:(double)a5 insertIfNeededToChangeRequest:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v10 collection];
  uint64_t v14 = [v11 collection];
  id v15 = +[PGGraphEdgeCollection edgesFromNodes:v13 toNodes:v14];
  id v16 = [v15 anyEdge];

  if (v16)
  {
    id v17 = [v16 propertyDictionary];
    id v18 = +[PGGraphBirthdayEventEdge propertyDictionaryWithConfidence:a5];
    if (([v17 isEqualToDictionary:v18] & 1) == 0)
    {
      -[MAGraph persistModelProperties:forEdgeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forEdgeWithIdentifier:clobberExisting:", v18, [v16 identifier], 1);
      id v19 = +[PGGraphEdgeCollection edgesFromNodes:v13 toNodes:v14];
      uint64_t v20 = [v19 anyEdge];

      id v16 = (id)v20;
    }
  }
  else
  {
    id v16 = [[PGGraphBirthdayEventEdge alloc] initFromMomentNode:v10 toPersonNode:v11 confidence:a5];
    [v12 addEdge:v16];
  }

  return v16;
}

- (id)_upsertPeopleEventEdgesFromMomentNode:(id)a3 matchingResults:(id)a4 changeRequest:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v8 = a4;
  id v29 = a5;
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v27 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
  long long v9 = [v27 anyNode];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v15 isMatching])
        {
          id v16 = [v15 requiredCriteria];
          id v17 = [v16 meaningNodeLabel];

          [v15 score];
          double v19 = v18;
          if ([v17 isEqualToString:@"Birthday"])
          {
            uint64_t v20 = [v15 requiredCriteria];
            uint64_t v21 = [v20 additionalInfo];
            id v22 = [v21 objectForKeyedSubscript:@"personLocalIdentifier"];

            id v23 = +[PGGraphPersonNodeCollection personNodesForLocalIdentifier:v22 inGraph:self->_graph];
            id v24 = [v23 anyNode];

            if (v24)
            {
              id v25 = [(PGGraphBuilder *)self _birthdayEventEdgeFromMomentNode:v30 toPersonNode:v24 confidence:v29 insertIfNeededToChangeRequest:v19];
            }
            else
            {
              id v25 = 0;
            }

            if (v25)
            {
LABEL_16:
              [v28 addObject:v25];
            }
          }
          else if (v9)
          {
            if ([v17 isEqualToString:@"Anniversary"])
            {
              id v25 = [(PGGraphBuilder *)self _anniversaryEventEdgeFromMomentNode:v30 toPersonNode:v9 confidence:v29 insertIfNeededToChangeRequest:v19];
              if (v25) {
                goto LABEL_16;
              }
            }
          }

          continue;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v12);
  }

  return v28;
}

- (void)upsertPeopleEventEdgesOfMomentNode:(id)a3 matchingResults:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  id v10 = [(PGGraphBuilder *)self _upsertPeopleEventEdgesFromMomentNode:v8 matchingResults:v7 changeRequest:v9];

  uint64_t v11 = [(PGGraphBuilder *)self _removeInvalidPeopleEventEdgesFromMomentNode:v8 edgesToUpsert:v10];

  if ([v11 count])
  {
    uint64_t v12 = [(MAElementCollection *)[PGGraphEdgeCollection alloc] initWithArray:v11 graph:self->_graph];
    [v9 removeEdges:v12];
  }
  if ([v10 count] || objc_msgSend(v11, "count"))
  {
    [(MAGraph *)self->_graph executeGraphChangeRequest:v9];
    uint64_t v13 = [(PGGraphBuilder *)self loggingConnection];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v16 = 134217984;
      uint64_t v17 = [v11 count];
      _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "[PGGraphBuilder+PeopleEvents] Successfully remove %lu PeopleEvent domain edges", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v14 = [(PGGraphBuilder *)self loggingConnection];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [v10 count];
      int v16 = 134217984;
      uint64_t v17 = v15;
      _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "[PGGraphBuilder+PeopleEvents] Successfully upsert %lu PeopleEvent domain edges", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (id)insertMusicTrackWithTrackTitle:(id)a3 durationInSeconds:(double)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"durt";
  uint64_t v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithDouble:a4];
  v12[1] = @"name";
  v13[0] = v8;
  v13[1] = v7;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  id v10 = [(PGMutableGraph *)self->_graph addUniqueNodeWithLabel:@"MusicTrack" domain:1000 properties:v9 didCreate:0];

  return v10;
}

- (id)insertMusicAlbumNodeWithAlbumTitle:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v9 = @"name";
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [(PGMutableGraph *)self->_graph addUniqueNodeWithLabel:@"MusicAlbum" domain:1000 properties:v6 didCreate:0];

  return v7;
}

- (id)insertMusicGenreNodeWithGenreName:(id)a3
{
  return [(PGMutableGraph *)self->_graph addUniqueNodeWithLabel:a3 domain:1001 properties:0 didCreate:0];
}

- (id)insertMusicSessionNodeWithLocalStartDate:(id)a3 localEndDate:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = @"tzs";
  uint64_t v6 = NSNumber;
  id v7 = a4;
  [a3 timeIntervalSince1970];
  id v8 = objc_msgSend(v6, "numberWithDouble:");
  v16[1] = @"tze";
  v17[0] = v8;
  id v9 = NSNumber;
  [v7 timeIntervalSince1970];
  double v11 = v10;

  uint64_t v12 = [v9 numberWithDouble:v11];
  v17[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  uint64_t v14 = [(PGMutableGraph *)self->_graph addUniqueNodeWithLabel:@"MusicSession" domain:1000 properties:v13 didCreate:0];

  return v14;
}

- (void)performProcessingSteps:(id)a3 withGraphUpdate:(id)a4 progressBlock:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v8 = a4;
  id v38 = a5;
  id v9 = (void (**)(void *, unsigned char *, double))_Block_copy(v38);
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = (double *)&v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  if (v9)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v55[3] >= 0.01)
    {
      v55[3] = Current;
      char v53 = 0;
      v9[2](v9, &v53, 0.0);
      char v33 = *((unsigned char *)v59 + 24) | v53;
      *((unsigned char *)v59 + 24) = v33;
      if (v33 || ![(MAGraph *)self->_graph noFatalError])
      {
        long long v34 = MEMORY[0x1E4F14500];
        id v35 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          int v36 = *((unsigned __int8 *)v59 + 24);
          BOOL v37 = [(MAGraph *)self->_graph noFatalError];
          *(_DWORD *)uint64_t buf = 67109890;
          LODWORD(v64) = v36;
          WORD2(v64) = 1024;
          *(_DWORD *)((char *)&v64 + 6) = !v37;
          WORD5(v64) = 1024;
          HIDWORD(v64) = 54;
          __int16 v65 = 2080;
          id v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/"
                "Ingest/Ingest Processing/PGGraphBuilder+Processing.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
        }

        goto LABEL_36;
      }
    }
  }
  double v11 = [(PGGraphBuilder *)self loggingConnection];
  [(MAGraph *)self->_graph enterBatch];
  uint64_t v40 = self;
  unint64_t v12 = [v39 count];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v39;
  uint64_t v13 = [obj countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (v13)
  {
    double v14 = 1.0 / (double)v12;
    uint64_t v15 = *(void *)v50;
    double v16 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        double v19 = (void *)MEMORY[0x1D25FED50]();
        int v20 = [v18 shouldRunWithGraphUpdate:v8];
        uint64_t v21 = v11;
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
        if (v20)
        {
          if (v22)
          {
            id v23 = (objc_class *)objc_opt_class();
            id v24 = NSStringFromClass(v23);
            *(_DWORD *)uint64_t buf = 138412290;
            *(void *)&long long v64 = v24;
            _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "GraphBuilder - Starting %@", buf, 0xCu);
          }
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __83__PGGraphBuilder_Processing__performProcessingSteps_withGraphUpdate_progressBlock___block_invoke;
          v42[3] = &unk_1E68ECB50;
          double v46 = v16;
          double v47 = v14;
          id v43 = v9;
          uint64_t v44 = &v54;
          uint64_t v48 = 0x3F847AE147AE147BLL;
          uint64_t v45 = &v58;
          [v18 runWithGraphUpdate:v8 progressBlock:v42];
          if (*((unsigned char *)v59 + 24))
          {

            goto LABEL_21;
          }
          BOOL v30 = [(MAGraph *)v40->_graph noFatalError];

          if (!v30) {
            goto LABEL_21;
          }
        }
        else
        {
          if (v22)
          {
            id v25 = (objc_class *)objc_opt_class();
            uint64_t v26 = NSStringFromClass(v25);
            *(_DWORD *)uint64_t buf = 138412290;
            *(void *)&long long v64 = v26;
            _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "GraphBuilder - Skipping %@", buf, 0xCu);
          }
        }
        double v16 = v14 + v16;
        if (!v9
          || (double v27 = CFAbsoluteTimeGetCurrent(), v27 - v55[3] < 0.01)
          || (v55[3] = v27,
              buf[0] = 0,
              v9[2](v9, buf, v16),
              char v28 = *((unsigned char *)v59 + 24) | buf[0],
              (*((unsigned char *)v59 + 24) = v28) == 0))
        {
          int v29 = 1;
          goto LABEL_22;
        }
LABEL_21:
        int v29 = 0;
LABEL_22:
        if (!v29) {
          goto LABEL_25;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v49 objects:v62 count:16];
    }
    while (v13);
  }
LABEL_25:

  [(MAGraph *)v40->_graph leaveBatch];
  if (v9)
  {
    double v31 = CFAbsoluteTimeGetCurrent();
    if (v31 - v55[3] >= 0.01)
    {
      v55[3] = v31;
      char v53 = 0;
      v9[2](v9, &v53, 1.0);
      char v32 = *((unsigned char *)v59 + 24) | v53;
      *((unsigned char *)v59 + 24) = v32;
      if (v32)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 67109378;
          LODWORD(v64) = 80;
          WORD2(v64) = 2080;
          *(void *)((char *)&v64 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphBuilder+Processing.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_36:
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
}

void __83__PGGraphBuilder_Processing__performProcessingSteps_withGraphUpdate_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(a1 + 56);
    double v7 = *(double *)(a1 + 64);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6 + v7 * a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)performPostprocessingWithGraphUpdate:(id)a3 withRecipe:(id)a4 progressBlock:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [(PGGraphBuilder *)self loggingConnection];
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  uint64_t v13 = v11;
  double v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PostProcessing", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v15 = mach_absolute_time();
  [(PGGraph *)self->_graph invalidateProcessingCaches];
  double v16 = [v9 postprocessorsWithGraphBuilder:self];

  [(PGGraphBuilder *)self performProcessingSteps:v16 withGraphUpdate:v10 progressBlock:v8];
  uint64_t v17 = mach_absolute_time();
  mach_timebase_info v18 = info;
  double v19 = v14;
  int v20 = v19;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_END, v12, "PostProcessing", "", buf, 2u);
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 136315394;
    id v23 = "PostProcessing";
    __int16 v24 = 2048;
    double v25 = (float)((float)((float)((float)(v17 - v15) * (float)v18.numer) / (float)v18.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (void)performPreprocessingWithGraphUpdate:(id)a3 withRecipe:(id)a4 progressBlock:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [(PGGraphBuilder *)self loggingConnection];
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  uint64_t v13 = v11;
  double v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PreProcessing", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v15 = mach_absolute_time();
  double v16 = [v9 preprocessorsWithGraphBuilder:self];

  [(PGGraphBuilder *)self performProcessingSteps:v16 withGraphUpdate:v10 progressBlock:v8];
  uint64_t v17 = mach_absolute_time();
  mach_timebase_info v18 = info;
  double v19 = v14;
  int v20 = v19;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_END, v12, "PreProcessing", "", buf, 2u);
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 136315394;
    id v23 = "PreProcessing";
    __int16 v24 = 2048;
    double v25 = (float)((float)((float)((float)(v17 - v15) * (float)v18.numer) / (float)v18.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (id)insertMomentNodeForMoment:(id)a3
{
  id v4 = a3;
  id v5 = [[PGGraphMomentNode alloc] initFromMoment:v4];

  id v6 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  [v6 addNode:v5];
  [(MAGraph *)self->_graph executeGraphChangeRequest:v6];

  return v5;
}

- (id)nodesForMomentsInHighlight:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 photoLibrary];
  id v6 = [v5 librarySpecificFetchOptions];

  double v7 = [MEMORY[0x1E4F39238] fetchMomentsInHighlight:v4 options:v6];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
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
        double v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "uuid", (void)v18);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  uint64_t v15 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:v8 inGraph:self->_graph];
  double v16 = [v15 set];

  return v16;
}

- (id)nodesForHighlightsInHighlightDayGroup:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 photoLibrary];
  id v6 = [v5 librarySpecificFetchOptions];

  double v7 = [MEMORY[0x1E4F39238] fetchChildDayGroupHighlightsForHighlight:v4 options:v6];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
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
        double v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "uuid", (void)v18);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  uint64_t v15 = +[PGGraphHighlightNodeCollection highlightNodesForArrayOfUUIDs:v8 inGraph:self->_graph];
  double v16 = [v15 set];

  return v16;
}

- (id)insertHighlightGroupNodeWithHighlight:(id)a3
{
  id v4 = a3;
  id v5 = +[PGGraphHighlightNode propertiesWithHighlight:v4];
  char v22 = 0;
  id v6 = [(PGMutableGraph *)self->_graph addUniqueNodeWithLabel:@"HighlightGroup" domain:102 properties:v5 didCreate:&v22];
  graph = self->_graph;
  uint64_t v8 = [v4 type];

  id v9 = [(PGGraph *)graph nodeLabelForHighlightType:v8];
  if (!v22)
  {
    uint64_t v10 = [v6 collection];
    uint64_t v11 = [v10 typeNodes];
    uint64_t v12 = [v11 anyNode];
    uint64_t v13 = [v12 label];
    char v14 = [v13 isEqualToString:v9];

    if (v14) {
      goto LABEL_6;
    }
    uint64_t v15 = [v6 collection];
    double v16 = +[PGGraphHasTypeEdge filter];
    uint64_t v17 = +[MAEdgeCollection edgesFromNodes:v15 matchingFilter:v16];

    id v18 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    [v18 removeEdges:v17];
    [(MAGraph *)self->_graph executeGraphChangeRequest:v18];
  }
  if ([v9 length])
  {
    long long v19 = [(PGMutableGraph *)self->_graph addUniqueNodeWithLabel:v9 domain:103 properties:0 didCreate:0];
    id v20 = [(PGMutableGraph *)self->_graph addUniqueEdgeWithLabel:@"HAS_TYPE" sourceNode:v6 targetNode:v19 domain:103 properties:0];
  }
LABEL_6:

  return v6;
}

- (void)updateHighlightsForHighlightDayGroupNode:(id)a3 nodesForHighlightsInHighlightDayGroup:(id)a4
{
  id v6 = a3;
  double v7 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  uint64_t v10 = [v6 collection];
  uint64_t v11 = [(MAElementCollection *)[PGGraphHighlightNodeCollection alloc] initWithSet:v8 graph:self->_graph];

  uint64_t v12 = [(PGGraphHighlightNodeCollection *)v11 highlightGroupNodes];
  uint64_t v23 = [v12 collectionBySubtracting:v10];

  uint64_t v13 = +[PGGraphGroupContainsEdge filter];
  char v14 = +[MAEdgeCollection edgesFromNodes:v23 toNodes:v11 matchingFilter:v13];

  [v9 removeEdges:v14];
  uint64_t v15 = [v10 highlightNodes];
  double v16 = [v15 collectionBySubtracting:v11];
  uint64_t v17 = +[PGGraphGroupContainsEdge filter];
  id v18 = +[MAEdgeCollection edgesFromNodes:v10 toNodes:v16 matchingFilter:v17];

  [v9 removeEdges:v18];
  long long v19 = [(MAElementCollection *)v11 collectionBySubtracting:v15];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __108__PGGraphBuilder_Highlight__updateHighlightsForHighlightDayGroupNode_nodesForHighlightsInHighlightDayGroup___block_invoke;
  v24[3] = &unk_1E68EDD78;
  id v25 = v6;
  id v26 = v9;
  id v20 = v9;
  id v21 = v6;
  [v19 enumerateNodesUsingBlock:v24];
  [(MAGraph *)self->_graph executeGraphChangeRequest:v20];
}

void __108__PGGraphBuilder_Highlight__updateHighlightsForHighlightDayGroupNode_nodesForHighlightsInHighlightDayGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PGGraphGroupContainsEdge alloc] initFromHighlightGroupNode:*(void *)(a1 + 32) toHighlightNode:v3];

  [*(id *)(a1 + 40) addEdge:v4];
}

- (void)insertHighlightDayGroupsWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = 0.0;
  long long v50 = (void (**)(void *, unsigned char *, double))_Block_copy(v7);
  if (v50)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v59 = 0;
      v50[2](v50, &v59, 0.0);
      if (v59)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 67109378;
          *(_DWORD *)id v63 = 176;
          *(_WORD *)&v63[4] = 2080;
          *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/PGGraphBuilder+Highlight.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_48;
      }
      double v8 = Current;
    }
  }
  id v44 = v7;
  uint64_t v45 = v6;
  uint64_t v10 = [v6 highlightDayGroupsToIngest];
  uint64_t v11 = [(PGGraphBuilder *)self loggingConnection];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = [v10 count];
    *(_DWORD *)uint64_t buf = 134217984;
    *(void *)id v63 = v12;
    _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "Batch Updates - About to insert %lu new highlight groups", buf, 0xCu);
  }

  uint64_t v13 = [(PGGraphBuilder *)self photoLibrary];
  char v14 = [v13 librarySpecificFetchOptions];

  double v47 = v14;
  [v14 setShouldPrefetchCount:1];
  unint64_t v15 = [v10 count];
  double v46 = [MEMORY[0x1E4F1CA80] setWithCapacity:v15];
  double v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v17 = v10;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v56 != v20) {
          objc_enumerationMutation(v17);
        }
        char v22 = [*(id *)(*((void *)&v55 + 1) + 8 * i) uuid];
        [v16 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v19);
  }

  id v43 = +[PGGraphHighlightNodeCollection highlightNodesForArrayOfUUIDs:v16 inGraph:self->_graph];
  long long v49 = [v43 highlightNodeByHighlightUUID];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v23 = v17;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v24)
  {
    uint64_t v26 = v24;
    unint64_t v27 = 0;
    uint64_t v28 = *(void *)v52;
    double v29 = (double)v15;
    *(void *)&long long v25 = 138412290;
    long long v42 = v25;
    id obj = v23;
LABEL_18:
    uint64_t v30 = 0;
    while (1)
    {
      if (*(void *)v52 != v28) {
        objc_enumerationMutation(obj);
      }
      double v31 = *(void **)(*((void *)&v51 + 1) + 8 * v30);
      char v32 = (void *)MEMORY[0x1D25FED50]();
      char v33 = [v31 uuid];
      long long v34 = [v49 objectForKeyedSubscript:v33];

      if (v34) {
        goto LABEL_22;
      }
      long long v34 = [MEMORY[0x1E4F39238] fetchChildDayGroupHighlightsForHighlight:v31 options:v47];
      if ([v34 count]) {
        break;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      id v35 = [v31 uuid];
      *(_DWORD *)uint64_t buf = v42;
      *(void *)id v63 = v35;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Not inserting highlightDayGroupNode (%@) because it has no children", buf, 0xCu);
LABEL_27:

LABEL_28:
      if (v26 == ++v30)
      {
        id v23 = obj;
        uint64_t v39 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
        uint64_t v26 = v39;
        if (v39) {
          goto LABEL_18;
        }
        goto LABEL_38;
      }
    }
    uint64_t v37 = [(PGGraphBuilder *)self insertHighlightGroupNodeWithHighlight:v31];
    if (!v37)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "[PGGraphBuilder+Highlight] calling this function insertHighlightGroupNodeWithHighlight: should not return nil", buf, 2u);
      }
      goto LABEL_28;
    }
    id v38 = (void *)v37;
    [v46 addObject:v37];

    long long v34 = v38;
LABEL_22:
    id v35 = -[PGGraphBuilder nodesForHighlightsInHighlightDayGroup:](self, "nodesForHighlightsInHighlightDayGroup:", v31, v42);
    [(PGGraphBuilder *)self updateHighlightsForHighlightDayGroupNode:v34 nodesForHighlightsInHighlightDayGroup:v35];
    if (v50)
    {
      double v36 = CFAbsoluteTimeGetCurrent();
      if (v36 - v8 >= 0.01)
      {
        char v59 = 0;
        v50[2](v50, &v59, (double)v27 / v29 * 0.5 + 0.2);
        if (v59)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)id v63 = 224;
            *(_WORD *)&v63[4] = 2080;
            *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Graph/Ingest/PGGraphBuilder+Highlight.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          id v23 = obj;

          id v7 = v44;
          id v6 = v45;
          uint64_t v40 = v46;
          long long v41 = v43;
          goto LABEL_47;
        }
        double v8 = v36;
      }
    }
    ++v27;
    goto LABEL_27;
  }
LABEL_38:

  id v7 = v44;
  id v6 = v45;
  uint64_t v40 = v46;
  long long v41 = v43;
  if (v50 && CFAbsoluteTimeGetCurrent() - v8 >= 0.01 && (char v59 = 0, v50[2](v50, &v59, 1.0), v59))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 67109378;
      *(_DWORD *)id v63 = 229;
      *(_WORD *)&v63[4] = 2080;
      *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Graph/Ingest/PGGraphBuilder+Highlight.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    objc_msgSend(v45, "setInsertedHighlightDayGroupNodes:", v46, v42);
  }
LABEL_47:

LABEL_48:
}

- (id)_propertiesFromIngestHighlight:(id)a3
{
  v23[5] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 uuid];
  id v5 = (void *)v4;
  id v6 = &stru_1F283BC78;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = v6;

  v23[0] = v7;
  v22[0] = @"id";
  v22[1] = @"tzs";
  double v8 = NSNumber;
  id v9 = [v3 localStartDate];
  [v9 timeIntervalSince1970];
  uint64_t v10 = objc_msgSend(v8, "numberWithDouble:");
  v23[1] = v10;
  v22[2] = @"utcs";
  uint64_t v11 = NSNumber;
  uint64_t v12 = [v3 startDate];
  [v12 timeIntervalSince1970];
  uint64_t v13 = objc_msgSend(v11, "numberWithDouble:");
  v23[2] = v13;
  v22[3] = @"tze";
  char v14 = NSNumber;
  unint64_t v15 = [v3 localEndDate];
  [v15 timeIntervalSince1970];
  double v16 = objc_msgSend(v14, "numberWithDouble:");
  v23[3] = v16;
  void v22[4] = @"utce";
  id v17 = NSNumber;
  uint64_t v18 = [v3 endDate];

  [v18 timeIntervalSince1970];
  uint64_t v19 = objc_msgSend(v17, "numberWithDouble:");
  v23[4] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];

  return v20;
}

- (void)updateHighlightNode:(id)a3 withHighlight:(id)a4
{
  id v6 = a3;
  id v9 = [(PGGraphBuilder *)self _propertiesFromIngestHighlight:a4];
  graph = self->_graph;
  uint64_t v8 = [v6 identifier];

  [(MAGraph *)graph persistModelProperties:v9 forNodeWithIdentifier:v8 clobberExisting:0];
}

- (id)insertHighlightNodeWithHighlight:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuid];
  id v6 = +[PGGraphHighlightNodeCollection highlightNodeForUUID:v5 inGraph:self->_graph];

  if ([v6 count])
  {
    id v7 = [v6 anyNode];
  }
  else
  {
    id v7 = [[PGGraphHighlightNode alloc] initFromHighlight:v4];
    id v8 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    [v8 addNode:v7];
    [(MAGraph *)self->_graph executeGraphChangeRequest:v8];
  }
  return v7;
}

- (void)updateMomentsForHighlightNode:(id)a3 nodesForMomentsInHighlight:(id)a4
{
  id v6 = a3;
  id v7 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  uint64_t v10 = [(MANodeCollection *)[PGGraphHighlightNodeCollection alloc] initWithNode:v6];
  uint64_t v11 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithSet:v8 graph:self->_graph];

  uint64_t v12 = [(PGGraphMomentNodeCollection *)v11 highlightNodes];
  uint64_t v13 = [v12 collectionBySubtracting:v10];

  char v14 = +[PGGraphContainsEdge filter];
  unint64_t v15 = +[MAEdgeCollection edgesFromNodes:v13 toNodes:v11 matchingFilter:v14];
  [v9 removeEdges:v15];

  double v16 = [(PGGraphHighlightNodeCollection *)v10 momentNodes];
  id v17 = [v16 collectionBySubtracting:v11];
  uint64_t v18 = +[PGGraphContainsEdge filter];
  uint64_t v19 = +[MAEdgeCollection edgesFromNodes:v10 toNodes:v17 matchingFilter:v18];
  [v9 removeEdges:v19];

  uint64_t v20 = [(MAElementCollection *)v11 collectionBySubtracting:v16];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  long long v25 = __86__PGGraphBuilder_Highlight__updateMomentsForHighlightNode_nodesForMomentsInHighlight___block_invoke;
  uint64_t v26 = &unk_1E68F0768;
  id v27 = v6;
  id v28 = v9;
  id v21 = v9;
  id v22 = v6;
  [v20 enumerateNodesUsingBlock:&v23];
  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v21, v23, v24, v25, v26);
}

void __86__PGGraphBuilder_Highlight__updateMomentsForHighlightNode_nodesForMomentsInHighlight___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PGGraphContainsEdge alloc] initFromHighlightNode:*(void *)(a1 + 32) toMomentNode:v3];

  [*(id *)(a1 + 40) addEdge:v4];
}

- (void)insertHighlightDaysWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = 0.0;
  id v9 = (double *)&unk_1D1F48000;
  long long v34 = (void (**)(void *, unsigned char *, double))_Block_copy(v7);
  if (v34)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      unsigned __int8 v39 = 0;
      v34[2](v34, &v39, 0.0);
      if (v39)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 67109378;
          *(_DWORD *)long long v42 = 75;
          *(_WORD *)&void v42[4] = 2080;
          *(void *)&v42[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/PGGraphBuilder+Highlight.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_33;
      }
      double v8 = Current;
    }
  }
  uint64_t v11 = [v6 highlightDaysToIngest];
  uint64_t v12 = [(PGGraphBuilder *)self loggingConnection];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [v11 count];
    *(_DWORD *)uint64_t buf = 134217984;
    *(void *)long long v42 = v13;
    _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "Batch Updates - About to insert %lu new highlights", buf, 0xCu);
  }

  [(MAGraph *)self->_graph enterBatch];
  char v14 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v11, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v32 = 0;
    char v33 = v14;
    id v30 = v7;
    id v31 = v6;
    uint64_t v18 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v21 = (void *)MEMORY[0x1D25FED50]();
        id v22 = [v20 uuid];
        uint64_t v23 = +[PGGraphHighlightNodeCollection highlightNodeForUUID:v22 inGraph:self->_graph];
        uint64_t v24 = [v23 anyNode];

        if (!v24)
        {
          uint64_t v24 = [(PGGraphBuilder *)self insertHighlightNodeWithHighlight:v20];
          [v33 addObject:v24];
        }
        long long v25 = -[PGGraphBuilder nodesForMomentsInHighlight:](self, "nodesForMomentsInHighlight:", v20, v30, v31);
        [(PGGraphBuilder *)self updateMomentsForHighlightNode:v24 nodesForMomentsInHighlight:v25];
        uint64_t v26 = [v15 count];
        if (v34)
        {
          unint64_t v27 = v26;
          double v28 = CFAbsoluteTimeGetCurrent();
          if (v28 - v8 >= 0.01)
          {
            buf[0] = 0;
            v34[2](v34, buf, (double)(unint64_t)(v32 + i) / (double)v27 * 0.5 + 0.2);
            if (buf[0])
            {

              int v29 = 1;
              double v8 = v28;
              goto LABEL_24;
            }
            double v8 = v28;
          }
        }
      }
      v32 += i;
      uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v17) {
        continue;
      }
      break;
    }
    int v29 = 0;
LABEL_24:
    id v7 = v30;
    id v6 = v31;
    id v9 = (double *)&unk_1D1F48000;
    char v14 = v33;
  }
  else
  {
    int v29 = 0;
  }

  [(MAGraph *)self->_graph leaveBatch];
  if (v34 && CFAbsoluteTimeGetCurrent() - v8 >= v9[87] && (unsigned __int8 v39 = 0, v34[2](v34, &v39, 1.0), v39 | v29))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 67109378;
      *(_DWORD *)long long v42 = 106;
      *(_WORD *)&void v42[4] = 2080;
      *(void *)&v42[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Graph/Ingest/PGGraphBuilder+Highlight.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    [v6 setInsertedHighlightNodes:v14];
  }

LABEL_33:
}

- (void)insertHighlightsWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = _Block_copy(v7);
  uint64_t v27 = 0;
  double v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = (double *)&v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  if (v8
    && (double Current = CFAbsoluteTimeGetCurrent(), Current - v24[3] >= 0.01)
    && (v24[3] = Current,
        char v22 = 0,
        (*((void (**)(void *, char *, double))v8 + 2))(v8, &v22, 0.0),
        char v10 = *((unsigned char *)v28 + 24) | v22,
        (*((unsigned char *)v28 + 24) = v10) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 67109378;
      int v32 = 55;
      __int16 v33 = 2080;
      long long v34 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/PGGraphBuilder+Highlight.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    [(MAGraph *)self->_graph enterBatch];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __75__PGGraphBuilder_Highlight__insertHighlightsWithGraphUpdate_progressBlock___block_invoke;
    void v17[3] = &unk_1E68F03F8;
    id v11 = v8;
    id v18 = v11;
    uint64_t v19 = &v23;
    uint64_t v20 = &v27;
    uint64_t v21 = 0x3F847AE147AE147BLL;
    [(PGGraphBuilder *)self insertHighlightDaysWithGraphUpdate:v6 progressBlock:v17];
    [(MAGraph *)self->_graph leaveBatch];
    if (*((unsigned char *)v28 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        int v32 = 62;
        __int16 v33 = 2080;
        long long v34 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/In"
              "gest/PGGraphBuilder+Highlight.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      [(MAGraph *)self->_graph enterBatch];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __75__PGGraphBuilder_Highlight__insertHighlightsWithGraphUpdate_progressBlock___block_invoke_260;
      v12[3] = &unk_1E68F03F8;
      id v13 = v11;
      char v14 = &v23;
      id v15 = &v27;
      uint64_t v16 = 0x3F847AE147AE147BLL;
      [(PGGraphBuilder *)self insertHighlightDayGroupsWithGraphUpdate:v6 progressBlock:v12];
      [(MAGraph *)self->_graph leaveBatch];
      if (*((unsigned char *)v28 + 24) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        int v32 = 69;
        __int16 v33 = 2080;
        long long v34 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/In"
              "gest/PGGraphBuilder+Highlight.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

void __75__PGGraphBuilder_Highlight__insertHighlightsWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __75__PGGraphBuilder_Highlight__insertHighlightsWithGraphUpdate_progressBlock___block_invoke_260(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)deleteHighlightsWithGraphUpdate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uuidsOfHighlightsToDelete];
  uint64_t v6 = [v5 count];
  uint64_t v7 = [(PGGraphBuilder *)self loggingConnection];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 134217984;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Batch Updates - About to delete %lu Highlights", (uint8_t *)&v13, 0xCu);
  }
  double v8 = +[PGGraphHighlightNodeCollection highlightNodesForUUIDs:v5 inGraph:self->_graph];
  uint64_t v9 = [v8 count];
  if (v9 != v6)
  {
    char v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v5];
    id v11 = [v8 uuids];
    [v10 minusSet:v11];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      uint64_t v14 = (uint64_t)v10;
      _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Failed to lookup Highlight nodes for deletion with UUIDs: \"%@\"", (uint8_t *)&v13, 0xCu);
    }
  }
  if (v9)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    [v12 removeNodes:v8];
    [(MAGraph *)self->_graph executeGraphChangeRequest:v12];
    [v4 setHasDeletedHighlightNodes:1];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 134218240;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Batch Updates - Deleted %lu Highlights (%lu requested)", (uint8_t *)&v13, 0x16u);
  }
}

- (id)insertPublicEvent:(id)a3 fromEventNode:(id)a4
{
  v94[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v54 = a4;
  v93[0] = @"id";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "muid"));
  v93[1] = @"name";
  v94[0] = v7;
  double v8 = [v6 name];
  v94[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:2];
  long long v56 = (void *)[v9 mutableCopy];

  uint64_t v10 = [v6 expectedAttendance];
  long long v55 = v6;
  if ([v6 hasExpectedAttendance] && v10 >= 1)
  {
    id v11 = [NSNumber numberWithInteger:v10];
    [v56 setObject:v11 forKeyedSubscript:@"attdc"];
  }
  char v79 = 0;
  id v12 = [(PGMutableGraph *)self->_graph addUniqueNodeWithLabel:@"PublicEvent" domain:900 properties:v56 didCreate:&v79];
  id v13 = [(PGMutableGraph *)self->_graph addUniqueEdgeWithLabel:@"PUBLIC_EVENT" sourceNode:v54 targetNode:v12 domain:900 properties:0];
  if (v79)
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v14 = [v55 performers];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v75 objects:v92 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v76 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          uint64_t v20 = [v19 localizedName];
          if ([v20 length])
          {
            uint64_t v21 = [v19 iTunesIdentifier];
            if ([v21 length])
            {
              v88[0] = @"name";
              v88[1] = @"id";
              v89[0] = v20;
              v89[1] = v21;
              char v22 = (void *)MEMORY[0x1E4F1C9E8];
              uint64_t v23 = (void **)v89;
              uint64_t v24 = (__CFString **)v88;
              uint64_t v25 = 2;
            }
            else
            {
              id v86 = @"name";
              uint64_t v87 = v20;
              char v22 = (void *)MEMORY[0x1E4F1C9E8];
              uint64_t v23 = &v87;
              uint64_t v24 = &v86;
              uint64_t v25 = 1;
            }
            uint64_t v27 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:v25];
            double v28 = [(PGMutableGraph *)self->_graph addUniqueNodeWithLabel:@"Performer" domain:900 properties:v27 didCreate:0];
            id v29 = [(PGMutableGraph *)self->_graph addUniqueEdgeWithLabel:@"PERFORMER" sourceNode:v12 targetNode:v28 domain:900 properties:0];
          }
          else
          {
            uint64_t v26 = +[PGLogging sharedLogging];
            uint64_t v27 = [v26 loggingConnection];

            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t buf = 138412290;
              id v91 = v19;
              _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "Not ingesting performer with empty name %@", buf, 0xCu);
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v75 objects:v92 count:16];
      }
      while (v16);
    }

    long long v57 = [(id)objc_opt_class() supportedCategories];
    uint64_t v61 = [v57 count];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id obj = [v55 categories];
    uint64_t v30 = [obj countByEnumeratingWithState:&v71 objects:v85 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v72;
      uint64_t v58 = *(void *)v72;
      do
      {
        uint64_t v33 = 0;
        uint64_t v59 = v31;
        do
        {
          if (*(void *)v72 != v32) {
            objc_enumerationMutation(obj);
          }
          long long v34 = *(void **)(*((void *)&v71 + 1) + 8 * v33);
          id v66 = [v34 category];
          if (![v66 length])
          {
            long long v38 = +[PGLogging sharedLogging];
            unsigned __int8 v39 = [v38 loggingConnection];

            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t buf = 138412290;
              id v91 = v34;
              _os_log_impl(&dword_1D1805000, v39, OS_LOG_TYPE_INFO, "Not ingesting empty categoryName string for category %@", buf, 0xCu);
            }
            goto LABEL_47;
          }
          if (!v61 || [v57 containsObject:v66])
          {
            uint64_t v35 = [v34 localizedName];
            uint64_t v65 = v33;
            id v63 = v35;
            if (v35 && (long long v36 = v35, [v35 length]))
            {
              uint64_t v83 = @"lcln";
              uint64_t v84 = v36;
              uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
            }
            else
            {
              uint64_t v37 = MEMORY[0x1E4F1CC08];
            }
            uint64_t v64 = v37;
            id v62 = -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniqueNodeWithLabel:domain:properties:didCreate:", v66, 901);
            id v40 = -[PGMutableGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:](self->_graph, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", @"CATEGORY", v12);
            long long v67 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v41 = [v34 localizedSubcategories];
            uint64_t v42 = [v41 countByEnumeratingWithState:&v67 objects:v82 count:16];
            if (v42)
            {
              uint64_t v43 = v42;
              uint64_t v44 = *(void *)v68;
              do
              {
                for (uint64_t j = 0; j != v43; ++j)
                {
                  if (*(void *)v68 != v44) {
                    objc_enumerationMutation(v41);
                  }
                  double v46 = *(void **)(*((void *)&v67 + 1) + 8 * j);
                  if ([v46 length])
                  {
                    uint64_t v47 = [v34 levelForLocalizedSubcategory:v46];
                    uint64_t v48 = MEMORY[0x1E4F1CC08];
                    if (v47 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      id v80 = @"lvl";
                      long long v49 = [NSNumber numberWithUnsignedInteger:v47];
                      uint64_t v81 = v49;
                      uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
                    }
                    buf[0] = 0;
                    long long v50 = [(PGMutableGraph *)self->_graph addUniqueNodeWithLabel:v46 domain:902 properties:v48 didCreate:buf];
                    id v51 = [(PGMutableGraph *)self->_graph addUniqueEdgeWithLabel:@"LOCALIZED_SUBCATEGORY" sourceNode:v12 targetNode:v50 domain:902 properties:0];
                  }
                  else
                  {
                    long long v52 = +[PGLogging sharedLogging];
                    uint64_t v48 = [v52 loggingConnection];

                    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)uint64_t buf = 138412290;
                      id v91 = v66;
                      _os_log_impl(&dword_1D1805000, v48, OS_LOG_TYPE_INFO, "Not ingesting empty localizedSubcategory string for category %@", buf, 0xCu);
                    }
                  }
                }
                uint64_t v43 = [v41 countByEnumeratingWithState:&v67 objects:v82 count:16];
              }
              while (v43);
            }

            uint64_t v32 = v58;
            uint64_t v31 = v59;
            unsigned __int8 v39 = v64;
            uint64_t v33 = v65;
LABEL_47:
          }
          ++v33;
        }
        while (v33 != v31);
        uint64_t v31 = [obj countByEnumeratingWithState:&v71 objects:v85 count:16];
      }
      while (v31);
    }
  }
  return v12;
}

- (void)deleteAllMemoryNodesAndEdgesForMemoryCategory:(unint64_t)a3
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  id v5 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:a3 inGraph:self->_graph];
  [v6 removeNodes:v5];
  [(MAGraph *)self->_graph executeGraphChangeRequest:v6];
}

- (void)deleteAllMemoryNodesAndEdgesForMemoryCategories:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v5 = a3;
  id v7 = objc_alloc_init(v4);
  id v6 = +[PGGraphMemoryNodeCollection memoryNodesOfCategories:v5 inGraph:self->_graph];

  [v7 removeNodes:v6];
  [(MAGraph *)self->_graph executeGraphChangeRequest:v7];
}

- (void)deleteAllMemoryNodesAndEdges
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  id v3 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
  [v4 removeNodes:v3];
  [(MAGraph *)self->_graph executeGraphChangeRequest:v4];
}

- (id)insertMemoryNodeFromMemory:(id)a3 changeRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 memoryCategory])
  {
    double v8 = objc_msgSend((id)objc_opt_class(), "memoryLabelForCategory:", objc_msgSend(v6, "memoryCategory"));
    uint64_t v9 = [v6 memoryFeatureNodesInGraph:self->_graph];
    uint64_t v10 = [v6 memoryMomentNodes];
    if (![v9 count])
    {
      id v11 = +[PGLogging sharedLogging];
      id v12 = [v11 loggingConnection];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "[IngestMemory] Attempting to insert memory with no feature nodes", buf, 2u);
      }
    }
    if (![v10 count])
    {
      id v13 = +[PGLogging sharedLogging];
      uint64_t v14 = [v13 loggingConnection];

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "[IngestMemory] Attempting to insert memory with no moment nodes", buf, 2u);
      }
    }
    uint64_t v15 = +[PGGraphMemoryNode uniqueMemoryIdentifierWithMemoryLabel:v8 featureNodes:v9];
    uint64_t v16 = -[PGGraphMemoryNode initWithLabel:memoryCategorySubcategory:uniqueMemoryIdentifier:generatedWithFallbackRequirements:]([PGGraphMemoryNode alloc], "initWithLabel:memoryCategorySubcategory:uniqueMemoryIdentifier:generatedWithFallbackRequirements:", v8, [v6 memoryCategorySubcategory], v15, objc_msgSend(v6, "generatedWithFallbackRequirements"));
    [v7 addNode:v16];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __67__PGGraphBuilder_Memory__insertMemoryNodeFromMemory_changeRequest___block_invoke;
    v27[3] = &unk_1E68EEEB0;
    uint64_t v17 = v16;
    double v28 = v17;
    id v18 = v7;
    id v29 = v18;
    [v9 enumerateNodesUsingBlock:v27];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __67__PGGraphBuilder_Memory__insertMemoryNodeFromMemory_changeRequest___block_invoke_2;
    v24[3] = &unk_1E68F0768;
    uint64_t v19 = v17;
    uint64_t v25 = v19;
    id v26 = v18;
    [v10 enumerateNodesUsingBlock:v24];
    uint64_t v20 = v26;
    uint64_t v21 = v19;
  }
  else
  {
    char v22 = +[PGLogging sharedLogging];
    double v8 = [v22 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "[IngestMemory] Attempting to insert memory with unknown memory category", buf, 2u);
    }
    uint64_t v21 = 0;
  }

  return v21;
}

void __67__PGGraphBuilder_Memory__insertMemoryNodeFromMemory_changeRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PGGraphMemoryFeaturesEdge alloc] initFromMemoryNode:*(void *)(a1 + 32) toFeatureNode:v3];

  [*(id *)(a1 + 40) addEdge:v4];
}

void __67__PGGraphBuilder_Memory__insertMemoryNodeFromMemory_changeRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PGGraphMemoryContainsAssetsFromEdge alloc] initFromMemoryNode:*(void *)(a1 + 32) toMomentSourceNode:v3];

  [*(id *)(a1 + 40) addEdge:v4];
}

- (id)insertMemoryNodeFromMemory:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(PGGraphBuilder *)self insertMemoryNodeFromMemory:v5 changeRequest:v6];

  if (v7) {
    [(MAGraph *)self->_graph executeGraphChangeRequest:v6];
  }

  return v7;
}

+ (unint64_t)memoryCategoryForLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"YearInReview"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"PersonOverTime"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"LastMonthAtHome"])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"Foodie"])
  {
    unint64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"Pet"])
  {
    unint64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"Baby"])
  {
    unint64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"Person"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"EarlyMomentsWithPerson"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"CityLocation"])
  {
    unint64_t v4 = 12;
  }
  else if ([v3 isEqualToString:@"RegionLocation"])
  {
    unint64_t v4 = 13;
  }
  else if ([v3 isEqualToString:@"MeaningfulEvent"])
  {
    unint64_t v4 = 16;
  }
  else if ([v3 isEqualToString:@"MeaningfulEventAggregation"])
  {
    unint64_t v4 = 17;
  }
  else if ([v3 isEqualToString:@"SocialGroupOverTime"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"SocialGroup"])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"RecurrentTrip"])
  {
    unint64_t v4 = 18;
  }
  else if ([v3 isEqualToString:@"Trip"])
  {
    unint64_t v4 = 19;
  }
  else if ([v3 isEqualToString:@"OngoingTrip"])
  {
    unint64_t v4 = 31;
  }
  else if ([v3 isEqualToString:@"PastSuperset"])
  {
    unint64_t v4 = 20;
  }
  else if ([v3 isEqualToString:@"SingleMoment"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Season"])
  {
    unint64_t v4 = 21;
  }
  else if ([v3 isEqualToString:@"AreaLocation"])
  {
    unint64_t v4 = 14;
  }
  else if ([v3 isEqualToString:@"DayInHistoryAggregation"])
  {
    unint64_t v4 = 23;
  }
  else if ([v3 isEqualToString:@"BusinessLocation"])
  {
    unint64_t v4 = 15;
  }
  else if ([v3 isEqualToString:@"RecentHighlights"])
  {
    unint64_t v4 = 24;
  }
  else if ([v3 isEqualToString:@"ChildActivity"])
  {
    unint64_t v4 = 25;
  }
  else if ([v3 isEqualToString:@"ExcitingMoments"])
  {
    unint64_t v4 = 26;
  }
  else if ([v3 isEqualToString:@"Trends"])
  {
    unint64_t v4 = 27;
  }
  else if ([v3 isEqualToString:@"PetOutdoor"])
  {
    unint64_t v4 = 28;
  }
  else if ([v3 isEqualToString:@"ChildAndPerson"])
  {
    unint64_t v4 = 29;
  }
  else if ([v3 isEqualToString:@"ChildOutdoor"])
  {
    unint64_t v4 = 30;
  }
  else if ([v3 isEqualToString:@"ContentCreationTool"])
  {
    unint64_t v4 = 100;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)memoryLabelForCategory:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = @"Unknown";
  id v5 = @"Unknown";
  if ((uint64_t)a3 > 200)
  {
    if (a3 - 201 < 0x15 || a3 - 301 < 2 || a3 == 401)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v8 = 134217984;
        unint64_t v9 = a3;
        _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "+[PGGraphBuilder memoryLabelForCategory:] is not compatible with legacy category: %lu", (uint8_t *)&v8, 0xCu);
      }

      unint64_t v4 = @"Legacy";
    }
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        unint64_t v4 = @"SingleMoment";
        goto LABEL_43;
      case 2uLL:
        unint64_t v4 = @"PersonOverTime";
        goto LABEL_43;
      case 3uLL:
        unint64_t v4 = @"Person";
        goto LABEL_43;
      case 4uLL:
        unint64_t v4 = @"EarlyMomentsWithPerson";
        goto LABEL_43;
      case 5uLL:
        unint64_t v4 = @"SocialGroupOverTime";
        goto LABEL_43;
      case 6uLL:
        unint64_t v4 = @"SocialGroup";
        goto LABEL_43;
      case 7uLL:
        unint64_t v4 = @"LastMonthAtHome";
        goto LABEL_43;
      case 8uLL:
        unint64_t v4 = @"YearInReview";
        goto LABEL_43;
      case 9uLL:
        unint64_t v4 = @"Foodie";
        goto LABEL_43;
      case 0xAuLL:
        unint64_t v4 = @"Pet";
        goto LABEL_43;
      case 0xBuLL:
        unint64_t v4 = @"Baby";
        goto LABEL_43;
      case 0xCuLL:
        unint64_t v4 = @"CityLocation";
        goto LABEL_43;
      case 0xDuLL:
        unint64_t v4 = @"RegionLocation";
        goto LABEL_43;
      case 0xEuLL:
        unint64_t v4 = @"AreaLocation";
        goto LABEL_43;
      case 0xFuLL:
        unint64_t v4 = @"BusinessLocation";
        goto LABEL_43;
      case 0x10uLL:
        unint64_t v4 = @"MeaningfulEvent";
        goto LABEL_43;
      case 0x11uLL:
        unint64_t v4 = @"MeaningfulEventAggregation";
        goto LABEL_43;
      case 0x12uLL:
        unint64_t v4 = @"RecurrentTrip";
        goto LABEL_43;
      case 0x13uLL:
        unint64_t v4 = @"Trip";
        goto LABEL_43;
      case 0x14uLL:
        unint64_t v4 = @"PastSuperset";
        goto LABEL_43;
      case 0x15uLL:
        unint64_t v4 = @"Season";
        goto LABEL_43;
      case 0x16uLL:
        break;
      case 0x17uLL:
        unint64_t v4 = @"DayInHistoryAggregation";
        goto LABEL_43;
      case 0x18uLL:
        unint64_t v4 = @"RecentHighlights";
        goto LABEL_43;
      case 0x19uLL:
        unint64_t v4 = @"ChildActivity";
        goto LABEL_43;
      case 0x1AuLL:
        unint64_t v4 = @"ExcitingMoments";
        goto LABEL_43;
      case 0x1BuLL:
        unint64_t v4 = @"Trends";
        goto LABEL_43;
      case 0x1CuLL:
        unint64_t v4 = @"PetOutdoor";
        goto LABEL_43;
      case 0x1DuLL:
        unint64_t v4 = @"ChildAndPerson";
        goto LABEL_43;
      case 0x1EuLL:
        unint64_t v4 = @"ChildOutdoor";
        goto LABEL_43;
      case 0x1FuLL:
        unint64_t v4 = @"OngoingTrip";
        goto LABEL_43;
      default:
        if (a3 - 101 < 2) {
          goto LABEL_5;
        }
        if (a3 != 100) {
          break;
        }
        unint64_t v4 = @"ContentCreationTool";
LABEL_43:
        id v6 = v4;

        break;
    }
  }
  return v4;
}

- (id)insertPresentEdgeFromPersonNode:(id)a3 toEventNode:(id)a4 numberOfAssetsWithPerson:(unint64_t)a5 edgeWeight:(float)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 collection];
  id v13 = [v11 collection];
  uint64_t v14 = +[PGGraphEdgeCollection edgesFromNodes:v12 toNodes:v13];

  if ([v14 count])
  {
    id v15 = [v14 anyEdge];
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    id v15 = [(PGGraphBasePresentEdge *)[PGGraphPersonPresentEdge alloc] initFromPersonNode:v10 toMomentNode:v11 importance:a5 numberOfAssets:a6];
    [v16 addEdge:v15];
    [(MAGraph *)self->_graph executeGraphChangeRequest:v16];
  }
  return v15;
}

- (id)insertPersonNodeForPerson:(id)a3 fromEventNode:(id)a4 numberOfAssetsWithPerson:(unint64_t)a5 edgeWeight:(float)a6
{
  return [(PGGraphBuilder *)self insertPersonNodeForPerson:a3 fromMomentNode:a4 numberOfAssetsWithPerson:a5 importanceInMoment:0 includeMergeCandidates:a6];
}

- (void)insertInferredEdgeFromMeNode:(id)a3 toInferredPersonNode:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 collection];
  unint64_t v9 = +[PGGraphInferredPersonEdge filter];
  id v10 = +[MAEdgeCollection edgesFromNodes:v8 matchingFilter:v9];

  if (![v10 count])
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    if (!v15) {
      goto LABEL_15;
    }
LABEL_11:
    id v18 = [(PGGraphBuilder *)self loggingConnection];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = [v7 localIdentifier];
      int v21 = 138412290;
      char v22 = v19;
      _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "Inferring Me to %@", (uint8_t *)&v21, 0xCu);
    }
    id v20 = [[PGGraphInferredPersonEdge alloc] initFromPersonNode:v6 toInferredPersonNode:v7];
    [v15 addEdge:v20];
    [(MAGraph *)self->_graph executeGraphChangeRequest:v15];

    goto LABEL_14;
  }
  if ((unint64_t)[v10 count] <= 1)
  {
    id v11 = [v10 anyEdge];
    id v12 = [v11 targetNode];
    uint64_t v13 = [v12 identifier];
    uint64_t v14 = [v7 identifier];

    if (v13 == v14)
    {
      id v15 = [(PGGraphBuilder *)self loggingConnection];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = [v7 localIdentifier];
        int v21 = 138412290;
        char v22 = v16;
        _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Inferred Me is up-to-date (%@)", (uint8_t *)&v21, 0xCu);
      }
LABEL_14:

      goto LABEL_15;
    }
  }
  uint64_t v17 = [(PGGraphBuilder *)self loggingConnection];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 67109120;
    LODWORD(v22) = [v10 count];
    _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_DEFAULT, "Deleting out-of-date Me inferred edge (found %d)", (uint8_t *)&v21, 8u);
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  [v15 removeEdges:v10];
  if (v15) {
    goto LABEL_11;
  }
LABEL_15:
}

- (void)inferPersonNodeForMeNode:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PGGraphBuilder *)self serviceManager];
  id v6 = [(PGGraphBuilder *)self photoLibrary];
  id v7 = [v5 inferredDeviceOwnerForPhotoLibrary:v6 ignoreContactLinking:0];

  int v8 = [(PGGraphBuilder *)self loggingConnection];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t v9 = [v7 localIdentifier];
    int v17 = 138412290;
    id v18 = v9;
    _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "Inferred device owner: %@", (uint8_t *)&v17, 0xCu);
  }
  if (v7)
  {
    peopleDomainBuildingHelper = self->_peopleDomainBuildingHelper;
    id v11 = [v7 localIdentifier];
    id v12 = [(PGGraphPeopleDomainBuildingHelper *)peopleDomainBuildingHelper insertedIdentifiedPersonForPersonLocalIdentifier:v11];

    if (v12)
    {
      uint64_t v13 = [v12 personNode];
    }
    else
    {
      id v15 = [MEMORY[0x1E4F76D50] personWithPHPerson:v7];
      uint64_t v13 = [(PGGraphBuilder *)self insertPersonNodeForPerson:v15];
    }
    id v16 = [(PGGraphBuilder *)self loggingConnection];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v13;
      _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "Inferred Me: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    uint64_t v14 = [(PGGraphBuilder *)self graph];
    uint64_t v13 = [v14 inferMeNodeFromSocialGroups];

    id v12 = [(PGGraphBuilder *)self loggingConnection];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v13;
      _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "Inferred Me (fallback): %@", (uint8_t *)&v17, 0xCu);
    }
  }

  if (v13) {
    [(PGGraphBuilder *)self insertInferredEdgeFromMeNode:v4 toInferredPersonNode:v13];
  }
}

- (id)insertOrUpdateMePersonNodeIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(PGGraph *)self->_graph meNode];
  if (!v3)
  {
    id v4 = [(PGGraphBuilder *)self serviceManager];
    id v5 = [v4 mePersonForGraphIngest];

    id v6 = [(PGGraphBuilder *)self loggingConnection];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_INFO, "No me node, using person identity: %@", (uint8_t *)&v9, 0xCu);
    }

    id v3 = [(PGGraphBuilder *)self insertMePersonNodeForPerson:v5];
  }
  id v7 = [(PGGraphBuilder *)self loggingConnection];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Using Me node: %@", (uint8_t *)&v9, 0xCu);
  }

  return v3;
}

- (void)setAgeCategory:(unint64_t)a3 onPersonNodeForIdentifier:(unint64_t)a4
{
  id v6 = +[PGGraphPersonNode propertiesWithAgeCategory:a3];
  [(MAGraph *)self->_graph persistModelProperties:v6 forNodeWithIdentifier:a4 clobberExisting:0];
}

- (void)setBiologicalSex:(unint64_t)a3 onPersonNodeForIdentifier:(unint64_t)a4
{
  id v6 = +[PGGraphPersonNode propertiesWithBiologicalSex:a3];
  [(MAGraph *)self->_graph persistModelProperties:v6 forNodeWithIdentifier:a4 clobberExisting:0];
}

- (id)insertContactSuggestion:(id)a3 forPersonNode:(id)a4 confidence:(double)a5 edgeProperties:(id)a6
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v10 fullName];
  if ([v13 length]) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;
  id v16 = [v10 CNIdentifier];
  if ([v16 length]) {
    int v17 = v16;
  }
  else {
    int v17 = 0;
  }
  id v18 = v17;
  uint64_t v19 = v18;
  long long v100 = 0;
  if (v15 && v18)
  {
    id v98 = v15;
    id v20 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    long long v96 = self;
    int v21 = +[PGGraphContactNodeCollection contactNodeForContactIdentifier:v19 inGraph:self->_graph];
    long long v99 = v20;
    long long v97 = v21;
    if ([v21 count])
    {
      long long v100 = [v21 anyNode];
      id v22 = v11;
      uint64_t v23 = [v11 collection];
      uint64_t v24 = +[PGGraphEdgeCollection edgesFromNodes:v23 toNodes:v21];
    }
    else
    {
      id v22 = v11;
      uint64_t v25 = [PGGraphContactNode alloc];
      id v26 = [v10 birthdayDate];
      uint64_t v27 = [v10 potentialBirthdayDate];
      uint64_t v28 = [(PGGraphContactNode *)v25 initWithName:v98 contactIdentifier:v19 birthdayDate:v26 potentialBirthdayDate:v27];

      long long v100 = (void *)v28;
      [v20 addNode:v28];
      uint64_t v24 = 0;
    }
    long long v95 = v24;
    id v11 = v22;
    id v29 = v20;
    if (![v24 count])
    {
      uint64_t v30 = [v12 objectForKeyedSubscript:@"gwscore"];
      [v30 doubleValue];
      double v94 = v31;

      uint64_t v32 = [v12 objectForKeyedSubscript:@"gwnummmtshome"];
      uint64_t v87 = [v32 unsignedIntegerValue];

      uint64_t v33 = [v12 objectForKeyedSubscript:@"gwnummentndaddrs"];
      uint64_t v93 = [v33 unsignedIntegerValue];

      long long v34 = [v12 objectForKeyedSubscript:@"gwnumbdaymmt"];
      uint64_t v92 = [v34 unsignedIntegerValue];

      uint64_t v35 = [v12 objectForKeyedSubscript:@"gwnummbdaymmt"];
      uint64_t v91 = [v35 unsignedIntegerValue];

      long long v36 = [v12 objectForKeyedSubscript:@"gwnummmtsclndrevents"];
      uint64_t v90 = [v36 unsignedIntegerValue];

      uint64_t v37 = [v12 objectForKeyedSubscript:@"gwnumassts"];
      uint64_t v89 = [v37 unsignedIntegerValue];

      long long v38 = [v12 objectForKeyedSubscript:@"gwnumcmm"];
      uint64_t v88 = [v38 unsignedIntegerValue];

      unsigned __int8 v39 = [v12 objectForKeyedSubscript:@"gwftfprntconf"];
      [v39 doubleValue];
      double v86 = v40;

      long long v41 = [v12 objectForKeyedSubscript:@"gwfprntsmatch"];
      char v85 = [v41 BOOLValue];

      uint64_t v83 = [v12 objectForKeyedSubscript:@"gwreldebug"];
      uint64_t v42 = [v12 objectForKeyedSubscript:@"gwsocialgrpsconf"];
      [v42 doubleValue];
      double v84 = v43;

      uint64_t v44 = [v12 objectForKeyedSubscript:@"gwsocialgrps"];
      uint64_t v45 = [v12 objectForKeyedSubscript:@"gwmsggrps"];
      double v46 = [v12 objectForKeyedSubscript:@"bdayscore"];
      [v46 doubleValue];
      double v82 = v47;

      uint64_t v48 = [v12 objectForKeyedSubscript:@"pbdayscore"];
      [v48 doubleValue];
      double v81 = v49;

      long long v50 = [v12 objectForKeyedSubscript:@"addscore"];
      [v50 doubleValue];
      double v80 = v51;

      long long v52 = [v12 objectForKeyedSubscript:@"maddscore"];
      [v52 doubleValue];
      double v54 = v53;

      long long v55 = [v12 objectForKeyedSubscript:@"calscore"];
      [v55 doubleValue];
      uint64_t v57 = v56;

      uint64_t v58 = [v12 objectForKeyedSubscript:@"asstscore"];
      [v58 doubleValue];
      uint64_t v60 = v59;

      uint64_t v61 = [v12 objectForKeyedSubscript:@"cmmscore"];
      [v61 doubleValue];
      uint64_t v63 = v62;

      uint64_t v64 = [v12 objectForKeyedSubscript:@"relscore"];
      [v64 doubleValue];
      uint64_t v66 = v65;

      long long v67 = [v12 objectForKeyedSubscript:@"scoremfp"];
      [v67 doubleValue];
      uint64_t v69 = v68;

      long long v70 = [v12 objectForKeyedSubscript:@"gwgenmatch"];
      double v71 = (double)(unint64_t)[v70 unsignedIntegerValue];

      LOBYTE(v79) = v85;
      id v72 = -[PGGraphContactSuggestionEdge initFromPersonNode:toContactNode:confidence:contactScore:numberOfMomentsAtHome:numberOfMomentsAtMentionedAddress:numberOfWeakBirthdayMomentsAroundBirthdayDate:numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate:numberOfMomentsOverlappingWithCalendarEvents:numberOfAppearancesInSharedAssets:numberOfCMMMoments:facetimeFaceprintConfidence:contactFaceprintMatch:relationshipsDebug:socialGroupsConfidence:socialGroupsDebug:messageGroupsDebug:birthdayScore:potentialBirthdayScore:addressScore:mentionedAddressScore:calendarScore:sharedAssetScore:sharedCMMScore:relationshipScore:scoreAfterMessagePenalty:sexMatch:]([PGGraphContactSuggestionEdge alloc], "initFromPersonNode:toContactNode:confidence:contactScore:numberOfMomentsAtHome:numberOfMomentsAtMentionedAddress:numberOfWeakBirthdayMomentsAroundBirthdayDate:numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate:numberOfMomentsOverlappingWithCalendarEvents:numberOfAppearancesInSharedAssets:numberOfCMMMoments:facetimeFaceprintConfidence:contactFaceprintMatch:relationshipsDebug:socialGroupsConfidence:socialGroupsDebug:messageGroupsDebug:birthdayScore:potentialBirthdayScore:addressScore:mentionedAddressScore:calendarScore:sharedAssetScore:sharedCMMScore:relationshipScore:scoreAfterMessagePenalty:sexMatch:", v11, v100, v87, v93, v92, v91, a5, v94, v86, v84, v82, v81,
              v80,
              v54,
              v90,
              v89,
              v88,
              v79,
              v83,
              v44,
              v45,
              v57,
              v60,
              v63,
              v66,
              v69,
              (unint64_t)v71);
      [v99 addEdge:v72];
    }
    [(MAGraph *)v96->_graph executeGraphChangeRequest:v99];
    long long v73 = +[PGLogging sharedLogging];
    long long v74 = [v73 loggingConnection];

    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      long long v75 = [v11 stringDescription];
      [v100 name];
      long long v77 = v76 = v11;
      *(_DWORD *)uint64_t buf = 138478083;
      id v102 = v75;
      __int16 v103 = 2113;
      id v104 = v77;
      _os_log_impl(&dword_1D1805000, v74, OS_LOG_TYPE_INFO, "IngestPeople: Photos Person %{private}@ with Contact %{private}@", buf, 0x16u);

      id v11 = v76;
      id v29 = v99;
    }
    id v15 = v98;
  }

  return v100;
}

- (void)updatePersonNodeForIdentifier:(unint64_t)a3 withPerson:(id)a4 forPropertyNames:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v22 = v8;
  id v10 = +[PGGraphPersonNode propertiesWithPerson:v8];
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v18 = [v10 objectForKeyedSubscript:v17];

        if (v18)
        {
          uint64_t v19 = [v10 objectForKeyedSubscript:v17];
          [v11 setObject:v19 forKeyedSubscript:v17];
        }
        else
        {
          uint64_t v19 = [(PGGraphBuilder *)self graph];
          [v19 removeModelPropertyForKey:v17 forNodeWithIdentifier:a3];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v14);
  }

  id v20 = [(PGGraphBuilder *)self loggingConnection];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 138412546;
    uint64_t v28 = v11;
    __int16 v29 = 2112;
    uint64_t v30 = v22;
    _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[PGGraphBuilder+People] relevantProperties to update = %@ with ingestPerson = %@", buf, 0x16u);
  }

  int v21 = [(PGGraphBuilder *)self graph];
  [v21 persistModelProperties:v11 forNodeWithIdentifier:a3 clobberExisting:0];
}

- (id)insertProximityEdgeFromPersonNode:(id)a3 toMomentNode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 collection];
  id v9 = [v7 collection];
  id v10 = +[PGGraphEdgeCollection edgesFromNodes:v8 toNodes:v9];

  if ([v10 count])
  {
    id v11 = [v10 anyEdge];
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    id v11 = [[PGGraphPersonProximityEdge alloc] initFromPersonNode:v6 toMomentNode:v7];
    [v12 addEdge:v11];
    [(MAGraph *)self->_graph executeGraphChangeRequest:v12];
  }
  return v11;
}

- (id)insertPersonNodeForPerson:(id)a3 fromMomentNode:(id)a4 numberOfAssetsWithPerson:(unint64_t)a5 importanceInMoment:(double)a6 includeMergeCandidates:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a4;
  uint64_t v13 = [(PGGraphBuilder *)self insertPersonNodeForPerson:a3];
  uint64_t v14 = [(PGGraphBuilder *)self insertPresentEdgeFromPersonNode:v13 toMomentNode:v12 numberOfAssetsWithPerson:a5 importance:v7 includeMergeCandidates:a6];

  return v13;
}

- (id)insertPresentEdgeFromPersonNode:(id)a3 toMomentNode:(id)a4 numberOfAssetsWithPerson:(unint64_t)a5 importance:(double)a6 includeMergeCandidates:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  if (!a7)
  {
    uint64_t v19 = [v12 collection];
    id v20 = [v13 collection];
    uint64_t v17 = +[PGGraphEdgeCollection edgesFromNodes:v19 toNodes:v20];

    if (![v17 count])
    {
      id v18 = PGGraphPersonPresentEdge;
      goto LABEL_7;
    }
LABEL_5:
    int v21 = [v17 anyEdge];
    goto LABEL_8;
  }
  uint64_t v15 = [v12 collection];
  id v16 = [v13 collection];
  uint64_t v17 = +[PGGraphEdgeCollection edgesFromNodes:v15 toNodes:v16];

  if ([v17 count]) {
    goto LABEL_5;
  }
  id v18 = PGGraphConsolidatedPersonPresentEdge;
LABEL_7:
  int v21 = (void *)[[v18 alloc] initFromPersonNode:v12 toMomentNode:v13 importance:a5 numberOfAssets:a6];
  [v14 addEdge:v21];
LABEL_8:

  [(MAGraph *)self->_graph executeGraphChangeRequest:v14];
  return v21;
}

- (id)insertPeopleWithClueCollection:(id)a3 fromMomentNode:(id)a4 addressNodes:(id)a5 isNearPeopleAddress:(BOOL *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v38 = 0;
  unsigned __int8 v39 = &v38;
  uint64_t v40 = 0x3032000000;
  long long v41 = __Block_byref_object_copy__71000;
  uint64_t v42 = __Block_byref_object_dispose__71001;
  id v43 = [(PGGraph *)self->_graph meNode];
  id v14 = [v10 mePerson];
  uint64_t v15 = (void *)v39[5];
  if (v15)
  {
    id v16 = [v15 localIdentifier];
    if ([v16 length])
    {
LABEL_6:

      goto LABEL_7;
    }
  }
  if (v14)
  {
    uint64_t v17 = [(PGGraphBuilder *)self insertMePersonNodeForPerson:v14];
    id v16 = (void *)v39[5];
    v39[5] = v17;
    goto LABEL_6;
  }
LABEL_7:
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__71000;
  v36[4] = __Block_byref_object_dispose__71001;
  id v37 = [(id)v39[5] localIdentifier];
  if (v14 && [v12 count])
  {
    id v18 = [(PGGraphBuilder *)self insertHomeWorkNodeForPerson:v14 personNode:v39[5] fromAddressNodes:v12];
    if (*((unsigned char *)v45 + 24)) {
      BOOL v19 = 0;
    }
    else {
      BOOL v19 = v18 == 0;
    }
    char v20 = !v19;
    *((unsigned char *)v45 + 24) = v20;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __105__PGGraphBuilder_People__insertPeopleWithClueCollection_fromMomentNode_addressNodes_isNearPeopleAddress___block_invoke;
  v28[3] = &unk_1E68F01A8;
  void v28[4] = self;
  id v21 = v14;
  id v29 = v21;
  uint64_t v33 = v36;
  long long v34 = &v38;
  id v22 = v11;
  id v30 = v22;
  id v23 = v12;
  id v31 = v23;
  uint64_t v35 = &v44;
  id v24 = v13;
  id v32 = v24;
  [v10 enumeratePeopleClues:v28];
  *a6 = *((unsigned char *)v45 + 24);
  long long v25 = v32;
  id v26 = v24;

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v26;
}

void __105__PGGraphBuilder_People__insertPeopleWithClueCollection_fromMomentNode_addressNodes_isNearPeopleAddress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 includeMergeCandidates];
  id v5 = [v3 person];
  uint64_t v6 = [v5 localIdentifier];
  BOOL v7 = (void *)v6;
  if (!v5 || !v6)
  {
    id v8 = [*(id *)(a1 + 32) loggingConnection];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v3 name];
      int v27 = 138478083;
      uint64_t v28 = v9;
      __int16 v29 = 2113;
      id v30 = v5;
      id v10 = "Skipping ingest of %{private}@ (%{private}@): personLocalIdentifier should not be nil";
      goto LABEL_8;
    }
LABEL_9:

    goto LABEL_30;
  }
  if ([v5 isHidden])
  {
    id v8 = [*(id *)(a1 + 32) loggingConnection];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v3 name];
      int v27 = 138478083;
      uint64_t v28 = v9;
      __int16 v29 = 2113;
      id v30 = v5;
      id v10 = "Skipping ingest of %{private}@ (%{private}@) because person is hidden";
LABEL_8:
      _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v27, 0x16u);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  uint64_t v11 = [v3 numberOfFaces];
  [v3 score];
  double v13 = v12;
  if (([v5 isMe] & 1) != 0 || objc_msgSend(v5, "isSamePersonAs:", *(void *)(a1 + 40)))
  {
    if (![*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) length] && objc_msgSend(v7, "length"))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v7);
      uint64_t v14 = [*(id *)(a1 + 32) updateMeNode:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) withPropertiesFromPerson:v5];
      uint64_t v15 = *(void *)(*(void *)(a1 + 80) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
    uint64_t v17 = [v5 CNIdentifier];
    id v18 = [*(id *)(a1 + 40) CNIdentifier];
    int v19 = [v17 isEqualToString:v18] ^ 1;

    id v20 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  }
  else
  {
    id v20 = [*(id *)(a1 + 32) insertPersonNodeForPerson:v5];
    int v19 = 1;
  }
  [*(id *)(a1 + 32) insertPresentEdgeFromPersonNode:v20 toMomentNode:*(void *)(a1 + 48) numberOfAssetsWithPerson:v11 importance:v4 includeMergeCandidates:v13];

  if (v19)
  {
    if ([*(id *)(a1 + 56) count])
    {
      id v21 = [v5 locationsByAddressTypes];
      uint64_t v22 = [v21 count];

      if (v22)
      {
        id v23 = [*(id *)(a1 + 32) insertHomeWorkNodeForPerson:v5 personNode:v20 fromAddressNodes:*(void *)(a1 + 56)];
        uint64_t v24 = *(void *)(*(void *)(a1 + 88) + 8);
        if (*(unsigned char *)(v24 + 24)) {
          BOOL v25 = 0;
        }
        else {
          BOOL v25 = v23 == 0;
        }
        char v26 = !v25;
        *(unsigned char *)(v24 + 24) = v26;
      }
    }
  }
  if (v20) {
    [*(id *)(a1 + 64) addObject:v20];
  }

LABEL_30:
}

- (id)updateMeNode:(id)a3 withPropertiesFromPerson:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = +[PGGraphPersonNode propertiesWithPerson:a4];
  id v8 = [v6 changingPropertiesWithProperties:v7];
  id v9 = v6;
  if ([v8 count])
  {
    id v10 = [(PGGraphBuilder *)self loggingConnection];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412547;
      id v14 = v6;
      __int16 v15 = 2113;
      id v16 = v8;
      _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "Updating Me node %@ with properties %{private}@", (uint8_t *)&v13, 0x16u);
    }

    uint64_t v11 = [v6 identifier];
    [(MAGraph *)self->_graph persistModelProperties:v8 forNodeWithIdentifier:v11 clobberExisting:0];
    id v9 = [(MAGraph *)self->_graph nodeForIdentifier:v11];
  }
  return v9;
}

- (id)insertHomeWorkNodeForPerson:(id)a3 personNode:(id)a4 fromAddressNodes:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  long long v36 = __Block_byref_object_copy__71000;
  id v37 = __Block_byref_object_dispose__71001;
  id v38 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = a5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v14 = (void *)MEMORY[0x1D25FED50]();
        [v13 coordinate];
        uint64_t v16 = v15;
        uint64_t v18 = v17;
        int v19 = [v8 locationsByAddressTypes];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __82__PGGraphBuilder_People__insertHomeWorkNodeForPerson_personNode_fromAddressNodes___block_invoke;
        v23[3] = &unk_1E68F0180;
        uint64_t v27 = v16;
        uint64_t v28 = v18;
        char v26 = &v33;
        v23[4] = self;
        id v24 = v9;
        BOOL v25 = v13;
        [v19 enumerateKeysAndObjectsUsingBlock:v23];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v10);
  }

  id v20 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v20;
}

void __82__PGGraphBuilder_People__insertHomeWorkNodeForPerson_personNode_fromAddressNodes___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "coordinate", (void)v28);
        if (+[PGLocationUtility coordinate:isCloseToCoordinate:threshold:](PGLocationUtility, "coordinate:isCloseToCoordinate:threshold:", *(double *)(a1 + 64), *(double *)(a1 + 72), v13, v14, 150.0))
        {
          uint64_t v15 = [v7 unsignedIntegerValue];
          uint64_t v16 = @"Work";
          if (!v15) {
            uint64_t v16 = @"Home";
          }
          uint64_t v17 = *(void **)(a1 + 40);
          uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 8);
          long long v32 = @"id";
          int v19 = NSNumber;
          id v20 = v16;
          id v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v17, "identifier"));
          uint64_t v33 = v21;
          uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          uint64_t v23 = [v18 addUniqueNodeWithLabel:v20 domain:202 properties:v22 didCreate:0];
          uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
          BOOL v25 = *(void **)(v24 + 40);
          *(void *)(v24 + 40) = v23;

          id v26 = (id)[*(id *)(*(void *)(a1 + 32) + 8) addUniqueEdgeWithLabel:@"IS_OWNED_BY" sourceNode:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) targetNode:*(void *)(a1 + 40) domain:202 properties:0];
          id v27 = (id)[*(id *)(*(void *)(a1 + 32) + 8) addUniqueEdgeWithLabel:@"IS_HOME_WORK" sourceNode:*(void *)(a1 + 48) targetNode:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) domain:202 properties:0];
          *a4 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)addStorytellingRelationshipsToMeNode:(id)a3 relationshipByPerson:(id)a4
{
  id v6 = a3;
  id v7 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __84__PGGraphBuilder_People__addStorytellingRelationshipsToMeNode_relationshipByPerson___block_invoke;
  v12[3] = &unk_1E68F0138;
  void v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  id v11 = v9;
  id v14 = v11;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];

  if ([v11 numberOfChanges]) {
    [(MAGraph *)self->_graph executeGraphChangeRequest:v11];
  }
}

void __84__PGGraphBuilder_People__addStorytellingRelationshipsToMeNode_relationshipByPerson___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[PGGraphBuilder expandedRelationshipLabelsForRelationship:](PGGraphBuilder, "expandedRelationshipLabelsForRelationship:", [v6 unsignedIntegerValue]);
  if ([v7 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v14 = [PGGraphStorytellingRelationshipEdge alloc];
          uint64_t v15 = -[PGGraphStorytellingRelationshipEdge initWithRelationship:fromMeNode:toPersonNode:](v14, "initWithRelationship:fromMeNode:toPersonNode:", v13, *(void *)(a1 + 40), v5, (void)v18);
          [*(id *)(a1 + 48) addEdge:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) loggingConnection];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v6 unsignedIntegerValue];
      uint64_t v17 = [v5 localIdentifier];
      *(_DWORD *)uint64_t buf = 134218242;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "No storytelling labels for relationship %lu for person %@", buf, 0x16u);
    }
  }
}

- (void)insertStorytellingRelationshipsWithRelationshipsForPersonNodes:(id)a3 meNode:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __96__PGGraphBuilder_People__insertStorytellingRelationshipsWithRelationshipsForPersonNodes_meNode___block_invoke;
  uint64_t v15 = &unk_1E68F0820;
  id v10 = v6;
  id v16 = v10;
  id v11 = v9;
  id v17 = v11;
  [v8 enumerateNodesUsingBlock:&v12];

  if (objc_msgSend(v11, "numberOfChanges", v12, v13, v14, v15)) {
    [(MAGraph *)self->_graph executeGraphChangeRequest:v11];
  }
}

void __96__PGGraphBuilder_People__insertStorytellingRelationshipsWithRelationshipsForPersonNodes_meNode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v14 = [v3 collection];
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__71000;
  long long v31 = __Block_byref_object_dispose__71001;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  uint64_t v4 = [v14 relationshipInEdges];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96__PGGraphBuilder_People__insertStorytellingRelationshipsWithRelationshipsForPersonNodes_meNode___block_invoke_265;
  v22[3] = &unk_1E68F00E8;
  id v23 = *(id *)(a1 + 32);
  uint64_t v24 = v26;
  __int16 v25 = &v27;
  [v4 enumerateEdgesUsingBlock:v22];

  uint64_t v13 = [v14 storytellingRelationshipEdges];
  id v5 = [v13 labels];
  id v6 = [MEMORY[0x1E4F1CA80] setWithSet:v5];
  id v7 = [MEMORY[0x1E4F1CA80] setWithSet:v28[5]];
  [v6 minusSet:v28[5]];
  [v7 minusSet:v5];
  if ([v6 count])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __96__PGGraphBuilder_People__insertStorytellingRelationshipsWithRelationshipsForPersonNodes_meNode___block_invoke_2;
    v19[3] = &unk_1E68F0110;
    id v20 = v6;
    id v21 = *(id *)(a1 + 40);
    [v13 enumerateEdgesUsingBlock:v19];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = [[PGGraphStorytellingRelationshipEdge alloc] initWithRelationship:*(void *)(*((void *)&v15 + 1) + 8 * v11) fromMeNode:*(void *)(a1 + 32) toPersonNode:v3];
        [*(id *)(a1 + 40) addEdge:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v33 count:16];
    }
    while (v9);
  }

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);
}

void __96__PGGraphBuilder_People__insertStorytellingRelationshipsWithRelationshipsForPersonNodes_meNode___block_invoke_265(uint64_t a1, void *a2)
{
  id v16 = a2;
  id v3 = [v16 sourceNode];
  uint64_t v4 = [v3 identifier];
  uint64_t v5 = [*(id *)(a1 + 32) identifier];

  if (v4 == v5)
  {
    [v16 confidence];
    if (v6 <= *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      [v16 confidence];
      if (v13 == *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        id v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        long long v15 = [v16 label];
        [v14 addObject:v15];
      }
    }
    else
    {
      id v7 = (void *)MEMORY[0x1E4F1CA80];
      id v8 = [v16 label];
      uint64_t v9 = [v7 setWithObject:v8];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      [v16 confidence];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12;
    }
  }
}

void __96__PGGraphBuilder_People__insertStorytellingRelationshipsWithRelationshipsForPersonNodes_meNode___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = v3;
  uint64_t v5 = [v3 label];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    [*(id *)(a1 + 40) removeEdge:v6];
  }
}

- (void)addRelationshipEdgesBetweenPersonNode:(id)a3 andPersonNode:(id)a4 forRelationship:(unint64_t)a5 confidence:(double)a6 properties:(id)a7
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (a7) {
    id v14 = a7;
  }
  else {
    id v14 = (id)MEMORY[0x1E4F1CC08];
  }
  long long v15 = (void *)[v14 mutableCopy];
  uint64_t v16 = 2;
  if (a6 > 0.0) {
    uint64_t v16 = 1;
  }
  if (a6 == 1.0) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v16;
  }
  long long v18 = [NSNumber numberWithUnsignedInteger:v17];
  [v15 setObject:v18 forKeyedSubscript:@"relstatus"];

  long long v19 = (void *)MEMORY[0x1E4F1CA80];
  id v20 = +[PGGraphBuilder expandedRelationshipLabelsForRelationship:a5];
  id v21 = [v19 setWithSet:v20];

  double v84 = v12;
  uint64_t v22 = [v12 collection];
  uint64_t v83 = v13;
  id v23 = [v13 collection];
  uint64_t v24 = +[PGGraphEdgeCollection edgesFromNodes:v22 toNodes:v23];
  __int16 v25 = [v24 labels];

  [v21 minusSet:v25];
  if ([v21 count])
  {
    long long v73 = self;
    id v26 = [v15 objectForKeyedSubscript:@"relstatus"];
    uint64_t v82 = [v26 unsignedIntegerValue];

    uint64_t v27 = [v15 objectForKeyedSubscript:@"relsource"];
    char v81 = [v27 unsignedIntegerValue];

    long long v28 = [v15 objectForKeyedSubscript:@"rfamhol"];
    [v28 doubleValue];
    double v30 = v29;

    long long v31 = [v15 objectForKeyedSubscript:@"rparnam"];
    unsigned int v80 = [v31 BOOLValue];

    id v32 = [v15 objectForKeyedSubscript:@"rfamnam"];
    unsigned int v79 = [v32 BOOLValue];

    uint64_t v33 = [v15 objectForKeyedSubscript:@"gwnummmtshome"];
    uint64_t v78 = [v33 unsignedIntegerValue];

    uint64_t v34 = [v15 objectForKeyedSubscript:@"rhasanniv"];
    char v77 = [v34 BOOLValue];

    uint64_t v35 = [v15 objectForKeyedSubscript:@"rtop2sg"];
    char v76 = [v35 BOOLValue];

    long long v36 = [v15 objectForKeyedSubscript:@"rlovexch"];
    uint64_t v75 = [v36 unsignedIntegerValue];

    id v37 = [v15 objectForKeyedSubscript:@"rtop"];
    char v74 = [v37 BOOLValue];

    id v38 = [v15 objectForKeyedSubscript:@"rfrndnghtout"];
    [v38 doubleValue];
    double v40 = v39;

    long long v41 = [v15 objectForKeyedSubscript:@"rprtnrtrip"];
    [v41 doubleValue];
    double v43 = v42;

    uint64_t v44 = [v15 objectForKeyedSubscript:@"rfrfamtrip"];
    [v44 doubleValue];
    double v46 = v45;

    char v47 = [v15 objectForKeyedSubscript:@"rwkend"];
    [v47 doubleValue];
    double v49 = v48;

    long long v50 = [v15 objectForKeyedSubscript:@"rwork"];
    [v50 doubleValue];
    double v52 = v51;

    double v53 = [v15 objectForKeyedSubscript:@"rcal"];
    [v53 doubleValue];
    double v55 = v54;

    uint64_t v56 = [v15 objectForKeyedSubscript:@"ragediff"];
    char v57 = [v56 BOOLValue];

    uint64_t v58 = [v15 objectForKeyedSubscript:@"rold"];
    char v59 = [v58 BOOLValue];

    id v72 = v15;
    uint64_t v60 = [v15 objectForKeyedSubscript:@"rchild"];
    char v61 = [v60 BOOLValue];

    id v62 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    double v71 = v21;
    id v63 = v21;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v85 objects:v89 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v65; ++i)
        {
          if (*(void *)v86 != v66) {
            objc_enumerationMutation(v63);
          }
          BYTE4(v70) = v81;
          BYTE3(v70) = v61;
          BYTE2(v70) = v59;
          BYTE1(v70) = v57;
          LOBYTE(v70) = v74;
          BYTE1(v69) = v76;
          LOBYTE(v69) = v77;
          uint64_t v68 = -[PGGraphRelationshipEdge initWithRelationship:fromPersonNode:toPersonNode:confidence:status:familyHolidayAttendanceRate:hasParentContactName:hasSameFamilyNameAsMePerson:numberOfMomentsAtHome:hasAnniversaryDate:isTopTwoPersonsSocialGroup:numberOfLoveEmojisExchanged:isTopPerson:friendNightOutAttendanceRate:partnerTripAttendanceRate:friendsAndFamilyTripAttendanceRate:weekendAppearanceRatio:momentsAtWorkAppearanceRate:calendarAttendanceRatio:isPersonAgeDifferentThanMeNode:isPersonOldEnoughToBeParentOrGrandparent:isPersonYoungEnoughToBeMeNodeChild:source:]([PGGraphRelationshipEdge alloc], "initWithRelationship:fromPersonNode:toPersonNode:confidence:status:familyHolidayAttendanceRate:hasParentContactName:hasSameFamilyNameAsMePerson:numberOfMomentsAtHome:hasAnniversaryDate:isTopTwoPersonsSocialGroup:numberOfLoveEmojisExchanged:isTopPerson:friendNightOutAttendanceRate:partnerTripAttendanceRate:friendsAndFamilyTripAttendanceRate:weekendAppearanceRatio:momentsAtWorkAppearanceRate:calendarAttendanceRatio:isPersonAgeDifferentThanMeNode:isPersonOldEnoughToBeParentOrGrandparent:isPersonYoungEnoughToBeMeNodeChild:source:", *(void *)(*((void *)&v85 + 1) + 8 * i), v84, v83, v82, v80, v79, a6, v30, v40, v43, v46, v49,
                  v52,
                  v55,
                  v78,
                  v69,
                  v75,
                  v70);
          [v62 addEdge:v68];
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v85 objects:v89 count:16];
      }
      while (v65);
    }

    [(MAGraph *)v73->_graph executeGraphChangeRequest:v62];
    id v21 = v71;
    long long v15 = v72;
  }
}

- (id)insertPersonNodeForPerson:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 isMe];
  uint64_t v6 = [(PGGraph *)self->_graph meNode];
  id v7 = (id)v6;
  if (v5 && v6)
  {
    id v8 = [(PGGraphBuilder *)self updateMeNode:v6 withPropertiesFromPerson:v4];

    id v7 = v8;
    uint64_t v9 = v7;
    goto LABEL_37;
  }
  uint64_t v10 = @"People";
  if (v5) {
    uint64_t v10 = @"Me";
  }
  uint64_t v11 = v10;
  id v12 = +[PGGraphPersonNode propertiesWithPerson:v4];
  id v13 = [v4 localIdentifier];
  id v14 = [(PGGraphPeopleDomainBuildingHelper *)self->_peopleDomainBuildingHelper insertedIdentifiedPersonForPersonLocalIdentifier:v13];
  long long v15 = v14;
  if (v14)
  {
    uint64_t v9 = [v14 personNode];
    double v51 = [v15 birthdayDate];
    long long v50 = [v15 anniversaryDate];
    uint64_t v46 = [v15 relationship];
    uint64_t v16 = [v9 changingPropertiesWithProperties:v12];
    char v47 = v16;
    if (v9 && ![v16 count]) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v9 = 0;
    long long v50 = 0;
    double v51 = 0;
    uint64_t v46 = 0;
    char v47 = 0;
  }
  uint64_t v17 = v9;
  uint64_t v9 = [(PGMutableGraph *)self->_graph addUniquelyIdentifiedNodeWithLabel:v11 domain:300 properties:v12 didCreate:0];

  if ([v13 length])
  {
    uint64_t v18 = [(PGGraphPeopleDomainBuildingHelper *)self->_peopleDomainBuildingHelper insertIdentifiedPersonWithPersonNode:v9 forPersonLocalIdentifier:v13];

    long long v15 = (void *)v18;
  }
LABEL_13:
  long long v19 = [v4 birthdayDate];
  double v48 = v13;
  double v49 = v19;
  if (v19)
  {
    if (v51)
    {
      if ((objc_msgSend(v19, "isEqualToDate:") & 1) == 0)
      {
        id v20 = [(PGGraphBuilder *)self loggingConnection];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v38 = [v4 localIdentifier];
          *(_DWORD *)uint64_t buf = 138478339;
          double v53 = v38;
          __int16 v54 = 2113;
          double v55 = v49;
          __int16 v56 = 2113;
          char v57 = v51;
          _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "Two different birthday dates for person %{private}@, %{private}@ and %{private}@", buf, 0x20u);
        }
      }
    }
    else
    {
      double v42 = v11;
      uint64_t v44 = v12;
      id v21 = [MEMORY[0x1E4F76C68] components:24 fromDate:v19];
      uint64_t v22 = [v21 month];
      uint64_t v23 = [v21 day];
      uint64_t v40 = v22;
      uint64_t v24 = +[PGGraphMonthDayNodeCollection monthDayNodesForMonth:v22 day:v23 inGraph:self->_graph];
      __int16 v25 = [v24 anyNode];

      if (!v25)
      {
        __int16 v25 = [(PGGraphBuilder *)self insertMonthDayNodeForMonth:v40 day:v23];
      }
      id v26 = [(PGMutableGraph *)self->_graph addUniqueEdgeWithLabel:@"BDAY_MONTH_DAY" sourceNode:v9 targetNode:v25 domain:400 properties:0];
      [v15 setBirthdayDate:v49];

      uint64_t v11 = v42;
      id v12 = v44;
    }
  }
  uint64_t v27 = [v4 anniversaryDate];
  long long v28 = v27;
  if (!v27) {
    goto LABEL_32;
  }
  if (!v50)
  {
    double v43 = v11;
    double v45 = v12;
    double v29 = [MEMORY[0x1E4F76C68] components:24 fromDate:v27];
    uint64_t v31 = [v29 month];
    uint64_t v39 = [v29 day];
    uint64_t v41 = v31;
    id v32 = +[PGGraphMonthDayNodeCollection monthDayNodesForMonth:day:inGraph:](PGGraphMonthDayNodeCollection, "monthDayNodesForMonth:day:inGraph:", v31);
    uint64_t v33 = [v32 anyNode];

    if (!v33)
    {
      uint64_t v33 = [(PGGraphBuilder *)self insertMonthDayNodeForMonth:v41 day:v39];
    }
    id v34 = [(PGMutableGraph *)self->_graph addUniqueEdgeWithLabel:@"ANNIVERSARY_MONTH_DAY" sourceNode:v9 targetNode:v33 domain:400 properties:0];
    [v15 setAnniversaryDate:v28];

    uint64_t v11 = v43;
    goto LABEL_30;
  }
  if (objc_msgSend(v27, "isEqualToDate:")) {
    goto LABEL_32;
  }
  double v29 = [(PGGraphBuilder *)self loggingConnection];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    [v4 localIdentifier];
    double v30 = v45 = v12;
    *(_DWORD *)uint64_t buf = 138478339;
    double v53 = v30;
    __int16 v54 = 2113;
    double v55 = v28;
    __int16 v56 = 2113;
    char v57 = v50;
    _os_log_error_impl(&dword_1D1805000, v29, OS_LOG_TYPE_ERROR, "Two different anniversary dates for person %{private}@, %{private}@ and %{private}@", buf, 0x20u);

LABEL_30:
    id v12 = v45;
  }

LABEL_32:
  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      uint64_t v35 = [v4 relationship];
      if (v35 != v46)
      {
        uint64_t v36 = v35;
        [(PGGraphBuilder *)self addRelationshipEdgesBetweenPersonNode:v7 andPersonNode:v9 forRelationship:v35 confidence:0 properties:1.0];
        [v15 setRelationship:v36];
      }
    }
  }

LABEL_37:
  return v9;
}

+ (id)reducedRelationshipLabelForRelationshipLabels:(id)a3
{
  v10[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 count] > 1)
  {
    int v5 = (void *)MEMORY[0x1E4F1CA80];
    v10[0] = @"SISTER";
    v10[1] = @"BROTHER";
    void v10[2] = @"MOTHER";
    v10[3] = @"FATHER";
    void v10[4] = @"DAUGHTER";
    v10[5] = @"SON";
    v10[6] = @"PARTNER";
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:7];
    id v7 = [v5 setWithArray:v6];

    [v7 intersectSet:v3];
    if ([v7 count])
    {
      id v4 = [v7 anyObject];
    }
    else
    {
      if ([v3 containsObject:@"PARENT"])
      {
        id v4 = @"PARENT";
      }
      else if ([v3 containsObject:@"CHILD"])
      {
        id v4 = @"CHILD";
      }
      else
      {
        id v4 = @"FAMILY";
      }
      id v8 = v4;
    }
  }
  else
  {
    id v4 = [v3 anyObject];
  }

  return v4;
}

+ (id)expandedRelationshipLabelsForRelationship:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  int v5 = v4;
  uint64_t v6 = kPGGraphEdgePeopleFamily;
  switch(a3)
  {
    case 1uLL:
      uint64_t v6 = kPGGraphEdgePeopleCoworker;
      goto LABEL_15;
    case 2uLL:
    case 3uLL:
      uint64_t v6 = kPGGraphEdgePeopleFriend;
      goto LABEL_15;
    case 4uLL:
      goto LABEL_15;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      id v7 = @"DAUGHTER";
      goto LABEL_6;
    case 7uLL:
      id v7 = @"SON";
LABEL_6:
      [v4 addObject:v7];
LABEL_7:
      id v8 = @"CHILD";
      goto LABEL_14;
    case 8uLL:
      goto LABEL_11;
    case 9uLL:
      uint64_t v9 = @"MOTHER";
      goto LABEL_10;
    case 0xAuLL:
      uint64_t v9 = @"FATHER";
LABEL_10:
      [v4 addObject:v9];
LABEL_11:
      id v8 = @"PARENT";
      goto LABEL_14;
    case 0xBuLL:
      id v8 = @"BROTHER";
      goto LABEL_14;
    case 0xCuLL:
      id v8 = @"SISTER";
LABEL_14:
      [v5 addObject:v8];
      uint64_t v6 = kPGGraphEdgePeopleFamily;
      goto LABEL_15;
    case 0xDuLL:
      uint64_t v6 = kPGGraphEdgePeoplePartner;
      goto LABEL_15;
    case 0x11uLL:
      uint64_t v6 = kPGGraphEdgePeopleHouseholdMember;
LABEL_15:
      [v5 addObject:*v6];
      break;
    default:
      break;
  }
  return v5;
}

- (id)insertPartOfDayNodeWithPartOfDayName:(id)a3 fromMomentNode:(id)a4 ratio:(double)a5
{
  id v8 = a4;
  unint64_t v9 = +[PGGraphPartOfDayNode partOfDayForPartOfDayName:a3];
  if (v9 == 1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    unint64_t v11 = v9;
    id v12 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    id v13 = +[PGGraphPartOfDayNodeCollection partOfDayNodeForPartOfDay:v11 inGraph:self->_graph];
    if ([v13 count])
    {
      uint64_t v10 = [v13 anyNode];
      id v14 = [v8 collection];
      long long v15 = +[PGGraphEdgeCollection edgesFromNodes:v14 toNodes:v13];
    }
    else
    {
      uint64_t v10 = [[PGGraphPartOfDayNode alloc] initWithPartOfDay:v11];
      [v12 addNode:v10];
      long long v15 = 0;
    }
    if (![v15 count])
    {
      id v16 = [[PGGraphPartOfDayEdge alloc] initFromMomentNode:v8 toPartOfDayNode:v10 ratio:a5];
      [v12 addEdge:v16];
    }
    [(MAGraph *)self->_graph executeGraphChangeRequest:v12];
  }
  return v10;
}

- (id)insertPartOfDayNodesWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a3;
  unint64_t v9 = [v7 array];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __78__PGGraphBuilder_Time__insertPartOfDayNodesWithClueCollection_fromMomentNode___block_invoke;
  v15[3] = &unk_1E68F0600;
  v15[4] = self;
  id v16 = v6;
  id v10 = v9;
  id v17 = v10;
  id v11 = v6;
  [v8 enumerateTimeOfDayClues:v15];

  id v12 = v17;
  id v13 = v10;

  return v13;
}

void __78__PGGraphBuilder_Time__insertPartOfDayNodesWithClueCollection_fromMomentNode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 value];
  [v3 confidence];
  double v5 = v4;

  id v6 = [*(id *)(a1 + 32) insertPartOfDayNodeWithPartOfDayName:v7 fromMomentNode:*(void *)(a1 + 40) ratio:v5];
  if (v6) {
    [*(id *)(a1 + 48) addObject:v6];
  }
}

- (id)insertDateNodesFromEventNode:(id)a3
{
  id v4 = a3;
  double v5 = [v4 localStartDate];
  id v6 = [v4 localEndDate];
  id v7 = [(PGGraphBuilder *)self insertDateNodesFromLocalStartDate:v5 toLocalEndDate:v6 fromEventNode:v4];

  return v7;
}

- (id)insertDateNodesFromLocalStartDate:(id)a3 toLocalEndDate:(id)a4 fromEventNode:(id)a5
{
  id v8 = a5;
  unint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 array];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __87__PGGraphBuilder_Time__insertDateNodesFromLocalStartDate_toLocalEndDate_fromEventNode___block_invoke;
  v18[3] = &unk_1E68F05D8;
  v18[4] = self;
  id v19 = v8;
  id v13 = v12;
  id v20 = v13;
  id v14 = v8;
  [(PGGraphBuilder *)self enumerateDateComponentsBetweenLocalStartDate:v11 andLocalEndDate:v10 usingBlock:v18];

  long long v15 = v20;
  id v16 = v13;

  return v16;
}

void __87__PGGraphBuilder_Time__insertDateNodesFromLocalStartDate_toLocalEndDate_fromEventNode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) insertTimeNodesWithDateComponents:a2 fromEventNode:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addObject:v3];
}

- (id)insertDateNodesWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 localStartDate];
  unint64_t v9 = [v7 localEndDate];

  id v10 = [(PGGraphBuilder *)self insertDateNodesFromLocalStartDate:v8 toLocalEndDate:v9 fromEventNode:v6];

  return v10;
}

- (id)insertOverTheYearsNode
{
  return [(PGMutableGraph *)self->_graph addUniqueNodeWithLabel:@"OverTheYears" domain:402 properties:0 didCreate:0];
}

- (id)insertMonthDayNodeForMonth:(int64_t)a3 day:(int64_t)a4
{
  double v5 = [[PGGraphCalendarUnitNode alloc] initWithCalendarUnit:3 value:+[PGGraphCalendarUnitNode encodedMonthDayForMonth:a3 day:a4]];
  [(MAGraph *)self->_graph addUniqueNode:v5 didInsert:0];
  return v5;
}

- (void)enumerateDateComponentsBetweenLocalStartDate:(id)a3 andLocalEndDate:(id)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = (void (**)(id, void *, unsigned char *))a5;
  id v10 = [MEMORY[0x1E4F76C68] componentsFromDate:v7 inTimeZone:0];
  id v11 = [MEMORY[0x1E4F76C68] componentsFromDate:v8 inTimeZone:0];
  [v10 setTimeZone:0];
  [v11 setTimeZone:0];
  char v18 = 0;
  v9[2](v9, v10, &v18);
  id v12 = v7;
  if ((NSDateComponentsEqualToDateComponents() & 1) != 0 || v18)
  {
    id v13 = v12;
  }
  else
  {
    id v13 = v12;
    do
    {
      id v14 = v10;
      long long v15 = v13;
      id v13 = [MEMORY[0x1E4F76C68] dateByAddingDays:1 toDate:v13];

      id v10 = [MEMORY[0x1E4F76C68] componentsFromDate:v13 inTimeZone:0];

      [v10 setTimeZone:0];
      int v16 = NSDateComponentsEqualToDateComponents();
      if (v16 && [v11 hour] < 5) {
        break;
      }
      v9[2](v9, v10, &v18);
      int v17 = v18 ? 1 : v16;
    }
    while (v17 != 1);
  }
}

- (id)insertTimeNodesWithDateComponents:(id)a3 fromEventNode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PGGraphBuilder *)self insertDateNodeHierarchyWithDateComponents:v7];
  id v9 = [(PGMutableGraph *)self->_graph addUniqueEdgeWithLabel:@"DATE" sourceNode:v6 targetNode:v8 domain:400 properties:0];
  id v10 = (void *)MEMORY[0x1E4F76C68];
  id v11 = [v7 timeZone];
  id v12 = [v10 dateFromComponents:v7 inTimeZone:v11];

  if ([MEMORY[0x1E4F76C80] isWeekendDate:v12]) {
    id v13 = @"Weekend";
  }
  else {
    id v13 = @"Weekday";
  }
  id v14 = [(PGMutableGraph *)self->_graph addUniqueNodeWithLabel:v13 domain:400 properties:0 didCreate:0];
  id v15 = [(PGMutableGraph *)self->_graph addUniqueEdgeWithLabel:@"PARTOFWEEK" sourceNode:v6 targetNode:v14 domain:400 properties:0];

  return v8;
}

- (id)insertDateNodeHierarchyWithDateComponents:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1E4F76C68];
  id v6 = [v4 timeZone];
  id v7 = [v5 dateFromComponents:v4 inTimeZone:v6];

  id v8 = [(PGGraph *)self->_graph dateNodeNameWithLocalDate:v7];
  char v34 = 0;
  id v9 = [[PGGraphDateNode alloc] initWithName:v8];
  [(MAGraph *)self->_graph addUniqueNode:v9 didInsert:&v34];
  if (v34)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    uint64_t v11 = [v4 day];
    uint64_t v12 = [v4 month];
    uint64_t v13 = [v4 year];
    int64_t v14 = +[PGGraphCalendarUnitNode encodedMonthDayForMonth:v12 day:v11];
    uint64_t v31 = [(PGGraphTimeDomainBuildingHelper *)self->_timeDomainBuildingHelper calendarUnitNodeForCalendarUnit:1 value:v11];
    uint64_t v33 = [(PGGraphTimeDomainBuildingHelper *)self->_timeDomainBuildingHelper calendarUnitNodeForCalendarUnit:2 value:v12];
    id v32 = [(PGGraphTimeDomainBuildingHelper *)self->_timeDomainBuildingHelper calendarUnitNodeForCalendarUnit:3 value:v14];
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v30 = [(PGGraphTimeDomainBuildingHelper *)self->_timeDomainBuildingHelper calendarUnitNodeForCalendarUnit:4 value:v13];
      id v15 = -[PGGraphTimeDomainBuildingHelper calendarUnitNodeForCalendarUnit:value:](self->_timeDomainBuildingHelper, "calendarUnitNodeForCalendarUnit:value:", 6, [v4 weekOfYear]);
      int v16 = -[PGGraphTimeDomainBuildingHelper calendarUnitNodeForCalendarUnit:value:](self->_timeDomainBuildingHelper, "calendarUnitNodeForCalendarUnit:value:", 5, [v4 weekOfMonth]);
      int v17 = [[PGGraphCalendarUnitEdge alloc] initWithCalendarUnit:4 fromDateNode:v9 toCalendarUnitNode:v30];
      [v10 addEdge:v17];

      char v18 = [[PGGraphCalendarUnitEdge alloc] initWithCalendarUnit:6 fromDateNode:v9 toCalendarUnitNode:v15];
      [v10 addEdge:v18];

      id v19 = [[PGGraphCalendarUnitEdge alloc] initWithCalendarUnit:5 fromDateNode:v9 toCalendarUnitNode:v16];
      [v10 addEdge:v19];

      [(PGGraphTimeDomainBuildingHelper *)self->_timeDomainBuildingHelper calendarUnitNodeForCalendarUnit:4 value:v13 + 1];
    }
    id v20 = [[PGGraphCalendarUnitEdge alloc] initWithCalendarUnit:1 fromDateNode:v9 toCalendarUnitNode:v31];
    [v10 addEdge:v20];

    id v21 = [[PGGraphCalendarUnitEdge alloc] initWithCalendarUnit:2 fromDateNode:v9 toCalendarUnitNode:v33];
    [v10 addEdge:v21];

    uint64_t v22 = [[PGGraphCalendarUnitEdge alloc] initWithCalendarUnit:3 fromDateNode:v9 toCalendarUnitNode:v32];
    [v10 addEdge:v22];

    uint64_t v23 = [MEMORY[0x1E4F76C68] seasonNameForDateComponents:v4 locale:0];
    if (v23)
    {
      uint64_t v24 = [(PGGraphTimeDomainBuildingHelper *)self->_timeDomainBuildingHelper seasonNodeForSeasonName:v23];
      id v25 = [[PGGraphSeasonEdge alloc] initFromDateNode:v9 toSeasonNode:v24];
      [v10 addEdge:v25];
    }
    uint64_t v26 = [MEMORY[0x1E4F76C68] dayOfWeekFromDate:v7];
    if (v26 != -1)
    {
      uint64_t v27 = [(PGGraphTimeDomainBuildingHelper *)self->_timeDomainBuildingHelper dayOfWeekNodeForDayOfWeek:v26];
      id v28 = [[PGGraphDayOfWeekEdge alloc] initFromDateNode:v9 toDayOfWeekNode:v27];
      [v10 addEdge:v28];
    }
    [(MAGraph *)self->_graph executeGraphChangeRequest:v10];
  }
  return v9;
}

- (void)insertShareParticipantsAsAuthors:(id)a3 forMomentNode:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          int64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v15 = [(PGGraphPeopleDomainBuildingHelper *)self->_peopleDomainBuildingHelper cachedAuthorNodeForShareParticipant:v14];
          if (v15)
          {
            int v16 = [[PGGraphAuthorEdge alloc] initFromPersonNode:v15 toMomentNode:v7];
            [v8 addEdge:v16];
          }
          else
          {
            int v16 = [(PGGraphBuilder *)self loggingConnection];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              int v17 = [v14 localIdentifier];
              *(_DWORD *)uint64_t buf = 138412290;
              uint64_t v26 = v17;
              _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "No person node for share participant identifier: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    [(MAGraph *)self->_graph executeGraphChangeRequest:v8];
    id v6 = v19;
  }
  else
  {
    id v8 = [(PGGraphBuilder *)self loggingConnection];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v18 = [v7 localIdentifier];
      *(_DWORD *)uint64_t buf = 138412290;
      uint64_t v26 = v18;
      _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "No share participants for moment with identifier: %@", buf, 0xCu);
    }
  }
}

- (void)insertMeAsAuthor:(id)a3 forMomentNode:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v7 = a4;
  id v8 = a3;
  id v10 = objc_alloc_init(v6);
  id v9 = [[PGGraphAuthorEdge alloc] initFromPersonNode:v8 toMomentNode:v7];

  [v10 addEdge:v9];
  [(MAGraph *)self->_graph executeGraphChangeRequest:v10];
}

@end