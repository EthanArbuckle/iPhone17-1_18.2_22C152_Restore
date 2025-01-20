@interface PLJournalManager
+ (id)journalManagerWithClass:(Class)a3 libraryServiceManager:(id)a4;
- (BOOL)_enumerateJournalEntriesFromHistoryToken:(id)a3 latestHistoryToken:(id *)a4 withManagedObjectContext:(id)a5 journalEntryBlock:(id)a6 shouldStopBlock:(id)a7 error:(id *)a8;
- (BOOL)_needsFullSnapshot;
- (BOOL)_needsPartialSnapshot:(id)a3;
- (BOOL)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 error:(id *)a5;
- (BOOL)needsSnapshot;
- (BOOL)performFullSnapshotAppend:(BOOL)a3 createOnlyIfNecessary:(BOOL)a4 withManagedObjectContext:(id)a5 entryLimitBlock:(id)a6 error:(id *)a7;
- (BOOL)performFullSnapshotAppend:(BOOL)a3 createOnlyIfNecessary:(BOOL)a4 withManagedObjectContext:(id)a5 error:(id *)a6;
- (BOOL)performPartialSnapshotForPayloadClassIDs:(id)a3 append:(BOOL)a4 createOnlyIfNecessary:(BOOL)a5 withManagedObjectContext:(id)a6 error:(id *)a7;
- (BOOL)performSnapshotIfNecessaryAppend:(BOOL)a3 withManagedObjectContext:(id)a4 error:(id *)a5;
- (BOOL)replayFromCurrentHistoryTokenWithManagedObjectContext:(id)a3 updatedPayloadClassIDs:(id)a4 error:(id *)a5;
- (id)_existingObjectWithID:(id)a3 managedObjectContext:(id)a4;
- (id)currentHistoryToken;
- (void)_loadHistoryTokenIfNecessary;
- (void)clearHistoryToken;
- (void)clearIgnoreHistoryDuringSnapshot;
- (void)setIgnoreHistoryDuringSnapshot;
@end

@implementation PLJournalManager

+ (id)journalManagerWithClass:(Class)a3 libraryServiceManager:(id)a4
{
  v6 = [a4 pathManager];
  v7 = [(objc_class *)a3 baseURLFromPathManager:v6];

  id v8 = objc_alloc((Class)a1);
  v9 = [(objc_class *)a3 name];
  v10 = [(objc_class *)a3 payloadClasses];
  v11 = (void *)[v8 initWithName:v9 baseURL:v7 payloadClasses:v10];

  return v11;
}

- (void).cxx_destruct
{
}

- (BOOL)replayFromCurrentHistoryTokenWithManagedObjectContext:(id)a3 updatedPayloadClassIDs:(id)a4 error:(id *)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_ignoreHistoryDuringSnapshot);
  char v66 = v10 & 1;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 1;
  if (*((unsigned char *)v64 + 24))
  {
    v11 = PLMigrationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [(PLJournalManagerCore *)self name];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "JournalManager[%{public}@]: Skipping replay from current history due to ignoreHistoryDuringSnapshot token", (uint8_t *)&buf, 0xCu);
    }
    BOOL v13 = 0;
    *((unsigned char *)v60 + 24) = 0;
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__13817;
    v74 = __Block_byref_object_dispose__13818;
    id v75 = 0;
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x2020000000;
    char v58 = 1;
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__13817;
    v53 = __Block_byref_object_dispose__13818;
    id v54 = 0;
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__13817;
    v47 = __Block_byref_object_dispose__13818;
    id v48 = 0;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke;
    v34[3] = &unk_1E5865228;
    v37 = &v59;
    p_long long buf = &buf;
    v34[4] = self;
    id v35 = v8;
    id v15 = v14;
    id v36 = v15;
    v39 = &v55;
    v40 = &v49;
    v41 = &v63;
    v42 = &v43;
    [v35 performBlockAndWait:v34];
    if (*((unsigned char *)v60 + 24))
    {
      if (*((unsigned char *)v56 + 24))
      {
        if (*(void *)(*((void *)&buf + 1) + 40))
        {
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke_17;
          v32[3] = &unk_1E5865250;
          v32[4] = self;
          id v33 = v9;
          [v15 enumerateKeysAndObjectsUsingBlock:v32];
          v16 = (NSPersistentHistoryToken *)[*(id *)(*((void *)&buf + 1) + 40) copy];
          currentHistoryToken = self->_currentHistoryToken;
          self->_currentHistoryToken = v16;

          uint64_t v18 = *(void *)(*((void *)&buf + 1) + 40);
          v19 = (id *)(v44 + 5);
          id obj = (id)v44[5];
          BOOL v20 = [(PLJournalManagerCore *)self saveHistoryToken:v18 error:&obj];
          objc_storeStrong(v19, obj);
          if (!v20)
          {
            v21 = PLMigrationGetLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v22 = [(PLJournalManagerCore *)self name];
              uint64_t v23 = v44[5];
              *(_DWORD *)v67 = 138543618;
              v68 = v22;
              __int16 v69 = 2112;
              uint64_t v70 = v23;
              _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: history token property list could not be written after appending entries: %@", v67, 0x16u);
            }
            if (a5) {
              *a5 = (id) v44[5];
            }
            *((unsigned char *)v60 + 24) = 0;
          }
        }
      }
      else
      {
        v27 = PLMigrationGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = [(PLJournalManagerCore *)self name];
          uint64_t v29 = v50[5];
          *(_DWORD *)v67 = 138543618;
          v68 = v28;
          __int16 v69 = 2112;
          uint64_t v70 = v29;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: Error writing to journals: %@", v67, 0x16u);
        }
        if (a5) {
          *a5 = (id) v50[5];
        }
        *((unsigned char *)v60 + 24) = 0;
      }
    }
    else
    {
      v24 = PLMigrationGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = [(PLJournalManagerCore *)self name];
        uint64_t v26 = v44[5];
        *(_DWORD *)v67 = 138543618;
        v68 = v25;
        __int16 v69 = 2112;
        uint64_t v70 = v26;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: Error enumerating history: %@", v67, 0x16u);
      }
      if (a5) {
        *a5 = (id) v44[5];
      }
    }

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v49, 8);

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&buf, 8);

    BOOL v13 = *((unsigned char *)v60 + 24) != 0;
  }
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  return v13;
}

void __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 currentHistoryToken];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id v17 = *(id *)(v4 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke_2;
  v13[3] = &unk_1E5865200;
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v14 = v6;
  uint64_t v15 = v7;
  long long v16 = *(_OWORD *)(a1 + 72);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke_3;
  v12[3] = &unk_1E5870888;
  uint64_t v8 = *(void *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 96);
  v12[4] = v7;
  v12[5] = v8;
  uint64_t v10 = *(void *)(v9 + 8);
  id obj = *(id *)(v10 + 40);
  LOBYTE(v2) = [v2 _enumerateJournalEntriesFromHistoryToken:v3 latestHistoryToken:&v17 withManagedObjectContext:v5 journalEntryBlock:v13 shouldStopBlock:v12 error:&obj];
  objc_storeStrong((id *)(v4 + 40), v17);
  objc_storeStrong((id *)(v10 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)v2;
}

void __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v10 = 0;
  char v6 = [a3 finishAppendChangeEntriesWithError:&v10];
  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = PLMigrationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) name];
      *(_DWORD *)long long buf = 138543874;
      v12 = v9;
      __int16 v13 = 2114;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: error finishing append changes to payload: %{public}@, %@", buf, 0x20u);
    }
  }
  [*(id *)(a1 + 40) addObject:v5];
}

void __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  char v6 = objc_msgSend((id)objc_msgSend(v5, "payloadClass"), "payloadClassID");
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if (!v7)
  {
    uint64_t v8 = [PLJournal alloc];
    uint64_t v9 = [*(id *)(a1 + 40) baseURL];
    id v7 = -[PLJournal initWithBaseURL:payloadClass:](v8, "initWithBaseURL:payloadClass:", v9, [v5 payloadClass]);

    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v10 + 40);
    BOOL v11 = [(PLJournal *)v7 prepareForAppendChangeEntriesWithError:&obj];
    objc_storeStrong((id *)(v10 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || ([*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6],
        uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8),
        id v14 = *(id *)(v12 + 40),
        BOOL v13 = [(PLJournal *)v7 appendChangeEntryAfterPrepare:v5 error:&v14],
        objc_storeStrong((id *)(v12 + 40), v14),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13) == 0))
  {
    *a3 = 1;
  }
}

BOOL __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 80));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v1 & 1;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    return 0;
  }
  v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) name];
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: Snapshot requested, stopping processing of change history", (uint8_t *)&v6, 0xCu);
  }
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
}

- (BOOL)_enumerateJournalEntriesFromHistoryToken:(id)a3 latestHistoryToken:(id *)a4 withManagedObjectContext:(id)a5 journalEntryBlock:(id)a6 shouldStopBlock:(id)a7 error:(id *)a8
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v45 = 0;
  uint64_t v18 = +[PLPersistentHistoryTransactionIterator iteratorSinceToken:v14 withManagedObjectObjectContext:v15 error:&v45];
  id v19 = v45;
  BOOL v20 = v19;
  if (v18)
  {
    id v21 = v19;
LABEL_3:
    v22 = objc_alloc_init(PLPersistentHistoryTransactionModifiers);
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __145__PLJournalManager__enumerateJournalEntriesFromHistoryToken_latestHistoryToken_withManagedObjectContext_journalEntryBlock_shouldStopBlock_error___block_invoke;
    id v33 = &unk_1E58651D8;
    uint64_t v23 = v22;
    v34 = v23;
    v39 = &v40;
    id v37 = v17;
    id v35 = self;
    id v36 = v15;
    id v38 = v16;
    [v18 enumerateRemainingTransactionsWithBlock:&v30];
    if (a4 && !*((unsigned char *)v41 + 24))
    {
      objc_msgSend(v18, "lastIteratedToken", v30, v31, v32, v33, v34, v35, v36, v37);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(&v40, 8);
    BOOL v24 = 1;
    goto LABEL_7;
  }
  if ([v19 code] == 134501)
  {
    id v44 = v20;
    uint64_t v18 = +[PLPersistentHistoryTransactionIterator iteratorSinceToken:0 withManagedObjectObjectContext:v15 error:&v44];
    id v21 = v44;

    if (!v18)
    {
      if (!a8)
      {
        BOOL v24 = 0;
        goto LABEL_8;
      }
      uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v50 = *MEMORY[0x1E4F28A50];
      v51[0] = v21;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
      [v26 errorWithDomain:*MEMORY[0x1E4F8C500] code:51011 userInfo:v18];
      BOOL v24 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_3;
  }
  if ([v20 code] != 134301)
  {
    if (a8)
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = *MEMORY[0x1E4F28A50];
      v47 = v20;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      id v28 = [v29 errorWithDomain:*MEMORY[0x1E4F8C500] code:51010 userInfo:v18];
      goto LABEL_18;
    }
LABEL_19:
    BOOL v24 = 0;
    id v21 = v20;
    goto LABEL_8;
  }
  if (!a8) {
    goto LABEL_19;
  }
  v27 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v48 = *MEMORY[0x1E4F28A50];
  uint64_t v49 = v20;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  id v28 = [v27 errorWithDomain:*MEMORY[0x1E4F8C500] code:51009 userInfo:v18];
LABEL_18:
  BOOL v24 = 0;
  *a8 = v28;
  id v21 = v20;
LABEL_7:

LABEL_8:
  return v24;
}

void __145__PLJournalManager__enumerateJournalEntriesFromHistoryToken_latestHistoryToken_withManagedObjectContext_journalEntryBlock_shouldStopBlock_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v55 = a3;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  int v6 = [v4 author];
  [v5 updateFromTransactionAuthor:v6];

  v64 = (void *)a1;
  if ([*(id *)(a1 + 32) changeSource] != 2)
  {
    [v4 changes];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v59 = [obj countByEnumeratingWithState:&v81 objects:v91 count:16];
    if (!v59) {
      goto LABEL_75;
    }
    uint64_t v58 = *(void *)v82;
    id v57 = v4;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v82 != v58) {
        objc_enumerationMutation(obj);
      }
      __int16 v69 = *(void **)(*((void *)&v81 + 1) + 8 * v7);
      uint64_t v8 = (void *)MEMORY[0x19F38D3B0]();
      uint64_t v9 = v64[7];
      if (v9)
      {
        *(unsigned char *)(*(void *)(v64[9] + 8) + 24) = (*(uint64_t (**)(void))(v9 + 16))();
        if (*(unsigned char *)(*(void *)(v64[9] + 8) + 24)) {
          break;
        }
      }
      uint64_t v60 = v7;
      context = v8;
      uint64_t v10 = objc_msgSend(v69, "changedObjectID", v55);
      BOOL v11 = (void *)v64[5];
      uint64_t v12 = [v10 entity];
      BOOL v13 = [v12 name];
      id v14 = [v11 payloadClassesForEntityName:v13];

      id v15 = v64;
      if (!v14)
      {
        if ([v69 changeType] == 1)
        {
          id v16 = (void *)v64[5];
          id v17 = [v10 entity];
          uint64_t v18 = [v17 name];
          id v14 = [v16 payloadClassesForAdditionalEntityName:v18];
        }
        else
        {
          id v14 = 0;
        }
      }
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v19 = v14;
      uint64_t v68 = [v19 countByEnumeratingWithState:&v77 objects:v90 count:16];
      if (v68)
      {
        char v66 = v10;
        uint64_t v67 = *(void *)v78;
        id v65 = v19;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v78 != v67) {
              objc_enumerationMutation(v65);
            }
            id v21 = *(void **)(*((void *)&v77 + 1) + 8 * v20);
            v22 = [v69 updatedProperties];
            uint64_t v23 = [v22 valueForKey:@"name"];
            uint64_t v24 = [v69 changeType];
            if (v24 == 2)
            {
              id v36 = [(id)v15[6] objectWithID:v10];
              id v37 = [v21 payloadAdapterForManagedObject:v36];
              uint64_t v42 = [v69 tombstone];
              v39 = [v37 payloadIDForTombstone:v42];

              if (!v39) {
                goto LABEL_45;
              }
              id v43 = [[PLJournalEntry alloc] initForDeleteWithPayloadID:v39 payloadClass:v21];
LABEL_46:
              id v28 = 0;
              goto LABEL_47;
            }
            if (v24 != 1)
            {
              if (v24)
              {
LABEL_30:
                id v28 = 0;
              }
              else
              {
                v25 = [(id)v15[5] _existingObjectWithID:v10 managedObjectContext:v15[6]];
                uint64_t v26 = [v21 payloadAdapterForManagedObject:v25];
                v27 = [v26 payloadID];
                if (v27)
                {
                  id v28 = [v26 payloadForChangedKeys:0];
                  if (v28)
                  {
                    uint64_t v29 = [[PLJournalEntry alloc] initForInsertWithPayload:v28];
                    (*(void (**)(void))(v15[8] + 16))();
                    if (!*(unsigned char *)(*(void *)(v15[9] + 8) + 24))
                    {
                      uint64_t v30 = [v26 payloadIDsByPayloadClassIDToDeleteOnInsert];
                      v74[0] = MEMORY[0x1E4F143A8];
                      v74[1] = 3221225472;
                      v74[2] = __145__PLJournalManager__enumerateJournalEntriesFromHistoryToken_latestHistoryToken_withManagedObjectContext_journalEntryBlock_shouldStopBlock_error___block_invoke_2;
                      v74[3] = &unk_1E58651B0;
                      v74[4] = v15[5];
                      id v31 = (id)v15[8];
                      uint64_t v32 = v15[9];
                      id v75 = v31;
                      uint64_t v76 = v32;
                      [v30 enumerateKeysAndObjectsUsingBlock:v74];
                    }
                    goto LABEL_37;
                  }
                }
                else if (v25)
                {
                  uint64_t v29 = PLMigrationGetLog();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  {
                    id v44 = [(id)v15[5] name];
                    *(_DWORD *)long long buf = 138543618;
                    v87 = v44;
                    __int16 v88 = 2114;
                    v89 = v66;
                    _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: Skipping payload for insert with nil payloadID for existing object: %{public}@", buf, 0x16u);
                  }
                  id v28 = 0;
LABEL_37:

                  uint64_t v10 = v66;
                }
                else
                {
                  id v28 = 0;
                }
              }
              id v43 = 0;
              goto LABEL_51;
            }
            id v33 = [v10 entity];
            v34 = [v33 name];
            int v35 = [v21 shouldPersistForChangedKeys:v23 entityName:v34];

            if (!v35) {
              goto LABEL_30;
            }
            id v36 = [(id)v15[5] _existingObjectWithID:v10 managedObjectContext:v15[6]];
            id v37 = [v21 payloadAdapterForManagedObject:v36];
            uint64_t v38 = [v37 payloadID];
            if (!v38)
            {
              if (v36)
              {
                id v45 = PLMigrationGetLog();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v46 = [(id)v15[5] name];
                  *(_DWORD *)long long buf = 138543618;
                  v87 = v46;
                  __int16 v88 = 2114;
                  v89 = v66;
                  _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: Skipping payload for insert with nil payloadID for existing object: %{public}@", buf, 0x16u);
                }
              }
              v39 = 0;
LABEL_45:
              id v43 = 0;
              goto LABEL_46;
            }
            v39 = (void *)v38;
            if ([v37 validForPersistenceChangedForChangedKeys:v23])
            {
              id v28 = [v37 payloadForChangedKeys:0];
              uint64_t v40 = [PLJournalEntry alloc];
              if (v28) {
                id v41 = [(PLJournalEntry *)v40 initForInsertWithPayload:v28];
              }
              else {
                id v41 = [(PLJournalEntry *)v40 initForDeleteWithPayloadID:v39 payloadClass:v21];
              }
              goto LABEL_57;
            }
            uint64_t v47 = [v37 payloadForChangedKeys:v23];
            if (v47)
            {
              id v28 = (void *)v47;
              id v41 = [[PLJournalEntry alloc] initForUpdateWithPayload:v47];
LABEL_57:
              id v43 = v41;
              goto LABEL_47;
            }
            uint64_t v48 = [v37 payloadsForChangedKeys:v23];
            long long v70 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            id v62 = v48;
            uint64_t v49 = [v62 countByEnumeratingWithState:&v70 objects:v85 count:16];
            if (v49)
            {
              uint64_t v50 = v49;
              uint64_t v63 = *(void *)v71;
LABEL_60:
              uint64_t v51 = 0;
              while (1)
              {
                if (*(void *)v71 != v63) {
                  objc_enumerationMutation(v62);
                }
                id v52 = [[PLJournalEntry alloc] initForUpdateWithPayload:*(void *)(*((void *)&v70 + 1) + 8 * v51)];
                (*(void (**)(void))(v64[8] + 16))();
                int v53 = *(unsigned __int8 *)(*(void *)(v64[9] + 8) + 24);

                if (v53) {
                  break;
                }
                if (v50 == ++v51)
                {
                  uint64_t v50 = [v62 countByEnumeratingWithState:&v70 objects:v85 count:16];
                  if (v50) {
                    goto LABEL_60;
                  }
                  break;
                }
              }
            }

            id v43 = 0;
            id v28 = 0;
            id v15 = v64;
LABEL_47:

            if (v43)
            {
              (*(void (**)(void))(v15[8] + 16))();
              uint64_t v10 = v66;
              if (*(unsigned char *)(*(void *)(v15[9] + 8) + 24))
              {

                id v19 = v65;
                goto LABEL_68;
              }
            }
            else
            {
              uint64_t v10 = v66;
            }
LABEL_51:

            ++v20;
          }
          while (v20 != v68);
          id v19 = v65;
          uint64_t v54 = [v65 countByEnumeratingWithState:&v77 objects:v90 count:16];
          uint64_t v68 = v54;
        }
        while (v54);
      }
LABEL_68:

      if (*(unsigned char *)(*(void *)(v15[9] + 8) + 24))
      {
        *uint64_t v55 = 1;

        id v4 = v57;
        uint64_t v8 = context;
        goto LABEL_74;
      }

      uint64_t v7 = v60 + 1;
      id v4 = v57;
      if (v60 + 1 == v59)
      {
        uint64_t v59 = [obj countByEnumeratingWithState:&v81 objects:v91 count:16];
        if (!v59) {
          goto LABEL_75;
        }
        goto LABEL_4;
      }
    }
    *uint64_t v55 = 1;
LABEL_74:
LABEL_75:
  }
}

void __145__PLJournalManager__enumerateJournalEntriesFromHistoryToken_latestHistoryToken_withManagedObjectContext_journalEntryBlock_shouldStopBlock_error___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "payloadClassForPayloadClassID:", v7, (void)v16);
        if (v14)
        {
          id v15 = [[PLJournalEntry alloc] initForDeleteWithPayloadID:v13 payloadClass:v14];
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
          {
            *a4 = 1;

            goto LABEL_13;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (id)_existingObjectWithID:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v12 = 0;
  id v7 = [a4 existingObjectWithID:v6 error:&v12];
  id v8 = v12;
  if (!v7 && (PLIsErrorEqualToCode() & 1) == 0)
  {
    uint64_t v9 = PLMigrationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [(PLJournalManagerCore *)self name];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: failed to fetch object with ID %{public}@: %@", buf, 0x20u);
    }
  }

  return v7;
}

- (void)clearIgnoreHistoryDuringSnapshot
{
}

- (void)setIgnoreHistoryDuringSnapshot
{
}

- (BOOL)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 error:(id *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(PLJournalManagerCore *)self baseURL];
  uint64_t v10 = [(PLJournalManagerCore *)self payloadClasses];
  id v44 = 0;
  BOOL v11 = +[PLJournal recoverJournalsIfNecessaryForBaseURL:v9 payloadClasses:v10 error:&v44];
  id v12 = v44;

  if (v11)
  {
    if (![v8 count])
    {
      uint64_t v13 = [(PLJournalManagerCore *)self payloadClassIDs];

      id v8 = (id)v13;
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = v8;
    uint64_t v14 = [v8 countByEnumeratingWithState:&v40 objects:v57 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      v34 = a5;
      uint64_t v16 = *(void *)v41;
      id obj = v8;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v19 = (void *)MEMORY[0x19F38D3B0]();
          uint64_t v20 = [(PLJournalManagerCore *)self payloadClassForPayloadClassID:v18];
          if (v20)
          {
            uint64_t v21 = v20;
            v22 = [PLJournal alloc];
            uint64_t v23 = [(PLJournalManagerCore *)self baseURL];
            uint64_t v24 = [(PLJournal *)v22 initWithBaseURL:v23 payloadClass:v21];

            unint64_t v38 = 0;
            unint64_t v39 = 0;
            id v37 = v12;
            LODWORD(v23) = [(PLJournal *)v24 snapshotJournalFileSize:&v39 changeJournalFileSize:&v38 error:&v37];
            id v25 = v37;

            if (!v23)
            {
              uint64_t v30 = PLMigrationGetLog();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                id v31 = [(PLJournalManagerCore *)self name];
                *(_DWORD *)long long buf = 138543874;
                uint64_t v46 = v31;
                __int16 v47 = 2114;
                uint64_t v48 = v18;
                __int16 v49 = 2112;
                unint64_t v50 = (unint64_t)v25;
                _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: could not determine journal file sizes for coalesce for payloadID %{public}@: %@", buf, 0x20u);
              }
              id v12 = v25;
              goto LABEL_24;
            }
            if (a4 >= 0.0 && v38 > (unint64_t)(float)((float)v39 * a4))
            {
              uint64_t v26 = PLMigrationGetLog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                v27 = [(PLJournalManagerCore *)self name];
                *(_DWORD *)long long buf = 138544642;
                uint64_t v46 = v27;
                __int16 v47 = 2114;
                uint64_t v48 = v18;
                __int16 v49 = 2048;
                unint64_t v50 = v38;
                __int16 v51 = 2048;
                unint64_t v52 = (unint64_t)(float)((float)v39 * a4);
                __int16 v53 = 2048;
                unint64_t v54 = v39;
                __int16 v55 = 2048;
                double v56 = a4;
                _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: coalescing journal %{public}@, change journal size %llu greater than %llu for snapshot size %llu with threshold: %f", buf, 0x3Eu);
              }
              id v36 = v25;
              BOOL v28 = [(PLJournal *)v24 coalesceChangesToSnapshotWithError:&v36];
              id v12 = v36;

              if (!v28)
              {
                uint64_t v30 = PLMigrationGetLog();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  id v33 = [(PLJournalManagerCore *)self name];
                  *(_DWORD *)long long buf = 138543874;
                  uint64_t v46 = v33;
                  __int16 v47 = 2114;
                  uint64_t v48 = v18;
                  __int16 v49 = 2112;
                  unint64_t v50 = (unint64_t)v12;
                  _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: could not coalesce journal for payloadID %{public}@: %@", buf, 0x20u);
                }
LABEL_24:
                id v8 = obj;
                a5 = v34;

                goto LABEL_25;
              }
              id v25 = v12;
            }

            id v12 = v25;
          }
        }
        id v8 = obj;
        uint64_t v15 = [obj countByEnumeratingWithState:&v40 objects:v57 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    BOOL v29 = 1;
  }
  else
  {
LABEL_25:
    if (a5)
    {
      id v12 = v12;
      BOOL v29 = 0;
      *a5 = v12;
    }
    else
    {
      BOOL v29 = 0;
    }
  }

  return v29;
}

- (BOOL)performPartialSnapshotForPayloadClassIDs:(id)a3 append:(BOOL)a4 createOnlyIfNecessary:(BOOL)a5 withManagedObjectContext:(id)a6 error:(id *)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  unint64_t v39 = __Block_byref_object_copy__13817;
  long long v40 = __Block_byref_object_dispose__13818;
  id v41 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  BOOL v35 = 0;
  uint64_t v14 = [(PLJournalManagerCore *)self baseURL];
  uint64_t v15 = [(PLJournalManagerCore *)self payloadClasses];
  uint64_t v16 = (id *)(v37 + 5);
  id obj = (id)v37[5];
  BOOL v17 = +[PLJournal recoverJournalsIfNecessaryForBaseURL:v14 payloadClasses:v15 error:&obj];
  objc_storeStrong(v16, obj);

  BOOL v35 = v17;
  uint64_t v18 = v33;
  if (!*((unsigned char *)v33 + 24)) {
    goto LABEL_6;
  }
  uint64_t v19 = PLMigrationGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [(PLJournalManagerCore *)self name];
    *(_DWORD *)long long buf = 138543618;
    long long v43 = v20;
    __int16 v44 = 2114;
    id v45 = v12;
    _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: performing partial snapshot for payloadClassIDs: %{public}@", buf, 0x16u);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __121__PLJournalManager_performPartialSnapshotForPayloadClassIDs_append_createOnlyIfNecessary_withManagedObjectContext_error___block_invoke;
  v23[3] = &unk_1E5865188;
  id v24 = v13;
  id v25 = v12;
  uint64_t v26 = self;
  BOOL v29 = a4;
  v27 = &v32;
  BOOL v28 = &v36;
  BOOL v30 = a5;
  [v24 performBlockAndWait:v23];

  uint64_t v18 = v33;
  if (*((unsigned char *)v33 + 24))
  {
    BOOL v21 = 1;
  }
  else
  {
LABEL_6:
    if (a7)
    {
      *a7 = (id) v37[5];
      uint64_t v18 = v33;
    }
    BOOL v21 = *((unsigned char *)v18 + 24) != 0;
  }
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v21;
}

void __121__PLJournalManager_performPartialSnapshotForPayloadClassIDs_append_createOnlyIfNecessary_withManagedObjectContext_error___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x1E4F1C1A0] currentQueryGenerationToken];
  [v2 setQueryGenerationFromToken:v3 error:0];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v11 = [*(id *)(a1 + 48) payloadClassForPayloadClassID:v9];
        if (v11)
        {
          uint64_t v12 = v11;
          id v13 = [PLJournal alloc];
          uint64_t v14 = [*(id *)(a1 + 48) baseURL];
          uint64_t v15 = [(PLJournal *)v13 initWithBaseURL:v14 payloadClass:v12];

          uint64_t v16 = *(void **)(a1 + 48);
          if (*(unsigned char *)(a1 + 72))
          {
            uint64_t v17 = *(void *)(a1 + 32);
            uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
            uint64_t v20 = *(void **)(v18 + 40);
            uint64_t v19 = (void **)(v18 + 40);
            uint64_t v36 = v20;
            char v21 = [v16 appendSnapshotWithJournal:v15 usingManagedObjectContext:v17 changedKeys:0 entryLimit:0 error:&v36];
            v22 = v36;
          }
          else
          {
            uint64_t v23 = *(unsigned __int8 *)(a1 + 73);
            uint64_t v24 = *(void *)(a1 + 32);
            uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
            uint64_t v26 = *(void **)(v25 + 40);
            uint64_t v19 = (void **)(v25 + 40);
            BOOL v35 = v26;
            char v21 = [v16 createSnapshotWithJournal:v15 createOnlyIfNecessary:v23 usingManagedObjectContext:v24 entryLimit:0 error:&v35];
            v22 = v35;
          }
          id v27 = v22;
          BOOL v28 = *v19;
          NSObject *v19 = v27;

          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v21;
          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
          {
            BOOL v29 = PLMigrationGetLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              BOOL v30 = [*(id *)(a1 + 48) name];
              uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
              *(_DWORD *)long long buf = 138543874;
              long long v42 = v30;
              __int16 v43 = 2114;
              uint64_t v44 = v9;
              __int16 v45 = 2112;
              uint64_t v46 = v31;
              _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: could not create partial snapshot of payloadID %{public}@: %@", buf, 0x20u);
            }
            goto LABEL_18;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v37 objects:v47 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  [*(id *)(a1 + 32) setQueryGenerationFromToken:0 error:0];
  uint64_t v32 = PLMigrationGetLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = [*(id *)(a1 + 48) name];
    uint64_t v34 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    long long v42 = v33;
    __int16 v43 = 2112;
    uint64_t v44 = v34;
    _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: finished partial snapshot for payloadClassIDs: %@{public}", buf, 0x16u);
  }
}

- (BOOL)performFullSnapshotAppend:(BOOL)a3 createOnlyIfNecessary:(BOOL)a4 withManagedObjectContext:(id)a5 entryLimitBlock:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a6;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__13817;
  BOOL v28 = __Block_byref_object_dispose__13818;
  id v29 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __115__PLJournalManager_performFullSnapshotAppend_createOnlyIfNecessary_withManagedObjectContext_entryLimitBlock_error___block_invoke;
  v17[3] = &unk_1E5865160;
  v17[4] = self;
  id v14 = v12;
  BOOL v22 = a3;
  id v18 = v14;
  uint64_t v20 = &v30;
  id v15 = v13;
  id v19 = v15;
  char v21 = &v24;
  BOOL v23 = a4;
  [v14 performBlockAndWait:v17];
  if (*((unsigned char *)v31 + 24))
  {
    LOBYTE(a7) = 1;
  }
  else if (a7)
  {
    *a7 = (id) v25[5];
    LOBYTE(a7) = *((unsigned char *)v31 + 24) != 0;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return (char)a7;
}

void __115__PLJournalManager_performFullSnapshotAppend_createOnlyIfNecessary_withManagedObjectContext_entryLimitBlock_error___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v2 = PLMigrationGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) name];
    *(_DWORD *)long long buf = 138543362;
    id v57 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: performing full snapshot", buf, 0xCu);
  }
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = [MEMORY[0x1E4F1C1A0] currentQueryGenerationToken];
  [v4 setQueryGenerationFromToken:v5 error:0];

  uint64_t v6 = [*(id *)(a1 + 40) persistentStoreCoordinator];
  uint64_t v7 = [v6 currentPersistentHistoryTokenFromStores:0];

  int v8 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v9 = [*(id *)(a1 + 32) baseURL];
  uint64_t v10 = [*(id *)(a1 + 32) payloadClasses];
  if (v8)
  {
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __115__PLJournalManager_performFullSnapshotAppend_createOnlyIfNecessary_withManagedObjectContext_entryLimitBlock_error___block_invoke_3;
    v53[3] = &unk_1E5865110;
    uint64_t v11 = (id *)v55;
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(a1 + 40);
    v55[0] = v12;
    v53[4] = v13;
    id v15 = &v54;
    id v16 = v14;
    uint64_t v17 = *(void *)(a1 + 64);
    id v54 = v16;
    v55[1] = v17;
    uint64_t v18 = *(void *)(v17 + 8);
    uint64_t v20 = *(void **)(v18 + 40);
    id v19 = (void **)(v18 + 40);
    unint64_t v52 = v20;
    BOOL v21 = +[PLJournal appendSnapshotsForBaseURL:v9 payloadClasses:v10 snapshotJournalBlock:v53 error:&v52];
    BOOL v22 = v52;
  }
  else
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __115__PLJournalManager_performFullSnapshotAppend_createOnlyIfNecessary_withManagedObjectContext_entryLimitBlock_error___block_invoke_2;
    v48[3] = &unk_1E5865138;
    uint64_t v11 = (id *)v50;
    id v23 = *(id *)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v25 = *(void **)(a1 + 40);
    v50[0] = v23;
    v48[4] = v24;
    char v51 = *(unsigned char *)(a1 + 73);
    id v15 = &v49;
    id v26 = v25;
    uint64_t v27 = *(void *)(a1 + 64);
    id v49 = v26;
    v50[1] = v27;
    uint64_t v28 = *(unsigned __int8 *)(a1 + 73);
    uint64_t v29 = *(void *)(v27 + 8);
    uint64_t v30 = *(void **)(v29 + 40);
    id v19 = (void **)(v29 + 40);
    __int16 v47 = v30;
    BOOL v21 = +[PLJournal createSnapshotsForBaseURL:v9 payloadClasses:v10 snapshotJournalBlock:v48 createOnlyIfNecessary:v28 error:&v47];
    BOOL v22 = v47;
  }
  id v31 = v22;
  uint64_t v32 = *v19;
  NSObject *v19 = v31;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v21;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    long long v39 = PLMigrationGetLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      long long v40 = [*(id *)(a1 + 32) name];
      uint64_t v43 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)long long buf = 138543618;
      id v57 = v40;
      __int16 v58 = 2112;
      uint64_t v59 = v43;
      long long v42 = "JournalManager[%{public}@]: could not create full snapshot: %@";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v33 = [v7 copy];
  uint64_t v34 = *(void *)(a1 + 32);
  BOOL v35 = *(void **)(v34 + 72);
  *(void *)(v34 + 72) = v33;

  if (v7)
  {
    uint64_t v36 = *(void **)(a1 + 32);
    uint64_t v37 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v37 + 40);
    char v38 = [v36 saveHistoryToken:v7 error:&obj];
    objc_storeStrong((id *)(v37 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v38;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      long long v39 = PLMigrationGetLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        long long v40 = [*(id *)(a1 + 32) name];
        uint64_t v41 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        *(_DWORD *)long long buf = 138543618;
        id v57 = v40;
        __int16 v58 = 2112;
        uint64_t v59 = v41;
        long long v42 = "JournalManager[%{public}@]: history token property list could not be written after snapshot: %@";
LABEL_13:
        _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, v42, buf, 0x16u);

        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
LABEL_15:
  [*(id *)(a1 + 40) setQueryGenerationFromToken:0 error:0];
  uint64_t v44 = PLMigrationGetLog();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v45 = [*(id *)(a1 + 32) name];
    *(_DWORD *)long long buf = 138543362;
    id v57 = v45;
    _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: finished full snapshot", buf, 0xCu);
  }
}

uint64_t __115__PLJournalManager_performFullSnapshotAppend_createOnlyIfNecessary_withManagedObjectContext_entryLimitBlock_error___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[6];
  if (v4) {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v6 appendSnapshotWithJournal:v3 usingManagedObjectContext:v7 changedKeys:0 entryLimit:v5 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);

  return v9;
}

uint64_t __115__PLJournalManager_performFullSnapshotAppend_createOnlyIfNecessary_withManagedObjectContext_entryLimitBlock_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v10 = [v7 createSnapshotWithJournal:v3 createOnlyIfNecessary:v6 usingManagedObjectContext:v8 entryLimit:v5 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);

  return v10;
}

- (BOOL)performFullSnapshotAppend:(BOOL)a3 createOnlyIfNecessary:(BOOL)a4 withManagedObjectContext:(id)a5 error:(id *)a6
{
  return [(PLJournalManager *)self performFullSnapshotAppend:a3 createOnlyIfNecessary:a4 withManagedObjectContext:a5 entryLimitBlock:0 error:a6];
}

- (BOOL)performSnapshotIfNecessaryAppend:(BOOL)a3 withManagedObjectContext:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  if ([(PLJournalManager *)self _needsFullSnapshot])
  {
    BOOL v9 = [(PLJournalManager *)self performFullSnapshotAppend:v6 createOnlyIfNecessary:0 withManagedObjectContext:v8 error:a5];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if ([(PLJournalManager *)self _needsPartialSnapshot:v10]) {
      BOOL v9 = [(PLJournalManager *)self performPartialSnapshotForPayloadClassIDs:v10 append:v6 createOnlyIfNecessary:0 withManagedObjectContext:v8 error:a5];
    }
    else {
      BOOL v9 = 1;
    }
  }
  return v9;
}

- (BOOL)_needsPartialSnapshot:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(PLJournalManagerCore *)self payloadClasses];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PLJournalManager__needsPartialSnapshot___block_invoke;
  v8[3] = &unk_1E586D7F8;
  v8[4] = self;
  id v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __42__PLJournalManager__needsPartialSnapshot___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [PLJournal alloc];
  id v8 = [*(id *)(a1 + 32) baseURL];
  char v14 = [(PLJournal *)v7 initWithBaseURL:v8 payloadClass:a2];

  id v9 = [(PLJournal *)v14 metadata];
  id v10 = [v9 objectForKeyedSubscript:@"snapshotPayloadVersion"];
  unsigned int v11 = [v10 unsignedIntValue];

  if (v11 < [a2 minimumSnapshotPayloadVersion])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v12 = *(void **)(a1 + 40);
    if (v12)
    {
      uint64_t v13 = [a2 payloadClassID];
      [v12 addObject:v13];
    }
    else
    {
      *a4 = 1;
    }
  }
}

- (BOOL)_needsFullSnapshot
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v3 = [(PLJournalManagerCore *)self payloadClasses];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__PLJournalManager__needsFullSnapshot__block_invoke;
  v7[3] = &unk_1E586AB48;
  v7[4] = self;
  v7[5] = &v8;
  [v3 enumerateObjectsUsingBlock:v7];

  id v4 = [(PLJournalManager *)self currentHistoryToken];
  if (v4) {
    BOOL v5 = *((unsigned char *)v9 + 24) == 0;
  }
  else {
    BOOL v5 = 1;
  }

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __38__PLJournalManager__needsFullSnapshot__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [PLJournal alloc];
  uint64_t v8 = [*(id *)(a1 + 32) baseURL];
  uint64_t v10 = [(PLJournal *)v7 initWithBaseURL:v8 payloadClass:a2];

  id v9 = [(PLJournal *)v10 metadata];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9 != 0;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

- (BOOL)needsSnapshot
{
  id v3 = [(PLJournalManager *)self currentHistoryToken];
  if (v3) {
    BOOL v4 = [(PLJournalManager *)self _needsPartialSnapshot:0];
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)clearHistoryToken
{
  currentHistoryToken = self->_currentHistoryToken;
  self->_currentHistoryToken = 0;

  [(PLJournalManagerCore *)self removeHistoryToken];
}

- (id)currentHistoryToken
{
  [(PLJournalManager *)self _loadHistoryTokenIfNecessary];
  currentHistoryToken = self->_currentHistoryToken;
  return currentHistoryToken;
}

- (void)_loadHistoryTokenIfNecessary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_currentHistoryToken)
  {
    id v8 = 0;
    id v3 = [(PLJournalManagerCore *)self readHistoryTokenWithError:&v8];
    id v4 = v8;
    currentHistoryToken = self->_currentHistoryToken;
    self->_currentHistoryToken = v3;

    if (!self->_currentHistoryToken && (PLIsErrorFileNotFound() & 1) == 0)
    {
      id v6 = PLMigrationGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = [(PLJournalManagerCore *)self name];
        *(_DWORD *)long long buf = 138543618;
        uint64_t v10 = v7;
        __int16 v11 = 2112;
        id v12 = v4;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: could not read history token: %@", buf, 0x16u);
      }
    }
  }
}

@end