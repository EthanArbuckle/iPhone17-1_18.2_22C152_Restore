@interface PGYearInReviewMemoryGenerator
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (PGYearInReviewMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)featuredYearConfiguration;
- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4;
- (id)momentRequirements;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (id)titleGeneratorWithYear:(int64_t)a3 titleGenerationContext:(id)a4;
- (int64_t)year;
- (unint64_t)durationForCuration;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)_enumeratePotentialMemoriesWithGraph:(id)a3 usingBlock:(id)a4;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3;
- (void)setYear:(int64_t)a3;
@end

@implementation PGYearInReviewMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

- (id)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
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

- (void)setYear:(int64_t)a3
{
  self->_year = a3;
}

- (int64_t)year
{
  return self->_year;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  v11 = [a3 memoryFeatureNodes];
  v12 = +[PGGraphNodeCollection subsetInCollection:v11];

  if ([v12 count] == 1)
  {
    v13 = [v12 years];
    v14 = [v13 firstObject];
    uint64_t v15 = [v14 integerValue];

    v16 = [(PGYearInReviewMemoryGenerator *)self titleGeneratorWithYear:v15 titleGenerationContext:v10];
  }
  else
  {
    v17 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19[0] = 67109120;
      v19[1] = [v12 count];
      _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "[PGYearInReviewMemoryGenerator] One year node expected, found %d", (uint8_t *)v19, 8u);
    }

    v16 = 0;
  }

  return v16;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PGYearInReviewMemoryGenerator;
  v4 = [(PGMemoryGenerator *)&v6 keyAssetCurationOptionsWithTriggeredMemory:a3 inGraph:a4];
  [v4 setPrefilterAssetsWithFacesThreshold:2.22507386e-308];
  return v4;
}

- (unint64_t)durationForCuration
{
  return 23;
}

- (id)titleGeneratorWithYear:(int64_t)a3 titleGenerationContext:(id)a4
{
  id v5 = a4;
  objc_super v6 = [[PGBestOfTimeMemoryTitleGenerator alloc] initWithYear:a3 titleGenerationContext:v5];

  return v6;
}

- (void)_enumeratePotentialMemoriesWithGraph:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PGMemoryGenerator *)self controller];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__PGYearInReviewMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke;
  v12[3] = &unk_1E68E56B0;
  v12[4] = self;
  id v13 = v8;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v8;
  [v10 enumerateNodesWithLabel:@"Year" domain:400 usingBlock:v12];
}

void __81__PGYearInReviewMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 calendarUnitValue];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 168);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v6 == v7)
  {
    uint64_t v9 = v6;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__PGYearInReviewMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_2;
    v22[3] = &unk_1E68EAEE8;
    id v23 = *(id *)(a1 + 40);
    v25 = &v26;
    id v11 = v10;
    id v24 = v11;
    [v5 enumerateNeighborNodesThroughEdgesWithLabel:@"YEAR" domain:400 usingBlock:v22];
    if (*((unsigned char *)v27 + 24))
    {
      char v21 = 0;
      v12 = [*(id *)(a1 + 40) progressBlock];
      ((void (**)(void, char *, double))v12)[2](v12, &v21, 0.25);

      if (v21)
      {
        *a3 = 1;
      }
      else if ([*(id *)(a1 + 40) momentNodesHaveScenesProcessed:v11 inGraph:*(void *)(a1 + 48)])
      {
        id v13 = [[PGPotentialYearSummaryMemory alloc] initWithMomentNodes:v11];
        id v14 = (void *)MEMORY[0x1E4F1CAD0];
        id v15 = +[PGFeature featureWithType:1 node:v5];
        v16 = [v14 setWithObject:v15];
        [(PGPotentialMemory *)v13 setFeatures:v16];

        [(PGPotentialYearSummaryMemory *)v13 setYear:v9];
        [(PGPotentialMemory *)v13 computeContentScore];
        v17 = [(PGPotentialMemory *)v13 buildAssetCollectionUsingMemoryController:*(void *)(a1 + 40) withMinimumNumberOfAssets:0];
        if (v17)
        {
          [(PGPotentialMemory *)v13 setScore:1.0];
          v18 = [v5 name];
          [(PGPotentialMemory *)v13 setEventName:v18];

          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
        else
        {
          v19 = [*(id *)(a1 + 40) loggingConnection];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v20 = 0;
            _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_DEFAULT, "Memory Creation Request: Potential Memory is too short or out-of-sync.", v20, 2u);
          }
        }
      }
    }

    _Block_object_dispose(&v26, 8);
  }
}

void __81__PGYearInReviewMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 collection];
  v4 = [v3 momentNodes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__PGYearInReviewMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_3;
  v7[3] = &unk_1E68F1898;
  id v8 = *(id *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v6;
  long long v9 = v6;
  [v4 enumerateNodesUsingBlock:v7];
}

void __81__PGYearInReviewMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "anyBlockedFeatureIsHitByEvent:") & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= [v3 isInterestingForMemories];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  char v9 = 0;
  id v5 = (void (**)(id, void *, PGGraphFeatureNodeCollection *, unsigned char *))a4;
  id v6 = a3;
  uint64_t v7 = +[PGGraphNodeCollection nodesInGraph:v6];
  id v8 = [(MAElementCollection *)[PGGraphFeatureNodeCollection alloc] initWithGraph:v6];

  v5[2](v5, v7, v8, &v9);
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 5001;
  }
  int v4 = a3;
  id v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    char v9 = v7;
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (unint64_t)memoryCategory
{
  return 8;
}

- (PGYearInReviewMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PGYearInReviewMemoryGenerator;
  id v3 = [(PGMemoryGenerator *)&v10 initWithMemoryGenerationContext:a3];
  int v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    id v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterMomentsWithNotEnoughScenesProcessed:1];
    uint64_t v7 = objc_alloc_init(PGFeaturedTimePeriodMemoryConfiguration);
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = v7;

    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumNumberOfMomentsInterestingForMemories:1];
    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumNumberOfAssetsInExtendedCuration:13];
  }
  return v4;
}

@end