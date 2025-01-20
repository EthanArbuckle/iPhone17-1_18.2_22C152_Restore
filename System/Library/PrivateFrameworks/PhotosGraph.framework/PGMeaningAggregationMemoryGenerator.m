@interface PGMeaningAggregationMemoryGenerator
+ (id)allMeaningAggregationMemoryGeneratorClasses;
+ (id)featureRelationWithMeaningLabel:(id)a3;
+ (id)mostSpecificLabelForMeaning:(unint64_t)a3;
+ (id)requiredFeatureRelation;
+ (id)supportedMeaningLabels;
+ (unint64_t)_extendedMeaningForActivityEvent:(id)a3;
+ (unint64_t)_extendedMeaningForActivityMeaningLabel:(id)a3;
+ (unint64_t)_extendedMeaningForMeaning:(unint64_t)a3 meaningfulEvent:(id)a4;
+ (unint64_t)_extendedMeaningForRestaurantEvent:(id)a3;
+ (unint64_t)_extendedMeaningForRestaurantMeaningLabel:(id)a3;
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (PGFeaturedTimePeriodMemoryConfiguration)featuredYearConfiguration;
- (PGMeaningAggregationMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (PGMemoryMomentRequirements)momentRequirements;
- (PGOverTheYearsMemoryConfiguration)overTheYearsConfiguration;
- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5;
- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (unint64_t)durationForCuration;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setFeaturedYearConfiguration:(id)a3;
- (void)setMomentRequirements:(id)a3;
- (void)setOverTheYearsConfiguration:(id)a3;
- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3;
- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGMeaningAggregationMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

- (void)setFeaturedYearConfiguration:(id)a3
{
}

- (PGFeaturedTimePeriodMemoryConfiguration)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (void)setOverTheYearsConfiguration:(id)a3
{
}

- (PGOverTheYearsMemoryConfiguration)overTheYearsConfiguration
{
  return self->_overTheYearsConfiguration;
}

- (void)setMomentRequirements:(id)a3
{
}

- (PGMemoryMomentRequirements)momentRequirements
{
  return self->_momentRequirements;
}

- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3
{
  self->_requireFaceProcessingMeetsThresholdOverTime = a3;
}

- (BOOL)requireFaceProcessingMeetsThresholdOverTime
{
  return self->_requireFaceProcessingMeetsThresholdOverTime;
}

- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3
{
  self->_requireSceneProcessingMeetsThresholdOverTime = a3;
}

- (BOOL)requireSceneProcessingMeetsThresholdOverTime
{
  return self->_requireSceneProcessingMeetsThresholdOverTime;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v10 = a3;
  id v11 = a7;
  v12 = [v10 memoryFeatureNodes];
  v13 = +[PGGraphNodeCollection subsetInCollection:v12];
  v14 = [v13 meaningLabels];
  v15 = [v14 anyObject];

  uint64_t v16 = +[PGGraph meaningForMeaningLabel:v15];
  uint64_t v17 = v16;
  if (v16 > 12)
  {
    if (v16 == 13)
    {
      v26 = [PGCelebrationOverTimeMemoryTitleGenerator alloc];
      v20 = [v10 memoryMomentNodes];
      v22 = [v20 set];
      v23 = [(PGCelebrationOverTimeMemoryTitleGenerator *)v26 initWithMomentNodes:v22 titleGenerationContext:v11];
LABEL_19:

      goto LABEL_20;
    }
    if (v16 == 15)
    {
      unint64_t v19 = +[PGMeaningAggregationMemoryGenerator _extendedMeaningForRestaurantMeaningLabel:v15];
      if (v19) {
        uint64_t v17 = v19;
      }
      else {
        uint64_t v17 = 15;
      }
    }
LABEL_12:
    v20 = [v12 allFeatures];
    v21 = [v10 memoryMomentNodes];
    v22 = [v21 set];

    v23 = [[PGMeaningfulEventAggregationMemoryTitleGenerator alloc] initWithMeaning:v17 features:v20 meaningfulEvents:v22 titleGenerationContext:v11];
    [(PGMeaningfulEventAggregationMemoryTitleGenerator *)v23 setUnreliableMeaningRatioThresholdForSpecificTitle:0.8];
    v24 = +[PGGraphNodeCollection subsetInCollection:v12];
    if ([v24 count] == 1) {
      [(PGTitleGenerator *)v23 setFeaturedYearNodes:v24];
    }

    goto LABEL_19;
  }
  if (v16)
  {
    if (v16 == 1)
    {
      unint64_t v18 = +[PGMeaningAggregationMemoryGenerator _extendedMeaningForActivityMeaningLabel:v15];
      if (v18 <= 1) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = v18;
      }
    }
    goto LABEL_12;
  }
  v25 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v28 = 0;
    _os_log_error_impl(&dword_1D1805000, v25, OS_LOG_TYPE_ERROR, "[PGMeaningAggregationMemoryGenerator] memory should have a meaning", v28, 2u);
  }

  v23 = 0;
LABEL_20:

  return v23;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v7 = a5;
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v82 = a6;
  if ([v82 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v93 = 202;
      *(_WORD *)&v93[4] = 2080;
      *(void *)&v93[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/Memory Generators/CurrentMemoryGenerators/MeaningMemoryGenerators/PGMeaningAggr"
                           "egationMemoryGenerator.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v12 = 0;
    goto LABEL_45;
  }
  id v79 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v13 = [v10 memoryFeatureNodes];
  v14 = +[PGGraphNodeCollection subsetInCollection:v13];
  v15 = [v14 labels];
  uint64_t v16 = [v15 anyObject];

  v74 = +[PGGraphNodeCollection subsetInCollection:v13];
  v85 = [v74 locations];
  v80 = +[PGGraphNodeCollection subsetInCollection:v13];
  v81 = +[PGGraphNodeCollection subsetInCollection:v13];
  uint64_t v17 = [(PGMemoryGenerator *)self memoryCurationSession];
  unint64_t v18 = [v17 curationManager];
  unint64_t v19 = [v18 curationCriteriaFactory];
  v76 = (void *)v16;
  v77 = [v19 curationCriteriaWithMeaningLabel:v16 featureNodes:v13 inGraph:v11 client:1];

  v20 = [v10 memoryMomentNodes];
  v21 = [(PGMemoryGenerator *)self memoryCurationSession];
  v22 = [v21 curationManager];
  v23 = [v22 defaultAssetFetchOptionsForMemories];

  v84 = v23;
  [v23 setIncludeGuestAssets:v7];
  v24 = [(PGMemoryGenerator *)self memoryCurationSession];
  v25 = [v24 photoLibrary];
  v26 = [v25 librarySpecificFetchOptions];

  v27 = (void *)MEMORY[0x1E4F38EE8];
  v28 = [v20 localIdentifiers];
  v29 = [v28 allObjects];
  [v27 fetchAssetCollectionsWithLocalIdentifiers:v29 options:v26];
  v31 = id v30 = v11;

  unint64_t v32 = [v31 count];
  v78 = v20;
  if (v32 < [v20 count])
  {
    v33 = v30;
    log = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, log, OS_LOG_TYPE_ERROR, "[PGMeaningAggregationMemoryGenerator] Failed to fetch all momentNodes, graph is out-of-sync with the photo library.", buf, 2u);
    }
    id v12 = 0;
    v34 = v74;
    goto LABEL_44;
  }
  v86 = self;
  v70 = v26;
  v71 = v13;
  id v72 = v10;
  id v73 = v30;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v69 = v31;
  v35 = v31;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v88 objects:v98 count:16];
  v37 = v76;
  v38 = v85;
  if (!v36) {
    goto LABEL_35;
  }
  uint64_t v39 = v36;
  uint64_t v83 = *(void *)v89;
  log = v35;
  while (2)
  {
    for (uint64_t i = 0; i != v39; ++i)
    {
      if (*(void *)v89 != v83) {
        objc_enumerationMutation(v35);
      }
      v41 = *(void **)(*((void *)&v88 + 1) + 8 * i);
      context = (void *)MEMORY[0x1D25FED50]();
      v42 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v41 options:v84];
      v43 = (void *)MEMORY[0x1E4F38EB8];
      v44 = [(PGMemoryGenerator *)v86 memoryCurationSession];
      v45 = [v44 curationContext];
      v46 = [v43 clsAllAssetsFromFetchResult:v42 prefetchOptions:23 curationContext:v45];

      id v47 = v46;
      if ([v38 count])
      {
        uint64_t v48 = +[PGCurationManager filterAssets:v47 withLocations:v38 maximumDistance:100.0];
      }
      else if ([v81 count])
      {
        uint64_t v48 = +[PGCurationManager filterAssets:v47 inMomentNodes:v78 forAreaNodes:v81 withMaximumDistance:500.0];
      }
      else
      {
        v49 = v47;
        if (![v80 count]) {
          goto LABEL_21;
        }
        uint64_t v48 = +[PGCurationManager filterAssets:v47 inMomentNodes:v78 forCityNodes:v80 withMaximumDistance:5000.0];
      }
      v49 = (void *)v48;

LABEL_21:
      if (objc_msgSend(v49, "count", v69))
      {
        if (([v37 isEqualToString:@"HolidayEvent"] & 1) == 0)
        {
          uint64_t v50 = [v77 passingAssetsInAssets:v49];

          v49 = (void *)v50;
        }
        uint64_t v51 = [v49 count];
        if (v51 != [v47 count])
        {
          v52 = +[PGMemoryGenerationHelper assetLocalIdentifiersFromAssets:v49];
          uint64_t v53 = +[PGCurationManager filteredAssetsFromAssets:v47 withContextualAssetLocalIdentifiers:v52 approximateTimeDistance:300.0];

          v49 = (void *)v53;
        }
        v38 = v85;
        if ((unint64_t)[v49 count] >= 3) {
          [v79 addObjectsFromArray:v47];
        }
        if ([v82 isCancelledWithProgress:0.5])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v93 = 263;
            *(_WORD *)&v93[4] = 2080;
            *(void *)&v93[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Memories/Memory Generators/CurrentMemoryGenerators/MeaningMemoryGenerators/P"
                                 "GMeaningAggregationMemoryGenerator.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          id v12 = 0;
          id v10 = v72;
          v33 = v73;
          v26 = v70;
          v13 = v71;
          v34 = v74;
          v31 = v69;
          goto LABEL_44;
        }
      }
      else
      {
        v54 = [(PGMemoryGenerator *)v86 loggingConnection];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          v55 = [v41 uuid];
          v56 = [v81 anyNode];
          v57 = [v80 anyNode];
          *(_DWORD *)buf = 138413059;
          *(void *)v93 = v55;
          *(_WORD *)&v93[8] = 2113;
          *(void *)&v93[10] = v85;
          __int16 v94 = 2113;
          v95 = v56;
          __int16 v96 = 2113;
          v97 = v57;
          _os_log_impl(&dword_1D1805000, v54, OS_LOG_TYPE_INFO, "[PGMeaningAggregationMemoryGenerator] No relevant assets found for moment (%@) at locations: %{private}@, aoi: %{private}@, city: %{private}@", buf, 0x2Au);

          v35 = log;
          v37 = v76;

          v38 = v85;
        }
      }
    }
    uint64_t v39 = [v35 countByEnumeratingWithState:&v88 objects:v98 count:16];
    if (v39) {
      continue;
    }
    break;
  }
LABEL_35:

  id v58 = objc_alloc(MEMORY[0x1E4F39150]);
  v59 = [v79 allObjects];
  v60 = [v84 photoLibrary];
  v61 = (void *)MEMORY[0x1E4F1CAD0];
  v62 = [v84 fetchPropertySets];
  v63 = [v61 setWithArray:v62];
  uint64_t v64 = [v58 initWithObjects:v59 photoLibrary:v60 fetchType:0 fetchPropertySets:v63 identifier:0 registerIfNeeded:0];

  v65 = [(PGMemoryGenerator *)v86 memoryCurationSession];
  v66 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v64 memoryCurationSession:v65 graph:v73];

  log = v64;
  v33 = v73;
  if ([v82 isCancelledWithProgress:1.0])
  {
    v26 = v70;
    v13 = v71;
    v34 = v74;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v93 = 269;
      *(_WORD *)&v93[4] = 2080;
      *(void *)&v93[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/Memory Generators/CurrentMemoryGenerators/MeaningMemoryGenerators/PGMeaningAggr"
                           "egationMemoryGenerator.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v12 = 0;
    id v10 = v72;
  }
  else
  {
    id v12 = v66;
    v13 = v71;
    id v10 = v72;
    v34 = v74;
    v26 = v70;
  }
  v31 = v69;

LABEL_44:
  id v11 = v33;
LABEL_45:

  return v12;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 memoryFeatureNodes];
  v9 = +[PGGraphNodeCollection subsetInCollection:v8];
  id v10 = [v9 meaningLabels];
  id v11 = [v10 anyObject];

  id v12 = [(PGMemoryGenerator *)self memoryCurationSession];
  v13 = [v12 curationManager];
  v14 = [v13 curationCriteriaFactory];
  v15 = [v14 curationCriteriaWithMeaningLabel:v11 featureNodes:v8 inGraph:v6 client:1];

  v18.receiver = self;
  v18.super_class = (Class)PGMeaningAggregationMemoryGenerator;
  uint64_t v16 = [(PGMemoryGenerator *)&v18 keyAssetCurationOptionsWithTriggeredMemory:v7 inGraph:v6];

  [v16 setCurationCriteria:v15];
  return v16;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PGMeaningAggregationMemoryGenerator;
  v5 = [(PGMemoryGenerator *)&v7 curationOptionsWithRequiredAssetUUIDs:a3 eligibleAssetUUIDs:a4 triggeredMemory:a5];
  [v5 setMinimumNumberOfItems:15];
  [v5 setFailIfMinimumDurationNotReached:1];
  return v5;
}

- (unint64_t)durationForCuration
{
  return 23;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() supportedMeaningLabels];
  v9 = +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:v8 inGraph:v7];

  v26[0] = @"Lunch";
  v26[1] = @"Dinner";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  id v11 = +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:v10 inGraph:v7];
  id v12 = +[PGGraphBusinessNodeCollection restaurantBusinessNodesInGraph:v7];

  v13 = +[PGGraphBusinessNode momentOfBusiness];
  v14 = +[MANodeCollection nodesRelatedToNodes:v12 withRelation:v13];

  v15 = (void *)MEMORY[0x1E4F71E88];
  uint64_t v16 = +[PGGraphMeaningNode momentOfReliableMeaning];
  uint64_t v17 = [v15 adjacencyWithSources:v9 relation:v16 targetsClass:objc_opt_class()];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __93__PGMeaningAggregationMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v21[3] = &unk_1E68E5B38;
  id v22 = v11;
  id v23 = v14;
  v24 = self;
  id v25 = v6;
  id v18 = v6;
  id v19 = v14;
  id v20 = v11;
  [v17 enumerateTargetsBySourceWithBlock:v21];
}

void __93__PGMeaningAggregationMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (![v7 intersectsCollection:*(void *)(a1 + 32)]
    || ([v8 collectionByIntersecting:*(void *)(a1 + 40)],
        v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        id v8 = v9,
        [v9 count]))
  {
    id v10 = [(id)objc_opt_class() requiredFeatureRelation];
    if (v10)
    {
      id v11 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v8 relation:v10 targetsClass:objc_opt_class()];
      id v12 = [v11 transposed];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __93__PGMeaningAggregationMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2;
      v14[3] = &unk_1E68E5B10;
      id v15 = v7;
      id v16 = *(id *)(a1 + 56);
      uint64_t v17 = a4;
      [v12 enumerateTargetsBySourceWithBlock:v14];
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 56);
      id v11 = [v7 featureNodeCollection];
      (*(void (**)(uint64_t, id, void *, uint64_t))(v13 + 16))(v13, v8, v11, a4);
    }
  }
}

void __93__PGMeaningAggregationMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = a3;
  id v9 = [a2 collectionByFormingUnionWith:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  *a4 = **(unsigned char **)(a1 + 48);
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 11002;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 11003;
  }
  v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (unint64_t)memoryCategory
{
  return 17;
}

- (PGMeaningAggregationMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PGMeaningAggregationMemoryGenerator;
  int v3 = [(PGMemoryGenerator *)&v12 initWithMemoryGenerationContext:a3];
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 0;
    v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterMomentsWithNotEnoughScenesProcessed:1];
    uint64_t v7 = +[PGOverTheYearsMemoryConfiguration defaultOverTheYearsMemoryConfiguration];
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v7;

    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setMinimumNumberOfAssetsInExtendedCuration:13];
    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setAboveMomentAverageContentScoreThreshold:0.5];
    uint64_t v9 = +[PGFeaturedTimePeriodMemoryConfiguration defaultFeaturedYearMemoryConfiguration];
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumMomentSpreadicityTimeInterval:604800.0];
    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumNumberOfAssetsInExtendedCuration:13];
    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setAboveMomentAverageContentScoreThreshold:0.5];
  }
  return v4;
}

+ (id)mostSpecificLabelForMeaning:(unint64_t)a3
{
  v4 = @"Unknown";
  if ((uint64_t)a3 > 1000)
  {
    switch(a3)
    {
      case 0x7D0uLL:
        v5 = kPGGraphNodeMeaningHiking;
        break;
      case 0x7D1uLL:
        v5 = kPGGraphNodeMeaningBeaching;
        break;
      case 0x7D2uLL:
        v5 = kPGGraphNodeMeaningDiving;
        break;
      case 0x7D3uLL:
        v5 = kPGGraphNodeMeaningWinterSport;
        break;
      case 0x7D4uLL:
        v5 = kPGGraphNodeMeaningClimbing;
        break;
      default:
        if (a3 == 1001)
        {
          v5 = kPGGraphNodeMeaningLunch;
        }
        else
        {
          if (a3 != 1002) {
            goto LABEL_31;
          }
          v5 = kPGGraphNodeMeaningDinner;
        }
        break;
    }
  }
  else
  {
    v5 = kPGGraphNodeMeaningActivity;
    switch(a3)
    {
      case 1uLL:
        break;
      case 2uLL:
        v5 = kPGGraphNodeMeaningEntertainment;
        break;
      case 3uLL:
        v5 = kPGGraphNodeMeaningSportEvent;
        break;
      case 4uLL:
        v5 = kPGGraphNodeMeaningAmusementPark;
        break;
      case 5uLL:
        v5 = kPGGraphNodeMeaningPerformance;
        break;
      case 6uLL:
        v5 = kPGGraphNodeMeaningConcert;
        break;
      case 7uLL:
        v5 = kPGGraphNodeMeaningFestival;
        break;
      case 8uLL:
        v5 = kPGGraphNodeMeaningNightOut;
        break;
      case 9uLL:
        v5 = kPGGraphNodeMeaningMuseum;
        break;
      case 0xAuLL:
        v5 = kPGGraphNodeMeaningCelebration;
        break;
      case 0xBuLL:
        v5 = kPGGraphNodeMeaningAnniversary;
        break;
      case 0xCuLL:
        v5 = kPGGraphNodeMeaningBirthday;
        break;
      case 0xDuLL:
        v5 = kPGGraphNodeMeaningHolidayEvent;
        break;
      case 0xEuLL:
        v5 = kPGGraphNodeMeaningWedding;
        break;
      case 0xFuLL:
        v5 = kPGGraphNodeMeaningRestaurant;
        break;
      case 0x10uLL:
        v5 = kPGGraphNodeMeaningGathering;
        break;
      default:
        if (a3 != 1000) {
          goto LABEL_31;
        }
        v5 = &kPGGraphNodeMeaningBreakfast;
        break;
    }
  }
  v4 = *v5;
LABEL_31:
  return v4;
}

+ (unint64_t)_extendedMeaningForActivityMeaningLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Hiking"])
  {
    unint64_t v4 = 2000;
  }
  else if ([v3 isEqualToString:@"Beaching"])
  {
    unint64_t v4 = 2001;
  }
  else if ([v3 isEqualToString:@"Diving"])
  {
    unint64_t v4 = 2002;
  }
  else if ([v3 isEqualToString:@"WinterSport"])
  {
    unint64_t v4 = 2003;
  }
  else if ([v3 isEqualToString:@"Climbing"])
  {
    unint64_t v4 = 2004;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (unint64_t)_extendedMeaningForActivityEvent:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PGMeaningAggregationMemoryGenerator__extendedMeaningForActivityEvent___block_invoke;
  v7[3] = &unk_1E68E5B60;
  v7[4] = &v8;
  v7[5] = a1;
  [v4 enumerateMeaningNodesUsingBlock:v7];
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __72__PGMeaningAggregationMemoryGenerator__extendedMeaningForActivityEvent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = [a2 label];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "_extendedMeaningForActivityMeaningLabel:");
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v6 + 24))
    {
      *(void *)(v6 + 24) = 0;
      *a3 = 1;
    }
    else
    {
      *(void *)(v6 + 24) = v5;
    }
  }
}

+ (unint64_t)_extendedMeaningForRestaurantMeaningLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Breakfast"])
  {
    unint64_t v4 = 1000;
  }
  else if ([v3 isEqualToString:@"Lunch"])
  {
    unint64_t v4 = 1001;
  }
  else if ([v3 isEqualToString:@"Dinner"])
  {
    unint64_t v4 = 1002;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (unint64_t)_extendedMeaningForRestaurantEvent:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PGMeaningAggregationMemoryGenerator__extendedMeaningForRestaurantEvent___block_invoke;
  v7[3] = &unk_1E68E5B60;
  v7[4] = &v8;
  v7[5] = a1;
  [v4 enumerateMeaningNodesUsingBlock:v7];
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __74__PGMeaningAggregationMemoryGenerator__extendedMeaningForRestaurantEvent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = [a2 label];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "_extendedMeaningForRestaurantMeaningLabel:");
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v6 + 24))
    {
      *(void *)(v6 + 24) = 0;
      *a3 = 1;
    }
    else
    {
      *(void *)(v6 + 24) = v5;
    }
  }
}

+ (unint64_t)_extendedMeaningForMeaning:(unint64_t)a3 meaningfulEvent:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    uint64_t v7 = [a1 _extendedMeaningForActivityEvent:v6];
  }
  else
  {
    if (a3 != 15)
    {
      unint64_t v8 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = [a1 _extendedMeaningForRestaurantEvent:v6];
  }
  unint64_t v8 = v7;
LABEL_7:

  return v8;
}

+ (id)featureRelationWithMeaningLabel:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 allMeaningAggregationMemoryGeneratorClasses];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "supportedMeaningLabels", (void)v18);
        int v14 = [v13 containsObject:v4];

        if (v14)
        {
          id v15 = [v12 requiredFeatureRelation];
          if (v15) {
            [v6 addObject:v15];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    id v16 = [MEMORY[0x1E4F71F18] union:v6];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)allMeaningAggregationMemoryGeneratorClasses
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  return v2;
}

+ (id)requiredFeatureRelation
{
  return 0;
}

+ (id)supportedMeaningLabels
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Hiking";
  v4[1] = @"Climbing";
  v4[2] = @"Beaching";
  v4[3] = @"Diving";
  v4[4] = @"WinterSport";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  return v2;
}

@end