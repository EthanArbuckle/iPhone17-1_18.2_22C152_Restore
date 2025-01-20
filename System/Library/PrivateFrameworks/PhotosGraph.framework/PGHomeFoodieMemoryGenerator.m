@interface PGHomeFoodieMemoryGenerator
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
@end

@implementation PGHomeFoodieMemoryGenerator

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:@"Food" inGraph:v6];
  v8 = [v7 momentNodes];
  v9 = +[PGGraphNodeCollection nodesInGraph:v6];
  v10 = [v9 homeNodes];
  v11 = [v10 addressNodes];

  v12 = (void *)MEMORY[0x1E4F71E88];
  v13 = +[PGGraphAddressNode momentOfAddress];
  v14 = [v12 adjacencyWithSources:v11 relation:v13 targetsClass:objc_opt_class()];

  v15 = [v14 intersectingTargetsWith:v8];

  v16 = +[PGFoodieMemoryGenerator incompatibleMomentNodesInGraph:v6];

  v17 = [v15 subtractingTargetsWith:v16];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__PGHomeFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v20[3] = &unk_1E68ED4B0;
  id v21 = v7;
  id v22 = v5;
  id v18 = v5;
  id v19 = v7;
  [v17 enumerateTargetsBySourceWithBlock:v20];
}

void __85__PGHomeFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
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
    return 6009;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 6010;
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