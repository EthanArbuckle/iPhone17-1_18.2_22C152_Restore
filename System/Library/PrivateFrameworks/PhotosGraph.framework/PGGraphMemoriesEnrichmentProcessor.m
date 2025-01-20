@interface PGGraphMemoriesEnrichmentProcessor
+ (id)categoriesOfMemoriesToPrioritize;
+ (id)enrichableMemoryNodesInGraph:(id)a3;
- (BOOL)runWithGraphManager:(id)a3 incrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (PGGraphMemoriesEnrichmentProcessor)init;
- (PGGraphMemoriesEnrichmentProcessor)initWithNumberOfMemoriesToEnrich:(unint64_t)a3;
- (id)_memoryNodesSortedForEnrichment:(id)a3 localMemoryByUniqueIdentifier:(id)a4 graph:(id)a5;
- (id)enrichMemoryNodes:(id)a3 localMemoryByUniqueIdentifier:(id)a4 workingContext:(id)a5 graph:(id)a6 progressReporter:(id)a7;
- (id)enrichedMemoryFromMemoryNode:(id)a3 atCreationDate:(id)a4 configuration:(id)a5 curationContext:(id)a6 enrichedMemoryFactory:(id)a7 graph:(id)a8 progressReporter:(id)a9;
- (id)runWithGraphManager:(id)a3 forMemoryCategory:(unint64_t)a4 progressReporter:(id)a5 error:(id *)a6;
- (id)runWithGraphManager:(id)a3 forMemoryUUIDs:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (id)sortedMemoryNodesToEnrichForIncrementalForMemoryNodes:(id)a3 localMemoryByUniqueIdentifier:(id)a4 graph:(id)a5;
- (id)sortedMemoryNodesToEnrichForMemoryNodes:(id)a3 localMemoryByUniqueIdentifier:(id)a4 graph:(id)a5;
- (id)uniqueMemoryIdentifiersToPrioritizeWithGraph:(id)a3;
- (unint64_t)_targetNumberOfMemoriesToEnrichWithPhotoLibrary:(id)a3;
- (void)deleteNoLongerExistingMemoryNodes:(id)a3 fromLocalMemoryByUniqueIdentifier:(id)a4 inPhotoLibrary:(id)a5 progressReporter:(id)a6;
- (void)insertOrUpdateLocalMemoriesForEnrichedMemories:(id)a3 localMemoryByUniqueIdentifier:(id)a4 memoryPersister:(id)a5 progressReporter:(id)a6;
@end

@implementation PGGraphMemoriesEnrichmentProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_uniqueMemoryIdentifiersToPrioritize, 0);
}

- (void)insertOrUpdateLocalMemoriesForEnrichedMemories:(id)a3 localMemoryByUniqueIdentifier:(id)a4 memoryPersister:(id)a5 progressReporter:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v39 = a5;
  id v38 = a6;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v19 = [v18 uniqueMemoryIdentifier];
        v20 = [v10 objectForKeyedSubscript:v19];

        v21 = v11;
        if (v20)
        {
          [v20 photosGraphVersion];
          if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() < 0x400
            || (int v22 = [v20 isRejected], v21 = v12, v22)
            && (char v23 = [v18 failedEnrichment], v21 = v12, (v23 & 1) == 0))
          {
            [v40 addObject:v20];
            v21 = v11;
          }
        }
        [v21 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v15);
  }

  v24 = (void *)[objc_alloc(MEMORY[0x1E4F71F10]) initWithProgressReporter:v38];
  v25 = [v24 childProgressReporterToCheckpoint:0.5];
  v26 = [v24 childProgressReporterToCheckpoint:1.0];
  uint64_t v27 = [v11 count];
  if (v27)
  {
    int v28 = v27;
    id v41 = 0;
    v36 = v25;
    int v29 = [v39 persistLocalMemoriesFromEnrichedMemories:v11 localMemoriesToDelete:v40 progressReporter:v25 error:&v41];
    id v30 = v41;
    loggingConnection = self->_loggingConnection;
    if (v29)
    {
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v47 = v28;
        _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Successfully inserted %d memories.", buf, 8u);
      }
    }
    else if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      int v47 = v28;
      __int16 v48 = 2112;
      id v49 = v30;
      _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGGraphMemoriesEnrichmentProcessor] Failed to insert %d memories (%@)", buf, 0x12u);
    }

    v25 = v36;
  }
  uint64_t v32 = [v12 count];
  if (v32)
  {
    int v33 = v32;
    int v34 = [v39 updateExistingMemories:v12 localMemoryByUniqueIdentifier:v10 progressReporter:v26];
    v35 = self->_loggingConnection;
    if (v34)
    {
      if (os_log_type_enabled((os_log_t)self->_loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v47 = v33;
        _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Successfully updated %d memories.", buf, 8u);
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v47 = v33;
      _os_log_error_impl(&dword_1D1805000, v35, OS_LOG_TYPE_ERROR, "[PGGraphMemoriesEnrichmentProcessor] Failed to update %d memories.", buf, 8u);
    }
  }
}

- (void)deleteNoLongerExistingMemoryNodes:(id)a3 fromLocalMemoryByUniqueIdentifier:(id)a4 inPhotoLibrary:(id)a5 progressReporter:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  if ([v11 count])
  {
    *(void *)v46 = 0;
    *(void *)&long long v47 = v46;
    *((void *)&v47 + 1) = 0x2020000000;
    uint64_t v48 = 0;
    unint64_t v14 = [v11 count];
    uint64_t v15 = [v10 uniqueMemoryIdentifiers];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __138__PGGraphMemoriesEnrichmentProcessor_deleteNoLongerExistingMemoryNodes_fromLocalMemoryByUniqueIdentifier_inPhotoLibrary_progressReporter___block_invoke;
    v31[3] = &unk_1E68EA558;
    id v17 = v15;
    id v32 = v17;
    id v18 = v16;
    id v33 = v18;
    v35 = v46;
    double v37 = 0.5 / (double)v14;
    v36 = &v38;
    id v19 = v13;
    id v34 = v19;
    [v11 enumerateKeysAndObjectsUsingBlock:v31];
    if (*((unsigned char *)v39 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v43 = 520;
        __int16 v44 = 2080;
        long long v45 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Da"
              "ta Model Enrichment/PGGraphMemoriesEnrichmentProcessor.m";
        v20 = MEMORY[0x1E4F14500];
LABEL_22:
        _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      uint64_t v21 = [v18 count];
      int v22 = v21;
      if (v21)
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __138__PGGraphMemoriesEnrichmentProcessor_deleteNoLongerExistingMemoryNodes_fromLocalMemoryByUniqueIdentifier_inPhotoLibrary_progressReporter___block_invoke_307;
        v29[3] = &unk_1E68F0B18;
        id v30 = v18;
        id v28 = 0;
        int v23 = [v12 performChangesAndWait:v29 error:&v28];
        uint64_t v27 = (char *)v28;
        loggingConnection = self->_loggingConnection;
        if (v23)
        {
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v43 = v22;
            _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Successfully deleted %d local memories.", buf, 8u);
          }
        }
        else if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          int v43 = v22;
          __int16 v44 = 2112;
          long long v45 = v27;
          _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGGraphMemoriesEnrichmentProcessor] Failed to delete %d local memories: %@", buf, 0x12u);
        }
      }
      if (*((unsigned char *)v39 + 24))
      {
        *((unsigned char *)v39 + 24) = 1;
      }
      else
      {
        char v26 = [v19 isCancelledWithProgress:1.0];
        *((unsigned char *)v39 + 24) = v26;
        if ((v26 & 1) == 0) {
          goto LABEL_23;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v43 = 535;
        __int16 v44 = 2080;
        long long v45 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Da"
              "ta Model Enrichment/PGGraphMemoriesEnrichmentProcessor.m";
        v20 = MEMORY[0x1E4F14500];
        goto LABEL_22;
      }
    }
LABEL_23:

    _Block_object_dispose(v46, 8);
    goto LABEL_24;
  }
  if (*((unsigned char *)v39 + 24))
  {
    *((unsigned char *)v39 + 24) = 1;
  }
  else
  {
    char v25 = [v13 isCancelledWithProgress:1.0];
    *((unsigned char *)v39 + 24) = v25;
    if ((v25 & 1) == 0) {
      goto LABEL_24;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v46 = 67109378;
    *(_DWORD *)&v46[4] = 504;
    LOWORD(v47) = 2080;
    *(void *)((char *)&v47 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Data Model Enrichment/PGGraphMemoriesEnrichmentProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v46, 0x12u);
  }
LABEL_24:
  _Block_object_dispose(&v38, 8);
}

void __138__PGGraphMemoriesEnrichmentProcessor_deleteNoLongerExistingMemoryNodes_fromLocalMemoryByUniqueIdentifier_inPhotoLibrary_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  if (([*(id *)(a1 + 32) containsObject:a2] & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v9];
  }
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(a1 + 72)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    char v8 = 1;
  }
  else
  {
    char v8 = [*(id *)(a1 + 48) isCancelledWithProgress:*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  }
  *(unsigned char *)(v7 + 24) = v8;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    *a4 = 1;
  }
}

uint64_t __138__PGGraphMemoriesEnrichmentProcessor_deleteNoLongerExistingMemoryNodes_fromLocalMemoryByUniqueIdentifier_inPhotoLibrary_progressReporter___block_invoke_307(uint64_t a1)
{
  return [MEMORY[0x1E4F39170] deleteMemories:*(void *)(a1 + 32)];
}

- (id)uniqueMemoryIdentifiersToPrioritizeWithGraph:(id)a3
{
  uniqueMemoryIdentifiersToPrioritize = self->_uniqueMemoryIdentifiersToPrioritize;
  if (!uniqueMemoryIdentifiersToPrioritize)
  {
    v5 = (void *)MEMORY[0x1E4F8E870];
    id v6 = a3;
    uint64_t v7 = [v5 eventElectionMode];
    char v8 = +[PGEventElector memoryUniqueIdentifiersToElectWithGraph:v6 electionMode:v7 error:0];

    id v9 = self->_uniqueMemoryIdentifiersToPrioritize;
    self->_uniqueMemoryIdentifiersToPrioritize = v8;

    uniqueMemoryIdentifiersToPrioritize = self->_uniqueMemoryIdentifiersToPrioritize;
  }
  return uniqueMemoryIdentifiersToPrioritize;
}

- (id)_memoryNodesSortedForEnrichment:(id)a3 localMemoryByUniqueIdentifier:(id)a4 graph:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() categoriesOfMemoriesToPrioritize];
  id v12 = [(PGGraphMemoriesEnrichmentProcessor *)self uniqueMemoryIdentifiersToPrioritizeWithGraph:v9];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106__PGGraphMemoriesEnrichmentProcessor__memoryNodesSortedForEnrichment_localMemoryByUniqueIdentifier_graph___block_invoke;
  v18[3] = &unk_1E68EA530;
  id v19 = v8;
  id v20 = v11;
  id v21 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v8;
  id v16 = [v10 sortedArrayUsingComparator:v18];

  return v16;
}

uint64_t __106__PGGraphMemoriesEnrichmentProcessor__memoryNodesSortedForEnrichment_localMemoryByUniqueIdentifier_graph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 uniqueMemoryIdentifier];
  id v8 = [v6 uniqueMemoryIdentifier];
  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  int v11 = objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v5, "memoryCategory"));
  int v12 = objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v6, "memoryCategory"));
  if (v11 && !v12) {
    goto LABEL_3;
  }
  if ((v12 ^ 1 | v11) != 1) {
    goto LABEL_12;
  }
  id v14 = *(void **)(a1 + 48);
  id v15 = [v5 uniqueMemoryIdentifier];
  int v16 = [v14 containsObject:v15];

  id v17 = *(void **)(a1 + 48);
  id v18 = [v6 uniqueMemoryIdentifier];
  int v19 = [v17 containsObject:v18];

  if (!v16 || v19)
  {
    if ((v19 ^ 1 | v16) != 1) {
      goto LABEL_12;
    }
    if (v9 || !v10)
    {
      if (v9 && !v10) {
        goto LABEL_12;
      }
      if (!v9 || !v10)
      {
LABEL_24:
        uint64_t v13 = [v7 compare:v8];
        goto LABEL_13;
      }
      uint64_t v21 = [v9 photosGraphVersion];
      uint64_t v22 = [v10 photosGraphVersion];
      if (v21 >= v22)
      {
        if (v22 >= v21)
        {
          uint64_t v23 = [v9 lastEnrichmentDate];
          uint64_t v24 = [v10 lastEnrichmentDate];
          if (v23 | v24)
          {
            if (!v23 || [(id)v23 compare:v24] == -1)
            {
              uint64_t v13 = -1;
            }
            else
            {
              if (v24 && [(id)v24 compare:v23] != -1) {
                goto LABEL_23;
              }
              uint64_t v13 = 1;
            }

            goto LABEL_13;
          }
LABEL_23:

          goto LABEL_24;
        }
LABEL_12:
        uint64_t v13 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_3:
  uint64_t v13 = -1;
LABEL_13:

  return v13;
}

- (id)sortedMemoryNodesToEnrichForMemoryNodes:(id)a3 localMemoryByUniqueIdentifier:(id)a4 graph:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v32 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__43066;
  uint64_t v51 = __Block_byref_object_dispose__43067;
  id v52 = 0;
  uint64_t v41 = 0;
  long long v42 = &v41;
  uint64_t v43 = 0x3032000000;
  __int16 v44 = __Block_byref_object_copy__43066;
  long long v45 = __Block_byref_object_dispose__43067;
  id v46 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __114__PGGraphMemoriesEnrichmentProcessor_sortedMemoryNodesToEnrichForMemoryNodes_localMemoryByUniqueIdentifier_graph___block_invoke;
  v35[3] = &unk_1E68EA4E0;
  id v13 = v9;
  id v36 = v13;
  id v14 = v11;
  id v37 = v14;
  id v39 = &v47;
  uint64_t v40 = &v41;
  id v15 = v12;
  id v38 = v15;
  v31 = v8;
  [v8 enumerateNodesUsingBlock:v35];
  uint64_t v16 = [v15 count];
  if (v16)
  {
    id v17 = [(PGGraphMemoriesEnrichmentProcessor *)self _memoryNodesSortedForEnrichment:v15 localMemoryByUniqueIdentifier:0 graph:v32];
    [v10 addObjectsFromArray:v17];
  }
  uint64_t v18 = [v14 count];
  if (v18)
  {
    int v19 = (void *)MEMORY[0x1E4F28F60];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __114__PGGraphMemoriesEnrichmentProcessor_sortedMemoryNodesToEnrichForMemoryNodes_localMemoryByUniqueIdentifier_graph___block_invoke_2;
    v33[3] = &unk_1E68EA508;
    id v20 = v13;
    id v34 = v20;
    uint64_t v21 = [v19 predicateWithBlock:v33];
    uint64_t v22 = [v14 filteredArrayUsingPredicate:v21];

    uint64_t v23 = [(PGGraphMemoriesEnrichmentProcessor *)self _memoryNodesSortedForEnrichment:v22 localMemoryByUniqueIdentifier:v20 graph:v32];
    [v10 addObjectsFromArray:v23];
  }
  uint64_t v24 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [v10 count];
    uint64_t v26 = v48[5];
    uint64_t v27 = v42[5];
    *(_DWORD *)buf = 134219010;
    uint64_t v54 = v25;
    __int16 v55 = 2048;
    uint64_t v56 = v16;
    __int16 v57 = 2048;
    uint64_t v58 = v18;
    __int16 v59 = 2112;
    uint64_t v60 = v26;
    __int16 v61 = 2112;
    uint64_t v62 = v27;
    _os_log_impl(&dword_1D1805000, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Found %lu Memory nodes to enrich out of %lu without local memories and %lu with local memories.\n\tEnrichment date range: %@ - %@", buf, 0x34u);
  }

  id v28 = v38;
  id v29 = v10;

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v29;
}

void __114__PGGraphMemoriesEnrichmentProcessor_sortedMemoryNodesToEnrichForMemoryNodes_localMemoryByUniqueIdentifier_graph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v17 = [v3 uniqueMemoryIdentifier];
  v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v3];

    id v3 = [v4 lastEnrichmentDate];
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    if (v6)
    {
      uint64_t v7 = [v6 earlierDate:v3];
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    else
    {
      id v10 = v3;
      id v9 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v10;
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id v12 = *(void **)(v11 + 40);
    if (v12)
    {
      uint64_t v13 = [v12 laterDate:v3];
      uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    else
    {
      id v16 = v3;
      id v15 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v16;
    }
  }
  else
  {
    [*(id *)(a1 + 48) addObject:v3];
  }
}

BOOL __114__PGGraphMemoriesEnrichmentProcessor_sortedMemoryNodesToEnrichForMemoryNodes_localMemoryByUniqueIdentifier_graph___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueMemoryIdentifier];
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  [v4 photosGraphVersion];
  if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() >= 0x400)
  {
    id v6 = [v4 lastEnrichmentDate];
    [v6 timeIntervalSinceNow];
    BOOL v5 = fabs(v7) > 1209600.0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)sortedMemoryNodesToEnrichForIncrementalForMemoryNodes:(id)a3 localMemoryByUniqueIdentifier:(id)a4 graph:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc_init(v9);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __128__PGGraphMemoriesEnrichmentProcessor_sortedMemoryNodesToEnrichForIncrementalForMemoryNodes_localMemoryByUniqueIdentifier_graph___block_invoke;
  id v32 = &unk_1E68EA4B8;
  id v16 = v8;
  id v33 = v16;
  id v17 = v13;
  id v34 = v17;
  id v18 = v15;
  id v35 = v18;
  id v19 = v14;
  id v36 = v19;
  [v11 enumerateNodesUsingBlock:&v29];

  id v20 = -[PGGraphMemoriesEnrichmentProcessor _memoryNodesSortedForEnrichment:localMemoryByUniqueIdentifier:graph:](self, "_memoryNodesSortedForEnrichment:localMemoryByUniqueIdentifier:graph:", v17, 0, v10, v29, v30, v31, v32);
  [v12 addObjectsFromArray:v20];

  uint64_t v21 = [(PGGraphMemoriesEnrichmentProcessor *)self _memoryNodesSortedForEnrichment:v18 localMemoryByUniqueIdentifier:v16 graph:v10];
  [v12 addObjectsFromArray:v21];

  uint64_t v22 = [(PGGraphMemoriesEnrichmentProcessor *)self _memoryNodesSortedForEnrichment:v19 localMemoryByUniqueIdentifier:v16 graph:v10];

  [v12 addObjectsFromArray:v22];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = loggingConnection;
    uint64_t v25 = [v12 count];
    uint64_t v26 = [v17 count];
    uint64_t v27 = [v19 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v38 = v25;
    __int16 v39 = 2048;
    uint64_t v40 = v26;
    __int16 v41 = 2048;
    uint64_t v42 = v27;
    _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Found %lu Memory nodes to enrich out of %lu without local memories and %lu with local memories whose lastEnrichmentDate is nil.", buf, 0x20u);
  }
  return v12;
}

void __128__PGGraphMemoriesEnrichmentProcessor_sortedMemoryNodesToEnrichForIncrementalForMemoryNodes_localMemoryByUniqueIdentifier_graph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v9 = v3;
  BOOL v5 = [v3 uniqueMemoryIdentifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    [v6 photosGraphVersion];
    if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() > 0x3FF)
    {
      id v8 = [v6 lastEnrichmentDate];

      if (v8) {
        goto LABEL_8;
      }
      double v7 = (id *)(a1 + 56);
    }
    else
    {
      double v7 = (id *)(a1 + 48);
    }
  }
  else
  {
    double v7 = (id *)(a1 + 40);
  }
  [*v7 addObject:v9];
LABEL_8:
}

- (unint64_t)_targetNumberOfMemoriesToEnrichWithPhotoLibrary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t numberOfMemoriesToEnrich = self->_numberOfMemoriesToEnrich;
  if (numberOfMemoriesToEnrich)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v16 = numberOfMemoriesToEnrich;
      _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Target overriden: Will try to enrich %tu memory nodes.", buf, 0xCu);
      unint64_t numberOfMemoriesToEnrich = self->_numberOfMemoriesToEnrich;
    }
  }
  else
  {
    double v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-21600.0];
    id v8 = [v4 librarySpecificFetchOptions];
    [v8 setIncludeLocalMemories:1];
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"lastEnrichmentDate > %@", v7];
    [v8 setInternalPredicate:v9];

    id v10 = [MEMORY[0x1E4F39160] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v8];
    unint64_t v11 = [v10 count];
    unint64_t v12 = v11;
    if (v11 >= 0x12C) {
      unint64_t numberOfMemoriesToEnrich = 300;
    }
    else {
      unint64_t numberOfMemoriesToEnrich = 300 - v11;
    }
    id v13 = self->_loggingConnection;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v16 = numberOfMemoriesToEnrich;
      __int16 v17 = 2048;
      unint64_t v18 = v12;
      _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Will try to enrich %tu memory nodes (%tu recently enriched).", buf, 0x16u);
    }
  }
  return numberOfMemoriesToEnrich;
}

- (id)enrichedMemoryFromMemoryNode:(id)a3 atCreationDate:(id)a4 configuration:(id)a5 curationContext:(id)a6 enrichedMemoryFactory:(id)a7 graph:(id)a8 progressReporter:(id)a9
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a9;
  id v18 = a6;
  id v19 = a4;
  id v20 = [PGTriggeredMemory alloc];
  uint64_t v21 = [(PGTriggeredMemory *)v20 initWithMemoryNode:v14 validityIntervalByTriggerType:MEMORY[0x1E4F1CC08] creationDate:v19];

  uint64_t v22 = [v14 memoryFeatureNodes];
  uint64_t v23 = [v14 memoryMomentNodes];
  uint64_t v24 = +[PGMemoryFeatureBlocking blockableFeaturesForFeatureNodes:momentNodes:memoryCategory:](PGMemoryFeatureBlocking, "blockableFeaturesForFeatureNodes:momentNodes:memoryCategory:", v22, v23, [v14 memoryCategory]);

  uint64_t v25 = [v18 userFeedbackCalculator];

  uint64_t v26 = [v25 memoryFeaturesWithNegativeFeedbackForMemoryFeatures:v24];

  if ([(__CFString *)v26 count])
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = (void *)MEMORY[0x1E4F39160];
      uint64_t v29 = loggingConnection;
      uint64_t v30 = objc_msgSend(v28, "stringForCategory:", objc_msgSend(v14, "memoryCategory"));
      int v39 = 138412546;
      uint64_t v40 = v30;
      __int16 v41 = 2112;
      uint64_t v42 = v26;
      _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Not enriching memory of category %@ because it contains blocked features %@", (uint8_t *)&v39, 0x16u);
    }
    v31 = 0;
  }
  else
  {
    [(PGTriggeredMemory *)v21 setBlockableFeatures:v24];
    v31 = [v16 debugEnrichedMemoryWithTriggeredMemory:v21 withConfiguration:v15 progressReporter:v17];
    if ([v31 failedEnrichment])
    {
      id v32 = self->_loggingConnection;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = v32;
        unint64_t v34 = [v31 failureReason];
        if (v34 > 8) {
          id v35 = @"PGEnrichedMemoryFailureReasonUnknown";
        }
        else {
          id v35 = off_1E68EAAF0[v34];
        }
        id v36 = v35;
        int v39 = 138412546;
        uint64_t v40 = v31;
        __int16 v41 = 2112;
        uint64_t v42 = v36;
        _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Failed to enrich memory %@ (%@): Persisting empty memory", (uint8_t *)&v39, 0x16u);
      }
      id v37 = [v31 uniqueMemoryIdentifier];
      [v31 setTitle:v37];
    }
  }

  return v31;
}

- (id)enrichMemoryNodes:(id)a3 localMemoryByUniqueIdentifier:(id)a4 workingContext:(id)a5 graph:(id)a6 progressReporter:(id)a7
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v58 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [v13 photoLibrary];
  unint64_t v17 = [v12 count];
  __int16 v61 = v15;
  v71 = self;
  v72 = (void *)[objc_alloc(MEMORY[0x1E4F71F10]) initWithProgressReporter:v15];
  unint64_t v64 = [(PGGraphMemoriesEnrichmentProcessor *)self _targetNumberOfMemoriesToEnrichWithPhotoLibrary:v16];
  uint64_t v18 = [objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v16];
  __int16 v59 = [[PGMemoryPhotoKitPersister alloc] initWithPhotoLibrary:v16];
  id v19 = objc_alloc_init(PGMemoryElectorConfiguration);
  id v20 = [[PGGraphLocationHelper alloc] initWithGraph:v14];
  uint64_t v21 = [PGMemoryCurationSession alloc];
  uint64_t v22 = [v13 curationManager];
  v70 = (void *)v18;
  uint64_t v56 = v20;
  uint64_t v23 = [(PGMemoryCurationSession *)v21 initWithCurationManager:v22 photoLibrary:v16 curationContext:v18 locationHelper:v20];

  uint64_t v24 = [PGEnrichedMemoryFactory alloc];
  uint64_t v25 = [v13 serviceManager];
  id v60 = v14;
  v68 = [(PGEnrichedMemoryFactory *)v24 initWithMemoryCurationSession:v23 graph:v14 serviceManager:v25];

  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v27 = [PGMemoryDate alloc];
  id v28 = [(PGMemoryElectorConfiguration *)v19 localDate];
  uint64_t v29 = [(PGMemoryDate *)v27 initWithLocalDate:v28];

  v69 = v19;
  uint64_t v30 = [(PGMemoryElectorConfiguration *)v19 timeZone];
  __int16 v57 = v29;
  v67 = [(PGMemoryDate *)v29 universalDateInTimeZone:v30];

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v12;
  uint64_t v66 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
  unint64_t v31 = 0;
  if (v66)
  {
    double v32 = 0.6 / (double)v17 * 0.5;
    uint64_t v65 = *(void *)v74;
    double v33 = 0.0;
    uint64_t v54 = v16;
    id v55 = v13;
    v53 = v23;
LABEL_3:
    id v34 = v26;
    uint64_t v35 = 0;
    id v36 = v60;
    id v37 = v61;
    while (1)
    {
      if (*(void *)v74 != v65) {
        objc_enumerationMutation(obj);
      }
      uint64_t v38 = *(void **)(*((void *)&v73 + 1) + 8 * v35);
      int v39 = (void *)MEMORY[0x1D25FED50]();
      double v33 = v32 + v33;
      uint64_t v40 = [v72 childProgressReporterToCheckpoint:v33];
      __int16 v41 = [(PGGraphMemoriesEnrichmentProcessor *)v71 enrichedMemoryFromMemoryNode:v38 atCreationDate:v67 configuration:v69 curationContext:v70 enrichedMemoryFactory:v68 graph:v36 progressReporter:v40];
      if ([v37 isCancelled]) {
        break;
      }
      if (v41)
      {
        v31 += [v41 failedEnrichment] ^ 1;
        [v34 addObject:v41];
        uint64_t v42 = [v38 uniqueMemoryIdentifier];
        if (v42)
        {
          [v62 addObject:v42];
          double v33 = v32 + v33;
          if ((unint64_t)[v34 count] > 0x31 || v31 >= v64)
          {
            uint64_t v43 = [v72 childProgressReporterToCheckpoint:v33];
            __int16 v44 = v34;
            [(PGGraphMemoriesEnrichmentProcessor *)v71 insertOrUpdateLocalMemoriesForEnrichedMemories:v34 localMemoryByUniqueIdentifier:v58 memoryPersister:v59 progressReporter:v43];
            if ([v37 isCancelled])
            {

              long long v45 = obj;

              id v46 = 0;
              id v13 = v55;
              id v36 = v60;
              goto LABEL_22;
            }
            id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

            id v36 = v60;
            id v37 = v61;
          }
          if (v31 >= v64)
          {

            id v16 = v54;
            id v13 = v55;
            uint64_t v23 = v53;
            id v26 = v34;
            goto LABEL_23;
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Memory's uniqueMemoryIdentifier is nil", buf, 2u);
        }
      }
      if (v66 == ++v35)
      {
        id v16 = v54;
        id v13 = v55;
        uint64_t v23 = v53;
        id v26 = v34;
        uint64_t v66 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
        if (v66) {
          goto LABEL_3;
        }
        goto LABEL_23;
      }
    }

    long long v45 = obj;

    id v46 = 0;
    id v13 = v55;
LABEL_22:
    uint64_t v23 = v53;
    id v16 = v54;
    uint64_t v47 = v56;
    uint64_t v48 = v62;
    goto LABEL_29;
  }
LABEL_23:

  if ([v26 count]
    && ([v72 childProgressReporterToCheckpoint:0.7],
        uint64_t v49 = objc_claimAutoreleasedReturnValue(),
        -[PGGraphMemoriesEnrichmentProcessor insertOrUpdateLocalMemoriesForEnrichedMemories:localMemoryByUniqueIdentifier:memoryPersister:progressReporter:](v71, "insertOrUpdateLocalMemoriesForEnrichedMemories:localMemoryByUniqueIdentifier:memoryPersister:progressReporter:", v26, v58, v59, v49), char v50 = [v61 isCancelled], v49, (v50 & 1) != 0))
  {
    id v34 = v26;
    id v46 = 0;
    id v36 = v60;
    uint64_t v47 = v56;
    uint64_t v48 = v62;
    long long v45 = obj;
  }
  else
  {
    id v34 = v26;
    loggingConnection = v71->_loggingConnection;
    uint64_t v47 = v56;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v78 = v31;
      _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Enriched %tu Memory nodes.", buf, 0xCu);
    }
    uint64_t v48 = v62;
    id v46 = v62;
    id v36 = v60;
    long long v45 = obj;
  }
LABEL_29:

  return v46;
}

- (id)runWithGraphManager:(id)a3 forMemoryUUIDs:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v10 workingContextForMemories];
  id v14 = [v13 photoLibrary];
  id v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  id v16 = +[PGGraphMemoryProcessorHelper localMemoryByUniqueIdentifierForMemoryUUIDs:v15 inPhotoLibrary:v14];

  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  long long v45 = __Block_byref_object_copy__43066;
  id v46 = __Block_byref_object_dispose__43067;
  id v47 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  int v39 = __Block_byref_object_copy__43066;
  uint64_t v40 = __Block_byref_object_dispose__43067;
  id v41 = 0;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  uint64_t v27 = __96__PGGraphMemoriesEnrichmentProcessor_runWithGraphManager_forMemoryUUIDs_progressReporter_error___block_invoke;
  id v28 = &unk_1E68EA490;
  uint64_t v29 = self;
  id v17 = v16;
  id v30 = v17;
  id v34 = &v36;
  id v18 = v11;
  id v31 = v18;
  uint64_t v35 = &v42;
  id v19 = v13;
  id v32 = v19;
  id v20 = v12;
  id v33 = v20;
  [v19 performSynchronousConcurrentGraphReadUsingBlock:&v25];
  if (a6)
  {
    uint64_t v21 = (void *)v37[5];
    if (v21)
    {
      id v22 = v21;
    }
    else
    {
      if (!objc_msgSend(v20, "isCancelled", v25, v26, v27, v28, v29, v30, v31, v32)) {
        goto LABEL_7;
      }
      id v22 = +[PGError errorForCode:-4];
    }
    *a6 = v22;
  }
LABEL_7:
  id v23 = (id)v43[5];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v23;
}

void __96__PGGraphMemoriesEnrichmentProcessor_runWithGraphManager_forMemoryUUIDs_progressReporter_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = *(id *)(*(void *)(a1 + 32) + 24);
  id v5 = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v4);
  double v7 = v4;
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PGGraphMemoriesEnrichmentProcessorForUUIDs", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = mach_absolute_time();
  id v10 = [v5 graph];

  id v11 = [*(id *)(a1 + 40) allKeys];
  id v12 = +[PGGraphMemoryNodeCollection memoryNodesWithUniqueIdentifierArray:v11 inGraph:v10];

  id v13 = [v12 array];
  if ([v13 count])
  {
    uint64_t v14 = [*(id *)(a1 + 32) enrichMemoryNodes:v13 localMemoryByUniqueIdentifier:*(void *)(a1 + 40) workingContext:*(void *)(a1 + 56) graph:v10 progressReporter:*(void *)(a1 + 64)];
    uint64_t v15 = *(void *)(*(void *)(a1 + 80) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    uint64_t v17 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    id v20 = v8;
    uint64_t v21 = v20;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v21, OS_SIGNPOST_INTERVAL_END, v6, "PGGraphMemoriesEnrichmentProcessorForUUIDs", "", buf, 2u);
    }

    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v31 = "PGGraphMemoriesEnrichmentProcessorForUUIDs";
      __int16 v32 = 2048;
      double v33 = (float)((float)((float)((float)(v17 - v9) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    id v22 = (void *)MEMORY[0x1E4F28C58];
    id v23 = [NSString stringWithFormat:@"No memory nodes to enrich for %@", *(void *)(a1 + 48)];
    uint64_t v24 = objc_msgSend(v22, "pl_analysisErrorWithCode:localizedDescription:", 1, v23);
    uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

    uint64_t v27 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = *(const char **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      id v31 = v28;
      _os_log_error_impl(&dword_1D1805000, v27, OS_LOG_TYPE_ERROR, "[PGGraphMemoriesEnrichmentProcessor] Error: %@", buf, 0xCu);
    }
  }
}

- (id)runWithGraphManager:(id)a3 forMemoryCategory:(unint64_t)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [v10 workingContextForMemories];
  id v13 = [v12 photoLibrary];
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__43066;
  uint64_t v38 = __Block_byref_object_dispose__43067;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__43066;
  __int16 v32 = __Block_byref_object_dispose__43067;
  id v33 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __99__PGGraphMemoriesEnrichmentProcessor_runWithGraphManager_forMemoryCategory_progressReporter_error___block_invoke;
  v21[3] = &unk_1E68F0628;
  unint64_t v27 = a4;
  v21[4] = self;
  uint64_t v25 = &v28;
  id v14 = v13;
  id v22 = v14;
  uint64_t v26 = &v34;
  id v15 = v12;
  id v23 = v15;
  id v16 = v11;
  id v24 = v16;
  [v15 performSynchronousConcurrentGraphReadUsingBlock:v21];
  if (a6)
  {
    uint64_t v17 = (void *)v29[5];
    if (v17)
    {
      id v18 = v17;
    }
    else
    {
      if (![v16 isCancelled]) {
        goto LABEL_7;
      }
      id v18 = +[PGError errorForCode:-4];
    }
    *a6 = v18;
  }
LABEL_7:
  id v19 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

void __99__PGGraphMemoriesEnrichmentProcessor_runWithGraphManager_forMemoryCategory_progressReporter_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = *(id *)(*(void *)(a1 + 32) + 24);
  id v5 = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v4);
  double v7 = v4;
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PGGraphMemoriesEnrichmentProcessorForUUIDs", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = mach_absolute_time();
  id v10 = [v5 graph];

  id v11 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:*(void *)(a1 + 80) inGraph:v10];
  id v12 = [v11 array];
  if ([v12 count])
  {
    uint64_t v31 = v9;
    id v13 = [v11 uniqueMemoryIdentifiers];
    id v14 = [v13 allObjects];
    id v15 = +[PGGraphMemoryProcessorHelper localMemoryByUniqueIdentifierWithGraphMemoryIdentifiers:v14 inPhotoLibrary:*(void *)(a1 + 40)];

    uint64_t v16 = [*(id *)(a1 + 32) enrichMemoryNodes:v12 localMemoryByUniqueIdentifier:v15 workingContext:*(void *)(a1 + 48) graph:v10 progressReporter:*(void *)(a1 + 56)];
    uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    uint64_t v19 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    id v22 = v8;
    id v23 = v22;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v23, OS_SIGNPOST_INTERVAL_END, v6, "PGGraphMemoriesEnrichmentProcessorForUUIDs", "", buf, 2u);
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = "PGGraphMemoriesEnrichmentProcessorForUUIDs";
      __int16 v35 = 2048;
      double v36 = (float)((float)((float)((float)(v19 - v31) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"No memory nodes to enrich for category %zu", *(void *)(a1 + 80));
    uint64_t v26 = objc_msgSend(v24, "pl_analysisErrorWithCode:localizedDescription:", 1, v25);
    uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    uint64_t v29 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = *(const char **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v30;
      _os_log_error_impl(&dword_1D1805000, v29, OS_LOG_TYPE_ERROR, "[PGGraphMemoriesEnrichmentProcessor] Error: %@", buf, 0xCu);
    }
  }
}

- (BOOL)runWithGraphManager:(id)a3 incrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v10 workingContextForMemories];
  id v14 = [v13 photoLibrary];
  id v15 = +[PGGraphMemoryProcessorHelper localMemoryByUniqueIdentifierInPhotoLibrary:v14];
  uint64_t v31 = 0;
  __int16 v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __99__PGGraphMemoriesEnrichmentProcessor_runWithGraphManager_incrementalChange_progressReporter_error___block_invoke;
  v24[3] = &unk_1E68EA468;
  v24[4] = self;
  id v16 = v11;
  id v25 = v16;
  id v17 = v15;
  id v26 = v17;
  id v18 = v12;
  id v27 = v18;
  id v19 = v14;
  id v28 = v19;
  id v20 = v13;
  id v29 = v20;
  uint64_t v30 = &v31;
  [v20 performSynchronousConcurrentGraphReadUsingBlock:v24];
  int v21 = [v18 isCancelled] ^ 1;
  if (!a6) {
    LOBYTE(v21) = 1;
  }
  if ((v21 & 1) == 0)
  {
    *a6 = +[PGError errorForCode:-4];
  }
  char v22 = *((unsigned char *)v32 + 24);

  _Block_object_dispose(&v31, 8);
  return v22;
}

void __99__PGGraphMemoriesEnrichmentProcessor_runWithGraphManager_incrementalChange_progressReporter_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(*(void *)(a1 + 32) + 24);
  os_signpost_id_t v5 = os_signpost_id_generate(v4);
  os_signpost_id_t v6 = v4;
  double v7 = v6;
  unint64_t v8 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PGGraphMemoriesEnrichmentProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = mach_absolute_time();
  id v10 = [v3 graph];
  id v11 = *(void **)(a1 + 40);
  if (v11) {
    int v12 = [v11 isResumingFullAnalysis];
  }
  else {
    int v12 = 1;
  }
  id v13 = [(id)objc_opt_class() enrichableMemoryNodesInGraph:v10];
  id v14 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 48);
  if (v12) {
    [v14 sortedMemoryNodesToEnrichForMemoryNodes:v13 localMemoryByUniqueIdentifier:v15 graph:v10];
  }
  else {
  id v16 = [v14 sortedMemoryNodesToEnrichForIncrementalForMemoryNodes:v13 localMemoryByUniqueIdentifier:v15 graph:v10];
  }
  id v41 = [*(id *)(a1 + 56) childProgressReporterFromStart:0.0 toEnd:0.1];
  objc_msgSend(*(id *)(a1 + 32), "deleteNoLongerExistingMemoryNodes:fromLocalMemoryByUniqueIdentifier:inPhotoLibrary:progressReporter:", v13, *(void *)(a1 + 48), *(void *)(a1 + 64));
  if (([*(id *)(a1 + 56) isCancelled] & 1) == 0)
  {
    if ([v16 count])
    {
      uint64_t v38 = v9;
      id v39 = [*(id *)(a1 + 56) childProgressReporterFromStart:0.1 toEnd:1.0];
      uint64_t v40 = objc_msgSend(*(id *)(a1 + 32), "enrichMemoryNodes:localMemoryByUniqueIdentifier:workingContext:graph:progressReporter:", v16, *(void *)(a1 + 48), *(void *)(a1 + 72), v10);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v40 != 0;
      if (([*(id *)(a1 + 56) isCancelled] & 1) == 0)
      {
        if ((v12 & 1) == 0)
        {
          unint64_t v33 = v5 - 1;
          os_signpost_id_t v35 = v5;
          double v36 = v7;
          id v37 = v3;
          id v17 = [MEMORY[0x1E4F1CA80] set];
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          char v34 = v16;
          id v18 = v16;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v51 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v43;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v43 != v21) {
                  objc_enumerationMutation(v18);
                }
                id v23 = *(void **)(*((void *)&v42 + 1) + 8 * i);
                id v24 = (void *)MEMORY[0x1D25FED50]();
                id v25 = [v23 uniqueMemoryIdentifier];
                [v17 addObject:v25];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v51 count:16];
            }
            while (v20);
          }

          if (v40)
          {
            id v26 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
            [v17 minusSet:v26];
          }
          +[PGGraphMemoryProcessorHelper resetLocalMemoryLastEnrichmentDateOfMemoriesWithUniqueIdentifiers:v17 localMemoryByUniqueIdentifierCache:*(void *)(a1 + 48) inPhotoLibrary:*(void *)(a1 + 64)];

          double v7 = v36;
          id v3 = v37;
          id v16 = v34;
          os_signpost_id_t v5 = v35;
          unint64_t v8 = v33;
        }
        uint64_t v27 = mach_absolute_time();
        uint32_t numer = info.numer;
        uint32_t denom = info.denom;
        uint64_t v30 = v7;
        uint64_t v31 = v30;
        if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v31, OS_SIGNPOST_INTERVAL_END, v5, "PGGraphMemoriesEnrichmentProcessor", "", buf, 2u);
        }

        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v48 = "PGGraphMemoriesEnrichmentProcessor";
          __int16 v49 = 2048;
          double v50 = (float)((float)((float)((float)(v27 - v38) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
      }
    }
    else
    {
      __int16 v32 = *(NSObject **)(*(void *)(a1 + 32) + 24);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] No memory nodes to enrich", buf, 2u);
      }
    }
  }
}

- (PGGraphMemoriesEnrichmentProcessor)initWithNumberOfMemoriesToEnrich:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PGGraphMemoriesEnrichmentProcessor;
  id v4 = [(PGGraphMemoriesEnrichmentProcessor *)&v9 init];
  os_signpost_id_t v5 = v4;
  if (v4)
  {
    v4->_unint64_t numberOfMemoriesToEnrich = a3;
    os_log_t v6 = os_log_create("com.apple.PhotosGraph", "MemoriesEnrichment");
    loggingConnection = v5->_loggingConnection;
    v5->_loggingConnection = (OS_os_log *)v6;
  }
  return v5;
}

- (PGGraphMemoriesEnrichmentProcessor)init
{
  return [(PGGraphMemoriesEnrichmentProcessor *)self initWithNumberOfMemoriesToEnrich:0];
}

+ (id)enrichableMemoryNodesInGraph:(id)a3
{
  return +[PGGraphNodeCollection nodesInGraph:a3];
}

+ (id)categoriesOfMemoriesToPrioritize
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:31];
  [v2 addIndex:19];
  return v2;
}

@end