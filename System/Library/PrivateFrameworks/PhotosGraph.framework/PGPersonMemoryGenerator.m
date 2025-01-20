@interface PGPersonMemoryGenerator
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (BOOL)semanticalDedupingEnabledForExtendedCuration;
- (PGPersonMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
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

@implementation PGPersonMemoryGenerator

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
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a7;
  v12 = [v10 memoryFeatureNodes];
  if ([v12 count])
  {
    v13 = [v10 memoryMomentNodes];
    if ([v13 count])
    {
      v14 = +[PGGraphNodeCollection subsetInCollection:v12];
      if ([v14 count])
      {
        v15 = [v14 anyNode];
        if (v15)
        {
          v16 = +[PGGraphNodeCollection subsetInCollection:v12];
          if ([v16 count])
          {
            v17 = [v16 anyNode];
            v18 = [v17 name];

            if ([v18 length])
            {
              v19 = [PGPeopleMemoryTitleGenerator alloc];
              v20 = [v13 temporarySet];
              [MEMORY[0x1E4F1CAD0] setWithObject:v15];
              v35 = v16;
              v22 = v21 = v18;
              v23 = [(PGPeopleMemoryTitleGenerator *)v19 initWithMomentNodes:v20 personNodes:v22 seasonName:v21 type:4 titleGenerationContext:v11];

              v18 = v21;
              v16 = v35;
            }
            else
            {
              v29 = [(PGMemoryGenerator *)self loggingConnection];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                [v16 description];
                v31 = v16;
                v33 = v32 = v18;
                *(_DWORD *)buf = 138412290;
                v38 = v33;
                _os_log_error_impl(&dword_1D1805000, v29, OS_LOG_TYPE_ERROR, "[PGPersonMemoryGenerator] No season name found for season node in collection %@", buf, 0xCu);

                v18 = v32;
                v16 = v31;
              }

              v23 = 0;
            }
          }
          else
          {
            v18 = [v13 temporarySet];
            v24 = +[PGPeopleMemoryTitleGenerator peopleOverTimeTimeTitleOptionsWithMomentNodes:](PGPeopleMemoryTitleGenerator, "peopleOverTimeTimeTitleOptionsWithMomentNodes:");
            v36 = +[PGGraphNodeCollection subsetInCollection:v12];
            if ([v36 count] == 1) {
              [v24 setFeaturedYearNodes:v36];
            }
            v25 = [PGPeopleMemoryTitleGenerator alloc];
            uint64_t v26 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
            v27 = v24;
            v34 = v24;
            v28 = (void *)v26;
            v23 = [(PGPeopleMemoryTitleGenerator *)v25 initWithMomentNodes:v18 personNodes:v26 timeTitleOptions:v27 type:0 titleGenerationContext:v11];
          }
        }
        else
        {
          v16 = [(PGMemoryGenerator *)self loggingConnection];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "[PGPersonMemoryGenerator] unable to cast personNodeCollection.anyNode to PGGraphPersonNode", buf, 2u);
          }
          v23 = 0;
        }
      }
      else
      {
        v15 = [(PGMemoryGenerator *)self loggingConnection];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "[PGPersonMemoryGenerator] personNodeCollection is empty", buf, 2u);
        }
        v23 = 0;
      }
    }
    else
    {
      v14 = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "[PGPersonMemoryGenerator] momentNodes is empty", buf, 2u);
      }
      v23 = 0;
    }
  }
  else
  {
    v13 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGPersonMemoryGenerator] featureNodes is empty", buf, 2u);
    }
    v23 = 0;
  }

  return v23;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PGPersonMemoryGenerator;
  id v5 = a3;
  v6 = [(PGMemoryGenerator *)&v11 keyAssetCurationOptionsWithTriggeredMemory:v5 inGraph:a4];
  v7 = objc_msgSend(v5, "memoryFeatureNodes", v11.receiver, v11.super_class);

  v8 = +[PGGraphNodeCollection subsetInCollection:v7];

  v9 = [v8 localIdentifiers];
  [v6 setReferencePersonLocalIdentifiers:v9];

  return v6;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v6 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = [v10 memoryFeatureNodes];
  v12 = +[PGGraphNodeCollection subsetInCollection:v11];

  v13 = [v10 memoryMomentNodes];

  v14 = +[PGGraphEdgeCollection edgesFromNodes:v13 toNodes:v12];

  if ([v14 count])
  {
    v15 = [v14 allRelevantAssetLocalIdentifiers];
    v16 = [v15 allObjects];
    v17 = [(PGMemoryGenerator *)self memoryCurationSession];
    v18 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetLocalIdentifiers:v16 memoryCurationSession:v17 graph:v9 allowGuestAsset:v6];
  }
  else
  {
    v19 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_1D1805000, v19, OS_LOG_TYPE_ERROR, "[PGPersonMemoryGenerator] No moment feature edges found", v21, 2u);
    }

    v18 = 0;
  }

  return v18;
}

- (BOOL)semanticalDedupingEnabledForExtendedCuration
{
  return 0;
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
  id v5 = a4;
  BOOL v6 = +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:a3];
  v7 = (void *)MEMORY[0x1E4F71E88];
  v8 = +[PGGraphFeatureNodeCollection momentOfFeature];
  id v9 = [v7 adjacencyWithSources:v6 relation:v8 targetsClass:objc_opt_class()];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__PGPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v11[3] = &unk_1E68E6180;
  id v12 = v5;
  id v10 = v5;
  [v9 enumerateTargetsBySourceWithBlock:v11];
}

void __81__PGPersonMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  id v8 = [a2 featureNodeCollection];
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 - 1 < 3) {
    return a3 + 2000;
  }
  id v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
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
  return 3;
}

- (PGPersonMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PGPersonMemoryGenerator;
  int v3 = [(PGMemoryGenerator *)&v14 initWithMemoryGenerationContext:a3];
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

    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setMinimumNumberOfRelevantAssets:13];
    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setAboveMomentAverageContentScoreThreshold:0.5];
    uint64_t v9 = +[PGFeaturedTimePeriodMemoryConfiguration strictDefaultFeaturedYearMemoryConfiguration];
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumNumberOfRelevantAssets:13];
    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setAboveMomentAverageContentScoreThreshold:0.5];
    uint64_t v11 = +[PGFeaturedTimePeriodMemoryConfiguration defaultFeaturedSeasonMemoryConfiguration];
    featuredSeasonConfiguration = v4->_featuredSeasonConfiguration;
    v4->_featuredSeasonConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v11;

    [(PGOverTimeMemoryConfiguration *)v4->_featuredSeasonConfiguration setMinimumNumberOfRelevantAssets:13];
    [(PGOverTimeMemoryConfiguration *)v4->_featuredSeasonConfiguration setAboveMomentAverageContentScoreThreshold:0.5];
  }
  return v4;
}

@end