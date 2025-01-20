@interface PGTrendsMemoryGenerator
+ (id)allTrendSceneFeatureLabels;
+ (id)trendsConfigurations;
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (NSArray)configurations;
- (PGTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4;
- (id)_trendSceneFeatureLabelsToRequireKnownPeopleInCuration;
- (id)allTrendSceneFeatureNodesInGraph:(id)a3;
- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5;
- (id)fallbackFeaturedYearConfiguration;
- (id)fallbackOverTheYearsConfiguration;
- (id)featuredYearConfiguration;
- (id)filteredMomentNodes:(id)a3 withSceneLabel:(id)a4 inGraph:(id)a5;
- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4;
- (id)momentRequirements;
- (id)overTheYearsConfiguration;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (id)trendType;
- (id)validSceneFeatureNodesInGraph:(id)a3;
- (unint64_t)durationForCuration;
- (unint64_t)durationForExtendedCuration;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (unint64_t)minimumNumberOfDefaultMemories;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setMinimumNumberOfDefaultMemories:(unint64_t)a3;
- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3;
- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGTrendsMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackFeaturedYearConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_fallbackOverTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_restaurantMomentNodes, 0);
  objc_storeStrong((id *)&self->_winterSportMomentNodes, 0);
  objc_storeStrong((id *)&self->_allTrendsSceneFeatureNodesInGraph, 0);
}

- (id)fallbackFeaturedYearConfiguration
{
  return self->_fallbackFeaturedYearConfiguration;
}

- (id)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (id)fallbackOverTheYearsConfiguration
{
  return self->_fallbackOverTheYearsConfiguration;
}

- (id)overTheYearsConfiguration
{
  return self->_overTheYearsConfiguration;
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (void)setMinimumNumberOfDefaultMemories:(unint64_t)a3
{
  self->_minimumNumberOfDefaultMemories = a3;
}

- (unint64_t)minimumNumberOfDefaultMemories
{
  return self->_minimumNumberOfDefaultMemories;
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

- (NSArray)configurations
{
  return self->_configurations;
}

- (id)_trendSceneFeatureLabelsToRequireKnownPeopleInCuration
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v6[0] = @"Table";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = (void *)[v2 initWithArray:v3];

  return v4;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v11 = a7;
  id v12 = a8;
  id v13 = a3;
  v14 = [v13 memoryFeatureNodes];
  v15 = [v13 memoryMomentNodes];

  v16 = [v15 temporarySet];

  v17 = +[PGGraphNodeCollection subsetInCollection:v14];
  v18 = [(PGTrendsMemoryGenerator *)self allTrendSceneFeatureNodesInGraph:v12];

  v19 = [v17 collectionByIntersecting:v18];

  if ([v19 count] == 1)
  {
    v20 = [v19 labels];
    v21 = [v20 anyObject];

    v22 = objc_alloc_init(PGTimeTitleOptions);
    v36 = v16;
    [(PGTimeTitleOptions *)v22 setMomentNodes:v16];
    [(PGTimeTitleOptions *)v22 setAllowedFormats:20];
    v23 = +[PGGraphNodeCollection subsetInCollection:v14];
    if ([v23 count] == 1) {
      [(PGTimeTitleOptions *)v22 setFeaturedYearNodes:v23];
    }
    v24 = +[PGGraphNodeCollection subsetInCollection:v14];
    -[PGTimeTitleOptions setFilterForSignificantDateNodes:](v22, "setFilterForSignificantDateNodes:", [v24 count] == 0);
    v25 = +[PGGraphNodeCollection subsetInCollection:v14];
    if ([v25 count])
    {
      v26 = [PGTrendsMemoryTitleGenerator alloc];
      v27 = [v25 anyNode];
      uint64_t v28 = [(PGTrendsMemoryTitleGenerator *)v26 initWithMomentNodes:v36 sceneFeatureLabel:v21 personNode:v27 titleGenerationContext:v11 timeTitleOptions:v22];
    }
    else
    {
      id v35 = v11;
      v27 = +[PGGraphNodeCollection subsetInCollection:v14];
      uint64_t v30 = [v27 count];
      v31 = [PGTrendsMemoryTitleGenerator alloc];
      v32 = v31;
      if (v30)
      {
        v34 = [v27 anyNode];
        id v11 = v35;
        v29 = [(PGTrendsMemoryTitleGenerator *)v32 initWithMomentNodes:v36 sceneFeatureLabel:v21 cityNode:v34 titleGenerationContext:v35 timeTitleOptions:v22];

        goto LABEL_12;
      }
      id v11 = v35;
      uint64_t v28 = [(PGTrendsMemoryTitleGenerator *)v31 initWithMomentNodes:v36 sceneFeatureLabel:v21 titleGenerationContext:v35 timeTitleOptions:v22];
    }
    v29 = (PGTrendsMemoryTitleGenerator *)v28;
LABEL_12:

    v16 = v36;
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to generate Trends title because sceneFeatureNodeCollection count is not equal to 1", buf, 2u);
  }
  v29 = 0;
LABEL_13:

  return v29;
}

- (id)allTrendSceneFeatureNodesInGraph:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  allTrendsSceneFeatureNodesInGraph = self->_allTrendsSceneFeatureNodesInGraph;
  if (!allTrendsSceneFeatureNodesInGraph)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v7 = +[PGTrendsMemoryGenerator trendsConfigurations];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v27 + 1) + 8 * i) featureLabel];
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = +[PGCLIPTrendsMemoryGenerator CLIPTrendsConfigurations];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v23 + 1) + 8 * j) featureLabel];
          [v6 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v15);
    }

    if ([v6 count])
    {
      v19 = +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneNames:v6 inGraph:v4];
    }
    else
    {
      v19 = [(MAElementCollection *)[PGGraphSceneFeatureNodeCollection alloc] initWithGraph:v4];
    }
    v20 = self->_allTrendsSceneFeatureNodesInGraph;
    self->_allTrendsSceneFeatureNodesInGraph = v19;

    allTrendsSceneFeatureNodesInGraph = self->_allTrendsSceneFeatureNodesInGraph;
  }
  v21 = allTrendsSceneFeatureNodesInGraph;

  return v21;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v6 = a5;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PGMemoryGenerator *)self memoryCurationSession];
  id v12 = [v11 curationManager];

  id v13 = [v10 memoryFeatureNodes];
  uint64_t v14 = +[PGGraphNodeCollection subsetInCollection:v13];
  uint64_t v15 = [v10 memoryMomentNodes];

  uint64_t v16 = +[PGGraphEdgeCollection edgesFromNodes:v15 toNodes:v14];
  if ([v16 count])
  {
    v93 = v12;
    id v86 = v9;
    v91 = v16;
    v17 = [v16 allRelevantAssetLocalIdentifiers];
    v18 = [v17 mutableCopy];

    v19 = [(PGTrendsMemoryGenerator *)self _trendSceneFeatureLabelsToRequireKnownPeopleInCuration];
    v85 = v14;
    v20 = [v14 labels];
    int v21 = [v19 intersectsSet:v20];

    if (v21)
    {
      v22 = [v15 graph];
      long long v23 = +[PGGraphPersonNodeCollection personNodesIncludingMeInGraph:v22];

      long long v24 = +[PGGraphEdgeCollection edgesFromNodes:v15 toNodes:v23];
      long long v25 = [v24 allRelevantAssetLocalIdentifiers];
      [v18 intersectSet:v25];
    }
    id v12 = v93;
    long long v26 = [v93 defaultAssetFetchOptionsForMemories];
    [v26 setIncludeGuestAssets:v6];
    long long v27 = (void *)MEMORY[0x1E4F38EB8];
    long long v28 = v18;
    long long v29 = [v18 allObjects];
    v90 = v26;
    long long v30 = [v27 fetchAssetsWithLocalIdentifiers:v29 options:v26];

    v31 = (void *)MEMORY[0x1E4F38EB8];
    v32 = [(PGMemoryGenerator *)self memoryCurationSession];
    uint64_t v33 = [v32 curationContext];
    uint64_t v34 = [v31 clsAllAssetsFromFetchResult:v30 prefetchOptions:20 curationContext:v33];

    id v35 = +[PGGraphNodeCollection subsetInCollection:v13];
    uint64_t v36 = [v35 count];
    v37 = (void *)MEMORY[0x1E4F1CAD0];
    v84 = (void *)v34;
    if (v36)
    {
      v38 = +[PGCurationManager filterAssets:v34 inMomentNodes:v15 forCityNodes:v35 withMaximumDistance:5000.0];
      v39 = [v37 setWithArray:v38];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CAD0] setWithArray:v34];
    }
    v42 = +[PGGraphNodeCollection subsetInCollection:v13];
    uint64_t v43 = [v42 count];
    v92 = v30;
    v88 = v28;
    v89 = v35;
    v87 = v42;
    if (!v43)
    {
      id v58 = v39;
LABEL_30:
      id v70 = objc_alloc(MEMORY[0x1E4F39150]);
      v71 = [v58 allObjects];
      v72 = [v30 photoLibrary];
      [v30 fetchType];
      v74 = id v73 = v58;
      v75 = [v30 fetchPropertySets];
      v45 = [v70 initWithObjects:v71 photoLibrary:v72 fetchType:v74 fetchPropertySets:v75 identifier:0 registerIfNeeded:0];

      id v58 = v73;
      v76 = [(PGMemoryGenerator *)self memoryCurationSession];
      id v9 = v86;
      v41 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v45 memoryCurationSession:v76 graph:v86];

      id v12 = v93;
LABEL_31:
      uint64_t v16 = v91;
      v66 = v84;
LABEL_32:

      uint64_t v14 = v85;
LABEL_33:

      v40 = v88;
      goto LABEL_34;
    }
    int v44 = v43;
    if (v43 != 1)
    {
      v45 = [(PGMemoryGenerator *)self loggingConnection];
      id v58 = v39;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v99 = v44;
        _os_log_error_impl(&dword_1D1805000, v45, OS_LOG_TYPE_ERROR, "[PGTrendsMemoryGenerator] One featured person node expected, found %d", buf, 8u);
      }
      v41 = 0;
      id v9 = v86;
      goto LABEL_31;
    }
    v45 = +[PGGraphEdgeCollection edgesFromNodes:v15 toNodes:v42];
    if (![v45 count])
    {
      v65 = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v65, OS_LOG_TYPE_ERROR, "[PGTrendsMemoryGenerator] No person moment feature edges found", buf, 2u);
      }

      v41 = 0;
      id v9 = v86;
      uint64_t v16 = v91;
      v66 = v84;
      id v58 = v39;
      goto LABEL_32;
    }
    uint64_t v46 = [v45 allRelevantAssetLocalIdentifiers];
    id v47 = [v28 mutableCopy];
    v83 = (void *)v46;
    [v47 intersectSet:v46];
    v48 = (void *)MEMORY[0x1E4F28F60];
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __101__PGTrendsMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke;
    v96[3] = &unk_1E68EC880;
    id v81 = v47;
    id v97 = v81;
    v49 = [v48 predicateWithBlock:v96];
    v50 = [v39 filteredSetUsingPredicate:v49];

    v82 = v50;
    if ((unint64_t)[v50 count] < 3)
    {
      id v58 = v50;

      uint64_t v16 = v91;
    }
    else
    {
      id v51 = [v28 mutableCopy];
      [v51 minusSet:v83];
      v52 = (void *)MEMORY[0x1E4F28F60];
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __101__PGTrendsMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke_2;
      v94[3] = &unk_1E68EC880;
      id v80 = v51;
      id v95 = v80;
      v53 = [v52 predicateWithBlock:v94];
      v54 = [v39 filteredSetUsingPredicate:v53];

      uint64_t v55 = [objc_alloc(MEMORY[0x1E4F8E790]) initForSceneNetOnly:1];
      v56 = [PGSceneAssetFilter alloc];
      v79 = (void *)v55;
      v57 = [(PGSceneAssetFilter *)v56 initWithPositiveScenes:MEMORY[0x1E4F1CBF0] negativeScenes:&unk_1F28D3F90 sceneTaxonomy:v55];
      id v58 = v39;
      if (v57)
      {
        v59 = [v54 allObjects];
        uint64_t v60 = [(PGSceneAssetFilter *)v57 filteredAssetsFromAssets:v59];

        uint64_t v61 = [v82 setByAddingObjectsFromArray:v60];

        v62 = (void *)v60;
        id v58 = (id)v61;
        v63 = v54;
        v64 = v57;
        uint64_t v16 = v91;
        long long v30 = v92;
      }
      else
      {
        v78 = v54;
        v67 = [(PGMemoryGenerator *)self loggingConnection];
        uint64_t v16 = v91;
        long long v30 = v92;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1805000, v67, OS_LOG_TYPE_ERROR, "[PGTrendsMemoryGenerator] No-people scene asset filter is invalid, disabling", buf, 2u);
        }
        v62 = v67;
        v64 = 0;
        v63 = v78;
      }

      if (!v64)
      {
        int v69 = 0;
        v68 = v83;
LABEL_29:

        if (!v69)
        {
          v41 = 0;
          uint64_t v14 = v85;
          id v9 = v86;
          v66 = v84;
          goto LABEL_33;
        }
        goto LABEL_30;
      }
    }
    v68 = v83;
    int v69 = 1;
    goto LABEL_29;
  }
  v40 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1805000, v40, OS_LOG_TYPE_ERROR, "[PGTrendsMemoryGenerator] No scene moment feature edges found", buf, 2u);
  }
  v41 = 0;
LABEL_34:

  return v41;
}

uint64_t __101__PGTrendsMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [a2 localIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __101__PGTrendsMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [a2 localIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PGTrendsMemoryGenerator;
  v5 = [(PGMemoryGenerator *)&v7 curationOptionsWithRequiredAssetUUIDs:a3 eligibleAssetUUIDs:a4 triggeredMemory:a5];
  [v5 setMinimumNumberOfItems:15];
  [v5 setFailIfMinimumDurationNotReached:1];
  return v5;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PGTrendsMemoryGenerator;
  id v5 = a3;
  BOOL v6 = [(PGMemoryGenerator *)&v11 keyAssetCurationOptionsWithTriggeredMemory:v5 inGraph:a4];
  objc_super v7 = objc_msgSend(v5, "memoryFeatureNodes", v11.receiver, v11.super_class);

  uint64_t v8 = +[PGGraphNodeCollection subsetInCollection:v7];

  if ([v8 count])
  {
    id v9 = [v8 localIdentifiers];
    [v6 setReferencePersonLocalIdentifiers:v9];

    [v6 setMinimumNumberOfReferencePersons:0];
  }

  return v6;
}

- (unint64_t)durationForExtendedCuration
{
  return 10;
}

- (unint64_t)durationForCuration
{
  return 22;
}

- (id)filteredMomentNodes:(id)a3 withSceneLabel:(id)a4 inGraph:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"Snow"])
  {
    winterSportMomentNodes = self->_winterSportMomentNodes;
    if (!winterSportMomentNodes)
    {
      v23[0] = @"WinterSport";
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      id v13 = +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:v12 inGraph:v10];

      uint64_t v14 = [v13 momentNodes];
      uint64_t v15 = self->_winterSportMomentNodes;
      self->_winterSportMomentNodes = v14;

      winterSportMomentNodes = self->_winterSportMomentNodes;
    }
    uint64_t v16 = [v8 collectionBySubtracting:winterSportMomentNodes];

    id v8 = (id)v16;
  }
  if ([v9 isEqualToString:@"Cooking"])
  {
    restaurantMomentNodes = self->_restaurantMomentNodes;
    if (!restaurantMomentNodes)
    {
      v18 = +[PGGraphBusinessNodeCollection restaurantBusinessNodesInGraph:v10];
      v19 = [v18 momentNodes];
      v20 = self->_restaurantMomentNodes;
      self->_restaurantMomentNodes = v19;

      restaurantMomentNodes = self->_restaurantMomentNodes;
    }
    uint64_t v21 = [v8 collectionBySubtracting:restaurantMomentNodes];

    id v8 = (id)v21;
  }

  return v8;
}

- (id)validSceneFeatureNodesInGraph:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(PGTrendsMemoryGenerator *)self configurations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_super v11 = [v10 featureLabel];
        if (v11)
        {
          id v12 = [v10 validTrendTypes];
          id v13 = [(PGTrendsMemoryGenerator *)self trendType];
          int v14 = [v12 containsObject:v13];

          if (v14) {
            [v4 addObject:v11];
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PGTrendsMemoryGenerator] sceneFeatureLabel should not be nil", buf, 2u);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    uint64_t v15 = +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneNames:v4 inGraph:v18];
  }
  else
  {
    uint64_t v15 = [(MAElementCollection *)[PGGraphSceneFeatureNodeCollection alloc] initWithGraph:v18];
  }
  uint64_t v16 = v15;

  return v16;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PGTrendsMemoryGenerator *)self validSceneFeatureNodesInGraph:v6];
  if ([v8 count])
  {
    id v9 = (void *)MEMORY[0x1E4F71E88];
    id v10 = +[PGGraphFeatureNodeCollection momentOfFeature];
    objc_super v11 = [v9 adjacencyWithSources:v8 relation:v10 targetsClass:objc_opt_class()];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81__PGTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
    v12[3] = &unk_1E68EF7B0;
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    [v11 enumerateTargetsBySourceWithBlock:v12];
  }
}

void __81__PGTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = (void *)a1[4];
  id v8 = a3;
  id v9 = a2;
  id v10 = [v9 labels];
  objc_super v11 = [v10 anyObject];
  id v14 = [v7 filteredMomentNodes:v8 withSceneLabel:v11 inGraph:a1[5]];

  uint64_t v12 = a1[6];
  id v13 = [v9 featureNodeCollection];

  (*(void (**)(uint64_t, id, void *, uint64_t))(v12 + 16))(v12, v14, v13, a4);
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 16001;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 16002;
  }
  id v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (id)trendType
{
  return @"Generic";
}

- (unint64_t)memoryCategory
{
  return 27;
}

- (PGTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4
{
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PGTrendsMemoryGenerator;
  int v8 = [(PGMemoryGenerator *)&v21 initWithMemoryGenerationContext:a3];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configurations, a4);
    v9->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v9->_requireFaceProcessingMeetsThresholdOverTime = 0;
    __int16 v10 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v9->_momentRequirements;
    v9->_momentRequirements = v10;

    [(PGMemoryMomentRequirements *)v9->_momentRequirements setMinimumNumberOfRelevantAssets:2];
    [(PGMemoryMomentRequirements *)v9->_momentRequirements setFilterMomentsWithNotEnoughScenesProcessed:1];
    uint64_t v12 = +[PGOverTheYearsMemoryConfiguration strictDefaultOverTheYearsMemoryConfiguration];
    overTheYearsConfiguration = v9->_overTheYearsConfiguration;
    v9->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v12;

    [(PGOverTimeMemoryConfiguration *)v9->_overTheYearsConfiguration setMinimumNumberOfMoments:5];
    [(PGOverTimeMemoryConfiguration *)v9->_overTheYearsConfiguration setMinimumNumberOfRelevantAssets:15];
    uint64_t v14 = +[PGFeaturedTimePeriodMemoryConfiguration strictDefaultFeaturedYearMemoryConfiguration];
    featuredYearConfiguration = v9->_featuredYearConfiguration;
    v9->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v14;

    [(PGOverTimeMemoryConfiguration *)v9->_featuredYearConfiguration setMinimumNumberOfRelevantAssets:15];
    uint64_t v16 = +[PGFeaturedTimePeriodMemoryConfiguration defaultFallbackFeaturedYearMemoryConfiguration];
    fallbackFeaturedYearConfiguration = v9->_fallbackFeaturedYearConfiguration;
    v9->_fallbackFeaturedYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v16;

    uint64_t v18 = +[PGOverTheYearsMemoryConfiguration defaultFallbackOverTheYearsMemoryConfiguration];
    fallbackOverTheYearsConfiguration = v9->_fallbackOverTheYearsConfiguration;
    v9->_fallbackOverTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v18;

    v9->_minimumNumberOfDefaultMemories = 3;
  }

  return v9;
}

+ (id)allTrendSceneFeatureLabels
{
  v4[13] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Cityscape";
  v4[1] = @"Coffee";
  v4[2] = @"Forest";
  v4[3] = @"Rainbow";
  v4[4] = @"Snow";
  v4[5] = @"SunriseSunset";
  v4[6] = @"Waterfall";
  v4[7] = @"Biking";
  v4[8] = @"Table";
  v4[9] = @"Cooking";
  v4[10] = @"SpringBloom";
  v4[11] = @"AutumnFoliage";
  v4[12] = @"PlayTime";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:13];
  return v2;
}

+ (id)trendsConfigurations
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)trendsConfigurations__trendsConfigurations;
  if (!trendsConfigurations__trendsConfigurations)
  {
    v19 = objc_alloc_init(PGRemoteConfiguration);
    int v3 = [(PGRemoteConfiguration *)v19 dictionaryValueForKey:@"com.apple.photos.memories.trendsmemory.trendsscenes" withFallbackValue:MEMORY[0x1E4F1CC08]];
    if (![v3 count])
    {
      id v4 = +[PGLogging sharedLogging];
      id v5 = [v4 loggingConnection];

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v27 = @"com.apple.photos.memories.trendsmemory.trendsscenes";
        _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "PGTrendsMemoryGenerator: Couldn't load remote configuration dictionary from key: %@", buf, 0xCu);
      }
    }
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * v11)];
          id v13 = [[PGDictionaryConfigurationSource alloc] initWithDictionary:v12];
          uint64_t v14 = [PGTrendsConfiguration alloc];
          long long v24 = v13;
          uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
          uint64_t v16 = [(PGConfiguration *)v14 initWithSources:v15 version:1.0];

          [v6 addObject:v16];
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v9);
    }

    v17 = (void *)trendsConfigurations__trendsConfigurations;
    trendsConfigurations__trendsConfigurations = (uint64_t)v6;

    id v2 = (void *)trendsConfigurations__trendsConfigurations;
  }
  return v2;
}

@end