@interface PGMemoryTriggerUpcomingHoliday
- (PGMemoryTriggerUpcomingHoliday)initWithLoggingConnection:(id)a3 holidayService:(id)a4;
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerUpcomingHoliday

- (void).cxx_destruct
{
}

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
      int v42 = 53;
      __int16 v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerUpcomingHoliday.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v12 = [v8 timeZone];
    uint64_t v13 = [v8 localDate];
    uint64_t v14 = [MEMORY[0x1E4F76C68] universalDateFromLocalDate:v13 inTimeZone:v12];
    uint64_t v15 = [MEMORY[0x1E4F76C68] dateByAddingDays:1 toDate:v14];
    v33 = (void *)v14;
    uint64_t v16 = [MEMORY[0x1E4F76C68] dateByAddingDays:7 toDate:v14];
    v32 = (void *)v15;
    [MEMORY[0x1E4F76C68] localDateFromUniversalDate:v15 inTimeZone:v12];
    v29 = v10;
    v30 = (void *)v12;
    v18 = id v17 = v8;
    v31 = (void *)v16;
    v19 = [MEMORY[0x1E4F76C68] localDateFromUniversalDate:v16 inTimeZone:v12];
    v34 = (void *)v13;
    uint64_t v20 = [MEMORY[0x1E4F76C68] yearFromDate:v13];
    v21 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:16 inGraph:v9];
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v23 = [(PGHolidayMemoryTrigger *)self holidayService];
    validHolidaysNames = self->_validHolidaysNames;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __87__PGMemoryTriggerUpcomingHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v35[3] = &unk_1E68E5F38;
    v35[4] = self;
    id v36 = v9;
    id v37 = v21;
    uint64_t v40 = v20;
    v25 = (void *)v18;
    id v8 = v17;
    id v10 = v29;
    id v38 = v8;
    id v26 = v22;
    id v39 = v26;
    id v27 = v21;
    [v23 enumerateEventRulesForAllCountriesWithNames:validHolidaysNames betweenLocalDate:v25 andLocalDate:v19 usingBlock:v35];

    if ([v29 isCancelledWithProgress:1.0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v42 = 103;
        __int16 v43 = 2080;
        v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerUpcomingHoliday.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v11 = v26;
    }
  }
  return v11;
}

void __87__PGMemoryTriggerUpcomingHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a2 name];
  if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:v6])
  {
    v7 = +[PGGraphHolidayNodeCollection holidayNodesWithName:v6 inGraph:*(void *)(a1 + 40)];
    if ([v7 count])
    {
      __int16 v43 = v7;
      v44 = v6;
      id v8 = [v7 featureNodeCollection];
      uint64_t v9 = [v8 memoryNodes];

      int v42 = (void *)v9;
      id v10 = [*(id *)(a1 + 48) collectionByIntersecting:v9];
      id v11 = [v10 momentNodes];
      uint64_t v12 = [v11 dateNodes];
      uint64_t v13 = [v12 yearNodes];

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v41 = v13;
      uint64_t v14 = [v13 years];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = 0;
        uint64_t v18 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v51 != v18) {
              objc_enumerationMutation(v14);
            }
            uint64_t v20 = [*(id *)(*((void *)&v50 + 1) + 8 * i) integerValue];
            if (v17 < v20 && *(void *)(a1 + 72) >= v20) {
              uint64_t v17 = v20;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v16);
      }
      else
      {
        uint64_t v17 = 0;
      }

      v21 = +[PGGraphYearNodeCollection yearNodesForYear:v17 inGraph:*(void *)(a1 + 40)];
      id v22 = [v21 dateNodes];
      v23 = [v22 momentNodes];
      v24 = [v23 memoryNodes];

      v25 = [v10 collectionByIntersecting:v24];

      if ([v25 count])
      {
        id v38 = v24;
        id v39 = v21;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v40 = v5;
        obuint64_t j = v5;
        uint64_t v26 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v47 != v28) {
                objc_enumerationMutation(obj);
              }
              v30 = *(void **)(*((void *)&v46 + 1) + 8 * j);
              v31 = objc_msgSend(v30, "dateByAddingTimeInterval:", -86400.0, v38, v39, v40);
              v32 = [v30 dateByAddingTimeInterval:-604800.0];
              v33 = objc_opt_class();
              v34 = [*(id *)(a1 + 56) timeZone];
              v35 = [v33 validityIntervalForLocalStartDate:v32 localEndDate:v31 timeZone:v34];

              id v36 = *(void **)(a1 + 64);
              id v37 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v25 withValidityInterval:v35];
              [v36 addObjectsFromArray:v37];
            }
            uint64_t v27 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
          }
          while (v27);
        }

        v21 = v39;
        id v5 = v40;
        v24 = v38;
      }

      v6 = v44;
    }
    else
    {
    }
  }
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  v3 = +[PGGraphNodeCollection subsetInCollection:a3];
  v4 = [v3 featureNodeCollection];

  return v4;
}

- (unint64_t)triggerType
{
  return 17;
}

- (PGMemoryTriggerUpcomingHoliday)initWithLoggingConnection:(id)a3 holidayService:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)PGMemoryTriggerUpcomingHoliday;
  v4 = [(PGHolidayMemoryTrigger *)&v24 initWithLoggingConnection:a3 holidayService:a4];
  id v5 = v4;
  if (v4)
  {
    v6 = [(PGHolidayMemoryTrigger *)v4 holidayService];
    v7 = [(PGHolidayMemoryTrigger *)v5 holidayService];
    id v8 = [v7 locale];
    uint64_t v9 = [v8 countryCode];
    id v10 = [v6 triggerHolidaysForCountryCode:v9];

    id v11 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v16), "name", (void)v20);
          [(NSSet *)v11 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v14);
    }

    validHolidaysNames = v5->_validHolidaysNames;
    v5->_validHolidaysNames = v11;
  }
  return v5;
}

@end