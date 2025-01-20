@interface PGMemoryTriggerRecentTrendsMoment
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (id)trendsSceneFeatureNodesInGraph:(id)a3;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerRecentTrendsMoment

- (void).cxx_destruct
{
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v33 = 42;
      __int16 v34 = 2080;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentTrendsMoment.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12 = [v8 localDate];
    v13 = [v8 timeZone];
    v14 = +[PGMemoryTrigger dateNodesInGraph:v9 startDayOffset:-8 endDayOffset:-1 fromLocalDate:v12 inTimeZone:v13];

    v27 = v14;
    v15 = [v14 momentNodes];
    v16 = [(PGMemoryTriggerRecentTrendsMoment *)self trendsSceneFeatureNodesInGraph:v9];
    v17 = [v16 momentNodes];
    v18 = [v15 collectionByIntersecting:v17];
    if ([v18 count])
    {
      v19 = [v16 featureNodeCollection];
      v20 = [v19 memoryNodes];

      v21 = [v18 memoryNodes];
      [v21 collectionByIntersecting:v20];
      id v26 = v9;
      v22 = v17;
      v24 = v23 = v15;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __90__PGMemoryTriggerRecentTrendsMoment_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
      v29[3] = &unk_1E68ED2C0;
      v29[4] = self;
      id v30 = v8;
      id v31 = v28;
      [v24 enumerateIdentifiersAsCollectionsWithBlock:v29];

      v15 = v23;
      v17 = v22;
      id v9 = v26;
    }
    if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0, v26))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v33 = 75;
        __int16 v34 = 2080;
        v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentTrendsMoment.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v11 = v28;
    }
  }
  return v11;
}

void __90__PGMemoryTriggerRecentTrendsMoment_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [v4 momentNodes];
  v6 = [v5 dateNodes];
  v7 = [v6 localDateInterval];
  id v15 = [v7 endDate];

  id v8 = [v15 dateByAddingTimeInterval:86400.0];
  id v9 = [v15 dateByAddingTimeInterval:691200.0];
  id v10 = objc_opt_class();
  id v11 = [*(id *)(a1 + 40) timeZone];
  v12 = [v10 validityIntervalForLocalStartDate:v8 localEndDate:v9 timeZone:v11];

  v13 = *(void **)(a1 + 48);
  v14 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v4 withValidityInterval:v12];

  [v13 addObjectsFromArray:v14];
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  v3 = +[PGGraphNodeCollection subsetInCollection:a3];
  id v4 = [v3 featureNodeCollection];

  return v4;
}

- (unint64_t)triggerType
{
  return 27;
}

- (id)trendsSceneFeatureNodesInGraph:(id)a3
{
  trendsSceneFeatureNodes = self->_trendsSceneFeatureNodes;
  if (!trendsSceneFeatureNodes)
  {
    id v5 = a3;
    v6 = +[PGTrendsMemoryGenerator allTrendSceneFeatureLabels];
    v7 = +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneNames:v6 inGraph:v5];

    id v8 = self->_trendsSceneFeatureNodes;
    self->_trendsSceneFeatureNodes = v7;

    trendsSceneFeatureNodes = self->_trendsSceneFeatureNodes;
  }
  return trendsSceneFeatureNodes;
}

@end