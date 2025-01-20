@interface PGMemoryTriggerRecentMomentWithSocialGroup
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerRecentMomentWithSocialGroup

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v71 = 39;
      __int16 v72 = 2080;
      v73 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentMomentWithSocialGroup.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v58 = self;
    v12 = [v8 localDate];
    v13 = (void *)MEMORY[0x1E4F76C68];
    v14 = [v8 timeZone];
    uint64_t v15 = [v13 universalDateFromLocalDate:v12 inTimeZone:v14];

    v16 = [MEMORY[0x1E4F76C68] dateByAddingDays:-10 toDate:v15];
    v62 = (void *)v15;
    uint64_t v17 = [MEMORY[0x1E4F76C68] dateByAddingDays:-3 toDate:v15];
    v18 = (void *)MEMORY[0x1E4F76C68];
    v19 = [v8 timeZone];
    [v18 localDateFromUniversalDate:v16 inTimeZone:v19];
    v21 = id v20 = v9;

    v22 = (void *)MEMORY[0x1E4F76C68];
    v23 = [v8 timeZone];
    v61 = (void *)v17;
    uint64_t v24 = [v22 localDateFromUniversalDate:v17 inTimeZone:v23];

    id v25 = objc_alloc(MEMORY[0x1E4F28C18]);
    v59 = (void *)v24;
    v60 = (void *)v21;
    uint64_t v26 = v21;
    id v9 = v20;
    v27 = (void *)[v25 initWithStartDate:v26 endDate:v24];
    v28 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:v27 inGraph:v20];
    v29 = [v28 socialGroupNodes];
    if ([v29 count])
    {
      v55 = v27;
      v56 = v16;
      v57 = v12;
      uint64_t v30 = [MEMORY[0x1E4F76C68] dateByAddingDays:-1 toDate:v16];
      uint64_t v31 = [MEMORY[0x1E4F76C68] dateByAddingDays:-90 toDate:v30];
      v32 = (void *)MEMORY[0x1E4F76C68];
      v33 = [v8 timeZone];
      v53 = (void *)v31;
      uint64_t v34 = v31;
      v35 = (void *)v30;
      uint64_t v36 = [v32 localDateFromUniversalDate:v34 inTimeZone:v33];

      v37 = (void *)MEMORY[0x1E4F76C68];
      v38 = [v8 timeZone];
      uint64_t v39 = [v37 localDateFromUniversalDate:v35 inTimeZone:v38];

      v51 = (void *)v39;
      v52 = (void *)v36;
      v50 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v36 endDate:v39];
      v49 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:");
      [v49 socialGroupNodes];
      v48 = v54 = v29;
      v40 = objc_msgSend(v29, "collectionBySubtracting:");
      id v41 = objc_alloc_init(MEMORY[0x1E4F71E60]);
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __99__PGMemoryTriggerRecentMomentWithSocialGroup_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
      v68[3] = &unk_1E68E7FC0;
      id v42 = v41;
      id v69 = v42;
      [v40 enumerateIdentifiersAsCollectionsWithBlock:v68];
      v43 = [(MAElementCollection *)[PGGraphSocialGroupNodeCollection alloc] initWithGraph:v9 elementIdentifiers:v42];
      v44 = [v40 collectionBySubtracting:v43];

      id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __99__PGMemoryTriggerRecentMomentWithSocialGroup_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2;
      v63[3] = &unk_1E68E5428;
      id v64 = v28;
      v65 = v58;
      id v66 = v8;
      id v46 = v45;
      id v67 = v46;
      [v44 enumerateIdentifiersAsCollectionsWithBlock:v63];
      if ([v10 isCancelledWithProgress:1.0])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v71 = 96;
          __int16 v72 = 2080;
          v73 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerRecentMomentWithSocialGroup.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v11 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        id v11 = v46;
      }

      v16 = v56;
      v12 = v57;
      v29 = v54;
      v27 = v55;
    }
    else
    {
      if ([v10 isCancelledWithProgress:1.0]
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v71 = 55;
        __int16 v72 = 2080;
        v73 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentMomentWithSocialGroup.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  return v11;
}

void __99__PGMemoryTriggerRecentMomentWithSocialGroup_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  v4 = [v8 personNodes];
  uint64_t v5 = [v4 count];

  if (v5 == 1)
  {
    v6 = *(void **)(a1 + 32);
    v7 = [v8 elementIdentifiers];
    [v6 unionWithIdentifierSet:v7];
  }
}

void __99__PGMemoryTriggerRecentMomentWithSocialGroup_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  v6 = [v5 momentNodes];
  id v18 = [v4 collectionByFormingUnionWith:v6];

  v7 = [v18 localDateInterval];
  id v8 = [v7 endDate];

  id v9 = [v8 dateByAddingTimeInterval:864000.0];
  id v10 = [v8 dateByAddingTimeInterval:259200.0];
  id v11 = objc_opt_class();
  v12 = [*(id *)(a1 + 48) timeZone];
  v13 = [v11 validityIntervalForLocalStartDate:v10 localEndDate:v9 timeZone:v12];

  v14 = [v5 featureNodeCollection];

  uint64_t v15 = [v14 memoryNodes];

  v16 = *(void **)(a1 + 56);
  uint64_t v17 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v15 withValidityInterval:v13];
  [v16 addObjectsFromArray:v17];
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  v3 = +[PGGraphNodeCollection subsetInCollection:a3];
  v4 = [v3 featureNodeCollection];

  return v4;
}

- (unint64_t)triggerType
{
  return 13;
}

@end