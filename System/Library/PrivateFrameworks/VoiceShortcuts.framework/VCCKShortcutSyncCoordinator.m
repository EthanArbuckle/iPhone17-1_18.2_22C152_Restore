@interface VCCKShortcutSyncCoordinator
- (BOOL)isStarted;
- (BOOL)isSyncEnabled;
- (BOOL)isUsingToprakSyncEngine;
- (CKContainer)container;
- (CKRecordID)userRecordID;
- (NSString)accountForSyncToken;
- (OS_dispatch_queue)stateAccessQueue;
- (OS_nw_path_monitor)pathMonitor;
- (VCCKApplicationStateObserver)applicationObserver;
- (VCCKCoherenceSyncCoordinator)coherenceSyncCoordinator;
- (VCCKShortcutSyncCoordinator)initWithDatabaseProvider:(id)a3;
- (WFCloudKitSyncEventLogger)logger;
- (WFDatabaseProvider)databaseProvider;
- (WFShortcutsSyncService)currentSyncService;
- (__CTServerConnection)telephonyConnection;
- (int64_t)accountStatus;
- (void)dealloc;
- (void)deleteLegacyShortcutsZoneSubscriptionIfNeeded;
- (void)handleAccountChangedNotification:(id)a3;
- (void)handleCloudKitSyncEnabledChange;
- (void)handleCloudKitSyncZoneWasPurgedChange;
- (void)handleWalrusStatusDidChange;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAccountStatus:(int64_t)a3;
- (void)setCoherenceSyncCoordinator:(id)a3;
- (void)setCurrentSyncService:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setSyncEnabled:(BOOL)a3;
- (void)setUserRecordID:(id)a3;
- (void)setupPathMonitor;
- (void)start;
- (void)startObservingAccountChanges;
- (void)startObservingApplicationVisibility;
- (void)startObservingDataUsagePermission;
- (void)startObservingReachability;
- (void)startObservingUserDefaults;
- (void)stopObservingAccountChanges;
- (void)stopObservingApplicationVisibility;
- (void)stopObservingDataUsagePermission;
- (void)stopObservingReachability;
- (void)stopObservingUserDefaults;
- (void)updateAccountStatusAndUserRecordID;
- (void)updateCurrentSyncService;
@end

@implementation VCCKShortcutSyncCoordinator

void __65__VCCKShortcutSyncCoordinator_updateAccountStatusAndUserRecordID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5)
  {
    v8 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]_block_invoke";
      __int16 v28 = 2114;
      id v29 = v7;
      v9 = "%s Fatal error fetching account info: %{public}@";
      goto LABEL_7;
    }
LABEL_9:

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_10;
  }
  if (v6)
  {
    v8 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]_block_invoke";
      __int16 v28 = 2114;
      id v29 = v7;
      v9 = "%s Encountered error fetching account info, but we have an account info object, continuing: %{public}@";
LABEL_7:
      v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_8:
      _os_log_impl(&dword_1C7D7E000, v10, v11, v9, buf, v12);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  uint64_t v13 = [v5 accountStatus];
  v14 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v5;
    __int16 v30 = 2048;
    uint64_t v31 = v13;
    _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_INFO, "%s Successfully fetched iCloud account info: %@, status = %ld", buf, 0x20u);
  }

  v8 = getWFCloudKitSyncLogObject();
  BOOL v15 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v13 != 1)
  {
    if (!v15) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v27 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]_block_invoke";
    v9 = "%s Not fetching current user record ID because iCloud account is not available";
    v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_8;
  }
  if (v15)
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_INFO, "%s Fetching current user record ID", buf, 0xCu);
  }

  v16 = [*(id *)(a1 + 40) container];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__VCCKShortcutSyncCoordinator_updateAccountStatusAndUserRecordID__block_invoke_202;
  v21[3] = &unk_1E6541A38;
  id v17 = *(id *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 48);
  id v22 = v17;
  uint64_t v24 = v18;
  id v19 = v5;
  uint64_t v20 = *(void *)(a1 + 56);
  id v23 = v19;
  uint64_t v25 = v20;
  [v16 fetchUserRecordIDWithCompletionHandler:v21];

LABEL_10:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)VCCKShortcutSyncAccountObserverUserDefaultsChangedContext == a6)
  {
    uint64_t v13 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v24 = "-[VCCKShortcutSyncCoordinator observeValueForKeyPath:ofObject:change:context:]";
      __int16 v25 = 2114;
      id v26 = v10;
      __int16 v27 = 2114;
      id v28 = v12;
      _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_INFO, "%s Received user defaults update for keyPath %{public}@, change dictionary: %{public}@", buf, 0x20u);
    }

    v14 = [(VCCKShortcutSyncCoordinator *)self stateAccessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__VCCKShortcutSyncCoordinator_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E6541F68;
    id v21 = v10;
    id v22 = self;
    dispatch_async(v14, block);
  }
  else if ((void *)VCCKShortcutSyncAccountObserverApplicationVisibilityChangedContext == a6)
  {
    BOOL v15 = [(VCCKShortcutSyncCoordinator *)self applicationObserver];
    int v16 = [v15 isApplicationVisible];

    if (v16)
    {
      id v17 = [(VCCKShortcutSyncCoordinator *)self stateAccessQueue];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __78__VCCKShortcutSyncCoordinator_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v19[3] = &unk_1E65420F0;
      v19[4] = self;
      dispatch_async(v17, v19);
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)VCCKShortcutSyncCoordinator;
    [(VCCKShortcutSyncCoordinator *)&v18 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (VCCKApplicationStateObserver)applicationObserver
{
  return self->_applicationObserver;
}

uint64_t __78__VCCKShortcutSyncCoordinator_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) accountStatus];
  if (!result)
  {
    v3 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      id v5 = "-[VCCKShortcutSyncCoordinator observeValueForKeyPath:ofObject:change:context:]_block_invoke_2";
      _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_INFO, "%s Application moved into foreground, updating account status", (uint8_t *)&v4, 0xCu);
    }

    return [*(id *)(a1 + 32) updateAccountStatusAndUserRecordID];
  }
  return result;
}

- (void)updateAccountStatusAndUserRecordID
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [(VCCKShortcutSyncCoordinator *)self stateAccessQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s Updating iCloud account status", (uint8_t *)&buf, 0xCu);
  }

  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__6185;
  v42 = __Block_byref_object_dispose__6186;
  id v43 = 0;
  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__6185;
  v33 = __Block_byref_object_dispose__6186;
  id v34 = 0;
  uint64_t v6 = [(VCCKShortcutSyncCoordinator *)self container];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __65__VCCKShortcutSyncCoordinator_updateAccountStatusAndUserRecordID__block_invoke;
  uint64_t v24 = &unk_1E6541A60;
  v7 = v5;
  __int16 v25 = v7;
  id v26 = self;
  p_long long buf = &buf;
  id v28 = &v29;
  [v6 accountInfoWithCompletionHandler:&v21];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = [(VCCKShortcutSyncCoordinator *)self userRecordID];
  v9 = [v8 recordName];
  id v10 = [(id)v30[5] recordName];
  if ([v9 isEqual:v10])
  {
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CB18] syncShortcutsUserDefaults];
    uint64_t v12 = *MEMORY[0x1E4FB73D8];
    int v13 = [v11 BOOLForKey:*MEMORY[0x1E4FB73D8]];

    if (!v13) {
      goto LABEL_10;
    }
    v14 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v35 = 136315138;
      v36 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]";
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_INFO, "%s iCloud account changed, resetting flags for sync unavailable message", v35, 0xCu);
    }

    BOOL v15 = [MEMORY[0x1E4F1CB18] syncShortcutsUserDefaults];
    [v15 setBool:0 forKey:v12];

    int v16 = [MEMORY[0x1E4F1CB18] syncShortcutsUserDefaults];
    [v16 setBool:0 forKey:*MEMORY[0x1E4FB7488]];

    id v17 = [MEMORY[0x1E4F1CB18] syncShortcutsUserDefaults];
    [v17 setInteger:0 forKey:*MEMORY[0x1E4FB7478]];

    v8 = [MEMORY[0x1E4F1CB18] syncShortcutsUserDefaults];
    [v8 setValue:0 forKey:*MEMORY[0x1E4FB7480]];
  }

LABEL_10:
  -[VCCKShortcutSyncCoordinator setAccountStatus:](self, "setAccountStatus:", [*(id *)(*((void *)&buf + 1) + 40) accountStatus]);
  [(VCCKShortcutSyncCoordinator *)self setUserRecordID:v30[5]];
  uint64_t v18 = [*(id *)(*((void *)&buf + 1) + 40) walrusStatus];
  id v19 = getWFWalrusLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = CKStringFromWalrusStatus();
    *(_DWORD *)v35 = 136315394;
    v36 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]";
    __int16 v37 = 2112;
    v38 = v20;
    _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_INFO, "%s Got Walrus status from CloudKit: %@", v35, 0x16u);
  }
  [MEMORY[0x1E4FB7168] setWalrusEnabled:v18 == 1];
  [(VCCKShortcutSyncCoordinator *)self updateCurrentSyncService];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&buf, 8);
}

- (CKRecordID)userRecordID
{
  return self->_userRecordID;
}

- (void)updateCurrentSyncService
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v3 = [(VCCKShortcutSyncCoordinator *)self stateAccessQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s Trying to re-create a shortcut sync service.", buf, 0xCu);
  }

  dispatch_semaphore_t v5 = [(VCCKShortcutSyncCoordinator *)self databaseProvider];
  id v50 = 0;
  uint64_t v6 = [v5 databaseWithError:&v50];
  id v7 = v50;

  if (!v6)
  {
    v14 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
      __int16 v53 = 2114;
      *(void *)v54 = v7;
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_ERROR, "%s Database is not available, cannot create new sync service: %{public}@", buf, 0x16u);
    }

    goto LABEL_20;
  }
  if ([MEMORY[0x1E4FB7168] isSyncEnabled])
  {
    if ([(VCCKShortcutSyncCoordinator *)self accountStatus] == 1)
    {
      v8 = [(VCCKShortcutSyncCoordinator *)self accountForSyncToken];
      if (!v8)
      {
        uint64_t v20 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
          _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_INFO, "%s Account name for sync token is nil, not creating new sync service", buf, 0xCu);
        }

        currentSyncService = self->_currentSyncService;
        self->_currentSyncService = 0;
        goto LABEL_56;
      }
      currentSyncService = [v6 syncToken];
      id v10 = [currentSyncService account];
      id v11 = v8;
      uint64_t v12 = v11;
      if (v10 == v11)
      {

        id v21 = v12;
        id v22 = v12;
      }
      else
      {
        if (v10)
        {
          char v13 = [v10 isEqualToString:v11];

          if (v13)
          {
LABEL_31:
            if ([MEMORY[0x1E4FB7168] zoneWasPurged])
            {
              id v26 = getWFCloudKitSyncLogObject();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 136315138;
                v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
                _os_log_impl(&dword_1C7D7E000, v26, OS_LOG_TYPE_INFO, "%s 'Zone purged' flag is set, not creating new sync service until user confirms that it is okay to resume syncing", buf, 0xCu);
              }

              [v6 clearTombstonesAndSyncState];
              __int16 v27 = self->_currentSyncService;
              self->_currentSyncService = 0;
LABEL_55:

LABEL_56:
              goto LABEL_21;
            }
            if (self->_currentSyncService)
            {
              id v28 = [currentSyncService account];
              id v29 = v12;
              __int16 v30 = v29;
              if (v28 == v29)
              {

                goto LABEL_41;
              }
              if (v28)
              {
                int v31 = [v28 isEqualToString:v29];

                if (!v31) {
                  goto LABEL_44;
                }
LABEL_41:
                __int16 v27 = getWFCloudKitSyncLogObject();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 136315138;
                  v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
                  _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_INFO, "%s A sync service already exists and account has not changed, not creating new sync service", buf, 0xCu);
                }
                goto LABEL_55;
              }
            }
LABEL_44:
            uint64_t v32 = getWFCloudKitSyncLogObject();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 136315138;
              v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
              _os_log_impl(&dword_1C7D7E000, v32, OS_LOG_TYPE_INFO, "%s Shortcut sync is enabled and iCloud account information is available, creating new sync service", buf, 0xCu);
            }

            v33 = getWFCloudKitSyncLogObject();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              int v34 = [MEMORY[0x1E4F1CB18] databaseCoherenceEnabled];
              int v35 = [MEMORY[0x1E4F1CB18] shouldSyncCoherence];
              *(_DWORD *)long long buf = 136315650;
              v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
              __int16 v53 = 1024;
              *(_DWORD *)v54 = v34;
              *(_WORD *)&v54[4] = 1024;
              *(_DWORD *)&v54[6] = v35;
              _os_log_impl(&dword_1C7D7E000, v33, OS_LOG_TYPE_DEBUG, "%s Coherence feature flag enabled: %i, coherence sync enabled: %i", buf, 0x18u);
            }

            int v36 = _os_feature_enabled_impl();
            __int16 v37 = getWFCloudKitSyncLogObject();
            BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
            if (v36)
            {
              if (v38)
              {
                *(_DWORD *)long long buf = 136315138;
                v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
                _os_log_impl(&dword_1C7D7E000, v37, OS_LOG_TYPE_DEFAULT, "%s Shortcuts/toprak_syncengine feature flag enabled, using Toprak sync service", buf, 0xCu);
              }

              v39 = [WFShortcutsSyncEngine alloc];
              __int16 v27 = [(VCCKShortcutSyncCoordinator *)self container];
              uint64_t v40 = [(WFShortcutsSyncEngine *)v39 initWithDatabase:v6 container:v27];
              v41 = self->_currentSyncService;
              self->_currentSyncService = v40;
            }
            else
            {
              if (v38)
              {
                *(_DWORD *)long long buf = 136315138;
                v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
                _os_log_impl(&dword_1C7D7E000, v37, OS_LOG_TYPE_DEFAULT, "%s Shortcuts/toprak_syncengine feature flag disabled, using legacy sync service", buf, 0xCu);
              }

              v42 = [VCCKShortcutSyncService alloc];
              __int16 v27 = [(VCCKShortcutSyncCoordinator *)self container];
              id v43 = [(VCCKShortcutSyncCoordinator *)self applicationObserver];
              uint64_t v44 = [(VCCKShortcutSyncCoordinator *)self logger];
              v45 = [(VCCKShortcutSyncService *)v42 initWithContainer:v27 database:v6 applicationObserver:v43 automaticSyncEnabled:1 logger:v44];
              v46 = self->_currentSyncService;
              self->_currentSyncService = v45;
            }
            goto LABEL_55;
          }
        }
        else
        {
        }
        id v23 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = [currentSyncService account];
          *(_DWORD *)long long buf = 136315650;
          v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
          __int16 v53 = 2114;
          *(void *)v54 = v24;
          *(_WORD *)&v54[8] = 2114;
          v55 = v12;
          _os_log_impl(&dword_1C7D7E000, v23, OS_LOG_TYPE_INFO, "%s Database sync token account (%{public}@) is different from current account (%{public}@), clearing tombstones and invalidating persisted sync engine metadata", buf, 0x20u);
        }
        [MEMORY[0x1E4FB7168] setZoneWasPurged:0];
        __int16 v25 = objc_opt_new();
        [v25 setAccount:v12];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __55__VCCKShortcutSyncCoordinator_updateCurrentSyncService__block_invoke;
        v47[3] = &unk_1E6541A88;
        id v48 = v6;
        id v49 = v25;
        id v22 = v25;
        [v48 performTransactionWithReason:@"update sync service state" block:v47 error:0];

        id v21 = v48;
      }

      goto LABEL_31;
    }
    BOOL v15 = getWFCloudKitSyncLogObject();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    int64_t v19 = [(VCCKShortcutSyncCoordinator *)self accountStatus];
    *(_DWORD *)long long buf = 136315394;
    v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
    __int16 v53 = 2048;
    *(void *)v54 = v19;
    int v16 = "%s iCloud account status is %ld, clearing tombstones and not creating new sync service";
    id v17 = v15;
    uint32_t v18 = 22;
    goto LABEL_18;
  }
  BOOL v15 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
    int v16 = "%s Shortcut syncing disabled in preferences, clearing tombstones and not creating new sync service";
    id v17 = v15;
    uint32_t v18 = 12;
LABEL_18:
    _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
  }
LABEL_19:

  [v6 clearTombstonesAndSyncState];
LABEL_20:
  v8 = self->_currentSyncService;
  self->_currentSyncService = 0;
LABEL_21:
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (OS_dispatch_queue)stateAccessQueue
{
  return self->_stateAccessQueue;
}

- (void)setUserRecordID:(id)a3
{
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (CKContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coherenceSyncCoordinator, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_applicationObserver, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_stateAccessQueue, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_currentSyncService, 0);
}

- (void)setCoherenceSyncCoordinator:(id)a3
{
}

- (VCCKCoherenceSyncCoordinator)coherenceSyncCoordinator
{
  return self->_coherenceSyncCoordinator;
}

- (BOOL)isSyncEnabled
{
  return self->_syncEnabled;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (__CTServerConnection)telephonyConnection
{
  return self->_telephonyConnection;
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (void)setCurrentSyncService:(id)a3
{
}

- (void)handleAccountChangedNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v8 = "-[VCCKShortcutSyncCoordinator handleAccountChangedNotification:]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s Received CKAccountChangedNotification", buf, 0xCu);
  }

  dispatch_semaphore_t v5 = [(VCCKShortcutSyncCoordinator *)self stateAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VCCKShortcutSyncCoordinator_handleAccountChangedNotification___block_invoke;
  block[3] = &unk_1E65420F0;
  void block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __64__VCCKShortcutSyncCoordinator_handleAccountChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAccountStatusAndUserRecordID];
}

uint64_t __78__VCCKShortcutSyncCoordinator_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4FB73E8]])
  {
    v2 = *(void **)(a1 + 40);
    return [v2 handleCloudKitSyncEnabledChange];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4FB73F0]])
  {
    int v4 = *(void **)(a1 + 40);
    return [v4 handleCloudKitSyncZoneWasPurgedChange];
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4FB74A0]];
    if (result)
    {
      dispatch_semaphore_t v5 = *(void **)(a1 + 40);
      return [v5 handleWalrusStatusDidChange];
    }
  }
  return result;
}

- (WFCloudKitSyncEventLogger)logger
{
  if (!self->_logger
    && [MEMORY[0x1E4F1CB18] syncEventLoggingEnabled]
    && VCIsInternalBuild())
  {
    v3 = [MEMORY[0x1E4FB7158] createPersistedSyncEventLogger];
    logger = self->_logger;
    self->_logger = v3;
  }
  dispatch_semaphore_t v5 = self->_logger;
  return v5;
}

- (void)deleteLegacyShortcutsZoneSubscriptionIfNeeded
{
  v3 = [(VCCKShortcutSyncCoordinator *)self stateAccessQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  char v5 = [v4 BOOLForKey:@"LegacyShortcutsZoneSubscriptionUnsubscribed"];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(VCCKShortcutSyncCoordinator *)self container];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__VCCKShortcutSyncCoordinator_deleteLegacyShortcutsZoneSubscriptionIfNeeded__block_invoke;
    v7[3] = &unk_1E6541AD0;
    v7[4] = self;
    [v6 accountStatusWithCompletionHandler:v7];
  }
}

void __76__VCCKShortcutSyncCoordinator_deleteLegacyShortcutsZoneSubscriptionIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    block[7] = v2;
    block[8] = v3;
    char v5 = [*(id *)(a1 + 32) stateAccessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__VCCKShortcutSyncCoordinator_deleteLegacyShortcutsZoneSubscriptionIfNeeded__block_invoke_2;
    block[3] = &unk_1E65420F0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v5, block);
  }
}

void __76__VCCKShortcutSyncCoordinator_deleteLegacyShortcutsZoneSubscriptionIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) container];
  v1 = [v2 privateCloudDatabase];
  [v1 deleteSubscriptionWithID:@"ShortcutsZoneSubscription" completionHandler:&__block_literal_global_214];
}

void __76__VCCKShortcutSyncCoordinator_deleteLegacyShortcutsZoneSubscriptionIfNeeded__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3 && [a2 isEqualToString:@"ShortcutsZoneSubscription"])
  {
    id v3 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
    [v3 setBool:1 forKey:@"LegacyShortcutsZoneSubscriptionUnsubscribed"];
  }
}

uint64_t __55__VCCKShortcutSyncCoordinator_updateCurrentSyncService__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearTombstonesAndSyncState];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 setSyncToken:v3];
}

void __65__VCCKShortcutSyncCoordinator_updateAccountStatusAndUserRecordID__block_invoke_202(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = getWFCloudKitSyncLogObject();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_INFO, "%s Successfully fetched current user record ID: %@", (uint8_t *)&v11, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = v5;
    v8 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315394;
    uint64_t v12 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]_block_invoke";
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Error fetching current user record: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSString)accountForSyncToken
{
  uint64_t v3 = [(VCCKShortcutSyncCoordinator *)self userRecordID];
  if (v3)
  {
    int v4 = [(VCCKShortcutSyncCoordinator *)self container];
    id v5 = [v4 containerID];
    [v5 environment];
    id v6 = CKContainerEnvironmentString();

    id v7 = [MEMORY[0x1E4FB7170] accountForContainerEnvironmentString:v6 userRecordID:v3];
  }
  else
  {
    id v7 = 0;
  }

  return (NSString *)v7;
}

- (void)stopObservingDataUsagePermission
{
}

- (void)startObservingDataUsagePermission
{
  objc_initWeak(&location, self);
  uint64_t v5 = 0;
  _CTServerConnectionCopyCellularUsagePolicy();
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3032000000;
  v3[3] = __Block_byref_object_copy__6185;
  v3[4] = __Block_byref_object_dispose__6186;
  id v4 = 0;
  objc_copyWeak(&v2, &location);
  _CTServerConnectionRegisterBlockForNotification();
  objc_destroyWeak(&v2);
  _Block_object_dispose(v3, 8);

  objc_destroyWeak(&location);
}

void __64__VCCKShortcutSyncCoordinator_startObservingDataUsagePermission__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _CTServerConnectionCopyCellularUsagePolicy();
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToDictionary:0] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
    if (![WeakRetained accountStatus]) {
      [WeakRetained updateAccountStatusAndUserRecordID];
    }
    [*(id *)(*(void *)(a1 + 32) + 16) forceReceiveAndSendAllChangesWithCompletionHandler:&__block_literal_global_6199];
  }
}

- (void)stopObservingReachability
{
  id v2 = [(VCCKShortcutSyncCoordinator *)self pathMonitor];
  nw_path_monitor_cancel(v2);
}

- (void)startObservingReachability
{
  id v2 = [(VCCKShortcutSyncCoordinator *)self pathMonitor];
  nw_path_monitor_start(v2);
}

- (void)stopObservingAccountChanges
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F19BE0] object:0];
}

- (void)startObservingAccountChanges
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_handleAccountChangedNotification_ name:*MEMORY[0x1E4F19BE0] object:0];
}

- (void)stopObservingApplicationVisibility
{
  id v3 = [(VCCKShortcutSyncCoordinator *)self applicationObserver];
  [v3 removeObserver:self forKeyPath:@"applicationVisible" context:VCCKShortcutSyncAccountObserverApplicationVisibilityChangedContext];
}

- (void)startObservingApplicationVisibility
{
  id v3 = [(VCCKShortcutSyncCoordinator *)self applicationObserver];
  [v3 addObserver:self forKeyPath:@"applicationVisible" options:0 context:VCCKShortcutSyncAccountObserverApplicationVisibilityChangedContext];
}

- (void)stopObservingUserDefaults
{
  id v3 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  [v3 removeObserver:self forKeyPath:*MEMORY[0x1E4FB73E8] context:VCCKShortcutSyncAccountObserverUserDefaultsChangedContext];

  id v4 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  [v4 removeObserver:self forKeyPath:*MEMORY[0x1E4FB73F0] context:VCCKShortcutSyncAccountObserverUserDefaultsChangedContext];

  id v5 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  [v5 removeObserver:self forKeyPath:*MEMORY[0x1E4FB74A0] context:VCCKShortcutSyncAccountObserverUserDefaultsChangedContext];
}

- (void)startObservingUserDefaults
{
  objc_opt_class();
  id v3 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  [v3 addObserver:self forKeyPath:*MEMORY[0x1E4FB73E8] options:4 context:VCCKShortcutSyncAccountObserverUserDefaultsChangedContext];

  id v4 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  [v4 addObserver:self forKeyPath:*MEMORY[0x1E4FB73F0] options:0 context:VCCKShortcutSyncAccountObserverUserDefaultsChangedContext];

  id v5 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  [v5 addObserver:self forKeyPath:*MEMORY[0x1E4FB74A0] options:0 context:VCCKShortcutSyncAccountObserverUserDefaultsChangedContext];
}

- (void)setupPathMonitor
{
  objc_initWeak(&location, self);
  id v3 = [(VCCKShortcutSyncCoordinator *)self pathMonitor];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __47__VCCKShortcutSyncCoordinator_setupPathMonitor__block_invoke;
  uint64_t v9 = &unk_1E65419E8;
  objc_copyWeak(&v10, &location);
  nw_path_monitor_set_update_handler(v3, &v6);

  id v4 = [(VCCKShortcutSyncCoordinator *)self pathMonitor];
  id v5 = [(VCCKShortcutSyncCoordinator *)self stateAccessQueue];
  nw_path_monitor_set_queue(v4, v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __47__VCCKShortcutSyncCoordinator_setupPathMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = nw_path_get_status(v3);

  if ((v2 & 0xFFFFFFFD) == 1 && ![WeakRetained accountStatus]) {
    [WeakRetained updateAccountStatusAndUserRecordID];
  }
}

- (void)handleWalrusStatusDidChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)os_transaction_create();
  int v4 = [MEMORY[0x1E4FB7168] isWalrusEnabled];
  id v5 = getWFWalrusLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v12 = "-[VCCKShortcutSyncCoordinator handleWalrusStatusDidChange]";
    __int16 v13 = 1024;
    LODWORD(v14) = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Handling CloudKit Walrus status change, walrusEnabled = %d", buf, 0x12u);
  }

  uint64_t v6 = [(VCCKShortcutSyncCoordinator *)self databaseProvider];
  id v10 = 0;
  uint64_t v7 = [v6 databaseWithError:&v10];
  id v8 = v10;

  if (v7)
  {
    [v7 updateWalrusStatus];
  }
  else
  {
    uint64_t v9 = getWFWalrusLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v12 = "-[VCCKShortcutSyncCoordinator handleWalrusStatusDidChange]";
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_ERROR, "%s Walrus status did change, but we couldn't find a database to update: %@", buf, 0x16u);
    }
  }
}

- (void)handleCloudKitSyncZoneWasPurgedChange
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4FB7168] zoneWasPurged];
  int v4 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[VCCKShortcutSyncCoordinator handleCloudKitSyncZoneWasPurgedChange]";
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s Handling CloudKit sync zone purged flag change, zoneWasPurged = %d", (uint8_t *)&v5, 0x12u);
  }

  [(VCCKShortcutSyncCoordinator *)self updateCurrentSyncService];
}

- (void)handleCloudKitSyncEnabledChange
{
  uint64_t v3 = [MEMORY[0x1E4FB7168] isSyncEnabled];
  [(VCCKShortcutSyncCoordinator *)self setSyncEnabled:v3];
}

- (void)setSyncEnabled:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_syncEnabled != a3)
  {
    BOOL v3 = a3;
    self->_syncEnabled = a3;
    int v5 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      __int16 v7 = "-[VCCKShortcutSyncCoordinator setSyncEnabled:]";
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Handling CloudKit sync enabled setting change, syncEnabled = %d", (uint8_t *)&v6, 0x12u);
    }

    if (v3)
    {
      [(VCCKShortcutSyncCoordinator *)self startObservingAccountChanges];
      [(VCCKShortcutSyncCoordinator *)self startObservingReachability];
      [(VCCKShortcutSyncCoordinator *)self startObservingDataUsagePermission];
      [(VCCKShortcutSyncCoordinator *)self startObservingApplicationVisibility];
      [(VCCKShortcutSyncCoordinator *)self updateAccountStatusAndUserRecordID];
    }
    else
    {
      [(VCCKShortcutSyncCoordinator *)self stopObservingApplicationVisibility];
      [(VCCKShortcutSyncCoordinator *)self stopObservingDataUsagePermission];
      [(VCCKShortcutSyncCoordinator *)self stopObservingReachability];
      [(VCCKShortcutSyncCoordinator *)self stopObservingAccountChanges];
      [(VCCKShortcutSyncCoordinator *)self updateCurrentSyncService];
    }
  }
}

- (BOOL)isUsingToprakSyncEngine
{
  id v2 = [(VCCKShortcutSyncCoordinator *)self currentSyncService];
  if (v2)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (WFShortcutsSyncService)currentSyncService
{
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__6185;
  int v11 = __Block_byref_object_dispose__6186;
  id v12 = 0;
  BOOL v3 = [(VCCKShortcutSyncCoordinator *)self stateAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__VCCKShortcutSyncCoordinator_currentSyncService__block_invoke;
  v6[3] = &unk_1E6542078;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (WFShortcutsSyncService *)v4;
}

void __49__VCCKShortcutSyncCoordinator_currentSyncService__block_invoke(uint64_t a1)
{
}

- (void)start
{
  BOOL v3 = [(VCCKShortcutSyncCoordinator *)self stateAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__VCCKShortcutSyncCoordinator_start__block_invoke;
  block[3] = &unk_1E65420F0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __36__VCCKShortcutSyncCoordinator_start__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isStarted] & 1) == 0)
  {
    [*(id *)(a1 + 32) setStarted:1];
    id v2 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      int v5 = "-[VCCKShortcutSyncCoordinator start]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_INFO, "%s Starting VCCKShortcutSyncCoordinator", (uint8_t *)&v4, 0xCu);
    }

    [*(id *)(a1 + 32) startObservingUserDefaults];
    [*(id *)(a1 + 32) deleteLegacyShortcutsZoneSubscriptionIfNeeded];
    if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
    {
      BOOL v3 = [*(id *)(a1 + 32) coherenceSyncCoordinator];
      [v3 start];
    }
  }
}

- (void)dealloc
{
  BOOL v3 = [(VCCKShortcutSyncCoordinator *)self stateAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__VCCKShortcutSyncCoordinator_dealloc__block_invoke;
  block[3] = &unk_1E65420F0;
  void block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)VCCKShortcutSyncCoordinator;
  [(VCCKShortcutSyncCoordinator *)&v4 dealloc];
}

void __38__VCCKShortcutSyncCoordinator_dealloc__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isStarted])
  {
    [*(id *)(a1 + 32) stopObservingUserDefaults];
    [*(id *)(a1 + 32) stopObservingApplicationVisibility];
    [*(id *)(a1 + 32) stopObservingDataUsagePermission];
    [*(id *)(a1 + 32) stopObservingAccountChanges];
    [*(id *)(a1 + 32) stopObservingReachability];
    uint64_t v2 = *(void *)(a1 + 32);
    BOOL v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;

    objc_super v4 = *(const void **)(*(void *)(a1 + 32) + 72);
    CFRelease(v4);
  }
}

- (VCCKShortcutSyncCoordinator)initWithDatabaseProvider:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"VCCKShortcutSyncCoordinator.m", 61, @"Invalid parameter not satisfying: %@", @"databaseProvider" object file lineNumber description];
  }
  v29.receiver = self;
  v29.super_class = (Class)VCCKShortcutSyncCoordinator;
  uint64_t v7 = [(VCCKShortcutSyncCoordinator *)&v29 init];
  __int16 v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_databaseProvider, a3);
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F19EC8], "wf_shortcutsContainer");
    container = v8->_container;
    v8->_container = (CKContainer *)v9;

    int v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.VoiceShortcuts.VCCKShortcutSyncCoordinator.stateAccessQueue", v12);
    stateAccessQueue = v8->_stateAccessQueue;
    v8->_stateAccessQueue = (OS_dispatch_queue *)v13;

    nw_path_monitor_t v15 = nw_path_monitor_create();
    pathMonitor = v8->_pathMonitor;
    v8->_pathMonitor = (OS_nw_path_monitor *)v15;

    MainBundle = CFBundleGetMainBundle();
    CFBundleGetIdentifier(MainBundle);
    v8->_telephonyConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
    uint32_t v18 = [VCCKApplicationStateObserver alloc];
    uint64_t v19 = [(VCCKApplicationStateObserver *)v18 initWithBundleIdentifier:*MEMORY[0x1E4FB4BE8]];
    applicationObserver = v8->_applicationObserver;
    v8->_applicationObserver = (VCCKApplicationStateObserver *)v19;

    id v21 = [VCCKCoherenceSyncCoordinator alloc];
    id v22 = [(VCCKShortcutSyncCoordinator *)v8 container];
    id v23 = [(VCCKShortcutSyncCoordinator *)v8 applicationObserver];
    uint64_t v24 = [(VCCKCoherenceSyncCoordinator *)v21 initWithContainer:v22 applicationObserver:v23];
    coherenceSyncCoordinator = v8->_coherenceSyncCoordinator;
    v8->_coherenceSyncCoordinator = (VCCKCoherenceSyncCoordinator *)v24;

    [(VCCKShortcutSyncCoordinator *)v8 setupPathMonitor];
    id v26 = v8;
  }

  return v8;
}

@end