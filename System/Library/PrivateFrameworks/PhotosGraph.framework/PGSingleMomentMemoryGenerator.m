@interface PGSingleMomentMemoryGenerator
- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
@end

@implementation PGSingleMomentMemoryGenerator

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PGSingleMomentMemoryGenerator;
  v11 = [(PGMemoryGenerator *)&v27 relevantFeederForTriggeredMemory:a3 inGraph:v10 allowGuestAsset:v7 progressReporter:a6];
  v12 = [v11 assetFetchResult];
  v13 = (void *)MEMORY[0x1E4F38EB8];
  v14 = [(PGMemoryGenerator *)self memoryCurationSession];
  v15 = [v14 curationContext];
  v16 = [v13 clsAllAssetsFromFetchResult:v12 prefetchOptions:22 curationContext:v15];

  if ((unint64_t)[v16 count] > 0xC)
  {
    v26 = +[PGMemoryGeneratorUtils filterImportedAssetsWithoutLocationAndWithoutSceneOrPersonOverlapFromAllAssets:v16 withGraph:v10];
    id v18 = objc_alloc(MEMORY[0x1E4F39150]);
    v19 = [v26 allObjects];
    v20 = [v12 photoLibrary];
    v21 = [v12 fetchType];
    v22 = [v12 fetchPropertySets];
    v23 = (void *)[v18 initWithObjects:v19 photoLibrary:v20 fetchType:v21 fetchPropertySets:v22 identifier:0 registerIfNeeded:0];

    v24 = [(PGMemoryGenerator *)self memoryCurationSession];
    id v17 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v23 memoryCurationSession:v24 graph:v10];
  }
  else
  {
    id v17 = v11;
  }

  return v17;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = [v14 triggerTypes];
  int v21 = [v20 containsIndex:4];

  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F28C18]);
    v23 = [v14 creationDate];
    v24 = (void *)[v22 initWithStartDate:v23 duration:0.0];

    v25 = [PGTitleGenerator alloc];
    v26 = [v14 memoryMomentNodes];
    objc_super v27 = [v26 set];
    v28 = [(PGTitleGenerator *)v25 initWithMomentNodes:v27 referenceDateInterval:v24 keyAsset:0 curatedAssetCollection:0 assetCollection:0 type:1 titleGenerationContext:v18];

LABEL_5:
    goto LABEL_7;
  }
  v29 = [v14 triggerTypes];
  int v30 = [v29 containsIndex:11];

  if (v30)
  {
    v31 = (void *)MEMORY[0x1E4F76C68];
    v32 = [v14 creationDate];
    uint64_t v33 = [v31 yearFromDate:v32];

    v34 = [v14 memoryMomentNodes];
    v24 = [v34 anyNode];

    v35 = (void *)MEMORY[0x1E4F76C68];
    v36 = [v24 universalStartDate];
    uint64_t v37 = [v35 yearFromDate:v36];

    v28 = [[PGThrowbackThursdayMemoryTitleGenerator alloc] initWithMomentNode:v24 numberOfYearsAgo:v33 - v37 titleGenerationContext:v18];
    goto LABEL_5;
  }
  v39.receiver = self;
  v39.super_class = (Class)PGSingleMomentMemoryGenerator;
  v28 = [(PGMemoryGenerator *)&v39 titleGeneratorForTriggeredMemory:v14 withKeyAsset:v15 curatedAssets:v16 extendedCuratedAssets:v17 titleGenerationContext:v18 inGraph:v19];
LABEL_7:

  return v28;
}

- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v7 = +[PGGraphNodeCollection nodesInGraph:v5];
  v8 = [v7 interestingForMemoriesSubset];

  v9 = [v8 momentNodesWithMinimumNumberOfExtendedCuratedAssets:13];

  if ([v9 count])
  {
    id v10 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:16 inGraph:v5];
    v11 = [v10 momentNodes];
    v12 = [v9 collectionBySubtracting:v11];

    v13 = [(PGMemoryGenerator *)self momentNodesWithBlockedFeatureCache];
    id v14 = [v13 momentNodesWithBlockedFeature];

    id v15 = [v12 collectionBySubtracting:v14];

    id v16 = [(PGMemoryGenerator *)self memoryGenerationContext];
    id v17 = [v16 momentNodesAtSensitiveLocationsInGraph:v5];

    v9 = [v15 collectionBySubtracting:v17];

    id v18 = (void *)MEMORY[0x1E4F71F18];
    id v19 = +[PGGraphMomentNode dateOfMoment];
    v29[0] = v19;
    v20 = +[PGGraphDateNode monthDayOfDate];
    v29[1] = v20;
    int v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    id v22 = [v18 chain:v21];

    v23 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v9 relation:v22 targetsClass:objc_opt_class()];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __85__PGSingleMomentMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke;
    v27[3] = &unk_1E68E7F48;
    id v24 = v6;
    id v28 = v24;
    [v23 enumerateTargetsBySourceWithBlock:v27];
    id v25 = v24;
  }
  else
  {
    id v25 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v25;
}

void __85__PGSingleMomentMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  BOOL v7 = [v6 featureNodeCollection];
  v8 = [v5 featureNodeCollection];

  id v10 = [v7 collectionByFormingUnionWith:v8];

  v9 = [[PGGraphMemory alloc] initWithMemoryCategory:1 memoryCategorySubcategory:1001 momentNodes:v6 featureNodes:v10];
  [*(id *)(a1 + 32) addObject:v9];
}

@end