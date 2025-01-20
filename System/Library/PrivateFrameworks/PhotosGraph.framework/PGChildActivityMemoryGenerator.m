@interface PGChildActivityMemoryGenerator
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (PGChildActivityMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)_supportedCompoundActivityLabels;
- (id)_supportedIndividualActivityLabels;
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

@implementation PGChildActivityMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackFeaturedYearConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_fallbackOverTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
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

- (id)_supportedCompoundActivityLabels
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"PersonActionPlayingOnASwing", @"PersonActionPlayingOnASlide", 0);
  v6[0] = v2;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"PersonActionHugging", @"PersonActionKissing", 0);
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (id)_supportedIndividualActivityLabels
{
  v6[8] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v6[0] = @"PersonBeachWater";
  v6[1] = @"PersonToys";
  v6[2] = @"PersonPlayground";
  void v6[3] = @"PersonSoccer";
  v6[4] = @"PersonMartialArts";
  v6[5] = @"PersonActionSwimming";
  v6[6] = @"PersonActionJumpingOrLeaping";
  v6[7] = @"PersonActionRunningOrJogging";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:8];
  v4 = (void *)[v2 initWithArray:v3];

  return v4;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a7;
  v12 = [v10 memoryMomentNodes];
  v13 = [v12 temporarySet];

  v14 = [v10 memoryFeatureNodes];
  v15 = +[PGGraphNodeCollection subsetInCollection:v14];

  v16 = [v15 personActivityMeaningLabels];
  if ([v16 count])
  {
    v17 = [v15 personNodes];
    if ((unint64_t)[v17 count] >= 2)
    {
      v18 = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v15;
        _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "[PGChildActivityMemoryGenerator] More than 1 child found in activityNode:%@", buf, 0xCu);
      }
    }
    v19 = objc_msgSend(v17, "anyNode", v17);
    v20 = [(PGMemoryGenerator *)self memoryGenerationContext];
    v21 = [v20 serviceManager];
    v22 = +[PGPeopleTitleUtility nameFromPersonNode:v19 serviceManager:v21];

    v23 = [PGChildActivityMemoryTitleGenerator alloc];
    v24 = [(PGMemoryGenerator *)self loggingConnection];
    v32 = v13;
    v25 = v13;
    id v26 = v11;
    v27 = [(PGChildActivityMemoryTitleGenerator *)v23 initWithMomentNodes:v25 activityLabels:v16 childName:v22 titleGenerationContext:v11 loggingConnection:v24];

    v28 = [v10 memoryFeatureNodes];
    v29 = +[PGGraphNodeCollection subsetInCollection:v28];

    if ([v29 count] == 1) {
      [(PGTitleGenerator *)v27 setFeaturedYearNodes:v29];
    }

    id v11 = v26;
    v13 = v32;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (unint64_t)durationForCuration
{
  return 23;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = [v9 memoryFeatureNodes];
  v12 = +[PGGraphNodeCollection subsetInCollection:v11];

  if ([v12 count])
  {
    v13 = [v9 memoryMomentNodes];
    v14 = +[PGGraphEdgeCollection edgesFromNodes:v13 toNodes:v12];

    if ([v14 count])
    {
      v15 = [v14 allRelevantAssetLocalIdentifiers];
      v16 = [v15 allObjects];
      v17 = [(PGMemoryGenerator *)self memoryCurationSession];
      v18 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetLocalIdentifiers:v16 memoryCurationSession:v17 graph:v10 allowGuestAsset:v6];

      goto LABEL_10;
    }
    v19 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_1D1805000, v19, OS_LOG_TYPE_ERROR, "[PGChildActivityMemoryGenerator] No moment feature edges found", v21, 2u);
    }
  }
  else
  {
    v14 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "[PGChildActivityMemoryGenerator] One or more person activity node expected", buf, 2u);
    }
  }
  v18 = 0;
LABEL_10:

  return v18;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PGChildActivityMemoryGenerator;
  id v5 = a3;
  BOOL v6 = [(PGMemoryGenerator *)&v11 keyAssetCurationOptionsWithTriggeredMemory:v5 inGraph:a4];
  v7 = objc_msgSend(v5, "memoryFeatureNodes", v11.receiver, v11.super_class);

  v8 = +[PGGraphNodeCollection subsetInCollection:v7];

  id v9 = [v8 localIdentifiers];
  [v6 setReferencePersonLocalIdentifiers:v9];

  return v6;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = +[PGGraphPersonNodeCollection personNodesInAgeCategories:&unk_1F28D4710 includingMe:0 inGraph:a3];
  if ([v7 count])
  {
    v30 = v6;
    v8 = [(PGChildActivityMemoryGenerator *)self _supportedIndividualActivityLabels];
    id v9 = [(PGChildActivityMemoryGenerator *)self _supportedCompoundActivityLabels];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v8];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          [v10 unionSet:*(void *)(*((void *)&v36 + 1) + 8 * v15++)];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v13);
    }

    v16 = (void *)MEMORY[0x1E4F71F18];
    v17 = +[PGGraphPersonNode personActivityMeaningOfPerson];
    v40[0] = v17;
    v18 = +[PGGraphPersonActivityMeaningNode filterWithActivityLabels:v10];
    v19 = [v18 relation];
    v40[1] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    v21 = [v16 chain:v20];

    v22 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v7 relation:v21 targetsClass:objc_opt_class()];
    v23 = (void *)MEMORY[0x1E4F71E88];
    v24 = [v22 targets];
    v25 = +[PGGraphFeatureNodeCollection momentOfFeature];
    id v26 = [v23 adjacencyWithSources:v24 relation:v25 targetsClass:objc_opt_class()];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __88__PGChildActivityMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
    v31[3] = &unk_1E68EB448;
    v31[4] = self;
    id v32 = v11;
    id v33 = v26;
    id v6 = v30;
    id v34 = v8;
    id v35 = v30;
    id v27 = v8;
    id v28 = v26;
    id v29 = v11;
    [v22 enumerateTargetsBySourceWithBlock:v31];
  }
}

void __88__PGChildActivityMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v29 = a2;
  id v5 = a3;
  id v6 = [a1[4] loggingConnection];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v29 localIdentifiers];
    v8 = [v7 anyObject];
    id v9 = [v5 personActivityMeaningLabels];
    *(_DWORD *)buf = 138412546;
    uint64_t v42 = v8;
    __int16 v43 = 2112;
    v44 = v9;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_INFO, "[PGChildActivityMemoryGenerator] Generate activity memories for child %@ with activity meanings:%@", buf, 0x16u);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = a1[5];
  uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v15 = [a1[4] loggingConnection];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v42 = v14;
          _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[PGChildActivityMemoryGenerator] Generate compound activities: %@", buf, 0xCu);
        }

        v16 = [v5 subsetWithActivityLabels:v14];
        uint64_t v17 = [v16 count];
        v18 = [a1[4] loggingConnection];
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        if (v17)
        {
          if (v19)
          {
            v20 = [v16 labels];
            *(_DWORD *)buf = 138412290;
            uint64_t v42 = v20;
            _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "[PGChildActivityMemoryGenerator] Found compound activities: %@", buf, 0xCu);
          }
          v18 = [a1[6] targetsForSources:v16];
          v21 = [v16 featureNodeCollection];
          v22 = [v29 featureNodeCollection];
          v23 = [v21 collectionByFormingUnionWith:v22];

          (*((void (**)(void))a1[8] + 2))();
        }
        else if (v19)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "[PGChildActivityMemoryGenerator] Cannot find any of the compound activities", buf, 2u);
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v11);
  }

  v24 = [v5 subsetWithActivityLabels:a1[7]];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __88__PGChildActivityMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_241;
  v30[3] = &unk_1E68EB420;
  id v25 = a1[7];
  id v26 = a1[4];
  id v31 = v25;
  id v32 = v26;
  id v33 = a1[6];
  id v34 = v29;
  id v35 = a1[8];
  id v27 = v29;
  [v24 enumerateIdentifiersAsCollectionsWithBlock:v30];
}

void __88__PGChildActivityMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_241(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 personActivityMeaningLabels];
  id v6 = [v5 anyObject];

  if ([*(id *)(a1 + 32) containsObject:v6])
  {
    v7 = [*(id *)(a1 + 40) loggingConnection];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "[PGChildActivityMemoryGenerator] Generate for single activity: %@", (uint8_t *)&v12, 0xCu);
    }

    v8 = [*(id *)(a1 + 48) targetsForSources:v4];
    id v9 = [v4 featureNodeCollection];
    uint64_t v10 = [*(id *)(a1 + 56) featureNodeCollection];
    uint64_t v11 = [v9 collectionByFormingUnionWith:v10];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 15001;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 15002;
  }
  id v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
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
  return 25;
}

- (PGChildActivityMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PGChildActivityMemoryGenerator;
  int v3 = [(PGMemoryGenerator *)&v16 initWithMemoryGenerationContext:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 1;
    id v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    [(PGMemoryMomentRequirements *)v4->_momentRequirements setMinimumNumberOfRelevantAssets:3];
    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterMomentsWithNotEnoughScenesProcessed:1];
    uint64_t v7 = +[PGOverTheYearsMemoryConfiguration defaultOverTheYearsMemoryConfiguration];
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v7;

    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setMinimumNumberOfMoments:2];
    [(PGOverTheYearsMemoryConfiguration *)v4->_overTheYearsConfiguration setMinimumNumberOfMomentsForTwoConsecutiveYears:4];
    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setMinimumNumberOfRelevantAssets:13];
    uint64_t v9 = +[PGFeaturedTimePeriodMemoryConfiguration defaultFeaturedYearMemoryConfiguration];
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumNumberOfMoments:4];
    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumMomentSpreadicityTimeInterval:604800.0];
    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumOverallTimeIntervalOfMoments:7889400.0];
    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumNumberOfRelevantAssets:13];
    v4->_minimumNumberOfDefaultMemories = 3;
    uint64_t v11 = +[PGOverTheYearsMemoryConfiguration defaultFallbackOverTheYearsMemoryConfiguration];
    fallbackOverTheYearsConfiguration = v4->_fallbackOverTheYearsConfiguration;
    v4->_fallbackOverTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v11;

    [(PGOverTimeMemoryConfiguration *)v4->_fallbackOverTheYearsConfiguration setMinimumNumberOfMoments:2];
    uint64_t v13 = +[PGFeaturedTimePeriodMemoryConfiguration defaultFallbackFeaturedYearMemoryConfiguration];
    fallbackFeaturedYearConfiguration = v4->_fallbackFeaturedYearConfiguration;
    v4->_fallbackFeaturedYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v13;

    [(PGOverTimeMemoryConfiguration *)v4->_fallbackFeaturedYearConfiguration setMinimumOverallTimeIntervalOfMoments:7889400.0];
  }
  return v4;
}

@end