@interface PGMyPetAndPersonMemoryGenerator
- (BOOL)intersectRelevantAssetsForFeatures;
- (PGMyPetAndPersonMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)featuredSeasonConfiguration;
- (id)featuredYearConfiguration;
- (id)momentRequirements;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
@end

@implementation PGMyPetAndPersonMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredSeasonConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

- (BOOL)intersectRelevantAssetsForFeatures
{
  return self->_intersectRelevantAssetsForFeatures;
}

- (id)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (id)featuredSeasonConfiguration
{
  return self->_featuredSeasonConfiguration;
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[PGGraphNodeCollection nodesInGraph:v5];
  v8 = (void *)MEMORY[0x1E4F71E88];
  v9 = +[PGGraphFeatureNodeCollection momentOfFeature];
  v10 = [v8 adjacencyWithSources:v7 relation:v9 targetsClass:objc_opt_class()];

  v11 = (void *)MEMORY[0x1E4F71F18];
  v12 = +[PGGraphMomentNode featureOfMoment];
  v33[0] = v12;
  v13 = +[PGGraphPersonNode filterIncludingMe];
  v14 = [v13 relation];
  v33[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v16 = [v11 chain:v15];

  id v17 = objc_alloc_init(MEMORY[0x1E4F71E60]);
  v18 = (void *)MEMORY[0x1E4F71E88];
  v19 = [v10 targets];
  v20 = [v18 adjacencyWithSources:v19 relation:v16 targetsClass:objc_opt_class()];
  v21 = [v20 transposed];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __89__PGMyPetAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v27[3] = &unk_1E68EFD60;
  id v28 = v17;
  id v29 = v21;
  id v31 = v10;
  id v32 = v6;
  id v30 = v5;
  id v22 = v10;
  id v23 = v5;
  id v24 = v6;
  id v25 = v21;
  id v26 = v17;
  [v22 enumerateTargetsBySourceWithBlock:v27];
}

void __89__PGMyPetAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  v8 = *(void **)(a1 + 32);
  id v9 = a3;
  v10 = [v7 elementIdentifiers];
  objc_msgSend(v8, "addIdentifier:", objc_msgSend(v10, "firstElement"));

  v11 = [*(id *)(a1 + 40) intersectingTargetsWith:v9];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __89__PGMyPetAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2;
  v22[3] = &unk_1E68EFD10;
  id v24 = *(id *)(a1 + 64);
  id v12 = v7;
  id v23 = v12;
  uint64_t v25 = a4;
  [v11 enumerateTargetsBySourceWithBlock:v22];
  v13 = [(MAElementCollection *)[PGGraphPetNodeCollection alloc] initWithGraph:*(void *)(a1 + 48) elementIdentifiers:*(void *)(a1 + 32)];
  v14 = [*(id *)(a1 + 56) intersectingTargetsWith:v9];

  v15 = [v14 subtractingSourcesWith:v13];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__PGMyPetAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_3;
  v18[3] = &unk_1E68EFD38;
  id v16 = *(id *)(a1 + 64);
  id v19 = v12;
  id v20 = v16;
  uint64_t v21 = a4;
  id v17 = v12;
  [v15 enumerateTargetsBySourceWithBlock:v18];
}

void __89__PGMyPetAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = a3;
  id v10 = a2;
  v11 = [v8 featureNodeCollection];
  id v12 = [v10 featureNodeCollection];

  v13 = [v11 collectionByFormingUnionWith:v12];
  (*(void (**)(uint64_t, id, void *, unsigned char *))(v7 + 16))(v7, v9, v13, a4);

  **(unsigned char **)(a1 + 48) = *a4;
}

void __89__PGMyPetAndPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_3(void *a1, void *a2, void *a3, unsigned char *a4)
{
  v8 = (void *)a1[4];
  uint64_t v7 = a1[5];
  id v9 = a3;
  id v10 = a2;
  v11 = [v8 featureNodeCollection];
  id v12 = [v10 featureNodeCollection];

  v13 = [v11 collectionByFormingUnionWith:v12];
  (*(void (**)(uint64_t, id, void *, void))(v7 + 16))(v7, v9, v13, a1[6]);

  *(unsigned char *)a1[6] = *a4;
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 3) {
    return 7004;
  }
  int v4 = a3;
  id v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (PGMyPetAndPersonMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PGMyPetAndPersonMemoryGenerator;
  v3 = [(PGMyPetMemoryGenerator *)&v9 initWithMemoryGenerationContext:a3];
  if (v3)
  {
    int v4 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v3->_momentRequirements;
    v3->_momentRequirements = v4;

    [(PGMemoryMomentRequirements *)v3->_momentRequirements setMinimumNumberOfRelevantAssets:1];
    [(PGMemoryMomentRequirements *)v3->_momentRequirements setFilterMomentsWithNotEnoughScenesProcessed:1];
    featuredSeasonConfiguration = v3->_featuredSeasonConfiguration;
    v3->_featuredSeasonConfiguration = 0;

    featuredYearConfiguration = v3->_featuredYearConfiguration;
    v3->_featuredYearConfiguration = 0;

    v3->_intersectRelevantAssetsForFeatures = 1;
  }
  return v3;
}

@end