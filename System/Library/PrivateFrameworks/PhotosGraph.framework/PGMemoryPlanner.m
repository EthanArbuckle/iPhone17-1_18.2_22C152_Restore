@interface PGMemoryPlanner
+ (BOOL)_isFallbackMemory:(id)a3;
+ (BOOL)canElectEndOfYearTriggeredMemory:(id)a3 withAlreadyElectedMemories:(id)a4;
+ (BOOL)canElectTriggeredMemory:(id)a3 withAlreadyElectedMemories:(id)a4;
+ (double)_momentCommonalityScoreComparingMomentNodes:(id)a3 toMomentNodes:(id)a4;
+ (id)groupFutureMemoriesPerTrigger:(id)a3;
- (BOOL)tooSoonToElectMemory:(id)a3;
- (PGMemoryElectorConfiguration)configuration;
- (PGMemoryPlanner)initWithPastSource:(id)a3 futureSource:(id)a4 configuration:(id)a5 graph:(id)a6 loggingConnection:(id)a7 progressReporter:(id)a8;
- (double)_commonalityScoreComparingMemory:(id)a3 toMemory:(id)a4 momentWeight:(double)a5 featureWeight:(double)a6 memoryCategoryWeight:(double)a7;
- (double)avoidScoreForMemory:(id)a3;
- (double)categorySimilarityScoreBetweenMemory:(id)a3 andMemory:(id)a4;
- (double)collisionScoreForMemory:(id)a3;
- (double)commonalityScoreComparingMemory:(id)a3 toAlreadyElectedMemory:(id)a4;
- (double)commonalityScoreComparingMemory:(id)a3 toMemory:(id)a4;
- (double)featureCommonalityScoreComparingFeatureNodes:(id)a3 toFeatureNodes:(id)a4;
- (double)timeDecayScoreForTriggeredMemory:(id)a3 numberOfDaysToLook:(unint64_t)a4;
- (id)_overallDateIntervalForTriggeredMemories:(id)a3;
- (id)creationDateOfLastMemory;
- (id)filterMemories:(id)a3 forTriggerCollisionsWithTriggerHandler:(id)a4 graph:(id)a5 progressReporter:(id)a6;
- (id)maximumTimeDecayScoreByPastMemoryIdentifier;
- (id)similarCategorySets;
- (id)similarFeatureSets;
- (id)timeDecayScoreByPastMemoryCreationDate;
- (unint64_t)numberOfDaysSinceMemoryUpgrade;
- (void)_computeIfNeededTimeDecayScoreForPastMemories;
@end

@implementation PGMemoryPlanner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_similarFeatureSets, 0);
  objc_storeStrong((id *)&self->_secondaryFeatureOfFeature, 0);
  objc_storeStrong((id *)&self->_maximumTimeDecayScoreByPastMemoryIdentifier, 0);
  objc_storeStrong((id *)&self->_timeDecayScoreByPastMemoryCreationDate, 0);
  objc_storeStrong((id *)&self->_similarCategorySets, 0);
  objc_storeStrong((id *)&self->_currentUniversalMemoryDate, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_futureMemoriesGroupedByTrigger, 0);
  objc_storeStrong((id *)&self->_memoriesToAvoid, 0);
  objc_storeStrong((id *)&self->_pastMemories, 0);
}

- (PGMemoryElectorConfiguration)configuration
{
  return self->_configuration;
}

- (id)similarFeatureSets
{
  v12[1] = *MEMORY[0x1E4F143B8];
  similarFeatureSets = self->_similarFeatureSets;
  if (!similarFeatureSets)
  {
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    v11[0] = @"PlayTime";
    v11[1] = @"PersonToys";
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    v6 = [v4 setWithArray:v5];
    v12[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    v8 = [v4 setWithArray:v7];
    v9 = self->_similarFeatureSets;
    self->_similarFeatureSets = v8;

    similarFeatureSets = self->_similarFeatureSets;
  }
  return similarFeatureSets;
}

- (id)similarCategorySets
{
  v14[5] = *MEMORY[0x1E4F143B8];
  similarCategorySets = self->_similarCategorySets;
  if (!similarCategorySets)
  {
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    v5 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F28D3D20];
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", &unk_1F28D3D38, v5);
    v14[1] = v6;
    v7 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F28D3D50];
    v14[2] = v7;
    v8 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F28D3D68];
    v14[3] = v8;
    v9 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F28D3D80];
    v14[4] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:5];
    v11 = [v4 setWithArray:v10];
    v12 = self->_similarCategorySets;
    self->_similarCategorySets = v11;

    similarCategorySets = self->_similarCategorySets;
  }
  return similarCategorySets;
}

- (double)categorySimilarityScoreBetweenMemory:(id)a3 andMemory:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 memoryCategory];
  uint64_t v9 = [v7 memoryCategory];
  v10 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F28D3D08];
  v11 = [NSNumber numberWithUnsignedInteger:v8];
  if ([v10 containsObject:v11])
  {
    v12 = [NSNumber numberWithUnsignedInteger:v9];
    v13 = v10;
    int v14 = [v10 containsObject:v12];

    if (v14)
    {
      v15 = [v6 memoryFeatureNodes];
      v16 = +[PGGraphNodeCollection subsetInCollection:v15];

      v17 = [v16 parentMeaningNodes];
      v18 = [v16 collectionByFormingUnionWith:v17];

      v19 = [v7 memoryFeatureNodes];
      v20 = +[PGGraphNodeCollection subsetInCollection:v19];

      v21 = [v20 parentMeaningNodes];
      v22 = [v20 collectionByFormingUnionWith:v21];

      if ([v18 intersectsCollection:v22]) {
        double v23 = 1.0;
      }
      else {
        double v23 = 0.0;
      }

      goto LABEL_22;
    }
  }
  else
  {
    v13 = v10;
  }
  double v23 = 1.0;
  if (v8 != v9)
  {
    [(PGMemoryPlanner *)self similarCategorySets];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v41 count:16];
    double v23 = 0.0;
    if (v25)
    {
      uint64_t v26 = v25;
      v34 = v13;
      id v35 = v7;
      id v36 = v6;
      uint64_t v27 = *(void *)v38;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v38 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v37 + 1) + 8 * v28);
          v30 = [NSNumber numberWithUnsignedInteger:v8];
          if ([v29 containsObject:v30])
          {
            v31 = [NSNumber numberWithUnsignedInteger:v9];
            char v32 = [v29 containsObject:v31];

            if (v32)
            {
              double v23 = 1.0;
              goto LABEL_20;
            }
          }
          else
          {
          }
          ++v28;
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v26);
LABEL_20:
      id v7 = v35;
      id v6 = v36;
      v13 = v34;
    }
  }
LABEL_22:

  return v23;
}

- (double)_commonalityScoreComparingMemory:(id)a3 toMemory:(id)a4 momentWeight:(double)a5 featureWeight:(double)a6 memoryCategoryWeight:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  double v14 = 0.0;
  double v15 = 0.0;
  if (a5 > 0.0)
  {
    v16 = objc_opt_class();
    v17 = [v12 memoryMomentNodes];
    v18 = [v13 memoryMomentNodes];
    [v16 _momentCommonalityScoreComparingMomentNodes:v17 toMomentNodes:v18];
    double v15 = v19;
  }
  if (a6 > 0.0)
  {
    v20 = [v12 memoryFeatureNodes];
    v21 = [v13 memoryFeatureNodes];
    [(PGMemoryPlanner *)self featureCommonalityScoreComparingFeatureNodes:v20 toFeatureNodes:v21];
    double v14 = v22;
  }
  double v23 = 0.0;
  double v24 = 0.0;
  if (a7 > 0.0) {
    -[PGMemoryPlanner categorySimilarityScoreBetweenMemory:andMemory:](self, "categorySimilarityScoreBetweenMemory:andMemory:", v12, v13, 0.0);
  }
  double v25 = a5 + a6 + a7;
  if (v25 > 0.0) {
    double v23 = (v14 * a6 + v15 * a5 + v24 * a7) / v25;
  }

  return v23;
}

- (double)commonalityScoreComparingMemory:(id)a3 toAlreadyElectedMemory:(id)a4
{
  [(PGMemoryPlanner *)self _commonalityScoreComparingMemory:a3 toMemory:a4 momentWeight:0.5 featureWeight:1.0 memoryCategoryWeight:1.0];
  return result;
}

- (double)commonalityScoreComparingMemory:(id)a3 toMemory:(id)a4
{
  [(PGMemoryPlanner *)self _commonalityScoreComparingMemory:a3 toMemory:a4 momentWeight:1.0 featureWeight:0.75 memoryCategoryWeight:0.25];
  return result;
}

- (double)featureCommonalityScoreComparingFeatureNodes:(id)a3 toFeatureNodes:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 labels];
  uint64_t v9 = [v7 labels];
  [(PGMemoryPlanner *)self similarFeatureSets];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if [v15 intersectsSet:v8] && (objc_msgSend(v15, "intersectsSet:", v9))
        {
          double v24 = 1.0;
          v16 = v10;
          goto LABEL_18;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v16 = [v6 collectionByIntersecting:v7];
  uint64_t v17 = [v16 count];
  if (v17)
  {
    unint64_t v18 = v17;
    double v19 = +[MANodeCollection nodesRelatedToNodes:v6 withRelation:self->_secondaryFeatureOfFeature];
    unint64_t v20 = [v19 count];
    unint64_t v21 = [v6 count];
    if (!v20 || v21 == v20)
    {
      double v24 = (double)v18 / (double)v21;
    }
    else
    {
      unint64_t v26 = v21 - v20;
      double v22 = +[MANodeCollection nodesRelatedToNodes:v16 withRelation:self->_secondaryFeatureOfFeature];
      unint64_t v23 = [v22 count];
      double v24 = ((double)(v18 - v23) / (double)v26 + (double)v23 / (double)v20 * 0.5) / 1.5;
    }
  }
  else
  {
    double v24 = 0.0;
  }
LABEL_18:

  return v24;
}

- (double)avoidScoreForMemory:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_memoriesToAvoid;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    double v8 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1D25FED50]();
        uint64_t v12 = [v4 uniqueMemoryIdentifier];
        uint64_t v13 = [v10 uniqueMemoryIdentifier];
        int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          double v8 = 1.0;
          goto LABEL_12;
        }
        [(PGMemoryPlanner *)self _commonalityScoreComparingMemory:v4 toMemory:v10 momentWeight:1.0 featureWeight:0.0 memoryCategoryWeight:0.0];
        double v8 = fmax(v8, v15);
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v8 = 0.0;
  }
LABEL_12:

  return v8;
}

- (double)collisionScoreForMemory:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  [(PGMemoryPlanner *)self _computeIfNeededTimeDecayScoreForPastMemories];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v4 = self->_pastMemories;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (!v5)
  {

    double v8 = 0.0;
    long long v20 = v46;
LABEL_12:
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    obj = self->_futureMemoriesGroupedByTrigger;
    uint64_t v43 = [(NSArray *)obj countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v43)
    {
      uint64_t v42 = *(void *)v53;
LABEL_14:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v53 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v21;
        double v22 = *(void **)(*((void *)&v52 + 1) + 8 * v21);
        context = (void *)MEMORY[0x1D25FED50]();
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v47 = v22;
        uint64_t v23 = [v47 countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v49;
          double v26 = 1.0;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v49 != v25) {
                objc_enumerationMutation(v47);
              }
              long long v28 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              long long v29 = [v20 uniqueMemoryIdentifier];
              long long v30 = [v28 uniqueMemoryIdentifier];
              if ([v29 isEqualToString:v30])
              {
                v31 = [v20 triggerTypes];
                uint64_t v32 = [v28 triggerTypes];
                char v33 = [v31 containsIndexes:v32];

                long long v20 = v46;
                if (v33)
                {
                  double v26 = 0.0;
                  goto LABEL_32;
                }
              }
              else
              {
              }
              [(PGMemoryPlanner *)self commonalityScoreComparingMemory:v20 toMemory:v28];
              double v35 = v34;
              [(PGMemoryPlanner *)self timeDecayScoreForTriggeredMemory:v28 numberOfDaysToLook:[(PGMemoryElectorConfiguration *)self->_configuration numberOfDaysToLookInFuture]];
              double v37 = v36;
              +[PGMemoryTriggerHandler triggerScoreForTriggeredMemory:v28];
              double v39 = fmin(v35 * v37 * v38, 1.0);
              if (v39 < v26) {
                double v26 = v39;
              }
            }
            uint64_t v24 = [v47 countByEnumeratingWithState:&v48 objects:v60 count:16];
          }
          while (v24);
        }
        else
        {
          double v26 = 1.0;
        }
LABEL_32:

        double v8 = fmax(v8, v26);
        if (v26 == 1.0) {
          break;
        }
        uint64_t v21 = v44 + 1;
        if (v44 + 1 == v43)
        {
          uint64_t v43 = [(NSArray *)obj countByEnumeratingWithState:&v52 objects:v61 count:16];
          if (v43) {
            goto LABEL_14;
          }
          break;
        }
      }
    }

    goto LABEL_36;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v57;
  double v8 = 0.0;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v57 != v7) {
      objc_enumerationMutation(v4);
    }
    id v10 = *(void **)(*((void *)&v56 + 1) + 8 * v9);
    uint64_t v11 = (void *)MEMORY[0x1D25FED50]();
    [(PGMemoryPlanner *)self commonalityScoreComparingMemory:v46 toMemory:v10];
    double v13 = v12;
    int v14 = [(PGMemoryPlanner *)self timeDecayScoreByPastMemoryCreationDate];
    double v15 = [v10 creationDate];
    v16 = [v14 objectForKeyedSubscript:v15];
    [v16 doubleValue];
    double v18 = v17;

    double v19 = v13 * v18;
    double v8 = fmax(v8, v19);
    if (v19 >= 1.0) {
      break;
    }
    if (v6 == ++v9)
    {
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v56 objects:v62 count:16];
      if (v6) {
        goto LABEL_3;
      }
      break;
    }
  }

  long long v20 = v46;
  if (v8 < 1.0) {
    goto LABEL_12;
  }
LABEL_36:

  return v8;
}

- (double)timeDecayScoreForTriggeredMemory:(id)a3 numberOfDaysToLook:(unint64_t)a4
{
  uint64_t v6 = [a3 creationDate];
  [v6 timeIntervalSinceDate:self->_currentUniversalMemoryDate];
  double v8 = fabs(v7);

  return fmax(fmin((v8 / 86400.0 - (double)a4)/ ((double)[(PGMemoryElectorConfiguration *)self->_configuration minimumNumberOfDaysBeforeTimeDecay]- (double)a4), 1.0), 0.0);
}

- (unint64_t)numberOfDaysSinceMemoryUpgrade
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = self->_loggingConnection;
  os_signpost_id_t v4 = os_signpost_id_generate((os_log_t)v3);
  uint64_t v5 = v3;
  uint64_t v6 = v5;
  unint64_t v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PGMemoryPlannerNumberOfDaysSinceMemoryUpgrade", "", buf, 2u);
  }
  os_signpost_id_t spid = v4;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v26 = mach_absolute_time();
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = self->_pastMemories;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_msgSend(v14, "photosGraphVersion", spid);
        if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() >= 0x301)
        {
          double v15 = (void *)MEMORY[0x1E4F76C68];
          v16 = [v14 creationDate];
          double v17 = [v15 startOfDayForDate:v16];

          [v8 addObject:v17];
        }
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v11);
  }

  unint64_t v18 = [v8 count];
  uint64_t v19 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  double v22 = v6;
  uint64_t v23 = v22;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v23, OS_SIGNPOST_INTERVAL_END, spid, "PGMemoryPlannerNumberOfDaysSinceMemoryUpgrade", "", buf, 2u);
  }

  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    char v33 = "PGMemoryPlannerNumberOfDaysSinceMemoryUpgrade";
    __int16 v34 = 2048;
    double v35 = (float)((float)((float)((float)(v19 - v26) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v18;
}

- (id)creationDateOfLastMemory
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_pastMemories;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "creationDate", (void)v12);
        uint64_t v9 = (void *)v8;
        if (v5)
        {
          uint64_t v10 = [v5 laterDate:v8];

          uint64_t v5 = (void *)v10;
        }
        else
        {
          uint64_t v5 = (void *)v8;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_overallDateIntervalForTriggeredMemories:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__17336;
  long long v28 = __Block_byref_object_dispose__17337;
  id v29 = [MEMORY[0x1E4F1C9C8] distantFuture];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [*(id *)(*((void *)&v20 + 1) + 8 * i) validityIntervalByTriggerType];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __60__PGMemoryPlanner__overallDateIntervalForTriggeredMemories___block_invoke;
        v19[3] = &unk_1E68E6878;
        v19[4] = &v24;
        [v9 enumerateKeysAndObjectsUsingBlock:v19];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [PGMemoryDate alloc];
  uint64_t v11 = [(PGMemoryElectorConfiguration *)self->_configuration localDate];
  long long v12 = [(PGMemoryDate *)v10 initWithLocalDate:v11];

  long long v13 = [(PGMemoryElectorConfiguration *)self->_configuration timeZone];
  long long v14 = [(PGMemoryDate *)v12 universalDateInTimeZone:v13];

  long long v15 = [v14 earlierDate:v25[5]];
  v16 = [v14 laterDate:v25[5]];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v15 endDate:v16];

  _Block_object_dispose(&v24, 8);
  return v17;
}

void __60__PGMemoryPlanner__overallDateIntervalForTriggeredMemories___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v8 = [a3 startDate];
  uint64_t v5 = [v4 earlierDate:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)filterMemories:(id)a3 forTriggerCollisionsWithTriggerHandler:(id)a4 graph:(id)a5 progressReporter:(id)a6
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v89 = a4;
  id v73 = a5;
  id v11 = a6;
  v74 = v10;
  v72 = v11;
  if ([v10 count])
  {
    id v83 = v11;
    long long v12 = self->_loggingConnection;
    os_signpost_id_t v13 = os_signpost_id_generate((os_log_t)v12);
    long long v14 = v12;
    long long v15 = v14;
    unint64_t v67 = v13 - 1;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "MemoryElectionFilterMemoriesTriggerCollision", "", buf, 2u);
    }
    os_signpost_id_t spid = v13;
    v71 = v15;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v66 = mach_absolute_time();
    v68 = [(PGMemoryPlanner *)self _overallDateIntervalForTriggeredMemories:v10];
    v16 = [v68 startDate];
    uint64_t v17 = [(PGMemoryElectorConfiguration *)self->_configuration pastMemoryCollisionUniversalDateInterval];
    uint64_t v18 = [v17 startDate];

    v69 = (void *)v18;
    v70 = v16;
    if ([v16 compare:v18] == -1)
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v113 = v16;
        *(_WORD *)&v113[8] = 2112;
        *(void *)&v113[10] = v18;
        _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGMemoryPlanner] The overall valid date interval for all triggered memories (startDate: %@) extends past the past memories date interval (startDate: %@)", buf, 0x16u);
      }
    }
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    v76 = self;
    long long v21 = self->_pastMemories;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v107 objects:v119 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v108;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v108 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v107 + 1) + 8 * i);
          long long v27 = objc_msgSend(v26, "triggerTypes", spid);
          v104[0] = MEMORY[0x1E4F143A8];
          v104[1] = 3221225472;
          v104[2] = __96__PGMemoryPlanner_filterMemories_forTriggerCollisionsWithTriggerHandler_graph_progressReporter___block_invoke;
          v104[3] = &unk_1E68EFDD8;
          id v105 = v20;
          v106 = v26;
          [v27 enumerateIndexesUsingBlock:v104];
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v107 objects:v119 count:16];
      }
      while (v23);
    }

    unint64_t v28 = [v74 count];
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    obuint64_t j = v74;
    v77 = v29;
    uint64_t v79 = [obj countByEnumeratingWithState:&v100 objects:v118 count:16];
    if (v79)
    {
      double v30 = 1.0 / (double)v28;
      uint64_t v78 = *(void *)v101;
      double v31 = 0.0;
      id v81 = v20;
      while (2)
      {
        for (uint64_t j = 0; j != v79; ++j)
        {
          if (*(void *)v101 != v78) {
            objc_enumerationMutation(obj);
          }
          char v33 = *(void **)(*((void *)&v100 + 1) + 8 * j);
          __int16 v34 = (void *)MEMORY[0x1D25FED50]();
          v91 = v33;
          double v35 = [v33 validityIntervalByTriggerType];
          long long v96 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          id v36 = v35;
          uint64_t v37 = [v36 countByEnumeratingWithState:&v96 objects:v117 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v97;
            uint64_t v84 = j;
            v85 = v34;
            v88 = v36;
            uint64_t v80 = *(void *)v97;
            do
            {
              uint64_t v40 = 0;
              uint64_t v82 = v38;
              do
              {
                if (*(void *)v97 != v39) {
                  objc_enumerationMutation(v36);
                }
                v41 = *(void **)(*((void *)&v96 + 1) + 8 * v40);
                uint64_t v42 = objc_msgSend(v20, "objectForKeyedSubscript:", v41, spid);
                if ([v42 count])
                {
                  uint64_t v87 = v40;
                  uint64_t v90 = [v41 unsignedIntegerValue];
                  uint64_t v43 = [v36 objectForKeyedSubscript:v41];
                  long long v92 = 0u;
                  long long v93 = 0u;
                  long long v94 = 0u;
                  long long v95 = 0u;
                  v86 = v42;
                  id v44 = v42;
                  uint64_t v45 = [v44 countByEnumeratingWithState:&v92 objects:v116 count:16];
                  if (v45)
                  {
                    uint64_t v46 = v45;
                    uint64_t v47 = *(void *)v93;
                    while (2)
                    {
                      for (uint64_t k = 0; k != v46; ++k)
                      {
                        if (*(void *)v93 != v47) {
                          objc_enumerationMutation(v44);
                        }
                        long long v49 = *(void **)(*((void *)&v92 + 1) + 8 * k);
                        long long v50 = [v49 creationDate];
                        int v51 = [v43 containsDate:v50];

                        if (v51)
                        {
                          long long v52 = [v91 memoryFeatureNodes];
                          long long v53 = [v89 relevantFeatureNodesInFeatureNodes:v52 forTriggerType:v90];

                          long long v54 = [v49 memoryFeatureNodes];
                          long long v55 = [v54 collectionByIntersecting:v53];
                          uint64_t v56 = [v55 count];

                          if (v56 == [v53 count])
                          {
                            long long v57 = v76->_loggingConnection;
                            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                            {
                              *(_DWORD *)buf = 138412802;
                              *(void *)v113 = v91;
                              *(_WORD *)&v113[8] = 2112;
                              *(void *)&v113[10] = v49;
                              __int16 v114 = 2112;
                              v115 = v43;
                              _os_log_debug_impl(&dword_1D1805000, v57, OS_LOG_TYPE_DEBUG, "[PGMemoryPlanner] Triggered memory (%@) collides with past triggered memory (%@) in validity interval %@", buf, 0x20u);
                            }

                            id v36 = v88;
                            id v20 = v81;
                            id v29 = v77;
                            uint64_t j = v84;
                            __int16 v34 = v85;
                            goto LABEL_43;
                          }
                        }
                      }
                      uint64_t v46 = [v44 countByEnumeratingWithState:&v92 objects:v116 count:16];
                      if (v46) {
                        continue;
                      }
                      break;
                    }
                  }

                  uint64_t v39 = v80;
                  id v20 = v81;
                  uint64_t v40 = v87;
                  id v36 = v88;
                  uint64_t v38 = v82;
                  uint64_t v42 = v86;
                }

                ++v40;
              }
              while (v40 != v38);
              uint64_t v38 = [v36 countByEnumeratingWithState:&v96 objects:v117 count:16];
              id v29 = v77;
              uint64_t j = v84;
              __int16 v34 = v85;
            }
            while (v38);
          }

          [v29 addObject:v91];
LABEL_43:
          double v31 = v30 + v31;
          if (objc_msgSend(v83, "isCancelledWithProgress:", v31, spid))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v113 = 226;
              *(_WORD *)&v113[4] = 2080;
              *(void *)&v113[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Memories/PGMemoryPlanner.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            id v63 = (id)MEMORY[0x1E4F1CBF0];
            goto LABEL_55;
          }
        }
        uint64_t v79 = [obj countByEnumeratingWithState:&v100 objects:v118 count:16];
        if (v79) {
          continue;
        }
        break;
      }
    }

    uint64_t v58 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v61 = v71;
    v62 = v61;
    if (v67 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v62, OS_SIGNPOST_INTERVAL_END, spid, "MemoryElectionFilterMemoriesTriggerCollision", "", buf, 2u);
    }

    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v113 = "MemoryElectionFilterMemoriesTriggerCollision";
      *(_WORD *)&v113[8] = 2048;
      *(double *)&v113[10] = (float)((float)((float)((float)(v58 - v66) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v62, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    id v29 = v77;
    id v63 = v77;
LABEL_55:
  }
  else
  {
    id v63 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v63;
}

void __96__PGMemoryPlanner_filterMemories_forTriggerCollisionsWithTriggerHandler_graph_progressReporter___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [NSNumber numberWithUnsignedInteger:a2];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
  [v3 addObject:*(void *)(a1 + 40)];
}

- (BOOL)tooSoonToElectMemory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PGMemoryPlanner *)self maximumTimeDecayScoreByPastMemoryIdentifier];
  uint64_t v6 = [v4 uniqueMemoryIdentifier];

  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  [v7 doubleValue];
  double v9 = v8;

  return v9 == 1.0;
}

- (void)_computeIfNeededTimeDecayScoreForPastMemories
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!self->_timeDecayScoreByPastMemoryCreationDate)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = self->_pastMemories;
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v25;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(obj);
          }
          double v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
          [(PGMemoryPlanner *)self timeDecayScoreForTriggeredMemory:v9 numberOfDaysToLook:[(PGMemoryElectorConfiguration *)self->_configuration numberOfDaysToLookInPast]];
          double v11 = v10;
          long long v12 = objc_msgSend(NSNumber, "numberWithDouble:");
          os_signpost_id_t v13 = [v9 creationDate];
          [(NSMutableDictionary *)v3 setObject:v12 forKeyedSubscript:v13];

          long long v14 = [v9 uniqueMemoryIdentifier];
          long long v15 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:v14];
          [v15 doubleValue];
          double v17 = v16;

          if (v17 >= v11) {
            double v18 = v17;
          }
          else {
            double v18 = v11;
          }
          uint64_t v19 = [NSNumber numberWithDouble:v18];
          [(NSMutableDictionary *)v4 setObject:v19 forKeyedSubscript:v14];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v6);
    }

    timeDecayScoreByPastMemoryCreationDate = self->_timeDecayScoreByPastMemoryCreationDate;
    self->_timeDecayScoreByPastMemoryCreationDate = v3;
    long long v21 = v3;

    maximumTimeDecayScoreByPastMemoryIdentifier = self->_maximumTimeDecayScoreByPastMemoryIdentifier;
    self->_maximumTimeDecayScoreByPastMemoryIdentifier = v4;
  }
}

- (id)maximumTimeDecayScoreByPastMemoryIdentifier
{
  [(PGMemoryPlanner *)self _computeIfNeededTimeDecayScoreForPastMemories];
  maximumTimeDecayScoreByPastMemoryIdentifier = self->_maximumTimeDecayScoreByPastMemoryIdentifier;
  return maximumTimeDecayScoreByPastMemoryIdentifier;
}

- (id)timeDecayScoreByPastMemoryCreationDate
{
  [(PGMemoryPlanner *)self _computeIfNeededTimeDecayScoreForPastMemories];
  timeDecayScoreByPastMemoryCreationDate = self->_timeDecayScoreByPastMemoryCreationDate;
  return timeDecayScoreByPastMemoryCreationDate;
}

- (PGMemoryPlanner)initWithPastSource:(id)a3 futureSource:(id)a4 configuration:(id)a5 graph:(id)a6 loggingConnection:(id)a7 progressReporter:(id)a8
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v58.receiver = self;
  v58.super_class = (Class)PGMemoryPlanner;
  id v20 = [(PGMemoryPlanner *)&v58 init];
  long long v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_loggingConnection, a7);
    objc_storeStrong((id *)&v21->_configuration, a5);
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F71F10]) initWithProgressReporter:v19];
    uint64_t v23 = [v22 childProgressReporterToCheckpoint:0.3];
    uint64_t v24 = [v22 childProgressReporterToCheckpoint:0.6];
    long long v52 = v22;
    long long v57 = [v22 childProgressReporterToCheckpoint:1.0];
    int v51 = (void *)v23;
    uint64_t v25 = [v14 pastMemoriesForConfiguration:v21->_configuration withGraph:v17 progressReporter:v23];
    pastMemories = v21->_pastMemories;
    v21->_pastMemories = (NSArray *)v25;

    if (([v19 isCancelled] & 1) == 0)
    {
      [v15 futureMemoriesForConfiguration:v21->_configuration withGraph:v17 progressReporter:v24];
      v28 = id v27 = v19;
      uint64_t v29 = [(id)objc_opt_class() groupFutureMemoriesPerTrigger:v28];
      futureMemoriesGroupedByTrigger = v21->_futureMemoriesGroupedByTrigger;
      v21->_futureMemoriesGroupedByTrigger = (NSArray *)v29;

      id v19 = v27;
    }
    long long v50 = (void *)v24;
    id v54 = v18;
    id v55 = v16;
    id v56 = v15;
    id v53 = v19;
    if (([v19 isCancelled] & 1) == 0)
    {
      uint64_t v31 = [v14 memoriesToAvoidForConfiguration:v21->_configuration withGraph:v17 progressReporter:v57];
      memoriesToAvoid = v21->_memoriesToAvoid;
      v21->_memoriesToAvoid = (NSArray *)v31;
    }
    char v33 = [PGMemoryDate alloc];
    __int16 v34 = [(PGMemoryElectorConfiguration *)v21->_configuration localDate];
    double v35 = [(PGMemoryDate *)v33 initWithLocalDate:v34];

    id v36 = [(PGMemoryElectorConfiguration *)v21->_configuration timeZone];
    uint64_t v37 = [(PGMemoryDate *)v35 universalDateInTimeZone:v36];
    currentUniversalMemoryDate = v21->_currentUniversalMemoryDate;
    v21->_currentUniversalMemoryDate = (NSDate *)v37;

    uint64_t v39 = (void *)MEMORY[0x1E4F71F18];
    uint64_t v40 = +[PGGraphCalendarUnitNodeCollection filter];
    v41 = [v40 relation];
    v59[0] = v41;
    uint64_t v42 = +[PGGraphOverTheYearsNode filter];
    [v42 relation];
    v44 = id v43 = v14;
    v59[1] = v44;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
    uint64_t v46 = v45 = v17;
    uint64_t v47 = [v39 union:v46];
    secondaryFeatureOfFeature = v21->_secondaryFeatureOfFeature;
    v21->_secondaryFeatureOfFeature = (MARelation *)v47;

    id v17 = v45;
    id v14 = v43;

    id v16 = v55;
    id v15 = v56;
    id v19 = v53;
    id v18 = v54;
  }

  return v21;
}

+ (double)_momentCommonalityScoreComparingMomentNodes:(id)a3 toMomentNodes:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 collectionByIntersecting:a4];
  unint64_t v7 = [v6 count];
  if (v7) {
    double v8 = (double)v7 / (double)(unint64_t)[v5 count];
  }
  else {
    double v8 = 0.0;
  }

  return v8;
}

+ (id)groupFutureMemoriesPerTrigger:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v3 = [v21 sortedArrayUsingComparator:&__block_literal_global_17364];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v3;
  uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  id v7 = 0;
  if (v25)
  {
    uint64_t v8 = *(void *)v27;
    uint64_t v22 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      double v10 = v7;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
        if (!v10)
        {
LABEL_9:
          [v6 addObject:v11];
          goto LABEL_12;
        }
        long long v12 = [v10 creationDate];
        os_signpost_id_t v13 = [v11 creationDate];
        if ([v5 isDate:v12 inSameDayAsDate:v13])
        {
          id v14 = [v10 triggerTypes];
          [v11 triggerTypes];
          id v15 = v6;
          id v16 = v5;
          v18 = id v17 = v4;
          int v24 = [v14 containsIndexes:v18];

          id v4 = v17;
          id v5 = v16;
          id v6 = v15;
          uint64_t v8 = v22;

          if (v24) {
            goto LABEL_9;
          }
        }
        else
        {
        }
        [v4 addObject:v6];
        uint64_t v19 = [MEMORY[0x1E4F1CA48] arrayWithObject:v11];

        id v6 = (id)v19;
LABEL_12:
        id v7 = v11;

        ++v9;
        double v10 = v7;
      }
      while (v25 != v9);
      uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v25);
  }

  [v4 addObject:v6];
  return v4;
}

uint64_t __49__PGMemoryPlanner_groupFutureMemoriesPerTrigger___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  id v6 = [v4 creationDate];
  id v7 = [v5 creationDate];
  uint64_t v8 = [v6 compare:v7];

  uint64_t v25 = v8;
  uint64_t v9 = v23[3];
  if (!v9)
  {
    double v10 = [v4 triggerTypes];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __49__PGMemoryPlanner_groupFutureMemoriesPerTrigger___block_invoke_2;
    uint64_t v19 = &unk_1E68ECC38;
    id v11 = v5;
    id v20 = v11;
    id v21 = &v22;
    [v10 enumerateIndexesUsingBlock:&v16];

    if (!v23[3])
    {
      long long v12 = objc_msgSend(v4, "uniqueMemoryIdentifier", v16, v17, v18, v19);
      os_signpost_id_t v13 = [v11 uniqueMemoryIdentifier];
      uint64_t v14 = [v12 compare:v13];
      v23[3] = v14;
    }
    uint64_t v9 = v23[3];
  }
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __49__PGMemoryPlanner_groupFutureMemoriesPerTrigger___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [*(id *)(a1 + 32) triggerTypes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PGMemoryPlanner_groupFutureMemoriesPerTrigger___block_invoke_3;
  v7[3] = &unk_1E68E68C0;
  v7[4] = *(void *)(a1 + 40);
  v7[5] = a2;
  v7[6] = a3;
  [v6 enumerateIndexesUsingBlock:v7];
}

void __49__PGMemoryPlanner_groupFutureMemoriesPerTrigger___block_invoke_3(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  id v7 = [NSNumber numberWithUnsignedInteger:a2];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 compare:v7];

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    **(unsigned char **)(a1 + 48) = 1;
    *a3 = 1;
  }
}

+ (BOOL)canElectEndOfYearTriggeredMemory:(id)a3 withAlreadyElectedMemories:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "triggerTypes", (void)v13);
        int v10 = [v9 containsIndex:5];

        if (!v10)
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

+ (BOOL)canElectTriggeredMemory:(id)a3 withAlreadyElectedMemories:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count] && (objc_msgSend(a1, "_isFallbackMemory:", v6) & 1) == 0)
  {
    int v10 = [v6 triggerTypes];
    int v11 = [v10 containsIndex:5];

    if (v11)
    {
      char v8 = [a1 canElectEndOfYearTriggeredMemory:v6 withAlreadyElectedMemories:v7];
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v12 = v7;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            uint64_t v18 = objc_msgSend(v6, "triggerTypes", (void)v21);
            uint64_t v19 = [v17 triggerTypes];
            char v20 = [v18 isEqualToIndexSet:v19];

            if (v20)
            {
              char v8 = 0;
              goto LABEL_17;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
      char v8 = 1;
LABEL_17:
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

+ (BOOL)_isFallbackMemory:(id)a3
{
  id v3 = a3;
  id v4 = [v3 triggerTypes];
  if ([v4 count])
  {
    uint64_t v5 = [v3 triggerTypes];
    char v6 = [v5 containsIndex:0];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

@end