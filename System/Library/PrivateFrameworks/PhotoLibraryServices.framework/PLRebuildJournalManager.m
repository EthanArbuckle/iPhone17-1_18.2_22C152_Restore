@interface PLRebuildJournalManager
+ (BOOL)assetJournalExists:(id)a3 error:(id *)a4;
+ (BOOL)existingJournalsCompatibleForRebuild:(id)a3 error:(id *)a4;
+ (BOOL)isEnabledWithPathManager:(id)a3 error:(id *)a4;
+ (id)baseURLFromPathManager:(id)a3;
+ (id)name;
+ (id)payloadClasses;
- (BOOL)_coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 error:(id *)a5;
- (BOOL)_performSnapshotForPayloadClassIDs:(id)a3 error:(id *)a4;
- (BOOL)_performSnapshotIfNecessaryWithError:(id *)a3;
- (BOOL)_recreateResourcesForAsset:(id)a3 withPayload:(id)a4 resources:(id)a5 recreateOptions:(unsigned __int8)a6 storeOptions:(id)a7 libraryID:(id)a8 isCPLEnabled:(BOOL)a9;
- (BOOL)_replayFromCurrentHistoryToken;
- (BOOL)_snapshotJournalsForPayloadClassIDs:(id)a3 error:(id *)a4;
- (BOOL)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 error:(id *)a5;
- (BOOL)snapshotJournalsForPayloadClassIDs:(id)a3 error:(id *)a4;
- (PLRebuildJournalManager)initWithLibraryServicesManager:(id)a3;
- (id)_assetsToImportFromAssetJournalInManagedObjectContext:(id)a3 outOnDiskURLs:(id)a4;
- (id)_newTransientContext;
- (id)assetsToImportFromAssetJournalInManagedObjectContext:(id)a3 outOnDiskURLs:(id)a4;
- (void)_handleChangeHandlingNotificationWithTransaction:(id)a3;
- (void)_recreateAssetsInManagedObjectContext:(id)a3 options:(unsigned __int8)a4 progress:(id)a5;
- (void)_recreateNonAssetsInManagedObjectContext:(id)a3 progress:(id)a4;
- (void)_registerForChangeHandlingNotifications;
- (void)_retrySnapshot;
- (void)_snapshotJournalsIgnoreHistoreIfNecessaryForPayloadClassIDs:(id)a3;
- (void)_start;
- (void)_startAfterRebuild;
- (void)_unregisterForChangeHandlingNotifications;
- (void)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 completionHandler:(id)a5;
- (void)notifyRebuildComplete;
- (void)notifyWillRebuild;
- (void)recreateAllObjectsInManagedObjectContext:(id)a3 options:(unsigned __int8)a4;
- (void)recreateAssetsInManagedObjectContext:(id)a3 options:(unsigned __int8)a4 progress:(id)a5;
- (void)recreateNonAssetsInManagedObjectContext:(id)a3 progress:(id)a4;
- (void)snapshotJournalsForPayloadClassIDs:(id)a3 withCompletionHandler:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation PLRebuildJournalManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startupWaitGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_changeHandlingNotificationObserver, 0);
  objc_storeStrong((id *)&self->_journalManager, 0);
  objc_destroyWeak((id *)&self->_lsm);
}

- (id)_assetsToImportFromAssetJournalInManagedObjectContext:(id)a3 outOnDiskURLs:(id)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  v11 = [WeakRetained pathManager];

  LODWORD(WeakRetained) = [v11 isUBF];
  id v12 = objc_loadWeakRetained((id *)&self->_lsm);
  v13 = [v12 pathManager];
  v14 = v13;
  if (WeakRetained) {
    uint64_t v15 = 4;
  }
  else {
    uint64_t v15 = 1;
  }
  v16 = [v13 photoDirectoryWithType:v15];

  id v90 = 0;
  v17 = [MEMORY[0x1E4F8B908] realPathForPath:v16 error:&v90];
  id v18 = v90;
  if (v17)
  {
    v71 = v16;
    v19 = [PLJournal alloc];
    v20 = [(PLJournalManagerCore *)self->_journalManager baseURL];
    v21 = [(PLJournal *)v19 initWithBaseURL:v20 payloadClass:objc_opt_class()];

    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __95__PLRebuildJournalManager__assetsToImportFromAssetJournalInManagedObjectContext_outOnDiskURLs___block_invoke;
    v84[3] = &unk_1E5872EC8;
    id v85 = v11;
    id v86 = v17;
    id v72 = v8;
    id v87 = v72;
    id v22 = v9;
    id v88 = v22;
    id v89 = v7;
    id v83 = v18;
    p_super = &v21->super;
    LODWORD(v21) = [(PLJournal *)v21 enumeratePayloadsUsingBlock:v84 error:&v83];
    id v69 = v83;

    v23 = PLMigrationGetLog();
    v24 = v23;
    if (!v21)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v51 = v69;
        uint64_t v95 = (uint64_t)v69;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Error enumerating assets journal for import %@", buf, 0xCu);
      }
      else
      {
        id v51 = v69;
      }
      v49 = p_super;
      goto LABEL_42;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [v72 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v95 = v25;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Will import %lu assets from asset journal", buf, 0xCu);
    }

    id v66 = v8;
    id v67 = v7;
    v64 = v11;
    id v65 = v9;
    v68 = v17;
    if ([v22 count])
    {
      v26 = (void *)MEMORY[0x1E4F1C0D0];
      v27 = +[PLAssetJournalEntryPayload payloadClassID];
      v28 = [v26 fetchRequestWithEntityName:v27];

      [v28 setReturnsObjectsAsFaults:1];
      v93 = @"uuid";
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
      [v28 setPropertiesToFetch:v29];

      [v28 setFetchBatchSize:100];
      v30 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"uuid", v22];
      [v28 setPredicate:v30];

      id v82 = 0;
      v31 = [v6 executeFetchRequest:v28 error:&v82];
      id v32 = v82;
      v33 = v32;
      if (v31)
      {
        id v62 = v32;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v34 = v31;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v78 objects:v92 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v79;
          do
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v79 != v37) {
                objc_enumerationMutation(v34);
              }
              v39 = [*(id *)(*((void *)&v78 + 1) + 8 * i) uuid];
              [v22 removeObject:v39];
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v78 objects:v92 count:16];
          }
          while (v36);
        }

        id v8 = v66;
        id v7 = v67;
        v11 = v64;
        id v9 = v65;
        v33 = v62;
      }

      v17 = v68;
    }
    if (![v22 count])
    {
      id v18 = v69;
      v49 = p_super;
LABEL_43:
      v59 = [v72 allValues];

      v16 = v71;
      goto LABEL_44;
    }
    id v63 = v6;
    v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v40 = v22;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v74 objects:v91 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v75;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v75 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = *(void *)(*((void *)&v74 + 1) + 8 * j);
          v46 = [PLJournalEntry alloc];
          v47 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v45];
          id v48 = [(PLJournalEntry *)v46 initForDeleteWithPayloadID:v47 payloadClass:objc_opt_class()];

          [v24 addObject:v48];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v74 objects:v91 count:16];
      }
      while (v42);
    }

    v49 = p_super;
    id v73 = v69;
    int v50 = [p_super appendChangeEntries:v24 error:&v73];
    id v51 = v73;

    v52 = PLMigrationGetLog();
    v53 = v52;
    if (v50)
    {
      id v8 = v66;
      id v7 = v67;
      v11 = v64;
      id v9 = v65;
      v17 = v68;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v54 = [v40 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v95 = v54;
        v55 = "Deleted %lu non-local assets from asset journal";
        v56 = v53;
        os_log_type_t v57 = OS_LOG_TYPE_DEFAULT;
        uint32_t v58 = 12;
LABEL_40:
        _os_log_impl(&dword_19B3C7000, v56, v57, v55, buf, v58);
      }
    }
    else
    {
      id v8 = v66;
      id v7 = v67;
      v11 = v64;
      id v9 = v65;
      v17 = v68;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        uint64_t v60 = [v40 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v95 = v60;
        __int16 v96 = 2112;
        id v97 = v51;
        v55 = "Error deleting %lu entries from asset journal: %@";
        v56 = v53;
        os_log_type_t v57 = OS_LOG_TYPE_ERROR;
        uint32_t v58 = 22;
        goto LABEL_40;
      }
    }

    id v6 = v63;
LABEL_42:

    id v18 = v51;
    goto LABEL_43;
  }
  v49 = PLMigrationGetLog();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v95 = (uint64_t)v16;
    __int16 v96 = 2112;
    id v97 = v18;
    _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_ERROR, "Failed to resolve originals path: %{public}@, error: %@", buf, 0x16u);
  }
  v59 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_44:

  return v59;
}

void __95__PLRebuildJournalManager__assetsToImportFromAssetJournalInManagedObjectContext_outOnDiskURLs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 originalResourceRelativePathsWithPathManager:*(void *)(a1 + 32)];
  if ([v4 count])
  {
    v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = v5;
      v28 = v4;
      v29 = 0;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x1E4F1CB10];
          v14 = [*(id *)(a1 + 40) stringByAppendingPathComponent:v12];
          uint64_t v15 = [v13 fileURLWithPath:v14];

          if ([v15 checkResourceIsReachableAndReturnError:0])
          {
            [v9 addObject:v15];
            v16 = [v6 firstObject];

            if (v12 == v16)
            {
              id v17 = v15;

              v29 = v17;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v8);

      v4 = v28;
      id v18 = v29;
      v5 = v9;
      if (v29)
      {
        v19 = [*(id *)(a1 + 48) objectForKeyedSubscript:v29];
        v20 = v19;
        if (v19)
        {
          v21 = *(void **)(a1 + 56);
          id v22 = [v19 assetPayload];
          v23 = [v22 payloadID];
          v24 = [v23 payloadIDString];
          [v21 addObject:v24];
        }
        uint64_t v25 = [[PLFileSystemImportAsset alloc] initWithAssetPayload:v3];
        [*(id *)(a1 + 48) setObject:v25 forKeyedSubscript:v29];

        v26 = [*(id *)(a1 + 48) objectForKeyedSubscript:v29];
        [v26 addURLs:v5];

        [*(id *)(a1 + 64) unionSet:v5];
        goto LABEL_20;
      }
    }
    else
    {
    }
    v27 = *(void **)(a1 + 56);
    id v18 = [v3 payloadID];
    v20 = [v18 payloadIDString];
    [v27 addObject:v20];
LABEL_20:

    goto LABEL_21;
  }
  v5 = PLMigrationGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v35 = v3;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Asset payload has no resources, not importing: %{public}@", buf, 0xCu);
  }
LABEL_21:
}

- (id)assetsToImportFromAssetJournalInManagedObjectContext:(id)a3 outOnDiskURLs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__104307;
  v21 = __Block_byref_object_dispose__104308;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__PLRebuildJournalManager_assetsToImportFromAssetJournalInManagedObjectContext_outOnDiskURLs___block_invoke;
  v13[3] = &unk_1E5875368;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __94__PLRebuildJournalManager_assetsToImportFromAssetJournalInManagedObjectContext_outOnDiskURLs___block_invoke(void *a1)
{
  v2 = (_WORD *)a1[4];
  if (v2[24] == 3)
  {
    uint64_t v3 = [v2 _assetsToImportFromAssetJournalInManagedObjectContext:a1[5] outOnDiskURLs:a1[6]];
    uint64_t v4 = *(void *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    id v6 = (PLRebuildJournalManager *)_PFAssertFailHandler();
    [(PLRebuildJournalManager *)v6 _recreateNonAssetsInManagedObjectContext:v8 progress:v9];
  }
}

- (void)_recreateNonAssetsInManagedObjectContext:(id)a3 progress:(id)a4
{
  uint64_t v248 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v236 = 0;
  v237 = &v236;
  uint64_t v238 = 0x3032000000;
  v239 = __Block_byref_object_copy__104307;
  v240 = __Block_byref_object_dispose__104308;
  id v241 = 0;
  uint64_t v232 = 0;
  v233 = &v232;
  uint64_t v234 = 0x2020000000;
  char v235 = 0;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v230[0] = MEMORY[0x1E4F143A8];
  v230[1] = 3221225472;
  v230[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke;
  v230[3] = &unk_1E5872C48;
  id v115 = v7;
  id v231 = v115;
  id v8 = (void *)MEMORY[0x19F38D650](v230);
  v228[0] = MEMORY[0x1E4F143A8];
  v228[1] = 3221225472;
  v228[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_2;
  v228[3] = &unk_1E5872C70;
  id v9 = v5;
  id v229 = v9;
  v120 = (void (**)(void, void))MEMORY[0x19F38D650](v228);
  v225[0] = MEMORY[0x1E4F143A8];
  v225[1] = 3221225472;
  v225[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_126;
  v225[3] = &unk_1E5872CC0;
  id v134 = v6;
  id v226 = v134;
  id v122 = v8;
  id v227 = v122;
  v118 = (void (**)(void, void, void))MEMORY[0x19F38D650](v225);
  char v123 = [v9 hasChanges];
  uint64_t v10 = [(PLJournalManagerCore *)self->_journalManager baseURL];
  id v11 = [[PLJournal alloc] initWithBaseURL:v10 payloadClass:objc_opt_class()];
  v133 = [[PLJournal alloc] initWithBaseURL:v10 payloadClass:objc_opt_class()];
  v130 = [[PLJournal alloc] initWithBaseURL:v10 payloadClass:objc_opt_class()];
  v132 = [[PLJournal alloc] initWithBaseURL:v10 payloadClass:objc_opt_class()];
  v131 = [[PLJournal alloc] initWithBaseURL:v10 payloadClass:objc_opt_class()];
  v129 = [[PLJournal alloc] initWithBaseURL:v10 payloadClass:objc_opt_class()];
  v128 = [[PLJournal alloc] initWithBaseURL:v10 payloadClass:objc_opt_class()];
  v126 = [[PLJournal alloc] initWithBaseURL:v10 payloadClass:objc_opt_class()];
  v127 = [[PLJournal alloc] initWithBaseURL:v10 payloadClass:objc_opt_class()];
  id v12 = v9;
  uint64_t v116 = [(PLJournal *)v128 countOfInsertEntriesWithError:0];
  v119 = (void *)v10;
  v125 = v11;
  uint64_t v13 = [(PLJournal *)v11 countOfInsertEntriesWithError:0];
  uint64_t v14 = [(PLJournal *)v133 countOfInsertEntriesWithError:0];
  uint64_t v15 = [(PLJournal *)v130 countOfInsertEntriesWithError:0];
  uint64_t v16 = [(PLJournal *)v132 countOfInsertEntriesWithError:0];
  uint64_t v17 = [(PLJournal *)v131 countOfInsertEntriesWithError:0];
  uint64_t v18 = [(PLJournal *)v129 countOfInsertEntriesWithError:0];
  uint64_t v19 = [(PLJournal *)v127 countOfInsertEntriesWithError:0];
  uint64_t v20 = [(PLJournal *)v126 countOfInsertEntriesWithError:0];
  v21 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:parent:pendingUnitCount:", v13 + v116 + v14 + v15 + v16 + v17 + v18 + v19 + v20, v134, objc_msgSend(v134, "totalUnitCount"));
  [v12 setChangeSource:2];
  v220[0] = MEMORY[0x1E4F143A8];
  v220[1] = 3221225472;
  v220[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_130;
  v220[3] = &unk_1E5872CE8;
  id v22 = v134;
  id v221 = v22;
  id v135 = v12;
  id v222 = v135;
  char v224 = v123;
  id v23 = v21;
  id v223 = v23;
  v24 = (id *)(v237 + 5);
  obuint64_t j = (id)v237[5];
  LOBYTE(v12) = [(PLJournal *)v125 enumeratePayloadsUsingBlock:v220 error:&obj];
  objc_storeStrong(v24, obj);
  *((unsigned char *)v233 + 24) = (_BYTE)v12;
  if (![v22 isCancelled])
  {
    v214[0] = MEMORY[0x1E4F143A8];
    v214[1] = 3221225472;
    v214[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_133;
    v214[3] = &unk_1E5872D10;
    v26 = v22;
    v215 = v26;
    id v27 = v135;
    id v216 = v27;
    char v218 = v123;
    id v28 = v23;
    id v217 = v28;
    v29 = (id *)(v237 + 5);
    id v213 = (id)v237[5];
    BOOL v30 = [(PLJournal *)v133 enumeratePayloadsUsingBlock:v214 error:&v213];
    objc_storeStrong(v29, v213);
    *((unsigned char *)v233 + 24) = v30;
    if ([v26 isCancelled])
    {
      long long v31 = PLMigrationGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
      }
      goto LABEL_79;
    }
    v208[0] = MEMORY[0x1E4F143A8];
    v208[1] = 3221225472;
    v208[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_135;
    v208[3] = &unk_1E5872CE8;
    long long v32 = v26;
    v209 = v32;
    id v33 = v27;
    id v210 = v33;
    char v212 = v123;
    id v34 = v28;
    id v211 = v34;
    id v35 = (id *)(v237 + 5);
    id v207 = (id)v237[5];
    BOOL v36 = [(PLJournal *)v132 enumeratePayloadsUsingBlock:v208 error:&v207];
    objc_storeStrong(v35, v207);
    *((unsigned char *)v233 + 24) = v36;
    if ([v32 isCancelled])
    {
      uint64_t v37 = PLMigrationGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
      }
      goto LABEL_78;
    }
    v38 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v199[0] = MEMORY[0x1E4F143A8];
    v199[1] = 3221225472;
    v199[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_137;
    v199[3] = &unk_1E5872D38;
    uint64_t v41 = v32;
    v200 = v41;
    id v114 = v39;
    id v201 = v114;
    id v117 = v40;
    id v202 = v117;
    id v113 = v122;
    id v206 = v113;
    id v111 = v33;
    id v203 = v111;
    id v42 = v38;
    id v204 = v42;
    id v108 = v34;
    id v205 = v108;
    uint64_t v43 = (id *)(v237 + 5);
    id v198 = (id)v237[5];
    BOOL v44 = [(PLJournal *)v131 enumeratePayloadsUsingBlock:v199 error:&v198];
    objc_storeStrong(v43, v198);
    *((unsigned char *)v233 + 24) = v44;
    long long v194 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    uint64_t v37 = v42;
    uint64_t v45 = [v37 countByEnumeratingWithState:&v194 objects:v247 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v195;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v195 != v46) {
            objc_enumerationMutation(v37);
          }
          uint64_t v48 = *(void *)(*((void *)&v194 + 1) + 8 * i);
          v49 = [v37 objectForKey:v48];
          [v49 updateAlbum:v48 includePendingChanges:1];
        }
        uint64_t v45 = [v37 countByEnumeratingWithState:&v194 objects:v247 count:16];
      }
      while (v45);
    }

    if ([v41 isCancelled])
    {
      int v50 = PLMigrationGetLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v50, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
      }
      goto LABEL_77;
    }
    id v51 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v52 = [PLJournal alloc];
    v53 = [(PLJournalManagerCore *)self->_journalManager baseURL];
    v110 = [(PLJournal *)v52 initWithBaseURL:v53 payloadClass:objc_opt_class()];

    v192[0] = MEMORY[0x1E4F143A8];
    v192[1] = 3221225472;
    v192[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_142;
    v192[3] = &unk_1E5872D60;
    v109 = v51;
    v193 = v109;
    uint64_t v54 = (id *)(v237 + 5);
    id v191 = (id)v237[5];
    LOBYTE(v53) = [(PLJournal *)v110 enumeratePayloadsUsingBlock:v192 error:&v191];
    objc_storeStrong(v54, v191);
    *((unsigned char *)v233 + 24) = (_BYTE)v53;
    v188[0] = MEMORY[0x1E4F143A8];
    v188[1] = 3221225472;
    v188[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_2_145;
    v188[3] = &unk_1E5872D88;
    id v55 = v111;
    id v189 = v55;
    id v56 = v113;
    id v190 = v56;
    [v109 enumerateKeysAndObjectsUsingBlock:v188];
    if ([v41 isCancelled])
    {
      os_log_type_t v57 = PLMigrationGetLog();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
      }
      goto LABEL_76;
    }
    ((void (**)(void, __CFString *))v120)[2](v120, @"albums and folders");
    v183[0] = MEMORY[0x1E4F143A8];
    v183[1] = 3221225472;
    v183[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_150;
    v183[3] = &unk_1E5872CE8;
    uint32_t v58 = v41;
    v184 = v58;
    id v59 = v55;
    id v185 = v59;
    char v187 = v123;
    id v60 = v108;
    id v186 = v60;
    v61 = (id *)(v237 + 5);
    id v182 = (id)v237[5];
    BOOL v62 = [(PLJournal *)v130 enumeratePayloadsUsingBlock:v183 error:&v182];
    objc_storeStrong(v61, v182);
    *((unsigned char *)v233 + 24) = v62;
    if ([v58 isCancelled])
    {
      id v63 = PLMigrationGetLog();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v63, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
      }
      goto LABEL_75;
    }
    ((void (**)(void, __CFString *))v120)[2](v120, @"import sessions");
    v175[0] = MEMORY[0x1E4F143A8];
    v175[1] = 3221225472;
    v175[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_154;
    v175[3] = &unk_1E5872DB0;
    v64 = v58;
    v176 = v64;
    id v65 = v59;
    id v177 = v65;
    v178 = self;
    char v181 = v123;
    id v180 = v56;
    id v66 = v60;
    id v179 = v66;
    id v67 = (id *)(v237 + 5);
    id v174 = (id)v237[5];
    BOOL v68 = [(PLJournal *)v129 enumeratePayloadsUsingBlock:v175 error:&v174];
    objc_storeStrong(v67, v174);
    *((unsigned char *)v233 + 24) = v68;
    if ([v64 isCancelled])
    {
      id v69 = PLMigrationGetLog();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v69, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
      }
      goto LABEL_74;
    }
    ((void (**)(void, __CFString *))v120)[2](v120, @"memories");
    id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v169[0] = MEMORY[0x1E4F143A8];
    v169[1] = 3221225472;
    v169[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_160;
    v169[3] = &unk_1E5872DD8;
    v71 = v64;
    v170 = v71;
    id v72 = v65;
    id v171 = v72;
    id v69 = v70;
    v172 = v69;
    id v73 = v66;
    id v173 = v73;
    long long v74 = (id *)(v237 + 5);
    id v168 = (id)v237[5];
    BOOL v75 = [(PLJournal *)v128 enumeratePayloadsUsingBlock:v169 error:&v168];
    objc_storeStrong(v74, v168);
    *((unsigned char *)v233 + 24) = v75;
    +[PLPersonJournalEntryPayload updateMergeTargetPersonWithPersonUUIDMapping:v69 fromDataInManagedObjectContext:v72];
    if ([v71 isCancelled])
    {
      long long v76 = PLMigrationGetLog();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v76, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
      }

      goto LABEL_73;
    }
    *(void *)buf = 0;
    v165 = buf;
    uint64_t v166 = 0x2020000000;
    uint64_t v167 = 0;
    v159[0] = MEMORY[0x1E4F143A8];
    v159[1] = 3221225472;
    v159[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_163;
    v159[3] = &unk_1E5872E00;
    long long v77 = v71;
    v160 = v77;
    id v78 = v72;
    id v161 = v78;
    v163 = buf;
    id v79 = v73;
    id v162 = v79;
    long long v80 = (id *)(v237 + 5);
    id v158 = (id)v237[5];
    BOOL v81 = [(PLJournal *)v127 enumeratePayloadsUsingBlock:v159 error:&v158];
    objc_storeStrong(v80, v158);
    *((unsigned char *)v233 + 24) = v81;
    if (*((void *)v165 + 3))
    {
      id v82 = PLMigrationGetLog();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        uint64_t v83 = *((void *)v165 + 3);
        LODWORD(v244) = 134217984;
        *(void *)((char *)&v244 + 4) = v83;
        _os_log_impl(&dword_19B3C7000, v82, OS_LOG_TYPE_INFO, "Skipping %lu potentially deferred faces", (uint8_t *)&v244, 0xCu);
      }
    }
    v84 = [[PLJournal alloc] initWithBaseURL:v119 payloadClass:objc_opt_class()];
    v156[0] = MEMORY[0x1E4F143A8];
    v156[1] = 3221225472;
    v156[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_166;
    v156[3] = &unk_1E5872E28;
    id v85 = v78;
    id v157 = v85;
    id v86 = (id *)(v237 + 5);
    id v155 = (id)v237[5];
    BOOL v87 = [(PLJournal *)v84 enumeratePayloadsUsingBlock:v156 error:&v155];
    objc_storeStrong(v86, v155);
    *((unsigned char *)v233 + 24) = v87;
    ((void (**)(void, __CFString *))v120)[2](v120, @"persons and faces");
    if ([v77 isCancelled])
    {
      id v88 = PLMigrationGetLog();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v244) = 0;
        _os_log_impl(&dword_19B3C7000, v88, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", (uint8_t *)&v244, 2u);
      }
      goto LABEL_72;
    }
    v151[0] = MEMORY[0x1E4F143A8];
    v151[1] = 3221225472;
    v151[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_171;
    v151[3] = &unk_1E5872E50;
    v124 = v77;
    v152 = v124;
    id v89 = v85;
    id v153 = v89;
    id v112 = v79;
    id v154 = v112;
    id v90 = (id *)(v237 + 5);
    id v150 = (id)v237[5];
    BOOL v91 = [(PLJournal *)v126 enumeratePayloadsUsingBlock:v151 error:&v150];
    objc_storeStrong(v90, v150);
    *((unsigned char *)v233 + 24) = v91;
    ((void (**)(void, __CFString *))v120)[2](v120, @"social groups");
    if ([v124 isCancelled])
    {
      v92 = PLMigrationGetLog();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v244) = 0;
        _os_log_impl(&dword_19B3C7000, v92, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", (uint8_t *)&v244, 2u);
      }

      goto LABEL_71;
    }
    [v89 setChangeSource:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
    if ([WeakRetained isCloudPhotoLibraryEnabled])
    {
      BOOL v94 = *((void *)v165 + 3) == 0;

      if (!v94)
      {
        *(void *)&long long v244 = 0;
        *((void *)&v244 + 1) = &v244;
        uint64_t v245 = 0x2020000000;
        uint64_t v246 = 0;
        uint64_t v146 = 0;
        v147 = &v146;
        uint64_t v148 = 0x2020000000;
        uint64_t v149 = 0;
        v141[0] = MEMORY[0x1E4F143A8];
        v141[1] = 3221225472;
        v141[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_177;
        v141[3] = &unk_1E5872E78;
        uint64_t v95 = v124;
        v142 = v95;
        id v143 = v89;
        v144 = &v244;
        v145 = &v146;
        __int16 v96 = (id *)(v237 + 5);
        id v140 = (id)v237[5];
        BOOL v97 = [(PLJournal *)v127 enumeratePayloadsUsingBlock:v141 error:&v140];
        objc_storeStrong(v96, v140);
        *((unsigned char *)v233 + 24) = v97;
        if (*(void *)(*((void *)&v244 + 1) + 24))
        {
          uint64_t v98 = PLMigrationGetLog();
          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
          {
            uint64_t v99 = *(void *)(*((void *)&v244 + 1) + 24);
            *(_DWORD *)v242 = 134217984;
            uint64_t v243 = v99;
            _os_log_impl(&dword_19B3C7000, v98, OS_LOG_TYPE_ERROR, "Dropped %lu faces", v242, 0xCu);
          }
        }
        if (v147[3])
        {
          v100 = PLMigrationGetLog();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
          {
            uint64_t v101 = v147[3];
            *(_DWORD *)v242 = 134217984;
            uint64_t v243 = v101;
            _os_log_impl(&dword_19B3C7000, v100, OS_LOG_TYPE_INFO, "Deferred %lu faces", v242, 0xCu);
          }
        }
        ((void (**)(void, __CFString *))v120)[2](v120, @"deferred rebuild faces");
        if ([v95 isCancelled])
        {
          v102 = PLMigrationGetLog();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v242 = 0;
            _os_log_impl(&dword_19B3C7000, v102, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", v242, 2u);
          }

          _Block_object_dispose(&v146, 8);
          _Block_object_dispose(&v244, 8);
          goto LABEL_71;
        }

        _Block_object_dispose(&v146, 8);
        _Block_object_dispose(&v244, 8);
      }
    }
    else
    {
    }
    v103 = [v89 photoLibrary];
    v104 = +[PLGenericAlbum rootFolderInLibrary:v103];

    v105 = [v89 photoLibrary];
    v106 = +[PLGenericAlbum projectAlbumRootFolderInLibrary:v105];

    ((void (**)(void, void *, id))v118)[2](v118, v104, v114);
    ((void (**)(void, void *, id))v118)[2](v118, v106, v117);
    if ([v124 isCancelled])
    {
      v107 = PLMigrationGetLog();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v244) = 0;
        _os_log_impl(&dword_19B3C7000, v107, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", (uint8_t *)&v244, 2u);
      }
    }
    else
    {
      ((void (**)(void, __CFString *))v120)[2](v120, @"root folders");
      objc_msgSend(v112, "setCompletedUnitCount:", objc_msgSend(v112, "totalUnitCount"));
      if (![(PLRebuildJournalManager *)self _replayFromCurrentHistoryToken]) {
        goto LABEL_70;
      }
      if (![v124 isCancelled])
      {
        v136[0] = MEMORY[0x1E4F143A8];
        v136[1] = 3221225472;
        v136[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_185;
        v136[3] = &unk_1E5872EA0;
        v136[4] = self;
        id v137 = v119;
        v138 = &v232;
        v139 = &v236;
        [v115 enumerateKeysAndObjectsUsingBlock:v136];

        goto LABEL_70;
      }
      v107 = PLMigrationGetLog();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v244) = 0;
        _os_log_impl(&dword_19B3C7000, v107, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", (uint8_t *)&v244, 2u);
      }
    }

LABEL_70:
LABEL_71:

    id v88 = v152;
LABEL_72:

    _Block_object_dispose(buf, 8);
LABEL_73:

LABEL_74:
    id v63 = v176;
LABEL_75:

    os_log_type_t v57 = v184;
LABEL_76:

    int v50 = v109;
LABEL_77:

LABEL_78:
    long long v31 = v209;
LABEL_79:

    uint64_t v25 = v215;
    goto LABEL_80;
  }
  uint64_t v25 = PLMigrationGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
  }
LABEL_80:

  _Block_object_dispose(&v232, 8);
  _Block_object_dispose(&v236, 8);
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v12 = v3;
  id v5 = [(id)objc_opt_class() payloadClassID];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = *(void **)(a1 + 32);
    id v8 = [(id)objc_opt_class() payloadClassID];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
  id v9 = [PLJournalEntry alloc];
  uint64_t v10 = [v12 payloadID];
  id v11 = [(PLJournalEntry *)v9 initForDeleteWithPayloadID:v10 payloadClass:objc_opt_class()];
  [v6 addObject:v11];
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v10 = 0;
    char v5 = [v4 save:&v10];
    id v6 = v10;
    if ((v5 & 1) == 0)
    {
      uint64_t v7 = [NSString stringWithFormat:@"Rebuild: (%@) failed to save context %@: %@", v3, *(void *)(a1 + 32), v6];
      id v8 = PLMigrationGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v7;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v7 userInfo:0];
      objc_exception_throw(v9);
    }
    [*(id *)(a1 + 32) refreshAllObjects];
  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__104307;
  id v23 = __Block_byref_object_dispose__104308;
  id v24 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_2_127;
  uint64_t v14 = &unk_1E5872C98;
  id v15 = *(id *)(a1 + 32);
  id v7 = v5;
  id v16 = v7;
  uint64_t v18 = &v19;
  id v17 = *(id *)(a1 + 40);
  [v6 enumerateObjectsWithOptions:2 usingBlock:&v11];
  id v8 = objc_msgSend((id)v20[5], "childCollectionUUIDs", v11, v12, v13, v14);
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = [(id)v20[5] childCollectionUUIDs];
    +[PLFolderJournalEntryPayload updateChildrenOrderingInFolder:v7 usingChildCollectionUUIDs:v10 includePendingChanges:1];
  }
  _Block_object_dispose(&v19, 8);
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_130(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v6 = PLMigrationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Will abort albums journal enumeration due to progress cancel", v12, 2u);
    }

    *a3 = 1;
  }
  else
  {
    id v7 = [v5 payloadID];
    id v8 = [v7 payloadIDString];
    uint64_t v9 = [*(id *)(a1 + 40) photoLibrary];
    id v10 = +[PLGenericAlbum albumWithUUID:v8 inLibrary:v9];

    if (!v10)
    {
      uint64_t v11 = [v5 insertAlbumFromDataInManagedObjectContext:*(void *)(a1 + 40)];
      if (v11) {
        [v5 updateAlbum:v11 includePendingChanges:*(unsigned __int8 *)(a1 + 56)];
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);
  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_133(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v6 = PLMigrationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Will abort projects journal enumeration due to progress cancel", v12, 2u);
    }

    *a3 = 1;
  }
  else
  {
    id v7 = [v5 payloadID];
    id v8 = [v7 payloadIDString];
    uint64_t v9 = [*(id *)(a1 + 40) photoLibrary];
    id v10 = +[PLGenericAlbum albumWithUUID:v8 inLibrary:v9];

    if (!v10)
    {
      uint64_t v11 = [v5 insertAlbumFromDataInManagedObjectContext:*(void *)(a1 + 40)];
      if (v11) {
        [v5 updateAlbum:v11 includePendingChanges:*(unsigned __int8 *)(a1 + 56)];
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);
  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_135(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v6 = PLMigrationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Will abort fetching album journal enumeration due to progress cancel", v12, 2u);
    }

    *a3 = 1;
  }
  else
  {
    id v7 = [v5 payloadID];
    id v8 = [v7 payloadIDString];
    uint64_t v9 = [*(id *)(a1 + 40) photoLibrary];
    id v10 = +[PLGenericAlbum albumWithUUID:v8 inLibrary:v9];

    if (!v10)
    {
      uint64_t v11 = [v5 insertAlbumFromDataInManagedObjectContext:*(void *)(a1 + 40)];
      if (v11) {
        [v5 updateAlbum:v11 includePendingChanges:*(unsigned __int8 *)(a1 + 56)];
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);
  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_137(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (![*(id *)(a1 + 32) isCancelled])
  {
    if ([v5 isRootFolder])
    {
      id v7 = *(void **)(a1 + 40);
    }
    else
    {
      if (![v5 isProjectAlbumRootFolder])
      {
        id v8 = [v5 cloudGUID];
        if ([v8 isEqualToString:@"----Project-Root-Folder----"])
        {
          char v9 = [v5 isProjectAlbumRootFolder];

          if ((v9 & 1) == 0)
          {
            id v10 = PLMigrationGetLog();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)id v16 = 0;
              _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "JournalManager: found project root album PLFolderJournalEntryPayload with incorrect folder type, will delete", v16, 2u);
            }

            (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
            goto LABEL_10;
          }
        }
        else
        {
        }
        uint64_t v11 = [v5 payloadID];
        uint64_t v12 = [v11 payloadIDString];
        uint64_t v13 = [*(id *)(a1 + 56) photoLibrary];
        uint64_t v14 = +[PLGenericAlbum albumWithUUID:v12 inLibrary:v13];

        if (!v14)
        {
          id v15 = [v5 insertAlbumFromDataInManagedObjectContext:*(void *)(a1 + 56)];
          if (v15) {
            [*(id *)(a1 + 64) setObject:v5 forKey:v15];
          }
        }
        goto LABEL_10;
      }
      id v7 = *(void **)(a1 + 48);
    }
    [v7 addObject:v5];
LABEL_10:
    objc_msgSend(*(id *)(a1 + 72), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 72), "completedUnitCount") + 1);
    goto LABEL_11;
  }
  id v6 = PLMigrationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Will abort folder journal enumeration due to progress cancel", buf, 2u);
  }

  *a3 = 1;
LABEL_11:
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_142(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v9 = v3;
  id v5 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v3, "albumListType"));
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = *(void **)(a1 + 32);
    id v8 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v9, "albumListType"));
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
  [v6 addObject:v9];
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_2_145(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 lastObject];
  id v6 = [v5 insertAlbumListFromDataInManagedObjectContext:*(void *)(a1 + 32)];
  if (v6) {
    [v5 updateAlbumList:v6];
  }
  [v4 removeObject:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_150(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v6 = PLMigrationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v12 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Will abort import session journal enumeration due to progress cancel", v12, 2u);
    }

    *a3 = 1;
  }
  else
  {
    id v7 = [v5 payloadID];
    uint64_t v8 = [v7 payloadIDString];
    uint64_t v9 = [*(id *)(a1 + 40) photoLibrary];
    uint64_t v10 = +[PLGenericAlbum albumWithUUID:v8 inLibrary:v9];

    if (!v10)
    {
      uint64_t v11 = [v5 insertAlbumFromDataInManagedObjectContext:*(void *)(a1 + 40)];
      if (v11) {
        [v5 updateAlbum:v11 includePendingChanges:*(unsigned __int8 *)(a1 + 56)];
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);
  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_154(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v6 = PLMigrationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Will abort memories journal enumeration due to progress cancel", (uint8_t *)&v18, 2u);
    }

    *a3 = 1;
  }
  else
  {
    id v7 = [v5 payloadID];
    uint64_t v8 = [v7 payloadIDString];
    uint64_t v9 = [*(id *)(a1 + 40) photoLibrary];
    uint64_t v10 = +[PLMemory memoryWithUUID:v8 inPhotoLibrary:v9];

    if (!v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
      int v12 = [WeakRetained isCloudPhotoLibraryEnabled];

      if (v12
        && ([v5 hasAllAssetsAvailableInManagedObjectContext:*(void *)(a1 + 40) includePendingAssetChanges:*(unsigned __int8 *)(a1 + 72)] & 1) == 0)
      {
        id v16 = PLMigrationGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412290;
          id v19 = v5;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Skipping restore for memory with references to unavailable assets, will restore %@ from iCloud Photo Library", (uint8_t *)&v18, 0xCu);
        }

        uint64_t v17 = PLMigrationGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412290;
          id v19 = v5;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Removing memory journal entry for %@", (uint8_t *)&v18, 0xCu);
        }

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      else
      {
        long long v13 = PLMigrationGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412290;
          id v19 = v5;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Creating new memory from journal entry payload %@", (uint8_t *)&v18, 0xCu);
        }

        long long v14 = [v5 insertMemoryFromDataInManagedObjectContext:*(void *)(a1 + 40)];
        if (([v5 updateAssetsInMemory:v14 includePendingAssetChanges:*(unsigned __int8 *)(a1 + 72)] & 1) == 0)
        {
          long long v15 = PLMigrationGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v18 = 138412290;
            id v19 = v5;
            _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Incomplete restore of assets for memory %@", (uint8_t *)&v18, 0xCu);
          }
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "completedUnitCount") + 1);
  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_160(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v6 = PLMigrationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v14 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Will abort persons journal enumeration due to progress cancel", v14, 2u);
    }

    *a3 = 1;
  }
  else
  {
    id v7 = [v5 payloadID];
    uint64_t v8 = [v7 payloadIDString];
    uint64_t v9 = +[PLPerson personWithUUID:v8 inManagedObjectContext:*(void *)(a1 + 40)];

    if (!v9)
    {
      uint64_t v10 = [v5 insertPersonFromDataInManagedObjectContext:*(void *)(a1 + 40)];
      if (v10)
      {
        uint64_t v11 = [v5 mergeTargetPersonUUID];
        int v12 = *(void **)(a1 + 48);
        long long v13 = [v10 personUUID];
        [v12 setObject:v11 forKeyedSubscript:v13];
      }
    }
    objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "completedUnitCount") + 1);
  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_163(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v6 = PLMigrationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Will abort faces journal enumeration due to progress cancel", buf, 2u);
    }

    *a3 = 1;
  }
  else
  {
    id v7 = [v5 payloadID];
    uint64_t v8 = [v7 payloadIDString];
    uint64_t v9 = +[PLDetectedFace detectedFaceWithUUID:v8 inManagedObjectContext:*(void *)(a1 + 40)];

    if (!v9)
    {
      char v11 = 0;
      if (([v5 insertFaceFromDataInManagedObjectContext:*(void *)(a1 + 40) allowDeferred:&v11] & 1) == 0)
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        uint64_t v10 = PLMigrationGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v13 = v5;
          _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "Skipping face for journal payload, might be deferred: %@", buf, 0xCu);
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);
  }
}

id __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_166(uint64_t a1, void *a2)
{
  return (id)[a2 insertDeferredRebuildFaceFromDataInManagedObjectContext:*(void *)(a1 + 32)];
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_171(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v6 = PLMigrationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v11 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Will abort social groups journal enumeration due to progress cancel", v11, 2u);
    }

    *a3 = 1;
  }
  else
  {
    id v7 = [v5 payloadID];
    uint64_t v8 = [v7 payloadIDString];
    uint64_t v9 = +[PLGraphNode graphNodeWithUUID:v8 inManagedObjectContext:*(void *)(a1 + 40)];

    if (!v9) {
      id v10 = (id)[v5 insertSocialGroupInManagedObjectContext:*(void *)(a1 + 40)];
    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);
  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_177(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v6 = PLMigrationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Will abort faces journal enumeration due to progress cancel", buf, 2u);
    }

    *a3 = 1;
  }
  else
  {
    id v7 = [v5 payloadID];
    uint64_t v8 = [v7 payloadIDString];
    uint64_t v9 = +[PLDetectedFace detectedFaceWithUUID:v8 inManagedObjectContext:*(void *)(a1 + 40)];

    if (!v9)
    {
      char v12 = 1;
      if ([v5 insertFaceFromDataInManagedObjectContext:*(void *)(a1 + 40) allowDeferred:&v12])
      {
        if (v12)
        {
          id v10 = PLMigrationGetLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v14 = v5;
            _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "Deferred face for journal payload: %@", buf, 0xCu);
          }

          ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        }
      }
      else
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        char v11 = PLMigrationGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v14 = v5;
          _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Dropped face for journal payload: %@", buf, 0xCu);
        }
      }
    }
  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_185(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1[4] + 16) payloadClassForPayloadClassID:v5];
  if (v7)
  {
    uint64_t v8 = [[PLJournal alloc] initWithBaseURL:a1[5] payloadClass:v7];
    uint64_t v9 = *(void *)(a1[7] + 8);
    obuint64_t j = *(id *)(v9 + 40);
    BOOL v10 = [(PLJournal *)v8 appendChangeEntries:v6 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v10;
  }
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    char v11 = PLMigrationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*(void *)(a1[7] + 8) + 40);
      *(_DWORD *)buf = 138412802;
      id v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Rebuild: Unable to append delete entries for invalid objects to %@ journal: %@, %@", buf, 0x20u);
    }
  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_2_127(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v8 = PLMigrationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Will abort root folder journal enumeration due to progress cancel", v15, 2u);
    }

    *a4 = 1;
  }
  else
  {
    uint64_t v9 = [v7 payloadID];
    BOOL v10 = [v9 payloadIDString];
    char v11 = [*(id *)(a1 + 40) uuid];
    char v12 = [v10 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        id v13 = [v7 childCollectionUUIDs];
        uint64_t v14 = [v13 count];

        if (v14) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)_recreateAssetsInManagedObjectContext:(id)a3 options:(unsigned __int8)a4 progress:(id)a5
{
  int v6 = a4;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v109 = 0;
  v110 = (id *)&v109;
  uint64_t v111 = 0x3032000000;
  id v112 = __Block_byref_object_copy__104307;
  id v113 = __Block_byref_object_dispose__104308;
  id v114 = 0;
  BOOL v10 = PLMigrationGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v6;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Recreate options enabled: %d", (uint8_t *)&buf, 8u);
  }
  char v60 = v6;

  [v8 setChangeSource:2];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  char v12 = [PLJournal alloc];
  id v13 = [(PLJournalManagerCore *)self->_journalManager baseURL];
  BOOL v62 = [(PLJournal *)v12 initWithBaseURL:v13 payloadClass:objc_opt_class()];

  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke;
  v105[3] = &unk_1E5872B80;
  id v14 = v9;
  id v106 = v14;
  id v15 = v8;
  id v107 = v15;
  id v16 = v11;
  id v108 = v16;
  uint64_t v17 = v110;
  obuint64_t j = v110[5];
  [(PLJournal *)v62 enumeratePayloadsUsingBlock:v105 error:&obj];
  objc_storeStrong(v17 + 5, obj);
  if ([v15 hasChanges])
  {
    __int16 v18 = v110;
    id v103 = v110[5];
    char v19 = [v15 save:&v103];
    objc_storeStrong(v18 + 5, v103);
    if ((v19 & 1) == 0)
    {
      uint64_t v20 = PLMigrationGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = v110[5];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v21;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Rebuild: unable to save moc during volume creation. Data loss may occur. (%@)", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  [(PLRebuildJournalManager *)self _replayFromCurrentHistoryToken];
  if ([v14 isCancelled])
  {
    id v22 = PLMigrationGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Early return from journal re-create assets due to progress cancel", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v25 = [PLJournal alloc];
    v26 = [(PLJournalManagerCore *)self->_journalManager baseURL];
    v61 = [(PLJournal *)v25 initWithBaseURL:v26 payloadClass:objc_opt_class()];

    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_105;
    v98[3] = &unk_1E5872BA8;
    id v27 = v14;
    id v99 = v27;
    id v28 = v15;
    id v100 = v28;
    id v22 = v23;
    uint64_t v101 = v22;
    id v59 = v24;
    id v102 = v59;
    v29 = v110;
    id v97 = v110[5];
    [(PLJournal *)v61 enumeratePayloadsUsingBlock:v98 error:&v97];
    objc_storeStrong(v29 + 5, v97);
    if ([v28 hasChanges])
    {
      BOOL v30 = v110;
      id v96 = v110[5];
      char v31 = [v28 save:&v96];
      objc_storeStrong(v30 + 5, v96);
      if ((v31 & 1) == 0)
      {
        long long v32 = PLMigrationGetLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          id v33 = v110[5];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v33;
          _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Rebuild: unable to save moc during keyword creation. Data loss may occur. (%@)", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    [(PLRebuildJournalManager *)self _replayFromCurrentHistoryToken];
    if ([v27 isCancelled])
    {
      id v34 = PLMigrationGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Early return from journal re-create assets due to progress cancel", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      id v35 = 0;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v116 = 0x3032000000;
      id v117 = __Block_byref_object_copy__104307;
      v118 = __Block_byref_object_dispose__104308;
      if (v60) {
        id v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      }
      id v119 = v35;
      v95[0] = 0;
      v95[1] = v95;
      v95[2] = 0x2020000000;
      v95[3] = 0;
      v94[0] = 0;
      v94[1] = v94;
      v94[2] = 0x2020000000;
      v94[3] = 0;
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_108;
      v93[3] = &unk_1E5872BD0;
      v93[4] = v95;
      v93[5] = v94;
      uint32_t v58 = (void (**)(void))MEMORY[0x19F38D650](v93);
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_2;
      v87[3] = &unk_1E5872BF8;
      id v36 = v28;
      BOOL v91 = &v109;
      id v88 = v36;
      id v89 = self;
      id v37 = v27;
      id v90 = v37;
      p_long long buf = &buf;
      id v56 = (void *)MEMORY[0x19F38D650](v87);
      v58[2]();
      id v55 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
      id v39 = [WeakRetained pathManager];
      uint64_t v54 = PLLibraryIDFromPathManager();

      id v40 = objc_alloc_init(PLResourceDataStoreOptions);
      [(PLResourceDataStoreOptions *)v40 setAssumeNoExistingResources:0];
      v53 = v40;
      uint64_t v41 = [PLJournal alloc];
      id v42 = [(PLJournalManagerCore *)self->_journalManager baseURL];
      os_log_type_t v57 = [(PLJournal *)v41 initWithBaseURL:v42 payloadClass:objc_opt_class()];

      uint64_t v43 = [(PLJournal *)v57 countOfInsertEntriesWithError:0];
      v52 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:parent:pendingUnitCount:", v43, v37, objc_msgSend(v37, "totalUnitCount"));
      if ([v37 isCancelled])
      {
        BOOL v44 = PLMigrationGetLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v83 = 0;
          _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_ERROR, "Early return from journal re-create assets due to progress cancel", v83, 2u);
        }
      }
      else
      {
        *(void *)uint64_t v83 = 0;
        v84 = v83;
        uint64_t v85 = 0x2020000000;
        char v86 = 0;
        uint64_t v45 = [v36 photoLibrary];
        char v46 = [v45 isCloudPhotoLibraryEnabled];

        char v86 = v46;
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_112;
        v64[3] = &unk_1E5872C20;
        id v65 = v37;
        id v47 = v36;
        id v66 = v47;
        char v81 = v60 & 1;
        id v67 = v57;
        long long v76 = &buf;
        id v68 = v59;
        id v48 = v55;
        long long v77 = v83;
        id v69 = v48;
        id v70 = self;
        char v82 = v60;
        v71 = v53;
        id v72 = v54;
        id v78 = &v109;
        id v49 = v52;
        id v73 = v49;
        id v79 = v95;
        long long v80 = v94;
        id v50 = v56;
        id v74 = v50;
        BOOL v75 = v58;
        id v51 = v110;
        id v63 = v110[5];
        [(PLJournal *)v67 enumeratePayloadsUsingBlock:v64 error:&v63];
        objc_storeStrong(v51 + 5, v63);
        (*((void (**)(id, id))v50 + 2))(v50, v48);
        objc_msgSend(v49, "setCompletedUnitCount:", objc_msgSend(v49, "totalUnitCount"));
        [v47 setChangeSource:0];

        _Block_object_dispose(v83, 8);
      }

      _Block_object_dispose(v94, 8);
      _Block_object_dispose(v95, 8);
      _Block_object_dispose(&buf, 8);
    }
  }

  _Block_object_dispose(&v109, 8);
}

void __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    int v6 = PLMigrationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Will abort volume journal enumeration due to progress cancel", v13, 2u);
    }

    *a3 = 1;
  }
  else
  {
    id v7 = [v5 payloadID];
    id v8 = [v7 payloadIDString];
    id v9 = +[PLFileSystemVolume volumeForObjectUUID:v8 context:*(void *)(a1 + 40)];

    if (!v9)
    {
      id v10 = (id)[v5 insertFileSystemVolumeFromDataInManagedObjectContext:*(void *)(a1 + 40)];
      id v11 = *(void **)(a1 + 48);
      char v12 = [v5 payloadID];
      [v11 addObject:v12];
    }
  }
}

void __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_105(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (![*(id *)(a1 + 32) isCancelled])
  {
    id v7 = [v5 title];
    id v8 = +[PLManagedKeyword keywordForTitle:v7 context:*(void *)(a1 + 40)];

    if (v8)
    {
      id v9 = [v8 uuid];
      id v10 = [v5 payloadID];
      id v11 = [v10 payloadIDString];
      char v12 = [v9 isEqualToString:v11];

      if (v12)
      {
LABEL_12:

        goto LABEL_13;
      }
      id v13 = PLMigrationGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v8 title];
        id v15 = [v5 payloadID];
        id v16 = [v8 uuid];
        int v23 = 138412802;
        id v24 = v14;
        __int16 v25 = 2112;
        v26 = v15;
        __int16 v27 = 2112;
        id v28 = v16;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Rebuild: remapping uuid for keyword %@, %@ -> %@", (uint8_t *)&v23, 0x20u);
      }
      uint64_t v17 = [v8 uuid];
      __int16 v18 = *(void **)(a1 + 56);
      char v19 = [v5 payloadID];
      uint64_t v20 = [v19 payloadIDString];
      [v18 setObject:v17 forKeyedSubscript:v20];
    }
    else
    {
      id v21 = (id)[v5 insertKeywordFromDataInManagedObjectContext:*(void *)(a1 + 40)];
      id v22 = *(void **)(a1 + 48);
      uint64_t v17 = [v5 payloadID];
      [v22 addObject:v17];
    }

    goto LABEL_12;
  }
  int v6 = PLMigrationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Will abort keyword journal enumeration due to progress cancel", (uint8_t *)&v23, 2u);
  }

  *a3 = 1;
LABEL_13:
}

uint64_t __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_108(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t result = arc4random_uniform(0xAu);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (result + 20);
  return result;
}

void __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) hasChanges])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    obuint64_t j = *(id *)(v3 + 40);
    char v4 = [v2 save:&obj];
    objc_storeStrong((id *)(v3 + 40), obj);
    if ((v4 & 1) == 0)
    {
      id v5 = PLMigrationGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v12 = v6;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Rebuild: unable to save moc during asset creation. Data loss may occur. (%@)", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) refreshAllObjects];
  [*(id *)(a1 + 40) _replayFromCurrentHistoryToken];
  if ([*(id *)(a1 + 48) isCancelled])
  {
    id v7 = PLMigrationGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Skipping replay from current history token due to progress cancel", buf, 2u);
    }
  }
  else if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    id v8 = PLMigrationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v12 = v9;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "LegacyMigrationRecoveryFix: Ignored assets due to missing resource data: [%@]", buf, 0xCu);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeAllObjects];
  }
}

void __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_112(uint64_t a1, void *a2, unsigned char *a3)
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v6 = PLMigrationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Will abort asset journal enumeration due to progress cancel", buf, 2u);
    }

    *a3 = 1;
  }
  else
  {
    id v7 = [v5 payloadID];
    id v8 = [v7 payloadIDString];
    uint64_t v9 = +[PLManagedAsset assetWithUUID:v8 inManagedObjectContext:*(void *)(a1 + 40)];

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 96), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 96), "completedUnitCount") + 1);
    }
    else
    {
      id v10 = [v5 resources];
      id v11 = v10;
      if (*(unsigned char *)(a1 + 160) && ![v10 count])
      {
        id v40 = [PLJournalEntry alloc];
        uint64_t v41 = [v5 payloadID];
        id v18 = [(PLJournalEntry *)v40 initForDeleteWithPayloadID:v41 payloadClass:objc_opt_class()];

        id v42 = *(void **)(a1 + 48);
        v57[0] = v18;
        uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
        id v52 = 0;
        char v44 = [v42 appendChangeEntries:v43 error:&v52];
        id v12 = v52;

        if (v44)
        {
          uint64_t v45 = *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
          char v46 = [v5 payloadID];
          id v47 = [v46 payloadIDString];
          [v45 addObject:v47];
        }
        else
        {
          char v46 = PLMigrationGetLog();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            id v54 = v5;
            __int16 v55 = 2112;
            id v56 = v12;
            _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_ERROR, "Rebuild: Failed to add deletion change for invalid recovery asset for payload %@: %@", buf, 0x16u);
          }
        }

        uint64_t v9 = 0;
      }
      else
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v9 = [v5 insertAssetFromDataInManagedObjectContext:*(void *)(a1 + 40) keywordUUIDRemapping:*(void *)(a1 + 56) rawPayloadAttributesToUpdate:v12];
        uint64_t v13 = *(void **)(a1 + 64);
        id v14 = [v5 payloadID];
        [v13 addObject:v14];

        id v15 = *(void **)(a1 + 48);
        id v16 = [v5 payloadID];
        id v51 = 0;
        char v17 = [v15 appendUpdatePayloadWithPayloadID:v16 rawAttributes:v12 error:&v51];
        id v18 = v51;

        if ((v17 & 1) == 0)
        {
          char v19 = PLMigrationGetLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            uint64_t v20 = [v5 payloadID];
            *(_DWORD *)long long buf = 138543618;
            id v54 = v20;
            __int16 v55 = 2112;
            id v56 = v18;
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Rebuild: Failed to add reupdate change for inserted asset for payload ID %{public}@ %@", buf, 0x16u);
          }
        }
        uint64_t v21 = *(void *)(*(void *)(a1 + 128) + 8);
        if (*(unsigned char *)(v21 + 24))
        {
          id v22 = [*(id *)(a1 + 40) photoLibrary];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = [v22 isCloudPhotoLibraryEnabled];
        }
        else
        {
          *(unsigned char *)(v21 + 24) = 0;
        }
        LOBYTE(v48) = *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24);
        if ([*(id *)(a1 + 72) _recreateResourcesForAsset:v9 withPayload:v5 resources:v11 recreateOptions:*(unsigned __int8 *)(a1 + 161) storeOptions:*(void *)(a1 + 80) libraryID:*(void *)(a1 + 88) isCPLEnabled:v48])
        {
          if ([v9 deferredProcessingNeeded])
          {
            id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 72) + 8));
            id v24 = [WeakRetained backgroundJobService];
            __int16 v25 = [*(id *)(a1 + 40) photoLibrary];
            [v24 signalBackgroundProcessingNeededOnLibrary:v25];
          }
          v26 = [*(id *)(a1 + 40) photoLibrary];
          __int16 v27 = [v26 thumbnailManager];
          id v28 = [v27 thumbnailJPEGPathForPhoto:v9];

          uint64_t v29 = [MEMORY[0x1E4F28CB8] defaultManager];
          LODWORD(v27) = [v29 fileExistsAtPath:v28];

          if (v27
            && (BOOL v30 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v28]) != 0
            && (DCIM_newPLImageWithStoredJPEGData(),
                id v50 = objc_claimAutoreleasedReturnValue(),
                v30,
                v50))
          {
            char v31 = [*(id *)(a1 + 40) photoLibrary];
            objc_msgSend(v9, "setEffectiveThumbnailIndex:", +[PLThumbnailIndexes nextAvailableThumbnailIndexInLibrary:](PLThumbnailIndexes, "nextAvailableThumbnailIndexInLibrary:", v31));

            long long v32 = [PLImageContainer alloc];
            id v33 = DCIM_storedJPEGDataFromImage();
            id v34 = [(id)*MEMORY[0x1E4F44410] identifier];
            id v35 = [(PLImageContainer *)v32 initWithPLImage:v50 backingData:v33 uniformTypeIdentifier:v34 auxiliaryImageRecords:0];

            id v36 = [*(id *)(a1 + 40) photoLibrary];
            id v37 = [v36 thumbnailManager];
            [v37 setThumbnailsForAsset:v9 withImage:v35];
          }
          else
          {
            LOBYTE(v49) = 0;
            [v9 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:0 imageData:0 metadata:0 forceSRGBConversion:0 saveCameraPreviewWellImage:v49];
          }

          if (++*(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) > *(void *)(*(void *)(*(void *)(a1 + 152) + 8)
                                                                                          + 24))
          {
            (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
            [*(id *)(a1 + 64) removeAllObjects];
            objc_msgSend(*(id *)(a1 + 96), "setCompletedUnitCount:", *(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 24)+ objc_msgSend(*(id *)(a1 + 96), "completedUnitCount"));
            (*(void (**)(void))(*(void *)(a1 + 112) + 16))();
          }
        }
        else
        {
          v38 = PLMigrationGetLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            id v39 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
            *(_DWORD *)long long buf = 138412546;
            id v54 = v5;
            __int16 v55 = 2112;
            id v56 = v39;
            _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Rebuild: (Asset) Failed to create resources for asset payload %@: %@", buf, 0x16u);
          }

          [v9 deleteFromDatabaseOnly];
          objc_msgSend(*(id *)(a1 + 96), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 96), "completedUnitCount") + 1);
        }
      }
    }
  }
}

- (BOOL)_recreateResourcesForAsset:(id)a3 withPayload:(id)a4 resources:(id)a5 recreateOptions:(unsigned __int8)a6 storeOptions:(id)a7 libraryID:(id)a8 isCPLEnabled:(BOOL)a9
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v40 = a7;
  id v39 = a8;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    id v35 = v14;
    id v38 = v13;
    id v18 = 0;
    id v19 = 0;
    uint64_t v37 = *(void *)v45;
    while (2)
    {
      uint64_t v20 = 0;
      uint64_t v21 = v18;
      id v22 = v19;
      do
      {
        if (*(void *)v45 != v37) {
          objc_enumerationMutation(obj);
        }
        int v23 = *(void **)(*((void *)&v44 + 1) + 8 * v20);
        id v24 = objc_msgSend(v23, "validatedExternalResourceWithAsset:isCPLEnabled:", v38, a9, v35);
        __int16 v25 = +[PLResourceDataStoreManager storeForExternalResource:v24 inLibraryWithID:v39];
        id v42 = v21;
        id v43 = v22;
        char v26 = [v25 storeExternalResource:v24 forAsset:v38 options:v40 error:&v43 resultingResource:&v42];
        id v19 = v43;

        id v18 = v42;
        if ((v26 & 1) == 0)
        {

          BOOL v27 = 0;
          goto LABEL_11;
        }
        [v23 updateStoredResource:v18];

        ++v20;
        uint64_t v21 = v18;
        id v22 = v19;
      }
      while (v17 != v20);
      uint64_t v17 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v17) {
        continue;
      }
      break;
    }
    BOOL v27 = 1;
LABEL_11:
    id v13 = v38;
    id v14 = v35;
  }
  else
  {
    id v18 = 0;
    id v19 = 0;
    BOOL v27 = 1;
  }

  if (([v13 isPhotoIris] & 1) != 0 || objc_msgSend(v13, "isVideo"))
  {
    id v28 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v29 = [v13 pathForLocalVideoKeyFrame];
    id v41 = 0;
    char v30 = [v28 removeItemAtPath:v29 error:&v41];
    id v31 = v41;

    if ((v30 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
    {
      long long v32 = PLMigrationGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v33 = [v14 payloadID];
        *(_DWORD *)long long buf = 138543618;
        uint64_t v49 = v33;
        __int16 v50 = 2112;
        id v51 = v31;
        _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Rebuild: failed to remove unnecessary file for payload ID %{public}@ %@", buf, 0x16u);
      }
    }
  }
  return v27;
}

- (void)recreateNonAssetsInManagedObjectContext:(id)a3 progress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 photoLibrary];
  uint64_t v9 = [v8 libraryID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  id v11 = [WeakRetained pathManager];
  id v12 = PLLibraryIDFromPathManager();
  char v13 = [v9 isEqual:v12];

  if (v13)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PLRebuildJournalManager_recreateNonAssetsInManagedObjectContext_progress___block_invoke;
    block[3] = &unk_1E5873A50;
    block[4] = self;
    id v19 = v6;
    id v20 = v7;
    id v15 = v7;
    id v16 = v6;
    dispatch_sync(queue, block);
  }
  else
  {
    [v6 photoLibrary];
    [(id)objc_claimAutoreleasedReturnValue() libraryID];
    objc_claimAutoreleasedReturnValue();
    [objc_loadWeakRetained((id *)&self->_lsm) pathManager];
    objc_claimAutoreleasedReturnValue();
    PLLibraryIDFromPathManager();
    objc_claimAutoreleasedReturnValue();
    uint64_t v17 = (void *)_PFAssertFailHandler();
    __76__PLRebuildJournalManager_recreateNonAssetsInManagedObjectContext_progress___block_invoke(v17);
  }
}

void __76__PLRebuildJournalManager_recreateNonAssetsInManagedObjectContext_progress___block_invoke(void *a1)
{
  if (*(_WORD *)(a1[4] + 48) == 3)
  {
    uint64_t v1 = a1[5];
    uint64_t v2 = a1[6];
    uint64_t v3 = (void *)a1[4];
    [v3 _recreateNonAssetsInManagedObjectContext:v1 progress:v2];
  }
  else
  {
    char v4 = (PLRebuildJournalManager *)_PFAssertFailHandler();
    [(PLRebuildJournalManager *)v4 recreateAssetsInManagedObjectContext:v6 options:v7 progress:v8];
  }
}

- (void)recreateAssetsInManagedObjectContext:(id)a3 options:(unsigned __int8)a4 progress:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 photoLibrary];
  id v10 = [v9 libraryID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  id v12 = [WeakRetained pathManager];
  char v13 = PLLibraryIDFromPathManager();
  char v14 = [v10 isEqual:v13];

  if (v14)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__PLRebuildJournalManager_recreateAssetsInManagedObjectContext_options_progress___block_invoke;
    block[3] = &unk_1E5873988;
    block[4] = self;
    id v21 = v7;
    unsigned __int8 v23 = a4;
    id v22 = v8;
    id v16 = v8;
    id v17 = v7;
    dispatch_sync(queue, block);
  }
  else
  {
    [v7 photoLibrary];
    [(id)objc_claimAutoreleasedReturnValue() libraryID];
    objc_claimAutoreleasedReturnValue();
    [objc_loadWeakRetained((id *)&self->_lsm) pathManager];
    objc_claimAutoreleasedReturnValue();
    PLLibraryIDFromPathManager();
    objc_claimAutoreleasedReturnValue();
    uint64_t v18 = _PFAssertFailHandler();
    __81__PLRebuildJournalManager_recreateAssetsInManagedObjectContext_options_progress___block_invoke(v18);
  }
}

void __81__PLRebuildJournalManager_recreateAssetsInManagedObjectContext_options_progress___block_invoke(uint64_t a1)
{
  if (*(_WORD *)(*(void *)(a1 + 32) + 48) == 3)
  {
    uint64_t v1 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    char v4 = *(void **)(a1 + 32);
    [v4 _recreateAssetsInManagedObjectContext:v2 options:v1 progress:v3];
  }
  else
  {
    SEL v5 = (PLRebuildJournalManager *)_PFAssertFailHandler();
    [(PLRebuildJournalManager *)v5 recreateAllObjectsInManagedObjectContext:v7 options:v8];
  }
}

- (void)recreateAllObjectsInManagedObjectContext:(id)a3 options:(unsigned __int8)a4
{
  id v6 = a3;
  id v7 = [v6 photoLibrary];
  unsigned __int8 v8 = [v7 libraryID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  id v10 = [WeakRetained pathManager];
  id v11 = PLLibraryIDFromPathManager();
  char v12 = [v8 isEqual:v11];

  if (v12)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PLRebuildJournalManager_recreateAllObjectsInManagedObjectContext_options___block_invoke;
    block[3] = &unk_1E5874318;
    block[4] = self;
    id v17 = v6;
    unsigned __int8 v18 = a4;
    id v14 = v6;
    dispatch_sync(queue, block);
  }
  else
  {
    [v6 photoLibrary];
    [(id)objc_claimAutoreleasedReturnValue() libraryID];
    objc_claimAutoreleasedReturnValue();
    [objc_loadWeakRetained((id *)&self->_lsm) pathManager];
    objc_claimAutoreleasedReturnValue();
    PLLibraryIDFromPathManager();
    objc_claimAutoreleasedReturnValue();
    uint64_t v15 = _PFAssertFailHandler();
    __76__PLRebuildJournalManager_recreateAllObjectsInManagedObjectContext_options___block_invoke(v15);
  }
}

uint64_t __76__PLRebuildJournalManager_recreateAllObjectsInManagedObjectContext_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(_WORD **)(a1 + 32);
  if (v2[24] == 3)
  {
    [v2 _recreateAssetsInManagedObjectContext:*(void *)(a1 + 40) options:*(unsigned __int8 *)(a1 + 48) progress:0];
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _recreateNonAssetsInManagedObjectContext:v4 progress:0];
  }
  else
  {
    id v6 = (PLRebuildJournalManager *)_PFAssertFailHandler();
    return [(PLRebuildJournalManager *)v6 _replayFromCurrentHistoryToken];
  }
}

- (BOOL)_replayFromCurrentHistoryToken
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__104307;
  id v36 = __Block_byref_object_dispose__104308;
  id v37 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = +[PLConcurrencyLimiter sharedLimiter];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __57__PLRebuildJournalManager__replayFromCurrentHistoryToken__block_invoke;
  v24[3] = &unk_1E5874900;
  char v26 = &v28;
  v24[4] = self;
  id v5 = v3;
  id v25 = v5;
  BOOL v27 = &v32;
  [v4 sync:v24 identifyingBlock:0 library:0];

  if (*((unsigned char *)v29 + 24))
  {
    if ([v5 count])
    {
      float v7 = 10.0;
      if (MEMORY[0x19F38BDA0]())
      {
        unsigned __int8 v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        uint64_t v9 = [v8 objectForKey:@"PLRebuildJournalManagerImmediateCoalesceThreshold"];

        if (v9)
        {
          [v9 floatValue];
          float v7 = *(float *)&v6;
        }
      }
      else
      {
        uint64_t v9 = 0;
      }
      journalManager = self->_journalManager;
      id v14 = (id *)(v33 + 5);
      obuint64_t j = (id)v33[5];
      *(float *)&double v6 = v7;
      BOOL v15 = [(PLJournalManager *)journalManager coalesceJournalsForPayloadClassIDs:v5 withChangeJournalOverThreshold:&obj error:v6];
      objc_storeStrong(v14, obj);
      if (!v15)
      {
        id v16 = PLMigrationGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = [(PLJournalManagerCore *)self->_journalManager name];
          uint64_t v18 = v33[5];
          *(_DWORD *)long long buf = 138544130;
          id v39 = v17;
          __int16 v40 = 2114;
          id v41 = v5;
          __int16 v42 = 2048;
          double v43 = v7;
          __int16 v44 = 2112;
          uint64_t v45 = v18;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: Error attempting to coalesce journals for payloadClassIDs [%{public}@] with a threshold over %f: %@", buf, 0x2Au);
        }
      }
LABEL_18:
    }
  }
  else
  {
    if ([(id)v33[5] code] != 51009)
    {
      uint64_t v9 = PLMigrationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v19 = [(PLJournalManagerCore *)self->_journalManager name];
        id v20 = (void *)v33[5];
        *(_DWORD *)long long buf = 138543618;
        id v39 = v19;
        __int16 v40 = 2112;
        id v41 = v20;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: Error replaying history: %@", buf, 0x16u);
      }
      goto LABEL_18;
    }
    id v10 = PLMigrationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [(PLJournalManagerCore *)self->_journalManager name];
      char v12 = (void *)v33[5];
      *(_DWORD *)long long buf = 138543618;
      id v39 = v11;
      __int16 v40 = 2112;
      id v41 = v12;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: History token not found in history, removing token and re-starting: %@", buf, 0x16u);
    }
    [(PLJournalManager *)self->_journalManager clearHistoryToken];
    if (self->_state == 2)
    {
      dispatch_group_enter((dispatch_group_t)self->_startupWaitGroup);
      [(PLRebuildJournalManager *)self _start];
    }
  }
  BOOL v21 = *((unsigned char *)v29 + 24) != 0;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v21;
}

void __57__PLRebuildJournalManager__replayFromCurrentHistoryToken__block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = (void *)v2[2];
  uint64_t v4 = (void *)[v2 _newTransientContext];
  uint64_t v5 = a1[5];
  uint64_t v6 = *(void *)(a1[7] + 8);
  obuint64_t j = *(id *)(v6 + 40);
  LOBYTE(v3) = [v3 replayFromCurrentHistoryTokenWithManagedObjectContext:v4 updatedPayloadClassIDs:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v3;
}

- (id)_newTransientContext
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
  uint64_t v4 = (void *)MEMORY[0x1E4F8B908];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  uint64_t v6 = [WeakRetained pathManager];
  float v7 = [v6 libraryURL];
  unsigned __int8 v8 = [v4 redactedDescriptionForFileURL:v7];

  uint64_t v9 = NSString;
  id v10 = [(PLJournalManagerCore *)self->_journalManager name];
  id v11 = [v9 stringWithFormat:@"JournalManager[%@] transient context (%@)", v10, v8];
  [v3 setName:v11];

  id v12 = objc_loadWeakRetained((id *)&self->_lsm);
  char v13 = [v12 persistentStoreCoordinator];
  [v3 setPersistentStoreCoordinator:v13];

  [v3 setStalenessInterval:0.0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__PLRebuildJournalManager__newTransientContext__block_invoke;
  v17[3] = &unk_1E5875E18;
  id v14 = v3;
  id v18 = v14;
  id v19 = self;
  [v14 performBlockAndWait:v17];
  id v15 = v14;

  return v15;
}

void __47__PLRebuildJournalManager__newTransientContext__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v3 = [WeakRetained pathManager];
  uint64_t v4 = [*(id *)(a1 + 32) userInfo];
  [v4 setObject:v3 forKeyedSubscript:@"com.apple.photos.PLModelMigratorPathManagerKey"];

  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  uint64_t v5 = [v8 libraryBundle];
  uint64_t v6 = [v5 graphCache];
  float v7 = [*(id *)(a1 + 32) userInfo];
  [v7 setObject:v6 forKeyedSubscript:@"com.apple.photos.PLMigrationGraphCacheKey"];
}

- (BOOL)_coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (self->_state == 2)
  {
    journalManager = self->_journalManager;
    id v22 = 0;
    *(float *)&double v9 = a4;
    BOOL v11 = [(PLJournalManager *)journalManager coalesceJournalsForPayloadClassIDs:v8 withChangeJournalOverThreshold:&v22 error:v9];
    id v12 = v22;
    if (v11)
    {
      BOOL v13 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"unable to coalesce journals in manager state: %d", self->_state);
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F8C500];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = v14;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v18 = [v15 errorWithDomain:v16 code:51008 userInfo:v17];

    id v19 = PLMigrationGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = [(PLJournalManagerCore *)self->_journalManager name];
      *(_DWORD *)long long buf = 138543618;
      id v24 = v20;
      __int16 v25 = 2112;
      char v26 = v14;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: %@", buf, 0x16u);
    }
    id v12 = v18;
  }
  if (a5)
  {
    id v12 = v12;
    BOOL v13 = 0;
    *a5 = v12;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_10:

  return v13;
}

- (BOOL)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unsigned __int8 v23 = __Block_byref_object_copy__104307;
  id v24 = __Block_byref_object_dispose__104308;
  id v25 = 0;
  dispatch_group_wait((dispatch_group_t)self->_startupWaitGroup, 0xFFFFFFFFFFFFFFFFLL);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PLRebuildJournalManager_coalesceJournalsForPayloadClassIDs_withChangeJournalOverThreshold_error___block_invoke;
  block[3] = &unk_1E5872B48;
  id v17 = &v26;
  block[4] = self;
  id v10 = v8;
  float v19 = a4;
  id v16 = v10;
  id v18 = &v20;
  dispatch_sync(queue, block);
  LODWORD(queue) = *((unsigned __int8 *)v27 + 24);
  id v11 = (id)v21[5];
  id v12 = v11;
  if (!queue && a5) {
    *a5 = v11;
  }

  char v13 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v13;
}

void __99__PLRebuildJournalManager_coalesceJournalsForPayloadClassIDs_withChangeJournalOverThreshold_error___block_invoke(uint64_t a1, double a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  LODWORD(a2) = *(_DWORD *)(a1 + 64);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  obuint64_t j = *(id *)(v5 + 40);
  char v6 = [v3 _coalesceJournalsForPayloadClassIDs:v4 withChangeJournalOverThreshold:&obj error:a2];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
}

- (void)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  startupWaitGroup = self->_startupWaitGroup;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __111__PLRebuildJournalManager_coalesceJournalsForPayloadClassIDs_withChangeJournalOverThreshold_completionHandler___block_invoke;
  v14[3] = &unk_1E5872B20;
  v14[4] = self;
  id v15 = v8;
  float v17 = a4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_group_notify(startupWaitGroup, queue, v14);
}

uint64_t __111__PLRebuildJournalManager_coalesceJournalsForPayloadClassIDs_withChangeJournalOverThreshold_completionHandler___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 56);
  [*(id *)(a1 + 32) _coalesceJournalsForPayloadClassIDs:*(void *)(a1 + 40) withChangeJournalOverThreshold:0 error:a2];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (BOOL)_performSnapshotForPayloadClassIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  float v7 = +[PLConcurrencyLimiter sharedLimiter];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PLRebuildJournalManager__performSnapshotForPayloadClassIDs_error___block_invoke;
  v10[3] = &unk_1E5873DC0;
  id v8 = v6;
  id v11 = v8;
  id v12 = self;
  id v13 = &v15;
  id v14 = a4;
  [v7 sync:v10 identifyingBlock:0 library:0];

  LOBYTE(a4) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)a4;
}

void __68__PLRebuildJournalManager__performSnapshotForPayloadClassIDs_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) count];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = (void *)v3[2];
  if (v2)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v7 = (id)[v3 _newTransientContext];
    char v6 = objc_msgSend(v4, "performPartialSnapshotForPayloadClassIDs:append:createOnlyIfNecessary:withManagedObjectContext:error:", v5, 1, 0);
  }
  else
  {
    id v7 = (id)[v3 _newTransientContext];
    char v6 = objc_msgSend(v4, "performFullSnapshotAppend:createOnlyIfNecessary:withManagedObjectContext:error:", 1, 0);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
}

- (BOOL)_performSnapshotIfNecessaryWithError:(id *)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  uint64_t v5 = +[PLConcurrencyLimiter sharedLimiter];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PLRebuildJournalManager__performSnapshotIfNecessaryWithError___block_invoke;
  v7[3] = &unk_1E5873ED8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  [v5 sync:v7 identifyingBlock:0 library:0];

  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

void __64__PLRebuildJournalManager__performSnapshotIfNecessaryWithError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = (void *)v2[2];
  id v4 = (id)[v2 _newTransientContext];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v3 performSnapshotIfNecessaryAppend:1 withManagedObjectContext:v4 error:a1[6]];
}

- (BOOL)_snapshotJournalsForPayloadClassIDs:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_state == 2)
  {
    id v18 = 0;
    BOOL v7 = [(PLRebuildJournalManager *)self _performSnapshotForPayloadClassIDs:v6 error:&v18];
    id v8 = v18;
  }
  else
  {
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"unable to request snapshot in manager state: %d", self->_state);
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F8C500];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = v9;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v8 = [v10 errorWithDomain:v11 code:51008 userInfo:v12];

    id v13 = PLMigrationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = [(PLJournalManagerCore *)self->_journalManager name];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: %@", buf, 0x16u);
    }
    BOOL v7 = 0;
  }
  [(PLJournalManager *)self->_journalManager clearIgnoreHistoryDuringSnapshot];
  id v15 = v8;
  id v16 = v15;
  if (!v7 && a4) {
    *a4 = v15;
  }

  return v7;
}

- (void)_snapshotJournalsIgnoreHistoreIfNecessaryForPayloadClassIDs:(id)a3
{
  if (![a3 count])
  {
    journalManager = self->_journalManager;
    [(PLJournalManager *)journalManager setIgnoreHistoryDuringSnapshot];
  }
}

- (BOOL)snapshotJournalsForPayloadClassIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__104307;
  __int16 v21 = __Block_byref_object_dispose__104308;
  id v22 = 0;
  [(PLRebuildJournalManager *)self _snapshotJournalsIgnoreHistoreIfNecessaryForPayloadClassIDs:v6];
  dispatch_group_wait((dispatch_group_t)self->_startupWaitGroup, 0xFFFFFFFFFFFFFFFFLL);
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PLRebuildJournalManager_snapshotJournalsForPayloadClassIDs_error___block_invoke;
  v13[3] = &unk_1E5874900;
  id v15 = &v23;
  v13[4] = self;
  id v8 = v6;
  id v14 = v8;
  id v16 = &v17;
  dispatch_sync(queue, v13);
  LODWORD(queue) = *((unsigned __int8 *)v24 + 24);
  id v9 = (id)v18[5];
  uint64_t v10 = v9;
  if (!queue && a4) {
    *a4 = v9;
  }

  char v11 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v11;
}

void __68__PLRebuildJournalManager_snapshotJournalsForPayloadClassIDs_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  obuint64_t j = *(id *)(v4 + 40);
  char v5 = [v2 _snapshotJournalsForPayloadClassIDs:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (void)snapshotJournalsForPayloadClassIDs:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PLRebuildJournalManager *)self _snapshotJournalsIgnoreHistoreIfNecessaryForPayloadClassIDs:v6];
  queue = self->_queue;
  startupWaitGroup = self->_startupWaitGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PLRebuildJournalManager_snapshotJournalsForPayloadClassIDs_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5874868;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify(startupWaitGroup, queue, block);
}

void __84__PLRebuildJournalManager_snapshotJournalsForPayloadClassIDs_withCompletionHandler___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v6 = 0;
  [v2 _snapshotJournalsForPayloadClassIDs:v3 error:&v6];
  id v4 = v6;
  uint64_t v5 = a1[6];
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  }
}

- (void)_unregisterForChangeHandlingNotifications
{
}

- (void)_handleChangeHandlingNotificationWithTransaction:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__PLRebuildJournalManager__handleChangeHandlingNotificationWithTransaction___block_invoke;
  v7[3] = &unk_1E5875E18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __76__PLRebuildJournalManager__handleChangeHandlingNotificationWithTransaction___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int16 **)(a1 + 32);
  if (v2[24] >= 2u) {
    [v2 _replayFromCurrentHistoryToken];
  }
  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 stillAlive];
}

- (void)_registerForChangeHandlingNotifications
{
  [(PLRebuildJournalManager *)self _unregisterForChangeHandlingNotifications];
  objc_initWeak(&location, self);
  changeHandlingNotificationObserver = self->_changeHandlingNotificationObserver;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__PLRebuildJournalManager__registerForChangeHandlingNotifications__block_invoke;
  v4[3] = &unk_1E5872AF8;
  objc_copyWeak(&v5, &location);
  [(PLChangeHandlingNotificationObserver *)changeHandlingNotificationObserver startObservingRemoteNotificationsWithBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__PLRebuildJournalManager__registerForChangeHandlingNotifications__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleChangeHandlingNotificationWithTransaction:v4];
}

- (void)_retrySnapshot
{
  if (self->_state == 1) {
    [(PLRebuildJournalManager *)self _start];
  }
}

- (void)_start
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(PLJournalManager *)self->_journalManager needsSnapshot])
  {
    self->_state = 1;
    id v13 = 0;
    BOOL v3 = [(PLRebuildJournalManager *)self _performSnapshotIfNecessaryWithError:&v13];
    id v4 = v13;
    if (v3)
    {
      self->_state = 2;
      [(PLRebuildJournalManager *)self _replayFromCurrentHistoryToken];
      dispatch_group_leave((dispatch_group_t)self->_startupWaitGroup);
    }
    else
    {
      id v7 = PLMigrationGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(PLJournalManagerCore *)self->_journalManager name];
        *(_DWORD *)long long buf = 138543874;
        id v15 = v8;
        __int16 v16 = 2048;
        uint64_t v17 = 10;
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: retrying snapshot after %ld seconds, error: %@", buf, 0x20u);
      }
      objc_initWeak((id *)buf, self);
      dispatch_time_t v9 = dispatch_time(0, 10000000000);
      queue = self->_queue;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __33__PLRebuildJournalManager__start__block_invoke;
      v11[3] = &unk_1E5875F08;
      objc_copyWeak(&v12, (id *)buf);
      dispatch_after(v9, queue, v11);
      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    id v5 = PLMigrationGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(PLJournalManagerCore *)self->_journalManager name];
      *(_DWORD *)long long buf = 138543362;
      id v15 = v6;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: started, replaying from history", buf, 0xCu);
    }
    self->_state = 2;
    [(PLRebuildJournalManager *)self _replayFromCurrentHistoryToken];
    dispatch_group_leave((dispatch_group_t)self->_startupWaitGroup);
  }
}

void __33__PLRebuildJournalManager__start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _retrySnapshot];
}

- (void)_startAfterRebuild
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int state = self->_state;
  if (state == 3 || state == 0)
  {
    p_lsm = &self->_lsm;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
    id v7 = [WeakRetained postRunningProgress];
    int v8 = [v7 isCancelled];

    if (v8)
    {
      dispatch_time_t v9 = PLMigrationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [(PLJournalManagerCore *)self->_journalManager name];
        *(_DWORD *)long long buf = 138543362;
        uint64_t v23 = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: postRunningProgress is cancelled. Not retrying _startAfterRebuild.", buf, 0xCu);
      }
    }
    else
    {
      id v11 = objc_loadWeakRetained((id *)p_lsm);
      id v12 = [v11 databaseContext];
      dispatch_time_t v9 = [v12 newShortLivedLibraryWithName:"-[PLRebuildJournalManager _startAfterRebuild]"];

      id v13 = [v9 globalValues];
      LODWORD(v12) = [v13 isRebuildComplete];

      if (v12)
      {
        id v14 = PLMigrationGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [(PLJournalManagerCore *)self->_journalManager name];
          *(_DWORD *)long long buf = 138543362;
          uint64_t v23 = v15;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: starting after rebuild complete", buf, 0xCu);
        }
        [(PLRebuildJournalManager *)self _start];
      }
      else
      {
        self->_int state = 3;
        __int16 v16 = PLMigrationGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [(PLJournalManagerCore *)self->_journalManager name];
          *(_DWORD *)long long buf = 138543618;
          uint64_t v23 = v17;
          __int16 v24 = 2048;
          uint64_t v25 = 10;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: rebuild not complete, retry start after %ld seconds", buf, 0x16u);
        }
        objc_initWeak((id *)buf, self);
        dispatch_time_t v18 = dispatch_time(0, 10000000000);
        queue = self->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __45__PLRebuildJournalManager__startAfterRebuild__block_invoke;
        block[3] = &unk_1E5875F08;
        objc_copyWeak(&v21, (id *)buf);
        dispatch_after(v18, queue, block);
        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
      }
    }
  }
}

void __45__PLRebuildJournalManager__startAfterRebuild__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startAfterRebuild];
}

- (void)notifyRebuildComplete
{
  BOOL v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLRebuildJournalManager notifyRebuildComplete]"];
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PLRebuildJournalManager_notifyRebuildComplete__block_invoke;
  v6[3] = &unk_1E5875E18;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(queue, v6);
}

uint64_t __48__PLRebuildJournalManager_notifyRebuildComplete__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(_WORD **)(a1 + 32);
  if (!v2[24])
  {
    [v2 _registerForChangeHandlingNotifications];
    uint64_t v2 = *(_WORD **)(a1 + 32);
  }
  [v2 _startAfterRebuild];
  BOOL v3 = *(void **)(a1 + 40);
  return [v3 stillAlive];
}

- (void)notifyWillRebuild
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PLRebuildJournalManager_notifyWillRebuild__block_invoke;
  block[3] = &unk_1E5875CE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __44__PLRebuildJournalManager_notifyWillRebuild__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLMigrationGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 16) name];
    int v7 = 138543362;
    int v8 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: notified rebuild starting", (uint8_t *)&v7, 0xCu);
  }
  id v4 = *(_WORD **)(a1 + 32);
  if (v4[24] == 2)
  {
    id v5 = PLMigrationGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(*(void *)(a1 + 32) + 16) name];
      int v7 = 138543362;
      int v8 = v6;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: already started, re-entering wait group", (uint8_t *)&v7, 0xCu);
    }
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  }
  else if (!v4[24])
  {
    [v4 _registerForChangeHandlingNotifications];
  }
  *(_WORD *)(*(void *)(a1 + 32) + 48) = 3;
}

- (void)stop
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  id v4 = [WeakRetained postRunningProgress];
  char v5 = [v4 isCancelled];

  if ((v5 & 1) == 0) {
    dispatch_group_wait((dispatch_group_t)self->_startupWaitGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
  [(PLRebuildJournalManager *)self _unregisterForChangeHandlingNotifications];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PLRebuildJournalManager_stop__block_invoke;
  block[3] = &unk_1E5875CE0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __31__PLRebuildJournalManager_stop__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLMigrationGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 16) name];
    int v4 = 138543362;
    char v5 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: stopping", (uint8_t *)&v4, 0xCu);
  }
}

- (void)start
{
  BOOL v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLRebuildJournalManager start]"];
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__PLRebuildJournalManager_start__block_invoke;
  v6[3] = &unk_1E5875E18;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(queue, v6);
}

uint64_t __32__PLRebuildJournalManager_start__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(_WORD **)(a1 + 32);
  if (!v2[24])
  {
    [v2 _registerForChangeHandlingNotifications];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    int v4 = [WeakRetained databaseContext];
    id v5 = (void *)[v4 newShortLivedLibraryWithName:"-[PLRebuildJournalManager start]_block_invoke"];

    uint64_t v6 = [v5 globalValues];
    LODWORD(v4) = [v6 isRebuildComplete];

    if (v4)
    {
      [*(id *)(a1 + 32) _start];
    }
    else
    {
      id v7 = PLMigrationGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "JournalManager: waiting to be notified of rebuild start", v9, 2u);
      }

      *(_WORD *)(*(void *)(a1 + 32) + 48) = 3;
    }
  }
  return [*(id *)(a1 + 40) stillAlive];
}

- (PLRebuildJournalManager)initWithLibraryServicesManager:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PLRebuildJournalManager;
  id v6 = [(PLRebuildJournalManager *)&v21 init];
  if (v6)
  {
    uint64_t v7 = +[PLJournalManager journalManagerWithClass:objc_opt_class() libraryServiceManager:v5];
    int v8 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v7;

    objc_storeWeak((id *)v6 + 1, v5);
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.assetsd.PLJournalManager.queue", v10);
    id v12 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v11;

    dispatch_group_t v13 = dispatch_group_create();
    id v14 = (void *)*((void *)v6 + 5);
    *((void *)v6 + 5) = v13;

    *((_WORD *)v6 + 24) = 0;
    id v15 = [v5 libraryBundle];

    if (!v15)
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, v6, @"PLRebuildJournalManager.m", 232, @"Invalid parameter not satisfying: %@", @"lsm.libraryBundle" object file lineNumber description];
    }
    __int16 v16 = [v5 libraryBundle];
    uint64_t v17 = [v16 makeChangeHandlingNotificationObserverWithLowPriorityThrottleInterval:4.0];
    dispatch_time_t v18 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v17;

    dispatch_group_enter(*((dispatch_group_t *)v6 + 5));
  }

  return (PLRebuildJournalManager *)v6;
}

+ (BOOL)existingJournalsCompatibleForRebuild:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
  int v8 = [v6 photoDirectoryWithType:8];
  uint64_t v9 = [v7 fileURLWithPath:v8];

  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__104307;
  uint64_t v26 = __Block_byref_object_dispose__104308;
  id v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  id v10 = [a1 payloadClasses];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__PLRebuildJournalManager_existingJournalsCompatibleForRebuild_error___block_invoke;
  v14[3] = &unk_1E5872AD0;
  id v11 = v9;
  id v15 = v11;
  __int16 v16 = &v22;
  uint64_t v17 = &v18;
  [v10 enumerateObjectsUsingBlock:v14];

  if (a4) {
    *a4 = (id) v23[5];
  }
  char v12 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __70__PLRebuildJournalManager_existingJournalsCompatibleForRebuild_error___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [[PLJournal alloc] initWithBaseURL:a1[4] payloadClass:a2];
  uint64_t v8 = *(void *)(a1[5] + 8);
  obuint64_t j = *(id *)(v8 + 40);
  unint64_t v9 = [(PLJournal *)v7 currentPayloadVersionWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9 <= [a2 payloadVersion])
  {
    if (!v9)
    {
      if (PLIsErrorEqualToCode())
      {
        uint64_t v19 = *(void *)(a1[5] + 8);
        uint64_t v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = 0;
      }
      else
      {
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
        *a4 = 1;
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F8C500];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    char v12 = NSString;
    dispatch_group_t v13 = [a2 payloadClassID];
    id v14 = [v12 stringWithFormat:@"Existing journal (%@) too new to perform a rebuild, journal version %lu greater than current version %u", v13, v9, objc_msgSend(a2, "payloadVersion")];
    v23[0] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    uint64_t v16 = [v10 errorWithDomain:v11 code:46006 userInfo:v15];
    uint64_t v17 = *(void *)(a1[5] + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
}

+ (BOOL)assetJournalExists:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [PLJournal alloc];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v8 = [v5 photoDirectoryWithType:8];

  unint64_t v9 = [v7 fileURLWithPath:v8];
  id v10 = [(PLJournal *)v6 initWithBaseURL:v9 payloadClass:objc_opt_class()];

  long long v13 = 0uLL;
  BOOL v11 = [(PLJournal *)v10 snapshotJournalFileSize:(char *)&v13 + 8 changeJournalFileSize:&v13 error:a4]&& v13 != 0;

  return v11;
}

+ (BOOL)isEnabledWithPathManager:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PLRebuildJournalManager.m", 160, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  if ([v7 isUBF])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F8B980];
    unint64_t v9 = [v7 libraryURL];
    uint64_t v10 = [v8 wellKnownPhotoLibraryIdentifierForURL:v9];

    if (v10 != 3)
    {
      BOOL v20 = 1;
      goto LABEL_11;
    }
    BOOL v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F8C500];
    uint64_t v25 = *MEMORY[0x1E4F28228];
    v26[0] = @"Disabled journal for invalid well known library type";
    long long v13 = (void *)MEMORY[0x1E4F1C9E8];
    id v14 = (__CFString **)v26;
    id v15 = &v25;
  }
  else
  {
    BOOL v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F8C500];
    uint64_t v23 = *MEMORY[0x1E4F28228];
    uint64_t v24 = @"Disabled journal for unsupported DCIM format";
    long long v13 = (void *)MEMORY[0x1E4F1C9E8];
    id v14 = &v24;
    id v15 = &v23;
  }
  uint64_t v16 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
  uint64_t v17 = [v11 errorWithDomain:v12 code:46309 userInfo:v16];

  id v18 = v17;
  uint64_t v19 = v18;
  if (a4) {
    *a4 = v18;
  }

  BOOL v20 = 0;
LABEL_11:

  return v20;
}

+ (id)payloadClasses
{
  v4[14] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  void v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  v4[13] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:14];
  return v2;
}

+ (id)baseURLFromPathManager:(id)a3
{
  if (a3)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CB10];
    int v4 = [a3 photoDirectoryWithType:8];
    id v5 = [v3 fileURLWithPath:v4 isDirectory:1];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)name
{
  return @"Rebuild";
}

@end