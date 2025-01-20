@interface PGExcitingMomentsMemoryGenerator
- (BOOL)intersectRelevantAssetsForFeatures;
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (PGExcitingMomentsMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5;
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

@implementation PGExcitingMomentsMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a7;
  v12 = [v10 memoryFeatureNodes];
  v13 = +[PGGraphNodeCollection subsetInCollection:v12];
  if ([v13 count] == 1)
  {
    v14 = [PGExcitingMomentsMemoryTitleGenerator alloc];
    v15 = [v10 memoryMomentNodes];
    v16 = [v15 temporarySet];
    v17 = [(PGExcitingMomentsMemoryTitleGenerator *)v14 initWithMomentNodes:v16 type:0 titleGenerationContext:v11];

    v18 = +[PGGraphNodeCollection subsetInCollection:v12];
    if ([v18 count] == 1) {
      [(PGTitleGenerator *)v17 setFeaturedYearNodes:v18];
    }
    [(PGExcitingMomentsMemoryTitleGenerator *)v17 setPersonNodeAsCollection:v13];
  }
  else
  {
    v19 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21[0] = 67109120;
      v21[1] = [v13 count];
      _os_log_error_impl(&dword_1D1805000, v19, OS_LOG_TYPE_ERROR, "[PGExcitingMomentsMemoryGenerator] One person node expected, found %d", (uint8_t *)v21, 8u);
    }

    v17 = 0;
  }

  return v17;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 memoryFeatureNodes];
  id v11 = +[PGGraphNodeCollection subsetInCollection:v10];
  if ([v11 count] == 1)
  {
    v12 = [v8 memoryMomentNodes];
    v13 = +[PGGraphEdgeCollection edgesFromNodes:v12 toNodes:v11];
    if ([v13 count])
    {
      v14 = [v13 allRelevantAssetLocalIdentifiers];
      v15 = [v14 mutableCopy];

      v16 = +[PGGraphNodeCollection subsetInCollection:v10];
      if ([v16 count] == 1)
      {
        v17 = +[PGGraphEdgeCollection edgesFromNodes:v12 toNodes:v16];
        if ([v17 count])
        {
          v50 = v16;
          v18 = [v17 allRelevantAssetLocalIdentifiers];
          [v15 intersectSet:v18];

          if ([v15 count])
          {
            v42 = v17;
            v44 = v13;
            v45 = v12;
            v46 = v11;
            v47 = v10;
            id v48 = v9;
            id v49 = v8;
            v19 = [(PGMemoryGenerator *)self memoryCurationSession];
            v20 = [v19 curationManager];
            uint64_t v21 = [v20 defaultAssetFetchOptionsForMemories];

            uint64_t v22 = (void *)MEMORY[0x1E4F38EB8];
            v43 = v15;
            v23 = [v15 allObjects];
            v51 = (void *)v21;
            v24 = [v22 fetchAssetsWithLocalIdentifiers:v23 options:v21];

            id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            id v26 = objc_alloc_init(MEMORY[0x1E4F8E778]);
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            id v27 = v24;
            uint64_t v28 = [v27 countByEnumeratingWithState:&v52 objects:v56 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v53;
              do
              {
                for (uint64_t i = 0; i != v29; ++i)
                {
                  if (*(void *)v53 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  v32 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                  v33 = [v26 curationModelForAsset:v32];
                  int v34 = [v33 isInterestingLivePhotoWithAsset:v32];

                  if (v34)
                  {
                    v35 = [v32 objectID];
                    [v25 addObject:v35];
                  }
                }
                uint64_t v29 = [v27 countByEnumeratingWithState:&v52 objects:v56 count:16];
              }
              while (v29);
            }

            if ([v25 count])
            {
              v36 = [objc_alloc(MEMORY[0x1E4F390B0]) initWithExistingFetchResult:v27 filteredObjectIDs:v25];
              v37 = [(PGMemoryGenerator *)self memoryCurationSession];
              id v9 = v48;
              v38 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v36 memoryCurationSession:v37 graph:v48];

              id v8 = v49;
              id v11 = v46;
              id v10 = v47;
            }
            else
            {
              v36 = [(PGMemoryGenerator *)self loggingConnection];
              id v9 = v48;
              id v11 = v46;
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1805000, v36, OS_LOG_TYPE_INFO, "[PGExcitingMomentsMemoryGenerator] No assets with good enough autoplay suggestion score found in relevant assets for exciting moments memory", buf, 2u);
              }
              v38 = 0;
              id v8 = v49;
              id v10 = v47;
            }
            v17 = v42;

            v13 = v44;
            v12 = v45;
            v15 = v43;
          }
          else
          {
            v40 = [(PGMemoryGenerator *)self loggingConnection];
            v51 = v40;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D1805000, v40, OS_LOG_TYPE_ERROR, "[PGExcitingMomentsMemoryGenerator] No intersecting relevantAssetLocalIdentifiers found for exciting moments memory", buf, 2u);
            }
            v38 = 0;
          }
          v16 = v50;
        }
        else
        {
          v39 = [(PGMemoryGenerator *)self loggingConnection];
          v51 = v39;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1805000, v39, OS_LOG_TYPE_ERROR, "[PGExcitingMomentsMemoryGenerator] No excitementAudioMomentFeaturesEdges found", buf, 2u);
          }
          v38 = 0;
        }
      }
      else
      {
        v17 = [(PGMemoryGenerator *)self loggingConnection];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v58 = [v16 count];
          _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "[PGExcitingMomentsMemoryGenerator] One excitement audio node expected, found %d", buf, 8u);
        }
        v38 = 0;
      }
    }
    else
    {
      v15 = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "[PGExcitingMomentsMemoryGenerator] No personMomentFeaturesEdges found", buf, 2u);
      }
      v38 = 0;
    }
  }
  else
  {
    v12 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v58 = [v11 count];
      _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "[PGExcitingMomentsMemoryGenerator] One person node expected, found %d", buf, 8u);
    }
    v38 = 0;
  }

  return v38;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PGExcitingMomentsMemoryGenerator;
  id v5 = a3;
  v6 = [(PGMemoryGenerator *)&v11 keyAssetCurationOptionsWithTriggeredMemory:v5 inGraph:a4];
  v7 = objc_msgSend(v5, "memoryFeatureNodes", v11.receiver, v11.super_class);

  id v8 = +[PGGraphNodeCollection subsetInCollection:v7];

  id v9 = [v8 localIdentifiers];
  [v6 setReferencePersonLocalIdentifiers:v9];

  [v6 setMinimumNumberOfReferencePersons:0];
  return v6;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PGExcitingMomentsMemoryGenerator;
  id v5 = [(PGMemoryGenerator *)&v7 curationOptionsWithRequiredAssetUUIDs:a3 eligibleAssetUUIDs:a4 triggeredMemory:a5];
  [v5 setMinimumNumberOfItems:15];
  [v5 setFailIfMinimumDurationNotReached:1];
  return v5;
}

- (unint64_t)durationForExtendedCuration
{
  return 10;
}

- (unint64_t)durationForCuration
{
  return 22;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = +[PGGraphAudioFeatureNodeCollection audioFeatureNodesForLabel:@"ExcitementAudio" inGraph:a3];
  objc_super v7 = [v6 momentNodes];
  if ([v7 count])
  {
    id v8 = (void *)MEMORY[0x1E4F71F18];
    id v9 = +[PGGraphMomentNode featureOfMoment];
    v19[0] = v9;
    id v10 = +[PGGraphPersonNode filterExcludingMe];
    objc_super v11 = [v10 relation];
    v19[1] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v13 = [v8 chain:v12];

    v14 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v7 relation:v13 targetsClass:objc_opt_class()];
    v15 = [v14 transposed];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__PGExcitingMomentsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
    v16[3] = &unk_1E68ED660;
    id v17 = v6;
    id v18 = v5;
    [v15 enumerateTargetsBySourceWithBlock:v16];
  }
}

void __90__PGExcitingMomentsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 featureNodeCollection];
  id v9 = [v7 featureNodeCollection];

  id v10 = [v8 collectionByFormingUnionWith:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 2005;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 2006;
  }
  id v5 = [(PGMemoryGenerator *)self loggingConnection];
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

- (unint64_t)memoryCategory
{
  return 26;
}

- (PGExcitingMomentsMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PGExcitingMomentsMemoryGenerator;
  int v3 = [(PGMemoryGenerator *)&v12 initWithMemoryGenerationContext:a3];
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 1;
    id v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterUninterestingForMemories:1];
    [(PGMemoryMomentRequirements *)v4->_momentRequirements setMinimumNumberOfRelevantAssets:1];
    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterMomentsWithNotEnoughScenesProcessed:1];
    uint64_t v7 = +[PGOverTheYearsMemoryConfiguration strictDefaultOverTheYearsMemoryConfiguration];
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v7;

    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setMinimumNumberOfRelevantAssets:15];
    uint64_t v9 = +[PGFeaturedTimePeriodMemoryConfiguration strictDefaultFeaturedYearMemoryConfiguration];
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumNumberOfRelevantAssets:15];
    v4->_intersectRelevantAssetsForFeatures = 1;
  }
  return v4;
}

@end