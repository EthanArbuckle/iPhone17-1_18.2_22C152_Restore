@interface PGMemoryTriggerRecentMomentWithPerson
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerRecentMomentWithPerson

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v67 = 42;
      __int16 v68 = 2080;
      v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentMomentWithPerson.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v12 = [v8 localDate];
    v13 = (void *)MEMORY[0x1E4F76C68];
    [v8 timeZone];
    v14 = v49 = self;
    v59 = (void *)v12;
    uint64_t v15 = [v13 universalDateFromLocalDate:v12 inTimeZone:v14];

    uint64_t v16 = [MEMORY[0x1E4F76C68] dateByAddingDays:-10 toDate:v15];
    v58 = (void *)v15;
    uint64_t v17 = [MEMORY[0x1E4F76C68] dateByAddingDays:-3 toDate:v15];
    v18 = (void *)MEMORY[0x1E4F76C68];
    v19 = [v8 timeZone];
    uint64_t v20 = [v18 localDateFromUniversalDate:v16 inTimeZone:v19];

    v21 = (void *)MEMORY[0x1E4F76C68];
    v22 = [v8 timeZone];
    v56 = (void *)v17;
    uint64_t v23 = [v21 localDateFromUniversalDate:v17 inTimeZone:v22];

    v54 = (void *)v23;
    v55 = (void *)v20;
    v53 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v20 endDate:v23];
    v24 = objc_msgSend(v9, "dateNodesForLocalDateInterval:");
    v25 = [v24 momentNodes];
    [v25 personNodes];
    uint64_t v27 = v26 = v10;

    v57 = (void *)v16;
    uint64_t v28 = [MEMORY[0x1E4F76C68] dateByAddingDays:-1 toDate:v16];
    uint64_t v29 = [MEMORY[0x1E4F76C68] dateByAddingDays:-90 toDate:v28];
    v30 = (void *)MEMORY[0x1E4F76C68];
    v31 = [v8 timeZone];
    v50 = (void *)v29;
    uint64_t v32 = [v30 localDateFromUniversalDate:v29 inTimeZone:v31];

    v33 = (void *)MEMORY[0x1E4F76C68];
    v34 = [v8 timeZone];
    v51 = (void *)v28;
    uint64_t v35 = [v33 localDateFromUniversalDate:v28 inTimeZone:v34];

    v47 = (void *)v35;
    v48 = (void *)v32;
    v36 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v32 endDate:v35];
    v37 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:v36 inGraph:v9];
    v38 = [v37 personNodes];
    v52 = (void *)v27;
    v39 = (void *)v27;
    id v10 = v26;
    v40 = [v39 collectionBySubtracting:v38];
    id v60 = v9;
    v41 = [v9 meNodeCollection];
    v42 = [v40 collectionBySubtracting:v41];

    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __94__PGMemoryTriggerRecentMomentWithPerson_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v61[3] = &unk_1E68E7C40;
    id v62 = v24;
    v63 = v49;
    id v64 = v8;
    id v44 = v43;
    id v65 = v44;
    id v45 = v24;
    [v42 enumerateIdentifiersAsCollectionsWithBlock:v61];
    if ([v26 isCancelledWithProgress:1.0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v67 = 82;
        __int16 v68 = 2080;
        v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentMomentWithPerson.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v11 = v44;
    }

    id v9 = v60;
  }

  return v11;
}

void __94__PGMemoryTriggerRecentMomentWithPerson_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  v6 = [v5 momentNodes];
  v7 = [v6 dateNodes];
  id v19 = [v4 collectionByIntersecting:v7];

  id v8 = [v19 localDateInterval];
  id v9 = [v8 endDate];

  id v10 = [v9 dateByAddingTimeInterval:864000.0];
  id v11 = [v9 dateByAddingTimeInterval:259200.0];
  uint64_t v12 = objc_opt_class();
  v13 = [*(id *)(a1 + 48) timeZone];
  v14 = [v12 validityIntervalForLocalStartDate:v11 localEndDate:v10 timeZone:v13];

  uint64_t v15 = [v5 featureNodeCollection];

  uint64_t v16 = [v15 memoryNodes];

  uint64_t v17 = *(void **)(a1 + 56);
  v18 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v16 withValidityInterval:v14];
  [v17 addObjectsFromArray:v18];
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  v3 = +[PGGraphNodeCollection subsetInCollection:a3];
  v4 = [v3 featureNodeCollection];

  return v4;
}

- (unint64_t)triggerType
{
  return 10;
}

@end