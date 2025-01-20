@interface VCCKShortcutSyncService
- (BOOL)mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:(id)a3;
- (CKRecordZoneID)shortcutsZoneID;
- (CKSyncEngine)syncEngine;
- (CKSyncEngineFetchChangesOptions)fetchChangesOptions;
- (CKSyncEngineSendChangesOptions)sendChangesOptions;
- (NSMutableDictionary)filesReferencedUntilSaved;
- (VCCKApplicationStateObserver)applicationObserver;
- (VCCKShortcutSyncService)initWithContainer:(id)a3 database:(id)a4 applicationObserver:(id)a5 automaticSyncEnabled:(BOOL)a6 logger:(id)a7;
- (WFCloudKitSyncEventLogger)logger;
- (WFDatabase)database;
- (id)autoShortcutsPreferencesRecordForRecordID:(id)a3;
- (id)autoShortcutsPreferencesWithCloudKitAutoShortcutsPreferences:(id)a3;
- (id)calculateSubsetForRemoteOrdering:(id)a3 withLocalOrdering:(id)a4;
- (id)collectionIdentifierForRecordID:(id)a3;
- (id)folderRecordForRecordID:(id)a3;
- (id)libraryRecordForRecordID:(id)a3;
- (id)mergedOrderingFromLocalOrdering:(id)a3 previousOrdering:(id)a4 remoteOrdering:(id)a5;
- (id)recordToSaveForRecordID:(id)a3;
- (id)rootCollectionRecord;
- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4;
- (id)syncFlagsRecord;
- (id)workflowOrderingRecordForRecordID:(id)a3;
- (id)workflowRecordForRecordID:(id)a3;
- (id)workflowRecordForReference:(id)a3 properties:(id)a4;
- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4;
- (void)applyLegacyOrderedWorkflowIDsToRootCollection:(id)a3;
- (void)createShortcutsZone;
- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6;
- (void)dealloc;
- (void)fetchAndModifyChangesInShortcutsZoneWithCompletion:(id)a3;
- (void)fetchChangesInShortcutsZone;
- (void)fetchChangesInShortcutsZoneWithCompletion:(id)a3;
- (void)forceReceiveAndSendAllChangesWithCompletionHandler:(id)a3;
- (void)handleDeletedRecordWithID:(id)a3;
- (void)handleFetchedAutoShortcutsPreferencesRecord:(id)a3;
- (void)handleFetchedCollectionOrderingRecord:(id)a3;
- (void)handleFetchedDeletionOfAutoShortcutsPreferencesWithRecordID:(id)a3;
- (void)handleFetchedDeletionOfRecordWithID:(id)a3;
- (void)handleFetchedFolderRecord:(id)a3;
- (void)handleFetchedLegacyOrderingRecord:(id)a3;
- (void)handleFetchedSyncFlagsRecord:(id)a3;
- (void)handleFetchedWorkflowRecord:(id)a3;
- (void)handleNameConflictsForFetchedWorkflowRecord:(id)a3 identifier:(id)a4 shouldMarkFetchedRecordAsTombstone:(BOOL *)a5;
- (void)handleSavedAutoShortcutsPreferencesRecord:(id)a3;
- (void)handleSavedFolderRecord:(id)a3;
- (void)handleSavedLibraryRecord:(id)a3;
- (void)handleSavedSyncFlagsRecord:(id)a3;
- (void)handleSavedWorkflowOrderingRecord:(id)a3;
- (void)handleSavedWorkflowRecord:(id)a3;
- (void)handleSendAutoShortcutsPreferencesConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5;
- (void)handleSendFolderConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5;
- (void)handleSendLibraryConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5;
- (void)handleSendSyncFlagsConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5;
- (void)handleSendWorkflowConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5;
- (void)handleSendWorkflowOrderingConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5;
- (void)handleServerRecordChangedError:(id)a3;
- (void)handleUnknownItemErrorForRecord:(id)a3;
- (void)modifyPendingChangesInShortcutsZoneWithCompletion:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sendChangedFolders;
- (void)sendChangedWorkflows;
- (void)sendSyncFlagsIfNeeded;
- (void)sendWorkflowOrderingsIfNeeded;
- (void)start;
- (void)startObservingUserDefaults;
- (void)stopObservingUserDefaults;
- (void)syncEngine:(id)a3 handleEvent:(id)a4;
- (void)syncEngineDidDeleteRecordWithID:(id)a3;
- (void)syncEngineDidDeleteRecordZoneWithID:(id)a3;
- (void)syncEngineDidFetchRecord:(id)a3;
- (void)syncEngineDidSaveRecord:(id)a3;
- (void)syncEngineDidSaveRecordZone:(id)a3;
- (void)syncEngineDidUpdateMetadata:(id)a3;
- (void)syncEngineFailedToDeleteRecordWithID:(id)a3 error:(id)a4;
- (void)syncEngineFailedToDeleteRecordZoneWithID:(id)a3 error:(id)a4;
- (void)syncEngineFailedToSaveRecord:(id)a3 error:(id)a4;
- (void)syncEngineFailedToSaveRecordZone:(id)a3 error:(id)a4;
- (void)syncEngineRecordWithIDWasDeleted:(id)a3 recordType:(id)a4;
- (void)syncEngineZoneWithIDChanged:(id)a3;
- (void)syncEngineZoneWithIDWasDeleted:(id)a3;
- (void)syncEngineZoneWithIDWasPurged:(id)a3;
- (void)updateSyncTokenInDatabaseWithBlock:(id)a3;
@end

@implementation VCCKShortcutSyncService

- (void)forceReceiveAndSendAllChangesWithCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filesReferencedUntilSaved, 0);
  objc_storeStrong((id *)&self->_applicationObserver, 0);
  objc_storeStrong((id *)&self->_fetchChangesOptions, 0);
  objc_storeStrong((id *)&self->_sendChangesOptions, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (NSMutableDictionary)filesReferencedUntilSaved
{
  return self->_filesReferencedUntilSaved;
}

- (VCCKApplicationStateObserver)applicationObserver
{
  return self->_applicationObserver;
}

- (CKSyncEngineFetchChangesOptions)fetchChangesOptions
{
  return self->_fetchChangesOptions;
}

- (CKSyncEngineSendChangesOptions)sendChangesOptions
{
  return self->_sendChangesOptions;
}

- (WFCloudKitSyncEventLogger)logger
{
  return self->_logger;
}

- (CKSyncEngine)syncEngine
{
  return self->_syncEngine;
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)syncEngineDidUpdateMetadata:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[VCCKShortcutSyncService syncEngineDidUpdateMetadata:]";
    __int16 v11 = 2048;
    uint64_t v12 = [v4 length];
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Received updated metadata from sync engine, length = %lu", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__VCCKShortcutSyncService_syncEngineDidUpdateMetadata___block_invoke;
  v7[3] = &unk_1E6541F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(@"VCCKShortcutSyncService.didUpdateMetadata", v7);
}

void __55__VCCKShortcutSyncService_syncEngineDidUpdateMetadata___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__VCCKShortcutSyncService_syncEngineDidUpdateMetadata___block_invoke_2;
  v2[3] = &unk_1E6540428;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 updateSyncTokenInDatabaseWithBlock:v2];
}

uint64_t __55__VCCKShortcutSyncService_syncEngineDidUpdateMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSyncEngineMetadata:*(void *)(a1 + 32)];
}

- (void)syncEngineRecordWithIDWasDeleted:(id)a3 recordType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__VCCKShortcutSyncService_syncEngineRecordWithIDWasDeleted_recordType___block_invoke;
  v10[3] = &unk_1E65420A0;
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = self;
  id v8 = v7;
  id v9 = v6;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(@"VCCKShortcutSyncService.recordWithIDWasDeleted", v10);
}

void __71__VCCKShortcutSyncService_syncEngineRecordWithIDWasDeleted_recordType___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v25 = 136315650;
    v26 = "-[VCCKShortcutSyncService syncEngineRecordWithIDWasDeleted:recordType:]_block_invoke";
    __int16 v27 = 2114;
    uint64_t v28 = v3;
    __int16 v29 = 2114;
    uint64_t v30 = v4;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_INFO, "%s Sync engine fetched deletion of CKRecord with CKRecordID %{public}@ of type %{public}@", (uint8_t *)&v25, 0x20u);
  }

  [*(id *)(*(void *)(a1 + 48) + 24) logRecordDeleted:*(void *)(a1 + 32)];
  v5 = *(void **)(a1 + 40);
  id v6 = [MEMORY[0x1E4FB7130] recordType];
  if ([v5 isEqualToString:v6])
  {

LABEL_6:
    id v9 = getWFCloudKitSyncLogObject();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      return;
    }
    int v25 = 136315138;
    v26 = "-[VCCKShortcutSyncService syncEngineRecordWithIDWasDeleted:recordType:]_block_invoke";
    v10 = "%s Fetched record deletion of collection ordering record, not handling";
    goto LABEL_8;
  }
  id v7 = *(void **)(a1 + 40);
  id v8 = [MEMORY[0x1E4FB7118] recordType];
  LODWORD(v7) = [v7 isEqualToString:v8];

  if (v7) {
    goto LABEL_6;
  }
  uint64_t v13 = *(void **)(a1 + 40);
  v14 = [MEMORY[0x1E4FB7148] recordType];
  LODWORD(v13) = [v13 isEqualToString:v14];

  if (v13)
  {
    id v9 = getWFCloudKitSyncLogObject();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v25 = 136315138;
    v26 = "-[VCCKShortcutSyncService syncEngineRecordWithIDWasDeleted:recordType:]_block_invoke";
    v10 = "%s Fetched record deletion of legacy workflow ordering record";
    id v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_9;
  }
  v15 = *(void **)(a1 + 40);
  v16 = [MEMORY[0x1E4FB7178] recordType];
  if ([v15 isEqualToString:v16])
  {

LABEL_18:
    [*(id *)(a1 + 48) handleFetchedDeletionOfRecordWithID:*(void *)(a1 + 32)];
    return;
  }
  v17 = *(void **)(a1 + 40);
  v18 = [MEMORY[0x1E4FB7138] recordType];
  LODWORD(v17) = [v17 isEqualToString:v18];

  if (v17) {
    goto LABEL_18;
  }
  v19 = *(void **)(a1 + 40);
  v20 = [MEMORY[0x1E4FB7160] recordType];
  LODWORD(v19) = [v19 isEqualToString:v20];

  if (v19)
  {
    id v9 = getWFCloudKitSyncLogObject();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v25 = 136315138;
    v26 = "-[VCCKShortcutSyncService syncEngineRecordWithIDWasDeleted:recordType:]_block_invoke";
    v10 = "%s Fetched unexpected record deletion of sync flags record, not handling";
LABEL_8:
    id v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
LABEL_9:
    _os_log_impl(&dword_1C7D7E000, v11, v12, v10, (uint8_t *)&v25, 0xCu);
    goto LABEL_10;
  }
  v21 = *(void **)(a1 + 40);
  v22 = [MEMORY[0x1E4FB7128] recordType];
  LODWORD(v21) = [v21 isEqualToString:v22];

  if (v21)
  {
    [*(id *)(a1 + 48) handleFetchedDeletionOfAutoShortcutsPreferencesWithRecordID:*(void *)(a1 + 32)];
  }
  else
  {
    v23 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *(void *)(a1 + 40);
      int v25 = 136315394;
      v26 = "-[VCCKShortcutSyncService syncEngineRecordWithIDWasDeleted:recordType:]_block_invoke";
      __int16 v27 = 2114;
      uint64_t v28 = v24;
      _os_log_impl(&dword_1C7D7E000, v23, OS_LOG_TYPE_ERROR, "%s Fetched record deletion of unexpected type: %{public}@", (uint8_t *)&v25, 0x16u);
    }
  }
}

- (void)syncEngineDidFetchRecord:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__VCCKShortcutSyncService_syncEngineDidFetchRecord___block_invoke;
  v6[3] = &unk_1E6541F68;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(@"VCCKShortcutSyncService.didFetchRecord", v6);
}

void __52__VCCKShortcutSyncService_syncEngineDidFetchRecord___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v2 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) recordID];
    uint64_t v4 = *(void *)(a1 + 32);
    int v44 = 136315650;
    v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
    __int16 v46 = 2114;
    v47 = v3;
    __int16 v48 = 2112;
    uint64_t v49 = v4;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_INFO, "%s Sync engine fetched CKRecord with CKRecordID %{public}@, record = %@", (uint8_t *)&v44, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 40) + 24) logRecordFetched:*(void *)(a1 + 32)];
  id v5 = [*(id *)(a1 + 32) recordType];
  id v6 = [MEMORY[0x1E4FB7130] recordType];
  if ([v5 isEqualToString:v6])
  {

LABEL_6:
    if ([MEMORY[0x1E4F1CB18] shouldSyncCoherence])
    {
      v10 = getWFCloudKitSyncLogObject();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
LABEL_10:

        return;
      }
      int v44 = 136315138;
      v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
      id v11 = "%s Skipping fetched collection record because coherence sync is enabled";
LABEL_9:
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v44, 0xCu);
      goto LABEL_10;
    }
    [*(id *)(a1 + 40) handleFetchedCollectionOrderingRecord:*(void *)(a1 + 32)];
    return;
  }
  id v7 = [*(id *)(a1 + 32) recordType];
  id v8 = [MEMORY[0x1E4FB7118] recordType];
  int v9 = [v7 isEqualToString:v8];

  if (v9) {
    goto LABEL_6;
  }
  os_log_type_t v12 = [*(id *)(a1 + 32) recordType];
  uint64_t v13 = [MEMORY[0x1E4FB7148] recordType];
  int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    if ([MEMORY[0x1E4F1CB18] shouldSyncCoherence])
    {
      v10 = getWFCloudKitSyncLogObject();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
      int v44 = 136315138;
      v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
      id v11 = "%s Skipping fetched legacy workflow ordering record because coherence sync is enabled";
      goto LABEL_9;
    }
    [*(id *)(a1 + 40) handleFetchedLegacyOrderingRecord:*(void *)(a1 + 32)];
  }
  else
  {
    v15 = [*(id *)(a1 + 32) recordType];
    v16 = [MEMORY[0x1E4FB7178] recordType];
    int v17 = [v15 isEqualToString:v16];

    if (v17)
    {
      [*(id *)(a1 + 40) handleFetchedWorkflowRecord:*(void *)(a1 + 32)];
      return;
    }
    v18 = [*(id *)(a1 + 32) recordType];
    v19 = [MEMORY[0x1E4FB7138] recordType];
    int v20 = [v18 isEqualToString:v19];

    if (!v20)
    {
      v21 = [*(id *)(a1 + 32) recordType];
      v22 = [MEMORY[0x1E4FB7160] recordType];
      int v23 = [v21 isEqualToString:v22];

      if (v23)
      {
        [*(id *)(a1 + 40) handleFetchedSyncFlagsRecord:*(void *)(a1 + 32)];
        return;
      }
      uint64_t v24 = [*(id *)(a1 + 32) recordType];
      int v25 = [MEMORY[0x1E4FB7128] recordType];
      int v26 = [v24 isEqualToString:v25];

      if (v26)
      {
        [*(id *)(a1 + 40) handleFetchedAutoShortcutsPreferencesRecord:*(void *)(a1 + 32)];
        return;
      }
      __int16 v27 = [*(id *)(a1 + 32) recordType];
      uint64_t v28 = [MEMORY[0x1E4FB7150] recordType];
      int v29 = [v27 isEqualToString:v28];

      if (v29)
      {
        int v30 = [MEMORY[0x1E4F1CB18] shouldSyncCoherence];
        uint64_t v31 = getWFCloudKitSyncLogObject();
        BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
        if (v30)
        {
          if (v32)
          {
            v33 = *(void **)(a1 + 32);
            int v44 = 136315394;
            v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
            __int16 v46 = 2112;
            v47 = v33;
            _os_log_impl(&dword_1C7D7E000, v31, OS_LOG_TYPE_INFO, "%s Handling fetched library record: %@", (uint8_t *)&v44, 0x16u);
          }

          uint64_t v34 = *(void *)(a1 + 32);
          v35 = [*(id *)(a1 + 40) database];
          v36 = [*(id *)(a1 + 40) logger];
          BOOL v37 = +[VCCKLibrarySyncCoordinator handleFetchedLibraryRecord:v34 database:v35 logger:v36 error:0];

          if (v37) {
            return;
          }
          v38 = getWFCloudKitSyncLogObject();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = *(void **)(a1 + 32);
            int v44 = 136315394;
            v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
            __int16 v46 = 2114;
            v47 = v39;
            _os_log_impl(&dword_1C7D7E000, v38, OS_LOG_TYPE_ERROR, "%s Failed to handle fetched library record: %{public}@", (uint8_t *)&v44, 0x16u);
          }
        }
        else
        {
          if (v32)
          {
            int v44 = 136315138;
            v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
            _os_log_impl(&dword_1C7D7E000, v31, OS_LOG_TYPE_INFO, "%s Skipping fetched library record because coherence sync is disabled", (uint8_t *)&v44, 0xCu);
          }

          v41 = [MEMORY[0x1E4F1CB18] syncShortcutsUserDefaults];
          uint64_t v42 = *MEMORY[0x1E4FB73D8];
          char v43 = [v41 BOOLForKey:*MEMORY[0x1E4FB73D8]];

          if (v43) {
            return;
          }
          v38 = [MEMORY[0x1E4F1CB18] syncShortcutsUserDefaults];
          [v38 setBool:1 forKey:v42];
        }
      }
      else
      {
        v38 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v40 = [*(id *)(a1 + 32) recordType];
          int v44 = 136315394;
          v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
          __int16 v46 = 2114;
          v47 = v40;
          _os_log_impl(&dword_1C7D7E000, v38, OS_LOG_TYPE_ERROR, "%s Fetched record of unexpected type: %{public}@", (uint8_t *)&v44, 0x16u);
        }
      }

      return;
    }
    if ([MEMORY[0x1E4F1CB18] shouldSyncCoherence])
    {
      v10 = getWFCloudKitSyncLogObject();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
      int v44 = 136315138;
      v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
      id v11 = "%s Skipping fetched folder record because coherence sync is enabled";
      goto LABEL_9;
    }
    [*(id *)(a1 + 40) handleFetchedFolderRecord:*(void *)(a1 + 32)];
  }
}

- (void)syncEngineFailedToDeleteRecordWithID:(id)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = [v7 domain];
    int v12 = 136316162;
    uint64_t v13 = "-[VCCKShortcutSyncService syncEngineFailedToDeleteRecordWithID:error:]";
    __int16 v14 = 2114;
    v15 = v9;
    __int16 v16 = 2050;
    uint64_t v17 = [v7 code];
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Sync engine failed to delete CKRecord: error domain = %{public}@, code = %{public}ld, error = %{public}@, recordID = %{public}@", (uint8_t *)&v12, 0x34u);
  }
  logger = self->_logger;
  id v11 = [v7 description];
  [(WFCloudKitSyncEventLogger *)logger logRecordDeleteFailed:v6 error:v11];
}

- (void)syncEngineDidDeleteRecordWithID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__VCCKShortcutSyncService_syncEngineDidDeleteRecordWithID___block_invoke;
  v6[3] = &unk_1E6541F68;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(@"VCCKShortcutSyncService.didDeleteRecordWithID", v6);
}

uint64_t __59__VCCKShortcutSyncService_syncEngineDidDeleteRecordWithID___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[VCCKShortcutSyncService syncEngineDidDeleteRecordWithID:]_block_invoke";
    __int16 v7 = 2114;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_INFO, "%s Sync engine deleted CKRecord with CKRecordID %{public}@", (uint8_t *)&v5, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 40) + 24) logRecordDeleted:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 40) handleDeletedRecordWithID:*(void *)(a1 + 32)];
}

- (void)syncEngineFailedToSaveRecord:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__VCCKShortcutSyncService_syncEngineFailedToSaveRecord_error___block_invoke;
  v10[3] = &unk_1E65420A0;
  id v11 = v7;
  id v12 = v6;
  uint64_t v13 = self;
  id v8 = v6;
  id v9 = v7;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(@"VCCKShortcutSyncService.failedToSaveRecord", v10);
}

void __62__VCCKShortcutSyncService_syncEngineFailedToSaveRecord_error___block_invoke(id *a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = [a1[4] domain];
    uint64_t v8 = [a1[4] code];
    id v9 = a1[4];
    id v10 = a1[5];
    *(_DWORD *)buf = 136316418;
    uint64_t v31 = "-[VCCKShortcutSyncService syncEngineFailedToSaveRecord:error:]_block_invoke";
    __int16 v32 = 2114;
    v33 = v7;
    __int16 v34 = 2050;
    uint64_t v35 = v8;
    __int16 v36 = 2114;
    id v37 = v9;
    __int16 v38 = 2112;
    id v39 = v10;
    __int16 v40 = 2114;
    id v41 = v5;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_ERROR, "%s Sync engine failed to save CKRecord: error domain = %{public}@, code = %{public}ld, error = %{public}@, record = %@, partial errors = %{public}@", buf, 0x3Eu);
  }
  id v11 = a1[5];
  id v12 = (void *)*((void *)a1[6] + 3);
  uint64_t v13 = [a1[4] description];
  [v12 logRecordPushFailed:v11 error:v13];

  __int16 v14 = [a1[5] recordType];
  v15 = [MEMORY[0x1E4FB7178] recordType];
  LODWORD(v13) = [v14 isEqualToString:v15];

  if (v13)
  {
    __int16 v16 = [a1[5] recordID];
    uint64_t v17 = [v16 recordName];

    __int16 v18 = [a1[6] filesReferencedUntilSaved];
    [v18 setObject:0 forKeyedSubscript:v17];
  }
  if (CKErrorIsCode())
  {
    [a1[6] handleServerRecordChangedError:a1[4]];
    goto LABEL_26;
  }
  if (CKErrorIsCode())
  {
    [a1[6] handleUnknownItemErrorForRecord:a1[5]];
    goto LABEL_26;
  }
  if (CKErrorIsCode())
  {
    id v19 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = [a1[5] recordID];
      *(_DWORD *)buf = 136315394;
      uint64_t v31 = "-[VCCKShortcutSyncService syncEngineFailedToSaveRecord:error:]_block_invoke";
      __int16 v32 = 2114;
      v33 = v20;
      _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_DEFAULT, "%s Zone not found error encountered, asking sync engine to create the Shortcuts zone, and re-saving record with identifier %{public}@", buf, 0x16u);
    }
    [a1[6] createShortcutsZone];
    id v21 = a1[6];
    uint64_t v22 = [a1[5] recordID];
    int v29 = v22;
    int v23 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v24 = &v29;
LABEL_25:
    __int16 v27 = objc_msgSend(v23, "arrayWithObjects:count:", v24, 1, v28, v29);
    [v21 addRecordIDsToSave:v27 recordIDsToDelete:0];

    goto LABEL_26;
  }
  if (CKErrorIsCode())
  {
    int v25 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v31 = "-[VCCKShortcutSyncService syncEngineFailedToSaveRecord:error:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v25, OS_LOG_TYPE_DEFAULT, "%s User deleted zone error encountered", buf, 0xCu);
    }

    [MEMORY[0x1E4FB7168] setZoneWasPurged:1];
    if ([MEMORY[0x1E4FB7168] ignoresUserDeletedZoneErrors])
    {
      int v26 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v31 = "-[VCCKShortcutSyncService syncEngineFailedToSaveRecord:error:]_block_invoke";
        _os_log_impl(&dword_1C7D7E000, v26, OS_LOG_TYPE_DEFAULT, "%s User has consented to resuming sync, recreating the zone and retrying record upload", buf, 0xCu);
      }

      [a1[6] createShortcutsZone];
      id v21 = a1[6];
      uint64_t v22 = [a1[5] recordID];
      uint64_t v28 = v22;
      int v23 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v24 = &v28;
      goto LABEL_25;
    }
  }
LABEL_26:
}

- (void)syncEngineDidSaveRecord:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__VCCKShortcutSyncService_syncEngineDidSaveRecord___block_invoke;
  v6[3] = &unk_1E6541F68;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(@"VCCKShortcutSyncService.didSaveRecord", v6);
}

void __51__VCCKShortcutSyncService_syncEngineDidSaveRecord___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) recordID];
    uint64_t v4 = *(void *)(a1 + 32);
    int v33 = 136315650;
    __int16 v34 = "-[VCCKShortcutSyncService syncEngineDidSaveRecord:]_block_invoke";
    __int16 v35 = 2114;
    __int16 v36 = v3;
    __int16 v37 = 2112;
    uint64_t v38 = v4;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_INFO, "%s Sync engine saved CKRecord with CKRecordID %{public}@, record = %@", (uint8_t *)&v33, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 40) + 24) logRecordPushed:*(void *)(a1 + 32)];
  id v5 = [*(id *)(a1 + 32) recordType];
  id v6 = [MEMORY[0x1E4FB7130] recordType];
  if ([v5 isEqualToString:v6])
  {

LABEL_6:
    if ([MEMORY[0x1E4F1CB18] shouldSyncCoherence])
    {
      id v10 = getWFCloudKitSyncLogObject();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        return;
      }
      int v33 = 136315138;
      __int16 v34 = "-[VCCKShortcutSyncService syncEngineDidSaveRecord:]_block_invoke";
      id v11 = "%s Saved collection record but skipping handling it because coherence sync is enabled";
      id v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_9:
      _os_log_impl(&dword_1C7D7E000, v12, v13, v11, (uint8_t *)&v33, 0xCu);
      goto LABEL_10;
    }
    [*(id *)(a1 + 40) handleSavedWorkflowOrderingRecord:*(void *)(a1 + 32)];
    return;
  }
  id v7 = [*(id *)(a1 + 32) recordType];
  uint64_t v8 = [MEMORY[0x1E4FB7118] recordType];
  int v9 = [v7 isEqualToString:v8];

  if (v9) {
    goto LABEL_6;
  }
  __int16 v14 = [*(id *)(a1 + 32) recordType];
  v15 = [MEMORY[0x1E4FB7178] recordType];
  int v16 = [v14 isEqualToString:v15];

  if (v16)
  {
    [*(id *)(a1 + 40) handleSavedWorkflowRecord:*(void *)(a1 + 32)];
    return;
  }
  uint64_t v17 = [*(id *)(a1 + 32) recordType];
  __int16 v18 = [MEMORY[0x1E4FB7160] recordType];
  int v19 = [v17 isEqualToString:v18];

  if (v19)
  {
    [*(id *)(a1 + 40) handleSavedSyncFlagsRecord:*(void *)(a1 + 32)];
    return;
  }
  __int16 v20 = [*(id *)(a1 + 32) recordType];
  id v21 = [MEMORY[0x1E4FB7138] recordType];
  int v22 = [v20 isEqualToString:v21];

  if (!v22)
  {
    int v23 = [*(id *)(a1 + 32) recordType];
    uint64_t v24 = [MEMORY[0x1E4FB7128] recordType];
    int v25 = [v23 isEqualToString:v24];

    if (v25)
    {
      [*(id *)(a1 + 40) handleSavedAutoShortcutsPreferencesRecord:*(void *)(a1 + 32)];
      int v26 = [*(id *)(a1 + 32) recordID];
      __int16 v27 = [v26 recordName];

      uint64_t v28 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        int v33 = 136315394;
        __int16 v34 = "-[VCCKShortcutSyncService syncEngineDidSaveRecord:]_block_invoke";
        __int16 v35 = 2114;
        __int16 v36 = v27;
        _os_log_impl(&dword_1C7D7E000, v28, OS_LOG_TYPE_INFO, "%s Removing file representations for the auto shortcuts preferences record: %{public}@", (uint8_t *)&v33, 0x16u);
      }

      int v29 = [*(id *)(a1 + 40) filesReferencedUntilSaved];
      [v29 removeObjectForKey:v27];
    }
    else
    {
      int v30 = [*(id *)(a1 + 32) recordType];
      uint64_t v31 = [MEMORY[0x1E4FB7150] recordType];
      if ([v30 isEqualToString:v31])
      {
        int v32 = [MEMORY[0x1E4F1CB18] shouldSyncCoherence];

        if (v32)
        {
          [*(id *)(a1 + 40) handleSavedLibraryRecord:*(void *)(a1 + 32)];
          return;
        }
      }
      else
      {
      }
      __int16 v27 = getWFCloudKitSyncLogObject();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      int v29 = [*(id *)(a1 + 32) recordType];
      int v33 = 136315394;
      __int16 v34 = "-[VCCKShortcutSyncService syncEngineDidSaveRecord:]_block_invoke";
      __int16 v35 = 2114;
      __int16 v36 = v29;
      _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_ERROR, "%s Saved record of unexpected type: %{public}@", (uint8_t *)&v33, 0x16u);
    }

LABEL_32:
    return;
  }
  if ([MEMORY[0x1E4F1CB18] shouldSyncCoherence])
  {
    id v10 = getWFCloudKitSyncLogObject();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    int v33 = 136315138;
    __int16 v34 = "-[VCCKShortcutSyncService syncEngineDidSaveRecord:]_block_invoke";
    id v11 = "%s Saved folder record but skipping handling it because coherence sync is enabled";
    id v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    goto LABEL_9;
  }
  [*(id *)(a1 + 40) handleSavedFolderRecord:*(void *)(a1 + 32)];
}

- (id)recordToSaveForRecordID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  os_log_type_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1274;
  int v16 = __Block_byref_object_dispose__1275;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__VCCKShortcutSyncService_recordToSaveForRecordID___block_invoke;
  v8[3] = &unk_1E6542140;
  id v5 = v4;
  id v9 = v5;
  id v10 = self;
  id v11 = &v12;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(@"VCCKShortcutSyncService.recordToSaveForRecordID", v8);
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __51__VCCKShortcutSyncService_recordToSaveForRecordID___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v12 = 136315394;
    os_log_type_t v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
    __int16 v14 = 2114;
    uint64_t v15 = v3;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_INFO, "%s Sync engine is asking for CKRecord with ID %{public}@", (uint8_t *)&v12, 0x16u);
  }

  if (([MEMORY[0x1E4FB7130] isOrderingRecordID:*(void *)(a1 + 32)] & 1) == 0
    && ![MEMORY[0x1E4FB7118] isOrderingRecordID:*(void *)(a1 + 32)])
  {
    if ([MEMORY[0x1E4FB7160] isCloudKitSyncFlagsRecordID:*(void *)(a1 + 32)])
    {
      uint64_t v8 = [*(id *)(a1 + 40) syncFlagsRecord];
      id v9 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315394;
        os_log_type_t v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
        __int16 v14 = 2114;
        uint64_t v15 = v8;
        id v10 = "%s Returning sync flags CKRecord: %{public}@";
        goto LABEL_29;
      }
    }
    else if ([MEMORY[0x1E4FB7138] isFolderRecordID:*(void *)(a1 + 32)])
    {
      if ([MEMORY[0x1E4F1CB18] shouldSyncCoherence])
      {
        id v4 = getWFCloudKitSyncLogObject();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
          goto LABEL_31;
        }
        int v12 = 136315138;
        os_log_type_t v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
        id v5 = "%s Asked for a folder record to save but returning nil because coherence sync is enabled";
        id v6 = v4;
        os_log_type_t v7 = OS_LOG_TYPE_INFO;
        goto LABEL_8;
      }
      uint64_t v8 = [*(id *)(a1 + 40) folderRecordForRecordID:*(void *)(a1 + 32)];
      id v9 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315394;
        os_log_type_t v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
        __int16 v14 = 2114;
        uint64_t v15 = v8;
        id v10 = "%s Returning folder CKRecord: %{public}@";
        goto LABEL_29;
      }
    }
    else if ([MEMORY[0x1E4FB7128] isAutoShortcutsPreferencesRecordID:*(void *)(a1 + 32)])
    {
      uint64_t v8 = [*(id *)(a1 + 40) autoShortcutsPreferencesRecordForRecordID:*(void *)(a1 + 32)];
      id v9 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315394;
        os_log_type_t v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
        __int16 v14 = 2114;
        uint64_t v15 = v8;
        id v10 = "%s Returning auto shortcuts preferences CKRecord: %{public}@";
        goto LABEL_29;
      }
    }
    else if ([MEMORY[0x1E4FB7150] isLibraryRecordID:*(void *)(a1 + 32)] {
           && [MEMORY[0x1E4F1CB18] shouldSyncCoherence])
    }
    {
      uint64_t v8 = [*(id *)(a1 + 40) libraryRecordForRecordID:*(void *)(a1 + 32)];
      id v9 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315394;
        os_log_type_t v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
        __int16 v14 = 2114;
        uint64_t v15 = v8;
        id v10 = "%s Returning library CKRecord: %{public}@";
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v8 = [*(id *)(a1 + 40) workflowRecordForRecordID:*(void *)(a1 + 32)];
      id v9 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315394;
        os_log_type_t v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
        __int16 v14 = 2112;
        uint64_t v15 = v8;
        id v10 = "%s Returning workflow CKRecord: %@";
        goto LABEL_29;
      }
    }
LABEL_30:

    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(NSObject **)(v11 + 40);
    *(void *)(v11 + 40) = v8;
    goto LABEL_31;
  }
  if (![MEMORY[0x1E4F1CB18] shouldSyncCoherence])
  {
    uint64_t v8 = [*(id *)(a1 + 40) workflowOrderingRecordForRecordID:*(void *)(a1 + 32)];
    id v9 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      os_log_type_t v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
      __int16 v14 = 2114;
      uint64_t v15 = v8;
      id v10 = "%s Returning workflow ordering CKRecord: %{public}@";
LABEL_29:
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v12, 0x16u);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  id v4 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315138;
    os_log_type_t v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
    id v5 = "%s Asked for a collection record to save but returning nil because coherence sync is enabled";
    id v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
LABEL_8:
    _os_log_impl(&dword_1C7D7E000, v6, v7, v5, (uint8_t *)&v12, 0xCu);
  }
LABEL_31:
}

- (void)syncEngineZoneWithIDWasPurged:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[VCCKShortcutSyncService syncEngineZoneWithIDWasPurged:]";
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Sync engine reports that CKRecordZone with identifier %{public}@ was purged", buf, 0x16u);
  }

  logger = self->_logger;
  os_log_type_t v7 = [NSString stringWithFormat:@"Zone purged: %@", v4];
  [(WFCloudKitSyncEventLogger *)logger logEvent:v7];

  uint64_t v8 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
  LODWORD(logger) = [v4 isEqual:v8];

  if (logger) {
    [MEMORY[0x1E4FB7168] setZoneWasPurged:1];
  }
}

- (void)syncEngineZoneWithIDWasDeleted:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[VCCKShortcutSyncService syncEngineZoneWithIDWasDeleted:]";
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Sync engine reports that CKRecordZone with identifier %{public}@ was deleted", buf, 0x16u);
  }

  logger = self->_logger;
  os_log_type_t v7 = [NSString stringWithFormat:@"Zone deleted: %@", v4];
  [(WFCloudKitSyncEventLogger *)logger logEvent:v7];
}

- (void)syncEngineZoneWithIDChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[VCCKShortcutSyncService syncEngineZoneWithIDChanged:]";
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Sync engine reports that CKRecordZone with identifier %{public}@ changed", buf, 0x16u);
  }

  logger = self->_logger;
  os_log_type_t v7 = [NSString stringWithFormat:@"Zone changed: %@", v4];
  [(WFCloudKitSyncEventLogger *)logger logEvent:v7];
}

- (void)syncEngineFailedToDeleteRecordZoneWithID:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v14 = "-[VCCKShortcutSyncService syncEngineFailedToDeleteRecordZoneWithID:error:]";
    __int16 v15 = 2114;
    id v16 = v7;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_FAULT, "%s Sync engine reports failure to delete CKRecordZone: %{public}@, zoneID = %{public}@. This is unexpected, as we should not be deleting any zones", buf, 0x20u);
  }

  logger = self->_logger;
  __int16 v10 = NSString;
  id v11 = [v7 description];
  uint64_t v12 = [v10 stringWithFormat:@"Failed to delete record zone: %@. %@", v6, v11];
  [(WFCloudKitSyncEventLogger *)logger logError:v12];
}

- (void)syncEngineFailedToSaveRecordZone:(id)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "-[VCCKShortcutSyncService syncEngineFailedToSaveRecordZone:error:]";
    __int16 v16 = 2114;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Failed to save CKRecordZone: %{public}@, zone = %{public}@", buf, 0x20u);
  }

  logger = self->_logger;
  __int16 v10 = NSString;
  id v11 = [v6 zoneID];
  uint64_t v12 = [v7 description];
  uint64_t v13 = [v10 stringWithFormat:@"Failed to save record zone: %@. %@", v11, v12];
  [(WFCloudKitSyncEventLogger *)logger logError:v13];
}

- (void)syncEngineDidDeleteRecordZoneWithID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[VCCKShortcutSyncService syncEngineDidDeleteRecordZoneWithID:]";
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_FAULT, "%s Sync engine reports successful deletion of CKRecordZone with identifier %{public}@, but we should not be deleting any zones", buf, 0x16u);
  }

  logger = self->_logger;
  id v7 = [NSString stringWithFormat:@"Deleted record zone: %@", v4];
  [(WFCloudKitSyncEventLogger *)logger logEvent:v7];
}

- (void)syncEngineDidSaveRecordZone:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[VCCKShortcutSyncService syncEngineDidSaveRecordZone:]";
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Successfully saved CKRecordZone %{public}@", buf, 0x16u);
  }

  logger = self->_logger;
  id v7 = NSString;
  uint64_t v8 = [v4 zoneID];
  id v9 = [v7 stringWithFormat:@"Saved record zone: %@", v8];
  [(WFCloudKitSyncEventLogger *)logger logEvent:v9];

  __int16 v10 = [v4 zoneID];
  id v11 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
  LODWORD(v9) = [v10 isEqual:v11];

  if (v9) {
    [MEMORY[0x1E4FB7168] setIgnoresUserDeletedZoneErrors:0];
  }
}

- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VCCKShortcutSyncService *)self syncEngine];

  if (v8 == v6)
  {
    id v28 = v7;
    int v29 = v6;
    __int16 v10 = [v7 options];
    id v11 = [v10 scope];

    uint64_t v12 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v13 = [(VCCKShortcutSyncService *)self syncEngine];
    __int16 v14 = [v13 state];
    id v15 = [v14 pendingRecordZoneChanges];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v21 = [v20 recordID];
          int v22 = [v11 containsRecordID:v21];

          if (v22) {
            [v12 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v17);
    }

    int v23 = objc_opt_new();
    id v24 = objc_alloc(MEMORY[0x1E4F1A418]);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __74__VCCKShortcutSyncService_syncEngine_nextRecordZoneChangeBatchForContext___block_invoke;
    v30[3] = &unk_1E65406F0;
    v30[4] = self;
    id v31 = v23;
    id v25 = v23;
    id v9 = (void *)[v24 initWithPendingChanges:v12 recordProvider:v30];
    id v6 = v29;
    int v26 = [v29 state];
    [v26 removePendingRecordZoneChanges:v25];

    id v7 = v28;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

id __74__VCCKShortcutSyncService_syncEngine_nextRecordZoneChangeBatchForContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) recordToSaveForRecordID:v3];
  if (!v4)
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A408]) initWithRecordID:v3 type:0];
    [v5 addObject:v6];
  }
  return v4;
}

- (void)syncEngine:(id)a3 handleEvent:(id)a4
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  switch([v5 type])
  {
    case 0:
      id v6 = v5;
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v7 = v6;
        }
        else {
          id v7 = 0;
        }
      }
      else
      {
        id v7 = 0;
      }
      id v30 = v7;

      id v31 = (void *)MEMORY[0x1E4F28DB0];
      long long v32 = [v30 stateSerialization];

      objc_msgSend(v31, "wf_securelyArchivedDataWithRootObject:", v32);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      [(VCCKShortcutSyncService *)self syncEngineDidUpdateMetadata:v16];
      goto LABEL_121;
    case 2:
      id v8 = v5;
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v9 = v8;
        }
        else {
          id v9 = 0;
        }
      }
      else
      {
        id v9 = 0;
      }
      id v16 = v9;

      long long v144 = 0u;
      long long v145 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      long long v33 = [v16 modifications];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v142 objects:v157 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v143;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v143 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = [*(id *)(*((void *)&v142 + 1) + 8 * i) zoneID];
            [(VCCKShortcutSyncService *)self syncEngineZoneWithIDChanged:v38];
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v142 objects:v157 count:16];
        }
        while (v35);
      }

      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      int v22 = [v16 deletions];
      uint64_t v39 = [v22 countByEnumeratingWithState:&v138 objects:v156 count:16];
      if (!v39) {
        goto LABEL_120;
      }
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v139;
      break;
    case 3:
      id v10 = v5;
      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }
      }
      else
      {
        id v11 = 0;
      }
      id v16 = v11;

      long long v136 = 0u;
      long long v137 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      uint64_t v17 = [v16 modifications];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v134 objects:v155 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v135;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v135 != v20) {
              objc_enumerationMutation(v17);
            }
            [(VCCKShortcutSyncService *)self syncEngineDidFetchRecord:*(void *)(*((void *)&v134 + 1) + 8 * j)];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v134 objects:v155 count:16];
        }
        while (v19);
      }

      long long v132 = 0u;
      long long v133 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      int v22 = [v16 deletions];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v130 objects:v154 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v131;
        do
        {
          for (uint64_t k = 0; k != v24; ++k)
          {
            if (*(void *)v131 != v25) {
              objc_enumerationMutation(v22);
            }
            __int16 v27 = *(void **)(*((void *)&v130 + 1) + 8 * k);
            id v28 = [v27 recordID];
            int v29 = [v27 recordType];
            [(VCCKShortcutSyncService *)self syncEngineRecordWithIDWasDeleted:v28 recordType:v29];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v130 objects:v154 count:16];
        }
        while (v24);
      }
      goto LABEL_120;
    case 4:
      id v12 = v5;
      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
      }
      else
      {
        uint64_t v13 = 0;
      }
      id v16 = v13;

      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      __int16 v46 = [v16 savedZones];
      uint64_t v47 = [v46 countByEnumeratingWithState:&v126 objects:v153 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v127;
        do
        {
          for (uint64_t m = 0; m != v48; ++m)
          {
            if (*(void *)v127 != v49) {
              objc_enumerationMutation(v46);
            }
            [(VCCKShortcutSyncService *)self syncEngineDidSaveRecordZone:*(void *)(*((void *)&v126 + 1) + 8 * m)];
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v126 objects:v153 count:16];
        }
        while (v48);
      }

      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      v51 = [v16 failedZoneSaves];
      uint64_t v52 = [v51 countByEnumeratingWithState:&v122 objects:v152 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v123;
        do
        {
          for (uint64_t n = 0; n != v53; ++n)
          {
            if (*(void *)v123 != v54) {
              objc_enumerationMutation(v51);
            }
            v56 = *(void **)(*((void *)&v122 + 1) + 8 * n);
            v57 = [v56 recordZone];
            v58 = [v56 error];
            [(VCCKShortcutSyncService *)self syncEngineFailedToSaveRecordZone:v57 error:v58];
          }
          uint64_t v53 = [v51 countByEnumeratingWithState:&v122 objects:v152 count:16];
        }
        while (v53);
      }

      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      v59 = [v16 deletedZoneIDs];
      uint64_t v60 = [v59 countByEnumeratingWithState:&v118 objects:v151 count:16];
      if (v60)
      {
        uint64_t v61 = v60;
        uint64_t v62 = *(void *)v119;
        do
        {
          for (iuint64_t i = 0; ii != v61; ++ii)
          {
            if (*(void *)v119 != v62) {
              objc_enumerationMutation(v59);
            }
            [(VCCKShortcutSyncService *)self syncEngineDidDeleteRecordZoneWithID:*(void *)(*((void *)&v118 + 1) + 8 * ii)];
          }
          uint64_t v61 = [v59 countByEnumeratingWithState:&v118 objects:v151 count:16];
        }
        while (v61);
      }

      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      v64 = [v16 failedZoneDeletes];
      int v22 = [v64 allKeys];

      uint64_t v65 = [v22 countByEnumeratingWithState:&v114 objects:v150 count:16];
      if (v65)
      {
        uint64_t v66 = v65;
        uint64_t v67 = *(void *)v115;
        do
        {
          for (juint64_t j = 0; jj != v66; ++jj)
          {
            if (*(void *)v115 != v67) {
              objc_enumerationMutation(v22);
            }
            uint64_t v69 = *(void *)(*((void *)&v114 + 1) + 8 * jj);
            v70 = [v16 failedZoneDeletes];
            v71 = [v70 objectForKey:v69];
            [(VCCKShortcutSyncService *)self syncEngineFailedToDeleteRecordZoneWithID:v69 error:v71];
          }
          uint64_t v66 = [v22 countByEnumeratingWithState:&v114 objects:v150 count:16];
        }
        while (v66);
      }
      goto LABEL_120;
    case 5:
      id v14 = v5;
      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v15 = v14;
        }
        else {
          id v15 = 0;
        }
      }
      else
      {
        id v15 = 0;
      }
      id v16 = v15;

      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      v72 = [v16 savedRecords];
      uint64_t v73 = [v72 countByEnumeratingWithState:&v110 objects:v149 count:16];
      if (v73)
      {
        uint64_t v74 = v73;
        uint64_t v75 = *(void *)v111;
        do
        {
          for (kuint64_t k = 0; kk != v74; ++kk)
          {
            if (*(void *)v111 != v75) {
              objc_enumerationMutation(v72);
            }
            [(VCCKShortcutSyncService *)self syncEngineDidSaveRecord:*(void *)(*((void *)&v110 + 1) + 8 * kk)];
          }
          uint64_t v74 = [v72 countByEnumeratingWithState:&v110 objects:v149 count:16];
        }
        while (v74);
      }

      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      v77 = [v16 failedRecordSaves];
      uint64_t v78 = [v77 countByEnumeratingWithState:&v106 objects:v148 count:16];
      if (v78)
      {
        uint64_t v79 = v78;
        uint64_t v80 = *(void *)v107;
        do
        {
          for (muint64_t m = 0; mm != v79; ++mm)
          {
            if (*(void *)v107 != v80) {
              objc_enumerationMutation(v77);
            }
            v82 = *(void **)(*((void *)&v106 + 1) + 8 * mm);
            v83 = [v82 record];
            v84 = [v82 error];
            [(VCCKShortcutSyncService *)self syncEngineFailedToSaveRecord:v83 error:v84];
          }
          uint64_t v79 = [v77 countByEnumeratingWithState:&v106 objects:v148 count:16];
        }
        while (v79);
      }

      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      v85 = [v16 deletedRecordIDs];
      uint64_t v86 = [v85 countByEnumeratingWithState:&v102 objects:v147 count:16];
      if (v86)
      {
        uint64_t v87 = v86;
        uint64_t v88 = *(void *)v103;
        do
        {
          for (nuint64_t n = 0; nn != v87; ++nn)
          {
            if (*(void *)v103 != v88) {
              objc_enumerationMutation(v85);
            }
            [(VCCKShortcutSyncService *)self syncEngineDidDeleteRecordWithID:*(void *)(*((void *)&v102 + 1) + 8 * nn)];
          }
          uint64_t v87 = [v85 countByEnumeratingWithState:&v102 objects:v147 count:16];
        }
        while (v87);
      }

      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      v90 = objc_msgSend(v16, "failedRecordDeletes", 0);
      int v22 = [v90 allKeys];

      uint64_t v91 = [v22 countByEnumeratingWithState:&v98 objects:v146 count:16];
      if (v91)
      {
        uint64_t v92 = v91;
        uint64_t v93 = *(void *)v99;
        do
        {
          for (uint64_t i1 = 0; i1 != v92; ++i1)
          {
            if (*(void *)v99 != v93) {
              objc_enumerationMutation(v22);
            }
            uint64_t v95 = *(void *)(*((void *)&v98 + 1) + 8 * i1);
            v96 = [v16 failedRecordDeletes];
            v97 = [v96 objectForKey:v95];
            [(VCCKShortcutSyncService *)self syncEngineFailedToDeleteRecordWithID:v95 error:v97];
          }
          uint64_t v92 = [v22 countByEnumeratingWithState:&v98 objects:v146 count:16];
        }
        while (v92);
      }
      goto LABEL_120;
    default:
      goto LABEL_122;
  }
  do
  {
    for (uint64_t i2 = 0; i2 != v40; ++i2)
    {
      if (*(void *)v139 != v41) {
        objc_enumerationMutation(v22);
      }
      char v43 = *(void **)(*((void *)&v138 + 1) + 8 * i2);
      uint64_t v44 = [v43 reason];
      if (v44 == 1)
      {
        v45 = [v43 zoneID];
        [(VCCKShortcutSyncService *)self syncEngineZoneWithIDWasPurged:v45];
      }
      else
      {
        if (v44) {
          continue;
        }
        v45 = [v43 zoneID];
        [(VCCKShortcutSyncService *)self syncEngineZoneWithIDWasDeleted:v45];
      }
    }
    uint64_t v40 = [v22 countByEnumeratingWithState:&v138 objects:v156 count:16];
  }
  while (v40);
LABEL_120:

LABEL_121:
LABEL_122:
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v25 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]";
    __int16 v26 = 2114;
    id v27 = v11;
    __int16 v28 = 2114;
    id v29 = v12;
    __int16 v30 = 2114;
    id v31 = v13;
    _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_INFO, "%s Received database change: modified = %{public}@, inserted = %{public}@, removed = %{public}@", buf, 0x2Au);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__VCCKShortcutSyncService_databaseDidChange_modified_inserted_removed___block_invoke;
  v19[3] = &unk_1E65406C8;
  v19[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(@"VCCKShortcutSyncService.databaseResultChange", v19);
}

void __71__VCCKShortcutSyncService_databaseDidChange_modified_inserted_removed___block_invoke(id *a1)
{
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  v148 = objc_opt_new();
  v153 = objc_opt_new();
  v154 = objc_opt_new();
  v155 = [a1[4] shortcutsZoneID];
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  id v2 = a1[5];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v167 objects:v181 count:16];
  v156 = a1;
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v168;
    uint64_t v151 = *(void *)v168;
    id v146 = v2;
    do
    {
      uint64_t v6 = 0;
      uint64_t v145 = v4;
      do
      {
        if (*(void *)v168 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v167 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x1C87C4C10]();
        if (![v7 objectType])
        {
          id v10 = a1[6];
          id v11 = [v7 identifier];
          id v12 = [v10 referenceForWorkflowID:v11 includingTombstones:1];

          id v13 = (void *)*((void *)a1[4] + 3);
          id v14 = [v12 description];
          [v13 logDatabaseModify:v7 value:v14];

          if (v12)
          {
            id v15 = a1[4];
            id v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"hiddenFromLibraryAndSync", @"syncHash", @"lastSyncedHash", @"deleted", 0);
            id v17 = [v15 workflowRecordForReference:v7 properties:v16];

            if (v17)
            {
              if (([v17 hiddenFromLibraryAndSync] & 1) == 0)
              {
                uint64_t v18 = [v17 syncHash];
                if (v18 != [v17 lastSyncedHash])
                {
                  uint64_t v19 = (void *)MEMORY[0x1E4FB7178];
                  id v20 = [v7 identifier];
                  id v21 = [v19 recordIDWithZoneID:v155 workflowID:v20];

                  id v22 = [a1[6] conflictingReferenceForReference:v12];
                  if ([v17 isDeleted])
                  {
                    id v23 = v154;
                    if (v22)
                    {
                      char v24 = [v22 isDeleted];
                      id v23 = v154;
                      if ((v24 & 1) == 0)
                      {
LABEL_56:

                        goto LABEL_57;
                      }
                    }
                  }
                  else
                  {
                    id v23 = v148;
                    if (v22) {
                      goto LABEL_56;
                    }
                  }
                  [v23 addObject:v21];
                  goto LABEL_56;
                }
              }
            }
LABEL_57:
          }
          goto LABEL_59;
        }
        if ([v7 objectType] == 2)
        {
          if ([MEMORY[0x1E4F1CB18] shouldSyncCoherence])
          {
            id v9 = getWFCloudKitSyncLogObject();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
              _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_INFO, "%s Received database change for collections but skipping sync because coherence sync is enabled", buf, 0xCu);
            }

            [*((id *)a1[4] + 3) logDatabaseModify:v7 value:0];
          }
          else
          {
            v149 = v8;
            id v36 = v2;
            uint64_t v37 = [a1[4] database];
            uint64_t v38 = [v7 identifier];
            uint64_t v39 = [v37 collectionRecordForCollectionIdentifier:v38 createIfNecessary:0];

            uint64_t v40 = (void *)*((void *)a1[4] + 3);
            uint64_t v41 = NSString;
            uint64_t v42 = [v39 name];
            if ([v39 isFolder]) {
              char v43 = @"yes";
            }
            else {
              char v43 = @"no";
            }
            uint64_t v44 = [v39 shortcutOrdering];
            v45 = [v39 collectionOrdering];
            __int16 v46 = [v41 stringWithFormat:@"name: %@, folder: %@, shortcutOrdering: %@, collectionOrdering: %@", v42, v43, v44, v45];
            [v40 logDatabaseModify:v7 value:v46];

            uint64_t v47 = (void *)MEMORY[0x1E4FB7130];
            uint64_t v48 = [v7 identifier];
            uint64_t v49 = [v47 recordIDWithZoneID:v155 collectionIdentifier:v48];

            uint64_t v50 = (void *)MEMORY[0x1E4FB7138];
            v51 = [v7 identifier];
            uint64_t v52 = [v50 recordIDWithZoneID:v155 collectionIdentifier:v51];

            if ([v39 isFolder]
              && (uint64_t v53 = [v39 lastSyncedHash], v53 != objc_msgSend(v39, "computedSyncHash")))
            {
              v180[0] = v49;
              v180[1] = v52;
              uint64_t v54 = (void *)MEMORY[0x1E4F1C978];
              v55 = (void **)v180;
              uint64_t v56 = 2;
            }
            else
            {
              v179 = v49;
              uint64_t v54 = (void *)MEMORY[0x1E4F1C978];
              v55 = &v179;
              uint64_t v56 = 1;
            }
            uint64_t v66 = [v54 arrayWithObjects:v55 count:v56];
            id v2 = v36;
            id v8 = v149;
            uint64_t v5 = v151;
            if ([v39 isDeleted]) {
              uint64_t v67 = v154;
            }
            else {
              uint64_t v67 = v148;
            }
            [v67 addObjectsFromArray:v66];

            a1 = v156;
            uint64_t v4 = v145;
          }
        }
        else
        {
          if ([v7 objectType] == 9)
          {
            uint64_t v25 = v8;
            [*((id *)a1[4] + 3) logDatabaseModify:v7 value:0];
            __int16 v26 = (void *)MEMORY[0x1E4FB7128];
            id v27 = [v7 identifier];
            id v28 = [v26 recordIDWithZoneID:v155 identifier:v27];

            id v29 = [MEMORY[0x1E4FB7128] identifierForRecordID:v28];
            __int16 v30 = [a1[4] database];
            id v31 = [v30 autoShortcutsPreferencesForIdentifier:v29 error:0];

            uint64_t v32 = [v31 lastSyncedHash];
            uint64_t v33 = [v31 computedSyncHash];
            uint64_t v34 = getWFCloudKitSyncLogObject();
            BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
            if (v32 == v33)
            {
              if (v35)
              {
                *(_DWORD *)buf = 136315138;
                v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
                _os_log_impl(&dword_1C7D7E000, v34, OS_LOG_TYPE_INFO, "%s Received database change for auto shortcuts preferences but the sync hashes remain the same, skipping sync up", buf, 0xCu);
              }
            }
            else
            {
              if (v35)
              {
                *(_DWORD *)buf = 136315138;
                v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
                _os_log_impl(&dword_1C7D7E000, v34, OS_LOG_TYPE_INFO, "%s Auto shortcuts preferences changed in the database; adding record id to save",
                  buf,
                  0xCu);
              }

              [v148 addObject:v28];
            }
            uint64_t v5 = v151;
            id v8 = v25;

LABEL_53:
            id v2 = v146;
            goto LABEL_59;
          }
          if ([v7 objectType] == 10)
          {
            v57 = (void *)*((void *)a1[4] + 3);
            v58 = [a1[6] libraryDotRepresentation];
            [v57 logDatabaseModify:v7 value:v58];

            if ([MEMORY[0x1E4F1CB18] shouldSyncCoherence])
            {
              v59 = [a1[4] database];
              id v166 = 0;
              id v29 = [v59 recordWithDescriptor:v7 error:&v166];
              id v28 = v166;

              if (!v29)
              {
                uint64_t v60 = getWFCloudKitSyncLogObject();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
                  __int16 v175 = 2114;
                  id v176 = v28;
                  __int16 v177 = 2112;
                  v178 = v7;
                  _os_log_impl(&dword_1C7D7E000, v60, OS_LOG_TYPE_FAULT, "%s Failed to load WFLibraryRecord from descriptor: %{public}@, descriptor = %@", buf, 0x20u);
                }
              }
              uint64_t v61 = v8;
              uint64_t v62 = [v29 lastSyncedHash];
              uint64_t v63 = [v29 computedSyncHash];
              v64 = getWFCloudKitSyncLogObject();
              BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_INFO);
              if (v62 == v63)
              {
                if (v65)
                {
                  *(_DWORD *)buf = 136315138;
                  v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
                  _os_log_impl(&dword_1C7D7E000, v64, OS_LOG_TYPE_INFO, "%s Received database change for library but the sync hashes remain the same, skipping sync up", buf, 0xCu);
                }
              }
              else
              {
                if (v65)
                {
                  *(_DWORD *)buf = 136315138;
                  v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
                  _os_log_impl(&dword_1C7D7E000, v64, OS_LOG_TYPE_INFO, "%s Library changed in the database; adding record id to save",
                    buf,
                    0xCu);
                }

                v68 = (void *)MEMORY[0x1E4FB7150];
                uint64_t v69 = [v7 identifier];
                v64 = [v68 recordIDWithZoneID:v155 libraryIdentifier:v69];

                [v148 addObject:v64];
              }
              uint64_t v5 = v151;
              id v8 = v61;

              goto LABEL_53;
            }
          }
        }
LABEL_59:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v167 objects:v181 count:16];
    }
    while (v4);
  }

  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  id v70 = a1[7];
  uint64_t v71 = [v70 countByEnumeratingWithState:&v162 objects:v172 count:16];
  if (!v71) {
    goto LABEL_99;
  }
  uint64_t v72 = v71;
  uint64_t v73 = *(void *)v163;
  id v147 = v70;
  do
  {
    uint64_t v74 = 0;
    uint64_t v150 = v72;
    do
    {
      if (*(void *)v163 != v73) {
        objc_enumerationMutation(v70);
      }
      uint64_t v75 = *(void **)(*((void *)&v162 + 1) + 8 * v74);
      v76 = (void *)MEMORY[0x1C87C4C10]();
      if (![v75 objectType])
      {
        id v78 = a1[6];
        uint64_t v79 = [v75 identifier];
        uint64_t v80 = [v78 referenceForWorkflowID:v79 includingTombstones:1];

        v81 = (void *)*((void *)a1[4] + 3);
        v82 = [v80 description];
        [v81 logDatabaseInsert:v75 value:v82];

        if (v80 && ([a1[6] hasConflictingReferenceForReference:v80] & 1) == 0)
        {
          id v83 = a1[4];
          v84 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"hiddenFromLibraryAndSync", @"syncHash", @"lastSyncedHash", 0);
          v85 = [v83 workflowRecordForReference:v75 properties:v84];

          if (v85)
          {
            if (([v85 hiddenFromLibraryAndSync] & 1) == 0)
            {
              uint64_t v86 = [v85 syncHash];
              if (v86 != [v85 lastSyncedHash])
              {
                uint64_t v87 = (void *)MEMORY[0x1E4FB7178];
                [v75 identifier];
                v89 = uint64_t v88 = v76;
                v90 = [v87 recordIDWithZoneID:v155 workflowID:v89];
                [v153 addObject:v90];

                v76 = v88;
              }
            }
          }
        }
        goto LABEL_96;
      }
      if ([v75 objectType] == 2)
      {
        if ([MEMORY[0x1E4F1CB18] shouldSyncCoherence])
        {
          v77 = getWFCloudKitSyncLogObject();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
            _os_log_impl(&dword_1C7D7E000, v77, OS_LOG_TYPE_INFO, "%s Received database change for collections but skipping sync because coherence sync is enabled", buf, 0xCu);
          }

          [*((id *)a1[4] + 3) logDatabaseInsert:v75 value:0];
        }
        else
        {
          v152 = v76;
          uint64_t v93 = v73;
          v94 = (void *)MEMORY[0x1E4FB7130];
          uint64_t v95 = [v75 identifier];
          v96 = [v94 recordIDWithZoneID:v155 collectionIdentifier:v95];
          [v153 addObject:v96];

          v97 = [a1[4] database];
          long long v98 = [v75 identifier];
          long long v99 = [v97 collectionRecordForCollectionIdentifier:v98 createIfNecessary:0];

          long long v100 = (void *)*((void *)a1[4] + 3);
          long long v101 = NSString;
          long long v102 = [v99 name];
          if ([v99 isFolder]) {
            long long v103 = @"yes";
          }
          else {
            long long v103 = @"no";
          }
          long long v104 = [v99 shortcutOrdering];
          long long v105 = [v99 collectionOrdering];
          long long v106 = [v101 stringWithFormat:@"name: %@, folder: %@, shortcutOrdering: %@, collectionOrdering: %@", v102, v103, v104, v105];
          [v100 logDatabaseInsert:v75 value:v106];

          if ([v99 isFolder])
          {
            uint64_t v107 = [v99 lastSyncedHash];
            if (v107 != [v99 computedSyncHash])
            {
              long long v108 = (void *)MEMORY[0x1E4FB7138];
              long long v109 = [v75 identifier];
              long long v110 = [v108 recordIDWithZoneID:v155 collectionIdentifier:v109];
              [v153 addObject:v110];
            }
          }

          a1 = v156;
          uint64_t v73 = v93;
          id v70 = v147;
          uint64_t v72 = v150;
          v76 = v152;
        }
      }
      else
      {
        if ([v75 objectType] == 9)
        {
          [*((id *)a1[4] + 3) logDatabaseInsert:v75 value:0];
          uint64_t v91 = (void *)MEMORY[0x1E4FB7128];
          uint64_t v92 = [v75 identifier];
          uint64_t v80 = [v91 recordIDWithZoneID:v155 identifier:v92];

          [v153 addObject:v80];
LABEL_96:

          goto LABEL_97;
        }
        if ([v75 objectType] == 10)
        {
          long long v111 = (void *)*((void *)a1[4] + 3);
          long long v112 = [a1[6] libraryDotRepresentation];
          [v111 logDatabaseInsert:v75 value:v112];

          if ([MEMORY[0x1E4F1CB18] shouldSyncCoherence])
          {
            long long v113 = (void *)MEMORY[0x1E4FB7150];
            long long v114 = [v75 identifier];
            uint64_t v80 = [v113 recordIDWithZoneID:v155 libraryIdentifier:v114];

            [v153 addObject:v80];
            long long v115 = [a1[4] database];
            long long v116 = [v115 recordWithDescriptor:v75 properties:0 error:0];

            if (v116)
            {
              long long v117 = [v116 cloudKitRecordMetadata];

              if (!v117)
              {
                long long v118 = getWFCloudKitSyncLogObject();
                if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
                  _os_log_impl(&dword_1C7D7E000, v118, OS_LOG_TYPE_INFO, "%s About to upload the library to CloudKit for the first time. Uploading all shortcut records to migrate to the Shortcut_v2 record", buf, 0xCu);
                }

                long long v119 = [a1[6] sortedVisibleWorkflowsByName];
                long long v120 = [v119 descriptors];

                v161[0] = MEMORY[0x1E4F143A8];
                v161[1] = 3221225472;
                v161[2] = __71__VCCKShortcutSyncService_databaseDidChange_modified_inserted_removed___block_invoke_295;
                v161[3] = &unk_1E65406A0;
                v161[4] = a1[4];
                long long v121 = objc_msgSend(v120, "if_map:", v161);
                [v153 addObjectsFromArray:v121];
              }
            }

            goto LABEL_96;
          }
        }
      }
LABEL_97:
      ++v74;
    }
    while (v72 != v74);
    uint64_t v72 = [v70 countByEnumeratingWithState:&v162 objects:v172 count:16];
  }
  while (v72);
LABEL_99:

  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  id v122 = a1[8];
  uint64_t v123 = [v122 countByEnumeratingWithState:&v157 objects:v171 count:16];
  if (v123)
  {
    uint64_t v124 = v123;
    uint64_t v125 = *(void *)v158;
    do
    {
      for (uint64_t i = 0; i != v124; ++i)
      {
        if (*(void *)v158 != v125) {
          objc_enumerationMutation(v122);
        }
        long long v127 = *(void **)(*((void *)&v157 + 1) + 8 * i);
        long long v128 = (void *)MEMORY[0x1C87C4C10]();
        if (![v127 objectType])
        {
          [*((id *)v156[4] + 3) logDatabaseRemove:v127];
          long long v130 = (void *)MEMORY[0x1E4FB7178];
          long long v129 = [v156[4] shortcutsZoneID];
          long long v131 = [v127 identifier];
          long long v132 = [v130 recordIDWithZoneID:v129 workflowID:v131];
          [v154 addObject:v132];

LABEL_113:
          goto LABEL_118;
        }
        if ([v127 objectType] == 2)
        {
          [*((id *)v156[4] + 3) logDatabaseRemove:v127];
          if ([MEMORY[0x1E4F1CB18] shouldSyncCoherence])
          {
            long long v129 = getWFCloudKitSyncLogObject();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke_2";
              _os_log_impl(&dword_1C7D7E000, v129, OS_LOG_TYPE_INFO, "%s Received database change for collections but skipping sync because coherence sync is enabled", buf, 0xCu);
            }
            goto LABEL_118;
          }
          long long v136 = (void *)MEMORY[0x1E4FB7130];
          long long v129 = [v127 identifier];
          long long v131 = [v136 recordIDWithZoneID:v155 collectionIdentifier:v129];
          [v154 addObject:v131];
          goto LABEL_113;
        }
        if ([v127 objectType] == 9)
        {
          [*((id *)v156[4] + 3) logDatabaseRemove:v127];
          long long v133 = (void *)MEMORY[0x1E4FB7128];
          long long v134 = [v127 identifier];
          uint64_t v135 = [v133 recordIDWithZoneID:v155 identifier:v134];
          goto LABEL_117;
        }
        if ([v127 objectType] == 10
          && [MEMORY[0x1E4F1CB18] shouldSyncCoherence])
        {
          [*((id *)v156[4] + 3) logDatabaseRemove:v127];
          long long v137 = (void *)MEMORY[0x1E4FB7150];
          long long v134 = [v127 identifier];
          uint64_t v135 = [v137 recordIDWithZoneID:v155 libraryIdentifier:v134];
LABEL_117:
          long long v129 = v135;

          [v154 addObject:v129];
LABEL_118:
        }
      }
      uint64_t v124 = [v122 countByEnumeratingWithState:&v157 objects:v171 count:16];
    }
    while (v124);
  }

  long long v138 = (void *)[v153 mutableCopy];
  [v138 intersectOrderedSet:v154];
  long long v139 = [v138 array];
  [v153 removeObjectsInArray:v139];

  long long v140 = [v138 array];
  [v154 removeObjectsInArray:v140];

  id v141 = v156[4];
  long long v142 = [v153 array];
  long long v143 = [v148 arrayByAddingObjectsFromArray:v142];
  long long v144 = [v154 array];
  [v141 addRecordIDsToSave:v143 recordIDsToDelete:v144];
}

id __71__VCCKShortcutSyncService_databaseDidChange_modified_inserted_removed___block_invoke_295(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4FB7178];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 shortcutsZoneID];
  uint64_t v6 = [v4 identifier];

  id v7 = [v2 recordIDWithZoneID:v5 workflowID:v6];

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)VCCKShortcutSyncServiceUserDefaultsChangedContext == a6)
  {
    if (([v10 isEqualToString:*MEMORY[0x1E4FB7498]] & 1) != 0
      || [v10 isEqualToString:*MEMORY[0x1E4FB73F8]])
    {
      [(VCCKShortcutSyncService *)self sendSyncFlagsIfNeeded];
    }
  }
  else if ((void *)VCCKShortcutSyncServiceApplicationVisibilityChangedContext == a6)
  {
    id v13 = [(VCCKShortcutSyncService *)self applicationObserver];
    int v14 = [v13 isApplicationVisible];

    id v15 = getWFCloudKitSyncLogObject();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v19 = "-[VCCKShortcutSyncService observeValueForKeyPath:ofObject:change:context:]";
        _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_DEFAULT, "%s Application moved to foreground, performing immediate sync", buf, 0xCu);
      }

      [(VCCKShortcutSyncService *)self fetchAndModifyChangesInShortcutsZoneWithCompletion:0];
    }
    else
    {
      if (v16)
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v19 = "-[VCCKShortcutSyncService observeValueForKeyPath:ofObject:change:context:]";
        _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_DEFAULT, "%s Application no longer in foreground.", buf, 0xCu);
      }
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VCCKShortcutSyncService;
    [(VCCKShortcutSyncService *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)start
{
  uint64_t v3 = [(VCCKShortcutSyncService *)self database];
  [v3 addObjectObserver:self];

  [(VCCKShortcutSyncService *)self startObservingUserDefaults];
  id v4 = [(VCCKShortcutSyncService *)self applicationObserver];
  [v4 addObserver:self forKeyPath:@"applicationVisible" options:0 context:VCCKShortcutSyncServiceApplicationVisibilityChangedContext];

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__VCCKShortcutSyncService_start__block_invoke;
  v5[3] = &unk_1E6540678;
  objc_copyWeak(&v6, &location);
  [(VCCKShortcutSyncService *)self fetchChangesInShortcutsZoneWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __32__VCCKShortcutSyncService_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = (void *)MEMORY[0x1C87C4C10]();
  [WeakRetained sendChangedWorkflows];
  if ([MEMORY[0x1E4F1CB18] shouldSyncCoherence])
  {
    id v6 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "-[VCCKShortcutSyncService start]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_INFO, "%s Sync service started but skipping sending changed folders & collections because coherence sync is enabled", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    [WeakRetained sendChangedFolders];
    [WeakRetained sendWorkflowOrderingsIfNeeded];
  }
  [WeakRetained sendSyncFlagsIfNeeded];
  [WeakRetained modifyPendingChangesInShortcutsZoneWithCompletion:0];
}

- (void)stopObservingUserDefaults
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = WFUserDefaultsKeysToObserve();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeObserver:self forKeyPath:*(void *)(*((void *)&v19 + 1) + 8 * v8++) context:VCCKShortcutSyncServiceUserDefaultsChangedContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = WFSystemUserDefaultsKeysToObserve();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, *(void *)(*((void *)&v15 + 1) + 8 * v14++), VCCKShortcutSyncServiceUserDefaultsChangedContext, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)startObservingUserDefaults
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = WFUserDefaultsKeysToObserve();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObserver:self forKeyPath:*(void *)(*((void *)&v19 + 1) + 8 * v8++) options:0 context:VCCKShortcutSyncServiceUserDefaultsChangedContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = WFSystemUserDefaultsKeysToObserve();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, *(void *)(*((void *)&v15 + 1) + 8 * v14++), 0, VCCKShortcutSyncServiceUserDefaultsChangedContext, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)handleUnknownItemErrorForRecord:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 recordID];
    *(_DWORD *)buf = 136315650;
    uint64_t v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
    __int16 v80 = 2114;
    v81 = v6;
    __int16 v82 = 2112;
    id v83 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorUnknownItem error for record with identifier %{public}@, record = %@", buf, 0x20u);
  }
  uint64_t v7 = [v4 recordType];
  uint64_t v8 = [MEMORY[0x1E4FB7130] recordType];
  if ([v7 isEqualToString:v8])
  {

LABEL_6:
    uint64_t v12 = [v4 recordID];
    uint64_t v13 = [(VCCKShortcutSyncService *)self collectionIdentifierForRecordID:v12];

    if (!v13)
    {
LABEL_24:

      goto LABEL_25;
    }
    uint64_t v14 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
      __int16 v80 = 2114;
      v81 = v13;
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorUnknownItem for collection with identifier %{public}@", buf, 0x16u);
    }

    long long v15 = [objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v13 objectType:2];
    long long v16 = [(VCCKShortcutSyncService *)self database];
    long long v17 = [v16 collectionRecordForCollectionIdentifier:v13 createIfNecessary:0];

    if (v17)
    {
      [v17 setCloudKitOrderingRecordMetadata:0];
      long long v18 = [(VCCKShortcutSyncService *)self database];
      id v72 = 0;
      char v19 = [v18 saveRecord:v17 withDescriptor:v15 error:&v72];
      long long v20 = v72;

      if ((v19 & 1) == 0)
      {
        long long v21 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
          __int16 v80 = 2114;
          v81 = v20;
          _os_log_impl(&dword_1C7D7E000, v21, OS_LOG_TYPE_ERROR, "%s Failed to save WFWorkflowCollectionRecord: %{public}@", buf, 0x16u);
        }
      }
      long long v22 = [v4 recordID];
      v77 = v22;
      id v23 = (void *)MEMORY[0x1E4F1C978];
      char v24 = &v77;
      goto LABEL_15;
    }
    long long v20 = getWFCloudKitSyncLogObject();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
LABEL_20:
    *(_DWORD *)buf = 136315394;
    uint64_t v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
    __int16 v80 = 2114;
    v81 = v13;
    _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_DEFAULT, "%s Cannot load WFWorkflowCollectionRecord for collection identifier %{public}@", buf, 0x16u);
    goto LABEL_21;
  }
  uint64_t v9 = [v4 recordType];
  id v10 = [MEMORY[0x1E4FB7118] recordType];
  int v11 = [v9 isEqualToString:v10];

  if (v11) {
    goto LABEL_6;
  }
  __int16 v26 = [v4 recordType];
  id v27 = [MEMORY[0x1E4FB7160] recordType];
  int v28 = [v26 isEqualToString:v27];

  if (!v28)
  {
    id v29 = [v4 recordType];
    __int16 v30 = [MEMORY[0x1E4FB7178] recordType];
    int v31 = [v29 isEqualToString:v30];

    if (v31)
    {
      uint64_t v32 = [v4 recordID];
      uint64_t v13 = [v32 recordName];

      uint64_t v33 = [(VCCKShortcutSyncService *)self database];
      long long v15 = [v33 referenceForWorkflowID:v13 includingTombstones:1];

      if (!v15)
      {
        long long v17 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
          __int16 v80 = 2114;
          v81 = v13;
          _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_ERROR, "%s Failed to get local workflow reference from workflow CKRecord with identifier: %{public}@", buf, 0x16u);
        }
        goto LABEL_22;
      }
      uint64_t v34 = objc_opt_new();
      long long v17 = [(VCCKShortcutSyncService *)self workflowRecordForReference:v15 properties:v34];

      if (!v17)
      {
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      [v17 setCloudKitRecordMetadata:0];
      BOOL v35 = [(VCCKShortcutSyncService *)self database];
      id v71 = 0;
      char v36 = [v35 saveRecord:v17 withDescriptor:v15 error:&v71];
      long long v20 = v71;

      if (v36)
      {
        long long v22 = [v4 recordID];
        v76 = v22;
        id v23 = (void *)MEMORY[0x1E4F1C978];
        char v24 = &v76;
LABEL_15:
        uint64_t v25 = [v23 arrayWithObjects:v24 count:1];
        [(VCCKShortcutSyncService *)self addRecordIDsToSave:v25 recordIDsToDelete:0];

LABEL_16:
LABEL_21:

        goto LABEL_22;
      }
      long long v22 = getWFCloudKitSyncLogObject();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
      __int16 v80 = 2114;
      v81 = v20;
      uint64_t v63 = "%s Failed to save WFWorkflowRecord: %{public}@";
      goto LABEL_59;
    }
    uint64_t v37 = [v4 recordType];
    uint64_t v38 = [MEMORY[0x1E4FB7138] recordType];
    int v39 = [v37 isEqualToString:v38];

    if (v39)
    {
      uint64_t v40 = (void *)MEMORY[0x1E4FB7138];
      uint64_t v41 = [v4 recordID];
      uint64_t v13 = [v40 collectionIdentifierForRecordID:v41];

      if (!v13)
      {
        long long v15 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v64 = [v4 recordID];
          *(_DWORD *)buf = 136315394;
          uint64_t v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
          __int16 v80 = 2114;
          v81 = v64;
          _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_ERROR, "%s Failed to get collection identifier from folder CKRecordID %{public}@", buf, 0x16u);
        }
        goto LABEL_23;
      }
      long long v15 = [objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v13 objectType:2];
      uint64_t v42 = [(VCCKShortcutSyncService *)self database];
      long long v17 = [v42 collectionRecordForCollectionIdentifier:v13 createIfNecessary:0];

      if (!v17)
      {
        long long v20 = getWFCloudKitSyncLogObject();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      [v17 setCloudKitFolderRecordMetadata:0];
      char v43 = [(VCCKShortcutSyncService *)self database];
      id v70 = 0;
      char v44 = [v43 saveRecord:v17 withDescriptor:v15 error:&v70];
      long long v20 = v70;

      if (v44)
      {
        long long v22 = [v4 recordID];
        uint64_t v75 = v22;
        id v23 = (void *)MEMORY[0x1E4F1C978];
        char v24 = &v75;
        goto LABEL_15;
      }
      long long v22 = getWFCloudKitSyncLogObject();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
      __int16 v80 = 2114;
      v81 = v20;
      uint64_t v63 = "%s Failed to save WFWorkflowCollectionRecord: %{public}@";
LABEL_59:
      _os_log_impl(&dword_1C7D7E000, v22, OS_LOG_TYPE_ERROR, v63, buf, 0x16u);
      goto LABEL_16;
    }
    v45 = [v4 recordType];
    __int16 v46 = [MEMORY[0x1E4FB7128] recordType];
    int v47 = [v45 isEqualToString:v46];

    if (v47)
    {
      uint64_t v48 = (void *)MEMORY[0x1E4FB7128];
      uint64_t v49 = [v4 recordID];
      uint64_t v13 = [v48 identifierForRecordID:v49];

      if (v13)
      {
        uint64_t v50 = [(VCCKShortcutSyncService *)self database];
        id v69 = 0;
        v51 = [v50 autoShortcutsPreferencesForIdentifier:v13 error:&v69];
        uint64_t v52 = v69;

        if (v51)
        {
          [v51 setCloudKitMetadata:0];
          uint64_t v53 = [(VCCKShortcutSyncService *)self database];
          v68 = v52;
          char v54 = [v53 updateAutoShortcutsPreferencesWithNewPreferences:v51 error:&v68];
          v55 = v68;

          if (v54)
          {
            uint64_t v56 = [v4 recordID];
            uint64_t v74 = v56;
            v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
            [(VCCKShortcutSyncService *)self addRecordIDsToSave:v57 recordIDsToDelete:0];
          }
          else
          {
            uint64_t v56 = getWFCloudKitSyncLogObject();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
              __int16 v80 = 2112;
              v81 = v51;
              __int16 v82 = 2112;
              id v83 = v55;
              _os_log_impl(&dword_1C7D7E000, v56, OS_LOG_TYPE_ERROR, "%s Failed to update Auto Shortcuts Preferences (%@): %@", buf, 0x20u);
            }
          }
          uint64_t v52 = v55;
        }
        else
        {
          uint64_t v56 = getWFCloudKitSyncLogObject();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
            __int16 v80 = 2112;
            v81 = v13;
            __int16 v82 = 2112;
            id v83 = v52;
            _os_log_impl(&dword_1C7D7E000, v56, OS_LOG_TYPE_ERROR, "%s Failed to get Auto Shortcuts Preferences from identifier (%@): %@", buf, 0x20u);
          }
        }
      }
      else
      {
        uint64_t v52 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          uint64_t v67 = [v4 recordID];
          *(_DWORD *)buf = 136315394;
          uint64_t v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
          __int16 v80 = 2114;
          v81 = v67;
          _os_log_impl(&dword_1C7D7E000, v52, OS_LOG_TYPE_ERROR, "%s Failed to get preferences identifier from Auto Shortcuts Preferences CKRecordID %{public}@", buf, 0x16u);
        }
      }

      goto LABEL_24;
    }
    v58 = [v4 recordType];
    v59 = [MEMORY[0x1E4FB7150] recordType];
    if ([v58 isEqualToString:v59])
    {
      int v60 = [MEMORY[0x1E4F1CB18] shouldSyncCoherence];

      if (v60)
      {
        uint64_t v61 = [(VCCKShortcutSyncService *)self database];
        BOOL v62 = +[VCCKLibrarySyncCoordinator handleUnknownItemErrorForRecord:v4 database:v61 error:0];

        if (v62)
        {
          uint64_t v13 = [v4 recordID];
          uint64_t v73 = v13;
          long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
          [(VCCKShortcutSyncService *)self addRecordIDsToSave:v15 recordIDsToDelete:0];
          goto LABEL_23;
        }
        BOOL v65 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
          __int16 v80 = 2114;
          v81 = v4;
          _os_log_impl(&dword_1C7D7E000, v65, OS_LOG_TYPE_ERROR, "%s Failed to handle unknown item error for library record: %{public}@", buf, 0x16u);
        }
LABEL_54:

        goto LABEL_25;
      }
    }
    else
    {
    }
    BOOL v65 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      uint64_t v66 = [v4 recordType];
      *(_DWORD *)buf = 136315394;
      uint64_t v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
      __int16 v80 = 2114;
      v81 = v66;
      _os_log_impl(&dword_1C7D7E000, v65, OS_LOG_TYPE_ERROR, "%s Received unknown item error for CKRecord of unexpected type: %{public}@", buf, 0x16u);
    }
    goto LABEL_54;
  }
  [(VCCKShortcutSyncService *)self updateSyncTokenInDatabaseWithBlock:&__block_literal_global_1300];
  [(VCCKShortcutSyncService *)self sendSyncFlagsIfNeeded];
LABEL_25:
}

uint64_t __59__VCCKShortcutSyncService_handleUnknownItemErrorForRecord___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSyncFlagsCloudKitRecordMetadata:0];
}

- (void)handleServerRecordChangedError:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F19D08]];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v4 userInfo];
  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F19D10]];

  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v11 = v10;
    }
    else {
      int v11 = 0;
    }
  }
  else
  {
    int v11 = 0;
  }
  id v12 = v11;

  uint64_t v13 = [v4 userInfo];
  uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F19D00]];

  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v15 = v14;
    }
    else {
      long long v15 = 0;
    }
  }
  else
  {
    long long v15 = 0;
  }
  id v16 = v15;

  long long v17 = [v8 recordType];
  long long v18 = [MEMORY[0x1E4FB7130] recordType];
  int v19 = [v17 isEqualToString:v18];

  if (v19)
  {
    [(VCCKShortcutSyncService *)self handleSendWorkflowOrderingConflictWithClientRecord:v8 serverRecord:v12 ancestorRecord:v16];
  }
  else
  {
    long long v20 = [v8 recordType];
    long long v21 = [MEMORY[0x1E4FB7160] recordType];
    int v22 = [v20 isEqualToString:v21];

    if (v22)
    {
      [(VCCKShortcutSyncService *)self handleSendSyncFlagsConflictWithClientRecord:v8 serverRecord:v12 ancestorRecord:v16];
    }
    else
    {
      id v23 = [v8 recordType];
      char v24 = [MEMORY[0x1E4FB7178] recordType];
      int v25 = [v23 isEqualToString:v24];

      if (v25)
      {
        [(VCCKShortcutSyncService *)self handleSendWorkflowConflictWithClientRecord:v8 serverRecord:v12 ancestorRecord:v16];
      }
      else
      {
        __int16 v26 = [v8 recordType];
        id v27 = [MEMORY[0x1E4FB7138] recordType];
        int v28 = [v26 isEqualToString:v27];

        if (v28)
        {
          [(VCCKShortcutSyncService *)self handleSendFolderConflictWithClientRecord:v8 serverRecord:v12 ancestorRecord:v16];
        }
        else
        {
          id v29 = [v8 recordType];
          __int16 v30 = [MEMORY[0x1E4FB7128] recordType];
          int v31 = [v29 isEqualToString:v30];

          if (v31)
          {
            [(VCCKShortcutSyncService *)self handleSendAutoShortcutsPreferencesConflictWithClientRecord:v8 serverRecord:v12 ancestorRecord:v16];
          }
          else
          {
            uint64_t v32 = [v8 recordType];
            uint64_t v33 = [MEMORY[0x1E4FB7150] recordType];
            if ([v32 isEqualToString:v33])
            {
              int v34 = [MEMORY[0x1E4F1CB18] shouldSyncCoherence];

              if (v34)
              {
                [(VCCKShortcutSyncService *)self handleSendLibraryConflictWithClientRecord:v8 serverRecord:v12 ancestorRecord:v16];
                goto LABEL_33;
              }
            }
            else
            {
            }
            BOOL v35 = getWFCloudKitSyncLogObject();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              char v36 = [v8 recordType];
              int v37 = 136315394;
              uint64_t v38 = "-[VCCKShortcutSyncService handleServerRecordChangedError:]";
              __int16 v39 = 2114;
              uint64_t v40 = v36;
              _os_log_impl(&dword_1C7D7E000, v35, OS_LOG_TYPE_ERROR, "%s Received record changed error for CKRecord of unexpected type: %{public}@", (uint8_t *)&v37, 0x16u);
            }
          }
        }
      }
    }
  }
LABEL_33:
}

- (void)handleSendFolderConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v25 = "-[VCCKShortcutSyncService handleSendFolderConflictWithClientRecord:serverRecord:ancestorRecord:]";
    _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorServerRecordChanged error for sent folder", buf, 0xCu);
  }

  id v8 = objc_opt_new();
  [MEMORY[0x1E4FB7140] hydrateItem:v8 withRecord:v6 setNilValues:0];
  uint64_t v9 = (void *)MEMORY[0x1E4FB7138];
  id v10 = [v6 recordID];
  int v11 = [v9 collectionIdentifierForRecordID:v10];

  if (v11)
  {
    id v12 = [objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v11 objectType:2];
    uint64_t v13 = [(VCCKShortcutSyncService *)self database];
    uint64_t v14 = [v13 collectionRecordForCollectionIdentifier:v11 createIfNecessary:0];

    if (v14)
    {
      long long v15 = [v8 recordSystemFieldsData];
      [v14 setCloudKitFolderRecordMetadata:v15];

      id v16 = [(VCCKShortcutSyncService *)self database];
      id v22 = 0;
      char v17 = [v16 saveRecord:v14 withDescriptor:v12 error:&v22];
      long long v18 = v22;

      if (v17)
      {
        int v19 = [v6 recordID];
        id v23 = v19;
        long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
        [(VCCKShortcutSyncService *)self addRecordIDsToSave:v20 recordIDsToDelete:0];
      }
      else
      {
        int v19 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          int v25 = "-[VCCKShortcutSyncService handleSendFolderConflictWithClientRecord:serverRecord:ancestorRecord:]";
          __int16 v26 = 2114;
          id v27 = v18;
          _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_ERROR, "%s Unable to save updated metadata to WFWorkflowCollectionRecord. %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      long long v18 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v25 = "-[VCCKShortcutSyncService handleSendFolderConflictWithClientRecord:serverRecord:ancestorRecord:]";
        __int16 v26 = 2114;
        id v27 = v11;
        _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_ERROR, "%s Unable to find a collection in the database with identifier: %{public}@, so not doing anything.", buf, 0x16u);
      }
    }
  }
  else
  {
    id v12 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v21 = [v6 recordID];
      *(_DWORD *)buf = 136315394;
      int v25 = "-[VCCKShortcutSyncService handleSendFolderConflictWithClientRecord:serverRecord:ancestorRecord:]";
      __int16 v26 = 2114;
      id v27 = v21;
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_ERROR, "%s Invalid folder record ID: %{public}@", buf, 0x16u);
    }
  }
}

- (void)handleSendWorkflowConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 recordChangeTag];
    uint64_t v13 = [v9 recordChangeTag];
    uint64_t v14 = [v10 recordChangeTag];
    *(_DWORD *)buf = 136315906;
    uint64_t v41 = "-[VCCKShortcutSyncService handleSendWorkflowConflictWithClientRecord:serverRecord:ancestorRecord:]";
    __int16 v42 = 2114;
    id v43 = v12;
    __int16 v44 = 2114;
    v45 = v13;
    __int16 v46 = 2114;
    int v47 = v14;
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorServerRecordChanged error for sent workflow, clientRecord.recordChangeTag = %{public}@, serverRecord.recordChangeTag = %{public}@, ancestorRecord.recordChangeTag = %{public}@", buf, 0x2Au);
  }
  long long v15 = [v8 recordChangeTag];

  if (v15)
  {
    id v16 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v41 = "-[VCCKShortcutSyncService handleSendWorkflowConflictWithClientRecord:serverRecord:ancestorRecord:]";
      _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_DEFAULT, "%s Server workflow record changed since last sync, trying to fetch changes in Shortcuts zone to handle", buf, 0xCu);
    }

    [(VCCKShortcutSyncService *)self fetchChangesInShortcutsZone];
  }
  else
  {
    char v17 = objc_opt_new();
    [MEMORY[0x1E4FB7140] hydrateItem:v17 withRecord:v9 setNilValues:0];
    long long v18 = [(VCCKShortcutSyncService *)self database];
    int v19 = [v9 recordID];
    long long v20 = [v19 recordName];
    long long v21 = [v18 referenceForWorkflowID:v20 includingTombstones:1];

    if (v21)
    {
      id v22 = [(VCCKShortcutSyncService *)self workflowRecordForReference:v21 properties:0];
      if (v22)
      {
        id v23 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v41 = "-[VCCKShortcutSyncService handleSendWorkflowConflictWithClientRecord:serverRecord:ancestorRecord:]";
          _os_log_impl(&dword_1C7D7E000, v23, OS_LOG_TYPE_DEFAULT, "%s Persisting server CKRecord metadata and retrying upload of this change", buf, 0xCu);
        }

        int v37 = v17;
        char v24 = [v17 recordSystemFieldsData];
        [v22 setCloudKitRecordMetadata:v24];

        int v25 = [(VCCKShortcutSyncService *)self database];
        id v38 = 0;
        char v26 = [v25 saveRecord:v22 withDescriptor:v21 error:&v38];
        id v27 = v38;

        if ((v26 & 1) == 0)
        {
          uint64_t v28 = getWFCloudKitSyncLogObject();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v41 = "-[VCCKShortcutSyncService handleSendWorkflowConflictWithClientRecord:serverRecord:ancestorRecord:]";
            __int16 v42 = 2114;
            id v43 = v27;
            __int16 v44 = 2112;
            v45 = v22;
            _os_log_impl(&dword_1C7D7E000, v28, OS_LOG_TYPE_ERROR, "%s Failed to save WFWorkflowRecord: %{public}@, localWorkflowRecord = %@", buf, 0x20u);
          }
        }
        id v29 = (void *)MEMORY[0x1E4FB7178];
        __int16 v30 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
        [v21 identifier];
        int v31 = v36 = v27;
        uint64_t v32 = [v29 recordIDWithZoneID:v30 workflowID:v31];
        __int16 v39 = v32;
        uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
        [(VCCKShortcutSyncService *)self addRecordIDsToSave:v33 recordIDsToDelete:0];

        char v17 = v37;
      }
    }
    else
    {
      id v22 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v34 = [v9 recordID];
        BOOL v35 = [v34 recordName];
        *(_DWORD *)buf = 136315394;
        uint64_t v41 = "-[VCCKShortcutSyncService handleSendWorkflowConflictWithClientRecord:serverRecord:ancestorRecord:]";
        __int16 v42 = 2114;
        id v43 = v35;
        _os_log_impl(&dword_1C7D7E000, v22, OS_LOG_TYPE_ERROR, "%s Failed to get local WFWorkflowReference for server record identifier %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)handleSendLibraryConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 recordChangeTag];
    uint64_t v13 = [v9 recordChangeTag];
    uint64_t v14 = [v10 recordChangeTag];
    *(_DWORD *)buf = 136315906;
    id v22 = "-[VCCKShortcutSyncService handleSendLibraryConflictWithClientRecord:serverRecord:ancestorRecord:]";
    __int16 v23 = 2114;
    char v24 = v12;
    __int16 v25 = 2114;
    char v26 = v13;
    __int16 v27 = 2114;
    uint64_t v28 = v14;
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorServerRecordChanged error for sent library, clientRecord.recordChangeTag = %{public}@, serverRecord.recordChangeTag = %{public}@, ancestorRecord.recordChangeTag = %{public}@", buf, 0x2Au);
  }
  long long v15 = [(VCCKShortcutSyncService *)self syncEngine];
  id v16 = [v15 database];
  char v17 = [v9 recordID];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__VCCKShortcutSyncService_handleSendLibraryConflictWithClientRecord_serverRecord_ancestorRecord___block_invoke;
  v19[3] = &unk_1E6540630;
  v19[4] = self;
  id v20 = v9;
  id v18 = v9;
  [v16 fetchRecordWithID:v17 completionHandler:v19];
}

void __97__VCCKShortcutSyncService_handleSendLibraryConflictWithClientRecord_serverRecord_ancestorRecord___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    int v11 = getWFCloudKitSyncLogObject();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315138;
    char v17 = "-[VCCKShortcutSyncService handleSendLibraryConflictWithClientRecord:serverRecord:ancestorRecord:]_block_invoke";
    uint64_t v14 = "%s Failed to fetch server record for library";
LABEL_10:
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
    goto LABEL_11;
  }
  uint64_t v7 = [*(id *)(a1 + 32) database];
  id v8 = [*(id *)(a1 + 32) logger];
  BOOL v9 = +[VCCKLibrarySyncCoordinator handleServerRecordChangedErrorForRecord:v5 database:v7 logger:v8 error:0];

  id v10 = getWFCloudKitSyncLogObject();
  int v11 = v10;
  if (!v9)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315138;
    char v17 = "-[VCCKShortcutSyncService handleSendLibraryConflictWithClientRecord:serverRecord:ancestorRecord:]_block_invoke";
    uint64_t v14 = "%s Failed to handle CKErrorServerRecordChanged error for library";
    goto LABEL_10;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    char v17 = "-[VCCKShortcutSyncService handleSendLibraryConflictWithClientRecord:serverRecord:ancestorRecord:]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEBUG, "%s Successfully handled server record change for library", buf, 0xCu);
  }

  id v12 = *(void **)(a1 + 32);
  int v11 = [*(id *)(a1 + 40) recordID];
  long long v15 = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  [v12 addRecordIDsToSave:v13 recordIDsToDelete:0];

LABEL_11:
}

- (void)handleSendAutoShortcutsPreferencesConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 recordChangeTag];
    uint64_t v13 = [v9 recordChangeTag];
    uint64_t v14 = [v10 recordChangeTag];
    *(_DWORD *)buf = 136315906;
    id v22 = "-[VCCKShortcutSyncService handleSendAutoShortcutsPreferencesConflictWithClientRecord:serverRecord:ancestorRecord:]";
    __int16 v23 = 2114;
    char v24 = v12;
    __int16 v25 = 2114;
    char v26 = v13;
    __int16 v27 = 2114;
    uint64_t v28 = v14;
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorServerRecordChanged error for sent auto shortcuts preferences, clientRecord.recordChangeTag = %{public}@, serverRecord.recordChangeTag = %{public}@, ancestorRecord.recordChangeTag = %{public}@", buf, 0x2Au);
  }
  long long v15 = [(VCCKShortcutSyncService *)self syncEngine];
  id v16 = [v15 database];
  char v17 = [v9 recordID];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __114__VCCKShortcutSyncService_handleSendAutoShortcutsPreferencesConflictWithClientRecord_serverRecord_ancestorRecord___block_invoke;
  v19[3] = &unk_1E6540630;
  v19[4] = self;
  id v20 = v9;
  id v18 = v9;
  [v16 fetchRecordWithID:v17 completionHandler:v19];
}

void __114__VCCKShortcutSyncService_handleSendAutoShortcutsPreferencesConflictWithClientRecord_serverRecord_ancestorRecord___block_invoke(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4FB7128];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  [MEMORY[0x1E4FB7140] hydrateItem:v5 withRecord:v4 setNilValues:0];

  id v6 = [v5 appDescriptor];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) autoShortcutsPreferencesWithCloudKitAutoShortcutsPreferences:v5];
    id v8 = [*(id *)(a1 + 32) database];
    id v16 = 0;
    [v8 mergeAutoShortcutsPreferencesWithNewPreferences:v7 error:&v16];
    id v9 = v16;

    if (v9)
    {
      id v10 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v19 = "-[VCCKShortcutSyncService handleSendAutoShortcutsPreferencesConflictWithClientRecord:serverRecord:ancestor"
              "Record:]_block_invoke";
        __int16 v20 = 2114;
        id v21 = v9;
        _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Failed to merge auto shortcuts preferences with error: %{public}@", buf, 0x16u);
      }
    }
    int v11 = *(void **)(a1 + 32);
    id v12 = [*(id *)(a1 + 40) recordID];
    char v17 = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [v11 addRecordIDsToSave:v13 recordIDsToDelete:0];
  }
  else
  {
    uint64_t v14 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v19 = "-[VCCKShortcutSyncService handleSendAutoShortcutsPreferencesConflictWithClientRecord:serverRecord:ancestorRe"
            "cord:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_FAULT, "%s Server record for auto shortcuts preferences has a nil app descriptor", buf, 0xCu);
    }

    long long v15 = *(void **)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) recordID];
    v22[0] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [v15 addRecordIDsToSave:0 recordIDsToDelete:v9];
  }
}

- (void)handleSendSyncFlagsConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "-[VCCKShortcutSyncService handleSendSyncFlagsConflictWithClientRecord:serverRecord:ancestorRecord:]";
    _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorServerRecordChanged error for sent sync flags", buf, 0xCu);
  }

  id v8 = objc_opt_new();
  [MEMORY[0x1E4FB7140] hydrateItem:v8 withRecord:v6 setNilValues:0];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__VCCKShortcutSyncService_handleSendSyncFlagsConflictWithClientRecord_serverRecord_ancestorRecord___block_invoke;
  v10[3] = &unk_1E6540428;
  id v11 = v8;
  id v9 = v8;
  [(VCCKShortcutSyncService *)self updateSyncTokenInDatabaseWithBlock:v10];
  [(VCCKShortcutSyncService *)self sendSyncFlagsIfNeeded];
}

void __99__VCCKShortcutSyncService_handleSendSyncFlagsConflictWithClientRecord_serverRecord_ancestorRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 recordSystemFieldsData];
  [v3 setSyncFlagsCloudKitRecordMetadata:v4];
}

- (void)handleSendWorkflowOrderingConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[VCCKShortcutSyncService handleSendWorkflowOrderingConflictWithClientRecord:serverRecord:ancestorRecord:]";
    _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorServerRecordChanged error for sent workflow ordering", buf, 0xCu);
  }

  if ([(VCCKShortcutSyncService *)self mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:v6])
  {
    id v8 = [v6 recordID];
    id v10 = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    [(VCCKShortcutSyncService *)self addRecordIDsToSave:v9 recordIDsToDelete:0];
  }
}

- (void)updateSyncTokenInDatabaseWithBlock:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(VCCKShortcutSyncService *)self database];
  id v6 = [v5 syncToken];
  uint64_t v7 = (void *)[v6 newTokenWithCopiedPayload];
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  id v11 = v9;

  v4[2](v4, v11);
  id v10 = [(VCCKShortcutSyncService *)self database];
  [v10 setSyncToken:v11];
}

- (void)handleFetchedDeletionOfAutoShortcutsPreferencesWithRecordID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[VCCKShortcutSyncService handleFetchedDeletionOfAutoShortcutsPreferencesWithRecordID:]";
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Handling fetched deleted record with CKRecordID: %{public}@", buf, 0x16u);
  }

  id v6 = [MEMORY[0x1E4FB7128] identifierForRecordID:v4];
  uint64_t v7 = [(VCCKShortcutSyncService *)self database];
  uint64_t v8 = 0;
  [v7 deleteAutoShortcutsPreferencesForIdentifier:v6 error:&v8];
}

- (void)handleFetchedDeletionOfRecordWithID:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
    __int16 v45 = 2114;
    id v46 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Handling fetched deleted record with CKRecordID: %{public}@", buf, 0x16u);
  }

  int v6 = [MEMORY[0x1E4FB7138] isFolderRecordID:v4];
  if (!v6)
  {
    uint64_t v8 = [v4 recordName];
    id v9 = [(VCCKShortcutSyncService *)self database];
    uint64_t v10 = [v9 referenceForWorkflowID:v8 includingTombstones:1];
LABEL_7:
    __int16 v11 = (void *)v10;

    if (v11)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __63__VCCKShortcutSyncService_handleFetchedDeletionOfRecordWithID___block_invoke;
      aBlock[3] = &unk_1E6541F68;
      aBlock[4] = self;
      id v12 = v11;
      __int16 v42 = v12;
      uint64_t v13 = (void (**)(void))_Block_copy(aBlock);
      if (v6)
      {
        uint64_t v14 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
          _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_DEFAULT, "%s Deleting folder since we fetched a deletion for a folder.", buf, 0xCu);
        }

        v13[2](v13);
        goto LABEL_26;
      }
      id v18 = [(VCCKShortcutSyncService *)self database];
      id v40 = 0;
      int v19 = [v18 recordWithDescriptor:v12 error:&v40];
      id v20 = v40;

      if (v19)
      {
        if (![v19 isDeleted])
        {
          uint64_t v24 = [v19 syncHash];
          uint64_t v25 = [v19 lastSyncedHash];
          char v26 = getWFCloudKitSyncLogObject();
          __int16 v27 = v26;
          if (v24 == v25)
          {
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              uint64_t v28 = [v12 identifier];
              *(_DWORD *)buf = 136315394;
              __int16 v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
              __int16 v45 = 2114;
              id v46 = v28;
              _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_INFO, "%s Local WFWorkflowRecord with identifier %{public}@ unchanged since last sync, proceeding to delete local workflow", buf, 0x16u);
            }
          }
          else
          {
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v29 = [v12 identifier];
              *(_DWORD *)buf = 136315650;
              __int16 v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
              __int16 v45 = 2114;
              id v46 = v29;
              __int16 v47 = 2112;
              uint64_t v48 = v19;
              _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_DEFAULT, "%s Found conflict for workflow with identifier %{public}@: remote record deleted, local changed WFRecord = %@", buf, 0x20u);
            }
            if (![MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
            {
              __int16 v30 = (void *)[objc_alloc(MEMORY[0x1E4FB7398]) initWithRecord:v19];
              [v30 setDeleted:1];
              int v31 = [(VCCKShortcutSyncService *)self database];
              id v39 = v20;
              uint64_t v32 = [v31 createWorkflowWithOptions:v30 error:&v39];
              id v23 = v39;

              if (v32)
              {
                uint64_t v33 = [(VCCKShortcutSyncService *)self database];
                [v12 identifier];
                id v38 = v32;
                v35 = int v34 = v30;
                char v36 = [v33 referenceForWorkflowID:v35 includingTombstones:1];

                __int16 v30 = v34;
                uint64_t v32 = v38;

                int v37 = [(VCCKShortcutSyncService *)self database];
                [v37 setConflictingReference:v36 forReference:v38];
              }
              else
              {
                char v36 = getWFCloudKitSyncLogObject();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  __int16 v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
                  __int16 v45 = 2114;
                  id v46 = v23;
                  __int16 v47 = 2112;
                  uint64_t v48 = 0;
                  _os_log_impl(&dword_1C7D7E000, v36, OS_LOG_TYPE_ERROR, "%s Failed to create workflow for WFWorkflowReference: %{public}@, conflictingRemoteReference = %@", buf, 0x20u);
                }
              }

              goto LABEL_25;
            }
          }
LABEL_24:
          v13[2](v13);
          id v23 = v20;
LABEL_25:

LABEL_26:
          goto LABEL_27;
        }
        id v21 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = [v12 identifier];
          *(_DWORD *)buf = 136315394;
          __int16 v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
          __int16 v45 = 2114;
          id v46 = v22;
          _os_log_impl(&dword_1C7D7E000, v21, OS_LOG_TYPE_DEFAULT, "%s Local WFWorkflowRecord with identifier %{public}@ is already tombstone, deleting it", buf, 0x16u);
        }
      }
      else
      {
        id v21 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
          __int16 v45 = 2114;
          id v46 = v20;
          __int16 v47 = 2112;
          uint64_t v48 = v12;
          _os_log_impl(&dword_1C7D7E000, v21, OS_LOG_TYPE_ERROR, "%s Failed to load local WFWorkflowRecord, proceeding to delete local workflow without checking for conflicts: %{public}@, localWorkflowReference = %@", buf, 0x20u);
        }
      }

      goto LABEL_24;
    }
    id v12 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
      __int16 v45 = 2114;
      id v46 = v4;
      long long v15 = "%s No local descriptor found for fetched workflow or folder deletion with CKRecordID %{public}@";
      id v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
LABEL_20:
      _os_log_impl(&dword_1C7D7E000, v16, v17, v15, buf, 0x16u);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  uint64_t v7 = [MEMORY[0x1E4FB7138] collectionIdentifierForRecordID:v4];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(VCCKShortcutSyncService *)self database];
    uint64_t v10 = [v9 collectionWithIdentifier:v8];
    goto LABEL_7;
  }
  id v12 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
    __int16 v45 = 2114;
    id v46 = v4;
    long long v15 = "%s Malformed folder identifier: %{public}@";
    id v16 = v12;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    goto LABEL_20;
  }
LABEL_27:
}

void __63__VCCKShortcutSyncService_handleFetchedDeletionOfRecordWithID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) database];
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = 0;
  char v4 = [v2 deleteReference:v3 tombstone:0 deleteConflictIfPresent:1 error:&v8];
  id v5 = v8;

  if ((v4 & 1) == 0)
  {
    int v6 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      uint64_t v10 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]_block_invoke";
      __int16 v11 = 2114;
      id v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to delete descriptor for fetched deletion: %{public}@, localDescriptor = %@", buf, 0x20u);
    }
  }
}

- (void)handleFetchedAutoShortcutsPreferencesRecord:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v23 = "-[VCCKShortcutSyncService handleFetchedAutoShortcutsPreferencesRecord:]";
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Handling fetched auto shortcuts preferences record: %@", buf, 0x16u);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4FB7128]);
  [MEMORY[0x1E4FB7140] hydrateItem:v6 withRecord:v4 setNilValues:0];
  uint64_t v7 = (void *)MEMORY[0x1E4FB7128];
  id v8 = [v4 recordID];
  id v9 = [v7 identifierForRecordID:v8];

  uint64_t v10 = [(VCCKShortcutSyncService *)self database];
  id v21 = 0;
  __int16 v11 = [v10 autoShortcutsPreferencesForIdentifier:v9 error:&v21];
  id v12 = v21;

  __int16 v13 = [v11 cloudKitMetadata];
  char v14 = VCCKCheckRemoteModificationDateNewerThanLocal(v13, v4);

  uint64_t v15 = getWFCloudKitSyncLogObject();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[VCCKShortcutSyncService handleFetchedAutoShortcutsPreferencesRecord:]";
      _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_INFO, "%s Remote modification date is newer than the one saved locally, updating local auto shortcuts preferences", buf, 0xCu);
    }

    uint64_t v15 = [(VCCKShortcutSyncService *)self autoShortcutsPreferencesWithCloudKitAutoShortcutsPreferences:v6];
    os_log_type_t v17 = [(VCCKShortcutSyncService *)self database];
    id v20 = v12;
    [v17 updateAutoShortcutsPreferencesWithNewPreferences:v15 error:&v20];
    id v18 = v20;

    if (v18)
    {
      int v19 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v23 = "-[VCCKShortcutSyncService handleFetchedAutoShortcutsPreferencesRecord:]";
        __int16 v24 = 2114;
        id v25 = v18;
        _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_ERROR, "%s Failed to save auto shortcuts preferences with error: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[VCCKShortcutSyncService handleFetchedAutoShortcutsPreferencesRecord:]";
      _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_INFO, "%s Remote modification date is older than the one saved locally, skipping updating local auto shortcuts preferences", buf, 0xCu);
    }
    id v18 = v12;
  }
}

- (void)handleFetchedSyncFlagsRecord:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[VCCKShortcutSyncService handleFetchedSyncFlagsRecord:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Handling fetched sync flags CKRecord: %{public}@", buf, 0x16u);
  }

  id v6 = objc_opt_new();
  [MEMORY[0x1E4FB7140] hydrateItem:v6 withRecord:v4 setNilValues:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__VCCKShortcutSyncService_handleFetchedSyncFlagsRecord___block_invoke;
  v8[3] = &unk_1E6540428;
  id v7 = v6;
  id v9 = v7;
  [(VCCKShortcutSyncService *)self updateSyncTokenInDatabaseWithBlock:v8];
  if ([v7 migratedVoiceShortcuts]) {
    [MEMORY[0x1E4FB7168] setVoiceShortcutMigrationDidSync:1];
  }
  if ([v7 defaultShortcutsVersion]) {
    objc_msgSend(MEMORY[0x1E4FB7168], "setDefaultShortcutsVersion:", objc_msgSend(v7, "defaultShortcutsVersion"));
  }
  objc_msgSend(MEMORY[0x1E4FB7168], "setLastSyncedFlagsHash:", objc_msgSend(MEMORY[0x1E4FB7168], "syncedFlagsHash"));
}

void __56__VCCKShortcutSyncService_handleFetchedSyncFlagsRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 recordSystemFieldsData];
  [v3 setSyncFlagsCloudKitRecordMetadata:v4];
}

- (void)handleFetchedFolderRecord:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v3 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [v59 recordID];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[VCCKShortcutSyncService handleFetchedFolderRecord:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v87 = (uint64_t (*)(uint64_t, uint64_t))v59;
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_INFO, "%s Handling fetched folder CKRecord with CKRecordID %{public}@, CKRecord = %@", buf, 0x20u);
  }
  id v5 = (void *)MEMORY[0x1E4FB7138];
  id v6 = [v59 recordID];
  uint64_t v63 = [v5 collectionIdentifierForRecordID:v6];

  if (!v63)
  {
    oslog = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = [v59 recordID];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[VCCKShortcutSyncService handleFetchedFolderRecord:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_1C7D7E000, oslog, OS_LOG_TYPE_ERROR, "%s Failed to retrieve collection identifier from folder CKRecord, CKRecordID = %{public}@", buf, 0x16u);
    }
    goto LABEL_50;
  }
  id v7 = objc_opt_new();
  id v8 = (void *)MEMORY[0x1C87C4C10]([MEMORY[0x1E4FB7140] hydrateItem:v7 withRecord:v59 setNilValues:0]);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v63 objectType:2];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v87 = __Block_byref_object_copy__1274;
  uint64_t v88 = __Block_byref_object_dispose__1275;
  uint64_t v10 = [(VCCKShortcutSyncService *)self database];
  id v89 = [v10 collectionRecordForCollectionIdentifier:v63 createIfNecessary:0];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__VCCKShortcutSyncService_handleFetchedFolderRecord___block_invoke;
  aBlock[3] = &unk_1E65405E0;
  __int16 v80 = buf;
  oslog = v7;
  v77 = oslog;
  id v78 = self;
  id v11 = v9;
  id v79 = v11;
  __int16 v12 = (uint64_t (**)(void *, id *))_Block_copy(aBlock);
  id v13 = *(void **)(*(void *)&buf[8] + 40);
  if (v13)
  {
    uint64_t v14 = [v13 cloudKitFolderRecordMetadata];
    if (!v14) {
      goto LABEL_19;
    }
    uint64_t v15 = (void *)MEMORY[0x1E4FB7140];
    BOOL v16 = [*(id *)(*(void *)&buf[8] + 40) cloudKitFolderRecordMetadata];
    os_log_type_t v17 = [v15 recordFromSystemFieldsData:v16 error:0];
    id v18 = [v17 recordChangeTag];
    int v19 = [v59 recordChangeTag];
    id v20 = v18;
    id v21 = v19;
    if (v20 == v21)
    {
    }
    else
    {
      id v22 = v21;
      if (!v20 || !v21)
      {

        goto LABEL_19;
      }
      char v23 = [v20 isEqualToString:v21];

      if ((v23 & 1) == 0)
      {
LABEL_19:
        uint64_t v28 = [*(id *)(*(void *)&buf[8] + 40) cloudKitFolderRecordMetadata];
        int v29 = VCCKCheckRemoteModificationDateNewerThanLocal(v28, v59);

        if (v29)
        {
          id v75 = 0;
          char v30 = v12[2](v12, &v75);
          id v26 = v75;
          if (v30) {
            goto LABEL_21;
          }
LABEL_23:
          int v31 = 0;
          goto LABEL_24;
        }
LABEL_22:
        id v26 = 0;
        goto LABEL_23;
      }
    }
    __int16 v27 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v82 = 136315394;
      id v83 = "-[VCCKShortcutSyncService handleFetchedFolderRecord:]";
      __int16 v84 = 2114;
      v85 = v63;
      _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_INFO, "%s Local WFWorkflowCollectionRecord with identifier %{public}@ has the same recordChangeTag as fetched folder record, this is likely our own change, discarding it.", v82, 0x16u);
    }

    goto LABEL_22;
  }
  id v25 = [(VCCKShortcutSyncService *)self database];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __53__VCCKShortcutSyncService_handleFetchedFolderRecord___block_invoke_266;
  v71[3] = &unk_1E6540608;
  uint64_t v74 = buf;
  v71[4] = self;
  id v72 = v63;
  uint64_t v73 = v12;
  id v70 = 0;
  [v25 performTransactionWithReason:@"save fetched folder record" block:v71 error:&v70];
  id v26 = v70;

LABEL_21:
  int v31 = 1;
LABEL_24:

  _Block_object_dispose(buf, 8);
  if (!v31) {
    goto LABEL_49;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v32 = [(VCCKShortcutSyncService *)self database];
  uint64_t v33 = [v32 allCollections];
  obuint64_t j = [v33 descriptors];

  uint64_t v61 = [obj countByEnumeratingWithState:&v66 objects:v81 count:16];
  if (!v61) {
    goto LABEL_48;
  }
  uint64_t v60 = *(void *)v67;
  do
  {
    uint64_t v34 = 0;
    do
    {
      if (*(void *)v67 != v60) {
        objc_enumerationMutation(obj);
      }
      BOOL v35 = *(void **)(*((void *)&v66 + 1) + 8 * v34);
      char v36 = (void *)MEMORY[0x1C87C4C10]();
      int v37 = [(VCCKShortcutSyncService *)self database];
      id v38 = [v35 identifier];
      id v39 = [v37 collectionRecordForCollectionIdentifier:v38 createIfNecessary:0];

      id v40 = [v39 lastRemoteCollectionOrdering];
      uint64_t v41 = [v39 lastRemoteCollectionOrderingSubset];
      if (![v40 containsObject:v63]
        || ([v41 containsObject:v63] & 1) != 0)
      {
        int v42 = 1;
        goto LABEL_33;
      }
      id v43 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        __int16 v44 = [v35 identifier];
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[VCCKShortcutSyncService handleFetchedFolderRecord:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v63;
        *(_WORD *)&buf[22] = 2114;
        uint64_t v87 = v44;
        _os_log_impl(&dword_1C7D7E000, v43, OS_LOG_TYPE_INFO, "%s Merging received collection %{public}@ into collection %{public}@", buf, 0x20u);
      }
      __int16 v45 = [v39 collectionOrdering];
      uint64_t v46 = [(VCCKShortcutSyncService *)self mergedOrderingFromLocalOrdering:v45 previousOrdering:v41 remoteOrdering:v40];
      [v39 setCollectionOrdering:v46];

      __int16 v47 = [(VCCKShortcutSyncService *)self database];
      id v65 = v26;
      LOBYTE(v46) = [v47 saveRecord:v39 withDescriptor:v35 error:&v65];
      id v48 = v65;

      if (v46)
      {
        uint64_t v49 = [(VCCKShortcutSyncService *)self database];
        uint64_t v50 = [v35 identifier];
        v51 = [v49 collectionRecordForCollectionIdentifier:v50 createIfNecessary:0];

        uint64_t v52 = [v51 collectionOrdering];
        uint64_t v53 = [(VCCKShortcutSyncService *)self calculateSubsetForRemoteOrdering:v40 withLocalOrdering:v52];
        [v51 setLastRemoteCollectionOrderingSubset:v53];

        char v54 = [(VCCKShortcutSyncService *)self database];
        id v64 = v48;
        LOBYTE(v53) = [v54 saveRecord:v51 withDescriptor:v35 error:&v64];
        id v26 = v64;

        if (v53)
        {
          int v42 = 1;
          id v39 = v51;
          goto LABEL_33;
        }
        v55 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[VCCKShortcutSyncService handleFetchedFolderRecord:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v35;
          *(_WORD *)&buf[22] = 2114;
          uint64_t v87 = (uint64_t (*)(uint64_t, uint64_t))v26;
          _os_log_impl(&dword_1C7D7E000, v55, OS_LOG_TYPE_ERROR, "%s Failed to save potential parent WFWorkflowCollectionRecord with descriptor %@: %{public}@", buf, 0x20u);
        }
        id v39 = v51;
        id v48 = v26;
      }
      else
      {
        v55 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[VCCKShortcutSyncService handleFetchedFolderRecord:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v35;
          *(_WORD *)&buf[22] = 2114;
          uint64_t v87 = (uint64_t (*)(uint64_t, uint64_t))v48;
          _os_log_impl(&dword_1C7D7E000, v55, OS_LOG_TYPE_ERROR, "%s Failed to save potential parent WFWorkflowCollectionRecord with descriptor %@: %{public}@", buf, 0x20u);
        }
      }

      int v42 = 0;
      id v26 = v48;
LABEL_33:

      if (!v42) {
        goto LABEL_48;
      }
      ++v34;
    }
    while (v61 != v34);
    uint64_t v56 = [obj countByEnumeratingWithState:&v66 objects:v81 count:16];
    uint64_t v61 = v56;
  }
  while (v56);
LABEL_48:

LABEL_49:
LABEL_50:
}

uint64_t __53__VCCKShortcutSyncService_handleFetchedFolderRecord___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) name];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setName:v4];

  id v5 = objc_alloc(MEMORY[0x1E4FB4A50]);
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) icon];
  id v7 = objc_msgSend(v5, "initWithBackgroundColorValue:glyphCharacter:customImageData:", objc_msgSend(v6, "backgroundColorValue"), objc_msgSend(*(id *)(a1 + 32), "icon"), 0);
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIcon:v7];

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setLastSyncedHash:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "computedSyncHash"));
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setLastSyncedEncryptedSchemaVersion:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "wantedEncryptedSchemaVersion"));
  id v8 = [*(id *)(a1 + 32) recordSystemFieldsData];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCloudKitFolderRecordMetadata:v8];

  id v9 = [*(id *)(a1 + 40) database];
  uint64_t v10 = [v9 saveRecord:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withDescriptor:*(void *)(a1 + 48) error:a2];

  if ((v10 & 1) == 0)
  {
    id v11 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *a2;
      int v15 = 136315650;
      BOOL v16 = "-[VCCKShortcutSyncService handleFetchedFolderRecord:]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      uint64_t v20 = v13;
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s Failed to save WFWorkflowCollectionRecord with descriptor %@: %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
  return v10;
}

uint64_t __53__VCCKShortcutSyncService_handleFetchedFolderRecord___block_invoke_266(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) database];
  uint64_t v3 = [v2 collectionRecordForCollectionIdentifier:*(void *)(a1 + 40) createIfNecessary:1];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v6();
}

- (void)handleFetchedWorkflowRecord:(id)a3
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 recordID];
    *(_DWORD *)buf = 136315650;
    long long v102 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
    __int16 v103 = 2114;
    uint64_t v104 = (uint64_t)v6;
    __int16 v105 = 2112;
    id v106 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Handling fetched workflow CKRecord with CKRecordID %{public}@, CKRecord = %@", buf, 0x20u);
  }
  id v7 = (void *)MEMORY[0x1C87C4C10]();
  id v8 = objc_opt_new();
  [MEMORY[0x1E4FB7140] hydrateItem:v8 withRecord:v4 setNilValues:0];
  id v100 = 0;
  id v9 = [v8 recordRepresentationWithError:&v100];
  id v10 = v100;
  id v11 = v10;
  if (v9)
  {

    uint64_t v12 = [v4 recordID];
    uint64_t v13 = [v12 recordName];

    char v99 = 0;
    [(VCCKShortcutSyncService *)self handleNameConflictsForFetchedWorkflowRecord:v9 identifier:v13 shouldMarkFetchedRecordAsTombstone:&v99];
    if (v99) {
      [v9 setDeleted:1];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke;
    aBlock[3] = &unk_1E6540540;
    void aBlock[4] = self;
    id v14 = v13;
    id v98 = v14;
    int v15 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    BOOL v16 = [(VCCKShortcutSyncService *)self database];
    __int16 v17 = [v16 referenceForWorkflowID:v14 includingTombstones:1];

    uint64_t v18 = getWFCloudKitSyncLogObject();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (!v17)
    {
      if (v19)
      {
        *(_DWORD *)buf = 136315394;
        long long v102 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
        __int16 v103 = 2114;
        uint64_t v104 = (uint64_t)v14;
        _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_INFO, "%s No local WFWorkflowReference exists for identifier %{public}@, proceeding to create new workflow with fetched record.", buf, 0x16u);
      }

      uint64_t v32 = [(VCCKShortcutSyncService *)self database];
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_249;
      v94[3] = &unk_1E6540568;
      v94[4] = self;
      uint64_t v20 = &v95;
      id v95 = v14;
      int v29 = &v96;
      id v96 = v9;
      id v93 = 0;
      [v32 performTransactionWithReason:@"save fetched workflow record" block:v94 error:&v93];
      id v30 = v93;

      v15[2](v15, 1);
      goto LABEL_27;
    }
    if (v19)
    {
      *(_DWORD *)buf = 136315394;
      long long v102 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
      __int16 v103 = 2112;
      uint64_t v104 = (uint64_t)v17;
      _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_INFO, "%s Found existing local WFWorkflowReference for fetched workflow: %@", buf, 0x16u);
    }

    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_253;
    v90[3] = &unk_1E6540590;
    v90[4] = self;
    uint64_t v20 = &v91;
    id v21 = v9;
    id v91 = v21;
    __int16 v80 = v15;
    uint64_t v92 = v15;
    id v78 = _Block_copy(v90);
    id v22 = [(VCCKShortcutSyncService *)self database];
    id v89 = 0;
    char v23 = [v22 recordWithDescriptor:v17 error:&v89];
    id v79 = v89;

    v81 = v23;
    if (!v23)
    {
      uint64_t v33 = getWFCloudKitSyncLogObject();
      id v30 = v79;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        long long v102 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
        __int16 v103 = 2114;
        uint64_t v104 = (uint64_t)v79;
        __int16 v105 = 2112;
        id v106 = v17;
        _os_log_impl(&dword_1C7D7E000, v33, OS_LOG_TYPE_ERROR, "%s Failed to load local WFWorkflowRecord for WFWorkflowReference, proceeding to save fetched omp without checking for conflicts: %{public}@, localWorkflowReference = %@", buf, 0x20u);
      }

      uint64_t v28 = v78;
      (*((void (**)(void *, void *))v78 + 2))(v78, v17);
      int v29 = (id *)&v92;
      goto LABEL_25;
    }
    if (v99)
    {
      __int16 v24 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v102 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
        __int16 v103 = 2114;
        uint64_t v104 = (uint64_t)v14;
        id v25 = "%s Local WFWorkflowRecord with identifier %{public}@ should be marked as tombstone, proceeding to save fet"
              "ched record as-is.";
        id v26 = v24;
        os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
        _os_log_impl(&dword_1C7D7E000, v26, v27, v25, buf, 0x16u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    uint64_t v34 = [v23 cloudKitRecordMetadata];
    if (!v34) {
      goto LABEL_40;
    }
    v76 = (void *)v34;
    BOOL v35 = (void *)MEMORY[0x1E4FB7140];
    char v36 = [v23 cloudKitRecordMetadata];
    int v37 = [v35 recordFromSystemFieldsData:v36 error:0];
    id v38 = [v37 recordChangeTag];
    id v39 = [v4 recordChangeTag];
    id v40 = v38;
    id v41 = v39;
    if (v40 == v41)
    {

      uint64_t v20 = &v91;
    }
    else
    {
      int v42 = v41;
      if (!v40 || !v41)
      {

        uint64_t v20 = &v91;
        char v23 = v81;
        goto LABEL_40;
      }
      char v74 = [v40 isEqualToString:v41];

      uint64_t v20 = &v91;
      char v23 = v81;
      if ((v74 & 1) == 0)
      {
LABEL_40:
        __int16 v44 = [v23 cloudKitRecordMetadata];
        int v45 = VCCKCheckRemoteModificationDateNewerThanLocal(v44, v4);

        if (!v45)
        {
          id v30 = v79;
          int v29 = (id *)&v92;
          uint64_t v28 = v78;
          goto LABEL_26;
        }
        id v77 = v21;
        id v46 = v23;
        __int16 v47 = getWFCloudKitSyncLogObject();
        id v75 = v46;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v73 = [v77 smartPromptPerWorkflowStates];
          uint64_t v72 = [v73 count];
          id v48 = [v77 modificationDate];
          uint64_t v49 = [v46 smartPromptPerWorkflowStates];
          uint64_t v50 = [v49 count];
          v51 = [v46 modificationDate];
          *(_DWORD *)buf = 136316162;
          long long v102 = "WFMergeSmartPromptPermissionsIntoFetchedRecordIfNeeded";
          __int16 v103 = 2048;
          uint64_t v104 = v72;
          __int16 v105 = 2112;
          id v106 = v48;
          __int16 v107 = 2048;
          uint64_t v108 = v50;
          __int16 v109 = 2112;
          long long v110 = v51;
          _os_log_impl(&dword_1C7D7E000, v47, OS_LOG_TYPE_DEFAULT, "%s Syncing smart prompts: %lu in fetchedRecord (modificationDate: %@), %lu in localRecord (modificationDate: %@).", buf, 0x34u);

          id v46 = v75;
        }

        uint64_t v52 = [v77 modificationDate];
        uint64_t v53 = [v46 modificationDate];
        uint64_t v54 = [v52 compare:v53];

        v55 = getWFCloudKitSyncLogObject();
        BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
        if (v54 == 1)
        {
          if (v56)
          {
            *(_DWORD *)buf = 136315138;
            long long v102 = "WFMergeSmartPromptPermissionsIntoFetchedRecordIfNeeded";
            _os_log_impl(&dword_1C7D7E000, v55, OS_LOG_TYPE_DEFAULT, "%s Fetched authorizations are newer than local, they will be used instead of local.", buf, 0xCu);
          }
          uint64_t v20 = &v91;
          v57 = v75;
        }
        else
        {
          if (v56)
          {
            *(_DWORD *)buf = 136315138;
            long long v102 = "WFMergeSmartPromptPermissionsIntoFetchedRecordIfNeeded";
            _os_log_impl(&dword_1C7D7E000, v55, OS_LOG_TYPE_DEFAULT, "%s Fetched authorizations are older than local, will ignore them and overwrite them with local.", buf, 0xCu);
          }

          v57 = v75;
          v55 = [v75 smartPromptPerWorkflowStates];
          [v77 setSmartPromptPerWorkflowStates:v55];
          uint64_t v20 = &v91;
        }

        uint64_t v58 = [v57 syncHash];
        if (v58 != [v57 lastSyncedHash])
        {
          unsigned __int8 v88 = 0;
          WFAddWatchWorkflowTypeToFetchedRecordIfNeeded(v77, v57, (uint64_t)&v88);
          id v59 = v57;
          int v60 = v88;
          uint64_t v61 = getWFCloudKitSyncLogObject();
          BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
          if (v60)
          {
            id v30 = v79;
            int v29 = (id *)&v92;
            if (v62)
            {
              *(_DWORD *)buf = 136315394;
              long long v102 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
              __int16 v103 = 2114;
              uint64_t v104 = (uint64_t)v14;
              _os_log_impl(&dword_1C7D7E000, v61, OS_LOG_TYPE_DEFAULT, "%s Local WFWorkflowRecord with identifier %{public}@ is equivalent to fetched record, proceeding to save fetched record as-is.", buf, 0x16u);
            }

            uint64_t v28 = v78;
            (*((void (**)(void *, void *))v78 + 2))(v78, v17);
            goto LABEL_25;
          }
          uint64_t v63 = v59;
          if (v62)
          {
            *(_DWORD *)buf = 136315906;
            long long v102 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
            __int16 v103 = 2114;
            uint64_t v104 = (uint64_t)v14;
            __int16 v105 = 2112;
            id v106 = v77;
            __int16 v107 = 2112;
            uint64_t v108 = (uint64_t)v59;
            _os_log_impl(&dword_1C7D7E000, v61, OS_LOG_TYPE_DEFAULT, "%s Found conflict for workflow with identifier %{public}@: fetched WFRecord = %@, local WFRecord = %@", buf, 0x2Au);
          }

          if (![MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
          {
            id v64 = [(VCCKShortcutSyncService *)self database];
            id v65 = [v64 remoteConflictingReferenceForReference:v17];

            if (v65)
            {
              long long v66 = getWFCloudKitSyncLogObject();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                long long v102 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
                __int16 v103 = 2112;
                uint64_t v104 = (uint64_t)v17;
                _os_log_impl(&dword_1C7D7E000, v66, OS_LOG_TYPE_DEFAULT, "%s WFWorkflowReference %@ is a local counterpart of an existing conflict, updating its remote counterpart", buf, 0x16u);
              }

              uint64_t v28 = v78;
              (*((void (**)(void *, void *))v78 + 2))(v78, v65);
              id v30 = v79;
              int v29 = (id *)&v92;
              char v23 = v81;
            }
            else
            {
              long long v67 = [(VCCKShortcutSyncService *)self database];
              long long v68 = [v67 localConflictingReferenceForReference:v17];

              if (v68)
              {
                long long v69 = getWFCloudKitSyncLogObject();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  long long v102 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
                  __int16 v103 = 2112;
                  uint64_t v104 = (uint64_t)v17;
                  _os_log_impl(&dword_1C7D7E000, v69, OS_LOG_TYPE_DEFAULT, "%s WFWorkflowReference %@ is a remote counterpart of an existing conflict, updating it", buf, 0x16u);
                }

                uint64_t v28 = v78;
                (*((void (**)(void *, void *))v78 + 2))(v78, v17);
                id v30 = v79;
                int v29 = (id *)&v92;
              }
              else
              {
                id v70 = [(VCCKShortcutSyncService *)self database];
                v83[0] = MEMORY[0x1E4F143A8];
                v83[1] = 3221225472;
                v83[2] = __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_259;
                v83[3] = &unk_1E65405B8;
                id v84 = v17;
                id v85 = v63;
                uint64_t v86 = self;
                id v87 = v77;
                id v82 = v79;
                [v70 performTransactionWithReason:@"save fetched workflow record" block:v83 error:&v82];
                id v71 = v82;

                id v30 = v71;
                int v29 = (id *)&v92;
                uint64_t v28 = v78;
              }

              char v23 = v81;
              id v65 = 0;
            }

            goto LABEL_26;
          }
LABEL_15:
          uint64_t v28 = v78;
          (*((void (**)(void *, void *))v78 + 2))(v78, v17);
          id v30 = v79;
          int v29 = (id *)&v92;
LABEL_25:
          char v23 = v81;
LABEL_26:

          int v15 = v80;
LABEL_27:

          goto LABEL_28;
        }
        __int16 v24 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          long long v102 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
          __int16 v103 = 2114;
          uint64_t v104 = (uint64_t)v14;
          id v25 = "%s Local WFWorkflowRecord with identifier %{public}@ has not changed since last sync, proceeding to save"
                " fetched record as-is.";
          id v26 = v24;
          os_log_type_t v27 = OS_LOG_TYPE_INFO;
          goto LABEL_13;
        }
LABEL_14:

        goto LABEL_15;
      }
    }
    id v43 = getWFCloudKitSyncLogObject();
    id v30 = v79;
    int v29 = (id *)&v92;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      long long v102 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
      __int16 v103 = 2114;
      uint64_t v104 = (uint64_t)v14;
      _os_log_impl(&dword_1C7D7E000, v43, OS_LOG_TYPE_INFO, "%s Local WFWorkflowRecord with identifier %{public}@ has the same recordChangeTag as fetched record, this is likely our own change, discarding it.", buf, 0x16u);
    }

    uint64_t v28 = v78;
    goto LABEL_25;
  }
  int v31 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    long long v102 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
    __int16 v103 = 2114;
    uint64_t v104 = (uint64_t)v11;
    _os_log_impl(&dword_1C7D7E000, v31, OS_LOG_TYPE_ERROR, "%s Failed to create WFWorkflowRecord from WFCloudKitWorkflow: %{public}@", buf, 0x16u);
  }

LABEL_28:
}

void __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke(uint64_t a1, int a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v4 = [*(id *)(a1 + 32) database];
  id v5 = [v4 allCollections];
  id v6 = [v5 descriptors];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (!v7)
  {

    int v37 = 0;
    if (a2) {
      goto LABEL_28;
    }
    goto LABEL_30;
  }
  uint64_t v8 = v7;
  char v46 = a2;
  int v50 = 0;
  uint64_t v52 = 0;
  uint64_t v9 = *(void *)v57;
  uint64_t v47 = *MEMORY[0x1E4FB74A8];
  uint64_t v48 = *(void *)v57;
  obuint64_t j = v6;
  do
  {
    uint64_t v10 = 0;
    uint64_t v49 = v8;
    do
    {
      if (*(void *)v57 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v56 + 1) + 8 * v10);
      uint64_t v12 = (void *)MEMORY[0x1C87C4C10]();
      uint64_t v13 = [*(id *)(a1 + 32) database];
      id v14 = [v11 identifier];
      int v15 = [v13 collectionRecordForCollectionIdentifier:v14 createIfNecessary:0];

      BOOL v16 = [v15 lastRemoteShortcutOrdering];
      __int16 v17 = [v15 lastRemoteShortcutOrderingSubset];
      if ([v16 containsObject:*(void *)(a1 + 40)]
        && ([v17 containsObject:*(void *)(a1 + 40)] & 1) == 0)
      {
        uint64_t v18 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          BOOL v19 = *(void **)(a1 + 40);
          uint64_t v20 = [v11 identifier];
          *(_DWORD *)buf = 136315650;
          uint64_t v61 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
          __int16 v62 = 2114;
          id v63 = v19;
          __int16 v64 = 2114;
          id v65 = v20;
          _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_INFO, "%s Merging received shortcut %{public}@ into collection %{public}@", buf, 0x20u);
        }
        v51 = v12;
        if ([v15 isFolder])
        {
          int v50 = 1;
        }
        else
        {
          id v21 = [v11 identifier];
          v50 |= [v21 isEqualToString:v47];
        }
        id v22 = *(void **)(a1 + 32);
        char v23 = [v15 shortcutOrdering];
        __int16 v24 = [v22 mergedOrderingFromLocalOrdering:v23 previousOrdering:v17 remoteOrdering:v16];
        [v15 setShortcutOrdering:v24];

        id v25 = [*(id *)(a1 + 32) database];
        id v55 = v52;
        int v26 = [v25 saveRecord:v15 withDescriptor:v11 error:&v55];
        id v27 = v55;

        if (v26)
        {
          uint64_t v28 = [*(id *)(a1 + 32) database];
          int v29 = [v11 identifier];
          id v30 = [v28 collectionRecordForCollectionIdentifier:v29 createIfNecessary:0];

          int v31 = *(void **)(a1 + 32);
          uint64_t v32 = [v30 shortcutOrdering];
          uint64_t v33 = [v31 calculateSubsetForRemoteOrdering:v16 withLocalOrdering:v32];
          [v30 setLastRemoteShortcutOrderingSubset:v33];

          uint64_t v34 = [*(id *)(a1 + 32) database];
          id v54 = v27;
          LOBYTE(v32) = [v34 saveRecord:v30 withDescriptor:v11 error:&v54];
          id v35 = v54;

          if (v32)
          {
            uint64_t v52 = v35;
            int v15 = v30;
            uint64_t v9 = v48;
            uint64_t v8 = v49;
            uint64_t v12 = v51;
            goto LABEL_23;
          }
          char v36 = getWFCloudKitSyncLogObject();
          uint64_t v9 = v48;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v61 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
            __int16 v62 = 2114;
            id v63 = v35;
            _os_log_impl(&dword_1C7D7E000, v36, OS_LOG_TYPE_ERROR, "%s Failed to save updated shortcut ordering to collection record: %{public}@", buf, 0x16u);
          }
          id v27 = v35;
          int v15 = v30;
        }
        else
        {
          char v36 = getWFCloudKitSyncLogObject();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v61 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
            __int16 v62 = 2114;
            id v63 = v27;
            _os_log_impl(&dword_1C7D7E000, v36, OS_LOG_TYPE_ERROR, "%s Failed to save updated shortcut ordering to collection record: %{public}@", buf, 0x16u);
          }
          uint64_t v9 = v48;
        }
        uint64_t v12 = v51;

        uint64_t v52 = v27;
        uint64_t v8 = v49;
      }
LABEL_23:

      ++v10;
    }
    while (v8 != v10);
    uint64_t v8 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
  }
  while (v8);

  int v37 = v52;
  if (v50 & 1 | ((v46 & 1) == 0)) {
    goto LABEL_30;
  }
LABEL_28:
  id v38 = [*(id *)(a1 + 32) database];
  id v39 = [v38 syncToken];
  id v40 = [v39 lastOrdering];
  int v41 = [v40 containsObject:*(void *)(a1 + 40)];

  if (v41)
  {
    int v42 = *(void **)(a1 + 32);
    id v43 = [v42 database];
    __int16 v44 = [v43 syncToken];
    int v45 = [v44 lastOrdering];
    [v42 applyLegacyOrderedWorkflowIDsToRootCollection:v45];
  }
LABEL_30:
}

void __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_249(uint64_t a1, uint64_t *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) database];
  char v5 = [v4 createWorkflowWithIdentifier:*(void *)(a1 + 40) record:*(void *)(a1 + 48) error:a2];

  if ((v5 & 1) == 0)
  {
    id v6 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *a2;
      int v17 = 136315650;
      uint64_t v18 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v7;
      __int16 v21 = 2114;
      uint64_t v22 = v8;
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to save fetched new WFWorkflowRecord with identifier %@: %{public}@", (uint8_t *)&v17, 0x20u);
    }
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:*(void *)(a1 + 40) objectType:0];
  uint64_t v10 = *(void **)(a1 + 32);
  id v11 = [MEMORY[0x1E4F1CAD0] setWithObject:@"syncHash"];
  uint64_t v12 = [v10 workflowRecordForReference:v9 properties:v11];

  if (v12)
  {
    objc_msgSend(v12, "setLastSyncedHash:", objc_msgSend(v12, "syncHash"));
    uint64_t v13 = [*(id *)(a1 + 32) database];
    char v14 = [v13 saveRecord:v12 withDescriptor:v9 error:a2];

    if ((v14 & 1) == 0)
    {
      int v15 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *a2;
        int v17 = 136315394;
        uint64_t v18 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
        __int16 v19 = 2114;
        uint64_t v20 = v16;
        _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_ERROR, "%s Failed to save workflow record with updated lastSyncedHash: %{public}@", (uint8_t *)&v17, 0x16u);
      }
    }
  }
}

void __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_253(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) database];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_2;
  v9[3] = &unk_1E6540568;
  char v5 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v3;
  id v8 = 0;
  id v6 = v3;
  [v4 performTransactionWithReason:@"save fetched workflow record" block:v9 error:&v8];
  id v7 = v8;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_259(id *a1, uint64_t *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a1[4];
  if ([a1[5] isDeleted])
  {
    char v5 = [a1[6] database];
    char v6 = [v5 saveRecord:a1[7] withDescriptor:a1[4] error:a2];

    if (v6)
    {
      id v7 = a1[4];
    }
    else
    {
      uint64_t v18 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *a2;
        int v24 = 136315394;
        id v25 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
        __int16 v26 = 2114;
        uint64_t v27 = v19;
        _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_ERROR, "%s Failed to save remote WFWorkflowRecord to local WFWorkflowReference: %{public}@", (uint8_t *)&v24, 0x16u);
      }

      id v7 = 0;
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB7398]) initWithRecord:a1[5]];
    [v8 setDeleted:1];
    uint64_t v20 = [a1[6] database];
    uint64_t v21 = [v20 createWorkflowWithOptions:v8 error:a2];

    if (v21)
    {
      id v4 = (id)v21;
      goto LABEL_20;
    }
    int v15 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *a2;
      int v24 = 136315650;
      id v25 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
      __int16 v26 = 2114;
      uint64_t v27 = v22;
      __int16 v28 = 2112;
      id v29 = 0;
      _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_ERROR, "%s Failed to create workflow for local WFWorkflowReference: %{public}@, conflictingRemoteReference = %@", (uint8_t *)&v24, 0x20u);
    }
    id v4 = 0;
    goto LABEL_19;
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB7398]) initWithRecord:a1[7]];
  uint64_t v9 = [a1[6] database];
  id v7 = [v9 createWorkflowWithOptions:v8 nameCollisionBehavior:3 error:a2];

  if (!v7)
  {
    id v10 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *a2;
      int v24 = 136315650;
      id v25 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
      __int16 v26 = 2114;
      uint64_t v27 = v11;
      __int16 v28 = 2112;
      id v29 = 0;
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Failed to create workflow for remote WFWorkflowReference: %{public}@, conflictingRemoteReference = %@", (uint8_t *)&v24, 0x20u);
    }
  }
  uint64_t v12 = [a1[7] cloudKitRecordMetadata];
  [a1[5] setCloudKitRecordMetadata:v12];

  uint64_t v13 = [a1[6] database];
  char v14 = [v13 saveRecord:a1[5] withDescriptor:a1[4] error:a2];

  if ((v14 & 1) == 0)
  {
    int v15 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *a2;
      id v17 = a1[5];
      int v24 = 136315650;
      id v25 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
      __int16 v26 = 2114;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      id v29 = v17;
      _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_ERROR, "%s Failed to save local WFWorkflowRecord: %{public}@, localWorkflowRecord = %@", (uint8_t *)&v24, 0x20u);
    }
LABEL_19:
  }
LABEL_20:

  if (v7)
  {
    uint64_t v23 = [a1[6] database];
    [v23 setConflictingReference:v4 forReference:v7];
  }
}

void __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) database];
  char v5 = [v4 saveRecord:*(void *)(a1 + 40) withDescriptor:*(void *)(a1 + 48) error:a2];

  if ((v5 & 1) == 0)
  {
    char v6 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *a2;
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      id v17 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke_2";
      __int16 v18 = 2114;
      uint64_t v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to save fetched WFWorkflowRecord for WFWorkflowReference: %{public}@, reference = %@", buf, 0x20u);
    }
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"syncHash", @"wantedEncryptedSchemaVersion", 0);
  id v10 = [*(id *)(a1 + 32) workflowRecordForReference:*(void *)(a1 + 48) properties:v9];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setLastSyncedHash:", objc_msgSend(v10, "syncHash"));
    objc_msgSend(v11, "setLastSyncedEncryptedSchemaVersion:", objc_msgSend(v11, "wantedEncryptedSchemaVersion"));
    uint64_t v12 = [*(id *)(a1 + 32) database];
    char v13 = [v12 saveRecord:v11 withDescriptor:*(void *)(a1 + 48) error:a2];

    if ((v13 & 1) == 0)
    {
      char v14 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *a2;
        *(_DWORD *)buf = 136315394;
        id v17 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
        __int16 v18 = 2114;
        uint64_t v19 = v15;
        _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_ERROR, "%s Failed to save workflow record with updated lastSyncedHash: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)handleNameConflictsForFetchedWorkflowRecord:(id)a3 identifier:(id)a4 shouldMarkFetchedRecordAsTombstone:(BOOL *)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v54 = a4;
  uint64_t v8 = [v7 name];
  id v55 = self;
  if (v8)
  {
    uint64_t v9 = [(VCCKShortcutSyncService *)self database];
    id v10 = [v7 name];
    uint64_t v11 = [v9 visibleReferencesForWorkflowName:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  if ([v11 count])
  {
    uint64_t v12 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      char v13 = [v7 name];
      *(_DWORD *)buf = 136315906;
      id v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRecordAsTombstone:]";
      __int16 v66 = 2114;
      id v67 = v54;
      __int16 v68 = 2112;
      long long v69 = v13;
      __int16 v70 = 2112;
      id v71 = v7;
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_INFO, "%s Checking for name conflicts for fetched WFWorkflowRecord with identifier %{public}@ and name %@, WFWorkflowRecord = %@", buf, 0x2Au);
    }
    uint64_t v52 = v7;

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v49 = v11;
    obuint64_t j = v11;
    uint64_t v14 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (!v14)
    {
      id v16 = 0;
      goto LABEL_51;
    }
    uint64_t v15 = v14;
    id v16 = 0;
    uint64_t v53 = *(void *)v60;
    while (1)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v60 != v53) {
          objc_enumerationMutation(obj);
        }
        __int16 v18 = *(void **)(*((void *)&v59 + 1) + 8 * v17);
        uint64_t v19 = (void *)MEMORY[0x1C87C4C10]();
        __int16 v20 = [v18 identifier];
        uint64_t v21 = [v20 localizedStandardCompare:v54];

        if (v21)
        {
          uint64_t v22 = getWFCloudKitSyncLogObject();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = [v52 name];
            *(_DWORD *)buf = 136315650;
            id v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRecordAsTombstone:]";
            __int16 v66 = 2112;
            id v67 = v23;
            __int16 v68 = 2112;
            long long v69 = v18;
            _os_log_impl(&dword_1C7D7E000, v22, OS_LOG_TYPE_DEFAULT, "%s Found local WFWorkflowReference with same name %@ as fetched record, sameNameReference = %@", buf, 0x20u);
          }
          int v24 = (void *)MEMORY[0x1C87C4C10]();
          id v25 = [(VCCKShortcutSyncService *)v55 database];
          id v58 = v16;
          __int16 v26 = [v25 recordWithDescriptor:v18 error:&v58];
          id v27 = v58;

          if (!v26)
          {
            char v36 = getWFCloudKitSyncLogObject();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              id v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRe"
                    "cordAsTombstone:]";
              __int16 v66 = 2114;
              id v67 = v27;
              __int16 v68 = 2112;
              long long v69 = v18;
              _os_log_impl(&dword_1C7D7E000, v36, OS_LOG_TYPE_ERROR, "%s Failed to load WFWorkflowRecord for same name WFWorkflowReference, skipping name conflict check: %{public}@, sameNameReference = %@", buf, 0x20u);
            }

            goto LABEL_38;
          }
          int v28 = [v26 isEquivalentForSyncTo:v52];

          id v29 = getWFCloudKitSyncLogObject();
          BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
          if (v28)
          {
            if (v30)
            {
              *(_DWORD *)buf = 136315138;
              id v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRe"
                    "cordAsTombstone:]";
              _os_log_impl(&dword_1C7D7E000, v29, OS_LOG_TYPE_DEFAULT, "%s Local WFWorkflowRecord is equivalent to fetched WFWorkflowRecord with same name, deleting one of them", buf, 0xCu);
            }

            int v31 = getWFCloudKitSyncLogObject();
            BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
            if (v21 != 1)
            {
              if (v32)
              {
                *(_DWORD *)buf = 136315138;
                id v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetched"
                      "RecordAsTombstone:]";
                _os_log_impl(&dword_1C7D7E000, v31, OS_LOG_TYPE_DEFAULT, "%s Deleting remote WFWorkflowRecord", buf, 0xCu);
              }

              *a5 = 1;
LABEL_38:
              id v16 = v27;
              goto LABEL_39;
            }
            if (v32)
            {
              *(_DWORD *)buf = 136315138;
              id v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRe"
                    "cordAsTombstone:]";
              _os_log_impl(&dword_1C7D7E000, v31, OS_LOG_TYPE_DEFAULT, "%s Deleting local WFWorkflowRecord", buf, 0xCu);
            }

            uint64_t v33 = [(VCCKShortcutSyncService *)v55 database];
            id v57 = v27;
            char v34 = [v33 deleteReference:v18 tombstone:0 deleteConflictIfPresent:1 error:&v57];
            id v16 = v57;

            if ((v34 & 1) == 0)
            {
              id v35 = getWFCloudKitSyncLogObject();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                id v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetched"
                      "RecordAsTombstone:]";
                __int16 v66 = 2114;
                id v67 = v16;
                __int16 v68 = 2112;
                long long v69 = v18;
                _os_log_impl(&dword_1C7D7E000, v35, OS_LOG_TYPE_ERROR, "%s Failed to delete WFWorkflowReference: %{public}@, sameNameReference = %@", buf, 0x20u);
              }
            }
          }
          else
          {
            if (v30)
            {
              *(_DWORD *)buf = 136315138;
              id v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRe"
                    "cordAsTombstone:]";
              _os_log_impl(&dword_1C7D7E000, v29, OS_LOG_TYPE_DEFAULT, "%s Local WFWorkflowRecord is not equivalent to fetched WFWorkflowRecord with same name, renaming local one", buf, 0xCu);
            }

            int v37 = [(VCCKShortcutSyncService *)v55 database];
            int v38 = [v37 hasConflictingReferenceForReference:v18];

            if (v38)
            {
              id v39 = getWFCloudKitSyncLogObject();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                id v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetched"
                      "RecordAsTombstone:]";
                _os_log_impl(&dword_1C7D7E000, v39, OS_LOG_TYPE_DEFAULT, "%s Local WFWorkflowReference is a conflict, skipping rename", buf, 0xCu);
              }

              goto LABEL_38;
            }
            id v40 = [(VCCKShortcutSyncService *)v55 database];
            int v41 = [v18 name];
            int v42 = [v40 suggestedWorkflowNameForName:v41];

            id v43 = getWFCloudKitSyncLogObject();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v44 = [v18 name];
              *(_DWORD *)buf = 136315650;
              id v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRe"
                    "cordAsTombstone:]";
              __int16 v66 = 2112;
              id v67 = v44;
              __int16 v68 = 2112;
              long long v69 = v42;
              _os_log_impl(&dword_1C7D7E000, v43, OS_LOG_TYPE_DEFAULT, "%s Renaming local WFWorkflowReference with name '%@' to '%@'", buf, 0x20u);
            }
            int v45 = [(VCCKShortcutSyncService *)v55 database];
            id v56 = v27;
            char v46 = [v45 renameReference:v18 to:v42 error:&v56];
            id v16 = v56;

            if (!v46)
            {
              uint64_t v47 = getWFCloudKitSyncLogObject();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                id v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetched"
                      "RecordAsTombstone:]";
                __int16 v66 = 2114;
                id v67 = v16;
                __int16 v68 = 2112;
                long long v69 = v18;
                _os_log_impl(&dword_1C7D7E000, v47, OS_LOG_TYPE_ERROR, "%s Failed to rename WFWorkflowReference: %{public}@, sameNameReference = %@", buf, 0x20u);
              }
            }
          }
        }
LABEL_39:
        ++v17;
      }
      while (v15 != v17);
      uint64_t v48 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
      uint64_t v15 = v48;
      if (!v48)
      {
LABEL_51:

        id v7 = v52;
        uint64_t v11 = v49;
        break;
      }
    }
  }
}

- (void)handleFetchedLegacyOrderingRecord:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[VCCKShortcutSyncService handleFetchedLegacyOrderingRecord:]";
    __int16 v16 = 2114;
    id v17 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Handling fetched legacy ordering CKRecord: %{public}@", buf, 0x16u);
  }

  char v6 = objc_opt_new();
  [MEMORY[0x1E4FB7140] hydrateItem:v6 withRecord:v4 setNilValues:0];
  id v7 = [v6 collectionIdentifier];

  if (v7)
  {
    uint64_t v8 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[VCCKShortcutSyncService handleFetchedLegacyOrderingRecord:]";
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEFAULT, "%s Received legacy per-collection ordering CKRecord, ignoring", buf, 0xCu);
    }
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__VCCKShortcutSyncService_handleFetchedLegacyOrderingRecord___block_invoke;
    v12[3] = &unk_1E6540428;
    uint64_t v9 = v6;
    char v13 = v9;
    [(VCCKShortcutSyncService *)self updateSyncTokenInDatabaseWithBlock:v12];
    id v10 = [v9 orderedWorkflowIDs];

    if (v10)
    {
      uint64_t v11 = [v9 orderedWorkflowIDs];
      [(VCCKShortcutSyncService *)self applyLegacyOrderedWorkflowIDsToRootCollection:v11];
    }
    uint64_t v8 = v13;
  }
}

void __61__VCCKShortcutSyncService_handleFetchedLegacyOrderingRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 orderedWorkflowIDs];
  [v3 setLastOrdering:v4];
}

- (void)handleFetchedCollectionOrderingRecord:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[VCCKShortcutSyncService handleFetchedCollectionOrderingRecord:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Handling fetched collection ordering CKRecord: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(VCCKShortcutSyncService *)self mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:v4];
}

- (id)calculateSubsetForRemoteOrdering:(id)a3 withLocalOrdering:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  __int16 v8 = v7;
  id v9 = (void *)[v7 mutableCopy];
  [v9 intersectOrderedSet:v6];

  return v9;
}

- (id)mergedOrderingFromLocalOrdering:(id)a3 previousOrdering:(id)a4 remoteOrdering:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_15:
    id v10 = (id)objc_opt_new();
    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_16;
  }
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"VCCKShortcutSyncService.m", 920, @"Invalid parameter not satisfying: %@", @"localOrdering" object file lineNumber description];

  if (!v10) {
    goto LABEL_15;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_16:
  id v11 = (id)objc_opt_new();
LABEL_4:
  if ([v11 isEqualToOrderedSet:v10])
  {
    id v12 = v9;
LABEL_9:
    id v13 = v12;
    goto LABEL_10;
  }
  if ([v9 isEqualToOrderedSet:v10]
    || [v11 isEqualToOrderedSet:v9])
  {
    id v12 = v11;
    goto LABEL_9;
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  int v24 = __Block_byref_object_copy__1274;
  id v25 = __Block_byref_object_dispose__1275;
  id v26 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__VCCKShortcutSyncService_mergedOrderingFromLocalOrdering_previousOrdering_remoteOrdering___block_invoke;
  v16[3] = &unk_1E6540518;
  __int16 v20 = &v21;
  id v17 = v11;
  id v18 = v9;
  id v19 = v10;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(@"VCCKShortcutSyncService.orderingMerge", v16);
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
LABEL_10:

  return v13;
}

void __91__VCCKShortcutSyncService_mergedOrderingFromLocalOrdering_previousOrdering_remoteOrdering___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAA0], "wf_orderedSetByMergingOrderedSet:withOrderedSet:baseOrderedSet:", a1[4], a1[5], a1[6]);
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v8 = a1[6];
    int v11 = 136315906;
    id v12 = "-[VCCKShortcutSyncService mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:]_block_invoke";
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    uint64_t v16 = v7;
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Merged %{public}@ with %{public}@, base %{public}@", (uint8_t *)&v11, 0x2Au);
  }

  id v9 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(*(void *)(a1[7] + 8) + 40);
    int v11 = 136315394;
    id v12 = "-[VCCKShortcutSyncService mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:]_block_invoke";
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_INFO, "%s Merge result is %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)applyLegacyOrderedWorkflowIDsToRootCollection:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v42 = "-[VCCKShortcutSyncService applyLegacyOrderedWorkflowIDsToRootCollection:]";
    __int16 v43 = 2114;
    id v44 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Merging local ordering changes with remote ordering changes from legacy full ordering %{public}@", buf, 0x16u);
  }

  uint64_t v6 = [(VCCKShortcutSyncService *)self rootCollectionRecord];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 shortcutOrdering];
    id v9 = (void *)[v8 mutableCopy];

    context = (void *)MEMORY[0x1C87C4C10]();
    uint64_t v10 = [(VCCKShortcutSyncService *)self database];
    int v11 = [v10 sortedVisibleFolders];
    id v12 = [v11 descriptors];

    __int16 v13 = (void *)MEMORY[0x1E4F1CAD0];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __73__VCCKShortcutSyncService_applyLegacyOrderedWorkflowIDsToRootCollection___block_invoke;
    v39[3] = &unk_1E65404F0;
    v39[4] = self;
    int v31 = v12;
    uint64_t v14 = objc_msgSend(v12, "if_flatMap:", v39);
    __int16 v15 = (void *)v14;
    if (v14) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = MEMORY[0x1E4F1CBF0];
    }
    __int16 v17 = [v13 setWithArray:v16];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v33 = v4;
    id v18 = v4;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          int v24 = (void *)MEMORY[0x1C87C4C10]();
          if (([v17 containsObject:v23] & 1) == 0) {
            [v9 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v20);
    }

    [v7 setShortcutOrdering:v9];
    id v25 = [(VCCKShortcutSyncService *)self database];
    id v26 = objc_alloc(MEMORY[0x1E4FB4698]);
    id v27 = (void *)[v26 initWithIdentifier:*MEMORY[0x1E4FB74A8] objectType:2];
    id v34 = 0;
    char v28 = [v25 saveRecord:v7 withDescriptor:v27 error:&v34];
    id v29 = v34;

    if ((v28 & 1) == 0)
    {
      BOOL v30 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v42 = "-[VCCKShortcutSyncService applyLegacyOrderedWorkflowIDsToRootCollection:]";
        __int16 v43 = 2114;
        id v44 = v29;
        _os_log_impl(&dword_1C7D7E000, v30, OS_LOG_TYPE_ERROR, "%s Failed to save root collection after merging legacy full shortcut ordering: %{public}@", buf, 0x16u);
      }
    }
    id v4 = v33;
  }
}

id __73__VCCKShortcutSyncService_applyLegacyOrderedWorkflowIDsToRootCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1C87C4C10]();
  id v5 = [*(id *)(a1 + 32) database];
  uint64_t v6 = [v3 identifier];
  uint64_t v7 = [v5 collectionRecordForCollectionIdentifier:v6 createIfNecessary:0];

  uint64_t v8 = [v7 lastRemoteShortcutOrdering];
  uint64_t v9 = [v8 array];
  uint64_t v10 = (void *)v9;
  int v11 = (void *)MEMORY[0x1E4F1CBF0];
  if (v9) {
    int v11 = (void *)v9;
  }
  id v12 = v11;

  return v12;
}

- (BOOL)mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:(id)a3
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  __int16 v105 = objc_opt_new();
  id v100 = v3;
  objc_msgSend(MEMORY[0x1E4FB7140], "hydrateItem:withRecord:setNilValues:");
  id v4 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v105;
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s Merging local ordering changes with remote ordering changes from %{public}@", buf, 0x16u);
  }

  id v5 = [v105 collectionIdentifier];
  BOOL v6 = v5 == 0;

  if (!v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4FB4698]);
    uint64_t v8 = [v105 collectionIdentifier];
    char v99 = [v7 initWithIdentifier:v8 objectType:2];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    long long v134 = __Block_byref_object_copy__1274;
    uint64_t v135 = __Block_byref_object_dispose__1275;
    uint64_t v9 = [(VCCKShortcutSyncService *)self database];
    uint64_t v10 = [v105 collectionIdentifier];
    id v136 = [v9 collectionRecordForCollectionIdentifier:v10 createIfNecessary:0];

    int v11 = *(void **)(*(void *)&buf[8] + 40);
    if (!v11)
    {
      int v24 = [(VCCKShortcutSyncService *)self database];
      v121[0] = MEMORY[0x1E4F143A8];
      v121[1] = 3221225472;
      v121[2] = __96__VCCKShortcutSyncService_mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord___block_invoke;
      v121[3] = &unk_1E65404C8;
      uint64_t v124 = buf;
      v121[4] = self;
      id v122 = v105;
      uint64_t v123 = v99;
      id v120 = 0;
      [v24 performTransactionWithReason:@"merge local ordering & remote ordering" block:v121 error:&v120];
      id v25 = v120;

      goto LABEL_21;
    }
    id v12 = [v11 cloudKitOrderingRecordMetadata];
    if (v12)
    {
      __int16 v13 = (void *)MEMORY[0x1E4FB7140];
      uint64_t v14 = [*(id *)(*(void *)&buf[8] + 40) cloudKitOrderingRecordMetadata];
      __int16 v15 = [v13 recordFromSystemFieldsData:v14 error:0];
      uint64_t v16 = [v15 recordChangeTag];
      __int16 v17 = [v100 recordChangeTag];
      id v18 = v16;
      id v19 = v17;
      if (v18 == v19)
      {

        goto LABEL_16;
      }
      uint64_t v20 = v19;
      if (v18 && v19)
      {
        char v21 = [v18 isEqualToString:v19];

        if ((v21 & 1) == 0) {
          goto LABEL_20;
        }
LABEL_16:
        log = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          id v26 = [v105 collectionIdentifier];
          *(_DWORD *)uint64_t v125 = 136315394;
          long long v126 = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]";
          __int16 v127 = 2114;
          id v128 = v26;
          _os_log_impl(&dword_1C7D7E000, log, OS_LOG_TYPE_INFO, "%s Local WFWorkflowCollectionRecord with identifier %{public}@ has the same recordChangeTag as fetched ordering record, this is likely our own change, discarding it.", v125, 0x16u);
        }
        char v23 = 0;
        goto LABEL_60;
      }
    }
LABEL_20:
    id v25 = [*(id *)(*(void *)&buf[8] + 40) cloudKitOrderingRecordMetadata];
    VCCKCheckRemoteModificationDateNewerThanLocal(v25, v100);
LABEL_21:

    id v27 = [*(id *)(*(void *)&buf[8] + 40) shortcutOrdering];
    char v28 = [*(id *)(*(void *)&buf[8] + 40) lastRemoteShortcutOrderingSubset];
    id v29 = [v105 orderedWorkflowIDs];
    BOOL v30 = [(VCCKShortcutSyncService *)self mergedOrderingFromLocalOrdering:v27 previousOrdering:v28 remoteOrdering:v29];
    [*(id *)(*(void *)&buf[8] + 40) setShortcutOrdering:v30];

    log = objc_opt_new();
    char v31 = [*(id *)(*(void *)&buf[8] + 40) isFolder];
    BOOL v32 = (uint64_t *)MEMORY[0x1E4FB74A8];
    if ((v31 & 1) != 0
      || ([v105 collectionIdentifier],
          id v33 = objc_claimAutoreleasedReturnValue(),
          int v34 = [v33 isEqualToString:*v32],
          v33,
          v34))
    {
      context = (void *)MEMORY[0x1C87C4C10]();
      long long v35 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v125 = 136315138;
        long long v126 = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]";
        _os_log_impl(&dword_1C7D7E000, v35, OS_LOG_TYPE_INFO, "%s Collection with updated ordering is a folder, pruning shortcuts from other folders if they belong to this folder", v125, 0xCu);
      }

      long long v36 = [(VCCKShortcutSyncService *)self database];
      long long v37 = [v36 sortedVisibleFolders];
      long long v38 = [v37 descriptors];

      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      obuint64_t j = v38;
      uint64_t v39 = [obj countByEnumeratingWithState:&v116 objects:v132 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v117;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v117 != v40) {
              objc_enumerationMutation(obj);
            }
            int v42 = *(void **)(*((void *)&v116 + 1) + 8 * i);
            __int16 v43 = (void *)MEMORY[0x1C87C4C10]();
            id v44 = [v42 identifier];
            uint64_t v45 = [v105 collectionIdentifier];
            char v46 = [v44 isEqualToString:v45];

            if ((v46 & 1) == 0)
            {
              uint64_t v47 = [(VCCKShortcutSyncService *)self database];
              uint64_t v48 = [v42 identifier];
              uint64_t v49 = [v47 collectionRecordForCollectionIdentifier:v48 createIfNecessary:0];

              int v50 = [v49 shortcutOrdering];
              v51 = [*(id *)(*(void *)&buf[8] + 40) shortcutOrdering];
              LODWORD(v48) = [v50 intersectsOrderedSet:v51];

              if (v48) {
                [log setObject:v49 forKey:v42];
              }
            }
          }
          uint64_t v39 = [obj countByEnumeratingWithState:&v116 objects:v132 count:16];
        }
        while (v39);
      }

      uint64_t v52 = [v105 collectionIdentifier];
      uint64_t v53 = *v32;
      char v54 = [v52 isEqualToString:*v32];

      if ((v54 & 1) == 0)
      {
        id v55 = [(VCCKShortcutSyncService *)self rootCollectionRecord];
        id v56 = [v55 shortcutOrdering];
        id v57 = [*(id *)(*(void *)&buf[8] + 40) shortcutOrdering];
        int v58 = [v56 intersectsOrderedSet:v57];

        if (v58)
        {
          long long v59 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v53 objectType:2];
          [log setObject:v55 forKey:v59];
        }
      }
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v60 = [log allValues];
      uint64_t v61 = [v60 countByEnumeratingWithState:&v112 objects:v131 count:16];
      if (v61)
      {
        uint64_t v104 = *(void *)v113;
        do
        {
          for (uint64_t j = 0; j != v61; ++j)
          {
            if (*(void *)v113 != v104) {
              objc_enumerationMutation(v60);
            }
            id v63 = *(void **)(*((void *)&v112 + 1) + 8 * j);
            __int16 v64 = (void *)MEMORY[0x1C87C4C10]();
            id v65 = getWFCloudKitSyncLogObject();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t v125 = 136315394;
              long long v126 = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]";
              __int16 v127 = 2112;
              id v128 = v63;
              _os_log_impl(&dword_1C7D7E000, v65, OS_LOG_TYPE_INFO, "%s Will prune shortcuts from the ordering of %@", v125, 0x16u);
            }

            __int16 v66 = [v63 shortcutOrdering];
            id v67 = (void *)[v66 mutableCopy];

            __int16 v68 = [*(id *)(*(void *)&buf[8] + 40) shortcutOrdering];
            [v67 minusOrderedSet:v68];

            unint64_t v69 = [v67 count];
            __int16 v70 = [v63 shortcutOrdering];
            LODWORD(v69) = v69 < [v70 count];

            if (v69)
            {
              id v71 = getWFCloudKitSyncLogObject();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v72 = [v63 name];
                uint64_t v73 = [*(id *)(*(void *)&buf[8] + 40) name];
                *(_DWORD *)uint64_t v125 = 136315650;
                long long v126 = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]";
                __int16 v127 = 2112;
                id v128 = v72;
                __int16 v129 = 2112;
                long long v130 = v73;
                _os_log_impl(&dword_1C7D7E000, v71, OS_LOG_TYPE_DEFAULT, "%s Pruned some shortcuts from folder %@ because they are now present in folder %@", v125, 0x20u);
              }
              [v63 setShortcutOrdering:v67];
            }
          }
          uint64_t v61 = [v60 countByEnumeratingWithState:&v112 objects:v131 count:16];
        }
        while (v61);
      }
    }
    char v74 = [*(id *)(*(void *)&buf[8] + 40) collectionOrdering];
    id v75 = [*(id *)(*(void *)&buf[8] + 40) lastRemoteCollectionOrderingSubset];
    v76 = [v105 orderedFolderIDs];
    id v77 = [(VCCKShortcutSyncService *)self mergedOrderingFromLocalOrdering:v74 previousOrdering:v75 remoteOrdering:v76];
    [*(id *)(*(void *)&buf[8] + 40) setCollectionOrdering:v77];

    id v78 = [(VCCKShortcutSyncService *)self database];
    uint64_t v79 = *(void *)(*(void *)&buf[8] + 40);
    id v111 = 0;
    char v23 = [v78 saveRecord:v79 withDescriptor:v99 error:&v111];
    id v80 = v111;

    if (v23)
    {
      v81 = [(VCCKShortcutSyncService *)self database];
      id v82 = [v105 collectionIdentifier];
      uint64_t v83 = [v81 collectionRecordForCollectionIdentifier:v82 createIfNecessary:0];
      id v84 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v83;

      id v85 = [v105 orderedWorkflowIDs];
      [*(id *)(*(void *)&buf[8] + 40) setLastRemoteShortcutOrdering:v85];

      uint64_t v86 = [v105 orderedWorkflowIDs];
      id v87 = [*(id *)(*(void *)&buf[8] + 40) shortcutOrdering];
      unsigned __int8 v88 = [(VCCKShortcutSyncService *)self calculateSubsetForRemoteOrdering:v86 withLocalOrdering:v87];
      [*(id *)(*(void *)&buf[8] + 40) setLastRemoteShortcutOrderingSubset:v88];

      id v89 = [v105 orderedFolderIDs];
      [*(id *)(*(void *)&buf[8] + 40) setLastRemoteCollectionOrdering:v89];

      uint64_t v90 = [v105 orderedFolderIDs];
      id v91 = [*(id *)(*(void *)&buf[8] + 40) collectionOrdering];
      uint64_t v92 = [(VCCKShortcutSyncService *)self calculateSubsetForRemoteOrdering:v90 withLocalOrdering:v91];
      [*(id *)(*(void *)&buf[8] + 40) setLastRemoteCollectionOrderingSubset:v92];

      id v93 = [v105 recordSystemFieldsData];
      [*(id *)(*(void *)&buf[8] + 40) setCloudKitOrderingRecordMetadata:v93];

      v94 = [(VCCKShortcutSyncService *)self database];
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = 3221225472;
      v107[2] = __96__VCCKShortcutSyncService_mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord___block_invoke_232;
      v107[3] = &unk_1E65404C8;
      v107[4] = self;
      long long v110 = buf;
      uint64_t v108 = v99;
      __int16 v109 = log;
      id v106 = v80;
      [v94 performTransactionWithReason:@"merge local ordering & remote ordering" block:v107 error:&v106];
      id v95 = v106;

      id v80 = v95;
    }
    else
    {
      id v96 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v125 = 136315394;
        long long v126 = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]";
        __int16 v127 = 2114;
        id v128 = v80;
        _os_log_impl(&dword_1C7D7E000, v96, OS_LOG_TYPE_ERROR, "%s Failed to save merged orderings to collection record: %{public}@", v125, 0x16u);
      }
    }
LABEL_60:

    _Block_object_dispose(buf, 8);
    uint64_t v22 = v99;
    goto LABEL_61;
  }
  uint64_t v22 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v100;
    _os_log_impl(&dword_1C7D7E000, v22, OS_LOG_TYPE_ERROR, "%s Malformed ordering record, missing collectionIdentifier: %{public}@", buf, 0x16u);
  }
  char v23 = 0;
LABEL_61:

  return v23;
}

void __96__VCCKShortcutSyncService_mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = a1;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) database];
  id v5 = [*(id *)(v3 + 40) collectionIdentifier];
  uint64_t v6 = [v4 collectionRecordForCollectionIdentifier:v5 createIfNecessary:1];
  uint64_t v7 = *(void *)(*(void *)(v3 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(*(void *)(*(void *)(v3 + 56) + 8) + 40), "setLastSyncedHash:", objc_msgSend(*(id *)(*(void *)(*(void *)(v3 + 56) + 8) + 40), "computedSyncHash"));
  uint64_t v9 = [*(id *)(v3 + 32) database];
  LOBYTE(v3) = [v9 saveRecord:*(void *)(*(void *)(*(void *)(v3 + 56) + 8) + 40) withDescriptor:*(void *)(v3 + 48) error:a2];

  if ((v3 & 1) == 0)
  {
    uint64_t v10 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *a2;
      int v12 = 136315394;
      __int16 v13 = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]_block_invoke";
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Failed to save collection record with updated lasy synced hash: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
}

void __96__VCCKShortcutSyncService_mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord___block_invoke_232(uint64_t a1, uint64_t *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) database];
  char v5 = [v4 saveRecord:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withDescriptor:*(void *)(a1 + 40) error:a2];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *a2;
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecor"
                           "d:]_block_invoke";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to save merged orderings to collection record: %{public}@", buf, 0x16u);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  int v12 = __Block_byref_object_copy__1274;
  __int16 v13 = __Block_byref_object_dispose__1275;
  id v14 = 0;
  uint64_t v8 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__VCCKShortcutSyncService_mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord___block_invoke_233;
  v10[3] = &unk_1E65404A0;
  void v10[4] = *(void *)(a1 + 32);
  v10[5] = buf;
  [v8 enumerateKeysAndObjectsUsingBlock:v10];
  if (a2)
  {
    uint64_t v9 = *(void **)(*(void *)&buf[8] + 40);
    if (v9) {
      *a2 = (uint64_t)v9;
    }
  }
  _Block_object_dispose(buf, 8);
}

void __96__VCCKShortcutSyncService_mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord___block_invoke_233(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 database];
  id v14 = 0;
  char v9 = [v8 saveRecord:v6 withDescriptor:v7 error:&v14];

  id v10 = v14;
  if ((v9 & 1) == 0)
  {
    uint64_t v11 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]_block_invoke";
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s Failed to save updated ordering to root collection record: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v10;
}

- (void)handleDeletedRecordWithID:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = "-[VCCKShortcutSyncService handleDeletedRecordWithID:]";
    __int16 v21 = 2114;
    uint64_t v22 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Handling deleted record CKRecord: %{public}@", buf, 0x16u);
  }

  if (![MEMORY[0x1E4FB7138] isFolderRecordID:v4])
  {
    id v10 = [(VCCKShortcutSyncService *)self database];
    uint64_t v11 = [v4 recordName];
    char v9 = [v10 referenceForWorkflowID:v11 includingTombstones:1];

    if (!v9) {
      goto LABEL_12;
    }
    if (([v9 isDeleted] & 1) == 0)
    {
      id v14 = getWFCloudKitSyncLogObject();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      uint64_t v15 = [v9 name];
      *(_DWORD *)buf = 136315650;
      uint64_t v20 = "-[VCCKShortcutSyncService handleDeletedRecordWithID:]";
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      __int16 v23 = 2112;
      int v24 = v9;
      uint64_t v16 = "%s Sync engine has finished deleting workflow with name %@, but it is no longer a tombstone, so we're not de"
            "leting it, deletedWorkflowReference = %@";
      __int16 v17 = v14;
      goto LABEL_16;
    }
LABEL_9:
    uint64_t v12 = [(VCCKShortcutSyncService *)self database];
    id v18 = 0;
    char v13 = [v12 deleteReference:v9 tombstone:0 deleteConflictIfPresent:1 error:&v18];
    id v14 = v18;

    if (v13)
    {
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v15 = getWFCloudKitSyncLogObject();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v20 = "-[VCCKShortcutSyncService handleDeletedRecordWithID:]";
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    __int16 v23 = 2114;
    int v24 = v14;
    uint64_t v16 = "%s Failed to delete tombstone for descriptor = %@, error = %{public}@";
    __int16 v17 = v15;
LABEL_16:
    _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_ERROR, v16, buf, 0x20u);
    goto LABEL_17;
  }
  uint64_t v6 = [MEMORY[0x1E4FB7138] collectionIdentifierForRecordID:v4];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = [(VCCKShortcutSyncService *)self database];
    char v9 = [v8 collectionWithIdentifier:v7];

    if (v9) {
      goto LABEL_9;
    }
  }
LABEL_12:
  char v9 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v14 = [v4 recordName];
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = "-[VCCKShortcutSyncService handleDeletedRecordWithID:]";
    __int16 v21 = 2114;
    uint64_t v22 = v14;
    _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_ERROR, "%s Unable to find descriptor to delete from record ID %{public}@", buf, 0x16u);
    goto LABEL_18;
  }
LABEL_19:
}

- (void)handleSavedLibraryRecord:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 recordID];
    id v7 = [v6 recordName];
    int v11 = 136315394;
    uint64_t v12 = "-[VCCKShortcutSyncService handleSavedLibraryRecord:]";
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Handling saved library record: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = [(VCCKShortcutSyncService *)self database];
  BOOL v9 = +[VCCKLibrarySyncCoordinator handleSavedLibraryRecord:v4 database:v8 error:0];

  if (!v9)
  {
    id v10 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[VCCKShortcutSyncService handleSavedLibraryRecord:]";
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Failed to save library record: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)handleSavedAutoShortcutsPreferencesRecord:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = "-[VCCKShortcutSyncService handleSavedAutoShortcutsPreferencesRecord:]";
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Handling saved auto shortcuts preferences record: %@", buf, 0x16u);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4FB7128]);
  [MEMORY[0x1E4FB7140] hydrateItem:v6 withRecord:v4 setNilValues:0];
  id v7 = (void *)MEMORY[0x1E4FB7128];
  uint64_t v8 = [v4 recordID];
  BOOL v9 = [v7 identifierForRecordID:v8];

  id v10 = [(VCCKShortcutSyncService *)self database];
  id v18 = 0;
  int v11 = [v10 autoShortcutsPreferencesForIdentifier:v9 error:&v18];
  id v12 = v18;

  __int16 v13 = [v6 recordSystemFieldsData];
  [v11 setCloudKitMetadata:v13];

  objc_msgSend(v11, "setLastSyncedHash:", objc_msgSend(v11, "computedSyncHash"));
  id v14 = [(VCCKShortcutSyncService *)self database];
  id v17 = v12;
  [v14 updateAutoShortcutsPreferencesWithNewPreferences:v11 error:&v17];
  id v15 = v17;

  if (v15)
  {
    uint64_t v16 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "-[VCCKShortcutSyncService handleSavedAutoShortcutsPreferencesRecord:]";
      __int16 v21 = 2114;
      id v22 = v15;
      _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_ERROR, "%s Failed to save auto shortcuts preferences record with error: %{public}@", buf, 0x16u);
    }
  }
}

- (void)handleSavedSyncFlagsRecord:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v11 = "-[VCCKShortcutSyncService handleSavedSyncFlagsRecord:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Handling saved sync flags CKRecord: %{public}@", buf, 0x16u);
  }

  id v6 = objc_opt_new();
  [MEMORY[0x1E4FB7140] hydrateItem:v6 withRecord:v4 setNilValues:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__VCCKShortcutSyncService_handleSavedSyncFlagsRecord___block_invoke;
  v8[3] = &unk_1E6540428;
  id v7 = v6;
  id v9 = v7;
  [(VCCKShortcutSyncService *)self updateSyncTokenInDatabaseWithBlock:v8];
  if ([v7 migratedVoiceShortcuts]) {
    [MEMORY[0x1E4FB7168] setVoiceShortcutMigrationDidSync:1];
  }
  if ([v7 defaultShortcutsVersion]) {
    objc_msgSend(MEMORY[0x1E4FB7168], "setDefaultShortcutsVersion:", objc_msgSend(v7, "defaultShortcutsVersion"));
  }
  objc_msgSend(MEMORY[0x1E4FB7168], "setLastSyncedFlagsHash:", objc_msgSend(MEMORY[0x1E4FB7168], "syncedFlagsHash"));
}

void __54__VCCKShortcutSyncService_handleSavedSyncFlagsRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 recordSystemFieldsData];
  [v3 setSyncFlagsCloudKitRecordMetadata:v4];
}

- (void)handleSavedFolderRecord:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 recordID];
    *(_DWORD *)buf = 136315650;
    id v22 = "-[VCCKShortcutSyncService handleSavedFolderRecord:]";
    __int16 v23 = 2114;
    int v24 = v6;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Handling saved folder CKRecord with CKRecordID %{public}@, folderRecord = %@", buf, 0x20u);
  }
  id v7 = objc_opt_new();
  [MEMORY[0x1E4FB7140] hydrateItem:v7 withRecord:v4 setNilValues:0];
  uint64_t v8 = (void *)MEMORY[0x1E4FB7138];
  id v9 = [v4 recordID];
  id v10 = [v8 collectionIdentifierForRecordID:v9];

  if (v10)
  {
    int v11 = [objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v10 objectType:2];
    __int16 v12 = [(VCCKShortcutSyncService *)self database];
    id v13 = [v12 collectionRecordForCollectionIdentifier:v10 createIfNecessary:0];

    if (v13)
    {
      uint64_t v14 = [v7 recordSystemFieldsData];
      [v13 setCloudKitFolderRecordMetadata:v14];

      objc_msgSend(v13, "setLastSyncedHash:", objc_msgSend(v13, "computedSyncHash"));
      objc_msgSend(v13, "setLastSyncedEncryptedSchemaVersion:", objc_msgSend(v7, "encryptedSchemaVersion"));
      id v15 = [(VCCKShortcutSyncService *)self database];
      id v20 = 0;
      char v16 = [v15 saveRecord:v13 withDescriptor:v11 error:&v20];
      id v17 = v20;

      if ((v16 & 1) == 0)
      {
        id v18 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v22 = "-[VCCKShortcutSyncService handleSavedFolderRecord:]";
          __int16 v23 = 2114;
          int v24 = v17;
          _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_ERROR, "%s Failed to save folder record: %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v17 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v22 = "-[VCCKShortcutSyncService handleSavedFolderRecord:]";
        __int16 v23 = 2114;
        int v24 = v10;
        _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_DEFAULT, "%s Failed to get WFWorkflowCollectionRecord for collection with identifier %{public}@, has it been deleted?", buf, 0x16u);
      }
    }
  }
  else
  {
    int v11 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [v4 recordID];
      *(_DWORD *)buf = 136315394;
      id v22 = "-[VCCKShortcutSyncService handleSavedFolderRecord:]";
      __int16 v23 = 2114;
      int v24 = v19;
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s Invalid folder record ID: %{public}@", buf, 0x16u);
    }
  }
}

- (void)handleSavedWorkflowRecord:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 recordID];
    *(_DWORD *)buf = 136315650;
    id v22 = "-[VCCKShortcutSyncService handleSavedWorkflowRecord:]";
    __int16 v23 = 2114;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Handling saved workflow CKRecord with CKRecordID %{public}@, workflowRecord = %@", buf, 0x20u);
  }
  id v7 = objc_opt_new();
  [MEMORY[0x1E4FB7140] hydrateItem:v7 withRecord:v4 setNilValues:0];
  uint64_t v8 = [v4 recordID];
  id v9 = [v8 recordName];

  id v10 = [(VCCKShortcutSyncService *)self filesReferencedUntilSaved];
  [v10 setObject:0 forKeyedSubscript:v9];

  int v11 = [(VCCKShortcutSyncService *)self database];
  __int16 v12 = [v11 referenceForWorkflowID:v9 includingTombstones:1];

  if (v12)
  {
    id v13 = objc_opt_new();
    uint64_t v14 = [(VCCKShortcutSyncService *)self workflowRecordForReference:v12 properties:v13];

    if (v14)
    {
      id v15 = [v7 recordSystemFieldsData];
      [v14 setCloudKitRecordMetadata:v15];

      -[NSObject setLastSyncedHash:](v14, "setLastSyncedHash:", [v7 cachedSyncHash]);
      -[NSObject setLastSyncedEncryptedSchemaVersion:](v14, "setLastSyncedEncryptedSchemaVersion:", [v7 encryptedSchemaVersion]);
      char v16 = [(VCCKShortcutSyncService *)self database];
      id v20 = 0;
      char v17 = [v16 saveRecord:v14 withDescriptor:v12 error:&v20];
      id v18 = v20;

      if ((v17 & 1) == 0)
      {
        uint64_t v19 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          id v22 = "-[VCCKShortcutSyncService handleSavedWorkflowRecord:]";
          __int16 v23 = 2114;
          id v24 = v18;
          __int16 v25 = 2112;
          id v26 = v14;
          _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_ERROR, "%s Failed to save WFWorkflowRecord: %{public}@, record = %@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    uint64_t v14 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v22 = "-[VCCKShortcutSyncService handleSavedWorkflowRecord:]";
      __int16 v23 = 2114;
      id v24 = v9;
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_DEFAULT, "%s Failed to get local workflow reference from workflow CKRecord with identifier: %{public}@, has the workflow been deleted?", buf, 0x16u);
    }
  }
}

- (void)handleSavedWorkflowOrderingRecord:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v25 = "-[VCCKShortcutSyncService handleSavedWorkflowOrderingRecord:]";
    __int16 v26 = 2114;
    uint64_t v27 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Handling saved workflow ordering CKRecord: %{public}@", buf, 0x16u);
  }

  id v6 = objc_opt_new();
  [MEMORY[0x1E4FB7140] hydrateItem:v6 withRecord:v4 setNilValues:0];
  id v7 = [v6 collectionIdentifier];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v7 objectType:2];
    id v9 = [(VCCKShortcutSyncService *)self database];
    id v10 = [v9 collectionRecordForCollectionIdentifier:v7 createIfNecessary:0];

    if (v10)
    {
      int v11 = [v6 orderedWorkflowIDs];
      [v10 setLastRemoteShortcutOrdering:v11];

      __int16 v12 = [v6 orderedWorkflowIDs];
      id v13 = [v10 shortcutOrdering];
      uint64_t v14 = [(VCCKShortcutSyncService *)self calculateSubsetForRemoteOrdering:v12 withLocalOrdering:v13];
      [v10 setLastRemoteShortcutOrderingSubset:v14];

      id v15 = [v6 orderedFolderIDs];
      [v10 setLastRemoteCollectionOrdering:v15];

      char v16 = [v6 orderedFolderIDs];
      uint64_t v17 = [v10 collectionOrdering];
      id v18 = [(VCCKShortcutSyncService *)self calculateSubsetForRemoteOrdering:v16 withLocalOrdering:v17];
      [v10 setLastRemoteCollectionOrderingSubset:v18];

      uint64_t v19 = [v6 recordSystemFieldsData];
      [v10 setCloudKitOrderingRecordMetadata:v19];

      id v20 = [(VCCKShortcutSyncService *)self database];
      id v23 = 0;
      LOBYTE(v17) = [v20 saveRecord:v10 withDescriptor:v8 error:&v23];
      __int16 v21 = v23;

      if ((v17 & 1) == 0)
      {
        id v22 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v25 = "-[VCCKShortcutSyncService handleSavedWorkflowOrderingRecord:]";
          __int16 v26 = 2114;
          uint64_t v27 = v21;
          _os_log_impl(&dword_1C7D7E000, v22, OS_LOG_TYPE_ERROR, "%s Failed to save folder record: %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      __int16 v21 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v25 = "-[VCCKShortcutSyncService handleSavedWorkflowOrderingRecord:]";
        __int16 v26 = 2114;
        uint64_t v27 = v7;
        _os_log_impl(&dword_1C7D7E000, v21, OS_LOG_TYPE_DEFAULT, "%s Failed to get WFWorkflowCollectionRecord for collection with identifier %{public}@, has it been deleted?", buf, 0x16u);
      }
    }

    goto LABEL_14;
  }
  uint64_t v8 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v10 = [v4 recordID];
    *(_DWORD *)buf = 136315394;
    __int16 v25 = "-[VCCKShortcutSyncService handleSavedWorkflowOrderingRecord:]";
    __int16 v26 = 2112;
    uint64_t v27 = v10;
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Unable to retrieve collection identifier from ordering CKRecord with identifier %@", buf, 0x16u);
LABEL_14:
  }
}

- (id)autoShortcutsPreferencesWithCloudKitAutoShortcutsPreferences:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4FB7100];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 appDescriptor];
  uint64_t v7 = [v4 isSiriEnabled];
  uint64_t v8 = [v4 isSpotlightEnabled];
  id v9 = [v4 disabledAutoShortcuts];
  id v10 = [v4 recordSystemFieldsData];

  int v11 = (void *)[v5 initWithAppDescriptor:v6 isSiriEnabled:v7 isSpotlightEnabled:v8 disabledAutoShortcuts:v9 cloudKitMetadata:v10];
  objc_msgSend(v11, "setLastSyncedHash:", objc_msgSend(v11, "computedSyncHash"));
  return v11;
}

- (id)libraryRecordForRecordID:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[VCCKShortcutSyncService libraryRecordForRecordID:]";
    __int16 v28 = 2114;
    id v29 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Constructing library CKRecord for recordID: %{public}@", buf, 0x16u);
  }

  id v6 = (void *)MEMORY[0x1C87C4C10]();
  uint64_t v7 = [MEMORY[0x1E4FB7150] libraryIdentifierFromRecordID:v4 error:0];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = (void *)MEMORY[0x1C87C4C10]();
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v8 objectType:10];
    int v11 = [(VCCKShortcutSyncService *)self database];
    id v25 = 0;
    __int16 v12 = [v11 recordWithDescriptor:v10 properties:0 error:&v25];
    id v13 = v25;

    if (v13)
    {
      uint64_t v14 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v27 = "-[VCCKShortcutSyncService libraryRecordForRecordID:]";
        __int16 v28 = 2114;
        id v29 = v13;
        _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_ERROR, "%s Failed to fetch library record with error: %{public}@", buf, 0x16u);
      }
      id v15 = 0;
    }
    else
    {
      id v16 = objc_alloc(MEMORY[0x1E4FB7150]);
      uint64_t v17 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
      id v15 = (void *)[v16 initWithLibraryRecord:v12 zoneID:v17];

      uint64_t v14 = [v12 cloudKitRecordMetadata];
      [v15 setRecordSystemFieldsData:v14];
    }

    if (!v13 && v15)
    {
      id v18 = [v15 dataFileRepresentation];
      uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithObject:v18];
      id v20 = [(VCCKShortcutSyncService *)self filesReferencedUntilSaved];
      [v20 setObject:v19 forKeyedSubscript:v8];

      __int16 v21 = (void *)MEMORY[0x1E4FB7140];
      id v22 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
      id v23 = [v21 createRecordFromItem:v15 zoneID:v22];

      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v8 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v27 = "-[VCCKShortcutSyncService libraryRecordForRecordID:]";
      __int16 v28 = 2114;
      id v29 = v4;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get identifier from library CKRecord with CKRecordID %{public}@", buf, 0x16u);
    }
  }
  id v23 = 0;
LABEL_16:

  return v23;
}

- (id)autoShortcutsPreferencesRecordForRecordID:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[VCCKShortcutSyncService autoShortcutsPreferencesRecordForRecordID:]";
    __int16 v27 = 2114;
    __int16 v28 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Constructing auto shortcuts preferences CKRecord for recordID: %{public}@", buf, 0x16u);
  }

  id v6 = (void *)MEMORY[0x1C87C4C10]();
  uint64_t v7 = [MEMORY[0x1E4FB7128] identifierForRecordID:v4];
  if (!v7)
  {
    uint64_t v8 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v26 = "-[VCCKShortcutSyncService autoShortcutsPreferencesRecordForRecordID:]";
      __int16 v27 = 2114;
      __int16 v28 = v4;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get identifier from auto shortcuts preferences CKRecord with CKRecordID %{public}@", buf, 0x16u);
    }
    goto LABEL_13;
  }
  uint64_t v8 = v7;
  id v9 = (void *)MEMORY[0x1C87C4C10]();
  id v10 = [(VCCKShortcutSyncService *)self database];
  id v24 = 0;
  int v11 = [v10 autoShortcutsPreferencesForIdentifier:v8 error:&v24];
  id v12 = v24;

  if (!v11)
  {
    id v22 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v26 = "-[VCCKShortcutSyncService autoShortcutsPreferencesRecordForRecordID:]";
      __int16 v27 = 2114;
      __int16 v28 = v8;
      __int16 v29 = 2114;
      id v30 = v12;
      _os_log_impl(&dword_1C7D7E000, v22, OS_LOG_TYPE_DEFAULT, "%s Unable to find auto shortcuts preferences in the database with identifier: %{public}@, error: %{public}@", buf, 0x20u);
    }

LABEL_13:
    id v16 = 0;
    goto LABEL_14;
  }
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB7128]) initWithAutoShortcutsPreferences:v11 identifier:v4];

  uint64_t v14 = (void *)MEMORY[0x1E4FB7140];
  id v15 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
  id v16 = [v14 createRecordFromItem:v13 zoneID:v15];

  uint64_t v17 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = [v4 recordName];
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[VCCKShortcutSyncService autoShortcutsPreferencesRecordForRecordID:]";
    __int16 v27 = 2114;
    __int16 v28 = v18;
    _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_INFO, "%s Setting file representations for the auto shortcuts preferences record: %{public}@", buf, 0x16u);
  }
  uint64_t v19 = [(VCCKShortcutSyncService *)self filesReferencedUntilSaved];
  id v20 = [v13 fileRepresentations];
  __int16 v21 = [v4 recordName];
  [v19 setObject:v20 forKey:v21];

LABEL_14:

  return v16;
}

- (id)folderRecordForRecordID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315138;
    id v23 = "-[VCCKShortcutSyncService folderRecordForRecordID:]";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Constructing folder CKRecord", (uint8_t *)&v22, 0xCu);
  }

  id v6 = (void *)MEMORY[0x1C87C4C10]();
  uint64_t v7 = [MEMORY[0x1E4FB7138] collectionIdentifierForRecordID:v4];
  if (!v7)
  {
    uint64_t v8 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315394;
      id v23 = "-[VCCKShortcutSyncService folderRecordForRecordID:]";
      __int16 v24 = 2114;
      id v25 = v4;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get collection identifier from folder CKRecord with CKRecordID %{public}@", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_14;
  }
  uint64_t v8 = v7;
  id v9 = (void *)MEMORY[0x1C87C4C10]();
  id v10 = [(VCCKShortcutSyncService *)self database];
  int v11 = [v10 collectionWithIdentifier:v8];

  if (!v11)
  {
    id v12 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315394;
      id v23 = "-[VCCKShortcutSyncService folderRecordForRecordID:]";
      __int16 v24 = 2114;
      id v25 = v8;
      id v13 = "%s Unable to find a collection in the database with identifier: %{public}@";
      goto LABEL_12;
    }
LABEL_13:

LABEL_14:
    uint64_t v14 = 0;
    goto LABEL_15;
  }
  if ([v11 isDeleted])
  {
    id v12 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315394;
      id v23 = "-[VCCKShortcutSyncService folderRecordForRecordID:]";
      __int16 v24 = 2114;
      id v25 = v8;
      id v13 = "%s WFWorkflowCollection for folder with identifier %{public}@ is a tombstone, not returning CKRecord";
LABEL_12:
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v22, 0x16u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  id v16 = [(VCCKShortcutSyncService *)self database];
  uint64_t v17 = [v16 collectionRecordForCollectionIdentifier:v8 createIfNecessary:0];

  id v18 = (void *)[objc_alloc(MEMORY[0x1E4FB7138]) initWithCollectionRecord:v17 identifier:v4];
  uint64_t v19 = [v17 cloudKitFolderRecordMetadata];
  [v18 setRecordSystemFieldsData:v19];

  id v20 = (void *)MEMORY[0x1E4FB7140];
  __int16 v21 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
  uint64_t v14 = [v20 createRecordFromItem:v18 zoneID:v21];

LABEL_15:

  return v14;
}

- (id)workflowRecordForRecordID:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v28 = 136315138;
    __int16 v29 = "-[VCCKShortcutSyncService workflowRecordForRecordID:]";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Constructing workflow CKRecord", (uint8_t *)&v28, 0xCu);
  }

  id v6 = (void *)MEMORY[0x1C87C4C10]();
  uint64_t v7 = [v4 recordName];
  uint64_t v8 = (void *)MEMORY[0x1C87C4C10]();
  id v9 = (void *)MEMORY[0x1C87C4C10]();
  id v10 = [(VCCKShortcutSyncService *)self database];
  int v11 = [v10 referenceForWorkflowID:v7 includingTombstones:1];

  if (!v11)
  {
    id v12 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 136315394;
      __int16 v29 = "-[VCCKShortcutSyncService workflowRecordForRecordID:]";
      __int16 v30 = 2114;
      uint64_t v31 = v7;
      id v13 = "%s Failed to load WFWorkflowReference for workflow with identifier %{public}@, has the workflow been deleted?";
      goto LABEL_9;
    }
LABEL_11:

LABEL_12:
LABEL_13:
    id v16 = 0;
    goto LABEL_14;
  }
  if ([v11 isDeleted])
  {
    id v12 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 136315394;
      __int16 v29 = "-[VCCKShortcutSyncService workflowRecordForRecordID:]";
      __int16 v30 = 2114;
      uint64_t v31 = v7;
      id v13 = "%s WFWorkflowReference for workflow with identifier %{public}@ is a tombstone, not returning CKRecord";
LABEL_9:
      uint64_t v14 = v12;
      uint32_t v15 = 22;
LABEL_10:
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v28, v15);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  id v18 = [(VCCKShortcutSyncService *)self database];
  int v19 = [v18 hasConflictingReferenceForReference:v11];

  if (v19)
  {
    id v12 = getWFCloudKitSyncLogObject();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v28 = 136315138;
    __int16 v29 = "-[VCCKShortcutSyncService workflowRecordForRecordID:]";
    id v13 = "%s Shortcut is a conflict, but sync engine is asking for a workflow record for it, retuning nil";
    uint64_t v14 = v12;
    uint32_t v15 = 12;
    goto LABEL_10;
  }
  id v20 = [(VCCKShortcutSyncService *)self workflowRecordForReference:v11 properties:0];

  if (!v20) {
    goto LABEL_12;
  }
  __int16 v21 = (void *)[objc_alloc(MEMORY[0x1E4FB7178]) initWithRecord:v20 identifier:v4];

  if (([v21 isValidForSyncing] & 1) == 0)
  {
    __int16 v27 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v28 = 136315394;
      __int16 v29 = "-[VCCKShortcutSyncService workflowRecordForRecordID:]";
      __int16 v30 = 2112;
      uint64_t v31 = v21;
      _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_ERROR, "%s Not creating a CKRecord from WFCloudKitWorkflow instance because it's not valid: %@", (uint8_t *)&v28, 0x16u);
    }

    goto LABEL_13;
  }
  int v22 = [v21 serializedDataFile];
  id v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v22];
  __int16 v24 = [(VCCKShortcutSyncService *)self filesReferencedUntilSaved];
  [v24 setObject:v23 forKeyedSubscript:v7];

  id v25 = (void *)MEMORY[0x1E4FB7140];
  uint64_t v26 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
  id v16 = [v25 createRecordFromItem:v21 zoneID:v26];

LABEL_14:

  return v16;
}

- (id)syncFlagsRecord
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[VCCKShortcutSyncService syncFlagsRecord]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_DEFAULT, "%s Constructing sync flags CKRecord", (uint8_t *)&v11, 0xCu);
  }

  id v4 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB7160]) initWithZoneID:v4];
  objc_msgSend(v5, "setMigratedVoiceShortcuts:", objc_msgSend(MEMORY[0x1E4FB7168], "voiceShortcutMigrationDidRun"));
  objc_msgSend(v5, "setDefaultShortcutsVersion:", objc_msgSend(MEMORY[0x1E4FB7168], "defaultShortcutsVersion"));
  id v6 = [(VCCKShortcutSyncService *)self database];
  uint64_t v7 = [v6 syncToken];
  uint64_t v8 = [v7 syncFlagsCloudKitRecordMetadata];
  [v5 setRecordSystemFieldsData:v8];

  id v9 = [MEMORY[0x1E4FB7140] createRecordFromItem:v5 zoneID:v4];

  return v9;
}

- (id)workflowOrderingRecordForRecordID:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v45 = "-[VCCKShortcutSyncService workflowOrderingRecordForRecordID:]";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Constructing workflow ordering CKRecord", buf, 0xCu);
  }

  id v6 = [(VCCKShortcutSyncService *)self collectionIdentifierForRecordID:v4];
  if (!v6)
  {
    id v23 = 0;
    goto LABEL_32;
  }
  uint64_t v7 = [(VCCKShortcutSyncService *)self database];
  uint64_t v8 = [v7 collectionRecordForCollectionIdentifier:v6 createIfNecessary:0];

  if (!v8)
  {
    __int16 v24 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v45 = "-[VCCKShortcutSyncService workflowOrderingRecordForRecordID:]";
      __int16 v46 = 2114;
      uint64_t v47 = v6;
      _os_log_impl(&dword_1C7D7E000, v24, OS_LOG_TYPE_INFO, "%s Could not find WFWorkflowCollectionRecord for collection identifier %{public}@, retuning nil CKRecord", buf, 0x16u);
    }
    id v23 = 0;
    goto LABEL_31;
  }
  id v9 = [v8 shortcutOrdering];
  id v10 = [v8 lastRemoteShortcutOrderingSubset];
  int v11 = [v8 lastRemoteShortcutOrdering];
  id v12 = [(VCCKShortcutSyncService *)self mergedOrderingFromLocalOrdering:v9 previousOrdering:v10 remoteOrdering:v11];

  uint64_t v13 = [v8 collectionOrdering];
  uint64_t v14 = [v8 lastRemoteCollectionOrderingSubset];
  uint32_t v15 = [v8 lastRemoteCollectionOrdering];
  id v16 = [(VCCKShortcutSyncService *)self mergedOrderingFromLocalOrdering:v13 previousOrdering:v14 remoteOrdering:v15];

  uint64_t v17 = [(VCCKShortcutSyncService *)self database];
  id v18 = [v17 workflowsWithTombstonedConflicts];
  int v19 = [v18 descriptors];
  id v20 = [v19 valueForKey:@"identifier"];

  if ([v20 count])
  {
    __int16 v21 = (void *)[v12 mutableCopy];
    [v21 removeObjectsInArray:v20];

    id v12 = v21;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4FB74A8]])
  {
    int v22 = [v8 cloudKitOrderingRecordMetadata];
    BOOL v43 = v22 == 0;
  }
  else
  {
    BOOL v43 = 0;
  }
  id v25 = [v8 lastRemoteShortcutOrdering];
  __int16 v24 = v12;
  if ([v25 count] && -[NSObject count](v24, "count"))
  {
    char v26 = [v25 isEqualToOrderedSet:v24];

    if ((v26 & 1) == 0)
    {
LABEL_17:

      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v27 = [v25 count];
    uint64_t v28 = [v24 count];

    if (v27 != v28) {
      goto LABEL_17;
    }
  }
  objc_msgSend(v8, "lastRemoteCollectionOrdering", v20);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v30 = v16;
  id v31 = v16;
  if ([v29 count] && objc_msgSend(v31, "count"))
  {
    int v32 = [v29 isEqualToOrderedSet:v31];
  }
  else
  {
    uint64_t v33 = [v29 count];
    int v32 = v33 == [v31 count];
  }

  id v16 = v30;
  id v20 = v42;
  if (((v32 ^ 1 | v43) & 1) == 0)
  {
    long long v37 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v45 = "-[VCCKShortcutSyncService workflowOrderingRecordForRecordID:]";
      __int16 v46 = 2114;
      uint64_t v47 = v6;
      __int16 v48 = 1026;
      LODWORD(v49) = 0;
      _os_log_impl(&dword_1C7D7E000, v37, OS_LOG_TYPE_INFO, "%s Not returning an ordering CKRecord for collection %{public}@ because orderings did not change since last sync, isUnsyncedRootCollectionRecord = %{public}d", buf, 0x1Cu);
    }
    id v23 = 0;
    goto LABEL_30;
  }
LABEL_24:
  int v34 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    long long v35 = [v8 lastRemoteShortcutOrdering];
    long long v36 = [v8 lastRemoteCollectionOrdering];
    *(_DWORD *)buf = 136316418;
    uint64_t v45 = "-[VCCKShortcutSyncService workflowOrderingRecordForRecordID:]";
    __int16 v46 = 2114;
    uint64_t v47 = v6;
    __int16 v48 = 2114;
    uint64_t v49 = v35;
    __int16 v50 = 2114;
    v51 = v24;
    __int16 v52 = 2114;
    uint64_t v53 = v36;
    __int16 v54 = 2114;
    id v55 = v16;
    _os_log_impl(&dword_1C7D7E000, v34, OS_LOG_TYPE_INFO, "%s Returning new ordering for %{public}@: lastRemoteShortcutOrdering = %{public}@, mergedOrderedWorkflowIDs = %{public}@, lastRemoteCollectionOrdering = %{public}@, mergedOrderedFolderIDs = %{public}@", buf, 0x3Eu);
  }
  long long v37 = [objc_alloc(MEMORY[0x1E4FB7130]) initWithIdentifier:v4 orderedWorkflowIDs:v24 orderedFolderIDs:v16];
  long long v38 = [v8 cloudKitOrderingRecordMetadata];
  [v37 setRecordSystemFieldsData:v38];

  uint64_t v39 = (void *)MEMORY[0x1E4FB7140];
  uint64_t v40 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
  id v23 = [v39 createRecordFromItem:v37 zoneID:v40];

LABEL_30:
LABEL_31:

LABEL_32:
  return v23;
}

- (id)collectionIdentifierForRecordID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[VCCKShortcutSyncService collectionIdentifierForRecordID:]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s Getting collection identifier from CKRecordID", (uint8_t *)&v9, 0xCu);
  }

  id v5 = (id *)0x1E4FB7130;
  if (([MEMORY[0x1E4FB7130] isOrderingRecordID:v3] & 1) == 0
    && (id v5 = (id *)0x1E4FB7118, ![MEMORY[0x1E4FB7118] isOrderingRecordID:v3])
    || ([*v5 collectionIdentifierForRecordID:v3],
        (id v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v7 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[VCCKShortcutSyncService collectionIdentifierForRecordID:]";
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_ERROR, "%s Failed to get collection identifier from CKRecordID %{public}@", (uint8_t *)&v9, 0x16u);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)rootCollectionRecord
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(VCCKShortcutSyncService *)self database];
  id v3 = [v2 collectionRecordForCollectionIdentifier:*MEMORY[0x1E4FB74A8] createIfNecessary:1];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[VCCKShortcutSyncService rootCollectionRecord]";
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_ERROR, "%s Could not find WFWorkflowCollectionRecord for root collection", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3;
}

- (void)sendSyncFlagsIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4FB7168] syncedFlagsHash];
  uint64_t v4 = [MEMORY[0x1E4FB7168] lastSyncedFlagsHash];
  id v5 = getWFCloudKitSyncLogObject();
  id v6 = v5;
  if (v3 == v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[VCCKShortcutSyncService sendSyncFlagsIfNeeded]";
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_INFO, "%s Synced flags hash hasn't changed, bailing out", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[VCCKShortcutSyncService sendSyncFlagsIfNeeded]";
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, "%s Sending sync flags", buf, 0xCu);
    }

    int v7 = (void *)MEMORY[0x1E4FB7160];
    uint64_t v8 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
    id v6 = [v7 recordIDWithZoneID:v8];

    id v10 = v6;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    [(VCCKShortcutSyncService *)self addRecordIDsToSave:v9 recordIDsToDelete:0];
  }
}

- (void)sendWorkflowOrderingsIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "-[VCCKShortcutSyncService sendWorkflowOrderingsIfNeeded]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_INFO, "%s Sending workflow ordering", buf, 0xCu);
  }

  uint64_t v4 = [(VCCKShortcutSyncService *)self database];
  id v5 = [v4 allCollections];

  id v6 = WFGetBuiltInCollectionIdentifiers();
  int v7 = WFGetAzulBuiltInCollectionIdentifiers();
  uint64_t v8 = [v5 descriptors];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__VCCKShortcutSyncService_sendWorkflowOrderingsIfNeeded__block_invoke;
  v12[3] = &unk_1E6540478;
  id v13 = v6;
  id v14 = v7;
  uint32_t v15 = self;
  id v9 = v7;
  id v10 = v6;
  __int16 v11 = objc_msgSend(v8, "if_map:", v12);

  [(VCCKShortcutSyncService *)self addRecordIDsToSave:v11 recordIDsToDelete:0];
}

id __56__VCCKShortcutSyncService_sendWorkflowOrderingsIfNeeded__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  if ([a1[4] containsObject:v4] && (objc_msgSend(a1[5], "containsObject:", v4) & 1) == 0) {
    id v5 = (void *)MEMORY[0x1E4FB7118];
  }
  else {
    id v5 = (void *)MEMORY[0x1E4FB7130];
  }
  id v6 = [a1[6] shortcutsZoneID];
  int v7 = [v3 identifier];
  uint64_t v8 = [v5 recordIDWithZoneID:v6 collectionIdentifier:v7];

  return v8;
}

- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    uint64_t v8 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      long long v37 = "-[VCCKShortcutSyncService addRecordIDsToSave:recordIDsToDelete:]";
      __int16 v38 = 2114;
      id v39 = v6;
      __int16 v40 = 2114;
      id v41 = v7;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_INFO, "%s Adding identifiers to save: %{public}@, identifiers to delete %{public}@", buf, 0x20u);
    }

    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          uint32_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1A408]) initWithRecordID:*(void *)(*((void *)&v30 + 1) + 8 * v14) type:0];
          [v9 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v12);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * v20);
          id v22 = objc_alloc(MEMORY[0x1E4F1A408]);
          id v23 = objc_msgSend(v22, "initWithRecordID:type:", v21, 1, (void)v26);
          [v9 addObject:v23];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v18);
    }

    __int16 v24 = [(VCCKShortcutSyncService *)self syncEngine];
    id v25 = [v24 state];
    [v25 addPendingRecordZoneChanges:v9];
  }
  else
  {
    id v9 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v37 = "-[VCCKShortcutSyncService addRecordIDsToSave:recordIDsToDelete:]";
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_INFO, "%s No changes to save or delete, bailing out", buf, 0xCu);
    }
  }
}

- (void)sendChangedFolders
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v37 = objc_opt_new();
  long long v36 = objc_opt_new();
  id v3 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v49 = "-[VCCKShortcutSyncService sendChangedFolders]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_INFO, "%s Sending changed folders", buf, 0xCu);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v4 = [(VCCKShortcutSyncService *)self database];
  id v5 = [v4 sortedVisibleFolders];
  id v6 = [v5 descriptors];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1C87C4C10]();
        uint64_t v13 = [(VCCKShortcutSyncService *)self database];
        uint64_t v14 = [v11 identifier];
        uint32_t v15 = [v13 collectionRecordForCollectionIdentifier:v14 createIfNecessary:0];

        if (v15)
        {
          uint64_t v16 = [v15 computedSyncHash];
          if (v16 != [v15 lastSyncedHash])
          {
            uint64_t v17 = (void *)MEMORY[0x1E4FB7138];
            uint64_t v18 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
            uint64_t v19 = [v11 identifier];
            uint64_t v20 = [v17 recordIDWithZoneID:v18 collectionIdentifier:v19];
            [v37 addObject:v20];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v8);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v21 = [(VCCKShortcutSyncService *)self database];
  id v22 = [v21 deletedFolders];
  id v23 = [v22 descriptors];

  uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        long long v29 = (void *)MEMORY[0x1C87C4C10]();
        long long v30 = (void *)MEMORY[0x1E4FB7138];
        long long v31 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
        long long v32 = [v28 identifier];
        long long v33 = [v30 recordIDWithZoneID:v31 collectionIdentifier:v32];
        [v36 addObject:v33];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v25);
  }

  [v37 minusSet:v36];
  int v34 = [v37 allObjects];
  long long v35 = [v36 allObjects];
  [(VCCKShortcutSyncService *)self addRecordIDsToSave:v34 recordIDsToDelete:v35];
}

- (void)sendChangedWorkflows
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v27 = objc_opt_new();
  id v3 = objc_opt_new();
  uint64_t v4 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v39 = "-[VCCKShortcutSyncService sendChangedWorkflows]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s Sending changed workflows", buf, 0xCu);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = [(VCCKShortcutSyncService *)self database];
  id v6 = [v5 changedWorkflowIDsForSync];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x1E4FB7178];
        uint64_t v13 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
        uint64_t v14 = [v12 recordIDWithZoneID:v13 workflowID:v11];
        [v27 addObject:v14];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v8);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint32_t v15 = [(VCCKShortcutSyncService *)self database];
  uint64_t v16 = [v15 deletedWorkflowIDsForSync];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * v20);
        id v22 = (void *)MEMORY[0x1E4FB7178];
        id v23 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
        uint64_t v24 = [v22 recordIDWithZoneID:v23 workflowID:v21];
        [v3 addObject:v24];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v18);
  }

  [v27 minusSet:v3];
  uint64_t v25 = [v27 allObjects];
  uint64_t v26 = [v3 allObjects];
  [(VCCKShortcutSyncService *)self addRecordIDsToSave:v25 recordIDsToDelete:v26];
}

- (id)workflowRecordForReference:(id)a3 properties:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VCCKShortcutSyncService *)self database];
  id v13 = 0;
  uint64_t v9 = [v8 recordWithDescriptor:v6 properties:v7 error:&v13];

  id v10 = v13;
  if (!v9)
  {
    uint64_t v11 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint32_t v15 = "-[VCCKShortcutSyncService workflowRecordForReference:properties:]";
      __int16 v16 = 2114;
      id v17 = v10;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_FAULT, "%s Failed to load WFWorkflowRecord from WFWorkflowReference: %{public}@, reference = %@", buf, 0x20u);
    }
  }
  return v9;
}

- (void)createShortcutsZone
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v14 = "-[VCCKShortcutSyncService createShortcutsZone]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_INFO, "%s Creating Shortcuts zone", buf, 0xCu);
  }

  id v4 = objc_alloc(MEMORY[0x1E4F1A410]);
  id v5 = objc_alloc(MEMORY[0x1E4F1A310]);
  id v6 = [(VCCKShortcutSyncService *)self shortcutsZoneID];
  id v7 = (void *)[v5 initWithZoneID:v6];
  uint64_t v8 = (void *)[v4 initWithZone:v7];

  uint64_t v9 = [(VCCKShortcutSyncService *)self syncEngine];
  id v10 = [v9 state];
  uint64_t v12 = v8;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v10 addPendingDatabaseChanges:v11];
}

- (CKRecordZoneID)shortcutsZoneID
{
  id v2 = objc_alloc(MEMORY[0x1E4F1A320]);
  id v3 = (void *)[v2 initWithZoneName:*MEMORY[0x1E4FB73E0] ownerName:*MEMORY[0x1E4F19C08]];
  return (CKRecordZoneID *)v3;
}

- (void)fetchAndModifyChangesInShortcutsZoneWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__VCCKShortcutSyncService_fetchAndModifyChangesInShortcutsZoneWithCompletion___block_invoke;
  v6[3] = &unk_1E6541940;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VCCKShortcutSyncService *)self fetchChangesInShortcutsZoneWithCompletion:v6];
}

void __78__VCCKShortcutSyncService_fetchAndModifyChangesInShortcutsZoneWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__VCCKShortcutSyncService_fetchAndModifyChangesInShortcutsZoneWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6541940;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 modifyPendingChangesInShortcutsZoneWithCompletion:v7];
}

uint64_t __78__VCCKShortcutSyncService_fetchAndModifyChangesInShortcutsZoneWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      a2 = v4;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)modifyPendingChangesInShortcutsZoneWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[VCCKShortcutSyncService modifyPendingChangesInShortcutsZoneWithCompletion:]";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Modifying pending changes in Shortcuts zone", buf, 0xCu);
  }

  id v6 = VCOSTransactionWithName(@"VCCKShortcutSyncService.modifyPendingChangesInShortcutsZoneWithCompletion");
  id v7 = [(VCCKShortcutSyncService *)self syncEngine];
  id v8 = [(VCCKShortcutSyncService *)self sendChangesOptions];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__VCCKShortcutSyncService_modifyPendingChangesInShortcutsZoneWithCompletion___block_invoke;
  v11[3] = &unk_1E6541940;
  id v12 = v6;
  id v13 = v4;
  id v9 = v6;
  id v10 = v4;
  [v7 sendChangesWithOptions:v8 completionHandler:v11];
}

void __77__VCCKShortcutSyncService_modifyPendingChangesInShortcutsZoneWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getWFCloudKitSyncLogObject();
  id v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v11 = 136315394;
    id v12 = "-[VCCKShortcutSyncService modifyPendingChangesInShortcutsZoneWithCompletion:]_block_invoke";
    __int16 v13 = 2114;
    id v14 = v3;
    id v6 = "%s Error modifying changes in the Shortcuts zone: %{public}@";
    id v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    uint32_t v9 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    int v11 = 136315138;
    id v12 = "-[VCCKShortcutSyncService modifyPendingChangesInShortcutsZoneWithCompletion:]_block_invoke";
    id v6 = "%s Finished modifying changes in the Shortcuts zone";
    id v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_INFO;
    uint32_t v9 = 12;
  }
  _os_log_impl(&dword_1C7D7E000, v7, v8, v6, (uint8_t *)&v11, v9);
LABEL_7:

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
  }
}

- (void)fetchChangesInShortcutsZoneWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:]";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Fetching changes in Shortcuts zone", buf, 0xCu);
  }

  id v6 = VCOSTransactionWithName(@"VCCKShortcutSyncService.fetchChangesInShortcutsZoneWithCompletion");
  id v7 = [(VCCKShortcutSyncService *)self syncEngine];
  os_log_type_t v8 = [(VCCKShortcutSyncService *)self fetchChangesOptions];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__VCCKShortcutSyncService_fetchChangesInShortcutsZoneWithCompletion___block_invoke;
  v11[3] = &unk_1E6540450;
  id v12 = v6;
  id v13 = v4;
  void v11[4] = self;
  id v9 = v6;
  id v10 = v4;
  [v7 fetchChangesWithOptions:v8 completionHandler:v11];
}

void __69__VCCKShortcutSyncService_fetchChangesInShortcutsZoneWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getWFCloudKitSyncLogObject();
  id v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      int v11 = "-[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Finished fetching changes in the Shortcuts zone", (uint8_t *)&v10, 0xCu);
    }
    id v3 = v5;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315394;
    int v11 = "-[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:]_block_invoke";
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_ERROR, "%s Error fetching changes in the Shortcuts zone: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (VCCloudKitErrorContainsErrorWithCode(v3, 26))
  {
    id v6 = getWFCloudKitSyncLogObject();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:

      [*(id *)(a1 + 32) createShortcutsZone];
LABEL_12:

      id v3 = 0;
      goto LABEL_13;
    }
    int v10 = 136315138;
    int v11 = "-[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:]_block_invoke";
    id v7 = "%s Zone not found error encountered, asking sync engine to create the Shortcuts zone";
LABEL_7:
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0xCu);
    goto LABEL_8;
  }
  if (VCCloudKitErrorContainsErrorWithCode(v3, 28))
  {
    id v9 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_DEFAULT, "%s User deleted zone error encountered", (uint8_t *)&v10, 0xCu);
    }

    [MEMORY[0x1E4FB7168] setZoneWasPurged:1];
    if ([MEMORY[0x1E4FB7168] ignoresUserDeletedZoneErrors])
    {
      id v6 = getWFCloudKitSyncLogObject();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
      int v10 = 136315138;
      int v11 = "-[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:]_block_invoke";
      id v7 = "%s User has consented to resuming sync, recreating the zone";
      goto LABEL_7;
    }
  }
LABEL_13:
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, NSObject *))(v8 + 16))(v8, v3);
  }
}

- (void)fetchChangesInShortcutsZone
{
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[VCCKShortcutSyncService dealloc]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_DEFAULT, "%s VCCKShortcutSyncService dealloc", buf, 0xCu);
  }

  [(VCCKShortcutSyncService *)self stopObservingUserDefaults];
  id v4 = [(VCCKShortcutSyncService *)self applicationObserver];
  [v4 removeObserver:self forKeyPath:@"applicationVisible" context:VCCKShortcutSyncServiceApplicationVisibilityChangedContext];

  v5.receiver = self;
  v5.super_class = (Class)VCCKShortcutSyncService;
  [(VCCKShortcutSyncService *)&v5 dealloc];
}

- (VCCKShortcutSyncService)initWithContainer:(id)a3 database:(id)a4 applicationObserver:(id)a5 automaticSyncEnabled:(BOOL)a6 logger:(id)a7
{
  BOOL v8 = a6;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2, self, @"VCCKShortcutSyncService.m", 81, @"Invalid parameter not satisfying: %@", @"container" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  id v55 = [MEMORY[0x1E4F28B00] currentHandler];
  [v55 handleFailureInMethod:a2, self, @"VCCKShortcutSyncService.m", 82, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];

LABEL_3:
  v62.receiver = self;
  v62.super_class = (Class)VCCKShortcutSyncService;
  id v17 = [(VCCKShortcutSyncService *)&v62 init];
  __int16 v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_database, a4);
    objc_storeStrong((id *)&v18->_applicationObserver, a5);
    objc_storeStrong((id *)&v18->_logger, a7);
    id v19 = [v14 syncToken];
    uint64_t v20 = [v19 syncEngineMetadata];

    uint64_t v21 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [v20 length];
      *(_DWORD *)buf = 136315394;
      __int16 v66 = "-[VCCKShortcutSyncService initWithContainer:database:applicationObserver:automaticSyncEnabled:logger:]";
      __int16 v67 = 2048;
      uint64_t v68 = v22;
      _os_log_impl(&dword_1C7D7E000, v21, OS_LOG_TYPE_DEFAULT, "%s Loaded sync engine metadata, length = %lu", buf, 0x16u);
    }

    id v57 = v15;
    id v58 = v14;
    uint64_t v53 = v20;
    id v56 = v16;
    if (![v20 length])
    {
      uint64_t v24 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v66 = "-[VCCKShortcutSyncService initWithContainer:database:applicationObserver:automaticSyncEnabled:logger:]";
        _os_log_impl(&dword_1C7D7E000, v24, OS_LOG_TYPE_DEFAULT, "%s Sync engine metadata is empty, initializing configuration with nil state serialization", buf, 0xCu);
      }
      id v23 = 0;
      goto LABEL_19;
    }
    id v61 = 0;
    id v23 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v20 error:&v61];
    uint64_t v24 = v61;
    if (v24)
    {
      uint64_t v25 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v66 = "-[VCCKShortcutSyncService initWithContainer:database:applicationObserver:automaticSyncEnabled:logger:]";
        __int16 v67 = 2112;
        uint64_t v68 = (uint64_t)v24;
        _os_log_impl(&dword_1C7D7E000, v25, OS_LOG_TYPE_ERROR, "%s Failed to unarchive state serialization: %@", buf, 0x16u);
      }
    }
    else
    {
      if (v23)
      {
        uint64_t v24 = 0;
LABEL_19:

        id v28 = objc_alloc(MEMORY[0x1E4F1A3E0]);
        long long v29 = [v13 privateCloudDatabase];
        long long v30 = (void *)[v28 initWithDatabase:v29 stateSerialization:v23 delegate:v18];

        [v30 setApsMachServiceName:@"com.apple.aps.siriactionsd"];
        [v30 setAutomaticallySync:v8];
        uint64_t v31 = [objc_alloc(MEMORY[0x1E4F1A3D8]) initWithConfiguration:v30];
        syncEngine = v18->_syncEngine;
        v18->_syncEngine = (CKSyncEngine *)v31;

        id v33 = objc_alloc(MEMORY[0x1E4F1A428]);
        long long v34 = (void *)MEMORY[0x1E4F1CAD0];
        long long v35 = [(VCCKShortcutSyncService *)v18 shortcutsZoneID];
        __int16 v64 = v35;
        long long v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
        long long v37 = [v34 setWithArray:v36];
        long long v38 = (void *)[v33 initWithZoneIDs:v37];

        uint64_t v39 = [objc_alloc(MEMORY[0x1E4F1A420]) initWithScope:v38];
        sendChangesOptions = v18->_sendChangesOptions;
        v18->_sendChangesOptions = (CKSyncEngineSendChangesOptions *)v39;

        id v41 = objc_alloc(MEMORY[0x1E4F1A3F0]);
        long long v42 = (void *)MEMORY[0x1E4F1CAD0];
        long long v43 = [(VCCKShortcutSyncService *)v18 shortcutsZoneID];
        id v63 = v43;
        long long v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
        long long v45 = [v42 setWithArray:v44];
        __int16 v46 = (void *)[v41 initWithZoneIDs:v45];

        uint64_t v47 = [objc_alloc(MEMORY[0x1E4F1A3E8]) initWithScope:v46];
        fetchChangesOptions = v18->_fetchChangesOptions;
        v18->_fetchChangesOptions = (CKSyncEngineFetchChangesOptions *)v47;

        uint64_t v49 = objc_opt_new();
        filesReferencedUntilSaved = v18->_filesReferencedUntilSaved;
        v18->_filesReferencedUntilSaved = (NSMutableDictionary *)v49;

        [(VCCKShortcutSyncService *)v18 start];
        v51 = v18;

        id v15 = v57;
        id v14 = v58;
        id v16 = v56;
        goto LABEL_20;
      }
      uint64_t v26 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v66 = "-[VCCKShortcutSyncService initWithContainer:database:applicationObserver:automaticSyncEnabled:logger:]";
        _os_log_impl(&dword_1C7D7E000, v26, OS_LOG_TYPE_DEBUG, "%s Migrating from old sync engine metadata blob to new sync engine state serialization", buf, 0xCu);
      }

      id v23 = (void *)[objc_alloc(MEMORY[0x1E4F1A440]) initWithDeprecatedData:v20];
      long long v27 = objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:", v23);
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __102__VCCKShortcutSyncService_initWithContainer_database_applicationObserver_automaticSyncEnabled_logger___block_invoke;
      v59[3] = &unk_1E6540428;
      id v60 = v27;
      uint64_t v25 = v27;
      [(VCCKShortcutSyncService *)v18 updateSyncTokenInDatabaseWithBlock:v59];
    }
    goto LABEL_19;
  }
LABEL_20:

  return v18;
}

uint64_t __102__VCCKShortcutSyncService_initWithContainer_database_applicationObserver_automaticSyncEnabled_logger___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSyncEngineMetadata:*(void *)(a1 + 32)];
}

@end