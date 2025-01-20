@interface PGMemoryTriggerEndOfYear
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerEndOfYear

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v49 = 30;
      __int16 v50 = 2080;
      v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerEndOfYear.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F76C68];
    v12 = [v7 localDate];
    v13 = [v7 timeZone];
    uint64_t v14 = [v11 universalDateFromLocalDate:v12 inTimeZone:v13];

    v47 = (void *)v14;
    v15 = [MEMORY[0x1E4F76C68] dateByAddingMonths:1 toDate:v14];
    v16 = (void *)MEMORY[0x1E4F76C68];
    v17 = [v7 timeZone];
    v18 = [v16 localDateFromUniversalDate:v15 inTimeZone:v17];

    v19 = (void *)MEMORY[0x1E4F76C68];
    v20 = [v7 localDate];
    v21 = [v19 components:4 fromDate:v20];

    v22 = [MEMORY[0x1E4F76C68] components:4 fromDate:v18];
    uint64_t v23 = [v21 year];
    if (v23 == [v22 year])
    {
      if ([v9 isCancelledWithProgress:1.0]
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v49 = 39;
        __int16 v50 = 2080;
        v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerEndOfYear.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v45 = v15;
      id v46 = v8;
      v24 = (void *)MEMORY[0x1E4F76C68];
      v25 = [v7 localDate];
      v26 = v24;
      id v8 = v46;
      v27 = +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", [v26 yearFromDate:v25], v46);

      v44 = v27;
      v28 = [v27 featureNodeCollection];
      v29 = [v28 memoryNodes];

      v43 = v29;
      if ([v29 count])
      {
        v30 = (void *)MEMORY[0x1E4F76C68];
        v31 = [v7 localDate];
        uint64_t v32 = [v30 endOfMonthForDate:v31];

        v33 = (void *)MEMORY[0x1E4F76C68];
        v34 = [v7 localDate];
        uint64_t v35 = [v33 startOfMonthForDate:v34];

        v36 = objc_opt_class();
        v37 = [v7 timeZone];
        v41 = (void *)v35;
        v42 = (void *)v32;
        v38 = [v36 validityIntervalForLocalStartDate:v35 localEndDate:v32 timeZone:v37];

        if ([v9 isCancelledWithProgress:1.0])
        {
          v15 = v45;
          v39 = v43;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v49 = 54;
            __int16 v50 = 2080;
            v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memo"
                  "ries/MemoryTriggers/PGMemoryTriggerEndOfYear.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v10 = (void *)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          v39 = v43;
          v10 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v43 withValidityInterval:v38];
          v15 = v45;
        }

        id v8 = v46;
      }
      else if ([v9 isCancelledWithProgress:1.0])
      {
        v15 = v45;
        v39 = v43;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v49 = 47;
          __int16 v50 = 2080;
          v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerEndOfYear.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        v10 = (void *)MEMORY[0x1E4F1CBF0];
        v15 = v45;
        v39 = v43;
      }
    }
  }

  return v10;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return a3;
}

- (unint64_t)triggerType
{
  return 5;
}

@end