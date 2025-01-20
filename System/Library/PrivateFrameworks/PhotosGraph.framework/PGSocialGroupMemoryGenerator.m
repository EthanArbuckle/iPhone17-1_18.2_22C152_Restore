@interface PGSocialGroupMemoryGenerator
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (BOOL)semanticalDedupingEnabledForExtendedCuration;
- (PGSocialGroupMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)_meNodeAsCollectionInGraph:(id)a3;
- (id)allFeatureNodesForMemoryNodeWithFeatureNodes:(id)a3;
- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5;
- (id)featuredYearConfiguration;
- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4;
- (id)momentRequirements;
- (id)overTheYearsConfiguration;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (unint64_t)durationForCuration;
- (unint64_t)durationForExtendedCuration;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3;
- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGSocialGroupMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
  objc_storeStrong((id *)&self->_meNodeAsCollection, 0);
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
  if ([v13 count])
  {
    v14 = [v10 memoryMomentNodes];
    v15 = [v14 temporarySet];

    v16 = +[PGPeopleMemoryTitleGenerator peopleOverTimeTimeTitleOptionsWithMomentNodes:v15];
    v17 = +[PGGraphNodeCollection subsetInCollection:v12];
    if ([v17 count] == 1) {
      [v16 setFeaturedYearNodes:v17];
    }
    v18 = [PGPeopleMemoryTitleGenerator alloc];
    v19 = [v13 temporarySet];
    v20 = [(PGPeopleMemoryTitleGenerator *)v18 initWithMomentNodes:v15 personNodes:v19 timeTitleOptions:v16 type:2 titleGenerationContext:v11];
  }
  else
  {
    v21 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "[PGSocialGroupMemoryGenerator] No person nodes found", v23, 2u);
    }

    v20 = 0;
  }

  return v20;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)PGSocialGroupMemoryGenerator;
  id v7 = a5;
  v8 = [(PGMemoryGenerator *)&v13 curationOptionsWithRequiredAssetUUIDs:a3 eligibleAssetUUIDs:a4 triggeredMemory:v7];
  v9 = objc_msgSend(v7, "memoryFeatureNodes", v13.receiver, v13.super_class);

  id v10 = +[PGGraphNodeCollection subsetInCollection:v9];

  id v11 = [v10 localIdentifiers];
  [v8 setPersonLocalIdentifiersToFocus:v11];

  [v8 setMinimumNumberOfItems:15];
  [v8 setFailIfMinimumDurationNotReached:1];

  return v8;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)PGSocialGroupMemoryGenerator;
  id v5 = a3;
  v6 = [(PGMemoryGenerator *)&v16 keyAssetCurationOptionsWithTriggeredMemory:v5 inGraph:a4];
  id v7 = objc_msgSend(v5, "memoryFeatureNodes", v16.receiver, v16.super_class);
  v8 = +[PGGraphNodeCollection subsetInCollection:v7];

  v9 = [v5 memoryMomentNodes];

  id v10 = [v9 personNodes];
  id v11 = +[PGGraphNodeCollection subsetInCollection:v10];

  v12 = [v8 localIdentifiers];
  objc_super v13 = [v11 localIdentifiers];
  v14 = [v12 setByAddingObjectsFromSet:v13];
  [v6 setReferencePersonLocalIdentifiers:v14];

  [v6 setMinimumNumberOfReferencePersons:2];
  return v6;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v6 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 memoryFeatureNodes];
  v12 = +[PGGraphNodeCollection subsetInCollection:v11];

  objc_super v13 = [v10 memoryMomentNodes];

  v14 = +[PGGraphEdgeCollection edgesFromNodes:v13 toNodes:v12];

  v15 = [v14 allRelevantAssetLocalIdentifiers];
  objc_super v16 = [v15 allObjects];
  v17 = [(PGMemoryGenerator *)self memoryCurationSession];
  v18 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetLocalIdentifiers:v16 memoryCurationSession:v17 graph:v9 allowGuestAsset:v6];

  return v18;
}

- (BOOL)semanticalDedupingEnabledForExtendedCuration
{
  return 0;
}

- (unint64_t)durationForExtendedCuration
{
  return 10;
}

- (unint64_t)durationForCuration
{
  return 22;
}

- (id)_meNodeAsCollectionInGraph:(id)a3
{
  meNodeAsCollection = self->_meNodeAsCollection;
  if (!meNodeAsCollection)
  {
    id v5 = [a3 meNodeCollection];
    BOOL v6 = self->_meNodeAsCollection;
    self->_meNodeAsCollection = v5;

    meNodeAsCollection = self->_meNodeAsCollection;
  }
  return meNodeAsCollection;
}

- (id)allFeatureNodesForMemoryNodeWithFeatureNodes:(id)a3
{
  id v4 = a3;
  id v5 = +[PGGraphNodeCollection subsetInCollection:v4];
  BOOL v6 = [v5 personNodes];
  if ([v6 count] == 1)
  {
    id v7 = [v4 graph];
    v8 = [(PGSocialGroupMemoryGenerator *)self _meNodeAsCollectionInGraph:v7];

    uint64_t v9 = [v6 collectionByFormingUnionWith:v8];

    BOOL v6 = (void *)v9;
  }
  id v10 = [v4 collectionByFormingUnionWith:v6];

  return v10;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  BOOL v6 = +[PGGraphNodeCollection nodesInGraph:a3];
  id v7 = (void *)MEMORY[0x1E4F71E88];
  v8 = +[PGGraphFeatureNodeCollection momentOfFeature];
  uint64_t v9 = [v7 adjacencyWithSources:v6 relation:v8 targetsClass:objc_opt_class()];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__PGSocialGroupMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v11[3] = &unk_1E68E7DE8;
  id v12 = v5;
  id v10 = v5;
  [v9 enumerateTargetsBySourceWithBlock:v11];
}

void __86__PGSocialGroupMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
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
    return 3001;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 3002;
  }
  id v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (unint64_t)memoryCategory
{
  return 6;
}

- (PGSocialGroupMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PGSocialGroupMemoryGenerator;
  int v3 = [(PGMemoryGenerator *)&v12 initWithMemoryGenerationContext:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 1;
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
    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setAboveMomentAverageContentScoreThreshold:0.5];
    uint64_t v9 = +[PGFeaturedTimePeriodMemoryConfiguration strictDefaultFeaturedYearMemoryConfiguration];
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumNumberOfRelevantAssets:13];
    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setAboveMomentAverageContentScoreThreshold:0.5];
  }
  return v4;
}

@end