@interface PGMemoryTriggerBeginningOfSeason
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerBeginningOfSeason

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v45 = 32;
      __int16 v46 = 2080;
      v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerBeginningOfSeason.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v11 = [v7 localDate];
    if ([MEMORY[0x1E4F76C68] isFirstTenDaysOfSeasonForLocalDate:v11])
    {
      uint64_t v12 = [MEMORY[0x1E4F76C68] localStartSeasonDateForLocalDate:v11];
      v13 = (void *)MEMORY[0x1E4F76C68];
      v14 = [v7 timeZone];
      v43 = (void *)v12;
      v15 = [v13 universalDateFromLocalDate:v12 inTimeZone:v14];

      uint64_t v16 = [v15 dateByAddingTimeInterval:-0.01];
      v17 = (void *)MEMORY[0x1E4F76C68];
      v18 = [v7 timeZone];
      v42 = (void *)v16;
      v19 = [v17 localDateFromUniversalDate:v16 inTimeZone:v18];

      v20 = +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", [MEMORY[0x1E4F76C68] yearFromDate:v11], v8);
      v21 = [MEMORY[0x1E4F76C68] seasonNameForLocalDate:v19 locale:0];
      if (v21)
      {
        v38 = v19;
        v39 = v15;
        v37 = v21;
        v36 = +[PGGraphSeasonNodeCollection seasonNodesForSeasonName:v21 inGraph:v8];
        [v36 featureNodeCollection];
        v22 = v41 = v20;
        v23 = [v22 memoryNodes];

        v20 = v41;
        v24 = [v41 featureNodeCollection];
        uint64_t v25 = [v24 memoryNodes];

        v35 = (void *)v25;
        v26 = [v23 collectionByIntersecting:v25];

        v40 = v26;
        if ([v26 count])
        {
          v27 = [MEMORY[0x1E4F76C68] localDateIntervalOfFirstTenDaysOfSeasonForLocalDate:v11];
          v28 = objc_opt_class();
          v29 = [v27 startDate];
          v30 = [v27 endDate];
          v31 = [v7 timeZone];
          v32 = [v28 validityIntervalForLocalStartDate:v29 localEndDate:v30 timeZone:v31];

          if ([v9 isCancelledWithProgress:1.0])
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v45 = 68;
              __int16 v46 = 2080;
              v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Me"
                    "mories/MemoryTriggers/PGMemoryTriggerBeginningOfSeason.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v10 = (void *)MEMORY[0x1E4F1CBF0];
          }
          else
          {
            v10 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v40 withValidityInterval:v32];
          }
          v33 = v43;
          v19 = v38;
          v20 = v41;

          v15 = v39;
          v21 = v37;
        }
        else
        {
          v19 = v38;
          if ([v9 isCancelledWithProgress:1.0])
          {
            v15 = v39;
            v21 = v37;
            v33 = v43;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v45 = 61;
              __int16 v46 = 2080;
              v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Me"
                    "mories/MemoryTriggers/PGMemoryTriggerBeginningOfSeason.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v10 = (void *)MEMORY[0x1E4F1CBF0];
          }
          else
          {
            v10 = (void *)MEMORY[0x1E4F1CBF0];
            v15 = v39;
            v21 = v37;
            v33 = v43;
          }
        }
      }
      else if ([v9 isCancelledWithProgress:1.0])
      {
        v33 = v43;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v45 = 51;
          __int16 v46 = 2080;
          v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerBeginningOfSeason.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        v10 = (void *)MEMORY[0x1E4F1CBF0];
        v33 = v43;
      }
    }
    else
    {
      if ([v9 isCancelledWithProgress:1.0]
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v45 = 36;
        __int16 v46 = 2080;
        v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerBeginningOfSeason.m";
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
  return 8;
}

@end