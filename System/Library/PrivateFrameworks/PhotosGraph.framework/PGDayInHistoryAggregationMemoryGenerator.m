@interface PGDayInHistoryAggregationMemoryGenerator
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (PGDayInHistoryAggregationMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)chapterTitleGeneratorForTriggeredMemory:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 titleGenerationContext:(id)a6 inGraph:(id)a7;
- (id)featuredYearConfiguration;
- (id)momentRequirements;
- (id)overTheYearsConfiguration;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (unint64_t)durationForCuration;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3;
- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGDayInHistoryAggregationMemoryGenerator

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

- (id)chapterTitleGeneratorForTriggeredMemory:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 titleGenerationContext:(id)a6 inGraph:(id)a7
{
  id v7 = a3;
  v8 = [[PGYearChapterTitleGenerator alloc] initWithTriggeredMemory:v7];

  return v8;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  v9 = (objc_class *)MEMORY[0x1E4F28C18];
  id v10 = a7;
  id v11 = a3;
  id v12 = [v9 alloc];
  v13 = [v11 creationDate];
  v14 = (void *)[v12 initWithStartDate:v13 duration:0.0];

  v15 = [PGDayInHistoryAggregationMemoryTitleGenerator alloc];
  v16 = [v11 memoryMomentNodes];

  v17 = [v16 set];
  v18 = [(PGDayInHistoryAggregationMemoryTitleGenerator *)v15 initWithMomentNodes:v17 referenceDateInterval:v14 titleGenerationContext:v10];

  return v18;
}

- (unint64_t)durationForCuration
{
  return 23;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = +[PGGraphNodeCollection nodesInGraph:a3];
  id v7 = (void *)MEMORY[0x1E4F71F18];
  v8 = +[PGGraphMonthDayNodeCollection dateOfMonthDay];
  v16[0] = v8;
  v9 = +[PGGraphDateNode momentOfDate];
  v16[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  id v11 = [v7 chain:v10];

  id v12 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v6 relation:v11 targetsClass:objc_opt_class()];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98__PGDayInHistoryAggregationMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v14[3] = &unk_1E68EAA08;
  id v15 = v5;
  id v13 = v5;
  [v12 enumerateTargetsBySourceWithBlock:v14];
}

void __98__PGDayInHistoryAggregationMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  id v8 = [a2 featureNodeCollection];
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 3) {
    return 1002;
  }
  int v4 = a3;
  id v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    v9 = v7;
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (unint64_t)memoryCategory
{
  return 23;
}

- (PGDayInHistoryAggregationMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PGDayInHistoryAggregationMemoryGenerator;
  v3 = [(PGMemoryGenerator *)&v10 initWithMemoryGenerationContext:a3];
  int v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 1;
    id v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    [(PGMemoryMomentRequirements *)v4->_momentRequirements setMinimumNumberOfAssetsInExtendedCuration:7];
    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterUninterestingForMemories:1];
    id v7 = objc_alloc_init(PGOverTheYearsMemoryConfiguration);
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = v7;

    [(PGOverTheYearsMemoryConfiguration *)v4->_overTheYearsConfiguration setMinimumNumberOfYears:3];
    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setMinimumNumberOfMoments:3];
    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setMinimumNumberOfAssetsInExtendedCuration:15];
    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setAllMomentsMustHaveFacesProcessed:1];
    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setAllMomentsMustHaveScenesProcessed:1];
  }
  return v4;
}

@end