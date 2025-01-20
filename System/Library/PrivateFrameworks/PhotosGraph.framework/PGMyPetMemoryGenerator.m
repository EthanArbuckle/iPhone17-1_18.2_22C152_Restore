@interface PGMyPetMemoryGenerator
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (PGMyPetMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)featuredSeasonConfiguration;
- (id)featuredYearConfiguration;
- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4;
- (id)momentRequirements;
- (id)overTheYearsConfiguration;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (unint64_t)durationForCuration;
- (unint64_t)durationForExtendedCuration;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3;
- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGMyPetMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredSeasonConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

- (id)featuredSeasonConfiguration
{
  return self->_featuredSeasonConfiguration;
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

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a7;
  v12 = [v10 memoryFeatureNodes];
  v13 = +[PGGraphNodeCollection subsetInCollection:v12];
  if ([v13 count] && (unint64_t)objc_msgSend(v13, "count") < 3)
  {
    v16 = [PGPetMemoryTitleGenerator alloc];
    v17 = [v10 memoryMomentNodes];
    v18 = [v17 temporarySet];
    v14 = [(PGPetMemoryTitleGenerator *)v16 initWithMomentNodes:v18 type:0 titleGenerationContext:v11];

    [v14 setPetNodes:v13];
    v19 = +[PGGraphNodeCollection subsetInCollection:v12];
    if ([v19 count])
    {
      v20 = [v19 anyNode];
      v21 = [v20 name];

      if (![v21 length])
      {
        v24 = [(PGMemoryGenerator *)self loggingConnection];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v26 = [v19 description];
          int v27 = 138412290;
          v28 = v26;
          _os_log_error_impl(&dword_1D1805000, v24, OS_LOG_TYPE_ERROR, "[PGMyPetMemoryGenerator] No season name found for season node in collection %@", (uint8_t *)&v27, 0xCu);
        }
        v15 = 0;
        goto LABEL_18;
      }
      [v14 setSeasonName:v21];
    }
    v22 = +[PGGraphNodeCollection subsetInCollection:v12];
    if ([v22 count] || (unint64_t)objc_msgSend(v13, "count") >= 2)
    {
      [v14 setUsePetAndPersonTitle:1];
      [v14 setPersonNodeAsCollection:v22];
    }
    v23 = +[PGGraphNodeCollection subsetInCollection:v12];
    if ([v23 count] == 1) {
      [v14 setFeaturedYearNodes:v23];
    }
    v15 = v14;

LABEL_18:
    goto LABEL_19;
  }
  v14 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v27 = 67109120;
    LODWORD(v28) = [v13 count];
    _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "[PGMyPetMemoryGenerator] At least one and at most two pet nodes expected, found %d", (uint8_t *)&v27, 8u);
  }
  v15 = 0;
LABEL_19:

  return v15;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v29 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [v9 memoryFeatureNodes];
  v13 = +[PGGraphNodeCollection subsetInCollection:v12];
  if ([v13 count] && (unint64_t)objc_msgSend(v13, "count") < 3)
  {
    v14 = [v9 memoryMomentNodes];
    *(void *)buf = 0;
    v40 = buf;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__6238;
    v43 = __Block_byref_object_dispose__6239;
    id v44 = 0;
    if ([v13 count] == 1)
    {
      v28 = +[PGGraphEdgeCollection edgesFromNodes:v14 toNodes:v13];
      if ([v28 count])
      {
        v16 = [v28 allRelevantAssetLocalIdentifiers];
        uint64_t v17 = [v16 mutableCopy];
        v18 = (void *)*((void *)v40 + 5);
        *((void *)v40 + 5) = v17;

        v19 = +[PGGraphNodeCollection subsetInCollection:v12];
        if ([v19 count])
        {
          int v27 = +[PGGraphEdgeCollection edgesFromNodes:v14 toNodes:v19];
          v20 = (void *)*((void *)v40 + 5);
          v21 = [v27 allRelevantAssetLocalIdentifiers];
          [v20 intersectSet:v21];
        }
        goto LABEL_16;
      }
      v25 = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v35 = 0;
        _os_log_error_impl(&dword_1D1805000, v25, OS_LOG_TYPE_ERROR, "[PGMyPetMemoryGenerator] No pet moment feature edges found", v35, 2u);
      }
    }
    else
    {
      *(void *)v35 = 0;
      v36 = v35;
      uint64_t v37 = 0x2020000000;
      char v38 = 0;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __100__PGMyPetMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke;
      v31[3] = &unk_1E68E5600;
      v32 = v14;
      v33 = v35;
      v34 = buf;
      [v13 enumerateIdentifiersAsCollectionsWithBlock:v31];
      if (!v36[24])
      {

        _Block_object_dispose(v35, 8);
LABEL_16:
        v23 = [*((id *)v40 + 5) allObjects];
        v24 = [(PGMemoryGenerator *)self memoryCurationSession];
        v15 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetLocalIdentifiers:v23 memoryCurationSession:v24 graph:v10 allowGuestAsset:v29];

LABEL_21:
        _Block_object_dispose(buf, 8);

        goto LABEL_22;
      }
      v22 = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v30 = 0;
        _os_log_error_impl(&dword_1D1805000, v22, OS_LOG_TYPE_ERROR, "[PGMyPetMemoryGenerator] No pet moment feature edges found", v30, 2u);
      }

      _Block_object_dispose(v35, 8);
    }
    v15 = 0;
    goto LABEL_21;
  }
  v14 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = [v13 count];
    _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "[PGMyPetMemoryGenerator] At least one and at most two pet nodes expected, found %d", buf, 8u);
  }
  v15 = 0;
LABEL_22:

  return v15;
}

void __100__PGMyPetMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v12 = +[PGGraphEdgeCollection edgesFromNodes:a1[4] toNodes:a3];
  if ([v12 count])
  {
    v6 = *(void **)(*(void *)(a1[6] + 8) + 40);
    v7 = [v12 allRelevantAssetLocalIdentifiers];
    v8 = v7;
    if (v6)
    {
      [v6 intersectSet:v7];
    }
    else
    {
      uint64_t v9 = [v7 mutableCopy];
      uint64_t v10 = *(void *)(a1[6] + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PGMyPetMemoryGenerator;
  id v5 = a3;
  v6 = [(PGMemoryGenerator *)&v14 keyAssetCurationOptionsWithTriggeredMemory:v5 inGraph:a4];
  v7 = objc_msgSend(v5, "memoryFeatureNodes", v14.receiver, v14.super_class);

  v8 = +[PGGraphNodeCollection subsetInCollection:v7];
  uint64_t v9 = [v8 localIdentifiers];
  uint64_t v10 = (void *)[v9 mutableCopy];

  id v11 = +[PGGraphNodeCollection subsetInCollection:v7];
  if ([v11 count])
  {
    id v12 = [v11 localIdentifiers];
    [v10 unionSet:v12];
  }
  [v6 setReferencePersonLocalIdentifiers:v10];
  [v6 setMinimumNumberOfReferencePersons:0];

  return v6;
}

- (unint64_t)durationForExtendedCuration
{
  return 10;
}

- (unint64_t)durationForCuration
{
  return 22;
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 - 1 < 3) {
    return a3 + 7000;
  }
  id v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  v6 = +[PGGraphNodeCollection nodesInGraph:a3];
  v7 = (void *)MEMORY[0x1E4F71E88];
  int v8 = +[PGGraphFeatureNodeCollection momentOfFeature];
  uint64_t v9 = [v7 adjacencyWithSources:v6 relation:v8 targetsClass:objc_opt_class()];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__PGMyPetMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v11[3] = &unk_1E68EE188;
  id v12 = v5;
  id v10 = v5;
  [v9 enumerateTargetsBySourceWithBlock:v11];
}

void __80__PGMyPetMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  id v8 = [a2 featureNodeCollection];
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);
}

- (unint64_t)memoryCategory
{
  return 10;
}

- (PGMyPetMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PGMyPetMemoryGenerator;
  int v3 = [(PGMemoryGenerator *)&v14 initWithMemoryGenerationContext:a3];
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 1;
    id v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    [(PGMemoryMomentRequirements *)v4->_momentRequirements setMinimumNumberOfRelevantAssets:2];
    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterMomentsWithNotEnoughScenesProcessed:1];
    uint64_t v7 = +[PGOverTheYearsMemoryConfiguration strictDefaultOverTheYearsMemoryConfiguration];
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v7;

    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setMinimumNumberOfRelevantAssets:13];
    uint64_t v9 = +[PGFeaturedTimePeriodMemoryConfiguration strictDefaultFeaturedYearMemoryConfiguration];
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumNumberOfRelevantAssets:13];
    uint64_t v11 = +[PGFeaturedTimePeriodMemoryConfiguration defaultFeaturedSeasonMemoryConfiguration];
    featuredSeasonConfiguration = v4->_featuredSeasonConfiguration;
    v4->_featuredSeasonConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v11;

    [(PGOverTimeMemoryConfiguration *)v4->_featuredSeasonConfiguration setMinimumNumberOfRelevantAssets:13];
  }
  return v4;
}

@end