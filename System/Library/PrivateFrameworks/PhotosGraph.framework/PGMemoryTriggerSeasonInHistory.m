@interface PGMemoryTriggerSeasonInHistory
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerSeasonInHistory

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v9 isCancelledWithProgress:0.0])
  {
    v11 = [v7 localDate];
    v12 = [MEMORY[0x1E4F76C68] components:12 fromDate:v11];
    uint64_t v13 = [v12 month];
    uint64_t v14 = [v12 year];
    v15 = [MEMORY[0x1E4F76C68] seasonNameForLocalDate:v11 locale:0];
    if (!v15)
    {
      if ([v9 isCancelledWithProgress:1.0]
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v37 = 46;
        __int16 v38 = 2080;
        v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerSeasonInHistory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_27;
    }
    v32 = v12;
    if (v13 == 12) {
      uint64_t v16 = v14 + 1;
    }
    else {
      uint64_t v16 = v14;
    }
    v35 = v15;
    v17 = +[PGGraphSeasonNodeCollection seasonNodesForSeasonName:v15 inGraph:v8];
    v18 = +[PGGraphYearNodeCollection yearNodesForYear:v16 inGraph:v8];
    v34 = v17;
    v19 = [v17 featureNodeCollection];
    v20 = [v19 memoryNodes];

    v33 = v18;
    v21 = [v18 featureNodeCollection];
    v22 = [v21 memoryNodes];
    v23 = [v20 collectionBySubtracting:v22];

    v24 = v23;
    if ([v23 count])
    {
      v31 = [MEMORY[0x1E4F76C68] localStartDateForNextSeasonAfterLocalDate:v11];
      v25 = [v31 dateByAddingTimeInterval:-0.01];
      v26 = [MEMORY[0x1E4F76C68] localStartSeasonDateForLocalDate:v11];
      v27 = objc_opt_class();
      v28 = [v7 timeZone];
      v29 = [v27 validityIntervalForLocalStartDate:v26 localEndDate:v25 timeZone:v28];

      if ([v9 isCancelledWithProgress:1.0])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v37 = 65;
          __int16 v38 = 2080;
          v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerSeasonInHistory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        v10 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v24 withValidityInterval:v29];
      }
    }
    else
    {
      if ([v9 isCancelledWithProgress:1.0])
      {
        v15 = v35;
        v12 = v32;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v37 = 57;
          __int16 v38 = 2080;
          v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerSeasonInHistory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_26;
      }
      v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v15 = v35;
    v12 = v32;
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v37 = 32;
    __int16 v38 = 2080;
    v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/Mem"
          "oryTriggers/PGMemoryTriggerSeasonInHistory.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v10 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_28:

  return v10;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (unint64_t)triggerType
{
  return 9;
}

@end