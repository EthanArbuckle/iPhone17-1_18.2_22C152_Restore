@interface FCUserEventHistory
+ (BOOL)requiresBatchedSync;
+ (BOOL)requiresHighPriorityFirstSync;
+ (BOOL)requiresPushNotificationSupport;
+ (id)backingRecordIDs;
+ (id)backingRecordZoneIDs;
+ (id)commandStoreFileName;
+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4;
+ (id)localStoreFilename;
+ (int64_t)commandQueueUrgency;
+ (unint64_t)localStoreVersion;
- (FCUserEventHistory)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5 sessionStorage:(id)a6;
- (FCUserEventHistoryStorage)privateStorage;
- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3;
- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4;
- (void)loadLocalCachesFromStore;
- (void)setPrivateStorage:(id)a3;
- (void)storage:(id)a3 didClearAllSessions:(id)a4;
- (void)storage:(id)a3 didStoreData:(id)a4 forSessionID:(id)a5;
@end

@implementation FCUserEventHistory

+ (unint64_t)localStoreVersion
{
  return 1;
}

+ (id)localStoreFilename
{
  return @"user-event-history";
}

+ (id)commandStoreFileName
{
  return @"user-event-history-commands";
}

+ (int64_t)commandQueueUrgency
{
  return 1;
}

- (void)loadLocalCachesFromStore
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__FCUserEventHistory_loadLocalCachesFromStore__block_invoke;
  v2[3] = &unk_1E5B4C018;
  v2[4] = self;
  +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:v2];
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

- (FCUserEventHistory)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5 sessionStorage:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)FCUserEventHistory;
  v12 = [(FCPrivateDataController *)&v15 initWithContext:a3 pushNotificationCenter:a4 storeDirectory:a5];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_privateStorage, a6);
    [(FCUserEventHistoryStorage *)v13->_privateStorage addObserver:v13];
  }

  return v13;
}

void __46__FCUserEventHistory_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) privateStorage];
  v3 = [*(id *)(a1 + 32) context];
  v4 = [v3 appConfigurationManager];
  v5 = [v4 possiblyUnfetchedAppConfiguration];
  v6 = [v5 newsPersonalizationConfiguration];
  v7 = [v6 trackingConfiguration];
  v8 = [v7 pruningPolicies];
  v9 = [v2 pruneWithPolicies:v8];

  uint64_t v10 = [v9 count];
  id v11 = FCUserEventsLog;
  BOOL v12 = os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      v13 = v11;
      int v15 = 134217984;
      uint64_t v16 = [v9 count];
      _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "User event history found %ld pruned IDs, adding command to remove from cloud", (uint8_t *)&v15, 0xCu);
    }
    v14 = [[FCRemoveUserEventHistoryCommand alloc] initWithSessionIDs:v9];
    [*(id *)(a1 + 32) addCommandToCommandQueue:v14];
  }
  else if (v12)
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "User event history found no pruned IDs", (uint8_t *)&v15, 2u);
  }
}

- (FCUserEventHistoryStorage)privateStorage
{
  return self->_privateStorage;
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 1;
}

+ (id)backingRecordZoneIDs
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1A320]);
  v3 = (void *)[v2 initWithZoneName:@"UserEventHistory" ownerName:*MEMORY[0x1E4F19C08]];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = FCUserEventsLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Asked for command to merge user event history local data with cloud", buf, 2u);
  }
  v8 = [FCUserEventHistoryStorage alloc];
  v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  uint64_t v10 = [(FCUserEventHistoryStorage *)v8 initWithPrivateDataDirectory:v9];

  id v11 = [(FCUserEventHistoryStorage *)v10 sessions];
  BOOL v12 = FCUserEventsLog;
  BOOL v13 = os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v14 = v12;
      uint64_t v15 = [v11 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = v15;
      _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "Returning command to sync %lu sessions", buf, 0xCu);
    }
    uint64_t v16 = [[FCModifyUserEventHistoryCommand alloc] initWithSessions:v11];
    v20 = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "Failed to lookup sesssions to build commands to merge local data to cloud", buf, 2u);
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
    id v18 = MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)FCUserEventsLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 134218240;
    uint64_t v15 = [v6 count];
    __int16 v16 = 2048;
    uint64_t v17 = [v7 count];
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "User event history handling sync with %lu changed records, %lu deleted records", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__FCUserEventHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke;
  v13[3] = &unk_1E5B57EE0;
  v13[4] = self;
  [v6 enumerateObjectsUsingBlock:v13];
  uint64_t v10 = [(FCUserEventHistory *)self privateStorage];
  id v11 = v10;
  if (v7) {
    id v12 = v7;
  }
  else {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }
  [v10 clearSessionsWithIDs:v12];
}

void __70__FCUserEventHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectForKeyedSubscript:@"sessionData"];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) privateStorage];
    id v6 = [v3 recordID];
    id v7 = [v6 recordName];
    [v5 storeSessionID:v7 compressedSessionData:v4 notify:0];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__FCUserEventHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_2;
    v8[3] = &unk_1E5B4C018;
    id v9 = v3;
    __70__FCUserEventHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_2((uint64_t)v8);
  }
}

void __70__FCUserEventHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Handing sync for CKRecord with no session data: %@", *(void *)(a1 + 32)];
    *(_DWORD *)buf = 136315906;
    v4 = "-[FCUserEventHistory handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke_2";
    __int16 v5 = 2080;
    id v6 = "FCUserEventHistory.m";
    __int16 v7 = 1024;
    int v8 = 142;
    __int16 v9 = 2114;
    uint64_t v10 = v2;
    _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: InvalidUserEventHistorySessionCKRecord) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  id v4 = a3;
  __int16 v5 = [(FCUserEventHistory *)self storage];
  id v6 = [v5 sessionIDs];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__FCUserEventHistory_allKnownRecordNamesWithinRecordZoneWithID___block_invoke;
    v9[3] = &unk_1E5B505B0;
    id v10 = v4;
    __64__FCUserEventHistory_allKnownRecordNamesWithinRecordZoneWithID___block_invoke((uint64_t)v9);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

uint64_t __64__FCUserEventHistory_allKnownRecordNamesWithinRecordZoneWithID___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = FCUserEventsLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Failed to get session ids for all known record names within record zone %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return MEMORY[0x1E4F1CBF0];
}

- (void)storage:(id)a3 didStoreData:(id)a4 forSessionID:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = (void *)FCUserEventsLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)MEMORY[0x1E4F28B68];
    uint64_t v11 = v9;
    id v12 = objc_msgSend(v10, "stringFromByteCount:countStyle:", objc_msgSend(v7, "length"), 0);
    *(_DWORD *)buf = 138543618;
    id v18 = v8;
    __int16 v19 = 2114;
    v20 = v12;
    _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "Observed session stored with ID %{public}@, size %{public}@. Queueing command to sync session.", buf, 0x16u);
  }
  BOOL v13 = [[FCModifyUserEventHistoryCommand alloc] initWithSessionID:v8 data:v7];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__FCUserEventHistory_storage_didStoreData_forSessionID___block_invoke;
  v15[3] = &unk_1E5B4BE70;
  v15[4] = self;
  __int16 v16 = v13;
  v14 = v13;
  FCPerformBlockOnMainThread(v15);
}

uint64_t __56__FCUserEventHistory_storage_didStoreData_forSessionID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addCommandToCommandQueue:*(void *)(a1 + 40)];
}

- (void)storage:(id)a3 didClearAllSessions:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = (void *)FCUserEventsLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    int v9 = 134217984;
    uint64_t v10 = [v5 count];
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Observed session storage cleared all session IDs. Queueing command to remove %lu session records.", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [[FCRemoveUserEventHistoryCommand alloc] initWithSessionIDs:v5];
  [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
}

- (void)setPrivateStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end