@interface PGMemoryTriggerRecentHighlights
- (PGMemoryTriggerRecentHighlights)initWithLoggingConnection:(id)a3 momentNodesWithBlockedFeatureCache:(id)a4;
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerRecentHighlights

- (void).cxx_destruct
{
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  char v72 = 0;
  int v11 = [v10 isCancelledWithProgress:0.0];
  *((unsigned char *)v70 + 24) = v11;
  if (!v11)
  {
    v13 = [v8 localDate];
    v61 = [v8 timeZone];
    v65 = [v8 creationDateOfLastMemory];
    v63 = [MEMORY[0x1E4F76C68] dateByAddingDays:-92 toDate:v13];
    id v14 = objc_alloc(MEMORY[0x1E4F28C18]);
    v15 = [MEMORY[0x1E4F76C68] startOfDayForDate:v63];
    v62 = (void *)[v14 initWithStartDate:v15 endDate:v13];

    if (v65)
    {
      v16 = [[PGMemoryDate alloc] initWithLocalDate:v13];
      id v17 = objc_alloc(MEMORY[0x1E4F28C18]);
      v18 = [(PGMemoryDate *)v16 universalDateInTimeZone:v61];
      v64 = (void *)[v17 initWithStartDate:v65 endDate:v18];

      [v64 duration];
      uint64_t v20 = (uint64_t)(v19 / 86400.0);
      if (v20 <= 20)
      {
        v12 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_36:

        goto LABEL_37;
      }
      if ((unint64_t)v20 <= 0x5C)
      {
        v21 = (void *)MEMORY[0x1E4F76C68];
        v22 = [MEMORY[0x1E4F76C68] localDateFromUniversalDate:v65 inTimeZone:v61];
        v23 = [v21 startOfDayForDate:v22];

        uint64_t v24 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v23 endDate:v13];
        v62 = (void *)v24;
      }
    }
    v25 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:v62 inGraph:v9];
    v26 = +[PGGraphNodeCollection nodesInGraph:v9];
    v59 = [v26 subsetHappeningAtSensitiveLocation];
    +[PGMemoryGeneratorUtils momentNodesAtHomeOrWorkOrFrequentLocationInGraph:v9];
    v58 = v64 = v26;
    uint64_t v27 = objc_msgSend(v59, "collectionBySubtracting:");
    v16 = [v25 collectionBySubtracting:v27];
    v57 = (void *)v27;

    v28 = [(PGMemoryDate *)v16 highlightNodes];
    v60 = [v28 highlightGroupNodes];

    if ([v60 count])
    {
      v29 = +[PGGraphHighlightTypeNodeCollection longTripTypeNodesInGraph:v9];
      v30 = [v29 highlightGroupNodes];
      v31 = [v30 collectionByIntersecting:v60];

      v32 = [v31 featureNodeCollection];
      v33 = [v32 memoryNodes];

      v34 = [v33 subsetWithMemoryCategory:19];

      if ([v34 count])
      {
        v35 = [(id)objc_opt_class() singleDayValidityIntervalWithContext:v8];
        if (*((unsigned char *)v70 + 24))
        {
          *((unsigned char *)v70 + 24) = 1;
        }
        else
        {
          char v41 = [v10 isCancelledWithProgress:1.0];
          *((unsigned char *)v70 + 24) = v41;
          if ((v41 & 1) == 0)
          {
            v12 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v34 withValidityInterval:v35];
LABEL_30:

            goto LABEL_35;
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v75 = 93;
          __int16 v76 = 2080;
          v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerRecentHighlights.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v12 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_30;
      }
    }
    unint64_t v36 = [(PGMemoryDate *)v16 numberOfAssets];
    if ((unint64_t)[(PGMemoryDate *)v16 count] >= 3 && v36 > 0xE)
    {
      v37 = (void *)MEMORY[0x1E4F71F08];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __88__PGMemoryTriggerRecentHighlights_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
      v66[3] = &unk_1E68EBE50;
      v68 = &v69;
      id v38 = v10;
      id v67 = v38;
      v39 = [v37 progressReporterWithProgressBlock:v66];
      v56 = [(PGMemoryMomentNodesWithBlockedFeatureCache *)self->_momentNodesWithBlockedFeatureCache momentNodesWithBlockedFeatureInGraph:v9 progressReporter:v39];
      if (*((unsigned char *)v70 + 24))
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
LABEL_22:
          v12 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_23:

LABEL_35:
          goto LABEL_36;
        }
        *(_DWORD *)buf = 67109378;
        int v75 = 109;
        __int16 v76 = 2080;
        v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentHighlights.m";
        v40 = MEMORY[0x1E4F14500];
LABEL_21:
        _os_log_impl(&dword_1D1805000, v40, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_22;
      }
      v44 = [(PGMemoryDate *)v16 collectionBySubtracting:v56];

      v45 = [v44 interestingForMemoriesSubset];

      v46 = [v45 momentNodesWithContentScoreAbove:0.5];

      v16 = [v46 momentNodesWithMinimumNumberOfPersons:1];

      unint64_t v47 = [(PGMemoryDate *)v16 numberOfAssets];
      if ((unint64_t)[(PGMemoryDate *)v16 count] < 3 || v47 <= 0xE)
      {
        if (*((unsigned char *)v70 + 24))
        {
          *((unsigned char *)v70 + 24) = 1;
        }
        else
        {
          char v52 = [v38 isCancelledWithProgress:1.0];
          *((unsigned char *)v70 + 24) = v52;
          if ((v52 & 1) == 0) {
            goto LABEL_22;
          }
        }
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 67109378;
        int v75 = 118;
        __int16 v76 = 2080;
        v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentHighlights.m";
        v40 = MEMORY[0x1E4F14500];
        goto LABEL_21;
      }
      v48 = [PGGraphMemory alloc];
      v49 = [(PGMemoryDate *)v16 featureNodeCollection];
      v50 = [(PGGraphMemory *)v48 initWithMemoryCategory:24 memoryCategorySubcategory:5002 momentNodes:v16 featureNodes:v49];

      v51 = [(id)objc_opt_class() singleDayValidityIntervalWithContext:v8];
      if (*((unsigned char *)v70 + 24))
      {
        *((unsigned char *)v70 + 24) = 1;
      }
      else
      {
        char v53 = [v38 isCancelledWithProgress:1.0];
        *((unsigned char *)v70 + 24) = v53;
        if ((v53 & 1) == 0)
        {
          v54 = objc_opt_class();
          v73 = v50;
          v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
          v12 = [v54 memoryTriggerResultsForMemoryNodesArray:v55 withValidityInterval:v51];

LABEL_54:
          goto LABEL_23;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v75 = 125;
        __int16 v76 = 2080;
        v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentHighlights.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v12 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_54;
    }
    if (*((unsigned char *)v70 + 24))
    {
      *((unsigned char *)v70 + 24) = 1;
    }
    else
    {
      char v42 = [v10 isCancelledWithProgress:1.0];
      *((unsigned char *)v70 + 24) = v42;
      if ((v42 & 1) == 0)
      {
LABEL_34:
        v12 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_35;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v75 = 101;
      __int16 v76 = 2080;
      v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentHighlights.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    goto LABEL_34;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v75 = 52;
    __int16 v76 = 2080;
    v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/Mem"
          "oryTriggers/PGMemoryTriggerRecentHighlights.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v12 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_37:
  _Block_object_dispose(&v69, 8);

  return v12;
}

uint64_t __88__PGMemoryTriggerRecentHighlights_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, unsigned char *a2)
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
  return 16;
}

- (PGMemoryTriggerRecentHighlights)initWithLoggingConnection:(id)a3 momentNodesWithBlockedFeatureCache:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGMemoryTriggerRecentHighlights;
  id v8 = [(PGMemoryTrigger *)&v11 initWithLoggingConnection:a3];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_momentNodesWithBlockedFeatureCache, a4);
  }

  return v9;
}

@end