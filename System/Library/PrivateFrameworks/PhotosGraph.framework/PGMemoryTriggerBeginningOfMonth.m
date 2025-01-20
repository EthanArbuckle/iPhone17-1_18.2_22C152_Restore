@interface PGMemoryTriggerBeginningOfMonth
- (PGMemoryTriggerBeginningOfMonth)initWithLoggingConnection:(id)a3 momentNodesWithBlockedFeatureCache:(id)a4;
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerBeginningOfMonth

- (void).cxx_destruct
{
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  int v10 = [v9 isCancelledWithProgress:0.0];
  *((unsigned char *)v52 + 24) = v10;
  if (!v10)
  {
    uint64_t v12 = [v7 localDate];
    v45 = [MEMORY[0x1E4F76C68] components:16 fromDate:v12];
    v46 = (void *)v12;
    if ([v45 day] <= 7)
    {
      uint64_t v13 = [MEMORY[0x1E4F76C68] startOfMonthForDate:v12];
      v14 = (void *)MEMORY[0x1E4F76C68];
      v15 = [v7 timeZone];
      v43 = [v14 universalDateFromLocalDate:v13 inTimeZone:v15];
      v40 = (void *)v13;

      uint64_t v16 = [MEMORY[0x1E4F76C68] dateByAddingDays:-1 toDate:v43];
      v17 = (void *)MEMORY[0x1E4F76C68];
      v18 = [v7 timeZone];
      v42 = [v17 localDateFromUniversalDate:v16 inTimeZone:v18];
      v39 = (void *)v16;

      v44 = [MEMORY[0x1E4F76C68] components:12 fromDate:v42];
      id v19 = v8;
      v20 = (void *)MEMORY[0x1E4F71F08];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __88__PGMemoryTriggerBeginningOfMonth_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
      v48[3] = &unk_1E68EBE50;
      v50 = &v51;
      id v38 = v9;
      id v49 = v38;
      v41 = [v20 progressReporterWithProgressBlock:v48];
      uint64_t v21 = [v44 month];
      uint64_t v22 = [v44 year];
      momentNodesWithBlockedFeatureCache = self->_momentNodesWithBlockedFeatureCache;
      v24 = [v7 photoLibrary];
      v25 = [(PGMemoryTrigger *)self loggingConnection];
      v26 = +[PGLastMonthAtHomeMemoryGenerator lastMonthAtHomeMemoriesForMonth:v21 year:v22 inGraph:v19 momentNodesWithBlockedFeatureCache:momentNodesWithBlockedFeatureCache photoLibrary:v24 loggingConnection:v25 progressReporter:v41];

      id v8 = v19;
      if (*((unsigned char *)v52 + 24))
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
LABEL_10:
          v11 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_27:

          goto LABEL_28;
        }
        *(_DWORD *)buf = 67109378;
        int v56 = 59;
        __int16 v57 = 2080;
        v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerBeginningOfMonth.m";
        v27 = MEMORY[0x1E4F14500];
LABEL_9:
        _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_10;
      }
      if (![v26 count])
      {
        if (*((unsigned char *)v52 + 24))
        {
          id v8 = v19;
          *((unsigned char *)v52 + 24) = 1;
        }
        else
        {
          char v37 = [v38 isCancelledWithProgress:1.0];
          *((unsigned char *)v52 + 24) = v37;
          id v8 = v19;
          if ((v37 & 1) == 0) {
            goto LABEL_10;
          }
        }
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_10;
        }
        *(_DWORD *)buf = 67109378;
        int v56 = 61;
        __int16 v57 = 2080;
        v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerBeginningOfMonth.m";
        v27 = MEMORY[0x1E4F14500];
        goto LABEL_9;
      }
      v29 = [MEMORY[0x1E4F76C68] startOfMonthForDate:v46];
      id v8 = v19;
      v30 = [MEMORY[0x1E4F76C68] dateComponentsWithLocalDate:v29];
      [v30 setDay:7];
      v31 = [MEMORY[0x1E4F76C68] dateFromComponents:v30 inTimeZone:0];
      v32 = objc_opt_class();
      v33 = [v7 timeZone];
      v34 = [v32 validityIntervalForLocalStartDate:v29 localEndDate:v31 timeZone:v33];

      if (*((unsigned char *)v52 + 24))
      {
        *((unsigned char *)v52 + 24) = 1;
      }
      else
      {
        char v35 = [v38 isCancelledWithProgress:1.0];
        *((unsigned char *)v52 + 24) = v35;
        if ((v35 & 1) == 0)
        {
          v11 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodesArray:v26 withValidityInterval:v34];
LABEL_26:

          goto LABEL_27;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v56 = 70;
        __int16 v57 = 2080;
        v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerBeginningOfMonth.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_26;
    }
    if (*((unsigned char *)v52 + 24))
    {
      *((unsigned char *)v52 + 24) = 1;
    }
    else
    {
      char v28 = [v9 isCancelledWithProgress:1.0];
      *((unsigned char *)v52 + 24) = v28;
      if ((v28 & 1) == 0)
      {
LABEL_16:
        v11 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_28:

        goto LABEL_29;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v56 = 73;
      __int16 v57 = 2080;
      v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerBeginningOfMonth.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v56 = 42;
    __int16 v57 = 2080;
    v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/Mem"
          "oryTriggers/PGMemoryTriggerBeginningOfMonth.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v11 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_29:
  _Block_object_dispose(&v51, 8);

  return v11;
}

uint64_t __88__PGMemoryTriggerBeginningOfMonth_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:0.5];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v4 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return a3;
}

- (unint64_t)triggerType
{
  return 6;
}

- (PGMemoryTriggerBeginningOfMonth)initWithLoggingConnection:(id)a3 momentNodesWithBlockedFeatureCache:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGMemoryTriggerBeginningOfMonth;
  id v8 = [(PGMemoryTrigger *)&v11 initWithLoggingConnection:a3];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_momentNodesWithBlockedFeatureCache, a4);
  }

  return v9;
}

@end