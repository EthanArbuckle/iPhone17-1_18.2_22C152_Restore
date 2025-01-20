@interface PGLocationTrendsMemoryGenerator
- (PGLocationTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4;
- (id)momentRequirements;
- (id)trendType;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
@end

@implementation PGLocationTrendsMemoryGenerator

- (void).cxx_destruct
{
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PGTrendsMemoryGenerator *)self validSceneFeatureNodesInGraph:v6];
  if ([v8 count])
  {
    v9 = (void *)MEMORY[0x1E4F71E88];
    v10 = +[PGGraphFeatureNodeCollection momentOfFeature];
    v11 = [v9 adjacencyWithSources:v8 relation:v10 targetsClass:objc_opt_class()];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __89__PGLocationTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
    v12[3] = &unk_1E68EF7B0;
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    [v11 enumerateTargetsBySourceWithBlock:v12];
  }
}

void __89__PGLocationTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  v8 = (void *)MEMORY[0x1E4F71E88];
  id v9 = a3;
  v10 = +[PGGraphMomentNode cityOfMoment];
  v11 = [v8 adjacencyWithSources:v9 relation:v10 targetsClass:objc_opt_class()];

  v12 = [v11 transposed];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__PGLocationTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2;
  v16[3] = &unk_1E68EF788;
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(a1 + 40);
  id v17 = v7;
  uint64_t v18 = v13;
  id v19 = v14;
  id v20 = *(id *)(a1 + 48);
  uint64_t v21 = a4;
  id v15 = v7;
  [v12 enumerateTargetsBySourceWithBlock:v16];
}

void __89__PGLocationTrendsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  v10 = [v7 featureNodeCollection];
  v11 = [v9 featureNodeCollection];

  v12 = [v10 collectionByFormingUnionWith:v11];

  uint64_t v13 = *(void **)(a1 + 40);
  id v14 = [*(id *)(a1 + 32) labels];
  id v15 = [v14 anyObject];
  id v16 = [v13 filteredMomentNodes:v8 withSceneLabel:v15 inGraph:*(void *)(a1 + 48)];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  **(unsigned char **)(a1 + 64) = *a4;
}

- (id)trendType
{
  return @"Location";
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 16005;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 16006;
  }
  v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (PGLocationTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PGLocationTrendsMemoryGenerator;
  v4 = [(PGTrendsMemoryGenerator *)&v8 initWithMemoryGenerationContext:a3 configurations:a4];
  if (v4)
  {
    v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    [(PGMemoryMomentRequirements *)v4->_momentRequirements setMinimumNumberOfRelevantAssets:2];
    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterMomentsWithNotEnoughScenesProcessed:1];
  }
  return v4;
}

@end