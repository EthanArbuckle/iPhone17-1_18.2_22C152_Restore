@interface PGMemoryTriggerHoliday
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerHoliday

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v29 = 32;
      __int16 v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerHoliday.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F71E60]);
    v13 = [(PGHolidayMemoryTrigger *)self holidayService];
    v14 = [v8 localDate];
    v15 = [v8 localDate];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __79__PGMemoryTriggerHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v25 = &unk_1E68ED298;
    id v16 = v9;
    id v26 = v16;
    id v17 = v12;
    id v27 = v17;
    [v13 enumerateEventRulesForAllCountriesBetweenLocalDate:v14 andLocalDate:v15 usingBlock:&v22];

    v18 = [PGGraphMemoryNodeCollection alloc];
    v19 = -[MAElementCollection initWithGraph:elementIdentifiers:](v18, "initWithGraph:elementIdentifiers:", v16, v17, v22, v23, v24, v25);
    v20 = [(id)objc_opt_class() singleDayValidityIntervalWithContext:v8];
    if ([v10 isCancelledWithProgress:1.0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v29 = 40;
        __int16 v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerHoliday.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v11 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v19 withValidityInterval:v20];
    }
  }
  return v11;
}

void __79__PGMemoryTriggerHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  id v8 = +[PGGraphHolidayNodeCollection holidayNodesWithName:v3 inGraph:*(void *)(a1 + 32)];

  v4 = *(void **)(a1 + 40);
  v5 = [v8 featureNodeCollection];
  v6 = [v5 memoryNodes];
  v7 = [v6 elementIdentifiers];
  [v4 unionWithIdentifierSet:v7];
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (unint64_t)triggerType
{
  return 1;
}

@end