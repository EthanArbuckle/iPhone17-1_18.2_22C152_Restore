@interface PGPlaceRegionMemoryGenerator
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (PGPlaceRegionMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5;
- (id)featuredYearConfiguration;
- (id)momentRequirements;
- (id)overTheYearsConfiguration;
- (id)relevantCurationFeederForTriggeredMemory:(id)a3 relevantFeeder:(id)a4 inGraph:(id)a5 allowGuestAsset:(BOOL)a6 progressReporter:(id)a7;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)relevantFeederWithScenedAssetLocalIdentifiers:(id)a3 assetFetchResult:(id)a4 graph:(id)a5 allowGuestAsset:(BOOL)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (unint64_t)durationForCuration;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGPlaceRegionMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
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

  v14 = [PGPlaceRegionMemoryTitleGenerator alloc];
  v15 = [v13 temporarySet];
  v16 = [v12 anyNode];
  v17 = [(PGPlaceMemoryTitleGenerator *)v14 initWithMomentNodes:v15 placeNode:v16 titleGenerationContext:v9];

  v18 = +[PGGraphNodeCollection subsetInCollection:v11];
  if ([v18 count] == 1) {
    [(PGTitleGenerator *)v17 setFeaturedYearNodes:v18];
  }

  return v17;
}

- (id)relevantCurationFeederForTriggeredMemory:(id)a3 relevantFeeder:(id)a4 inGraph:(id)a5 allowGuestAsset:(BOOL)a6 progressReporter:(id)a7
{
  BOOL v7 = a6;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = [v10 memoryFeatureNodes];
  v13 = +[PGGraphNodeCollection subsetInCollection:v12];

  if ([v13 count] == 1)
  {
    v14 = [v10 memoryMomentNodes];
    v15 = +[PGGraphEdgeCollection edgesFromNodes:v14 toNodes:v13];

    if ([v15 count])
    {
      v16 = [v15 allRelevantAssetLocalIdentifiers];
      v17 = [v16 allObjects];
      v18 = [(PGMemoryGenerator *)self memoryCurationSession];
      v19 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetLocalIdentifiers:v17 memoryCurationSession:v18 graph:v11 allowGuestAsset:v7];

      goto LABEL_10;
    }
    v20 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22[0]) = 0;
      _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "[PGPlaceRegionMemoryGenerator] No moment feature edges found", (uint8_t *)v22, 2u);
    }
  }
  else
  {
    v15 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v22[0] = 67109120;
      v22[1] = [v13 count];
      _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "[PGPlaceRegionMemoryGenerator] One ROI node expected, found %d", (uint8_t *)v22, 8u);
    }
  }
  v19 = 0;
LABEL_10:

  return v19;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v28 = a5;
  id v29 = a4;
  id v8 = a3;
  id v9 = [v8 memoryFeatureNodes];
  v30 = +[PGGraphNodeCollection subsetInCollection:v9];

  id v10 = [v8 memoryMomentNodes];
  v27 = +[PGGraphEdgeCollection edgesFromNodes:v10 toNodes:v30];

  id v11 = [v27 allRelevantAssetLocalIdentifiers];
  v12 = [v11 allObjects];

  v13 = (void *)MEMORY[0x1E4F38EE8];
  v14 = [v8 memoryMomentNodes];

  v15 = [v14 localIdentifiers];
  v16 = [v15 allObjects];
  v17 = [(PGMemoryGenerator *)self memoryCurationSession];
  v18 = [v17 photoLibrary];
  v19 = [v18 librarySpecificFetchOptions];
  v20 = [v13 fetchAssetCollectionsWithLocalIdentifiers:v16 options:v19];

  v21 = [(PGMemoryGenerator *)self memoryCurationSession];
  v22 = [v21 curationManager];
  uint64_t v23 = [v22 defaultAssetFetchOptionsForMemories];

  [v23 setIncludeGuestAssets:v28];
  v24 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollections:v20 options:v23];
  v25 = [(PGPlaceRegionMemoryGenerator *)self relevantFeederWithScenedAssetLocalIdentifiers:v12 assetFetchResult:v24 graph:v29 allowGuestAsset:v28];

  return v25;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PGPlaceRegionMemoryGenerator;
  v5 = [(PGMemoryGenerator *)&v7 curationOptionsWithRequiredAssetUUIDs:a3 eligibleAssetUUIDs:a4 triggeredMemory:a5];
  [v5 setMinimumNumberOfItems:15];
  [v5 setFailIfMinimumDurationNotReached:1];
  return v5;
}

- (id)relevantFeederWithScenedAssetLocalIdentifiers:(id)a3 assetFetchResult:(id)a4 graph:(id)a5 allowGuestAsset:(BOOL)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 fetchedObjects];
  v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];

  v14 = +[PGCurationManager filteredAssetsFromAssets:v12 withContextualAssetLocalIdentifiers:v13 approximateTimeDistance:300.0];

  if ([v14 count])
  {
    id v15 = objc_alloc(MEMORY[0x1E4F39150]);
    v16 = [v9 photoLibrary];
    v17 = [v9 fetchPropertySets];
    v18 = (void *)[v15 initWithObjects:v14 photoLibrary:v16 fetchType:0 fetchPropertySets:v17 identifier:0 registerIfNeeded:0];

    v19 = [(PGMemoryGenerator *)self memoryCurationSession];
    v20 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v18 memoryCurationSession:v19 graph:v10];
  }
  else
  {
    v21 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "[PGPlaceRegionMemoryGenerator] No extended scened assets found", v23, 2u);
    }

    v20 = 0;
  }

  return v20;
}

- (unint64_t)durationForCuration
{
  return 23;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  v6 = +[PGGraphNodeCollection nodesInGraph:a3];
  objc_super v7 = (void *)MEMORY[0x1E4F71E88];
  id v8 = +[PGGraphFeatureNodeCollection momentOfFeature];
  id v9 = [v7 adjacencyWithSources:v6 relation:v8 targetsClass:objc_opt_class()];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__PGPlaceRegionMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v11[3] = &unk_1E68E75E8;
  id v12 = v5;
  id v10 = v5;
  [v9 enumerateTargetsBySourceWithBlock:v11];
}

void __86__PGPlaceRegionMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
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
    return 10001;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 10002;
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
  return 13;
}

- (PGPlaceRegionMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PGPlaceRegionMemoryGenerator;
  int v3 = [(PGMemoryGenerator *)&v12 initWithMemoryGenerationContext:a3];
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    id v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterUninterestingForMemories:1];
    [(PGMemoryMomentRequirements *)v4->_momentRequirements setMinimumNumberOfRelevantAssets:1];
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