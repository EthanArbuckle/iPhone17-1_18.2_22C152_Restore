@interface PGPersonFoodieMemoryGenerator
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (PGPersonFoodieMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGPersonFoodieMemoryGenerator

- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3
{
  self->_requireFaceProcessingMeetsThresholdOverTime = a3;
}

- (BOOL)requireFaceProcessingMeetsThresholdOverTime
{
  return self->_requireFaceProcessingMeetsThresholdOverTime;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  v33[3] = *MEMORY[0x1E4F143B8];
  id v27 = a4;
  id v5 = a3;
  v6 = +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:@"Food" inGraph:v5];
  v26 = [v6 momentNodes];
  v7 = (void *)MEMORY[0x1E4F71F18];
  v8 = +[PGGraphMomentFeaturesEdge filter];
  v9 = [v8 outRelation];
  v33[0] = v9;
  v10 = +[PGGraphPersonNode filterExcludingMe];
  v11 = [v10 relation];
  v33[1] = v11;
  v12 = +[PGGraphPersonNode filterNameNotEmpty];
  v13 = [v12 relation];
  v33[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  v15 = [v7 chain:v14];

  v16 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v26 relation:v15 targetsClass:objc_opt_class()];
  v17 = +[PGFoodieMemoryGenerator incompatibleMomentNodesInGraph:v5];

  v18 = [v16 subtractingSourcesWith:v17];

  v19 = [v18 sources];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __87__PGPersonFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v31[3] = &unk_1E68EEE18;
  id v32 = v18;
  id v20 = v18;
  v21 = [v19 filteredCollectionUsingBlock:v31];

  v22 = [v20 intersectingSourcesWith:v21];

  v23 = [v22 transposed];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __87__PGPersonFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2;
  v28[3] = &unk_1E68ED660;
  id v29 = v6;
  id v30 = v27;
  id v24 = v27;
  id v25 = v6;
  [v23 enumerateTargetsBySourceWithBlock:v28];
}

BOOL __87__PGPersonFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) targetsForSources:a2];
  BOOL v3 = (unint64_t)[v2 count] < 6;

  return v3;
}

void __87__PGPersonFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 featureNodeCollection];
  v9 = [v7 featureNodeCollection];

  id v10 = [v8 collectionByFormingUnionWith:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 6003;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 6004;
  }
  id v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    v9 = v7;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (PGPersonFoodieMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PGPersonFoodieMemoryGenerator;
  result = [(PGFoodieMemoryGenerator *)&v4 initWithMemoryGenerationContext:a3];
  if (result) {
    result->_requireFaceProcessingMeetsThresholdOverTime = 1;
  }
  return result;
}

@end