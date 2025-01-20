@interface PGMemoryTriggerSameWeekInHistory
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerSameWeekInHistory

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v34 = 32;
      __int16 v35 = 2080;
      v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerSameWeekInHistory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v11 = [v7 localDate];
    v12 = [MEMORY[0x1E4F76C68] components:8196 fromDate:v11];
    uint64_t v13 = [v12 year];
    v32 = v12;
    v31 = +[PGGraphWeekOfYearNodeCollection weekOfYearNodesForWeekOfYear:inGraph:](PGGraphWeekOfYearNodeCollection, "weekOfYearNodesForWeekOfYear:inGraph:", [v12 weekOfYear], v8);
    v14 = [v31 dateNodes];
    v15 = [v14 monthDayNodes];

    v30 = v15;
    v16 = [v15 featureNodeCollection];
    v17 = [v16 memoryNodes];

    v29 = +[PGGraphYearNodeCollection yearNodesForYear:v13 inGraph:v8];
    v18 = [v29 dateNodes];
    v19 = [v18 momentNodes];
    v20 = [v19 memoryNodes];

    v21 = [v17 collectionBySubtracting:v20];

    if ([v21 count])
    {
      v22 = [MEMORY[0x1E4F76C68] endOfWeekForDate:v11];
      v28 = v11;
      v23 = [MEMORY[0x1E4F76C68] startOfWeekForDate:v11];
      v24 = objc_opt_class();
      v25 = [v7 timeZone];
      v26 = [v24 validityIntervalForLocalStartDate:v23 localEndDate:v22 timeZone:v25];

      if ([v9 isCancelledWithProgress:1.0])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v34 = 57;
          __int16 v35 = 2080;
          v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerSameWeekInHistory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        v10 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v21 withValidityInterval:v26];
      }
      v11 = v28;
    }
    else
    {
      if ([v9 isCancelledWithProgress:1.0]
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v34 = 50;
        __int16 v35 = 2080;
        v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerSameWeekInHistory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v10;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (unint64_t)triggerType
{
  return 7;
}

@end