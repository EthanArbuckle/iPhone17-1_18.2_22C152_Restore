@interface PGMemoryTriggerRecentHolidayCelebration
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerRecentHolidayCelebration

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v42 = 42;
      __int16 v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentHolidayCelebration.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v12 = [v8 localDate];
    v13 = (void *)MEMORY[0x1E4F76C68];
    v14 = [v8 timeZone];
    v34 = (void *)v12;
    v15 = [v13 universalDateFromLocalDate:v12 inTimeZone:v14];

    uint64_t v16 = [MEMORY[0x1E4F76C68] dateByAddingDays:-10 toDate:v15];
    uint64_t v17 = [MEMORY[0x1E4F76C68] dateByAddingDays:-3 toDate:v15];
    v18 = (void *)MEMORY[0x1E4F76C68];
    v19 = [v8 timeZone];
    v33 = (void *)v16;
    v20 = [v18 localDateFromUniversalDate:v16 inTimeZone:v19];

    v21 = (void *)MEMORY[0x1E4F76C68];
    v22 = [v8 timeZone];
    v32 = (void *)v17;
    v23 = [v21 localDateFromUniversalDate:v17 inTimeZone:v22];

    id v24 = objc_alloc_init(MEMORY[0x1E4F71E60]);
    v25 = [(PGHolidayMemoryTrigger *)self holidayService];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __96__PGMemoryTriggerRecentHolidayCelebration_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v38[3] = &unk_1E68ED298;
    id v26 = v9;
    id v39 = v26;
    id v27 = v24;
    id v40 = v27;
    [v25 enumerateEventRulesForAllCountriesBetweenLocalDate:v20 andLocalDate:v23 usingBlock:v38];

    v28 = [(MAElementCollection *)[PGGraphMemoryNodeCollection alloc] initWithGraph:v26 elementIdentifiers:v27];
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __96__PGMemoryTriggerRecentHolidayCelebration_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2;
    v35[3] = &unk_1E68ED2C0;
    v35[4] = self;
    id v36 = v8;
    id v30 = v29;
    id v37 = v30;
    [(MAElementCollection *)v28 enumerateIdentifiersAsCollectionsWithBlock:v35];
    if ([v10 isCancelledWithProgress:1.0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v42 = 88;
        __int16 v43 = 2080;
        v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentHolidayCelebration.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v11 = v30;
    }
  }
  return v11;
}

void __96__PGMemoryTriggerRecentHolidayCelebration_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a2 name];
  v7 = +[PGGraphHolidayNodeCollection holidayNodesWithName:v6 inGraph:*(void *)(a1 + 32)];

  id v24 = v7;
  id v8 = [v7 featureNodeCollection];
  uint64_t v9 = [v8 memoryNodes];

  v22 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:16 inGraph:*(void *)(a1 + 32)];
  v23 = (void *)v9;
  id v10 = [v22 collectionByIntersecting:v9];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", [MEMORY[0x1E4F76C68] yearFromDate:*(void *)(*((void *)&v26 + 1) + 8 * v14)], *(void *)(a1 + 32));
        uint64_t v16 = [v15 dateNodes];
        uint64_t v17 = [v16 momentNodes];
        v18 = [v17 memoryNodes];

        v19 = [v10 elementIdentifiers];
        v20 = [v18 elementIdentifiers];
        v21 = [v19 identifierSetByIntersectingIdentifierSet:v20];

        [*(id *)(a1 + 40) unionWithIdentifierSet:v21];
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }
}

void __96__PGMemoryTriggerRecentHolidayCelebration_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 momentNodes];
  id v19 = [v5 dateNodes];

  v6 = [v4 featureNodes];
  v7 = +[PGGraphNodeCollection subsetInCollection:v6];
  id v8 = [v7 dateNodes];

  uint64_t v9 = [v19 collectionByIntersecting:v8];
  id v10 = [v9 anyNode];
  uint64_t v11 = [v10 localDate];

  uint64_t v12 = [v11 dateByAddingTimeInterval:864000.0];
  uint64_t v13 = [v11 dateByAddingTimeInterval:259200.0];
  uint64_t v14 = objc_opt_class();
  v15 = [*(id *)(a1 + 40) timeZone];
  uint64_t v16 = [v14 validityIntervalForLocalStartDate:v13 localEndDate:v12 timeZone:v15];

  uint64_t v17 = *(void **)(a1 + 48);
  v18 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v4 withValidityInterval:v16];

  [v17 addObjectsFromArray:v18];
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  v3 = +[PGGraphNodeCollection subsetInCollection:a3];
  id v4 = [v3 featureNodeCollection];

  return v4;
}

- (unint64_t)triggerType
{
  return 12;
}

@end