@interface PGSeasonMemoryGenerator
+ (void)enumerateMomentNodesBySeasonInYearFromMomentNodes:(id)a3 loggingConnection:(id)a4 usingBlock:(id)a5;
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (PGSeasonMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)featuredSeasonConfiguration;
- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4;
- (id)momentRequirements;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (unint64_t)durationForCuration;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3;
- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGSeasonMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentRequirements, 0);
  objc_storeStrong((id *)&self->_featuredSeasonConfiguration, 0);
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (id)featuredSeasonConfiguration
{
  return self->_featuredSeasonConfiguration;
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a7;
  v12 = [v10 memoryFeatureNodes];
  v13 = +[PGGraphNodeCollection subsetInCollection:v12];

  if ([v13 count] == 1)
  {
    v14 = [v13 anyNode];
    v15 = [v14 name];

    v16 = [PGSeasonMemoryTitleGenerator alloc];
    v17 = [v10 memoryMomentNodes];
    v18 = [v17 set];
    v19 = [(PGSeasonMemoryTitleGenerator *)v16 initWithMomentNodes:v18 seasonName:v15 titleGenerationContext:v11];
  }
  else
  {
    v20 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22[0] = 67109120;
      v22[1] = [v13 count];
      _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "[PGSeasonMemoryGenerator] One season node expected, found %d", (uint8_t *)v22, 8u);
    }

    v19 = 0;
  }

  return v19;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PGSeasonMemoryGenerator;
  v4 = [(PGMemoryGenerator *)&v6 keyAssetCurationOptionsWithTriggeredMemory:a3 inGraph:a4];
  [v4 setPrefilterAssetsWithFacesThreshold:2.22507386e-308];
  return v4;
}

- (unint64_t)durationForCuration
{
  return 23;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  v5 = (void (**)(id, void *, PGGraphFeatureNodeCollection *, unsigned char *))a4;
  id v6 = a3;
  v7 = +[PGGraphNodeCollection nodesInGraph:v6];
  v8 = [v6 meNodeCollection];
  v9 = [v8 homeOrWorkNodes];
  id v10 = [v9 addressNodes];
  id v11 = [v10 momentNodes];
  v12 = [v7 collectionBySubtracting:v11];

  v13 = +[PGGraphNodeCollection nodesInGraph:v6];
  v14 = [v13 momentNodes];
  v15 = [v12 collectionByFormingUnionWith:v14];

  char v17 = 0;
  v16 = [(MAElementCollection *)[PGGraphFeatureNodeCollection alloc] initWithGraph:v6];

  v5[2](v5, v15, v16, &v17);
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 2) {
    return 14001;
  }
  int v4 = a3;
  v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    v9 = v7;
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (unint64_t)memoryCategory
{
  return 21;
}

- (PGSeasonMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PGSeasonMemoryGenerator;
  v3 = [(PGMemoryGenerator *)&v10 initWithMemoryGenerationContext:a3];
  int v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 0;
    v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterUninterestingForMemories:1];
    [(PGMemoryMomentRequirements *)v4->_momentRequirements setMinimumNumberOfPersons:1];
    [(PGMemoryMomentRequirements *)v4->_momentRequirements setAboveContentScoreThreshold:0.5];
    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterMomentsWithNotEnoughScenesProcessed:1];
    v7 = objc_alloc_init(PGFeaturedTimePeriodMemoryConfiguration);
    featuredSeasonConfiguration = v4->_featuredSeasonConfiguration;
    v4->_featuredSeasonConfiguration = v7;

    [(PGOverTimeMemoryConfiguration *)v4->_featuredSeasonConfiguration setMinimumNumberOfMoments:6];
    [(PGOverTimeMemoryConfiguration *)v4->_featuredSeasonConfiguration setMinimumNumberOfAssetsInExtendedCuration:13];
    [(PGOverTimeMemoryConfiguration *)v4->_featuredSeasonConfiguration setAboveMomentAverageContentScoreThreshold:0.5];
  }
  return v4;
}

+ (void)enumerateMomentNodesBySeasonInYearFromMomentNodes:(id)a3 loggingConnection:(id)a4 usingBlock:(id)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = a4;
  id v9 = a5;
  if ([MEMORY[0x1E4F76C68] currentLocaleSupportsSeasons])
  {
    objc_super v10 = [v7 graph];
    int v11 = (void *)MEMORY[0x1E4F71F18];
    uint64_t v12 = +[PGGraphMomentNode dateOfMoment];
    v29[0] = v12;
    v13 = +[PGGraphDateNode seasonOfDate];
    v29[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    v15 = [v11 chain:v14];

    v16 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v7 relation:v15 targetsClass:objc_opt_class()];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __106__PGSeasonMemoryGenerator_enumerateMomentNodesBySeasonInYearFromMomentNodes_loggingConnection_usingBlock___block_invoke;
    v26[3] = &unk_1E68EFB38;
    id v18 = v17;
    id v27 = v18;
    [v7 enumerateUniversalStartDatesUsingBlock:v26];
    v19 = [v16 transposed];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    _DWORD v22[2] = __106__PGSeasonMemoryGenerator_enumerateMomentNodesBySeasonInYearFromMomentNodes_loggingConnection_usingBlock___block_invoke_2;
    v22[3] = &unk_1E68ED520;
    id v23 = v18;
    id v24 = v10;
    id v25 = v9;
    id v20 = v10;
    id v21 = v18;
    [v19 enumerateTargetsBySourceWithBlock:v22];
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "[PGSeasonMemoryGenerator] Current locale does not support seasons, not generating season based memories.", buf, 2u);
  }
}

void __106__PGSeasonMemoryGenerator_enumerateMomentNodesBySeasonInYearFromMomentNodes_loggingConnection_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v4 = *(void **)(a1 + 32);
  v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithUnsignedInteger:a2];
  [v4 setObject:v6 forKeyedSubscript:v7];
}

void __106__PGSeasonMemoryGenerator_enumerateMomentNodesBySeasonInYearFromMomentNodes_loggingConnection_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v44 = a2;
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v43 = v7;
  id v9 = [v7 elementIdentifiers];
  objc_super v10 = [v9 indexArray];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v60 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];
        [v8 setObject:v16 forKeyedSubscript:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v59 objects:v65 count:16];
    }
    while (v12);
  }

  id v17 = [v8 keysSortedByValueUsingSelector:sel_compare_];
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v18 = objc_alloc_init(MEMORY[0x1E4F71E60]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v55 objects:v64 count:16];
  obuint64_t j = v19;
  v50 = a4;
  if (v20)
  {
    uint64_t v21 = v20;
    v22 = 0;
    uint64_t v23 = *(void *)v56;
    while (2)
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        id v25 = v22;
        if (*(void *)v56 != v23) {
          objc_enumerationMutation(obj);
        }
        if (*a4)
        {
          id v19 = obj;
          goto LABEL_23;
        }
        v26 = *(void **)(*((void *)&v55 + 1) + 8 * j);
        uint64_t v27 = [v26 unsignedIntegerValue];
        v28 = [*(id *)(a1 + 32) objectForKeyedSubscript:v26];
        v22 = v28;
        if (v25 && ([v28 timeIntervalSinceDate:v25], v29 > 10368000.0))
        {
          [v48 addObject:v18];
          id v30 = objc_alloc_init(MEMORY[0x1E4F71E60]);

          v31 = v30;
          a4 = v50;
        }
        else
        {
          v31 = v18;
        }
        id v18 = v31;
        [v31 addIdentifier:v27];
      }
      id v19 = obj;
      uint64_t v21 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  else
  {
    v22 = 0;
  }
LABEL_23:

  if (!*a4)
  {
    if ([v18 count]) {
      [v48 addObject:v18];
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v45 = v48;
    uint64_t v47 = [v45 countByEnumeratingWithState:&v51 objects:v63 count:16];
    if (v47)
    {
      uint64_t v46 = *(void *)v52;
LABEL_28:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v52 != v46) {
          objc_enumerationMutation(v45);
        }
        if (*a4) {
          break;
        }
        v33 = *(void **)(*((void *)&v51 + 1) + 8 * v32);
        v34 = [PGGraphMomentNodeCollection alloc];
        uint64_t v35 = *(void *)(a1 + 40);
        v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F71E40]), "initWithElementIdentifier:", objc_msgSend(v33, "firstElement"));
        v37 = [(MAElementCollection *)v34 initWithGraph:v35 elementIdentifiers:v36];

        v38 = [(PGGraphMomentNodeCollection *)v37 localStartDates];
        v39 = [v38 anyObject];

        uint64_t v40 = [MEMORY[0x1E4F76C68] yearFromDate:v39];
        if ([MEMORY[0x1E4F76C68] monthFromDate:v39] == 12) {
          ++v40;
        }
        v41 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithGraph:*(void *)(a1 + 40) elementIdentifiers:v33];
        v42 = +[PGGraphYearNodeCollection yearNodesForYear:v40 inGraph:*(void *)(a1 + 40)];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        a4 = v50;
        if (v47 == ++v32)
        {
          uint64_t v47 = [v45 countByEnumeratingWithState:&v51 objects:v63 count:16];
          if (v47) {
            goto LABEL_28;
          }
          break;
        }
      }
    }

    id v19 = obj;
  }
}

@end