@interface PGMemoryTriggerRecentBreakoutOfRoutine
- (id)neighborScoreComputerWithGraph:(id)a3;
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerRecentBreakoutOfRoutine

- (void).cxx_destruct
{
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v31 = 45;
      __int16 v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentBreakoutOfRoutine.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v12 = [v8 localDate];
    v23 = [v8 timeZone];
    v24 = (void *)v12;
    v13 = +[PGMemoryTrigger dateNodesInGraph:startDayOffset:endDayOffset:fromLocalDate:inTimeZone:](PGMemoryTrigger, "dateNodesInGraph:startDayOffset:endDayOffset:fromLocalDate:inTimeZone:", v9, -8, -1, v12);
    v14 = [v13 momentNodes];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __95__PGMemoryTriggerRecentBreakoutOfRoutine_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v28[3] = &unk_1E68E6F20;
    v28[4] = self;
    id v15 = v9;
    id v29 = v15;
    v16 = [v14 filteredCollectionUsingBlock:v28];

    v17 = [v16 memoryNodes];
    v18 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:1 inGraph:v15];
    v19 = [v17 collectionByIntersecting:v18];
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __95__PGMemoryTriggerRecentBreakoutOfRoutine_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2;
    v25[3] = &unk_1E68ED2C0;
    v25[4] = self;
    id v26 = v8;
    id v21 = v20;
    id v27 = v21;
    [v19 enumerateIdentifiersAsCollectionsWithBlock:v25];
    if ([v10 isCancelledWithProgress:1.0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v31 = 72;
        __int16 v32 = 2080;
        v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentBreakoutOfRoutine.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v11 = v21;
    }
  }
  return v11;
}

BOOL __95__PGMemoryTriggerRecentBreakoutOfRoutine_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  v5 = [v2 neighborScoreComputerWithGraph:v3];
  v6 = [v4 anyNode];

  [v5 neighborScoreWithMomentNode:v6];
  double v8 = v7;

  return v8 > 0.6;
}

void __95__PGMemoryTriggerRecentBreakoutOfRoutine_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [v4 momentNodes];
  id v15 = [v5 dateNodes];

  v6 = [v15 localDateInterval];
  double v7 = [v6 endDate];

  double v8 = [v7 dateByAddingTimeInterval:691200.0];
  id v9 = [v7 dateByAddingTimeInterval:86400.0];
  id v10 = objc_opt_class();
  id v11 = [*(id *)(a1 + 40) timeZone];
  uint64_t v12 = [v10 validityIntervalForLocalStartDate:v9 localEndDate:v8 timeZone:v11];

  v13 = *(void **)(a1 + 48);
  v14 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v4 withValidityInterval:v12];

  [v13 addObjectsFromArray:v14];
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (unint64_t)triggerType
{
  return 22;
}

- (id)neighborScoreComputerWithGraph:(id)a3
{
  neighborScoreComputer = self->_neighborScoreComputer;
  if (!neighborScoreComputer)
  {
    v5 = objc_alloc_init(PGNeighborScoreComputer);
    v6 = self->_neighborScoreComputer;
    self->_neighborScoreComputer = v5;

    neighborScoreComputer = self->_neighborScoreComputer;
  }
  return neighborScoreComputer;
}

@end