@interface PGMemoryTriggerThrowbackWeekInHistory
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerThrowbackWeekInHistory

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v42 = 34;
      __int16 v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerThrowbackWeekInHistory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v11 = [v7 localDate];
    v12 = [MEMORY[0x1E4F76C68] components:8220 fromDate:v11];
    uint64_t v13 = [v12 year];
    v35 = v12;
    v14 = +[PGGraphWeekOfYearNodeCollection weekOfYearNodesForWeekOfYear:inGraph:](PGGraphWeekOfYearNodeCollection, "weekOfYearNodesForWeekOfYear:inGraph:", [v12 weekOfYear], v8);
    v15 = [v14 dateNodes];

    v16 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:1 inGraph:v8];
    id v17 = objc_alloc_init(MEMORY[0x1E4F71E60]);
    +[PGGraphNodeCollection nodesInGraph:v8];
    v19 = v18 = v7;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __94__PGMemoryTriggerThrowbackWeekInHistory_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v36[3] = &unk_1E68E9A10;
    uint64_t v40 = v13;
    id v20 = v15;
    id v37 = v20;
    id v21 = v16;
    id v38 = v21;
    id v22 = v17;
    id v39 = v22;
    v34 = v19;
    [v19 enumerateIdentifiersAsCollectionsWithBlock:v36];
    if ([v22 count])
    {
      id v33 = v21;
      id v31 = v8;
      v23 = [(MAElementCollection *)[PGGraphMemoryNodeCollection alloc] initWithGraph:v8 elementIdentifiers:v22];
      uint64_t v24 = [MEMORY[0x1E4F76C68] endOfWeekForDate:v11];
      uint64_t v25 = [MEMORY[0x1E4F76C68] startOfWeekForDate:v11];
      v26 = objc_opt_class();
      v27 = [v18 timeZone];
      v30 = (void *)v25;
      v32 = (void *)v24;
      v28 = [v26 validityIntervalForLocalStartDate:v25 localEndDate:v24 timeZone:v27];

      id v7 = v18;
      if ([v9 isCancelledWithProgress:1.0])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v42 = 67;
          __int16 v43 = 2080;
          v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerThrowbackWeekInHistory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        v10 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v23 withValidityInterval:v28];
      }
      id v8 = v31;

      id v21 = v33;
    }
    else
    {
      id v7 = v18;
      if ([v9 isCancelledWithProgress:1.0]
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v42 = 59;
        __int16 v43 = 2080;
        v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerThrowbackWeekInHistory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v10;
}

void __94__PGMemoryTriggerThrowbackWeekInHistory_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v15 = a3;
  v4 = [v15 anyNode];
  uint64_t v5 = [v4 calendarUnitValue];
  uint64_t v6 = a1[7] - 2;

  if (v5 <= v6)
  {
    id v7 = (void *)a1[4];
    id v8 = [v15 dateNodes];
    id v9 = [v7 collectionByIntersecting:v8];

    v10 = [v9 momentNodes];
    v11 = [v10 memoryNodes];

    v12 = [v11 collectionByIntersecting:a1[5]];

    uint64_t v13 = (void *)a1[6];
    v14 = [v12 elementIdentifiers];
    [v13 unionWithIdentifierSet:v14];
  }
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (unint64_t)triggerType
{
  return 11;
}

@end