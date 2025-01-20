@interface PGChildAndPersonMemoryGenerator
- (BOOL)intersectRelevantAssetsForFeatures;
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (PGChildAndPersonMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)_twoPersonNodeCollectionsFromSocialGroupMemoryNodesInGraph:(id)a3;
- (id)fallbackFeaturedYearConfiguration;
- (id)fallbackOverTheYearsConfiguration;
- (id)featuredYearConfiguration;
- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4;
- (id)momentRequirements;
- (id)overTheYearsConfiguration;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (unint64_t)durationForCuration;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (unint64_t)minimumNumberOfDefaultMemories;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setMinimumNumberOfDefaultMemories:(unint64_t)a3;
- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3;
- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGChildAndPersonMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackFeaturedYearConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_fallbackOverTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

- (BOOL)intersectRelevantAssetsForFeatures
{
  return self->_intersectRelevantAssetsForFeatures;
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

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v9 = a7;
  id v10 = a3;
  v11 = [v10 memoryFeatureNodes];
  v12 = [v10 memoryMomentNodes];

  v13 = [v12 temporarySet];

  v14 = +[PGPeopleMemoryTitleGenerator peopleOverTimeTimeTitleOptionsWithMomentNodes:v13];
  v15 = +[PGGraphNodeCollection subsetInCollection:v11];
  if ([v15 count] == 1) {
    [v14 setFeaturedYearNodes:v15];
  }
  v16 = +[PGGraphNodeCollection subsetInCollection:v11];
  v17 = [PGPeopleMemoryTitleGenerator alloc];
  v18 = [v16 temporarySet];
  v19 = [(PGPeopleMemoryTitleGenerator *)v17 initWithMomentNodes:v13 personNodes:v18 timeTitleOptions:v14 type:5 titleGenerationContext:v9];

  return v19;
}

- (unint64_t)durationForCuration
{
  return 22;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v55 = a4;
  id v54 = a6;
  v56 = v8;
  id v9 = [v8 memoryFeatureNodes];
  v59 = +[PGGraphNodeCollection subsetInCollection:v9];

  if ([v59 count] == 2)
  {
    id v10 = [v59 localIdentifiers];
    osos_log_t log = [v10 allObjects];

    if ([oslog count] == 2)
    {
      v11 = [v8 memoryMomentNodes];
      *(void *)buf = 0;
      v83 = buf;
      uint64_t v84 = 0x3032000000;
      v85 = __Block_byref_object_copy__52448;
      v86 = __Block_byref_object_dispose__52449;
      id v87 = 0;
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __109__PGChildAndPersonMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke;
      v76[3] = &unk_1E68EB588;
      os_log_t log = v11;
      os_log_t v77 = log;
      v78 = self;
      v79 = buf;
      [v59 enumerateIdentifiersAsCollectionsWithBlock:v76];
      if ([*((id *)v83 + 5) count])
      {
        v12 = [oslog firstObject];
        v13 = [oslog lastObject];
        v14 = [(PGMemoryGenerator *)self memoryCurationSession];
        v15 = [v14 curationManager];
        v51 = [v15 defaultAssetFetchOptionsForMemories];

        v16 = (void *)MEMORY[0x1E4F38EB8];
        v17 = [*((id *)v83 + 5) allObjects];
        v52 = [v16 fetchAssetsWithLocalIdentifiers:v17 options:v51];

        v18 = (void *)MEMORY[0x1E4F38EB8];
        v19 = [(PGMemoryGenerator *)self memoryCurationSession];
        v20 = [v19 curationContext];
        v21 = [v18 clsAllAssetsFromFetchResult:v52 prefetchOptions:8 curationContext:v20];

        v50 = +[PGGraphNodeCollection nodesInGraph:v55];
        v22 = [v50 localIdentifiers];
        v23 = [v22 anyObject];

        id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        obuint64_t j = v21;
        uint64_t v63 = [obj countByEnumeratingWithState:&v71 objects:v81 count:16];
        if (v63)
        {
          uint64_t v62 = *(void *)v72;
          do
          {
            for (uint64_t i = 0; i != v63; ++i)
            {
              if (*(void *)v72 != v62) {
                objc_enumerationMutation(obj);
              }
              v64 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              v24 = [v64 clsFaceInformationSummary];
              v66 = [v24 faceInformationByPersonLocalIdentifier];

              v25 = [v66 objectForKeyedSubscript:v12];
              [v25 faceSize];
              double v27 = v26;

              v28 = [v66 objectForKeyedSubscript:v13];
              [v28 faceSize];
              double v30 = v29;

              if (v27 >= v30) {
                double v31 = v27;
              }
              else {
                double v31 = v30;
              }
              if (v23)
              {
                v32 = [v66 objectForKeyedSubscript:v23];
                [v32 faceSize];
                double v34 = v33;
              }
              else
              {
                double v34 = 0.0;
              }
              if (v34 < v31 + v31)
              {
                if (v27 >= v30) {
                  double v27 = v30;
                }
                long long v69 = 0u;
                long long v70 = 0u;
                long long v67 = 0u;
                long long v68 = 0u;
                id v35 = v66;
                uint64_t v36 = [v35 countByEnumeratingWithState:&v67 objects:v80 count:16];
                if (v36)
                {
                  uint64_t v37 = *(void *)v68;
                  double v38 = 0.0;
                  while (1)
                  {
                    for (uint64_t j = 0; j != v36; ++j)
                    {
                      if (*(void *)v68 != v37) {
                        objc_enumerationMutation(v35);
                      }
                      v40 = *(void **)(*((void *)&v67 + 1) + 8 * j);
                      v41 = [v35 objectForKeyedSubscript:v40];
                      if ([v40 isEqualToString:v12])
                      {
                        int v42 = 1;
                        if (!v23) {
                          goto LABEL_27;
                        }
                      }
                      else
                      {
                        int v42 = [v40 isEqualToString:v13];
                        if (!v23)
                        {
LABEL_27:
                          int v43 = 0;
                          goto LABEL_28;
                        }
                      }
                      int v43 = [v40 isEqualToString:v23];
LABEL_28:
                      if (((v42 | v43) & 1) == 0)
                      {
                        [v41 faceSize];
                        if (v38 < v44) {
                          double v38 = v44;
                        }
                      }
                    }
                    uint64_t v36 = [v35 countByEnumeratingWithState:&v67 objects:v80 count:16];
                    if (!v36) {
                      goto LABEL_35;
                    }
                  }
                }
                double v38 = 0.0;
LABEL_35:

                if (v38 < v27 * 0.5)
                {
                  v45 = [v64 objectID];
                  [v60 addObject:v45];
                }
              }
            }
            uint64_t v63 = [obj countByEnumeratingWithState:&v71 objects:v81 count:16];
          }
          while (v63);
        }

        if ([v60 count])
        {
          v46 = [objc_alloc(MEMORY[0x1E4F390B0]) initWithExistingFetchResult:v52 filteredObjectIDs:v60];
          v47 = [(PGMemoryGenerator *)self memoryCurationSession];
          v48 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v46 memoryCurationSession:v47 graph:v55];
        }
        else
        {
          v46 = [(PGMemoryGenerator *)self loggingConnection];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v75 = 0;
            _os_log_error_impl(&dword_1D1805000, v46, OS_LOG_TYPE_ERROR, "[PGChildAndPersonMemoryGenerator] Filtered out all relevant assets due to face sizes for memory", v75, 2u);
          }
          v48 = 0;
        }
      }
      else
      {
        v12 = [(PGMemoryGenerator *)self loggingConnection];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v75 = 0;
          _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "[PGChildAndPersonMemoryGenerator] No relevantAssetLocalIdentifiers found", v75, 2u);
        }
        v48 = 0;
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      os_log_t log = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = [oslog count];
        _os_log_error_impl(&dword_1D1805000, log, OS_LOG_TYPE_ERROR, "[PGChildAndPersonMemoryGenerator] Two person node local identifiers expected, found %d", buf, 8u);
      }
      v48 = 0;
    }
  }
  else
  {
    osos_log_t log = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = [v59 count];
      _os_log_error_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_ERROR, "[PGChildAndPersonMemoryGenerator] Two person nodes expected, found %d", buf, 8u);
    }
    v48 = 0;
  }

  return v48;
}

void __109__PGChildAndPersonMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v12 = +[PGGraphEdgeCollection edgesFromNodes:*(void *)(a1 + 32) toNodes:a3];
  if ([v12 count])
  {
    v6 = [v12 allRelevantAssetLocalIdentifiers];
    v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v7)
    {
      [v7 intersectSet:v6];
    }
    else
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v6];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) loggingConnection];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "[PGChildAndPersonMemoryGenerator] No personMomentFeatureEdges found for person", buf, 2u);
    }

    *a4 = 1;
  }
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PGChildAndPersonMemoryGenerator;
  id v5 = a3;
  v6 = [(PGMemoryGenerator *)&v11 keyAssetCurationOptionsWithTriggeredMemory:v5 inGraph:a4];
  v7 = objc_msgSend(v5, "memoryFeatureNodes", v11.receiver, v11.super_class);

  id v8 = +[PGGraphNodeCollection subsetInCollection:v7];

  uint64_t v9 = [v8 localIdentifiers];
  [v6 setReferencePersonLocalIdentifiers:v9];

  [v6 setMinimumNumberOfReferencePersons:0];
  return v6;
}

- (id)_twoPersonNodeCollectionsFromSocialGroupMemoryNodesInGraph:(id)a3
{
  v3 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:6 inGraph:a3];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__PGChildAndPersonMemoryGenerator__twoPersonNodeCollectionsFromSocialGroupMemoryNodesInGraph___block_invoke;
  v7[3] = &unk_1E68EFBB0;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateIdentifiersAsCollectionsWithBlock:v7];

  return v5;
}

void __94__PGChildAndPersonMemoryGenerator__twoPersonNodeCollectionsFromSocialGroupMemoryNodesInGraph___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 featureNodes];
  id v5 = +[PGGraphNodeCollection subsetInCollection:v4];

  if ([v5 count] == 2) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PGMemoryGeneratorUtils babyAndChildPersonNodesAtHomeOrFrequentLocationInGraph:v6];
  if ([v8 count])
  {
    uint64_t v9 = [(PGChildAndPersonMemoryGenerator *)self _twoPersonNodeCollectionsFromSocialGroupMemoryNodesInGraph:v6];
    uint64_t v10 = (void *)MEMORY[0x1E4F71E88];
    objc_super v11 = +[PGGraphNodeCollection nodesInGraph:v6];
    id v12 = +[PGGraphFeatureNodeCollection momentOfFeature];
    v13 = [v10 adjacencyWithSources:v11 relation:v12 targetsClass:objc_opt_class()];

    v14 = [v13 intersectingSourcesWith:v8];
    id v15 = objc_alloc_init(MEMORY[0x1E4F71E60]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __89__PGChildAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
    v19[3] = &unk_1E68EB560;
    id v20 = v15;
    id v21 = v13;
    id v22 = v9;
    id v23 = v6;
    id v24 = v7;
    id v16 = v9;
    id v17 = v13;
    id v18 = v15;
    [v14 enumerateTargetsBySourceWithBlock:v19];
  }
}

void __89__PGChildAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  context = (void *)MEMORY[0x1D25FED50]();
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v6 elementIdentifiers];
  objc_msgSend(v8, "addIdentifier:", objc_msgSend(v9, "firstElement"));

  uint64_t v10 = [*(id *)(a1 + 40) intersectingTargetsWith:v7];
  objc_super v11 = [v10 subtractingSourcesWith:v6];

  id v12 = (void *)[*(id *)(a1 + 32) mutableCopy];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v6 isSubsetOfCollection:v18])
        {
          v19 = [v18 elementIdentifiers];
          [v12 unionWithIdentifierSet:v19];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  id v20 = [(MAElementCollection *)[PGGraphPersonNodeCollection alloc] initWithGraph:*(void *)(a1 + 56) elementIdentifiers:v12];
  id v21 = [v11 subtractingSourcesWith:v20];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __89__PGChildAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2;
  v25[3] = &unk_1E68EFD10;
  id v27 = *(id *)(a1 + 64);
  id v22 = v6;
  id v26 = v22;
  uint64_t v28 = a4;
  [v21 enumerateTargetsBySourceWithBlock:v25];
}

void __89__PGChildAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = a3;
  uint64_t v10 = [v8 collectionByFormingUnionWith:a2];
  objc_super v11 = [v10 featureNodeCollection];
  (*(void (**)(uint64_t, id, void *, unsigned char *))(v7 + 16))(v7, v9, v11, a4);

  **(unsigned char **)(a1 + 48) = *a4;
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 15003;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 15004;
  }
  id v5 = [(PGMemoryGenerator *)self loggingConnection];
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
  return 29;
}

- (PGChildAndPersonMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PGChildAndPersonMemoryGenerator;
  int v3 = [(PGMemoryGenerator *)&v16 initWithMemoryGenerationContext:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 1;
    id v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    [(PGMemoryMomentRequirements *)v4->_momentRequirements setMinimumNumberOfRelevantAssets:2];
    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterMomentsWithNotEnoughScenesProcessed:1];
    uint64_t v7 = +[PGOverTheYearsMemoryConfiguration defaultOverTheYearsMemoryConfiguration];
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v7;

    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setMinimumNumberOfRelevantAssets:13];
    uint64_t v9 = +[PGFeaturedTimePeriodMemoryConfiguration defaultFeaturedYearMemoryConfiguration];
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumMomentSpreadicityTimeInterval:604800.0];
    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumNumberOfRelevantAssets:13];
    v4->_intersectRelevantAssetsForFeatures = 1;
    v4->_minimumNumberOfDefaultMemories = 3;
    uint64_t v11 = +[PGOverTheYearsMemoryConfiguration defaultFallbackOverTheYearsMemoryConfiguration];
    fallbackOverTheYearsConfiguration = v4->_fallbackOverTheYearsConfiguration;
    v4->_fallbackOverTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v11;

    uint64_t v13 = +[PGFeaturedTimePeriodMemoryConfiguration defaultFallbackFeaturedYearMemoryConfiguration];
    fallbackFeaturedYearConfiguration = v4->_fallbackFeaturedYearConfiguration;
    v4->_fallbackFeaturedYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v13;
  }
  return v4;
}

@end