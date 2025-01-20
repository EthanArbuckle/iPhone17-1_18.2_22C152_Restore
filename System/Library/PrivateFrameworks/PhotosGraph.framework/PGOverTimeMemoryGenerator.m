@interface PGOverTimeMemoryGenerator
- (BOOL)_shouldCreateFeaturedSeasonMemoryForMomentNodes:(id)a3 featureNodes:(id)a4;
- (BOOL)_shouldCreateFeaturedTimePeriodMemoriesForMomentNodes:(id)a3 configuration:(id)a4;
- (BOOL)_shouldCreateFeaturedYearMemoryForMomentNodes:(id)a3 featureNodes:(id)a4 inYear:(int64_t)a5 configuration:(id)a6;
- (BOOL)_shouldCreateMemoryForMomentNodes:(id)a3 featureNodes:(id)a4 withConfiguration:(id)a5;
- (BOOL)_shouldCreateOverTheYearsMemoryForMomentNodes:(id)a3 featureNodes:(id)a4 configuration:(id)a5;
- (BOOL)intersectRelevantAssetsForFeatures;
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (PGFeaturedTimePeriodMemoryConfiguration)fallbackFeaturedYearConfiguration;
- (PGFeaturedTimePeriodMemoryConfiguration)featuredSeasonConfiguration;
- (PGFeaturedTimePeriodMemoryConfiguration)featuredYearConfiguration;
- (PGMemoryMomentRequirements)momentRequirements;
- (PGOverTheYearsMemoryConfiguration)fallbackOverTheYearsConfiguration;
- (PGOverTheYearsMemoryConfiguration)overTheYearsConfiguration;
- (id)_filteredMomentNodesFromMomentNodes:(id)a3 featureNodes:(id)a4;
- (id)allFeatureNodesForMemoryNodeWithFeatureNodes:(id)a3;
- (id)chapterTitleGeneratorForTriggeredMemory:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 titleGenerationContext:(id)a6 inGraph:(id)a7;
- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (unint64_t)minimumNumberOfDefaultMemories;
- (unint64_t)minimumSceneAnalysisVersion;
- (unint64_t)numberOfRelevantAssetsForMomentNodes:(id)a3 featureNodes:(id)a4;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setMinimumNumberOfDefaultMemories:(unint64_t)a3;
- (void)setMinimumSceneAnalysisVersion:(unint64_t)a3;
- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3;
- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGOverTimeMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredSeasonConfiguration, 0);
  objc_storeStrong((id *)&self->_fallbackFeaturedYearConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_fallbackOverTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
  objc_storeStrong((id *)&self->_yearByYearNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_interestingForMemoriesMomentNodes, 0);
}

- (BOOL)intersectRelevantAssetsForFeatures
{
  return self->_intersectRelevantAssetsForFeatures;
}

- (PGFeaturedTimePeriodMemoryConfiguration)featuredSeasonConfiguration
{
  return self->_featuredSeasonConfiguration;
}

- (PGFeaturedTimePeriodMemoryConfiguration)fallbackFeaturedYearConfiguration
{
  return self->_fallbackFeaturedYearConfiguration;
}

- (PGFeaturedTimePeriodMemoryConfiguration)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (PGOverTheYearsMemoryConfiguration)fallbackOverTheYearsConfiguration
{
  return self->_fallbackOverTheYearsConfiguration;
}

- (PGOverTheYearsMemoryConfiguration)overTheYearsConfiguration
{
  return self->_overTheYearsConfiguration;
}

- (PGMemoryMomentRequirements)momentRequirements
{
  return self->_momentRequirements;
}

- (void)setMinimumNumberOfDefaultMemories:(unint64_t)a3
{
  self->_minimumNumberOfDefaultMemories = a3;
}

- (unint64_t)minimumNumberOfDefaultMemories
{
  return self->_minimumNumberOfDefaultMemories;
}

- (void)setMinimumSceneAnalysisVersion:(unint64_t)a3
{
  self->_minimumSceneAnalysisVersion = a3;
}

- (unint64_t)minimumSceneAnalysisVersion
{
  return self->_minimumSceneAnalysisVersion;
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

- (id)chapterTitleGeneratorForTriggeredMemory:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 titleGenerationContext:(id)a6 inGraph:(id)a7
{
  id v7 = a3;
  v8 = [v7 memoryFeatureNodes];
  v9 = +[PGGraphNodeCollection subsetInCollection:v8];

  if ([v9 count]) {
    v10 = [[PGYearChapterTitleGenerator alloc] initWithTriggeredMemory:v7];
  }
  else {
    v10 = 0;
  }

  return v10;
}

- (id)allFeatureNodesForMemoryNodeWithFeatureNodes:(id)a3
{
  return a3;
}

- (unint64_t)numberOfRelevantAssetsForMomentNodes:(id)a3 featureNodes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PGOverTimeMemoryGenerator *)self intersectRelevantAssetsForFeatures])
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__63969;
    v21 = __Block_byref_object_dispose__63970;
    id v22 = 0;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __79__PGOverTimeMemoryGenerator_numberOfRelevantAssetsForMomentNodes_featureNodes___block_invoke;
    v14 = &unk_1E68EE6A8;
    id v15 = v6;
    v16 = &v17;
    [v7 enumerateIdentifiersAsCollectionsWithBlock:&v11];
    unint64_t v8 = objc_msgSend((id)v18[5], "count", v11, v12, v13, v14);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v9 = +[PGGraphEdgeCollection edgesFromNodes:v6 toNodes:v7];
    unint64_t v8 = [v9 numberOfRelevantAssets];
  }
  return v8;
}

void __79__PGOverTimeMemoryGenerator_numberOfRelevantAssetsForMomentNodes_featureNodes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = +[PGGraphEdgeCollection edgesFromNodes:*(void *)(a1 + 32) toNodes:a3];
  id v9 = [v4 allRelevantAssetUUIDs];

  v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    [v5 intersectSet:v9];
  }
  else
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v9];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (BOOL)_shouldCreateMemoryForMomentNodes:(id)a3 featureNodes:(id)a4 withConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [v8 count];
  if (v11 < [v10 minimumNumberOfMoments]) {
    goto LABEL_2;
  }
  v14 = [(PGOverTimeMemoryGenerator *)self momentRequirements];
  if (([v14 filterUninterestingWithAlternateJunking] & 1) != 0
    || ![v10 minimumNumberOfMomentsInterestingWithAlternateJunking])
  {
  }
  else
  {
    id v15 = [(PGMemoryGenerator *)self memoryGenerationContext];
    v16 = [v15 interestingWithAlternateJunkingSubsetFromMomentNodes:v8];
    unint64_t v17 = [v16 count];
    unint64_t v18 = [v10 minimumNumberOfMomentsInterestingWithAlternateJunking];

    if (v17 < v18) {
      goto LABEL_2;
    }
  }
  uint64_t v19 = [(PGOverTimeMemoryGenerator *)self momentRequirements];
  if (([v19 filterUninterestingForMemories] & 1) != 0
    || ![v10 minimumNumberOfMomentsInterestingForMemories])
  {

    goto LABEL_14;
  }
  v20 = [(PGMemoryGenerator *)self memoryGenerationContext];
  v21 = [v20 interestingForMemoriesSubsetFromMomentNodes:v8];
  unint64_t v22 = [v21 count];
  unint64_t v23 = [v10 minimumNumberOfMomentsInterestingForMemories];

  if (v22 < v23)
  {
LABEL_2:
    char v12 = 0;
    goto LABEL_3;
  }
LABEL_14:
  if ([v10 minimumNumberOfAssetsInExtendedCuration])
  {
    v24 = [(PGMemoryGenerator *)self memoryGenerationContext];
    unint64_t v25 = [v24 numberOfAssetsInExtendedCurationForMomentNodes:v8];
    unint64_t v26 = [v10 minimumNumberOfAssetsInExtendedCuration];

    if (v25 < v26) {
      goto LABEL_2;
    }
  }
  if ([v10 minimumNumberOfRelevantAssets])
  {
    unint64_t v27 = [(PGOverTimeMemoryGenerator *)self numberOfRelevantAssetsForMomentNodes:v8 featureNodes:v9];
    if (v27 < [v10 minimumNumberOfRelevantAssets]) {
      goto LABEL_2;
    }
  }
  [v10 aboveMomentAverageContentScoreThreshold];
  if (v28 > 0.0)
  {
    v29 = [(PGMemoryGenerator *)self memoryGenerationContext];
    [v29 averageContentScoreForMomentNodes:v8];
    double v31 = v30;
    [v10 aboveMomentAverageContentScoreThreshold];
    double v33 = v32;

    if (v31 <= v33) {
      goto LABEL_2;
    }
  }
  if ([v10 allMomentsMustHaveScenesProcessed])
  {
    v34 = [(PGMemoryGenerator *)self processedScenesAndFacesCache];
    int v35 = [v34 allMomentNodesInCollectionHaveScenesProcessed:v8];

    if (!v35) {
      goto LABEL_2;
    }
  }
  if ([v10 allMomentsMustHaveFacesProcessed])
  {
    v36 = [(PGMemoryGenerator *)self processedScenesAndFacesCache];
    char v12 = [v36 allMomentNodesInCollectionHaveFacesProcessed:v8];
  }
  else
  {
    char v12 = 1;
  }
LABEL_3:

  return v12;
}

- (BOOL)_shouldCreateFeaturedSeasonMemoryForMomentNodes:(id)a3 featureNodes:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PGOverTimeMemoryGenerator *)self featuredSeasonConfiguration];
  id v9 = [v6 universalDateInterval];
  [v9 duration];
  double v11 = v10;
  [v8 minimumOverallTimeIntervalOfMoments];
  double v13 = v12;

  if (v11 >= v13)
  {
    id v33 = v7;
    v34 = v8;
    id v15 = [v6 graph];
    v16 = [(PGMemoryGenerator *)self memoryGenerationContext];
    int v35 = v6;
    uint64_t v17 = [v16 yearNodesForMomentNodes:v6];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    unint64_t v18 = [(PGMemoryGenerator *)self memoryGenerationContext];
    double v32 = (void *)v17;
    uint64_t v19 = [v18 yearsForYearNodes:v17];

    uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          unint64_t v25 = [(PGMemoryGenerator *)self processedScenesAndFacesCache];
          int v26 = objc_msgSend(v25, "libraryHasEnoughScenesProcessed:andProcessedFaces:forYear:inGraph:", -[PGOverTimeMemoryGenerator requireSceneProcessingMeetsThresholdOverTime](self, "requireSceneProcessingMeetsThresholdOverTime"), -[PGOverTimeMemoryGenerator requireFaceProcessingMeetsThresholdOverTime](self, "requireFaceProcessingMeetsThresholdOverTime"), objc_msgSend(v24, "integerValue"), v15);

          if (!v26)
          {
            BOOL v14 = 0;
            id v8 = v34;
            id v6 = v35;
            goto LABEL_16;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    if (-[PGOverTimeMemoryGenerator requireSceneProcessingMeetsThresholdOverTime](self, "requireSceneProcessingMeetsThresholdOverTime")&& (-[PGMemoryGenerator processedScenesAndFacesCache](self, "processedScenesAndFacesCache"), unint64_t v27 = objc_claimAutoreleasedReturnValue(), v28 = objc_msgSend(v27, "libraryHasEnoughScenesProcessedWithMinimumSceneAnalysisVersion:", -[PGOverTimeMemoryGenerator minimumSceneAnalysisVersion](self, "minimumSceneAnalysisVersion")), v27, !v28))
    {
      BOOL v14 = 0;
      id v8 = v34;
      id v6 = v35;
      double v30 = v32;
      id v7 = v33;
    }
    else
    {
      id v6 = v35;
      uint64_t v19 = [v35 universalStartDates];
      id v8 = v34;
      uint64_t v29 = [v34 minimumNumberOfMoments];
      [v34 minimumMomentSpreadicityTimeInterval];
      if (+[PGMemoryGenerationHelper dates:passSpreadicityWithMinimumCardinal:minimumTimeInterval:](PGMemoryGenerationHelper, "dates:passSpreadicityWithMinimumCardinal:minimumTimeInterval:", v19, v29))
      {
        id v7 = v33;
        BOOL v14 = [(PGOverTimeMemoryGenerator *)self _shouldCreateMemoryForMomentNodes:v35 featureNodes:v33 withConfiguration:v34];
      }
      else
      {
        BOOL v14 = 0;
LABEL_16:
        id v7 = v33;
      }
      double v30 = v32;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_shouldCreateFeaturedYearMemoryForMomentNodes:(id)a3 featureNodes:(id)a4 inYear:(int64_t)a5 configuration:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  double v13 = [v10 universalDateInterval];
  [v13 duration];
  double v15 = v14;
  [v12 minimumOverallTimeIntervalOfMoments];
  double v17 = v16;

  if (v15 >= v17)
  {
    uint64_t v19 = [v10 universalStartDates];
    uint64_t v20 = [v12 minimumNumberOfMoments];
    [v12 minimumMomentSpreadicityTimeInterval];
    if (!+[PGMemoryGenerationHelper dates:passSpreadicityWithMinimumCardinal:minimumTimeInterval:](PGMemoryGenerationHelper, "dates:passSpreadicityWithMinimumCardinal:minimumTimeInterval:", v19, v20))goto LABEL_8; {
    uint64_t v21 = [(PGMemoryGenerator *)self processedScenesAndFacesCache];
    }
    BOOL v22 = [(PGOverTimeMemoryGenerator *)self requireSceneProcessingMeetsThresholdOverTime];
    BOOL v23 = [(PGOverTimeMemoryGenerator *)self requireFaceProcessingMeetsThresholdOverTime];
    v24 = [v10 graph];
    int v25 = [v21 libraryHasEnoughScenesProcessed:v22 andProcessedFaces:v23 forYear:a5 inGraph:v24];

    if (!v25) {
      goto LABEL_8;
    }
    if (!-[PGOverTimeMemoryGenerator requireSceneProcessingMeetsThresholdOverTime](self, "requireSceneProcessingMeetsThresholdOverTime")|| (-[PGMemoryGenerator processedScenesAndFacesCache](self, "processedScenesAndFacesCache"), int v26 = objc_claimAutoreleasedReturnValue(), v27 = objc_msgSend(v26, "libraryHasEnoughScenesProcessedWithMinimumSceneAnalysisVersion:", -[PGOverTimeMemoryGenerator minimumSceneAnalysisVersion](self, "minimumSceneAnalysisVersion")), v26, v27))
    {
      BOOL v18 = [(PGOverTimeMemoryGenerator *)self _shouldCreateMemoryForMomentNodes:v10 featureNodes:v11 withConfiguration:v12];
    }
    else
    {
LABEL_8:
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)_shouldCreateFeaturedTimePeriodMemoriesForMomentNodes:(id)a3 configuration:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v5 = a4;
  unint64_t v6 = [a3 count];
  unint64_t v7 = [v5 minimumNumberOfMoments];

  return v6 >= v7;
}

- (BOOL)_shouldCreateOverTheYearsMemoryForMomentNodes:(id)a3 featureNodes:(id)a4 configuration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v10)
  {
    BOOL v16 = 0;
    goto LABEL_19;
  }
  uint64_t v12 = [v10 minimumNumberOfMoments];
  double v13 = [(PGMemoryGenerator *)self memoryGenerationContext];
  double v14 = [v13 yearNodesForMomentNodes:v8];

  unint64_t v15 = [v14 count];
  if (v15 < [v11 minimumNumberOfYears])
  {
    BOOL v16 = 0;
    if (![v11 allowTwoConsecutiveYears] || v15 != 2) {
      goto LABEL_17;
    }
    double v17 = [(PGMemoryGenerator *)self memoryGenerationContext];
    BOOL v18 = [v17 yearsForYearNodes:v14];

    uint64_t v19 = [v18 firstObject];
    uint64_t v20 = [v19 integerValue];
    uint64_t v21 = [v18 lastObject];
    uint64_t v22 = [v21 integerValue];
    if (v20 - v22 >= 0) {
      uint64_t v23 = v20 - v22;
    }
    else {
      uint64_t v23 = v22 - v20;
    }

    if (v23 != 1) {
      goto LABEL_15;
    }
    uint64_t v12 = [v11 minimumNumberOfMomentsForTwoConsecutiveYears];
  }
  BOOL v18 = [v8 universalStartDates];
  [v11 minimumMomentSpreadicityTimeInterval];
  if (!+[PGMemoryGenerationHelper dates:passSpreadicityWithMinimumCardinal:minimumTimeInterval:](PGMemoryGenerationHelper, "dates:passSpreadicityWithMinimumCardinal:minimumTimeInterval:", v18, v12))goto LABEL_15; {
  v24 = [(PGMemoryGenerator *)self processedScenesAndFacesCache];
  }
  int v25 = objc_msgSend(v24, "libraryHasEnoughScenesProcessed:andProcessedFaces:", -[PGOverTimeMemoryGenerator requireSceneProcessingMeetsThresholdOverTime](self, "requireSceneProcessingMeetsThresholdOverTime"), -[PGOverTimeMemoryGenerator requireFaceProcessingMeetsThresholdOverTime](self, "requireFaceProcessingMeetsThresholdOverTime"));

  if (!v25
    || -[PGOverTimeMemoryGenerator requireSceneProcessingMeetsThresholdOverTime](self, "requireSceneProcessingMeetsThresholdOverTime")&& (-[PGMemoryGenerator processedScenesAndFacesCache](self, "processedScenesAndFacesCache"), int v26 = objc_claimAutoreleasedReturnValue(), v27 = objc_msgSend(v26, "libraryHasEnoughScenesProcessedWithMinimumSceneAnalysisVersion:", -[PGOverTimeMemoryGenerator minimumSceneAnalysisVersion](self, "minimumSceneAnalysisVersion")), v26, !v27))
  {
LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  BOOL v16 = [(PGOverTimeMemoryGenerator *)self _shouldCreateMemoryForMomentNodes:v8 featureNodes:v9 withConfiguration:v11];
LABEL_16:

LABEL_17:
LABEL_19:

  return v16;
}

- (id)_filteredMomentNodesFromMomentNodes:(id)a3 featureNodes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = [(PGOverTimeMemoryGenerator *)self momentRequirements];
  int v10 = [v9 filterUninterestingWithAlternateJunking];

  id v11 = v8;
  if (v10)
  {
    uint64_t v12 = [(PGMemoryGenerator *)self memoryGenerationContext];
    id v11 = [v12 interestingWithAlternateJunkingSubsetFromMomentNodes:v8];
  }
  double v13 = [(PGOverTimeMemoryGenerator *)self momentRequirements];
  int v14 = [v13 filterUninterestingForMemories];

  if (v14)
  {
    unint64_t v15 = [(PGMemoryGenerator *)self memoryGenerationContext];
    uint64_t v16 = [v15 interestingForMemoriesSubsetFromMomentNodes:v11];

    id v11 = (void *)v16;
  }
  double v17 = [(PGOverTimeMemoryGenerator *)self momentRequirements];
  uint64_t v18 = [v17 minimumNumberOfRelevantAssets];

  uint64_t v19 = [(PGOverTimeMemoryGenerator *)self momentRequirements];
  uint64_t v20 = [v19 minimumNumberOfAssetsInExtendedCuration];

  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  int v35 = __78__PGOverTimeMemoryGenerator__filteredMomentNodesFromMomentNodes_featureNodes___block_invoke;
  long long v36 = &unk_1E68EE680;
  uint64_t v39 = v20;
  uint64_t v40 = v18;
  long long v37 = self;
  id v38 = v7;
  id v21 = v7;
  uint64_t v22 = [v11 filteredCollectionUsingBlock:&v33];

  uint64_t v23 = [(PGOverTimeMemoryGenerator *)self momentRequirements];
  [v23 aboveContentScoreThreshold];
  double v25 = v24;

  if (v25 > 0.0)
  {
    int v26 = [(PGOverTimeMemoryGenerator *)self momentRequirements];
    [v26 aboveContentScoreThreshold];
    uint64_t v27 = objc_msgSend(v22, "momentNodesWithContentScoreAbove:");

    uint64_t v22 = (void *)v27;
  }
  int v28 = [(PGOverTimeMemoryGenerator *)self momentRequirements];
  uint64_t v29 = [v28 minimumNumberOfPersons];

  if (v29)
  {
    double v30 = [(PGOverTimeMemoryGenerator *)self momentRequirements];
    uint64_t v31 = objc_msgSend(v22, "momentNodesWithMinimumNumberOfPersons:", objc_msgSend(v30, "minimumNumberOfPersons"));

    uint64_t v22 = (void *)v31;
  }

  return v22;
}

uint64_t __78__PGOverTimeMemoryGenerator__filteredMomentNodesFromMomentNodes_featureNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D25FED50]();
  if (*(void *)(a1 + 48)
    && ([*(id *)(a1 + 32) memoryGenerationContext],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 numberOfAssetsInExtendedCurationForMomentNodes:v3],
        unint64_t v7 = *(void *)(a1 + 48),
        v5,
        v6 < v7)
    || *(void *)(a1 + 56)
    && (unint64_t)[*(id *)(a1 + 32) numberOfRelevantAssetsForMomentNodes:v3 featureNodes:*(void *)(a1 + 40)] < *(void *)(a1 + 56))
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) momentRequirements];
    if ([v9 filterMomentsWithNotEnoughScenesProcessed])
    {
      int v10 = [*(id *)(a1 + 32) processedScenesAndFacesCache];
      uint64_t v8 = [v10 allMomentNodesInCollectionHaveScenesProcessed:v3];
    }
    else
    {
      uint64_t v8 = 1;
    }
  }

  return v8;
}

- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PGOverTimeMemoryGenerator *)self overTheYearsConfiguration];
  if (v8
    || ([(PGOverTimeMemoryGenerator *)self featuredYearConfiguration],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_4;
  }
  uint64_t v27 = [(PGOverTimeMemoryGenerator *)self featuredSeasonConfiguration];

  if (v27)
  {
LABEL_4:
    id v9 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:v7];
    *(void *)v52 = 0;
    *(void *)&v52[8] = v52;
    *(void *)&v52[16] = 0x2020000000;
    LOBYTE(v53) = 0;
    int v10 = [(PGMemoryGenerator *)self momentNodesWithBlockedFeatureCache];
    id v11 = [v10 momentNodesWithBlockedFeature];

    uint64_t v12 = [(PGMemoryGenerator *)self memoryGenerationContext];
    double v13 = [v12 momentNodesAtSensitiveLocationsInGraph:v6];

    int v14 = +[PGGraphNodeCollection nodesInGraph:v6];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    long long v36 = __81__PGOverTimeMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke;
    long long v37 = &unk_1E68EE658;
    v46 = v52;
    double v17 = v9;
    id v38 = v17;
    uint64_t v47 = 0x3FE0000000000000;
    id v18 = v11;
    id v39 = v18;
    id v19 = v13;
    id v40 = v19;
    uint64_t v41 = self;
    id v20 = v14;
    id v42 = v20;
    id v21 = v15;
    id v43 = v21;
    id v22 = v16;
    id v44 = v22;
    id v45 = v6;
    [(PGOverTimeMemoryGenerator *)self enumerateMomentNodesAndFeatureNodesInGraph:v45 usingBlock:&v34];
    if (*(unsigned char *)(*(void *)&v52[8] + 24))
    {
      *(unsigned char *)(*(void *)&v52[8] + 24) = 1;
LABEL_7:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v49 = 135;
        __int16 v50 = 2080;
        v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/Memory Generators/PGOverTimeMemoryGenerator.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v24 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_10;
    }
    char v23 = -[NSObject isCancelledWithProgress:](v17, "isCancelledWithProgress:", 1.0, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44);
    *(unsigned char *)(*(void *)&v52[8] + 24) = v23;
    if (v23) {
      goto LABEL_7;
    }
    int v26 = [(PGOverTimeMemoryGenerator *)self fallbackOverTheYearsConfiguration];
    if (v26)
    {
    }
    else
    {
      int v28 = [(PGOverTimeMemoryGenerator *)self fallbackFeaturedYearConfiguration];
      BOOL v29 = v28 == 0;

      if (v29)
      {
LABEL_23:
        id v24 = v21;
LABEL_10:

        _Block_object_dispose(v52, 8);
        goto LABEL_11;
      }
    }
    unint64_t v30 = [v21 count];
    if (v30 < [(PGOverTimeMemoryGenerator *)self minimumNumberOfDefaultMemories]) {
      [v21 addObjectsFromArray:v22];
    }
    goto LABEL_23;
  }
  double v17 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v31 = [(PGOverTimeMemoryGenerator *)self overTheYearsConfiguration];
    double v32 = [(PGOverTimeMemoryGenerator *)self featuredYearConfiguration];
    uint64_t v33 = [(PGOverTimeMemoryGenerator *)self featuredSeasonConfiguration];
    *(_DWORD *)v52 = 138412802;
    *(void *)&v52[4] = v31;
    *(_WORD *)&v52[12] = 2112;
    *(void *)&v52[14] = v32;
    *(_WORD *)&v52[22] = 2112;
    v53 = v33;
    _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "[PGOverTimeMemoryGenerator] At least one of the overTheYearsConfiguration (%@), featuredYearConfiguration (%@), or featuredSeasonConfiguration (%@) must not be nil", v52, 0x20u);
  }
  id v24 = (id)MEMORY[0x1E4F1CBF0];
LABEL_11:

  return v24;
}

void __81__PGOverTimeMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1D25FED50]();
  uint64_t v10 = *(void *)(*(void *)(a1 + 96) + 8);
  if (*(unsigned char *)(v10 + 24))
  {
    char v11 = 1;
  }
  else
  {
    char v11 = [*(id *)(a1 + 32) isCancelledWithProgress:*(double *)(a1 + 104)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 96) + 8);
  }
  *(unsigned char *)(v10 + 24) = v11;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    *a4 = 1;
    goto LABEL_20;
  }
  uint64_t v12 = [v7 collectionBySubtracting:*(void *)(a1 + 40)];

  id v7 = [v12 collectionBySubtracting:*(void *)(a1 + 48)];

  unint64_t v13 = [v7 count];
  int v14 = [*(id *)(a1 + 56) overTheYearsConfiguration];
  if (v13 >= [v14 minimumNumberOfMoments])
  {
  }
  else
  {
    id v15 = [*(id *)(a1 + 56) featuredYearConfiguration];
    unint64_t v16 = [v15 minimumNumberOfMoments];

    if (v13 < v16) {
      goto LABEL_20;
    }
  }
  double v17 = [*(id *)(a1 + 56) _filteredMomentNodesFromMomentNodes:v7 featureNodes:v8];
  id v18 = *(void **)(a1 + 56);
  id v19 = [v18 overTheYearsConfiguration];
  LODWORD(v18) = [v18 _shouldCreateOverTheYearsMemoryForMomentNodes:v17 featureNodes:v8 configuration:v19];

  if (v18)
  {
    id v20 = [*(id *)(a1 + 64) featureNodeCollection];
    id v21 = [v8 collectionByFormingUnionWith:v20];

    id v22 = [*(id *)(a1 + 56) allFeatureNodesForMemoryNodeWithFeatureNodes:v21];

    char v23 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", [*(id *)(a1 + 56) memoryCategory], objc_msgSend(*(id *)(a1 + 56), "memoryCategorySubcategoryForOverTimeType:", 3), v17, v22);
    id v24 = (id *)(a1 + 72);
LABEL_14:
    [*v24 addObject:v23];

    goto LABEL_15;
  }
  double v25 = *(void **)(a1 + 56);
  int v26 = [v25 fallbackOverTheYearsConfiguration];
  LODWORD(v25) = [v25 _shouldCreateOverTheYearsMemoryForMomentNodes:v17 featureNodes:v8 configuration:v26];

  if (v25)
  {
    uint64_t v27 = [*(id *)(a1 + 64) featureNodeCollection];
    int v28 = [v8 collectionByFormingUnionWith:v27];

    id v22 = [*(id *)(a1 + 56) allFeatureNodesForMemoryNodeWithFeatureNodes:v28];

    char v23 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:generatedWithFallbackRequirements:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:generatedWithFallbackRequirements:", [*(id *)(a1 + 56) memoryCategory], objc_msgSend(*(id *)(a1 + 56), "memoryCategorySubcategoryForOverTimeType:", 3), v17, v22, 1);
    id v24 = (id *)(a1 + 80);
    goto LABEL_14;
  }
LABEL_15:
  BOOL v29 = [*(id *)(a1 + 56) featuredYearConfiguration];
  if ([*(id *)(a1 + 56) _shouldCreateFeaturedTimePeriodMemoriesForMomentNodes:v17 configuration:v29])
  {
    unint64_t v30 = [*(id *)(a1 + 56) fallbackFeaturedYearConfiguration];
    char v42 = [*(id *)(a1 + 56) _shouldCreateFeaturedTimePeriodMemoriesForMomentNodes:v17 configuration:v30];
    uint64_t v31 = [*(id *)(a1 + 56) memoryGenerationContext];
    double v32 = [v31 yearNodesByMomentNodeInGraph:*(void *)(a1 + 88)];
    uint64_t v33 = [v32 intersectingSourcesWith:v17];

    uint64_t v34 = [v33 transposed];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __81__PGOverTimeMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_2;
    v47[3] = &unk_1E68EE608;
    v47[4] = *(void *)(a1 + 56);
    id v48 = v8;
    id v49 = v29;
    id v35 = *(id *)(a1 + 72);
    char v53 = v42;
    id v50 = v35;
    id v51 = v30;
    id v52 = *(id *)(a1 + 80);
    id v36 = v30;
    [v34 enumerateTargetsBySourceWithBlock:v47];
  }
  long long v37 = *(void **)(a1 + 56);
  id v38 = [v37 featuredSeasonConfiguration];
  LODWORD(v37) = [v37 _shouldCreateFeaturedTimePeriodMemoriesForMomentNodes:v17 configuration:v38];

  if (v37)
  {
    id v39 = [*(id *)(a1 + 56) loggingConnection];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __81__PGOverTimeMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_3;
    v43[3] = &unk_1E68EE630;
    id v40 = v8;
    uint64_t v41 = *(void *)(a1 + 56);
    id v44 = v40;
    uint64_t v45 = v41;
    id v46 = *(id *)(a1 + 72);
    +[PGSeasonMemoryGenerator enumerateMomentNodesBySeasonInYearFromMomentNodes:v17 loggingConnection:v39 usingBlock:v43];
  }
LABEL_20:
}

void __81__PGOverTimeMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) memoryGenerationContext];
  id v7 = [v6 yearsForYearNodes:v19];
  id v8 = [v7 firstObject];
  uint64_t v9 = [v8 integerValue];

  if ([*(id *)(a1 + 32) _shouldCreateFeaturedYearMemoryForMomentNodes:v5 featureNodes:*(void *)(a1 + 40) inYear:v9 configuration:*(void *)(a1 + 48)])
  {
    uint64_t v10 = *(void **)(a1 + 40);
    char v11 = [v19 featureNodeCollection];
    uint64_t v12 = [v10 collectionByFormingUnionWith:v11];

    unint64_t v13 = [*(id *)(a1 + 32) allFeatureNodesForMemoryNodeWithFeatureNodes:v12];

    int v14 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", [*(id *)(a1 + 32) memoryCategory], objc_msgSend(*(id *)(a1 + 32), "memoryCategorySubcategoryForOverTimeType:", 1), v5, v13);
    id v15 = (id *)(a1 + 56);
LABEL_6:
    [*v15 addObject:v14];

    goto LABEL_7;
  }
  if (*(unsigned char *)(a1 + 80)
    && [*(id *)(a1 + 32) _shouldCreateFeaturedYearMemoryForMomentNodes:v5 featureNodes:*(void *)(a1 + 40) inYear:v9 configuration:*(void *)(a1 + 64)])
  {
    unint64_t v16 = *(void **)(a1 + 40);
    double v17 = [v19 featureNodeCollection];
    id v18 = [v16 collectionByFormingUnionWith:v17];

    unint64_t v13 = [*(id *)(a1 + 32) allFeatureNodesForMemoryNodeWithFeatureNodes:v18];

    int v14 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:generatedWithFallbackRequirements:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:generatedWithFallbackRequirements:", [*(id *)(a1 + 32) memoryCategory], objc_msgSend(*(id *)(a1 + 32), "memoryCategorySubcategoryForOverTimeType:", 1), v5, v13, 1);
    id v15 = (id *)(a1 + 72);
    goto LABEL_6;
  }
LABEL_7:
}

void __81__PGOverTimeMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v16 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1D25FED50]();
  uint64_t v10 = [v7 featureNodeCollection];
  char v11 = [v8 featureNodeCollection];
  uint64_t v12 = [v10 collectionByFormingUnionWith:v11];

  unint64_t v13 = [v12 collectionByFormingUnionWith:*(void *)(a1 + 32)];

  if ([*(id *)(a1 + 40) _shouldCreateFeaturedSeasonMemoryForMomentNodes:v16 featureNodes:v13])
  {
    uint64_t v14 = [*(id *)(a1 + 40) allFeatureNodesForMemoryNodeWithFeatureNodes:v13];

    id v15 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", [*(id *)(a1 + 40) memoryCategory], objc_msgSend(*(id *)(a1 + 40), "memoryCategorySubcategoryForOverTimeType:", 2), v16, v14);
    [*(id *)(a1 + 48) addObject:v15];

    unint64_t v13 = (void *)v14;
  }
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  PGAbstractMethodException(self, a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  PGAbstractMethodException(self, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (unint64_t)memoryCategory
{
  PGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

@end