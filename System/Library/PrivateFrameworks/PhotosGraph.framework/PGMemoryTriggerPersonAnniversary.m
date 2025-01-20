@interface PGMemoryTriggerPersonAnniversary
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerPersonAnniversary

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v25 = 30;
      __int16 v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerPersonAnniversary.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v11 = [v7 localDate];
    v12 = +[PGGraphMonthDayNodeCollection monthDayNodesForLocalDate:v11 inGraph:v8];

    v13 = [v12 anniversaryPersonNodes];
    v14 = [v13 featureNodeCollection];
    v15 = [v14 memoryNodes];

    v16 = [v15 filteredCollectionUsingBlock:&__block_literal_global_56234];
    if ([v16 count])
    {
      v23 = v12;
      v17 = +[PGGraphNodeCollection nodesInGraph:v8];
      v18 = [v17 featureNodeCollection];
      v19 = [v18 memoryNodes];
      v20 = [v16 collectionBySubtracting:v19];

      v21 = [(id)objc_opt_class() singleDayValidityIntervalWithContext:v7];
      if ([v9 isCancelledWithProgress:1.0])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v25 = 44;
          __int16 v26 = 2080;
          v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerPersonAnniversary.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        v10 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v20 withValidityInterval:v21];
      }
      v12 = v23;
    }
    else
    {
      if ([v9 isCancelledWithProgress:1.0]
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v25 = 37;
        __int16 v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerPersonAnniversary.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E4F1CBF0];
      v20 = v16;
    }
  }
  return v10;
}

BOOL __89__PGMemoryTriggerPersonAnniversary_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 featureNodes];
  v3 = +[PGGraphNodeCollection subsetInCollection:v2];
  BOOL v4 = [v3 count] == 1;

  return v4;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  v3 = +[PGGraphNodeCollection subsetInCollection:a3];
  BOOL v4 = [v3 featureNodeCollection];

  return v4;
}

- (unint64_t)triggerType
{
  return 15;
}

@end