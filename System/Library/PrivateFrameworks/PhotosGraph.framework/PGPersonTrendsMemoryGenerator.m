@interface PGPersonTrendsMemoryGenerator
- (BOOL)intersectRelevantAssetsForFeatures;
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (PGPersonTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4;
- (id)childOnlyPersonTrends;
- (id)momentRequirements;
- (id)trendType;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGPersonTrendsMemoryGenerator

- (void).cxx_destruct
{
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (BOOL)intersectRelevantAssetsForFeatures
{
  return self->_intersectRelevantAssetsForFeatures;
}

- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3
{
  self->_requireFaceProcessingMeetsThresholdOverTime = a3;
}

- (BOOL)requireFaceProcessingMeetsThresholdOverTime
{
  return self->_requireFaceProcessingMeetsThresholdOverTime;
}

- (id)childOnlyPersonTrends
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PlayTime";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PGTrendsMemoryGenerator *)self validSceneFeatureNodesInGraph:v6];
  if ([v8 count])
  {
    v9 = (void *)MEMORY[0x1E4F71F18];
    v10 = +[PGGraphMomentNode featureOfMoment];
    v30[0] = v10;
    v11 = +[PGGraphPersonNode filterExcludingMe];
    v12 = [v11 relation];
    v30[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    v14 = [v9 chain:v13];

    v15 = +[PGGraphPersonNodeCollection personNodesInAgeCategories:&unk_1F28D45C0 includingMe:0 inGraph:v6];
    v16 = [(PGPersonTrendsMemoryGenerator *)self childOnlyPersonTrends];
    v17 = (void *)MEMORY[0x1E4F71E88];
    v18 = +[PGGraphFeatureNodeCollection momentOfFeature];
    v19 = [v17 adjacencyWithSources:v8 relation:v18 targetsClass:objc_opt_class()];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __87__PGPersonTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
    v23[3] = &unk_1E68EAA78;
    id v24 = v14;
    id v25 = v16;
    id v26 = v15;
    v27 = self;
    id v28 = v6;
    id v29 = v7;
    id v20 = v15;
    id v21 = v16;
    id v22 = v14;
    [v19 enumerateTargetsBySourceWithBlock:v23];
  }
}

void __87__PGPersonTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  v8 = (void *)MEMORY[0x1E4F71E88];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = a3;
  v11 = [v8 adjacencyWithSources:v10 relation:v9 targetsClass:objc_opt_class()];

  v12 = [v11 transposed];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__PGPersonTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2;
  v17[3] = &unk_1E68EAA50;
  id v18 = *(id *)(a1 + 40);
  id v19 = v7;
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  v15 = *(void **)(a1 + 64);
  id v20 = v13;
  uint64_t v21 = v14;
  id v22 = v15;
  id v23 = *(id *)(a1 + 72);
  uint64_t v24 = a4;
  id v16 = v7;
  [v12 enumerateTargetsBySourceWithBlock:v17];
}

void __87__PGPersonTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v19 = a2;
  id v7 = a3;
  v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) labels];
  id v10 = [v9 anyObject];
  if (![v8 containsObject:v10])
  {

    goto LABEL_5;
  }
  char v11 = [*(id *)(a1 + 48) intersectsCollection:v19];

  if (v11)
  {
LABEL_5:
    v12 = [*(id *)(a1 + 40) featureNodeCollection];
    id v13 = [v19 featureNodeCollection];
    uint64_t v14 = [v12 collectionByFormingUnionWith:v13];

    v15 = *(void **)(a1 + 56);
    id v16 = [*(id *)(a1 + 40) labels];
    v17 = [v16 anyObject];
    uint64_t v18 = [v15 filteredMomentNodes:v7 withSceneLabel:v17 inGraph:*(void *)(a1 + 64)];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    **(unsigned char **)(a1 + 80) = *a4;

    id v7 = (id)v18;
  }
}

- (id)trendType
{
  return @"Person";
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 16003;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 16004;
  }
  v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (PGPersonTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PGPersonTrendsMemoryGenerator;
  v4 = [(PGTrendsMemoryGenerator *)&v9 initWithMemoryGenerationContext:a3 configurations:a4];
  v5 = v4;
  if (v4)
  {
    v4->_requireFaceProcessingMeetsThresholdOverTime = 1;
    v4->_intersectRelevantAssetsForFeatures = 1;
    id v6 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v5->_momentRequirements;
    v5->_momentRequirements = v6;

    [(PGMemoryMomentRequirements *)v5->_momentRequirements setMinimumNumberOfRelevantAssets:2];
    [(PGMemoryMomentRequirements *)v5->_momentRequirements setFilterMomentsWithNotEnoughScenesProcessed:1];
  }
  return v5;
}

@end