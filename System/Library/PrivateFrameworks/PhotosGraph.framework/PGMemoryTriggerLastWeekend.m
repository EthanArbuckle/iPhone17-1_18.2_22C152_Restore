@interface PGMemoryTriggerLastWeekend
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerLastWeekend

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v33 = 34;
      __int16 v34 = 2080;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerLastWeekend.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v11 = [v7 localDate];
    if ([MEMORY[0x1E4F76C80] isWeekendDate:v11])
    {
      uint64_t v12 = [v11 dateByAddingTimeInterval:-86400.0];

      v11 = (void *)v12;
    }
    id v30 = 0;
    double v31 = 0.0;
    [MEMORY[0x1E4F76C80] nextWeekendLocalStartDate:&v30 interval:&v31 options:4 afterDate:v11];
    double v13 = v31;
    id v14 = v30;
    v15 = [v14 dateByAddingTimeInterval:v13];
    v26 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v14 endDate:v15];
    v25 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:");
    v16 = [v25 memoryNodes];
    id v27 = v8;
    v17 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:1 inGraph:v8];
    v18 = [v16 collectionByIntersecting:v17];
    id v28 = 0;
    uint64_t v29 = 0;
    [MEMORY[0x1E4F76C80] nextWeekendLocalStartDate:&v28 interval:&v29 options:0 afterDate:v15];
    id v19 = v28;
    v20 = objc_opt_class();
    id v24 = v7;
    v21 = [v7 timeZone];
    v22 = [v20 validityIntervalForLocalStartDate:v15 localEndDate:v19 timeZone:v21];

    if ([v9 isCancelledWithProgress:1.0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v33 = 62;
        __int16 v34 = 2080;
        v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerLastWeekend.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v10 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v18 withValidityInterval:v22];
    }
    id v7 = v24;

    id v8 = v27;
  }

  return v10;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (unint64_t)triggerType
{
  return 20;
}

@end