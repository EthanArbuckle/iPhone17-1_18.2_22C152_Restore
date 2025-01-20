@interface PGMemoryTriggerHandler
+ (double)scoreForTriggerType:(unint64_t)a3;
+ (double)triggerScoreForTriggeredMemory:(id)a3;
+ (id)creationDateWithContext:(id)a3;
+ (id)fallbackTriggeredMemoriesWithContext:(id)a3 excludingTriggeredMemories:(id)a4 inGraph:(id)a5 holidayService:(id)a6;
+ (id)memoryNodesAllowedToBeFallbackFromMemoryNodes:(id)a3 withContext:(id)a4 inGraph:(id)a5 holidayService:(id)a6;
+ (id)personMemoryNodesFeaturingMeNodeInGraph:(id)a3;
+ (unint64_t)maximumValidityPeriodForValidityIntervalByTriggerType:(id)a3 context:(id)a4;
- (CLSHolidayCalendarEventService)holidayService;
- (PGMemoryTriggerHandler)initWithWorkingContext:(id)a3 momentNodesWithBlockedFeatureCache:(id)a4;
- (id)allTriggeredMemoriesWithContext:(id)a3 forTriggerType:(unint64_t)a4 inGraph:(id)a5 progressReporter:(id)a6;
- (id)allTriggeredMemoriesWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (id)futureMemoriesForConfiguration:(id)a3 withGraph:(id)a4 progressReporter:(id)a5;
- (id)relevantFeatureNodesInFeatureNodes:(id)a3 forTriggerType:(unint64_t)a4;
@end

@implementation PGMemoryTriggerHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holidayService, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_allMemoryTriggers, 0);
}

- (CLSHolidayCalendarEventService)holidayService
{
  return self->_holidayService;
}

- (id)futureMemoriesForConfiguration:(id)a3 withGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v42 = a4;
  v38 = v7;
  id v39 = a5;
  v40 = [v7 futureMemoryCollisionUniversalDateInterval];
  v43 = [v40 startDate];
  v50 = [v40 endDate];
  v8 = v50;
  [v50 timeIntervalSinceDate:v43];
  uint64_t v10 = (uint64_t)(v9 / 86400.0);
  if (v10 < 1)
  {
    id v51 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v11 = self->_loggingConnection;
    os_signpost_id_t v12 = os_signpost_id_generate((os_log_t)v11);
    v13 = v11;
    v14 = v13;
    unint64_t v37 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MemoryElectionFutureMemories", "", buf, 2u);
    }
    os_signpost_id_t spid = v12;
    v36 = v14;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v35 = mach_absolute_time();
    v41 = (void *)[objc_alloc(MEMORY[0x1E4F71F10]) initWithProgressReporter:v39];
    v45 = [v38 timeZone];
    id v51 = [MEMORY[0x1E4F1CA48] array];
    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v15 = [v50 compare:v43];
    if (v15 == -1)
    {
      v8 = v50;
    }
    else
    {
      double v16 = 1.0 / (double)((v10 & (unint64_t)~(v10 >> 63)) + 1);
      double v17 = v16;
      do
      {
        context = (void *)MEMORY[0x1D25FED50](v15);
        v49 = objc_msgSend(MEMORY[0x1E4F76C68], "localDateFromUniversalDate:inTimeZone:", v50, v45, spid);
        v48 = [[PGMemoryContext alloc] initWithFutureLocalDate:v49 timeZone:v45 photoLibrary:self->_photoLibrary];
        v47 = [v41 childProgressReporterToCheckpoint:v17];
        v18 = [(PGMemoryTriggerHandler *)self allTriggeredMemoriesWithContext:v48 inGraph:v42 progressReporter:v47];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v57 objects:v64 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v58;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v58 != v21) {
                objc_enumerationMutation(v19);
              }
              v23 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              v24 = (void *)MEMORY[0x1D25FED50]();
              v25 = [v23 uniqueMemoryIdentifier];
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x2020000000;
              char v63 = 1;
              v26 = [v23 triggerTypes];
              v53[0] = MEMORY[0x1E4F143A8];
              v53[1] = 3221225472;
              v53[2] = __84__PGMemoryTriggerHandler_futureMemoriesForConfiguration_withGraph_progressReporter___block_invoke;
              v53[3] = &unk_1E68E9590;
              id v54 = v52;
              id v27 = v25;
              id v55 = v27;
              v56 = buf;
              [v26 enumerateIndexesUsingBlock:v53];

              if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
                [v51 addObject:v23];
              }

              _Block_object_dispose(buf, 8);
            }
            uint64_t v20 = [v19 countByEnumeratingWithState:&v57 objects:v64 count:16];
          }
          while (v20);
        }

        v8 = [MEMORY[0x1E4F76C68] dateByAddingDays:-1 toDate:v50];

        uint64_t v15 = [v8 compare:v43];
        double v17 = v16 + v17;
        v50 = v8;
      }
      while (v15 != -1);
    }
    uint64_t v28 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v31 = v36;
    v32 = v31;
    if (v37 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v32, OS_SIGNPOST_INTERVAL_END, spid, "MemoryElectionFutureMemories", "", buf, 2u);
    }

    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "MemoryElectionFutureMemories";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v28 - v35) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  return v51;
}

void __84__PGMemoryTriggerHandler_futureMemoriesForConfiguration_withGraph_progressReporter___block_invoke(void *a1, uint64_t a2)
{
  v4 = (void *)a1[4];
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v9 = [v4 objectForKeyedSubscript:v5];

  if (v9)
  {
    if ([v9 containsObject:a1[5]]) {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    }
    else {
      [v9 addObject:a1[5]];
    }
  }
  else
  {
    v6 = [MEMORY[0x1E4F1CA80] setWithObject:a1[5]];
    id v7 = (void *)a1[4];
    v8 = [NSNumber numberWithUnsignedInteger:a2];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3 forTriggerType:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [PGGraphFeatureNodeCollection alloc];
  v8 = [v6 graph];
  id v9 = [(MAElementCollection *)v7 initWithGraph:v8];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = self->_allMemoryTriggers;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v15, "triggerType", (void)v18) == a4)
        {
          uint64_t v16 = [v15 relevantFeatureNodesInFeatureNodes:v6];

          id v9 = (PGGraphFeatureNodeCollection *)v16;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)allTriggeredMemoriesWithContext:(id)a3 forTriggerType:(unint64_t)a4 inGraph:(id)a5 progressReporter:(id)a6
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v81 = a5;
  id v82 = a6;
  NSUInteger v11 = [(NSArray *)self->_allMemoryTriggers count];
  v80 = self;
  loggingConnection = self->_loggingConnection;
  if (v11)
  {
    uint64_t v13 = loggingConnection;
    os_signpost_id_t v14 = os_signpost_id_generate(v13);
    uint64_t v15 = v13;
    uint64_t v16 = v15;
    unint64_t v74 = v14 - 1;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "MemoryElectionAllTrigeredMemories", "", buf, 2u);
    }
    os_signpost_id_t spid = v14;
    v75 = v16;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v73 = mach_absolute_time();
    id v90 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v88 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    unint64_t v17 = [(NSArray *)v80->_allMemoryTriggers count];
    long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F71F10]) initWithProgressReporter:v82];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    obj = v80->_allMemoryTriggers;
    uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v100 objects:v112 count:16];
    v78 = v18;
    if (v19)
    {
      uint64_t v20 = v19;
      double v21 = 1.0 / (double)v17;
      uint64_t v22 = *(void *)v101;
      double v23 = 0.0;
      uint64_t v76 = *(void *)v101;
      unint64_t v77 = a4;
      while (2)
      {
        uint64_t v24 = 0;
        uint64_t v79 = v20;
        do
        {
          if (*(void *)v101 != v22) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v100 + 1) + 8 * v24);
          v26 = (void *)MEMORY[0x1D25FED50]();
          double v23 = fmin(v21 + v23, 1.0);
          id v27 = [v18 childProgressReporterToCheckpoint:v23];
          uint64_t v89 = [v25 triggerType];
          if ((!a4 || v89 == a4)
            && (![v10 futureLookup]
             || [v25 supportsFutureLookup]))
          {
            context = v26;
            v87 = v27;
            uint64_t v85 = v24;
            uint64_t v28 = v80->_loggingConnection;
            os_signpost_id_t v29 = os_signpost_id_generate(v28);
            v30 = v28;
            v31 = v30;
            if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1D1805000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "MemoryElectionTrigger", "", buf, 2u);
            }

            mach_timebase_info v99 = 0;
            mach_timebase_info(&v99);
            uint64_t v32 = mach_absolute_time();
            v33 = [v25 resultsTriggeredWithContext:v10 inGraph:v81 progressReporter:v27];
            if ([v82 isCancelled])
            {

              id v70 = (id)MEMORY[0x1E4F1CBF0];
              v66 = v75;
              goto LABEL_47;
            }
            uint64_t v34 = mach_absolute_time();
            uint32_t numer = v99.numer;
            uint32_t denom = v99.denom;
            unint64_t v37 = v31;
            v38 = v37;
            if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
            {
              id v39 = (objc_class *)objc_opt_class();
              NSStringFromClass(v39);
              v40 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v107 = v40;
              _os_signpost_emit_with_name_impl(&dword_1D1805000, v38, OS_SIGNPOST_INTERVAL_END, v29, "MemoryElectionTrigger", "%@", buf, 0xCu);
            }
            v41 = v38;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              id v42 = NSString;
              v43 = (objc_class *)objc_opt_class();
              v44 = NSStringFromClass(v43);
              double v45 = [v42 stringWithFormat:@"%@", v44];
              *(_DWORD *)buf = 136315650;
              v107 = "MemoryElectionTrigger";
              __int16 v108 = 2112;
              double v109 = v45;
              __int16 v110 = 2048;
              double v111 = (float)((float)((float)((float)(v34 - v32) * (float)numer) / (float)denom) / 1000000.0);
              _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
            }
            v84 = v41;

            long long v97 = 0u;
            long long v98 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            id v46 = v33;
            uint64_t v47 = [v46 countByEnumeratingWithState:&v95 objects:v105 count:16];
            if (v47)
            {
              uint64_t v48 = v47;
              uint64_t v49 = *(void *)v96;
              do
              {
                for (uint64_t i = 0; i != v48; ++i)
                {
                  if (*(void *)v96 != v49) {
                    objc_enumerationMutation(v46);
                  }
                  id v51 = *(void **)(*((void *)&v95 + 1) + 8 * i);
                  id v52 = [v51 memoryNode];
                  v53 = [v10 categoriesDeniedForContextual];
                  char v54 = objc_msgSend(v53, "containsIndex:", objc_msgSend(v52, "memoryCategory"));

                  if ((v54 & 1) == 0)
                  {
                    id v55 = v10;
                    v56 = [v52 uniqueMemoryIdentifier];
                    id v57 = [v90 objectForKeyedSubscript:v56];
                    if (!v57)
                    {
                      id v57 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                      [v90 setObject:v57 forKeyedSubscript:v56];
                    }
                    long long v58 = [v51 validityInterval];
                    long long v59 = [NSNumber numberWithUnsignedInteger:v89];
                    [v57 setObject:v58 forKeyedSubscript:v59];

                    [v88 setObject:v52 forKeyedSubscript:v56];
                    id v10 = v55;
                  }
                }
                uint64_t v48 = [v46 countByEnumeratingWithState:&v95 objects:v105 count:16];
              }
              while (v48);
            }

            a4 = v77;
            long long v18 = v78;
            uint64_t v20 = v79;
            uint64_t v22 = v76;
            uint64_t v24 = v85;
            v26 = context;
            id v27 = v87;
          }

          ++v24;
        }
        while (v24 != v20);
        uint64_t v20 = [(NSArray *)obj countByEnumeratingWithState:&v100 objects:v112 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    long long v60 = [(id)objc_opt_class() creationDateWithContext:v10];
    id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __98__PGMemoryTriggerHandler_allTriggeredMemoriesWithContext_forTriggerType_inGraph_progressReporter___block_invoke;
    v91[3] = &unk_1E68EBF78;
    id v92 = v88;
    obj = v60;
    v93 = obj;
    id v62 = v61;
    id v94 = v62;
    [v90 enumerateKeysAndObjectsUsingBlock:v91];
    uint64_t v63 = mach_absolute_time();
    uint32_t v64 = info.numer;
    uint32_t v65 = info.denom;
    v66 = v75;
    v67 = v75;
    v68 = v67;
    if (v74 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v68, OS_SIGNPOST_INTERVAL_END, spid, "MemoryElectionAllTrigeredMemories", "", buf, 2u);
    }

    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v107 = "MemoryElectionAllTrigeredMemories";
      __int16 v108 = 2048;
      double v109 = (float)((float)((float)((float)(v63 - v73) * (float)v64) / (float)v65) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v68, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v69 = v94;
    id v70 = v62;

    long long v18 = v78;
LABEL_47:
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGMemoryTriggerHandler] No memory triggers initialized.", buf, 2u);
    }
    id v70 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v70;
}

void __98__PGMemoryTriggerHandler_allTriggeredMemoriesWithContext_forTriggerType_inGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = [v5 objectForKeyedSubscript:a2];
  id v7 = [[PGTriggeredMemory alloc] initWithMemoryNode:v8 validityIntervalByTriggerType:v6 creationDate:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) addObject:v7];
}

- (id)allTriggeredMemoriesWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  return [(PGMemoryTriggerHandler *)self allTriggeredMemoriesWithContext:a3 forTriggerType:0 inGraph:a4 progressReporter:a5];
}

- (PGMemoryTriggerHandler)initWithWorkingContext:(id)a3 momentNodesWithBlockedFeatureCache:(id)a4
{
  v51[26] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)PGMemoryTriggerHandler;
  id v8 = [(PGMemoryTriggerHandler *)&v50 init];
  if (v8)
  {
    os_log_t v9 = os_log_create("com.apple.PhotosGraph", "MemoryTriggerHandler");
    loggingConnection = v8->_loggingConnection;
    v8->_loggingConnection = (OS_os_log *)v9;

    uint64_t v11 = [v6 photoLibrary];
    photoLibrary = v8->_photoLibrary;
    v8->_photoLibrary = (PHPhotoLibrary *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F76CB8]);
    os_signpost_id_t v14 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v15 = [v13 initWithLocale:v14];
    holidayService = v8->_holidayService;
    v8->_holidayService = (CLSHolidayCalendarEventService *)v15;

    uint64_t v48 = [(PGHolidayMemoryTrigger *)[PGMemoryTriggerHoliday alloc] initWithLoggingConnection:v8->_loggingConnection holidayService:v8->_holidayService];
    v51[0] = v48;
    uint64_t v47 = [[PGMemoryTriggerPersonBirthday alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[1] = v47;
    id v46 = [(PGHolidayMemoryTrigger *)[PGMemoryTriggerFeatureCentricHoliday alloc] initWithLoggingConnection:v8->_loggingConnection holidayService:v8->_holidayService];
    v51[2] = v46;
    double v45 = [[PGMemoryTriggerSameDayInHistory alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[3] = v45;
    v44 = [[PGMemoryTriggerEndOfYear alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[4] = v44;
    v43 = [[PGMemoryTriggerBeginningOfMonth alloc] initWithLoggingConnection:v8->_loggingConnection momentNodesWithBlockedFeatureCache:v7];
    v51[5] = v43;
    id v42 = [[PGMemoryTriggerBeginningOfSeason alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[6] = v42;
    v41 = [[PGMemoryTriggerSeasonInHistory alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[7] = v41;
    v40 = [[PGMemoryTriggerRecentMomentWithPerson alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[8] = v40;
    id v39 = [[PGMemoryTriggerThrowbackWeekInHistory alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[9] = v39;
    v38 = [(PGHolidayMemoryTrigger *)[PGMemoryTriggerRecentHolidayCelebration alloc] initWithLoggingConnection:v8->_loggingConnection holidayService:v8->_holidayService];
    v51[10] = v38;
    unint64_t v37 = [[PGMemoryTriggerRecentMomentWithSocialGroup alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[11] = v37;
    v36 = [[PGMemoryTriggerRecentTrip alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[12] = v36;
    uint64_t v35 = [[PGMemoryTriggerPersonAnniversary alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[13] = v35;
    uint64_t v34 = [[PGMemoryTriggerRecentHighlights alloc] initWithLoggingConnection:v8->_loggingConnection momentNodesWithBlockedFeatureCache:v7];
    v51[14] = v34;
    v33 = [[PGMemoryTriggerUpcomingHoliday alloc] initWithLoggingConnection:v8->_loggingConnection holidayService:v8->_holidayService];
    v51[15] = v33;
    uint64_t v32 = [[PGMemoryTriggerRecentSyndicatedAssets alloc] initWithLoggingConnection:v8->_loggingConnection photoLibrary:v8->_photoLibrary momentNodesWithBlockedFeatureCache:v7];
    v51[16] = v32;
    v31 = [[PGMemoryTriggerRecentMeaningfulEvent alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[17] = v31;
    unint64_t v17 = [PGMemoryTriggerUpcomingCalendarEvent alloc];
    v30 = [v6 serviceManager];
    os_signpost_id_t v29 = [v6 locationCache];
    long long v18 = [(PGMemoryTriggerUpcomingCalendarEvent *)v17 initWithServiceManager:v30 locationCache:v29 loggingConnection:v8->_loggingConnection];
    v51[18] = v18;
    uint64_t v19 = [[PGMemoryTriggerLastWeekend alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[19] = v19;
    uint64_t v20 = [[PGMemoryTriggerLastWeek alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[20] = v20;
    id v49 = v6;
    double v21 = [[PGMemoryTriggerRecentBreakoutOfRoutine alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[21] = v21;
    uint64_t v22 = [(PGHolidayMemoryTrigger *)[PGMemoryTriggerUpcomingPersonCentricHoliday alloc] initWithLoggingConnection:v8->_loggingConnection holidayService:v8->_holidayService];
    v51[22] = v22;
    double v23 = [[PGMemoryTriggerUpcomingBirthday alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[23] = v23;
    uint64_t v24 = [[PGMemoryTriggerUpcomingAnniversary alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[24] = v24;
    v25 = [[PGMemoryTriggerRecentTrendsMoment alloc] initWithLoggingConnection:v8->_loggingConnection];
    v51[25] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:26];
    allMemoryTriggers = v8->_allMemoryTriggers;
    v8->_allMemoryTriggers = (NSArray *)v26;

    id v6 = v49;
  }

  return v8;
}

+ (unint64_t)maximumValidityPeriodForValidityIntervalByTriggerType:(id)a3 context:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 localDate];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = objc_msgSend(v7, "objectForKeyedSubscript:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        os_signpost_id_t v14 = [v13 endDate];
        [v14 timeIntervalSinceDate:v6];
        double v16 = v15;

        if (v10 <= ((uint64_t)(v16 / 86400.0) & (unint64_t)~((uint64_t)(v16 / 86400.0) >> 63))) {
          unint64_t v10 = (uint64_t)(v16 / 86400.0) & ~((uint64_t)(v16 / 86400.0) >> 63);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

+ (double)scoreForTriggerType:(unint64_t)a3
{
  double result = 0.0;
  if (a3 - 1 <= 0x1A) {
    return dbl_1D1F4F6F8[a3 - 1];
  }
  return result;
}

+ (double)triggerScoreForTriggeredMemory:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  unint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v5 = [v4 triggerTypes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__PGMemoryTriggerHandler_triggerScoreForTriggeredMemory___block_invoke;
  v8[3] = &unk_1E68E95B8;
  v8[4] = &v9;
  v8[5] = a1;
  [v5 enumerateIndexesUsingBlock:v8];

  double v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

double __57__PGMemoryTriggerHandler_triggerScoreForTriggeredMemory___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 40) scoreForTriggerType:a2];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

+ (id)creationDateWithContext:(id)a3
{
  id v3 = a3;
  double v4 = [PGMemoryDate alloc];
  id v5 = [v3 localDate];
  double v6 = [(PGMemoryDate *)v4 initWithLocalDate:v5];

  id v7 = [v3 timeZone];

  uint64_t v8 = [(PGMemoryDate *)v6 universalDateInTimeZone:v7];

  return v8;
}

+ (id)personMemoryNodesFeaturingMeNodeInGraph:(id)a3
{
  id v3 = a3;
  double v4 = +[PGGraphNodeCollection nodesInGraph:v3];
  id v5 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:3 inGraph:v3];

  double v6 = [v4 featureNodeCollection];
  id v7 = [v6 memoryNodes];

  uint64_t v8 = [v5 collectionByIntersecting:v7];

  return v8;
}

+ (id)memoryNodesAllowedToBeFallbackFromMemoryNodes:(id)a3 withContext:(id)a4 inGraph:(id)a5 holidayService:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v67 = a6;
  id v12 = a3;
  id v13 = [v10 categoriesDeniedForFallback];
  uint64_t v14 = +[PGGraphMemoryNodeCollection memoryNodesOfCategories:v13 inGraph:v11];

  v71 = (void *)v14;
  double v15 = [v12 collectionBySubtracting:v14];

  double v16 = (void *)MEMORY[0x1E4F76C68];
  unint64_t v17 = [v10 localDate];
  long long v18 = +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", [v16 yearFromDate:v17], v11);

  id v70 = v18;
  long long v19 = [v18 featureNodeCollection];
  uint64_t v20 = [v19 memoryNodes];

  v69 = (void *)v20;
  long long v21 = [v15 collectionBySubtracting:v20];

  uint64_t v22 = (void *)MEMORY[0x1E4F76C68];
  uint64_t v23 = [v10 localDate];
  uint64_t v24 = [v22 seasonNameForLocalDate:v23 locale:0];

  v25 = +[PGGraphNodeCollection nodesInGraph:v11];
  v66 = (void *)v24;
  if (v24)
  {
    uint64_t v26 = +[PGGraphSeasonNodeCollection seasonNodesForSeasonName:v24 inGraph:v11];
    uint64_t v27 = [v25 collectionBySubtracting:v26];

    v25 = (void *)v27;
  }
  long long v60 = v25;
  uint64_t v28 = [v25 featureNodeCollection];
  uint32_t v65 = [v28 memoryNodes];

  os_signpost_id_t v29 = [v21 collectionBySubtracting:v65];

  uint32_t v64 = [a1 personMemoryNodesFeaturingMeNodeInGraph:v11];
  v30 = [v29 collectionBySubtracting:v64];

  uint64_t v63 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:17 inGraph:v11];
  id v61 = +[PGGraphNodeCollection nodesInGraph:v11];
  v31 = [v61 featureNodeCollection];
  uint64_t v32 = [v31 memoryNodes];
  id v62 = [v32 collectionByIntersecting:v63];

  long long v59 = [v30 collectionBySubtracting:v62];

  v33 = (void *)MEMORY[0x1E4F71E88];
  uint64_t v34 = +[PGGraphFeatureNodeCollection memoryOfFeature];
  uint64_t v35 = [v33 adjacencyWithSources:v61 relation:v34 targetsClass:objc_opt_class()];

  v36 = [v35 sources];
  v56 = [v36 holidayNames];

  unint64_t v37 = (void *)MEMORY[0x1E4F76C68];
  v38 = [v10 localDate];
  id v39 = [v10 timeZone];
  v40 = [v37 universalDateFromLocalDate:v38 inTimeZone:v39];

  id v57 = [v40 dateByAddingTimeInterval:-5259600.0];
  v41 = [v40 dateByAddingTimeInterval:5259600.0];
  id v42 = (void *)MEMORY[0x1E4F76C68];
  v43 = [v10 timeZone];
  v44 = [v42 localDateFromUniversalDate:v57 inTimeZone:v43];

  double v45 = (void *)MEMORY[0x1E4F76C68];
  [v10 timeZone];
  v46 = long long v58 = v10;
  uint64_t v47 = [v45 localDateFromUniversalDate:v41 inTimeZone:v46];

  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __107__PGMemoryTriggerHandler_memoryNodesAllowedToBeFallbackFromMemoryNodes_withContext_inGraph_holidayService___block_invoke;
  v72[3] = &unk_1E68E9568;
  id v73 = v48;
  id v49 = v48;
  [v67 enumerateEventRulesForAllCountriesWithNames:v56 betweenLocalDate:v44 andLocalDate:v47 usingBlock:v72];

  objc_super v50 = +[PGGraphHolidayNodeCollection holidayNodesWithNames:v49 inGraph:v11];
  v68 = v11;
  id v51 = v35;
  id v52 = [v35 subtractingSourcesWith:v50];
  v53 = [v52 targets];

  id v55 = [v59 collectionBySubtracting:v53];

  return v55;
}

void __107__PGMemoryTriggerHandler_memoryNodesAllowedToBeFallbackFromMemoryNodes_withContext_inGraph_holidayService___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  [v2 addObject:v3];
}

+ (id)fallbackTriggeredMemoriesWithContext:(id)a3 excludingTriggeredMemories:(id)a4 inGraph:(id)a5 holidayService:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v31 = a6;
  id v13 = +[PGGraphNodeCollection nodesInGraph:v12];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v36;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v35 + 1) + 8 * v19) uniqueMemoryIdentifier];
        [v14 addObject:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v17);
  }

  long long v21 = +[PGGraphMemoryNodeCollection memoryNodesWithUniqueIdentifiers:v14 inGraph:v12];
  uint64_t v22 = [v13 collectionBySubtracting:v21];

  uint64_t v23 = [a1 memoryNodesAllowedToBeFallbackFromMemoryNodes:v22 withContext:v10 inGraph:v12 holidayService:v31];

  uint64_t v24 = [a1 creationDateWithContext:v10];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __113__PGMemoryTriggerHandler_fallbackTriggeredMemoriesWithContext_excludingTriggeredMemories_inGraph_holidayService___block_invoke;
  v32[3] = &unk_1E68E9540;
  id v33 = v24;
  id v26 = v25;
  id v34 = v26;
  id v27 = v24;
  [v23 enumerateNodesUsingBlock:v32];
  uint64_t v28 = v34;
  id v29 = v26;

  return v29;
}

void __113__PGMemoryTriggerHandler_fallbackTriggeredMemoriesWithContext_excludingTriggeredMemories_inGraph_holidayService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [PGTriggeredMemory alloc];
  id v5 = [(PGTriggeredMemory *)v4 initWithMemoryNode:v3 validityIntervalByTriggerType:MEMORY[0x1E4F1CC08] creationDate:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) addObject:v5];
}

@end