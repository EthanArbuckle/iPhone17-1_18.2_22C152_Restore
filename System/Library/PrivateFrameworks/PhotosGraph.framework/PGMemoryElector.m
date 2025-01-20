@interface PGMemoryElector
+ (int64_t)compareMemoryCategoryForMemory:(id)a3 toOtherMemory:(id)a4;
- (BOOL)_memoryContainsNegativeFeedbackPets:(id)a3;
- (BOOL)_shouldCheckForSuggestionCollisionsForTriggeredMemory:(id)a3;
- (PGMemoryElector)initWithWorkingContext:(id)a3 userFeedbackCalculator:(id)a4;
- (double)_contentScoreWeightForNewMemoryFocusWithCategory:(unint64_t)a3;
- (id)_requestedEnrichedMemoriesWithConfiguration:(id)a3 graph:(id)a4;
- (id)electAndEnrichSortedTriggeredMemories:(id)a3 alreadyEnrichedMemories:(id)a4 targetNumberOfMemories:(unint64_t)a5 configuration:(id)a6 graph:(id)a7 planner:(id)a8 context:(id)a9 progressReporter:(id)a10;
- (id)filterAndSortTriggeredMemories:(id)a3 withPlanner:(id)a4 context:(id)a5 configuration:(id)a6 progressReporter:(id)a7;
- (id)generateEnrichedMemoriesWithConfiguration:(id)a3 graph:(id)a4 plannerPastSource:(id)a5 plannerFutureSource:(id)a6 progressReporter:(id)a7;
- (id)generateEnrichedMemoriesWithConfiguration:(id)a3 graph:(id)a4 progressReporter:(id)a5;
- (unint64_t)targetNumberOfMemoriesFromConfigurator:(id)a3 graph:(id)a4 context:(id)a5;
- (void)persistEnrichedMemories:(id)a3 pendingState:(unsigned __int16)a4 graph:(id)a5 progressReporter:(id)a6;
@end

@implementation PGMemoryElector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteConfiguration, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

- (void)persistEnrichedMemories:(id)a3 pendingState:(unsigned __int16)a4 graph:(id)a5 progressReporter:(id)a6
{
  uint64_t v7 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = [[PGMemoryPhotoKitPersister alloc] initWithPhotoLibrary:self->_photoLibrary];
  id v17 = 0;
  v14 = [(PGMemoryPhotoKitPersister *)v13 memoryLocalIdentifiersFromPersistingEnrichedMemories:v12 withPendingState:v7 graph:v11 progressReporter:v10 error:&v17];

  id v15 = v17;
  if (!v14)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v15;
      _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGMemoryElector] error persisting enriched memories %@", buf, 0xCu);
    }
  }
}

- (id)_requestedEnrichedMemoriesWithConfiguration:(id)a3 graph:(id)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = [[PGGraphLocationHelper alloc] initWithGraph:v7];
  id v10 = [[PGMemoryCurationSession alloc] initWithCurationManager:self->_curationManager photoLibrary:self->_photoLibrary curationContext:self->_curationContext locationHelper:v9];
  id v11 = [PGEnrichedMemoryFactory alloc];
  v71 = self;
  id v12 = [(PGManagerWorkingContext *)self->_workingContext serviceManager];
  v70 = v10;
  v72 = [(PGEnrichedMemoryFactory *)v11 initWithMemoryCurationSession:v10 graph:v7 serviceManager:v12];

  uint64_t v13 = [v6 requestedMemoryCategory];
  v14 = [v6 requestedUniqueMemoryIdentifier];
  uint64_t v15 = v13 | [v14 length];

  uint64_t v16 = [v6 requestedTriggerType];
  if (!v15)
  {
LABEL_10:
    if (v16)
    {
      v67 = v9;
      v36 = v8;
      v37 = [PGMemoryContext alloc];
      v38 = [v6 localDate];
      v39 = [v6 timeZone];
      uint64_t v40 = [(PGMemoryContext *)v37 initWithLocalDate:v38 timeZone:v39 photoLibrary:v71->_photoLibrary];

      v65 = [[PGMemoryMomentNodesWithBlockedFeatureCache alloc] initWithUserFeedbackCalculator:v71->_userFeedbackCalculator loggingConnection:v71->_loggingConnection];
      v41 = [[PGMemoryTriggerHandler alloc] initWithWorkingContext:v71->_workingContext momentNodesWithBlockedFeatureCache:v65];
      uint64_t v42 = [v6 requestedTriggerType];
      v43 = [MEMORY[0x1E4F71F08] ignoreProgress];
      v64 = v41;
      v66 = (void *)v40;
      id v69 = v7;
      v44 = [(PGMemoryTriggerHandler *)v41 allTriggeredMemoriesWithContext:v40 forTriggerType:v42 inGraph:v7 progressReporter:v43];

      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v45 = v44;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v73 objects:v81 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v74;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v74 != v48) {
              objc_enumerationMutation(v45);
            }
            uint64_t v50 = *(void *)(*((void *)&v73 + 1) + 8 * i);
            v51 = (void *)MEMORY[0x1D25FED50]();
            v52 = [MEMORY[0x1E4F71F08] ignoreProgress];
            v53 = [(PGEnrichedMemoryFactory *)v72 enrichedMemoryWithTriggeredMemory:v50 withConfiguration:v6 progressReporter:v52];

            if (v53) {
              [v36 addObject:v53];
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v73 objects:v81 count:16];
        }
        while (v47);
      }

      id v8 = v36;
      v9 = v67;
      id v7 = v69;
    }
    if ([v6 shouldPersist])
    {
      uint64_t v54 = [v6 pendingState];
      v55 = [MEMORY[0x1E4F71F08] ignoreProgress];
      [(PGMemoryElector *)v71 persistEnrichedMemories:v8 pendingState:v54 graph:v7 progressReporter:v55];
    }
    id v56 = v8;
    goto LABEL_24;
  }
  id v17 = [(MAElementCollection *)[PGGraphMemoryNodeCollection alloc] initWithGraph:v7];
  if (!v13)
  {
LABEL_7:
    v28 = [v6 requestedUniqueMemoryIdentifier];
    uint64_t v29 = [v28 length];

    if (v29)
    {
      v30 = [v6 requestedUniqueMemoryIdentifier];
      v82 = v30;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
      id v31 = v6;
      v33 = id v32 = v8;
      v34 = +[PGGraphMemoryNodeCollection memoryNodesWithUniqueIdentifierArray:v33 inGraph:v7];
      uint64_t v35 = [(MAElementCollection *)v17 collectionByFormingUnionWith:v34];

      id v8 = v32;
      id v6 = v31;

      id v17 = (PGGraphMemoryNodeCollection *)v35;
    }
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __69__PGMemoryElector__requestedEnrichedMemoriesWithConfiguration_graph___block_invoke;
    v77[3] = &unk_1E68EF308;
    id v78 = v6;
    v79 = v72;
    id v80 = v8;
    [(MANodeCollection *)v17 enumerateNodesUsingBlock:v77];

    goto LABEL_10;
  }
  v18 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", [v6 requestedMemoryCategory], v7);
  id v19 = [(MAElementCollection *)v17 collectionByFormingUnionWith:v18];

  uint64_t v20 = [v6 requestedFeature];
  v21 = v20;
  if (!v20)
  {
LABEL_6:

    id v17 = v19;
    goto LABEL_7;
  }
  uint64_t v22 = [v20 nodeInGraph:v7];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(MANodeCollection *)[PGGraphFeatureNodeCollection alloc] initWithNode:v22];
    [(PGGraphFeatureNodeCollection *)v24 memoryNodes];
    id v25 = v6;
    v27 = id v26 = v8;
    uint64_t v68 = [(MAElementCollection *)v19 collectionByIntersecting:v27];

    id v8 = v26;
    id v6 = v25;

    id v19 = (PGGraphMemoryNodeCollection *)v68;
    goto LABEL_6;
  }
  loggingConnection = v71->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
  {
    v59 = loggingConnection;
    int v60 = [v21 type];
    [v21 name];
    id v61 = v6;
    v63 = id v62 = v8;
    *(_DWORD *)buf = 67109378;
    int v84 = v60;
    __int16 v85 = 2112;
    v86 = v63;
    _os_log_error_impl(&dword_1D1805000, v59, OS_LOG_TYPE_ERROR, "[PGMemoryElector] Error fetching graph node for feature of type %d, name %@", buf, 0x12u);

    id v8 = v62;
    id v6 = v61;
  }
  id v56 = (id)MEMORY[0x1E4F1CBF0];
LABEL_24:

  return v56;
}

void __69__PGMemoryElector__requestedEnrichedMemoriesWithConfiguration_graph___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = (void *)MEMORY[0x1D25FED50]();
  v4 = [PGTriggeredMemory alloc];
  v5 = [*(id *)(a1 + 32) localDate];
  id v6 = [(PGTriggeredMemory *)v4 initWithMemoryNode:v11 validityIntervalByTriggerType:MEMORY[0x1E4F1CC08] creationDate:v5];

  uint64_t v8 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  v9 = [MEMORY[0x1E4F71F08] ignoreProgress];
  id v10 = [v7 enrichedMemoryWithTriggeredMemory:v6 withConfiguration:v8 progressReporter:v9];

  if (v10) {
    [*(id *)(a1 + 48) addObject:v10];
  }
}

- (id)electAndEnrichSortedTriggeredMemories:(id)a3 alreadyEnrichedMemories:(id)a4 targetNumberOfMemories:(unint64_t)a5 configuration:(id)a6 graph:(id)a7 planner:(id)a8 context:(id)a9 progressReporter:(id)a10
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v62 = a4;
  id v67 = a6;
  id v16 = a7;
  id v65 = a8;
  id v56 = a9;
  id v61 = a10;
  v63 = v16;
  v57 = [[PGGraphLocationHelper alloc] initWithGraph:v16];
  v64 = [[PGMemoryCurationSession alloc] initWithCurationManager:self->_curationManager photoLibrary:self->_photoLibrary curationContext:self->_curationContext locationHelper:v57];
  id v17 = [PGEnrichedMemoryFactory alloc];
  v18 = [(PGManagerWorkingContext *)self->_workingContext serviceManager];
  v66 = [(PGEnrichedMemoryFactory *)v17 initWithMemoryCurationSession:v64 graph:v63 serviceManager:v18];

  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a5;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[MemoryElector] targetNumberOfMemories: %d", buf, 8u);
  }
  if (!a5)
  {
    id v58 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_38;
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v21 = v62;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v97 objects:v108 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v98;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v98 != v23) {
          objc_enumerationMutation(v21);
        }
        id v25 = [*(id *)(*((void *)&v97 + 1) + 8 * i) keyAssetUUID];
        if (v25) {
          [v20 addObject:v25];
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v97 objects:v108 count:16];
    }
    while (v22);
  }

  uint64_t v55 = [v67 maximumNumberOfMemoriesWithGuestAssets];
  *(void *)buf = 0;
  v105 = buf;
  uint64_t v106 = 0x2020000000;
  uint64_t v107 = 0;
  id v68 = v61;
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x2020000000;
  char v96 = 0;
  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v21];
  v27 = (void *)[v60 mutableCopy];
  v28 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v28 setPersonContext:1];
  [v28 setIncludedDetectionTypes:&unk_1F28D4C08];
  v59 = v28;
  uint64_t v29 = self->_loggingConnection;
  os_signpost_id_t v30 = os_signpost_id_generate((os_log_t)v29);
  id v31 = v29;
  id v32 = v31;
  os_signpost_id_t spid = v30;
  unint64_t v54 = v30 - 1;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)v88 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "MemoryElectionElectAndEnrich", "", v88, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v52 = mach_absolute_time();
  *(void *)v88 = 0;
  v89 = v88;
  uint64_t v90 = 0x2020000000;
  uint64_t v91 = 0;
  double v33 = 0.0;
  v34 = MEMORY[0x1E4F14500];
  id v58 = (id)MEMORY[0x1E4F1CBF0];
  while (objc_msgSend(v26, "count", v52) < a5 && objc_msgSend(v27, "count") && v33 <= 1.0)
  {
    uint64_t v35 = (void *)MEMORY[0x1D25FED50]();
    v36 = v32;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v42 = [v26 count];
      uint64_t v43 = [v27 count];
      *(_DWORD *)v102 = 134218496;
      *(void *)&v102[4] = v42;
      *(_WORD *)&v102[12] = 2048;
      *(void *)&v102[14] = v43;
      *(_WORD *)&v102[22] = 2048;
      uint64_t v103 = *(void *)&v33;
      _os_log_debug_impl(&dword_1D1805000, v36, OS_LOG_TYPE_DEBUG, "electedEnrichedMemories: %lu, sortedRemainingTriggeredMemories: %lu, currentCommonalityThreshold: %.3f", v102, 0x20u);
    }

    if (*((unsigned char *)v94 + 24))
    {
      *((unsigned char *)v94 + 24) = 1;
LABEL_25:
      char v38 = 1;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v102 = 67109378;
        *(_DWORD *)&v102[4] = 533;
        *(_WORD *)&v102[8] = 2080;
        *(void *)&v102[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Memories/PGMemoryElector.m";
        _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v102, 0x12u);
      }
      goto LABEL_28;
    }
    int v37 = [v68 isCancelledWithProgress:*((double *)v89 + 3)];
    *((unsigned char *)v94 + 24) = v37;
    if (v37) {
      goto LABEL_25;
    }
    *(void *)v102 = 0;
    *(void *)&v102[8] = v102;
    *(void *)&v102[16] = 0x2020000000;
    uint64_t v103 = 0x7FEFFFFFFFFFFFFFLL;
    id v39 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __157__PGMemoryElector_electAndEnrichSortedTriggeredMemories_alreadyEnrichedMemories_targetNumberOfMemories_configuration_graph_planner_context_progressReporter___block_invoke;
    v69[3] = &unk_1E68EF2E0;
    id v70 = v26;
    id v40 = v39;
    id v71 = v40;
    id v72 = v65;
    v41 = v36;
    double v84 = v33;
    long long v73 = v41;
    id v80 = v102;
    v81 = &v93;
    id v74 = v68;
    v82 = v88;
    long long v75 = v66;
    id v76 = v67;
    v83 = buf;
    uint64_t v85 = v55;
    id v77 = v20;
    id v78 = v59;
    v79 = self;
    double v86 = 1.0 / (double)a5;
    unint64_t v87 = a5;
    [v27 enumerateObjectsUsingBlock:v69];
    double v33 = *(double *)(*(void *)&v102[8] + 24);
    [v27 removeObjectsAtIndexes:v40];

    _Block_object_dispose(v102, 8);
    char v38 = 0;
LABEL_28:
    if (v38) {
      goto LABEL_36;
    }
  }
  uint64_t v44 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v47 = v32;
  uint64_t v48 = v47;
  if (v54 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    *(_WORD *)v102 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v48, OS_SIGNPOST_INTERVAL_END, spid, "MemoryElectionElectAndEnrich", "", v102, 2u);
  }

  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v102 = 136315394;
    *(void *)&v102[4] = "MemoryElectionElectAndEnrich";
    *(_WORD *)&v102[12] = 2048;
    *(double *)&v102[14] = (float)((float)((float)((float)(v44 - v52) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v48, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v102, 0x16u);
  }
  v49 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
  v101 = v49;
  uint64_t v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
  [v26 sortUsingDescriptors:v50];

  id v58 = v26;
LABEL_36:
  _Block_object_dispose(v88, 8);

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(buf, 8);

LABEL_38:
  return v58;
}

void __157__PGMemoryElector_electAndEnrichSortedTriggeredMemories_alreadyEnrichedMemories_targetNumberOfMemories_configuration_graph_planner_context_progressReporter___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = (void *)MEMORY[0x1D25FED50]();
  if (!+[PGMemoryPlanner canElectTriggeredMemory:v7 withAlreadyElectedMemories:*(void *)(a1 + 32)])
  {
    [*(id *)(a1 + 40) addIndex:a3];
    goto LABEL_48;
  }
  id v58 = a4;
  id v60 = v8;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v67;
    double v13 = 1.79769313e308;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v67 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        [*(id *)(a1 + 48) commonalityScoreComparingMemory:v7 toAlreadyElectedMemory:v15];
        double v17 = v16;
        v18 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          double v19 = *(double *)(a1 + 144);
          unint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
          *(_DWORD *)buf = 134218496;
          id v71 = *(const char **)&v17;
          __int16 v72 = 2048;
          double v73 = v19;
          __int16 v74 = 2048;
          unint64_t v75 = v20;
          _os_log_debug_impl(&dword_1D1805000, v18, OS_LOG_TYPE_DEBUG, "commonalityScore: %.3f, currentCommonalityThreshold: %.3f, lowestCommonality: %.3f", buf, 0x20u);
        }
        if (v17 > *(double *)(a1 + 144))
        {
          *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = fmin(*(double *)(*(void *)(*(void *)(a1 + 112)+ 8)+ 24), v17);
          id v21 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v52 = v21;
            v53 = [v7 uniqueMemoryIdentifier];
            double v54 = [v15 uniqueMemoryIdentifier];
            *(_DWORD *)buf = 138412546;
            id v71 = v53;
            __int16 v72 = 2112;
            double v73 = v54;
            _os_log_debug_impl(&dword_1D1805000, v52, OS_LOG_TYPE_DEBUG, "tooMuchOverlapWithElectedMemory: %@ - %@", buf, 0x16u);
          }
          goto LABEL_47;
        }
        double v13 = fmin(v13, v17);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v66 objects:v76 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v13 = 1.79769313e308;
  }

  *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = fmin(*(double *)(*(void *)(*(void *)(a1 + 112) + 8)+ 24), v13);
  uint64_t v22 = (void *)MEMORY[0x1E4F71F08];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __157__PGMemoryElector_electAndEnrichSortedTriggeredMemories_alreadyEnrichedMemories_targetNumberOfMemories_configuration_graph_planner_context_progressReporter___block_invoke_258;
  v62[3] = &unk_1E68EF2B8;
  uint64_t v64 = *(void *)(a1 + 120);
  id v23 = *(id *)(a1 + 64);
  uint64_t v24 = *(void *)(a1 + 128);
  id v63 = v23;
  uint64_t v65 = v24;
  id v25 = [v22 progressReporterWithProgressBlock:v62];
  id v26 = [*(id *)(a1 + 72) enrichedMemoryWithTriggeredMemory:v7 withConfiguration:*(void *)(a1 + 80) progressReporter:v25];
  [*(id *)(a1 + 40) addIndex:a3];
  if (v26)
  {
    int v27 = [v26 featuresGuestAssets];
    if (!v27
      || (double v28 = *(double *)(*(void *)(*(void *)(a1 + 136) + 8) + 24),
          unint64_t v29 = *(void *)(a1 + 152),
          *(void *)&v28 < v29))
    {
      os_signpost_id_t v30 = [v26 keyAssetUUID];
      if (v30)
      {
        if ([*(id *)(a1 + 88) containsObject:v30])
        {
          id v31 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v71 = (const char *)v26;
            _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_DEFAULT, "[PGMemoryElector] Discarding %@: key asset already used.", buf, 0xCu);
          }
LABEL_45:

          goto LABEL_46;
        }
        [*(id *)(a1 + 88) addObject:v30];
      }
      int v57 = v27;
      v59 = v30;
      double v33 = *(id *)(a1 + 56);
      os_signpost_id_t v34 = os_signpost_id_generate(v33);
      uint64_t v35 = v33;
      v36 = v35;
      unint64_t v37 = v34 - 1;
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "MemoryElectionUserFeedback", "", buf, 2u);
      }
      os_signpost_id_t spid = v34;

      mach_timebase_info info = 0;
      mach_timebase_info(&info);
      uint64_t v56 = mach_absolute_time();
      char v38 = (void *)MEMORY[0x1E4F391F0];
      id v39 = [v26 curatedAssetUUIDs];
      id v40 = [v38 fetchVerifiedPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:v39 options:*(void *)(a1 + 96)];

      v41 = *(void **)(*(void *)(a1 + 104) + 40);
      uint64_t v42 = [v40 allKeys];
      uint64_t v43 = [v26 keyAssetUUID];
      [v41 scoreForAssetUUIDs:v42 keyAssetUUID:v43 personsUUIDsByAssetUUIDs:v40 memoryFeatures:0];
      double v45 = v44;

      uint64_t v46 = mach_absolute_time();
      mach_timebase_info v47 = info;
      uint64_t v48 = v36;
      v49 = v48;
      if (v37 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v49, OS_SIGNPOST_INTERVAL_END, spid, "MemoryElectionUserFeedback", "", buf, 2u);
      }

      os_signpost_id_t v30 = v59;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v71 = "MemoryElectionUserFeedback";
        __int16 v72 = 2048;
        double v73 = (float)((float)((float)((float)(v46 - v56) * (float)v47.numer) / (float)v47.denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v49, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if ((objc_msgSend(MEMORY[0x1E4F39338], "score:meetsScoreThreshold:", v45, *MEMORY[0x1E4F39860], spid) & 1) == 0)
      {
        [*(id *)(a1 + 32) addObject:v26];
        if (v57)
        {
          uint64_t v50 = (const char *)++*(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24);
          if (v50 == *(const char **)(a1 + 152))
          {
            v51 = *(NSObject **)(a1 + 56);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              id v71 = v50;
              _os_log_impl(&dword_1D1805000, v51, OS_LOG_TYPE_DEFAULT, "[PGMemoryElector] Reached maximumNumberOfMemoriesWithGuestAssets %lu: mutating configuration to disallow guest asset.", buf, 0xCu);
            }
            [*(id *)(a1 + 80) setAllowGuestAsset:0];
          }
        }
        *(double *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = *(double *)(a1 + 160)
                                                                     + *(double *)(*(void *)(*(void *)(a1 + 128)
                                                                                             + 8)
                                                                                 + 24);
        if ([*(id *)(a1 + 32) count] == *(void *)(a1 + 168)) {
          *id v58 = 1;
        }
      }

      goto LABEL_45;
    }
    id v32 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v71 = (const char *)v26;
      __int16 v72 = 2048;
      double v73 = v28;
      __int16 v74 = 2048;
      unint64_t v75 = v29;
      _os_log_error_impl(&dword_1D1805000, v32, OS_LOG_TYPE_ERROR, "[PGMemoryElector] Discarding %@: maximumNumberOfMemoriesWithGuestAssets %lu is at the limit %lu.", buf, 0x20u);
    }
  }
LABEL_46:

LABEL_47:
  uint64_t v8 = v60;
LABEL_48:
}

uint64_t __157__PGMemoryElector_electAndEnrichSortedTriggeredMemories_alreadyEnrichedMemories_targetNumberOfMemories_configuration_graph_planner_context_progressReporter___block_invoke_258(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v4 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

- (unint64_t)targetNumberOfMemoriesFromConfigurator:(id)a3 graph:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = +[PGGraphNodeCollection filter];
  uint64_t v11 = [v8 numberOfNodesMatchingFilter:v10];

  unint64_t v12 = objc_msgSend(v9, "targetNumberOfMemoriesWithMemoryContext:totalNumberOfMemoryNodes:referenceNumberOfDays:", v7, v11, objc_msgSend(v9, "numberOfDaysToLookInPast"));
  return v12;
}

- (BOOL)_shouldCheckForSuggestionCollisionsForTriggeredMemory:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 memoryCategory];
  if (v5 > 0x13 || ((1 << v5) & 0x90002) == 0)
  {
    id v8 = [v4 memoryMomentNodes];
    uint64_t v9 = [v8 count];

    if (v9 == 1)
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)unint64_t v12 = 0;
        _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "[PGMemoryElector] Triggered memory has only one moment but isn't of type single moment or meaningful event. Please update -[PGMemoryElector _shouldCheckForSuggestionCollisionsForTriggeredMemory:]", v12, 2u);
      }
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (double)_contentScoreWeightForNewMemoryFocusWithCategory:(unint64_t)a3
{
  double result = 1.0;
  if (a3 - 25 >= 6 && a3 != 10) {
    return 0.5;
  }
  return result;
}

- (BOOL)_memoryContainsNegativeFeedbackPets:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 memoryFeatureNodes];
  id v6 = +[PGGraphNodeCollection subsetInCollection:v5];

  if ([v6 count] != 1) {
    goto LABEL_8;
  }
  BOOL v7 = (void *)MEMORY[0x1E4F391D0];
  id v8 = [v6 localIdentifiers];
  uint64_t v9 = [v8 anyObject];
  uint64_t v10 = [v7 uuidFromLocalIdentifier:v9];

  if (![v10 length]
    || ([(PHUserFeedbackCalculator *)self->_userFeedbackCalculator userFeedbackTypeForPersonUUID:v10] & 0xFFFFFFFFFFFFFFFELL) != 2)
  {

LABEL_8:
    BOOL v15 = 0;
    goto LABEL_9;
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = (void *)MEMORY[0x1E4F39160];
    double v13 = loggingConnection;
    v14 = objc_msgSend(v12, "stringForCategory:", objc_msgSend(v4, "memoryCategory"));
    int v17 = 138412546;
    v18 = v14;
    __int16 v19 = 2112;
    unint64_t v20 = v10;
    _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_DEFAULT, "[PGMemoryElector] Not considering to elect memory of category %@ featuring pets with uuid %@", (uint8_t *)&v17, 0x16u);
  }
  BOOL v15 = 1;
LABEL_9:

  return v15;
}

- (id)filterAndSortTriggeredMemories:(id)a3 withPlanner:(id)a4 context:(id)a5 configuration:(id)a6 progressReporter:(id)a7
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v106 = a4;
  id v103 = a5;
  id v105 = a6;
  v101 = v12;
  id v102 = a7;
  if (![v12 count])
  {
    id v88 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_90;
  }
  uint64_t v107 = self;
  double v13 = self->_loggingConnection;
  os_signpost_id_t v14 = os_signpost_id_generate((os_log_t)v13);
  BOOL v15 = v13;
  double v16 = v15;
  os_signpost_id_t spid = v14;
  unint64_t v94 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "MemoryElectionFilterAndSortFilter", "", buf, 2u);
  }
  uint64_t v95 = v16;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v90 = mach_absolute_time();
  long long v100 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  long long v99 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  long long v98 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  long long v97 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  unint64_t v92 = [v103 numberOfDaysSinceMemoryUpgrade];
  unint64_t v91 = [v105 numberOfDaysToFocusOnNewMemoryTypes];
  char v96 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v18 = [(PGRemoteConfiguration *)self->_remoteConfiguration arrayValueForKey:@"com.apple.photos.memories.election.blockedMemoryCategorySubcategories" withFallbackValue:MEMORY[0x1E4F1CBF0]];
  v108 = (void *)[v17 initWithArray:v18];

  id v110 = v102;
  *(void *)buf = 0;
  v140 = buf;
  uint64_t v141 = 0x2020000000;
  char v142 = 0;
  uint64_t v135 = 0;
  v136 = (double *)&v135;
  uint64_t v137 = 0x2020000000;
  uint64_t v138 = 0;
  unint64_t v19 = [v12 count];
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  unint64_t v20 = v12;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v131 objects:v147 count:16];
  if (!v21) {
    goto LABEL_65;
  }
  double v22 = 0.5 / (double)v19;
  uint64_t v112 = *(void *)v132;
  obuint64_t j = v20;
  while (2)
  {
    uint64_t v113 = v21;
    for (uint64_t i = 0; i != v113; ++i)
    {
      if (*(void *)v132 != v112) {
        objc_enumerationMutation(obj);
      }
      uint64_t v24 = *(void **)(*((void *)&v131 + 1) + 8 * i);
      context = (void *)MEMORY[0x1D25FED50]();
      v136[3] = v22 + v136[3];
      if (v140[24])
      {
        v140[24] = 1;
LABEL_13:
        int v26 = 1;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v145 = 67109378;
          *(_DWORD *)v146 = 212;
          *(_WORD *)&v146[4] = 2080;
          *(void *)&v146[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Memories/PGMemoryElector.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v145, 0x12u);
        }
        goto LABEL_61;
      }
      uint8_t v25 = objc_msgSend(v110, "isCancelledWithProgress:");
      v140[24] = v25;
      if (v25) {
        goto LABEL_13;
      }
      if ([v108 count])
      {
        int v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "memoryCategorySubcategory"));
        int v28 = [v108 containsObject:v27];

        if (v28)
        {
          unint64_t v29 = v107->_loggingConnection;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            os_signpost_id_t v30 = [v24 uniqueMemoryIdentifier];
            uint64_t v31 = [v24 memoryCategorySubcategory];
            *(_DWORD *)v145 = 138478083;
            *(void *)v146 = v30;
            *(_WORD *)&v146[8] = 2048;
            *(void *)&v146[10] = v31;
            _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "[PGMemoryElector] Not considering to elect memory %{private}@ of type %lu because it is blocked", v145, 0x16u);
          }
          goto LABEL_23;
        }
      }
      if (![v106 tooSoonToElectMemory:v24])
      {
        v104 = [v105 collidableSuggestions];
        if ([v104 count])
        {
          BOOL v33 = [(PGMemoryElector *)v107 _shouldCheckForSuggestionCollisionsForTriggeredMemory:v24];

          if (!v33) {
            goto LABEL_39;
          }
          os_signpost_id_t v34 = [v24 memoryMomentNodes];
          v104 = [v34 universalDateInterval];

          uint64_t v35 = [v104 startDate];
          uint64_t v109 = [v104 endDate];
          long long v129 = 0u;
          long long v130 = 0u;
          long long v128 = 0u;
          long long v127 = 0u;
          v36 = [v105 collidableSuggestions];
          uint64_t v37 = [v36 countByEnumeratingWithState:&v127 objects:v144 count:16];
          if (v37)
          {
            uint64_t v38 = *(void *)v128;
            while (2)
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v128 != v38) {
                  objc_enumerationMutation(v36);
                }
                id v40 = *(void **)(*((void *)&v127 + 1) + 8 * j);
                v41 = [v40 universalEndDate];
                if ([v35 compare:v41] == 1)
                {
                }
                else
                {
                  uint64_t v42 = [v40 universalStartDate];
                  BOOL v43 = [v109 compare:v42] == -1;

                  if (!v43)
                  {

                    loggingConnection = v107->_loggingConnection;
                    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v145 = 138412546;
                      *(void *)v146 = v35;
                      *(_WORD *)&v146[8] = 2112;
                      *(void *)&v146[10] = v109;
                      _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[PGMemoryElector] Not considering to elect memory with moment nodes start date %@ and end date %@ because it collides with a suggestion", v145, 0x16u);
                    }

                    goto LABEL_24;
                  }
                }
              }
              uint64_t v37 = [v36 countByEnumeratingWithState:&v127 objects:v144 count:16];
              if (v37) {
                continue;
              }
              break;
            }
          }
        }
LABEL_39:
        uint64_t v44 = [v24 memoryCategory];
        double v45 = [v24 memoryFeatureNodes];
        uint64_t v46 = +[PGGraphNodeCollection subsetInCollection:v45];

        if ([v46 count] == 1)
        {
          mach_timebase_info v47 = [v46 uuids];
          uint64_t v48 = [v47 anyObject];

          if ([v48 length]
            && ([(PHUserFeedbackCalculator *)v107->_userFeedbackCalculator userFeedbackTypeForPersonUUID:v48] & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            v49 = v107->_loggingConnection;
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v50 = [MEMORY[0x1E4F39160] stringForCategory:v44];
              *(_DWORD *)v145 = 138412546;
              *(void *)v146 = v50;
              *(_WORD *)&v146[8] = 2112;
              *(void *)&v146[10] = v48;
              _os_log_impl(&dword_1D1805000, v49, OS_LOG_TYPE_DEFAULT, "[PGMemoryElector] Not considering to elect memory of category %@ featuring persons with uuid %@", v145, 0x16u);
            }
            int v26 = 3;
            goto LABEL_59;
          }
        }
        if ([(PGMemoryElector *)v107 _memoryContainsNegativeFeedbackPets:v24])
        {
          int v26 = 3;
LABEL_60:

          goto LABEL_61;
        }
        v51 = [v24 memoryFeatureNodes];
        uint64_t v52 = [v24 memoryMomentNodes];
        uint64_t v48 = +[PGMemoryFeatureBlocking blockableFeaturesForFeatureNodes:v51 momentNodes:v52 memoryCategory:v44];

        [v24 setBlockableFeatures:v48];
        v49 = [(PHUserFeedbackCalculator *)v107->_userFeedbackCalculator memoryFeaturesWithNegativeFeedbackForMemoryFeatures:v48];
        if ([v49 count])
        {
          v53 = v107->_loggingConnection;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            double v54 = [MEMORY[0x1E4F39160] stringForCategory:v44];
            *(_DWORD *)v145 = 138412546;
            *(void *)v146 = v54;
            *(_WORD *)&v146[8] = 2112;
            *(void *)&v146[10] = v49;
            _os_log_impl(&dword_1D1805000, v53, OS_LOG_TYPE_DEFAULT, "[PGMemoryElector] Not considering to elect memory of category %@ because it contains blocked features %@", v145, 0x16u);
          }
          int v26 = 3;
        }
        else
        {
          +[PGMemoryTriggerHandler triggerScoreForTriggeredMemory:v24];
          double v57 = v56;
          id v58 = objc_msgSend(NSNumber, "numberWithDouble:");
          [v100 setObject:v58 forKey:v24];

          [v106 collisionScoreForMemory:v24];
          double v60 = v59;
          id v61 = objc_msgSend(NSNumber, "numberWithDouble:");
          [v99 setObject:v61 forKey:v24];

          [v106 avoidScoreForMemory:v24];
          id v62 = objc_msgSend(NSNumber, "numberWithDouble:");
          [v98 setObject:v62 forKey:v24];

          id v63 = [v24 memoryMomentNodes];
          [v63 averageContentScore];
          double v65 = v64;

          if (v92 <= v91)
          {
            [(PGMemoryElector *)v107 _contentScoreWeightForNewMemoryFocusWithCategory:v44];
            double v65 = v65 * v66;
          }
          long long v67 = [NSNumber numberWithDouble:v65];
          [v97 setObject:v67 forKey:v24];

          [v24 setElectionScore:v57 + v60 * 0.01 + v65 * 0.001];
          long long v68 = [v24 validityIntervalByTriggerType];
          unint64_t v69 = +[PGMemoryTriggerHandler maximumValidityPeriodForValidityIntervalByTriggerType:v68 context:v103];

          v53 = [NSNumber numberWithUnsignedInteger:v69];
          [v96 setObject:v53 forKey:v24];
          int v26 = 0;
        }

LABEL_59:
        goto LABEL_60;
      }
      unint64_t v29 = v107->_loggingConnection;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        id v32 = [v24 uniqueMemoryIdentifier];
        *(_DWORD *)v145 = 138477827;
        *(void *)v146 = v32;
        _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "[PGMemoryElector] Not considering to elect memory %{private}@ because it is too soon since we last elected it", v145, 0xCu);
      }
LABEL_23:

LABEL_24:
      int v26 = 3;
LABEL_61:
      if (v26 != 3 && v26)
      {
        id v88 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_88;
      }
    }
    unint64_t v20 = obj;
    uint64_t v21 = [obj countByEnumeratingWithState:&v131 objects:v147 count:16];
    if (v21) {
      continue;
    }
    break;
  }
LABEL_65:

  uint64_t v70 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  double v73 = v95;
  __int16 v74 = v73;
  if (v94 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
  {
    *(_WORD *)v145 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v74, OS_SIGNPOST_INTERVAL_END, spid, "MemoryElectionFilterAndSortFilter", "", v145, 2u);
  }

  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v145 = 136315394;
    *(void *)v146 = "MemoryElectionFilterAndSortFilter";
    *(_WORD *)&v146[8] = 2048;
    *(double *)&v146[10] = (float)((float)((float)((float)(v70 - v90) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v74, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v145, 0x16u);
  }
  if ([v100 count])
  {
    unint64_t v75 = [v100 count];
    id v76 = v107->_loggingConnection;
    os_signpost_id_t v77 = os_signpost_id_generate(v76);
    id v78 = v76;
    v79 = v78;
    if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
    {
      *(_WORD *)v145 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v79, OS_SIGNPOST_INTERVAL_BEGIN, v77, "MemoryElectionFilterAndSortSort", "", v145, 2u);
    }

    mach_timebase_info v126 = 0;
    mach_timebase_info(&v126);
    uint64_t v80 = mach_absolute_time();
    v81 = [v100 keyEnumerator];
    v82 = [v81 allObjects];

    v115[0] = MEMORY[0x1E4F143A8];
    v115[1] = 3221225472;
    v115[2] = __101__PGMemoryElector_filterAndSortTriggeredMemories_withPlanner_context_configuration_progressReporter___block_invoke;
    v115[3] = &unk_1E68EF290;
    double v125 = 0.5 / (double)v75;
    v123 = &v135;
    v124 = buf;
    id v116 = v110;
    id v117 = v98;
    id v118 = v99;
    id v119 = v100;
    id v120 = v96;
    v121 = v107;
    id v122 = v97;
    v83 = [v82 sortedArrayUsingComparator:v115];
    uint64_t v84 = mach_absolute_time();
    mach_timebase_info v85 = v126;
    double v86 = v79;
    unint64_t v87 = v86;
    if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
    {
      *(_WORD *)v145 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v87, OS_SIGNPOST_INTERVAL_END, v77, "MemoryElectionFilterAndSortSort", "", v145, 2u);
    }
    obuint64_t j = v87;

    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v145 = 136315394;
      *(void *)v146 = "MemoryElectionFilterAndSortSort";
      *(_WORD *)&v146[8] = 2048;
      *(double *)&v146[10] = (float)((float)((float)((float)(v84 - v80) * (float)v85.numer) / (float)v85.denom)
                                   / 1000000.0);
      _os_log_impl(&dword_1D1805000, v87, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v145, 0x16u);
    }
    if (v140[24])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v145 = 67109378;
        *(_DWORD *)v146 = 407;
        *(_WORD *)&v146[4] = 2080;
        *(void *)&v146[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGMemoryElector.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v145, 0x12u);
      }
      id v88 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v88 = v83;
    }

LABEL_88:
  }
  else
  {
    id v88 = (id)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v135, 8);
  _Block_object_dispose(buf, 8);

LABEL_90:
  return v88;
}

uint64_t __101__PGMemoryElector_filterAndSortTriggeredMemories_withPlanner_context_configuration_progressReporter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(double *)(a1 + 104)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                          + 24);
  uint64_t v7 = *(void *)(*(void *)(a1 + 96) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    char v8 = 1;
  }
  else
  {
    char v8 = [*(id *)(a1 + 32) isCancelledWithProgress:*(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 96) + 8);
  }
  *(unsigned char *)(v7 + 24) = v8;
  uint64_t v9 = [*(id *)(a1 + 40) objectForKey:v5];
  [v9 doubleValue];
  double v11 = v10;

  id v12 = [*(id *)(a1 + 40) objectForKey:v6];
  [v12 doubleValue];
  double v14 = v13;

  if (v11 > 0.9 && v14 <= 0.9) {
    goto LABEL_10;
  }
  if (v14 > 0.9 && v11 <= 0.9) {
    goto LABEL_15;
  }
  BOOL v15 = [*(id *)(a1 + 48) objectForKey:v5];
  [v15 doubleValue];
  double v17 = v16;

  v18 = [*(id *)(a1 + 48) objectForKey:v6];
  [v18 doubleValue];
  double v20 = v19;

  if (v17 >= 1.0 && v20 < v17) {
    goto LABEL_10;
  }
  if (v20 >= 1.0 && v17 < v20) {
    goto LABEL_15;
  }
  double v22 = [*(id *)(a1 + 56) objectForKey:v5];
  [v22 doubleValue];
  double v24 = v23;

  uint8_t v25 = [*(id *)(a1 + 56) objectForKey:v6];
  [v25 doubleValue];
  double v27 = v26;

  if (v24 == 1.0 && v27 < 1.0)
  {
LABEL_15:
    uint64_t v21 = -1;
    goto LABEL_16;
  }
  if (v27 == 1.0 && v24 < 1.0) {
    goto LABEL_10;
  }
  if (v24 != 0.0 && v27 != 0.0)
  {
    unint64_t v29 = [*(id *)(a1 + 64) objectForKey:v5];
    unint64_t v30 = [v29 unsignedIntegerValue];

    uint64_t v31 = [*(id *)(a1 + 64) objectForKey:v6];
    unint64_t v32 = [v31 unsignedIntegerValue];

    if (v30 > v32) {
      goto LABEL_10;
    }
    if (v32 > v30) {
      goto LABEL_15;
    }
  }
  if (v17 == 0.0 && v20 > 0.25) {
    goto LABEL_15;
  }
  if (v20 == 0.0 && v17 > 0.25) {
    goto LABEL_10;
  }
  if (v24 != 0.0 || v27 != 0.0)
  {
    if (v24 > v27) {
      goto LABEL_15;
    }
    if (v27 > v24) {
      goto LABEL_10;
    }
  }
  if ([v5 generatedWithFallbackRequirements]
    && ![v6 generatedWithFallbackRequirements])
  {
    goto LABEL_10;
  }
  if (([v5 generatedWithFallbackRequirements] & 1) == 0
    && ([v6 generatedWithFallbackRequirements] & 1) != 0)
  {
    goto LABEL_15;
  }
  if ([v5 memoryCategory] == 9 && objc_msgSend(v6, "memoryCategory") != 9)
  {
LABEL_10:
    uint64_t v21 = 1;
    goto LABEL_16;
  }
  if ([v5 memoryCategory] != 9 && objc_msgSend(v6, "memoryCategory") == 9) {
    goto LABEL_15;
  }
  uint64_t v33 = [(id)objc_opt_class() compareMemoryCategoryForMemory:v5 toOtherMemory:v6];
  uint64_t v34 = -1;
  if (v17 >= v20) {
    uint64_t v34 = 1;
  }
  if (v33) {
    uint64_t v21 = v33;
  }
  else {
    uint64_t v21 = v34;
  }
  if (!v33 && v17 >= v20 && v20 >= v17)
  {
    uint64_t v35 = [*(id *)(a1 + 80) objectForKey:v5];
    [v35 doubleValue];
    double v37 = v36;

    uint64_t v38 = [*(id *)(a1 + 80) objectForKey:v6];
    [v38 doubleValue];
    double v40 = v39;

    if (v37 <= v40)
    {
      if (v40 <= v37)
      {
        v41 = [v5 uniqueMemoryIdentifier];
        uint64_t v42 = [v6 uniqueMemoryIdentifier];
        uint64_t v21 = [v41 compare:v42];

        goto LABEL_16;
      }
      goto LABEL_10;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v21;
}

- (id)generateEnrichedMemoriesWithConfiguration:(id)a3 graph:(id)a4 plannerPastSource:(id)a5 plannerFutureSource:(id)a6 progressReporter:(id)a7
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  BOOL v15 = (PGMemoryTriggerHandler *)a6;
  id v16 = a7;
  if ([v12 requestedMemoryCategory]) {
    goto LABEL_5;
  }
  double v17 = [v12 requestedUniqueMemoryIdentifier];
  if ([v17 length])
  {

LABEL_5:
    id v19 = [(PGMemoryElector *)self _requestedEnrichedMemoriesWithConfiguration:v12 graph:v13];
    goto LABEL_6;
  }
  uint64_t v18 = [v12 requestedTriggerType];

  if (v18) {
    goto LABEL_5;
  }
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F71F10]) initWithProgressReporter:v16];
  __int16 v74 = [v21 childProgressReporterToCheckpoint:0.1];
  __int16 v72 = [v21 childProgressReporterToCheckpoint:0.3];
  id v71 = [v21 childProgressReporterToCheckpoint:0.4];
  uint64_t v70 = [v21 childProgressReporterToCheckpoint:0.6];
  long long v68 = [v21 childProgressReporterToCheckpoint:0.8];
  unint64_t v69 = [v21 childProgressReporterToCheckpoint:0.9];
  uint64_t v67 = [v21 childProgressReporterToCheckpoint:1.0];
  double v66 = [[PGMemoryMomentNodesWithBlockedFeatureCache alloc] initWithUserFeedbackCalculator:self->_userFeedbackCalculator loggingConnection:self->_loggingConnection];
  double v73 = [[PGMemoryTriggerHandler alloc] initWithWorkingContext:self->_workingContext momentNodesWithBlockedFeatureCache:v66];
  if (v14) {
    double v22 = (PGMemoryPlannerPhotoKitSource *)v14;
  }
  else {
    double v22 = [[PGMemoryPlannerPhotoKitSource alloc] initWithPhotoLibrary:self->_photoLibrary loggingConnection:self->_loggingConnection];
  }
  double v23 = v22;
  if (v15) {
    double v24 = v15;
  }
  else {
    double v24 = v73;
  }
  double v64 = v24;
  double v65 = v23;
  uint8_t v25 = [[PGMemoryPlanner alloc] initWithPastSource:v23 futureSource:v64 configuration:v12 graph:v13 loggingConnection:self->_loggingConnection progressReporter:v74];
  if (([v16 isCancelled] & 1) == 0)
  {
    id v61 = v21;
    double v27 = [[PGMemoryContext alloc] initWithMemoryPlanner:v25 photoLibrary:self->_photoLibrary];
    int v28 = [(PGMemoryTriggerHandler *)v73 allTriggeredMemoriesWithContext:v27 inGraph:v13 progressReporter:v72];
    id v62 = v27;
    id v63 = v25;
    if ([v16 isCancelled])
    {
      id v19 = (id)MEMORY[0x1E4F1CBF0];
      double v26 = (void *)v67;
      unint64_t v29 = v28;
      double v23 = v65;
    }
    else
    {
      unint64_t v29 = [(PGMemoryPlanner *)v25 filterMemories:v28 forTriggerCollisionsWithTriggerHandler:v73 graph:v13 progressReporter:v71];

      if (([v16 isCancelled] & 1) == 0)
      {
        id v58 = v14;
        unint64_t v30 = [(PGMemoryTriggerHandler *)v73 holidayService];
        uint64_t v31 = v27;
        +[PGMemoryTriggerHandler fallbackTriggeredMemoriesWithContext:v27 excludingTriggeredMemories:v29 inGraph:v13 holidayService:v30];
        v33 = unint64_t v32 = v29;

        uint64_t v34 = [v32 arrayByAddingObjectsFromArray:v33];

        double v57 = (void *)v34;
        uint64_t v35 = [(PGMemoryElector *)self filterAndSortTriggeredMemories:v34 withPlanner:v63 context:v31 configuration:v12 progressReporter:v70];
        double v60 = v35;
        if ([v16 isCancelled])
        {
          id v19 = (id)MEMORY[0x1E4F1CBF0];
          id v14 = v58;
          uint64_t v21 = v61;
          double v26 = (void *)v67;
          double v23 = v65;
        }
        else
        {
          double v56 = v33;
          unint64_t v36 = [(PGMemoryElector *)self targetNumberOfMemoriesFromConfigurator:v12 graph:v13 context:v31];
          id v75 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          double v37 = [v35 firstObject];
          uint64_t v38 = [v37 memoryCategory];

          if (v38 == 8)
          {
            unint64_t v53 = v36;
            id v54 = v16;
            uint64_t v55 = v15;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            id v39 = v35;
            uint64_t v40 = [v39 countByEnumeratingWithState:&v76 objects:v80 count:16];
            if (v40)
            {
              uint64_t v41 = v40;
              uint64_t v42 = *(void *)v77;
              do
              {
                for (uint64_t i = 0; i != v41; ++i)
                {
                  if (*(void *)v77 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  uint64_t v44 = *(void **)(*((void *)&v76 + 1) + 8 * i);
                  double v45 = [v44 triggerTypes];
                  int v46 = [v45 containsIndex:5];

                  if (v46) {
                    [v75 addObject:v44];
                  }
                }
                uint64_t v41 = [v39 countByEnumeratingWithState:&v76 objects:v80 count:16];
              }
              while (v41);
            }

            id v14 = v58;
            if ([v75 count])
            {
              unint64_t v36 = v53;
              mach_timebase_info v47 = [(PGMemoryElector *)self electAndEnrichSortedTriggeredMemories:v75 alreadyEnrichedMemories:MEMORY[0x1E4F1CBF0] targetNumberOfMemories:v53 configuration:v12 graph:v13 planner:v63 context:v62 progressReporter:v68];
              id v16 = v54;
              BOOL v15 = v55;
            }
            else
            {
              mach_timebase_info v47 = (void *)MEMORY[0x1E4F1CBF0];
              id v16 = v54;
              BOOL v15 = v55;
              unint64_t v36 = v53;
            }
          }
          else
          {
            mach_timebase_info v47 = (void *)MEMORY[0x1E4F1CBF0];
            id v14 = v58;
          }
          uint64_t v48 = v47;
          if ([v47 count] >= v36)
          {
            double v59 = v48;
          }
          else
          {
            unint64_t v49 = v36;
            uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v60];
            [v50 removeObjectsInArray:v75];
            uint64_t v51 = [(PGMemoryElector *)self electAndEnrichSortedTriggeredMemories:v50 alreadyEnrichedMemories:v48 targetNumberOfMemories:v49 configuration:v12 graph:v13 planner:v63 context:v62 progressReporter:v69];

            double v59 = (void *)v51;
          }
          uint64_t v21 = v61;
          double v26 = (void *)v67;
          double v23 = v65;
          if (([v16 isCancelled] & 1) != 0
            || [v12 shouldPersist]
            && (-[PGMemoryElector persistEnrichedMemories:pendingState:graph:progressReporter:](self, "persistEnrichedMemories:pendingState:graph:progressReporter:", v59, [v12 pendingState], v13, v67), (objc_msgSend(v16, "isCancelled") & 1) != 0))
          {
            id v19 = (id)MEMORY[0x1E4F1CBF0];
            uint64_t v52 = v59;
          }
          else
          {
            uint64_t v52 = v59;
            id v19 = v59;
          }

          uint64_t v33 = v56;
        }

        unint64_t v29 = v57;
        goto LABEL_48;
      }
      id v19 = (id)MEMORY[0x1E4F1CBF0];
      double v26 = (void *)v67;
      double v23 = v65;
    }
    uint64_t v21 = v61;
LABEL_48:

    uint8_t v25 = v63;
    goto LABEL_49;
  }
  id v19 = (id)MEMORY[0x1E4F1CBF0];
  double v26 = (void *)v67;
LABEL_49:

LABEL_6:
  return v19;
}

- (id)generateEnrichedMemoriesWithConfiguration:(id)a3 graph:(id)a4 progressReporter:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = self->_loggingConnection;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  os_signpost_id_t v13 = os_signpost_id_generate((os_log_t)v9);
  id v14 = v9;
  BOOL v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "MemoryElection", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v16 = mach_absolute_time();
  double v17 = [(PGMemoryElector *)self generateEnrichedMemoriesWithConfiguration:v12 graph:v11 plannerPastSource:0 plannerFutureSource:0 progressReporter:v10];

  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = loggingConnection;
    int v20 = [v17 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = v20;
    _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_DEFAULT, "[PGMemoryElector] Generated %d memories", buf, 8u);
  }
  uint64_t v21 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  double v24 = v15;
  uint8_t v25 = v24;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v25, OS_SIGNPOST_INTERVAL_END, v13, "MemoryElection", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v29 = "MemoryElection";
    __int16 v30 = 2048;
    double v31 = (float)((float)((float)((float)(v21 - v16) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v17;
}

- (PGMemoryElector)initWithWorkingContext:(id)a3 userFeedbackCalculator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PGMemoryElector;
  uint64_t v9 = [(PGMemoryElector *)&v23 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workingContext, a3);
    uint64_t v11 = [v7 photoLibrary];
    photoLibrary = v10->_photoLibrary;
    v10->_photoLibrary = (PHPhotoLibrary *)v11;

    uint64_t v13 = [v7 loggingConnection];
    loggingConnection = v10->_loggingConnection;
    v10->_loggingConnection = (OS_os_log *)v13;

    uint64_t v15 = [v7 curationManager];
    curationManager = v10->_curationManager;
    v10->_curationManager = (PGCurationManager *)v15;

    objc_storeStrong((id *)&v10->_userFeedbackCalculator, a4);
    id v17 = objc_alloc_init(MEMORY[0x1E4F8E778]);
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F8E768]) initWithUserFeedbackCalculator:v10->_userFeedbackCalculator curationSession:v17];
    curationContext = v10->_curationContext;
    v10->_curationContext = (CLSCurationContext *)v18;

    int v20 = [[PGRemoteConfiguration alloc] initWithTrialNamespace:1 onDiskResourceFile:0];
    remoteConfiguration = v10->_remoteConfiguration;
    v10->_remoteConfiguration = v20;
  }
  return v10;
}

+ (int64_t)compareMemoryCategoryForMemory:(id)a3 toOtherMemory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 triggerTypes];
  if ([v7 containsIndex:5])
  {
    id v8 = [v6 triggerTypes];
    int v9 = [v8 containsIndex:5];

    if (v9)
    {
      if ([v5 memoryCategory] == 8 && objc_msgSend(v6, "memoryCategory") != 8) {
        goto LABEL_27;
      }
      if ([v5 memoryCategory] != 8 && objc_msgSend(v6, "memoryCategory") == 8) {
        goto LABEL_21;
      }
    }
  }
  else
  {
  }
  id v10 = [v5 triggerTypes];
  if ([v10 containsIndex:4])
  {
    uint64_t v11 = [v6 triggerTypes];
    int v12 = [v11 containsIndex:4];

    if (v12)
    {
      if ([v5 memoryCategory] == 23 && objc_msgSend(v6, "memoryCategory") == 1) {
        goto LABEL_27;
      }
      if ([v5 memoryCategory] == 1 && objc_msgSend(v6, "memoryCategory") == 23) {
        goto LABEL_21;
      }
    }
  }
  else
  {
  }
  uint64_t v13 = [v5 triggerTypes];
  if (([v13 containsIndex:1] & 1) == 0)
  {

    goto LABEL_23;
  }
  id v14 = [v6 triggerTypes];
  int v15 = [v14 containsIndex:1];

  if (!v15)
  {
LABEL_23:
    int64_t v16 = 0;
    goto LABEL_24;
  }
  if ([v5 memoryCategory] != 16 || objc_msgSend(v6, "memoryCategory") != 17)
  {
    if ([v5 memoryCategory] == 17 && objc_msgSend(v6, "memoryCategory") == 16)
    {
LABEL_27:
      int64_t v16 = -1;
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_21:
  int64_t v16 = 1;
LABEL_24:

  return v16;
}

@end