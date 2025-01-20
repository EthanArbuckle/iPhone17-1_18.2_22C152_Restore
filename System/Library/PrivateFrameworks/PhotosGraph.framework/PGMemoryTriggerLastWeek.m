@interface PGMemoryTriggerLastWeek
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerLastWeek

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v30 = 33;
      __int16 v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerLastWeek.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v11 = [v7 localDate];
    v12 = (void *)MEMORY[0x1E4F76C68];
    v13 = [v7 timeZone];
    v28 = (void *)v11;
    v14 = [v12 universalDateFromLocalDate:v11 inTimeZone:v13];

    v27 = v14;
    uint64_t v15 = [v14 dateByAddingTimeInterval:-604800.0];
    v16 = (void *)MEMORY[0x1E4F76C68];
    v17 = [v7 timeZone];
    v26 = (void *)v15;
    v18 = [v16 localDateFromUniversalDate:v15 inTimeZone:v17];

    v19 = [v8 dateNodesForLocalDate:v18];
    v20 = [v19 momentNodes];
    v21 = [v20 memoryNodes];

    v22 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:1 inGraph:v8];
    v23 = [v21 collectionByIntersecting:v22];
    v24 = [(id)objc_opt_class() singleDayValidityIntervalWithContext:v7];
    if ([v9 isCancelledWithProgress:1.0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v30 = 46;
        __int16 v31 = 2080;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerLastWeek.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v10 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v23 withValidityInterval:v24];
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
  return 21;
}

@end