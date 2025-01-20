@interface PGMemoryTriggerRecentTrip
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerRecentTrip

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v32 = 38;
      __int16 v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentTrip.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v12 = [v8 localDate];
    v13 = [v8 timeZone];
    v14 = +[PGMemoryTrigger dateNodesInGraph:v9 startDayOffset:-8 endDayOffset:-1 fromLocalDate:v12 inTimeZone:v13];

    v27 = v14;
    v15 = [v14 momentNodes];
    v16 = [v15 highlightNodes];

    v26 = v16;
    v17 = [v16 momentNodes];
    v18 = [v17 memoryNodes];

    v19 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:19 inGraph:v9];
    v20 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:18 inGraph:v9];
    v21 = [v19 collectionByFormingUnionWith:v20];
    v22 = [v21 collectionByIntersecting:v18];
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __82__PGMemoryTriggerRecentTrip_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v28[3] = &unk_1E68ED2C0;
    v28[4] = self;
    id v29 = v8;
    id v24 = v23;
    id v30 = v24;
    [v22 enumerateIdentifiersAsCollectionsWithBlock:v28];
    if ([v10 isCancelledWithProgress:1.0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v32 = 63;
        __int16 v33 = 2080;
        v34 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentTrip.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v11 = v24;
    }
  }
  return v11;
}

void __82__PGMemoryTriggerRecentTrip_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [v4 featureNodes];
  id v17 = +[PGGraphNodeCollection subsetInCollection:v5];

  v6 = [v17 highlightNodes];
  v7 = [v6 momentNodes];
  id v8 = [v7 dateNodes];
  id v9 = [v8 localDateInterval];
  id v10 = [v9 endDate];

  id v11 = [v10 dateByAddingTimeInterval:691200.0];
  v12 = objc_opt_class();
  v13 = [*(id *)(a1 + 40) timeZone];
  v14 = [v12 validityIntervalForLocalStartDate:v10 localEndDate:v11 timeZone:v13];

  v15 = *(void **)(a1 + 48);
  v16 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v4 withValidityInterval:v14];

  [v15 addObjectsFromArray:v16];
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  v3 = +[PGGraphNodeCollection subsetInCollection:a3];
  id v4 = [v3 featureNodeCollection];

  return v4;
}

- (unint64_t)triggerType
{
  return 14;
}

@end