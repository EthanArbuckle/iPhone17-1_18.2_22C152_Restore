@interface PGRestaurantFoodieMemoryGenerator
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
@end

@implementation PGRestaurantFoodieMemoryGenerator

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[PGGraphNodeCollection nodesInGraph:v6];
  v8 = [v7 homeOrWorkNodes];
  v9 = [v8 addressNodes];
  v10 = [v9 momentNodes];

  v11 = +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:@"Food" inGraph:v6];
  v12 = [v11 momentNodes];
  v13 = +[PGGraphBusinessCategoryNodeCollection businessCategoryNodesForCategory:@"Restaurant" inGraph:v6];
  v14 = [v13 businessNodes];
  v15 = (void *)MEMORY[0x1E4F71E88];
  v16 = +[PGGraphMomentNode businessOfMoment];
  v17 = [v15 adjacencyWithSources:v12 relation:v16 targetsClass:objc_opt_class()];

  v18 = [v17 intersectingTargetsWith:v14];

  v19 = +[PGFoodieMemoryGenerator incompatibleMomentNodesInGraph:v6];

  v20 = [v18 subtractingSourcesWith:v19];

  v21 = [v20 subtractingSourcesWith:v10];

  v22 = [v21 sources];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __91__PGRestaurantFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v32[3] = &unk_1E68EEE18;
  id v33 = v21;
  id v23 = v21;
  v24 = [v22 filteredCollectionUsingBlock:v32];

  v25 = [v23 intersectingSourcesWith:v24];

  v26 = [v25 transposed];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __91__PGRestaurantFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2;
  v29[3] = &unk_1E68EEE40;
  id v30 = v11;
  id v31 = v5;
  id v27 = v5;
  id v28 = v11;
  [v26 enumerateTargetsBySourceWithBlock:v29];
}

BOOL __91__PGRestaurantFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) targetsForSources:a2];
  BOOL v3 = [v2 count] == 1;

  return v3;
}

void __91__PGRestaurantFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    return 6007;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 6008;
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

@end