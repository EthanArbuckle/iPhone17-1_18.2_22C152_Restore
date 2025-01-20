@interface PGMyPetOutdoorMemoryGenerator
- (PGMyPetOutdoorMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)featuredSeasonConfiguration;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
@end

@implementation PGMyPetOutdoorMemoryGenerator

- (void).cxx_destruct
{
}

- (id)featuredSeasonConfiguration
{
  return self->_featuredSeasonConfiguration;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  v18.receiver = self;
  v18.super_class = (Class)PGMyPetOutdoorMemoryGenerator;
  id v13 = a3;
  v14 = [(PGMyPetMemoryGenerator *)&v18 titleGeneratorForTriggeredMemory:v13 withKeyAsset:a4 curatedAssets:a5 extendedCuratedAssets:a6 titleGenerationContext:a7 inGraph:a8];
  objc_msgSend(v14, "setUseAdventureTitle:", 1, v18.receiver, v18.super_class);
  v15 = [v13 memoryFeatureNodes];

  v16 = +[PGGraphNodeCollection subsetInCollection:v15];

  if ([v16 count] == 1) {
    [v14 setFeaturedYearNodes:v16];
  }

  return v14;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F71F18];
  id v7 = a3;
  v8 = +[PGGraphMomentNode featureOfMoment];
  v19[0] = v8;
  v9 = +[PGGraphPetNode filter];
  v10 = [v9 relation];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v12 = [v6 chain:v11];

  id v13 = +[PGMemoryGeneratorUtils outdoorROIMomentNodesNotAtHomeOrFrequentLocationInGraph:v7 useMomentFeatureEdges:0];

  v14 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v13 relation:v12 targetsClass:objc_opt_class()];
  v15 = [v14 transposed];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__PGMyPetOutdoorMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v17[3] = &unk_1E68EE188;
  id v18 = v5;
  id v16 = v5;
  [v15 enumerateTargetsBySourceWithBlock:v17];
}

void __87__PGMyPetOutdoorMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
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
    return 7005;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 7006;
  }
  id v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    v9 = v7;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (unint64_t)memoryCategory
{
  return 28;
}

- (PGMyPetOutdoorMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PGMyPetOutdoorMemoryGenerator;
  int v3 = [(PGMyPetMemoryGenerator *)&v7 initWithMemoryGenerationContext:a3];
  v4 = v3;
  if (v3)
  {
    featuredSeasonConfiguration = v3->_featuredSeasonConfiguration;
    v3->_featuredSeasonConfiguration = 0;
  }
  return v4;
}

@end