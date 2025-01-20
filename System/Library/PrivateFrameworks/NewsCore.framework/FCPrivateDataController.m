@interface FCPrivateDataController
+ (BOOL)isLocalStoreKeyInternal:(id)a3;
+ (BOOL)requiresBatchedSync;
+ (BOOL)requiresHighPriorityFirstSync;
+ (BOOL)requiresPushNotificationSupport;
+ (id)backingRecordIDs;
+ (id)backingRecordZoneIDs;
+ (id)commandStoreFileName;
+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4;
+ (id)desiredKeys;
+ (id)internalLocalStoreKeys;
+ (id)localStoreFilename;
+ (int64_t)commandQueueUrgency;
+ (unint64_t)localStoreVersion;
- (BOOL)canHelpPruneZoneName:(id)a3;
- (BOOL)canHelpRestoreZoneName:(id)a3;
- (BOOL)isBackedByAnyRecordZoneIDsInSet:(id)a3;
- (BOOL)isDirty;
- (BOOL)isSyncingEnabled;
- (BOOL)isWaitingForFirstSync;
- (FCCloudContext)context;
- (FCKeyValueStore)localStore;
- (FCPrivateDataController)init;
- (FCPrivateDataController)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5;
- (NSDate)modificationDate;
- (NSHashTable)observers;
- (double)softMaxRecordAgeWhenMigratingZoneName:(id)a3;
- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3;
- (id)jsonEncodableObject;
- (id)localStoreMigrator;
- (id)pruneRecords:(id)a3 forZoneName:(id)a4;
- (id)recordsForRestoringZoneName:(id)a3;
- (int64_t)qualityOfServiceForNextCommandInCommandQueue:(id)a3;
- (unint64_t)softMaxRecordCountWhenMigratingZoneName:(id)a3;
- (void)_markAsDirtyAndNotifyObservers:(uint64_t)a1;
- (void)_markAsDirtyIfZonesChangedExternally;
- (void)_notifyObservers;
- (void)_possiblySimulateCrashWithMessage:(id)a3;
- (void)_serialSyncWithCompletion:(uint64_t)a1;
- (void)_syncWithCondition:(void *)a3 completion:;
- (void)activityObservingApplicationWindowDidBecomeForeground;
- (void)addCommandToCommandQueue:(id)a3;
- (void)addObserver:(id)a3;
- (void)addStateObserver:(id)a3;
- (void)assertReadyForUse;
- (void)createLocalStore;
- (void)dealloc;
- (void)disableSyncing;
- (void)enableSyncing;
- (void)forceSyncWithCompletion:(id)a3;
- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4;
- (void)loadLocalCachesFromStore;
- (void)markAsDirty;
- (void)mergeLocalStoreWithCloudWithPrivateDataDirectory:(id)a3;
- (void)performFirstSyncWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)performFirstSyncWithCompletion:(id)a3;
- (void)prepareForUse;
- (void)recordSyncManager:(id)a3 stateDidChange:(id)a4;
- (void)removeObserver:(id)a3;
- (void)removeStateObserver:(id)a3;
- (void)saveWithCompletion:(id)a3;
- (void)setSyncingEnabled:(BOOL)a3;
- (void)syncWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)syncWithCompletion:(id)a3;
- (void)zoneSyncManager:(id)a3 stateDidChange:(id)a4;
@end

@implementation FCPrivateDataController

- (void)assertReadyForUse
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!self || !self->_preparedForUse)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v3 = (void *)[[NSString alloc] initWithFormat:@"-prepareForUse should be called before reading any data"];
      int v4 = 136315906;
      v5 = "-[FCPrivateDataController(Setup) assertReadyForUse]";
      __int16 v6 = 2080;
      v7 = "FCPrivateDataController.m";
      __int16 v8 = 1024;
      int v9 = 984;
      __int16 v10 = 2114;
      v11 = v3;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);

      if (self)
      {
LABEL_5:
        if (self->_preparedForUse) {
          return;
        }
      }
    }
    else if (self)
    {
      goto LABEL_5;
    }
    [(FCPrivateDataController *)self _possiblySimulateCrashWithMessage:@"should never access userInfo data before calling prepareForUse"];
  }
}

- (void)addObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    v5 = [(FCPrivateDataController *)self observers];
    int v6 = [v5 containsObject:v4];

    if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p is already an observer", v4);
      *(_DWORD *)buf = 136315906;
      __int16 v10 = "-[FCPrivateDataController addObserver:]";
      __int16 v11 = 2080;
      uint64_t v12 = "FCPrivateDataController.m";
      __int16 v13 = 1024;
      int v14 = 316;
      __int16 v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v7 = [(FCPrivateDataController *)self observers];
    [v7 addObject:v4];
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[FCPrivateDataController addObserver:]";
    __int16 v11 = 2080;
    uint64_t v12 = "FCPrivateDataController.m";
    __int16 v13 = 1024;
    int v14 = 312;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_8:
}

- (NSHashTable)observers
{
  return self->_observers;
}

void __46__FCPrivateDataController_syncWithCompletion___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__FCPrivateDataController_syncWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E5B4C090;
  aBlock[4] = *(void *)(a1 + 32);
  v2 = _Block_copy(aBlock);
  -[FCPrivateDataController _syncWithCondition:completion:](*(id **)(a1 + 32), v2, *(void **)(a1 + 40));
}

- (void)syncWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__FCPrivateDataController_syncWithCompletion___block_invoke;
  v6[3] = &unk_1E5B4CC80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  FCPerformBlockOnMainThread(v6);
}

- (void)_syncWithCondition:(void *)a3 completion:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    if ([a1 isSyncingEnabled] && v5[2](v5))
    {
      id v7 = (void *)FCPrivateDataLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v8 = v7;
        int v9 = (objc_class *)objc_opt_class();
        __int16 v10 = NSStringFromClass(v9);
        *(_DWORD *)buf = 138543362;
        v18 = v10;
        _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will enter sync queue", buf, 0xCu);
      }
      id v11 = a1[7];
      int v12 = [a1 isWaitingForFirstSync];
      if ((v12 & [(id)objc_opt_class() requiresHighPriorityFirstSync]) != 0) {
        uint64_t v13 = 25;
      }
      else {
        uint64_t v13 = 17;
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__FCPrivateDataController__syncWithCondition_completion___block_invoke;
      v14[3] = &unk_1E5B50BC0;
      v14[4] = a1;
      __int16 v15 = v5;
      id v16 = v6;
      [v11 withQualityOfService:v13 enqueueBlockForMainThread:v14];
    }
    else if (v6)
    {
      (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
    }
  }
}

- (FCPrivateDataController)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v40.receiver = self;
  v40.super_class = (Class)FCPrivateDataController;
  int v12 = [(FCPrivateDataController *)&v40 init];
  uint64_t v13 = v12;
  if (v12)
  {
    if (v9 && v11)
    {
      objc_storeStrong((id *)&v12->_context, a3);
      objc_storeStrong((id *)&v13->_pushNotificationCenter, a4);
      uint64_t v14 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      stateObservers = v13->_stateObservers;
      v13->_stateObservers = (NSHashTable *)v14;

      uint64_t v16 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      observers = v13->_observers;
      v13->_observers = (NSHashTable *)v16;

      uint64_t v18 = objc_opt_new();
      syncQueue = v13->_syncQueue;
      v13->_syncQueue = (FCAsyncSerialQueue *)v18;

      uint64_t v20 = [v11 copy];
      storeDirectory = v13->_storeDirectory;
      v13->_storeDirectory = (NSString *)v20;

      v22 = objc_alloc_init(FCKeyValueStoreClassRegistry);
      [(FCKeyValueStoreClassRegistry *)v22 registerClass:objc_opt_class()];
      [(id)objc_opt_class() populateLocalStoreClassRegistry:v22];
      v23 = [(FCPrivateDataController *)v13 localStoreMigrator];
      v24 = [v9 appActivityMonitor];
      v25 = [v9 backgroundTaskable];
      v26 = +[FCKeyValueStoreSavePolicy appBackgroundPolicyWithActivityMonitor:v24 backgroundTaskable:v25];

      v27 = [FCKeyValueStore alloc];
      v28 = [(id)objc_opt_class() localStoreFilename];
      v29 = v13->_storeDirectory;
      uint64_t v30 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:migrator:savePolicy:](v27, "initWithName:directory:version:options:classRegistry:migrator:savePolicy:", v28, v29, [(id)objc_opt_class() localStoreVersion], 2, v22, v23, v26);
      localStore = v13->_localStore;
      v13->_localStore = (FCKeyValueStore *)v30;

      [(id)objc_opt_class() configureKeyValueStoreForJSONHandling:v13->_localStore];
      v32 = [v9 appActivityMonitor];
      [v32 addObserver:v13];

      v33 = [(id)objc_opt_class() commandStoreFileName];
      v34 = [FCCommandQueue alloc];
      if (v33)
      {
        v35 = v13->_storeDirectory;
        uint64_t v36 = -[FCCommandQueue initWithContext:storeDirectory:storeFilename:urgency:suspended:delegate:](v34, "initWithContext:storeDirectory:storeFilename:urgency:suspended:delegate:", v9, v35, v33, [(id)objc_opt_class() commandQueueUrgency], 1, v13);
        commandQueue = v13->_commandQueue;
        v13->_commandQueue = (FCCommandQueue *)v36;
      }
      else
      {
        uint64_t v38 = -[FCCommandQueue initWithContext:urgency:suspended:delegate:](v34, "initWithContext:urgency:suspended:delegate:", v9, [(id)objc_opt_class() commandQueueUrgency], 1, v13);
        v35 = v13->_commandQueue;
        v13->_commandQueue = (FCCommandQueue *)v38;
      }
    }
    else
    {
      v22 = (FCKeyValueStoreClassRegistry *)v12;
      uint64_t v13 = 0;
    }
  }
  return v13;
}

- (id)localStoreMigrator
{
  return 0;
}

- (void)performFirstSyncWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__FCPrivateDataController_performFirstSyncWithCompletion___block_invoke;
  v6[3] = &unk_1E5B50C10;
  id v7 = v4;
  id v5 = v4;
  [(FCPrivateDataController *)self performFirstSyncWithCallbackQueue:MEMORY[0x1E4F14428] completion:v6];
}

- (NSDate)modificationDate
{
  v2 = [(FCPrivateDataController *)self localStore];
  v3 = [v2 modificationDate];

  return (NSDate *)v3;
}

- (void)performFirstSyncWithCallbackQueue:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = (void *)FCPrivateDataLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    int v12 = objc_msgSend(NSNumber, "numberWithBool:", -[FCPrivateDataController isWaitingForFirstSync](self, "isWaitingForFirstSync"));
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ was asked to perform first sync; isWaitingForFirstSync=%{public}@",
      buf,
      0x16u);
  }
  if ([(FCPrivateDataController *)self isWaitingForFirstSync])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke;
    v13[3] = &unk_1E5B4EFB8;
    v13[4] = self;
    id v15 = v7;
    id v14 = v6;
    FCPerformBlockOnMainThread(v13);
  }
  else if (v7)
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

- (int64_t)qualityOfServiceForNextCommandInCommandQueue:(id)a3
{
  if (self)
  {
    int v3 = objc_msgSend(self, "isWaitingForFirstSync", a3);
    if ((v3 & [(id)objc_opt_class() requiresHighPriorityFirstSync]) != 0) {
      return 25;
    }
    else {
      return 17;
    }
  }
  return self;
}

- (void)prepareForUse
{
  v2 = self;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (!self)
  {
    char v41 = [0 isSyncingEnabled];
    commandQueue = 0;
    if ((v41 & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_7;
  }
  if (self->_preparedForUse && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_super v40 = (void *)[[NSString alloc] initWithFormat:@"-prepareForUse should only be called once"];
    *(_DWORD *)buf = 136315906;
    v57 = "-[FCPrivateDataController(Setup) prepareForUse]";
    __int16 v58 = 2080;
    v59 = "FCPrivateDataController.m";
    __int16 v60 = 1024;
    *(_DWORD *)v61 = 909;
    *(_WORD *)&v61[4] = 2114;
    *(void *)&v61[6] = v40;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if ([(FCPrivateDataController *)v2 isSyncingEnabled])
  {
    commandQueue = v2->_commandQueue;
LABEL_7:
    [(FCCommandQueue *)commandQueue resume];
    id v4 = [(FCPrivateDataController *)v2 localStore];
    id v5 = [v4 objectForKeyedSubscript:@"sync-state"];

    if ([v5 version] != 2)
    {
      if (v2)
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4F82B30]);
        [v6 setVersion:2];
      }
      else
      {
        id v6 = 0;
      }

      id v7 = [(FCPrivateDataController *)v2 localStore];
      [v7 setObject:v6 forKeyedSubscript:@"sync-state"];

      id v5 = v6;
    }
    __int16 v8 = [v5 zoneStates];
    id v9 = objc_msgSend(v8, "fc_dictionaryWithKeyBlock:", &__block_literal_global_273);

    id v10 = [v5 recordStates];
    id v11 = objc_msgSend(v10, "fc_dictionaryWithKeyBlock:", &__block_literal_global_276);

    int v12 = [(id)objc_opt_class() backingRecordZoneIDs];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __47__FCPrivateDataController_Setup__prepareForUse__block_invoke_3;
    v54[3] = &unk_1E5B50D80;
    v54[4] = v2;
    id v13 = v9;
    id v55 = v13;
    id v14 = objc_msgSend(v12, "fc_arrayByTransformingWithBlock:", v54);

    id v15 = [(id)objc_opt_class() backingRecordIDs];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __47__FCPrivateDataController_Setup__prepareForUse__block_invoke_4;
    v52[3] = &unk_1E5B50DA8;
    v52[4] = v2;
    id v16 = v11;
    id v53 = v16;
    uint64_t v17 = objc_msgSend(v15, "fc_arrayByTransformingWithBlock:", v52);

    __int16 v18 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_arrayByAddingObjectsFromArray:toArray:", v17, v14);
    if (v2) {
      objc_storeStrong((id *)&v2->_syncManagers, v18);
    }

    v2->_waitingForFirstSync = [(NSArray *)v2->_syncManagers fc_containsObjectPassingTest:&__block_literal_global_281];
    if ([(id)objc_opt_class() requiresPushNotificationSupport])
    {
      v42 = v17;
      v44 = v5;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v43 = v14;
      id obj = v14;
      uint64_t v19 = [obj countByEnumeratingWithState:&v48 objects:v64 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v49;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v49 != v21) {
              objc_enumerationMutation(obj);
            }
            v23 = *(void **)(*((void *)&v48 + 1) + 8 * v22);
            if (v2)
            {
              v24 = v2;
              pushNotificationCenter = v2->_pushNotificationCenter;
            }
            else
            {
              v24 = 0;
              pushNotificationCenter = 0;
            }
            v26 = pushNotificationCenter;
            if (v23) {
              v27 = (void *)v23[2];
            }
            else {
              v27 = 0;
            }
            id v28 = v27;
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __47__FCPrivateDataController_Setup__prepareForUse__block_invoke_6;
            v47[3] = &unk_1E5B4C018;
            v47[4] = v23;
            -[FCPushNotificationCenter addObserver:forChangesToRecordZoneID:usingBlock:]((uint64_t)v26, v23, v28, v47);

            ++v22;
            v2 = v24;
          }
          while (v20 != v22);
          uint64_t v29 = [obj countByEnumeratingWithState:&v48 objects:v64 count:16];
          uint64_t v20 = v29;
        }
        while (v29);
      }

      id v5 = v44;
      id v14 = v43;
      uint64_t v17 = v42;
    }
    -[FCPrivateDataController _markAsDirtyIfZonesChangedExternally]((uint64_t)v2);
  }
LABEL_30:
  [(FCPrivateDataController *)v2 loadLocalCachesFromStore];
  uint64_t v30 = (void *)FCPrivateDataLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
  {
    obja = v30;
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (char *)objc_claimAutoreleasedReturnValue();
    v33 = [(FCPrivateDataController *)v2 localStore];
    v34 = [v33 allKeys];
    uint64_t v35 = [v34 count];
    if ([(FCPrivateDataController *)v2 isSyncingEnabled]) {
      uint64_t v36 = @"YES";
    }
    else {
      uint64_t v36 = @"NO";
    }
    if ([(FCPrivateDataController *)v2 isWaitingForFirstSync]) {
      v37 = @"YES";
    }
    else {
      v37 = @"NO";
    }
    BOOL v38 = [(FCPrivateDataController *)v2 isDirty];
    *(_DWORD *)buf = 138544386;
    if (v38) {
      v39 = @"YES";
    }
    else {
      v39 = @"NO";
    }
    v57 = v32;
    __int16 v58 = 2048;
    v59 = (char *)v35;
    __int16 v60 = 2114;
    *(void *)v61 = v36;
    *(_WORD *)&v61[8] = 2114;
    *(void *)&v61[10] = v37;
    __int16 v62 = 2114;
    v63 = v39;
    _os_log_impl(&dword_1A460D000, obja, OS_LOG_TYPE_DEFAULT, "%{public}@ prepared for use with %lu store entries, isSyncingEnabled=%{public}@, waitingForFirstSync=%{public}@, dirty=%{public}@", buf, 0x34u);
  }
  if (v2) {
    v2->_preparedForUse = 1;
  }
}

- (BOOL)isDirty
{
  [MEMORY[0x1E4F29060] isMainThread];
  if (self) {
    syncManagers = self->_syncManagers;
  }
  else {
    syncManagers = 0;
  }
  return [(NSArray *)syncManagers fc_containsObjectPassingTest:&__block_literal_global_40];
}

- (BOOL)isWaitingForFirstSync
{
  return self->_waitingForFirstSync;
}

- (void)activityObservingApplicationWindowDidBecomeForeground
{
  if ([(FCPrivateDataController *)self isSyncingEnabled])
  {
    -[FCPrivateDataController _markAsDirtyIfZonesChangedExternally]((uint64_t)self);
  }
}

- (BOOL)isSyncingEnabled
{
  return self->_syncingEnabled;
}

- (void)saveWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FCPrivateDataController *)self localStore];
  [v5 saveWithCompletionHandler:v4];
}

- (void)disableSyncing
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  if (self)
  {
    if (self->_preparedForUse && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v6 = (void *)[[NSString alloc] initWithFormat:@"migration actions should be called before -prepareForUse"];
      int v10 = 136315906;
      id v11 = "-[FCPrivateDataController(Setup) disableSyncing]";
      __int16 v12 = 2080;
      id v13 = "FCPrivateDataController.m";
      __int16 v14 = 1024;
      int v15 = 870;
      __int16 v16 = 2114;
      uint64_t v17 = v6;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
    }
    [(FCPrivateDataController *)self setSyncingEnabled:0];
    int v3 = [(FCPrivateDataController *)self localStore];
    [v3 removeObjectForKey:@"sync-state"];

    id v4 = [(FCPrivateDataController *)self localStore];
    [v4 setCloudBackupEnabled:1];

    commandQueue = self->_commandQueue;
  }
  else
  {
    [0 setSyncingEnabled:0];
    __int16 v8 = [0 localStore];
    [v8 removeObjectForKey:@"sync-state"];

    id v9 = [0 localStore];
    [v9 setCloudBackupEnabled:1];

    commandQueue = 0;
  }
  [(FCCommandQueue *)commandQueue clear];
  if ([(FCPrivateDataController *)self isSyncingEnabled])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v7 = (void *)[[NSString alloc] initWithFormat:@"syncing should be disabled"];
      int v10 = 136315906;
      id v11 = "-[FCPrivateDataController(Setup) disableSyncing]";
      __int16 v12 = 2080;
      id v13 = "FCPrivateDataController.m";
      __int16 v14 = 1024;
      int v15 = 877;
      __int16 v16 = 2114;
      uint64_t v17 = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
    }
  }
}

- (FCKeyValueStore)localStore
{
  return self->_localStore;
}

- (void)setSyncingEnabled:(BOOL)a3
{
  self->_syncingEnabled = a3;
}

uint64_t __58__FCPrivateDataController_performFirstSyncWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (FCCloudContext)context
{
  return self->_context;
}

+ (BOOL)isLocalStoreKeyInternal:(id)a3
{
  id v4 = a3;
  id v5 = [a1 internalLocalStoreKeys];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)internalLocalStoreKeys
{
  if (qword_1EB5D1218 != -1) {
    dispatch_once(&qword_1EB5D1218, &__block_literal_global_56_2);
  }
  v2 = (void *)_MergedGlobals_157;
  return v2;
}

- (void)addStateObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    if (self) {
      stateObservers = self->_stateObservers;
    }
    else {
      stateObservers = 0;
    }
    if ([(NSHashTable *)stateObservers containsObject:v4]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p is already an observer", v4);
      *(_DWORD *)buf = 136315906;
      int v10 = "-[FCPrivateDataController addStateObserver:]";
      __int16 v11 = 2080;
      __int16 v12 = "FCPrivateDataController.m";
      __int16 v13 = 1024;
      int v14 = 286;
      __int16 v15 = 2114;
      __int16 v16 = v8;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (self) {
        goto LABEL_7;
      }
    }
    else if (self)
    {
LABEL_7:
      char v6 = self->_stateObservers;
LABEL_8:
      [(NSHashTable *)v6 addObject:v4];
      goto LABEL_11;
    }
    char v6 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "stateObserver != nil");
    *(_DWORD *)buf = 136315906;
    int v10 = "-[FCPrivateDataController addStateObserver:]";
    __int16 v11 = 2080;
    __int16 v12 = "FCPrivateDataController.m";
    __int16 v13 = 1024;
    int v14 = 282;
    __int16 v15 = 2114;
    __int16 v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_11:
}

uint64_t __49__FCPrivateDataController_internalLocalStoreKeys__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"sync-state", @"sync-enabled", @"ubiquity-identity-token", @"change-token", @"last-sync-date", @"last-push-date", 0);
  uint64_t v1 = _MergedGlobals_157;
  _MergedGlobals_157 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)forceSyncWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__FCPrivateDataController_forceSyncWithCompletion___block_invoke;
  v6[3] = &unk_1E5B4CC80;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  FCPerformBlockOnMainThread(v6);
}

uint64_t __51__FCPrivateDataController_forceSyncWithCompletion___block_invoke(uint64_t a1)
{
  -[FCPrivateDataController _markAsDirtyAndNotifyObservers:](*(void *)(a1 + 32), 0);
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 syncWithCompletion:v3];
}

- (void)_markAsDirtyAndNotifyObservers:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "markAsDirty", (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    if (a2) {
      -[FCPrivateDataController _notifyObservers](a1);
    }
  }
}

- (void)markAsDirty
{
}

- (void)_notifyObservers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(a1 + 64);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "privateDataControllerDidBecomeDirty:", a1, (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (FCPrivateDataController)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCPrivateDataController;
  return [(FCPrivateDataController *)&v3 init];
}

- (void)dealloc
{
  id v2 = self;
  if (self) {
    self = (FCPrivateDataController *)self->_pushNotificationCenter;
  }
  -[FCPushNotificationCenter removeRecordZoneObserver:]((uint64_t)self, v2);
  v3.receiver = v2;
  v3.super_class = (Class)FCPrivateDataController;
  [(FCPrivateDataController *)&v3 dealloc];
}

void __57__FCPrivateDataController__syncWithCondition_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a2;
  uint64_t v4 = (void *)FCPrivateDataLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did enter sync queue", buf, 0xCu);
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__FCPrivateDataController__syncWithCondition_completion___block_invoke_25;
    v10[3] = &unk_1E5B50B98;
    v10[4] = v8;
    id v11 = *(id *)(a1 + 48);
    long long v12 = v3;
    -[FCPrivateDataController _serialSyncWithCompletion:](v8, v10);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, 1, 0);
    }
    v3[2](v3);
  }
}

void __57__FCPrivateDataController__syncWithCondition_completion___block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  [*(id *)(a1 + 32) handleSyncCompletion];
  if (([*(id *)(a1 + 32) isDirty] & 1) == 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = *(void **)(a1 + 32);
    if (v6) {
      uint64_t v6 = (void *)v6[8];
    }
    uint64_t v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v12, "privateDataControllerDidBecomeClean:", *(void *)(a1 + 32), (void)v14);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_serialSyncWithCompletion:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    uint64_t v4 = (void *)FCPrivateDataLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      uint64_t v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138543362;
      long long v14 = v7;
      _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch changes when command queue is empty", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke;
    v10[3] = &unk_1E5B50D18;
    v10[4] = a1;
    uint64_t v12 = v8;
    id v11 = v3;
    [v9 flushWithCompletionHandler:v10];
  }
}

uint64_t __46__FCPrivateDataController_syncWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) isDirty];
}

- (void)syncWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke;
  v10[3] = &unk_1E5B4EFB8;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  FCPerformBlockOnMainThread(v10);
}

void __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke_2;
  aBlock[3] = &unk_1E5B4C090;
  aBlock[4] = *(void *)(a1 + 32);
  id v2 = _Block_copy(aBlock);
  id v3 = *(id **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke_3;
  v4[3] = &unk_1E5B4EC68;
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  -[FCPrivateDataController _syncWithCondition:completion:](v3, v2, v4);
}

uint64_t __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) isDirty];
}

void __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke_4;
    block[3] = &unk_1E5B50BE8;
    id v10 = v6;
    uint64_t v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke_2;
  aBlock[3] = &unk_1E5B4C090;
  aBlock[4] = *(void *)(a1 + 32);
  id v2 = _Block_copy(aBlock);
  id v3 = *(id **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke_3;
  v4[3] = &unk_1E5B4EC68;
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  -[FCPrivateDataController _syncWithCondition:completion:](v3, v2, v4);
}

uint64_t __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDirty];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 isWaitingForFirstSync];
  }
  return result;
}

void __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke_4;
    block[3] = &unk_1E5B50BE8;
    id v10 = v6;
    uint64_t v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)removeStateObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    if (self) {
      stateObservers = self->_stateObservers;
    }
    else {
      stateObservers = 0;
    }
    [(NSHashTable *)stateObservers removeObject:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "stateObserver != nil");
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCPrivateDataController removeStateObserver:]";
    __int16 v9 = 2080;
    id v10 = "FCPrivateDataController.m";
    __int16 v11 = 1024;
    int v12 = 295;
    __int16 v13 = 2114;
    long long v14 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (BOOL)isBackedByAnyRecordZoneIDsInSet:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() backingRecordZoneIDs];
  id v6 = [v3 setWithArray:v5];

  LOBYTE(v5) = [v6 intersectsSet:v4];
  return (char)v5;
}

- (void)removeObserver:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    id v5 = [(FCPrivateDataController *)self observers];
    [v5 removeObject:v4];
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    id v7 = "-[FCPrivateDataController removeObserver:]";
    __int16 v8 = 2080;
    __int16 v9 = "FCPrivateDataController.m";
    __int16 v10 = 1024;
    int v11 = 325;
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
}

- (void)addCommandToCommandQueue:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if ((!self || !self->_commandQueue) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v10 = (void *)[[NSString alloc] initWithFormat:@"can't enqueue a command without a command queue"];
    int v11 = 136315906;
    __int16 v12 = "-[FCPrivateDataController addCommandToCommandQueue:]";
    __int16 v13 = 2080;
    uint64_t v14 = "FCPrivateDataController.m";
    __int16 v15 = 1024;
    int v16 = 336;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);
  }
  if ([(FCPrivateDataController *)self isSyncingEnabled])
  {
    id v5 = (void *)FCPrivateDataLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      __int16 v8 = (char *)objc_claimAutoreleasedReturnValue();
      int v11 = 138543362;
      __int16 v12 = v8;
      _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ adding command to command queue", (uint8_t *)&v11, 0xCu);
    }
    if (self)
    {
      ++self->_changeCount;
      commandQueue = self->_commandQueue;
    }
    else
    {
      commandQueue = 0;
    }
    [(FCCommandQueue *)commandQueue addCommand:v4];
  }
}

uint64_t __34__FCPrivateDataController_isDirty__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isDirty];
}

+ (BOOL)requiresPushNotificationSupport
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v8 = "+[FCPrivateDataController requiresPushNotificationSupport]";
    __int16 v9 = 2080;
    __int16 v10 = "FCPrivateDataController.m";
    __int16 v11 = 1024;
    int v12 = 370;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "+[FCPrivateDataController requiresPushNotificationSupport]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (BOOL)requiresBatchedSync
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v8 = "+[FCPrivateDataController requiresBatchedSync]";
    __int16 v9 = 2080;
    __int16 v10 = "FCPrivateDataController.m";
    __int16 v11 = 1024;
    int v12 = 375;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "+[FCPrivateDataController requiresBatchedSync]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (BOOL)requiresHighPriorityFirstSync
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v8 = "+[FCPrivateDataController requiresHighPriorityFirstSync]";
    __int16 v9 = 2080;
    __int16 v10 = "FCPrivateDataController.m";
    __int16 v11 = 1024;
    int v12 = 380;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "+[FCPrivateDataController requiresHighPriorityFirstSync]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (id)backingRecordZoneIDs
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v8 = "+[FCPrivateDataController backingRecordZoneIDs]";
    __int16 v9 = 2080;
    __int16 v10 = "FCPrivateDataController.m";
    __int16 v11 = 1024;
    int v12 = 385;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "+[FCPrivateDataController backingRecordZoneIDs]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (id)backingRecordIDs
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v8 = "+[FCPrivateDataController backingRecordIDs]";
    __int16 v9 = 2080;
    __int16 v10 = "FCPrivateDataController.m";
    __int16 v11 = 1024;
    int v12 = 390;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "+[FCPrivateDataController backingRecordIDs]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (id)localStoreFilename
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v8 = "+[FCPrivateDataController localStoreFilename]";
    __int16 v9 = 2080;
    __int16 v10 = "FCPrivateDataController.m";
    __int16 v11 = 1024;
    int v12 = 395;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "+[FCPrivateDataController localStoreFilename]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (unint64_t)localStoreVersion
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v8 = "+[FCPrivateDataController localStoreVersion]";
    __int16 v9 = 2080;
    __int16 v10 = "FCPrivateDataController.m";
    __int16 v11 = 1024;
    int v12 = 400;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "+[FCPrivateDataController localStoreVersion]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (id)commandStoreFileName
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v8 = "+[FCPrivateDataController commandStoreFileName]";
    __int16 v9 = 2080;
    __int16 v10 = "FCPrivateDataController.m";
    __int16 v11 = 1024;
    int v12 = 426;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "+[FCPrivateDataController commandStoreFileName]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (int64_t)commandQueueUrgency
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v8 = "+[FCPrivateDataController commandQueueUrgency]";
    __int16 v9 = 2080;
    __int16 v10 = "FCPrivateDataController.m";
    __int16 v11 = 1024;
    int v12 = 431;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "+[FCPrivateDataController commandQueueUrgency]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v13 = "+[FCPrivateDataController commandsToMergeLocalDataToCloud:privateDataDirectory:]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCPrivateDataController.m";
    __int16 v16 = 1024;
    int v17 = 436;
    __int16 v18 = 2114;
    uint64_t v19 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  __int16 v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  __int16 v10 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "+[FCPrivateDataController commandsToMergeLocalDataToCloud:privateDataDirectory:]"];
  id v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v13 = "-[FCPrivateDataController handleSyncWithChangedRecords:deletedRecordNames:]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCPrivateDataController.m";
    __int16 v16 = 1024;
    int v17 = 446;
    __int16 v18 = 2114;
    uint64_t v19 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  __int16 v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  __int16 v10 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCPrivateDataController handleSyncWithChangedRecords:deletedRecordNames:]"];
  id v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[FCPrivateDataController allKnownRecordNamesWithinRecordZoneWithID:]";
    __int16 v11 = 2080;
    int v12 = "FCPrivateDataController.m";
    __int16 v13 = 1024;
    int v14 = 451;
    __int16 v15 = 2114;
    __int16 v16 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCPrivateDataController allKnownRecordNamesWithinRecordZoneWithID:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)loadLocalCachesFromStore
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCPrivateDataController loadLocalCachesFromStore]";
    __int16 v9 = 2080;
    __int16 v10 = "FCPrivateDataController.m";
    __int16 v11 = 1024;
    int v12 = 456;
    __int16 v13 = 2114;
    int v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCPrivateDataController loadLocalCachesFromStore]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (id)desiredKeys
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "+[FCPrivateDataController desiredKeys]";
    __int16 v9 = 2080;
    __int16 v10 = "FCPrivateDataController.m";
    __int16 v11 = 1024;
    int v12 = 461;
    __int16 v13 = 2114;
    int v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "+[FCPrivateDataController desiredKeys]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return 0;
}

- (id)recordsForRestoringZoneName:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)canHelpPruneZoneName:(id)a3
{
  return 0;
}

- (id)pruneRecords:(id)a3 forZoneName:(id)a4
{
  id v4 = a3;
  return v4;
}

- (double)softMaxRecordAgeWhenMigratingZoneName:(id)a3
{
  return 0.0;
}

- (unint64_t)softMaxRecordCountWhenMigratingZoneName:(id)a3
{
  return 0;
}

- (void)zoneSyncManager:(id)a3 stateDidChange:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  v27 = self;
  id v8 = [(FCPrivateDataController *)self localStore];
  __int16 v9 = [v8 objectForKeyedSubscript:@"sync-state"];

  [MEMORY[0x1E4F1CA48] array];
  v29 = id v28 = v7;
  [v29 addObject:v7];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v26 = v9;
  __int16 v10 = [v9 zoneStates];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
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
        uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
        __int16 v16 = [v15 zoneName];
        if (v6) {
          uint64_t v17 = (void *)v6[2];
        }
        else {
          uint64_t v17 = 0;
        }
        id v18 = v17;
        uint64_t v19 = [v18 zoneName];
        char v20 = [v16 isEqualToString:v19];

        if ((v20 & 1) == 0) {
          [v29 addObject:v15];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v21 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v12 = v21;
    }
    while (v21);
  }

  if (v26)
  {
    id v22 = (id)[v26 copy];
    v23 = v27;
    v24 = v28;
  }
  else
  {
    v23 = v27;
    if (v27)
    {
      id v22 = objc_alloc_init(MEMORY[0x1E4F82B30]);
      [v22 setVersion:2];
    }
    else
    {
      id v22 = 0;
    }
    v24 = v28;
  }
  [v22 setZoneStates:v29];
  v25 = [(FCPrivateDataController *)v23 localStore];
  [v25 setObject:v22 forKeyedSubscript:@"sync-state"];
}

- (void)recordSyncManager:(id)a3 stateDidChange:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  long long v31 = self;
  id v8 = [(FCPrivateDataController *)self localStore];
  __int16 v9 = [v8 objectForKeyedSubscript:@"sync-state"];

  v37 = [MEMORY[0x1E4F1CA48] array];
  id v32 = v7;
  [v37 addObject:v7];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v30 = v9;
  id obj = [v9 recordStates];
  uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v39;
    uint64_t v33 = *(void *)v39;
    v34 = v6;
    do
    {
      uint64_t v13 = 0;
      uint64_t v35 = v11;
      do
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v38 + 1) + 8 * v13);
        uint64_t v15 = [v14 recordName];
        if (v6) {
          __int16 v16 = (void *)v6[1];
        }
        else {
          __int16 v16 = 0;
        }
        id v17 = v16;
        id v18 = [v17 recordName];
        if (([v15 isEqualToString:v18] & 1) == 0)
        {

LABEL_14:
          [v37 addObject:v14];
          goto LABEL_15;
        }
        uint64_t v19 = [v14 recordZoneName];
        if (v6) {
          char v20 = (void *)v6[1];
        }
        else {
          char v20 = 0;
        }
        id v21 = v20;
        id v22 = [v21 zoneID];
        v23 = [v22 zoneName];
        char v24 = [v19 isEqualToString:v23];

        uint64_t v12 = v33;
        id v6 = v34;
        uint64_t v11 = v35;
        if ((v24 & 1) == 0) {
          goto LABEL_14;
        }
LABEL_15:
        ++v13;
      }
      while (v11 != v13);
      uint64_t v25 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      uint64_t v11 = v25;
    }
    while (v25);
  }

  if (v30)
  {
    id v26 = (id)[v30 copy];
    id v28 = v31;
    v27 = v32;
  }
  else
  {
    id v28 = v31;
    if (v31)
    {
      id v26 = objc_alloc_init(MEMORY[0x1E4F82B30]);
      [v26 setVersion:2];
    }
    else
    {
      id v26 = 0;
    }
    v27 = v32;
  }
  [v26 setRecordStates:v37];
  uint64_t v29 = [(FCPrivateDataController *)v28 localStore];
  [v29 setObject:v26 forKeyedSubscript:@"sync-state"];
}

- (void)_markAsDirtyIfZonesChangedExternally
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B50] mainBundle];
    id v2 = [v1 bundleIdentifier];
    int v3 = [v2 isEqualToString:@"com.apple.news"];

    if (v3)
    {
      id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v5 = [(id)objc_opt_class() backingRecordZoneIDs];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v50 count:16];
      if (v6)
      {
        uint64_t v8 = v6;
        uint64_t v9 = *(void *)v38;
        *(void *)&long long v7 = 138544130;
        long long v31 = v7;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v38 != v9) {
              objc_enumerationMutation(v5);
            }
            uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            uint64_t v12 = objc_msgSend(v11, "zoneName", v31);
            uint64_t v13 = FCZoneLastModifiedExternallySharedPreferenceKey((uint64_t)v12);

            uint64_t v14 = NewsCoreUserDefaults();
            uint64_t v15 = [v14 objectForKey:v13];

            if (v15)
            {
              __int16 v16 = (void *)FCPrivateDataLog;
              if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
              {
                id v17 = v16;
                id v18 = (objc_class *)objc_opt_class();
                uint64_t v19 = NSStringFromClass(v18);
                char v20 = [v11 zoneName];
                *(_DWORD *)buf = v31;
                uint64_t v43 = v19;
                __int16 v44 = 2114;
                v45 = v20;
                __int16 v46 = 2114;
                v47 = v4;
                __int16 v48 = 2114;
                long long v49 = v15;
                _os_log_impl(&dword_1A460D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ externally modified at %{public}@ vs local %{public}@", buf, 0x2Au);
              }
              uint64_t v21 = [v4 laterDate:v15];

              id v4 = (void *)v21;
            }
          }
          uint64_t v8 = [v5 countByEnumeratingWithState:&v37 objects:v50 count:16];
        }
        while (v8);
      }

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v22 = *(id *)(a1 + 40);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        char v25 = 0;
        uint64_t v26 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v34 != v26) {
              objc_enumerationMutation(v22);
            }
            id v28 = *(void **)(*((void *)&v33 + 1) + 8 * j);
            uint64_t v29 = [v28 lastCleanDate];
            int v30 = objc_msgSend(v29, "fc_isEarlierThan:", v4);

            if (v30)
            {
              [v28 markAsDirty];
              char v25 = 1;
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v24);

        if (v25) {
          -[FCPrivateDataController _notifyObservers](a1);
        }
      }
      else
      {
      }
    }
  }
}

void __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  if (a2)
  {
    id v4 = (void *)FCPrivateDataLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      uint64_t v6 = (objc_class *)objc_opt_class();
      long long v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v7;
      _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ flushed command queue, fetching changes", buf, 0xCu);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_65;
    aBlock[3] = &unk_1E5B50CC8;
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    aBlock[4] = *(void *)(a1 + 32);
    v38[1] = v8;
    v38[0] = v9;
    uint64_t v10 = _Block_copy(aBlock);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v11 = *(void **)(a1 + 32);
    if (v11) {
      uint64_t v11 = (void *)v11[5];
    }
    uint64_t v12 = (id *)v38;
    uint64_t v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([v18 isDirty])
          {
            uint64_t v26 = [*(id *)(a1 + 32) context];
            v27 = [v26 internalPrivateDataContext];
            uint64_t v28 = *(void *)(a1 + 32);
            int v29 = [v18 isAwaitingFirstSync];
            if (v28)
            {
              if ((v29 & [(id)objc_opt_class() requiresHighPriorityFirstSync]) != 0) {
                uint64_t v30 = 25;
              }
              else {
                uint64_t v30 = 17;
              }
            }
            else
            {
              uint64_t v30 = 0;
            }
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_73;
            v31[3] = &unk_1E5B50CF0;
            v31[4] = v18;
            id v32 = v10;
            [v18 fetchChangesWithContext:v27 qualityOfService:v30 completionHandler:v31];

            goto LABEL_25;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    uint64_t v19 = (void *)FCPrivateDataLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      char v20 = v19;
      uint64_t v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v22;
      _os_log_impl(&dword_1A460D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ finished fetching changes", buf, 0xCu);
    }
    uint64_t v23 = *(void *)(a1 + 32);
    if (v23) {
      *(unsigned char *)(v23 + 8) = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_25:
  }
  else
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_2;
    v39[3] = &unk_1E5B50C58;
    char v25 = *(void **)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 48);
    v39[4] = *(void *)(a1 + 32);
    v40[1] = v24;
    uint64_t v12 = (id *)v40;
    v40[0] = v25;
    __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_2(v39);
  }
}

void __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 48);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (void *)FCPrivateDataLog;
  if (v3 == a1[6])
  {
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = v4;
      uint64_t v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      int v13 = 138543362;
      uint64_t v14 = v12;
      _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ sync failed because something went wrong when flushing the command queue", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v5 = a1[5];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_notAvailableError");
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, 2, v6);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v7 = v4;
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      int v13 = 138543362;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ something changed while flushing the command queue, trying again", (uint8_t *)&v13, 0xCu);

      uint64_t v2 = a1[4];
    }
    -[FCPrivateDataController _serialSyncWithCompletion:](v2, a1[5]);
  }
}

void __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_65(void *a1, void *a2, void *a3, void *a4, char a5, void *a6, void *a7)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void *)FCPrivateDataLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v18;
    char v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138543874;
    long long v40 = v21;
    __int16 v41 = 2048;
    uint64_t v42 = [v14 count];
    __int16 v43 = 2048;
    uint64_t v44 = [v15 count];
    _os_log_impl(&dword_1A460D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched changes with %lu changed records and %lu deleted records", buf, 0x20u);
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_66;
  v29[3] = &unk_1E5B50CA0;
  uint64_t v22 = a1[4];
  uint64_t v23 = (void *)a1[5];
  id v30 = v17;
  uint64_t v31 = v22;
  uint64_t v37 = a1[6];
  char v38 = a5;
  id v32 = v15;
  id v33 = v13;
  id v34 = v14;
  id v35 = v16;
  id v36 = v23;
  id v24 = v16;
  id v25 = v14;
  id v26 = v13;
  id v27 = v15;
  id v28 = v17;
  FCPerformBlockOnMainThread(v29);
}

uint64_t __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_66(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 80) + 16);
    return v2();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      uint64_t v5 = *(void *)(v4 + 48);
    }
    else {
      uint64_t v5 = 0;
    }
    if (v5 == *(void *)(a1 + 88))
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CA80];
      long long v7 = objc_msgSend(*(id *)(a1 + 48), "fc_arrayByTransformingWithBlock:", &__block_literal_global_71);
      uint64_t v8 = [v6 setWithArray:v7];

      if (*(unsigned char *)(a1 + 96))
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v9 = *(void **)(a1 + 40);
        id v10 = *(id *)(a1 + 56);
        if (v9)
        {
          objc_opt_class();
          if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
          {
            uint64_t v11 = (id *)v10;
            id v12 = v11[2];
            uint64_t v9 = [v9 allKnownRecordNamesWithinRecordZoneWithID:v12];
          }
          else
          {
            objc_opt_class();
            if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
            {
              id v13 = (id *)v10;
              id v14 = v13[1];
              id v15 = [v14 recordName];
              *(void *)buf = v15;
              uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                long long v40 = (void *)[[NSString alloc] initWithFormat:@"Case unsupported"];
                *(_DWORD *)buf = 136315906;
                *(void *)&uint8_t buf[4] = "-[FCPrivateDataController _allKnownRecordIDsForSyncManager:]";
                __int16 v53 = 2080;
                v54 = "FCPrivateDataController.m";
                __int16 v55 = 1024;
                int v56 = 823;
                __int16 v57 = 2114;
                __int16 v58 = v40;
                _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
              }
              id v13 = 0;
              uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
            }

            uint64_t v11 = 0;
          }
        }
        uint64_t v16 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v47 != v18) {
                objc_enumerationMutation(v9);
              }
              [v8 addObject:*(void *)(*((void *)&v46 + 1) + 8 * i)];
            }
            uint64_t v17 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
          }
          while (v17);
        }

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v20 = *(id *)(a1 + 64);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v43 != v23) {
                objc_enumerationMutation(v20);
              }
              id v25 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * j), "recordID", (void)v42);
              id v26 = [v25 recordName];
              [v8 removeObject:v26];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v22);
        }

        id v27 = (void *)FCPrivateDataLog;
        if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = v27;
          int v29 = (objc_class *)objc_opt_class();
          id v30 = NSStringFromClass(v29);
          uint64_t v31 = [v8 count];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v30;
          __int16 v53 = 2048;
          v54 = (char *)v31;
          _os_log_impl(&dword_1A460D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ needs to reset local data, so deleting %lu records", buf, 0x16u);
        }
      }
      id v32 = *(void **)(a1 + 40);
      uint64_t v33 = *(void *)(a1 + 64);
      id v34 = objc_msgSend(v8, "allObjects", (void)v42);
      [v32 handleSyncWithChangedRecords:v33 deletedRecordNames:v34];

      if (*(unsigned char *)(a1 + 96))
      {
        if (([*(id *)(a1 + 40) isWaitingForFirstSync] & 1) == 0)
        {
          id v35 = *(void **)(a1 + 40);
          if (v35)
          {
            id v36 = *(id *)(a1 + 56);
            objc_opt_class();
            if (v36)
            {
              if (objc_opt_isKindOfClass()) {
                uint64_t v37 = v36;
              }
              else {
                uint64_t v37 = 0;
              }
            }
            else
            {
              uint64_t v37 = 0;
            }
            char v38 = v37;

            if (v38)
            {
              id v39 = v38[2];
              [v35 handleSyncDidResetLocalDataForRecordZoneWithID:v39];
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              __int16 v41 = (void *)[[NSString alloc] initWithFormat:@"Case unsupported"];
              *(_DWORD *)buf = 136315906;
              *(void *)&uint8_t buf[4] = "-[FCPrivateDataController _handleSyncDidResetLocalDataForSyncManager:]";
              __int16 v53 = 2080;
              v54 = "FCPrivateDataController.m";
              __int16 v55 = 1024;
              int v56 = 837;
              __int16 v57 = 2114;
              __int16 v58 = v41;
              _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
            }
          }
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

      uint64_t v4 = *(void *)(a1 + 40);
    }
    return -[FCPrivateDataController _serialSyncWithCompletion:](v4, *(void *)(a1 + 80));
  }
}

uint64_t __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_2_68(uint64_t a1, void *a2)
{
  return [a2 recordName];
}

uint64_t __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_73(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40)
                                                                                                + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3, a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_stateObservers, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_syncManagers, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_storeDirectory, 0);
  objc_storeStrong((id *)&self->_pushNotificationCenter, 0);
}

- (void)enableSyncing
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  if (self && self->_preparedForUse && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"migration actions should be called before -prepareForUse"];
    int v6 = 136315906;
    long long v7 = "-[FCPrivateDataController(Setup) enableSyncing]";
    __int16 v8 = 2080;
    uint64_t v9 = "FCPrivateDataController.m";
    __int16 v10 = 1024;
    int v11 = 855;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);
  }
  [(FCPrivateDataController *)self setSyncingEnabled:1];
  uint64_t v3 = [(FCPrivateDataController *)self localStore];
  [v3 setCloudBackupEnabled:0];

  if (![(FCPrivateDataController *)self isSyncingEnabled]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@"syncing should be enabled"];
    int v6 = 136315906;
    long long v7 = "-[FCPrivateDataController(Setup) enableSyncing]";
    __int16 v8 = 2080;
    uint64_t v9 = "FCPrivateDataController.m";
    __int16 v10 = 1024;
    int v11 = 864;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);
  }
}

- (void)createLocalStore
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  if (self && self->_preparedForUse && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"migration actions should be called before -prepareForUse"];
    int v6 = 136315906;
    long long v7 = "-[FCPrivateDataController(Setup) createLocalStore]";
    __int16 v8 = 2080;
    uint64_t v9 = "FCPrivateDataController.m";
    __int16 v10 = 1024;
    int v11 = 883;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);
  }
  [(FCPrivateDataController *)self setSyncingEnabled:0];
  uint64_t v3 = [(FCPrivateDataController *)self localStore];
  [v3 setCloudBackupEnabled:1];

  if ([(FCPrivateDataController *)self isSyncingEnabled])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@"syncing should be disabled"];
      int v6 = 136315906;
      long long v7 = "-[FCPrivateDataController(Setup) createLocalStore]";
      __int16 v8 = 2080;
      uint64_t v9 = "FCPrivateDataController.m";
      __int16 v10 = 1024;
      int v11 = 888;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)mergeLocalStoreWithCloudWithPrivateDataDirectory:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self && self->_preparedForUse && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = (void *)[[NSString alloc] initWithFormat:@"migration actions should be called before -prepareForUse"];
    *(_DWORD *)buf = 136315906;
    id v26 = "-[FCPrivateDataController(Setup) mergeLocalStoreWithCloudWithPrivateDataDirectory:]";
    __int16 v27 = 2080;
    id v28 = "FCPrivateDataController.m";
    __int16 v29 = 1024;
    int v30 = 893;
    __int16 v31 = 2114;
    id v32 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v5 = objc_opt_class();
  int v6 = [(FCPrivateDataController *)self localStore];
  long long v7 = [v5 commandsToMergeLocalDataToCloud:v6 privateDataDirectory:v4];

  if (v7)
  {
    __int16 v8 = (void *)FCPrivateDataLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      __int16 v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      int v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v26 = v11;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ adding merge commands to command queue", buf, 0xCu);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          if (self) {
            commandQueue = self->_commandQueue;
          }
          else {
            commandQueue = 0;
          }
          -[FCCommandQueue addCommand:](commandQueue, "addCommand:", *(void *)(*((void *)&v20 + 1) + 8 * v16++), (void)v20);
        }
        while (v14 != v16);
        uint64_t v18 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        uint64_t v14 = v18;
      }
      while (v18);
    }
  }
}

uint64_t __47__FCPrivateDataController_Setup__prepareForUse__block_invoke(uint64_t a1, void *a2)
{
  return [a2 zoneName];
}

id __47__FCPrivateDataController_Setup__prepareForUse__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 recordName];
  id v6 = objc_alloc(MEMORY[0x1E4F1A320]);
  long long v7 = [v3 recordZoneName];

  __int16 v8 = (void *)[v6 initWithZoneName:v7 ownerName:*MEMORY[0x1E4F19C08]];
  uint64_t v9 = (void *)[v4 initWithRecordName:v5 zoneID:v8];

  return v9;
}

id *__47__FCPrivateDataController_Setup__prepareForUse__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [FCPrivateZoneSyncManager alloc];
  uint64_t v5 = [(id)objc_opt_class() desiredKeys];
  char v6 = [(id)objc_opt_class() requiresBatchedSync];
  long long v7 = *(void **)(a1 + 40);
  __int16 v8 = [v3 zoneName];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  __int16 v10 = -[FCPrivateZoneSyncManager initWithRecordZoneID:desiredKeys:requiresBatchedSync:currentState:]((id *)&v4->super.isa, v3, v5, v6, v9);

  if (v10) {
    objc_storeWeak(v10 + 3, *(id *)(a1 + 32));
  }
  return v10;
}

id *__47__FCPrivateDataController_Setup__prepareForUse__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [FCPrivateRecordSyncManager alloc];
  uint64_t v5 = [(id)objc_opt_class() desiredKeys];
  char v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
  long long v7 = -[FCPrivateRecordSyncManager initWithRecordID:desiredKeys:currentState:]((id *)&v4->super.isa, v3, v5, v6);

  if (v7) {
    objc_storeWeak(v7 + 2, *(id *)(a1 + 32));
  }
  return v7;
}

uint64_t __47__FCPrivateDataController_Setup__prepareForUse__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 isAwaitingFirstSync];
}

uint64_t __47__FCPrivateDataController_Setup__prepareForUse__block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) markAsDirty];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 notifyObservers];
}

- (void)_possiblySimulateCrashWithMessage:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (NFInternalBuild())
  {
    id v4 = NewsCoreUserDefaults();
    if ([v4 BOOLForKey:@"disable_simulated_crashes_for_encryption"])
    {
    }
    else
    {
      Class v5 = NSClassFromString(&cfstr_Xctest.isa);

      if (!v5)
      {
        char v6 = FCPrivateDataLog;
        if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_FAULT))
        {
          int v7 = 138543362;
          id v8 = v3;
          _os_log_fault_impl(&dword_1A460D000, v6, OS_LOG_TYPE_FAULT, "triggering simulated crash with message %{public}@", (uint8_t *)&v7, 0xCu);
        }
      }
    }
  }
}

- (id)jsonEncodableObject
{
  uint64_t v2 = [(FCPrivateDataController *)self localStore];
  id v3 = [v2 jsonEncodableObject];

  return v3;
}

@end