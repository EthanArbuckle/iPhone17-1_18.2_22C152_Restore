@interface PGMemoryTriggerUpcomingBirthday
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (id)upcomingBirthdayDateFromLocalDate:(id)a3 originalBirthdayDate:(id)a4;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerUpcomingBirthday

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v35 = 48;
      __int16 v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerUpcomingBirthday.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v12 = [v8 localDate];
    v13 = [v8 timeZone];
    v14 = +[PGMemoryTrigger monthDayNodesInGraph:v9 startDayOffset:1 endDayOffset:3 fromLocalDate:v12 inTimeZone:v13];
    v15 = [v14 birthdayPersonNodes];
    v16 = +[PGGraphNodeCollection nodesInGraph:v9];
    v17 = [v15 collectionBySubtracting:v16];

    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __88__PGMemoryTriggerUpcomingBirthday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v27 = &unk_1E68EAB40;
    id v28 = v16;
    id v29 = v9;
    v30 = self;
    id v31 = v12;
    id v32 = v13;
    id v19 = v18;
    id v33 = v19;
    id v20 = v16;
    id v21 = v12;
    id v22 = v13;
    [v17 enumerateNodesUsingBlock:&v24];
    if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0, v24, v25, v26, v27))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v35 = 79;
        __int16 v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerUpcomingBirthday.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v11 = v19;
    }
  }
  return v11;
}

void __88__PGMemoryTriggerUpcomingBirthday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 collection];
  v5 = [v4 momentNodes];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88__PGMemoryTriggerUpcomingBirthday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2;
  v19[3] = &unk_1E68EEE18;
  id v20 = *(id *)(a1 + 32);
  v6 = [v5 filteredCollectionUsingBlock:v19];

  v7 = [v6 memoryNodes];
  id v8 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:1 inGraph:*(void *)(a1 + 40)];
  id v9 = [v7 collectionByIntersecting:v8];
  id v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  v12 = [v3 birthdayDate];

  v13 = [v10 upcomingBirthdayDateFromLocalDate:v11 originalBirthdayDate:v12];

  v14 = [v13 dateByAddingTimeInterval:-86400.0];
  v15 = [v13 dateByAddingTimeInterval:-259200.0];
  v16 = [(id)objc_opt_class() validityIntervalForLocalStartDate:v15 localEndDate:v14 timeZone:*(void *)(a1 + 64)];
  v17 = *(void **)(a1 + 72);
  id v18 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v9 withValidityInterval:v16];
  [v17 addObjectsFromArray:v18];
}

BOOL __88__PGMemoryTriggerUpcomingBirthday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 personNodes];
  v4 = [v3 collectionBySubtracting:*(void *)(a1 + 32)];

  BOOL v5 = [v4 count] == 1;
  return v5;
}

- (id)upcomingBirthdayDateFromLocalDate:(id)a3 originalBirthdayDate:(id)a4
{
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F76C68];
  id v7 = a3;
  uint64_t v8 = [v6 yearFromDate:v7];
  id v9 = [MEMORY[0x1E4F76C68] dateBySettingYear:v8 ofDate:v5];
  uint64_t v10 = [MEMORY[0x1E4F76C68] numberOfDaysBetweenDate:v7 andDate:v9];

  if (v10 >= 4)
  {
    uint64_t v11 = [MEMORY[0x1E4F76C68] dateBySettingYear:v8 + 1 ofDate:v5];

    id v9 = (void *)v11;
  }

  return v9;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (unint64_t)triggerType
{
  return 24;
}

@end