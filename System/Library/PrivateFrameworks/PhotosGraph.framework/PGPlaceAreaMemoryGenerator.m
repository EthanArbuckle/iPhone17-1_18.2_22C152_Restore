@interface PGPlaceAreaMemoryGenerator
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (PGPlaceAreaMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)_addressNodesByAreaNodeInGraph:(id)a3;
- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5;
- (id)featuredYearConfiguration;
- (id)momentRequirements;
- (id)overTheYearsConfiguration;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (unint64_t)durationForCuration;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (unint64_t)numberOfRelevantAssetsForMomentNodes:(id)a3 featureNodes:(id)a4;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGPlaceAreaMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
  objc_storeStrong((id *)&self->_addressNodesByAreaNode, 0);
}

- (id)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (id)overTheYearsConfiguration
{
  return self->_overTheYearsConfiguration;
}

- (id)momentRequirements
{
  return self->_momentRequirements;
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
  v12 = +[PGGraphNodeCollection subsetInCollection:v11];
  v13 = [v10 memoryMomentNodes];

  v14 = [PGPlaceMemoryTitleGenerator alloc];
  v15 = [v13 temporarySet];
  v16 = [v12 anyNode];
  v17 = [(PGPlaceMemoryTitleGenerator *)v14 initWithMomentNodes:v15 placeNode:v16 titleGenerationContext:v9];

  v18 = +[PGGraphNodeCollection subsetInCollection:v11];
  if ([v18 count] == 1) {
    [(PGTitleGenerator *)v17 setFeaturedYearNodes:v18];
  }

  return v17;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [v9 memoryFeatureNodes];
  v13 = +[PGGraphNodeCollection subsetInCollection:v12];

  if ([v13 count] == 1)
  {
    v14 = [v9 memoryMomentNodes];
    v15 = [v13 anyNode];
    v16 = [(PGMemoryGenerator *)self memoryCurationSession];
    v17 = [v16 curationManager];
    v18 = +[PGMemoryGenerationHelper assetFetchResultForMomentNodes:v14 inLocationOrAreaNode:v15 requireInteresting:0 curationManager:v17 progressReporter:v11];

    v19 = [(PGMemoryGenerator *)self memoryCurationSession];
    v20 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v18 memoryCurationSession:v19 graph:v10];
  }
  else
  {
    v21 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23[0] = 67109120;
      v23[1] = [v13 count];
      _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "[PGPlaceAreaMemoryGenerator] One AOI node expected, found %d", (uint8_t *)v23, 8u);
    }

    v20 = 0;
  }

  return v20;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PGPlaceAreaMemoryGenerator;
  v5 = [(PGMemoryGenerator *)&v7 curationOptionsWithRequiredAssetUUIDs:a3 eligibleAssetUUIDs:a4 triggeredMemory:a5];
  [v5 setMinimumNumberOfItems:15];
  [v5 setFailIfMinimumDurationNotReached:1];
  return v5;
}

- (unint64_t)durationForCuration
{
  return 23;
}

- (unint64_t)numberOfRelevantAssetsForMomentNodes:(id)a3 featureNodes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = +[PGGraphNodeCollection subsetInCollection:v7];
    id v9 = [v6 graph];
    id v10 = [(PGPlaceAreaMemoryGenerator *)self _addressNodesByAreaNodeInGraph:v9];

    id v11 = [v10 targetsForSources:v8];
    v12 = +[PGGraphEdgeCollection edgesFromNodes:v6 toNodes:v11];
    unint64_t v13 = [v12 numberOfAssets];
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (id)_addressNodesByAreaNodeInGraph:(id)a3
{
  addressNodesByAreaNode = self->_addressNodesByAreaNode;
  if (!addressNodesByAreaNode)
  {
    id v5 = a3;
    id v6 = [v5 supersetCityNodes];
    id v7 = [v6 addressNodes];
    v8 = +[PGGraphAreaNode nonBlockedFilter];
    id v9 = +[PGGraphNamedLocationNode filterBySettingNameNotEmptyPropertyOnFilter:v8];

    id v10 = +[MANodeCollection nodesMatchingFilter:v9 inGraph:v5];

    id v11 = (void *)MEMORY[0x1E4F71E88];
    v12 = +[PGGraphAreaNode addressOfArea];
    unint64_t v13 = [v11 adjacencyWithSources:v10 relation:v12 targetsClass:objc_opt_class()];

    v14 = [v13 subtractingTargetsWith:v7];
    v15 = self->_addressNodesByAreaNode;
    self->_addressNodesByAreaNode = v14;

    addressNodesByAreaNode = self->_addressNodesByAreaNode;
  }
  return addressNodesByAreaNode;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [(PGPlaceAreaMemoryGenerator *)self _addressNodesByAreaNodeInGraph:v7];
  id v9 = (void *)MEMORY[0x1E4F71F18];
  id v10 = +[PGGraphAreaNode addressOfArea];
  v24[0] = v10;
  id v11 = +[PGGraphAddressNode momentOfAddress];
  v24[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  unint64_t v13 = [v9 chain:v12];

  v14 = (void *)MEMORY[0x1E4F71E88];
  v15 = [v8 sources];
  v16 = [v14 adjacencyWithSources:v15 relation:v13 targetsClass:objc_opt_class()];

  v17 = +[PGGraphNodeCollection nodesInGraph:v7];

  v18 = [v17 addressNodes];
  v19 = [v18 momentNodes];
  v20 = [v16 subtractingTargetsWith:v19];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __84__PGPlaceAreaMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v22[3] = &unk_1E68E5A10;
  id v23 = v6;
  id v21 = v6;
  [v20 enumerateTargetsBySourceWithBlock:v22];
}

void __84__PGPlaceAreaMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  id v8 = [a2 featureNodeCollection];
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 9003;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 9004;
  }
  id v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
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
  return 14;
}

- (PGPlaceAreaMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PGPlaceAreaMemoryGenerator;
  int v3 = [(PGMemoryGenerator *)&v12 initWithMemoryGenerationContext:a3];
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    id v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterUninterestingForMemories:1];
    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterMomentsWithNotEnoughScenesProcessed:1];
    uint64_t v7 = +[PGOverTheYearsMemoryConfiguration strictDefaultOverTheYearsMemoryConfiguration];
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v7;

    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setMinimumNumberOfRelevantAssets:13];
    uint64_t v9 = +[PGFeaturedTimePeriodMemoryConfiguration strictDefaultFeaturedYearMemoryConfiguration];
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumNumberOfRelevantAssets:13];
  }
  return v4;
}

@end