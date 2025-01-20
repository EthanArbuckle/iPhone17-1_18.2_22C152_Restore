@interface PGChildOutdoorMemoryGenerator
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (PGChildOutdoorMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)fallbackFeaturedYearConfiguration;
- (id)fallbackOverTheYearsConfiguration;
- (id)featuredYearConfiguration;
- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4;
- (id)momentRequirements;
- (id)outdoorROINodesInGraph:(id)a3;
- (id)overTheYearsConfiguration;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (unint64_t)durationForCuration;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (unint64_t)minimumNumberOfDefaultMemories;
- (unint64_t)numberOfRelevantAssetsForMomentNodes:(id)a3 featureNodes:(id)a4;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setMinimumNumberOfDefaultMemories:(unint64_t)a3;
- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3;
- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGChildOutdoorMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackFeaturedYearConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_fallbackOverTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
  objc_storeStrong((id *)&self->_outdoorROINodes, 0);
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
  id v9 = a3;
  id v10 = a7;
  v11 = [v9 memoryFeatureNodes];
  v12 = +[PGGraphNodeCollection subsetInCollection:v11];
  if ([v12 count] == 1)
  {
    v13 = [PGChildOutdoorMemoryTitleGenerator alloc];
    v14 = [v9 memoryMomentNodes];
    v15 = [v14 temporarySet];
    v16 = [v12 anyNode];
    v17 = [(PGChildOutdoorMemoryTitleGenerator *)v13 initWithMomentNodes:v15 personNode:v16 type:0 titleGenerationContext:v10];

    v18 = [v9 memoryFeatureNodes];
    v19 = +[PGGraphNodeCollection subsetInCollection:v18];

    if ([v19 count] == 1) {
      [(PGTitleGenerator *)v17 setFeaturedYearNodes:v19];
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to generate ChildOutdoor memory title because personNodeAsCollection count is not equal to 1", v21, 2u);
    }
    v17 = 0;
  }

  return v17;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v6 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [v9 memoryFeatureNodes];
  v12 = +[PGGraphNodeCollection subsetInCollection:v11];
  if ([v12 count] == 1)
  {
    v13 = [v9 memoryMomentNodes];
    v14 = +[PGGraphEdgeCollection edgesFromNodes:v13 toNodes:v12];
    if ([v14 count])
    {
      v15 = [(PGChildOutdoorMemoryGenerator *)self outdoorROINodesInGraph:v10];
      v16 = +[PGGraphEdgeCollection edgesFromNodes:v13 toNodes:v15];
      if ([v16 count])
      {
        [v16 allRelevantAssetUUIDs];
        v17 = v25 = v16;
        v26 = v15;
        v18 = (void *)[v17 mutableCopy];

        v19 = [v14 allRelevantAssetUUIDs];
        [v18 intersectSet:v19];
        [v18 allObjects];
        v20 = v27 = v14;
        v21 = [(PGMemoryGenerator *)self memoryCurationSession];
        v22 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetLocalIdentifiers:v20 memoryCurationSession:v21 graph:v10 allowGuestAsset:v6];

        v14 = v27;
        v16 = v25;

        v15 = v26;
      }
      else
      {
        v23 = [(PGMemoryGenerator *)self loggingConnection];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1805000, v23, OS_LOG_TYPE_ERROR, "[PGChildOutdoorMemoryGenerator] No outdoor ROI moment feature edges found", buf, 2u);
        }

        v22 = 0;
      }
    }
    else
    {
      v15 = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "[PGChildOutdoorMemoryGenerator] No person moment feature edges found", buf, 2u);
      }
      v22 = 0;
    }
  }
  else
  {
    v13 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v29 = [v12 count];
      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGChildOutdoorMemoryGenerator] One person node expected, found %d", buf, 8u);
    }
    v22 = 0;
  }

  return v22;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PGChildOutdoorMemoryGenerator;
  id v5 = a3;
  BOOL v6 = [(PGMemoryGenerator *)&v11 keyAssetCurationOptionsWithTriggeredMemory:v5 inGraph:a4];
  v7 = objc_msgSend(v5, "memoryFeatureNodes", v11.receiver, v11.super_class);

  v8 = +[PGGraphNodeCollection subsetInCollection:v7];
  id v9 = [v8 localIdentifiers];
  [v6 setReferencePersonLocalIdentifiers:v9];

  return v6;
}

- (unint64_t)durationForCuration
{
  return 23;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[PGMemoryGeneratorUtils babyAndChildPersonNodesAtHomeOrFrequentLocationInGraph:v5];
  if ([v7 count])
  {
    v8 = +[PGMemoryGeneratorUtils outdoorROIMomentNodesNotAtHomeOrFrequentLocationInGraph:v5 useMomentFeatureEdges:1];
    if ([v8 count])
    {
      id v9 = (void *)MEMORY[0x1E4F71F18];
      id v10 = +[PGGraphMomentNode featureOfMoment];
      v20[0] = v10;
      objc_super v11 = +[PGGraphPersonNode filter];
      v12 = [v11 relation];
      v20[1] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
      v14 = [v9 chain:v13];

      v15 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v8 relation:v14 targetsClass:objc_opt_class()];
      v16 = [v15 intersectingTargetsWith:v7];

      v17 = [v16 transposed];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __87__PGChildOutdoorMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
      v18[3] = &unk_1E68E6180;
      id v19 = v6;
      [v17 enumerateTargetsBySourceWithBlock:v18];
    }
  }
}

void __87__PGChildOutdoorMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  id v8 = [a2 featureNodeCollection];
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);
}

- (unint64_t)numberOfRelevantAssetsForMomentNodes:(id)a3 featureNodes:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(PGOverTimeMemoryGenerator *)self intersectRelevantAssetsForFeatures])
  {
    id v8 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20[0]) = 0;
      _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "Cannot set intersectRelevantAssetsForFeatures=YES and override this superclass method", (uint8_t *)v20, 2u);
    }
  }
  if ([v6 count])
  {
    id v9 = +[PGGraphNodeCollection subsetInCollection:v7];
    if ([v9 count] == 1)
    {
      id v10 = +[PGGraphEdgeCollection edgesFromNodes:v6 toNodes:v9];
      objc_super v11 = [v6 graph];
      v12 = [(PGChildOutdoorMemoryGenerator *)self outdoorROINodesInGraph:v11];

      v13 = +[PGGraphEdgeCollection edgesFromNodes:v6 toNodes:v12];
      v14 = [v13 allRelevantAssetUUIDs];
      v15 = (void *)[v14 mutableCopy];

      v16 = [v10 allRelevantAssetUUIDs];
      [v15 intersectSet:v16];
      unint64_t v17 = [v15 count];
    }
    else
    {
      id v10 = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v19 = [v9 count];
        v20[0] = 67109120;
        v20[1] = v19;
        _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "[PGChildOutdoorMemoryGenerator] One person node expected, found %d", (uint8_t *)v20, 8u);
      }
      unint64_t v17 = 0;
    }
  }
  else
  {
    unint64_t v17 = 0;
  }

  return v17;
}

- (id)outdoorROINodesInGraph:(id)a3
{
  outdoorROINodes = self->_outdoorROINodes;
  if (!outdoorROINodes)
  {
    id v5 = +[PGMemoryGeneratorUtils outdoorROINodesInGraph:a3];
    id v6 = self->_outdoorROINodes;
    self->_outdoorROINodes = v5;

    outdoorROINodes = self->_outdoorROINodes;
  }
  return outdoorROINodes;
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 15005;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 15006;
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

- (unint64_t)memoryCategory
{
  return 30;
}

- (PGChildOutdoorMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PGChildOutdoorMemoryGenerator;
  int v3 = [(PGMemoryGenerator *)&v16 initWithMemoryGenerationContext:a3];
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 1;
    id v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    [(PGMemoryMomentRequirements *)v4->_momentRequirements setMinimumNumberOfRelevantAssets:2];
    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterMomentsWithNotEnoughScenesProcessed:1];
    uint64_t v7 = +[PGOverTheYearsMemoryConfiguration strictDefaultOverTheYearsMemoryConfiguration];
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v7;

    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setMinimumNumberOfRelevantAssets:13];
    uint64_t v9 = +[PGFeaturedTimePeriodMemoryConfiguration strictDefaultFeaturedYearMemoryConfiguration];
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumNumberOfRelevantAssets:13];
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