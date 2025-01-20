@interface SLDCloudKitSyncBase
- (BOOL)recordSupportsOurVersion:(id)a3;
- (SLDCloudKitSyncBase)initWithConfiguration:(id)a3;
- (double)currentTimestamp;
- (id)configuration;
- (id)container;
- (id)database;
- (id)idStringForType:(id)a3 uniqueData:(id)a4;
- (id)idStringForType:(id)a3 uniqueString:(id)a4;
- (id)persistence;
- (id)queue;
- (id)salt;
- (id)syncEngine;
- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4;
- (unint64_t)getIncrementedBatchNumber;
- (void)accountChangedNotification:(id)a3;
- (void)addMetadataToRecord:(id)a3;
- (void)checkForAccountChanges;
- (void)checkForAccountChangesNowWithCompletion:(id)a3;
- (void)createSyncEngine;
- (void)fetchContainerInformationWithCompletion:(id)a3;
- (void)getIncrementedBatchNumber;
- (void)handleMetadataSizeBecomingEligibleForSync;
- (void)reset;
- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4;
- (void)syncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecord:(id)a4;
- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4;
- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5;
@end

@implementation SLDCloudKitSyncBase

- (SLDCloudKitSyncBase)initWithConfiguration:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SLDCloudKitSyncBase;
  id v6 = [(SLDCloudKitSyncBase *)&v43 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v9 = dispatch_queue_create("SLDCloudKitSync", v8);
    v10 = (void *)*((void *)v6 + 5);
    *((void *)v6 + 5) = v9;

    *((_WORD *)v6 + 28) = 0;
    *((void *)v6 + 6) = 0;
    objc_storeStrong((id *)v6 + 3, a3);
    v11 = [SLDCloudKitSyncPersistence alloc];
    v12 = [v5 name];
    uint64_t v13 = [(SLDCloudKitSyncPersistence *)v11 initWithName:v12];
    v14 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v13;

    v15 = [v6 persistence];
    v16 = [v15 objectForKeyedSubscript:@"version"];

    if (v16)
    {
      uint64_t v17 = [v16 compare:&unk_1EEC280A0];
      if (v17 == -1)
      {
        v21 = SLDaemonLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = [v5 name];
          *(_DWORD *)buf = 138412802;
          v45 = v22;
          __int16 v46 = 2112;
          v47 = v16;
          __int16 v48 = 2112;
          v49 = &unk_1EEC280A0;
          _os_log_impl(&dword_19BE17000, v21, OS_LOG_TYPE_DEFAULT, "#SLDCK %@ previous version = %@, migrating to new version %@", buf, 0x20u);
        }
        if ([v16 compare:&unk_1EEC280B8] == -1)
        {
          v23 = SLDaemonLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = [v5 name];
            *(_DWORD *)buf = 138412290;
            v45 = v24;
            _os_log_impl(&dword_19BE17000, v23, OS_LOG_TYPE_DEFAULT, "#SLDCK %@ updating to production CK environment", buf, 0xCu);
          }
          v25 = [v6 persistence];
          [v25 reset];
        }
        if ([v16 compare:&unk_1EEC280A0] == -1)
        {
          v26 = SLDaemonLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = [v5 name];
            *(_DWORD *)buf = 138412290;
            v45 = v27;
            _os_log_impl(&dword_19BE17000, v26, OS_LOG_TYPE_DEFAULT, "#SLDCK %@ will sync fresh highlights for kPPSHVariantTVSync adoption", buf, 0xCu);
          }
          v28 = [v6 persistence];
          [v28 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"writerDone"];
        }
        v29 = [v6 persistence];
        [v29 setObject:&unk_1EEC280A0 forKeyedSubscript:@"version"];

        v30 = [v6 persistence];
        v18 = v30;
        v31 = (void *)MEMORY[0x1E4F1CC28];
        v32 = @"incompatibleVersion";
        goto LABEL_25;
      }
      if (v17 != 1)
      {
        if (v17)
        {
LABEL_27:
          v34 = objc_opt_new();
          v35 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.SocialLayer" environment:1];
          uint64_t v36 = [objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v35 options:v34];
          v37 = (void *)*((void *)v6 + 1);
          *((void *)v6 + 1) = v36;

          v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v38 addObserver:v6 selector:sel_accountChangedNotification_ name:*MEMORY[0x1E4F19BE0] object:0];

          v39 = *((void *)v6 + 5);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __45__SLDCloudKitSyncBase_initWithConfiguration___block_invoke;
          block[3] = &unk_1E58A8720;
          id v42 = v6;
          dispatch_sync(v39, block);

          goto LABEL_28;
        }
        v18 = SLDaemonLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[SLDCloudKitSyncBase initWithConfiguration:]();
        }
LABEL_26:

        goto LABEL_27;
      }
      v33 = SLDaemonLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        -[SLDCloudKitSyncBase initWithConfiguration:]();
      }

      v19 = [v6 persistence];
      [v19 reset];
    }
    else
    {
      v19 = SLDaemonLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [v5 name];
        *(_DWORD *)buf = 138412546;
        v45 = v20;
        __int16 v46 = 2112;
        v47 = &unk_1EEC280A0;
        _os_log_impl(&dword_19BE17000, v19, OS_LOG_TYPE_DEFAULT, "#SLDCK %@ no existing persistence, setting version to %@ for new persistence", buf, 0x16u);
      }
    }

    v30 = [v6 persistence];
    v18 = v30;
    v31 = &unk_1EEC280A0;
    v32 = @"version";
LABEL_25:
    [v30 setObject:v31 forKeyedSubscript:v32];
    goto LABEL_26;
  }
LABEL_28:

  return (SLDCloudKitSyncBase *)v6;
}

uint64_t __45__SLDCloudKitSyncBase_initWithConfiguration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) checkForAccountChanges];
  [*(id *)(a1 + 32) createSyncEngine];
  v2 = *(void **)(a1 + 32);
  return [v2 initializeState];
}

- (id)configuration
{
  return self->_configuration;
}

- (void)checkForAccountChanges
{
  v3 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v3);

  if (!self->_accountChangesCheckScheduled)
  {
    self->_accountChangesCheckScheduled = 1;
    objc_initWeak(&location, self);
    dispatch_time_t v4 = dispatch_time(0, 5000000000);
    id v5 = [(SLDCloudKitSyncBase *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__SLDCloudKitSyncBase_checkForAccountChanges__block_invoke;
    block[3] = &unk_1E58A8590;
    objc_copyWeak(&v7, &location);
    void block[4] = self;
    dispatch_after(v4, v5, block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __45__SLDCloudKitSyncBase_checkForAccountChanges__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[56] = 0;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __45__SLDCloudKitSyncBase_checkForAccountChanges__block_invoke_2;
    v4[3] = &unk_1E58A8720;
    v4[4] = *(void *)(a1 + 32);
    [WeakRetained checkForAccountChangesNowWithCompletion:v4];
  }
}

void __45__SLDCloudKitSyncBase_checkForAccountChanges__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v1);

  v2 = SLDaemonLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19BE17000, v2, OS_LOG_TYPE_DEFAULT, "#SLDCK Finished checking for account changes.", v3, 2u);
  }
}

- (void)fetchContainerInformationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = SLDaemonLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_DEFAULT, "#SLDCK Fetching container information", buf, 2u);
  }

  id v7 = self->_container;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke;
  v10[3] = &unk_1E58A9BF8;
  v11 = v7;
  id v12 = v4;
  v8 = v7;
  id v9 = v4;
  [(CKContainer *)v8 accountStatusWithCompletionHandler:v10];
}

void __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = SLDaemonLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:a2];
    *(_DWORD *)buf = 138412546;
    v16 = v7;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_DEFAULT, "#SLDCK Received accountStatus: %@, error: %@", buf, 0x16u);
  }
  if (v5)
  {
    v8 = SLDaemonLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke_cold_1();
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_12;
  }
  if (a2 != 1)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_12:
    v9();
    goto LABEL_13;
  }
  v10 = SLDaemonLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_DEFAULT, "#SLDCK Fetching userRecordID", buf, 2u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke_211;
  v12[3] = &unk_1E58A9BD0;
  v11 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = 1;
  [v11 fetchUserRecordIDWithCompletionHandler:v12];

LABEL_13:
}

void __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = SLDaemonLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_DEFAULT, "#SLDCK Received userRecordID: %@, error: %@", (uint8_t *)&v10, 0x16u);
  }

  if (v6)
  {
    v8 = SLDaemonLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke_211_cold_1();
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v9();
}

- (void)checkForAccountChangesNowWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = SLDaemonLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_DEFAULT, "#SLDCK Checking for account changed.", buf, 2u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke;
  v8[3] = &unk_1E58A9C48;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SLDCloudKitSyncBase *)self fetchContainerInformationWithCompletion:v8];
}

void __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = SLDaemonLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke_cold_1();
    }

    int v10 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke_214;
    block[3] = &unk_1E58A8BA0;
    id v18 = *(id *)(a1 + 40);
    dispatch_async(v10, block);

    id v11 = v18;
  }
  else
  {
    __int16 v12 = [*(id *)(a1 + 32) queue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke_2;
    v13[3] = &unk_1E58A9C20;
    v13[4] = *(void *)(a1 + 32);
    uint64_t v16 = a2;
    id v14 = v7;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(v12, v13);

    id v11 = v14;
  }
}

uint64_t __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke_214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) persistence];
  v3 = [v2 objectForKeyedSubscript:@"accountAvailable"];
  int v4 = [v3 BOOLValue];

  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = [*(id *)(a1 + 32) persistence];
  id v7 = [v6 objectForKeyedSubscript:@"accountLastKnownUserRecordID"];

  id v8 = [*(id *)(a1 + 40) recordName];
  id v9 = SLDaemonLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = @"NO";
    *(_DWORD *)v20 = 138413058;
    if (v4) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    *(void *)&v20[4] = v11;
    *(_WORD *)&v20[12] = 2112;
    if (v5 == 1) {
      int v10 = @"YES";
    }
    *(void *)&v20[14] = v10;
    __int16 v21 = 2112;
    v22 = v7;
    __int16 v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_19BE17000, v9, OS_LOG_TYPE_DEFAULT, "#SLDCK account status: availability %@ -> %@, user record id %@ -> %@", v20, 0x2Au);
  }

  if (!v4 || v5 == 1)
  {
    if (objc_msgSend(v7, "isEqualToString:", v8, *(_OWORD *)v20))
    {
      int v13 = 0;
      goto LABEL_19;
    }
    __int16 v12 = SLDaemonLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v20 = 138412546;
      *(void *)&v20[4] = v7;
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v8;
      _os_log_impl(&dword_19BE17000, v12, OS_LOG_TYPE_DEFAULT, "#SLDCK user record id changed (last known user record id: %@, new user record id: %@)", v20, 0x16u);
    }
    int v13 = v4;
  }
  else
  {
    __int16 v12 = SLDaemonLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v20 = 138412290;
      *(void *)&v20[4] = v7;
      _os_log_impl(&dword_19BE17000, v12, OS_LOG_TYPE_DEFAULT, "#SLDCK account no longer available (last known user record id: %@)", v20, 0xCu);
    }
    int v13 = 1;
  }

LABEL_19:
  id v14 = [*(id *)(a1 + 32) persistence];
  [v14 setObject:v8 forKeyedSubscript:@"accountLastKnownUserRecordID"];

  id v15 = [MEMORY[0x1E4F28ED0] numberWithBool:v5 == 1];
  uint64_t v16 = [*(id *)(a1 + 32) persistence];
  [v16 setObject:v15 forKeyedSubscript:@"accountAvailable"];

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "reset", *(void *)v20);
    __int16 v17 = [*(id *)(a1 + 32) persistence];
    [v17 setObject:v8 forKeyedSubscript:@"accountLastKnownUserRecordID"];

    id v18 = [MEMORY[0x1E4F28ED0] numberWithBool:v5 == 1];
    uint64_t v19 = [*(id *)(a1 + 32) persistence];
    [v19 setObject:v18 forKeyedSubscript:@"accountAvailable"];
  }
  else if (((v4 ^ (v5 == 1)) & 1) != 0 || ([v7 isEqualToString:v8] & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "accountStatusChanged", *(void *)v20);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)accountChangedNotification:(id)a3
{
  int v4 = [(SLDCloudKitSyncBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SLDCloudKitSyncBase_accountChangedNotification___block_invoke;
  block[3] = &unk_1E58A8720;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __50__SLDCloudKitSyncBase_accountChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkForAccountChanges];
}

- (BOOL)recordSupportsOurVersion:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"minVersion"];
  int v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 compare:&unk_1EEC280A0] != 1;
  }
  else
  {
    id v6 = SLDaemonLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SLDCloudKitSyncBase recordSupportsOurVersion:]();
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (void)createSyncEngine
{
  id v3 = objc_alloc(MEMORY[0x1E4F1A3E0]);
  int v4 = [(CKContainer *)self->_container privateCloudDatabase];
  BOOL v5 = [(SLDCloudKitSyncBase *)self persistence];
  id v6 = [v5 objectForKeyedSubscript:@"syncEngineMetadata"];
  id v9 = (id)[v3 initWithDatabase:v4 dataSource:self metadata:v6];

  [v9 setApsMachServiceName:@"com.apple.aps.sociallayerd"];
  id v7 = (CKSyncEngine *)[objc_alloc(MEMORY[0x1E4F1A3D8]) initWithConfiguration:v9];
  syncEngine = self->_syncEngine;
  self->_syncEngine = v7;
}

- (void)reset
{
  id v3 = [(SLDCloudKitSyncBase *)self persistence];
  [v3 reset];

  [(SLDCloudKitSyncBase *)self createSyncEngine];
  [(SLDCloudKitSyncBase *)self initializeState];
}

- (id)persistence
{
  return self->_persistence;
}

- (id)queue
{
  return self->_queue;
}

- (id)syncEngine
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  syncEngine = self->_syncEngine;
  return syncEngine;
}

- (id)container
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  container = self->_container;
  return container;
}

- (id)database
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  container = self->_container;
  return [(CKContainer *)container privateCloudDatabase];
}

- (id)salt
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(SLDCloudKitSyncBase *)self persistence];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"saltData"];
  id v5 = (id)v4;
  if (self->_saltLocked)
  {
    if (v4) {
      goto LABEL_3;
    }
    goto LABEL_12;
  }
  self->_saltLocked = 1;
  objc_initWeak(&location, self);
  queue = self->_queue;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  __int16 v17 = __27__SLDCloudKitSyncBase_salt__block_invoke;
  id v18 = &unk_1E58A85E0;
  objc_copyWeak(&v19, &location);
  dispatch_async(queue, &v15);
  if (v5)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    id v9 = objc_msgSend(v3, "objectForKeyedSubscript:", @"saltDataCreated", v15, v16, v17, v18);
    [v9 doubleValue];
    int v10 = objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");

    [v10 timeIntervalSinceNow];
    if (v11 > 0.0 || v11 < -2592000.0)
    {

      id v5 = 0;
    }
  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  if (!v5)
  {
LABEL_12:
    id v5 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
    arc4random_buf((void *)[v5 mutableBytes], 0x20uLL);
    [v3 setObject:v5 forKeyedSubscript:@"saltData"];
    __int16 v12 = (void *)MEMORY[0x1E4F28ED0];
    int v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceReferenceDate];
    id v14 = objc_msgSend(v12, "numberWithDouble:");
    [v3 setObject:v14 forKeyedSubscript:@"saltDataCreated"];
  }
LABEL_3:

  return v5;
}

void __27__SLDCloudKitSyncBase_salt__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[57] = 0;
  }
}

- (id)idStringForType:(id)a3 uniqueString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = (void *)MEMORY[0x19F3918C0]();
  id v9 = [v7 dataUsingEncoding:4];
  int v10 = [(SLDCloudKitSyncBase *)self idStringForType:v6 uniqueData:v9];

  return v10;
}

- (id)idStringForType:(id)a3 uniqueData:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = (void *)MEMORY[0x19F3918C0]();
  id v9 = [(SLDCloudKitSyncBase *)self salt];
  int v10 = v9;
  if (v7)
  {
    id v11 = v9;
    id v12 = v7;
    int v13 = (const void *)[v11 bytes];
    size_t v14 = [v11 length];
    id v15 = v12;
    uint64_t v16 = (const void *)[v15 bytes];
    size_t v17 = [v15 length];

    CCHmac(2u, v13, v14, v16, v17, macOut);
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:macOut length:32];
  }
  else
  {
    id v18 = 0;
  }

  id v19 = [v18 base64EncodedStringWithOptions:0];
  v20 = [v19 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

  uint64_t v21 = [v20 length];
  do
  {
    uint64_t v22 = v21;
    if (!v21) {
      break;
    }
    --v21;
  }
  while ([v20 characterAtIndex:v22 - 1] == 61);
  __int16 v23 = [v20 substringToIndex:v22];

  v27[0] = v6;
  v27[1] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  uint64_t v25 = [v24 componentsJoinedByString:@"!"];

  return v25;
}

- (double)currentTimestamp
{
  id v3 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v3);

  double result = self->_timestamp;
  if (result == 0.0)
  {
    id v5 = (void *)MEMORY[0x19F3918C0]();
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSinceReferenceDate];
    self->_timestamp = v7;

    objc_initWeak(&location, self);
    id v8 = [(SLDCloudKitSyncBase *)self queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__SLDCloudKitSyncBase_currentTimestamp__block_invoke;
    v9[3] = &unk_1E58A85E0;
    objc_copyWeak(&v10, &location);
    dispatch_async(v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    return self->_timestamp;
  }
  return result;
}

void __39__SLDCloudKitSyncBase_currentTimestamp__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[6] = 0;
  }
}

- (unint64_t)getIncrementedBatchNumber
{
  id v3 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SLDCloudKitSyncBase *)self persistence];
  id v5 = [v4 objectForKeyedSubscript:@"batchNumber"];

  if (v5) {
    unint64_t v6 = [v5 unsignedIntegerValue];
  }
  else {
    unint64_t v6 = 0;
  }
  double v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v6 + 1];
  id v8 = [(SLDCloudKitSyncBase *)self persistence];
  [v8 setObject:v7 forKeyedSubscript:@"batchNumber"];

  id v9 = SLDaemonLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SLDCloudKitSyncBase getIncrementedBatchNumber]();
  }

  return v6;
}

- (void)addMetadataToRecord:(id)a3
{
  id v4 = a3;
  [v4 setObject:&unk_1EEC280A0 forKeyedSubscript:@"version"];
  [v4 setObject:&unk_1EEC280D0 forKeyedSubscript:@"minVersion"];
  id v5 = (void *)MEMORY[0x1E4F28ED0];
  [(SLDCloudKitSyncBase *)self currentTimestamp];
  objc_msgSend(v5, "numberWithDouble:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKeyedSubscript:@"recordTimestamp"];
}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SLDCloudKitSyncBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SLDCloudKitSyncBase_syncEngine_didUpdateMetadata___block_invoke;
  block[3] = &unk_1E58A9C70;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __52__SLDCloudKitSyncBase_syncEngine_didUpdateMetadata___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) syncEngine];

  if (v2 == v3)
  {
    id v4 = [*(id *)(a1 + 40) persistence];
    id v5 = [v4 objectForKeyedSubscript:@"syncEngineMetadata"];
    unint64_t v6 = [v5 length];

    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [*(id *)(a1 + 40) persistence];
    [v8 setObject:v7 forKeyedSubscript:@"syncEngineMetadata"];

    id v9 = SLDaemonLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __52__SLDCloudKitSyncBase_syncEngine_didUpdateMetadata___block_invoke_cold_1();
    }

    if (v6 > 0x80000 && (unint64_t)[*(id *)(a1 + 48) length] <= 0x80000) {
      [*(id *)(a1 + 40) handleMetadataSizeBecomingEligibleForSync];
    }
  }
}

- (void)handleMetadataSizeBecomingEligibleForSync
{
  v2 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v2);
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v5 = a3;
  id result = a4;
  __break(1u);
  return result;
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __break(1u);
}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __break(1u);
}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __break(1u);
}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __break(1u);
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __break(1u);
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __break(1u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (void)initWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_17();
  v1 = [v0 name];
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_1(&dword_19BE17000, v2, v3, "#SLDCK %@ previous version = %@, no change", v4, v5, v6, v7, v8);
}

- (void)initWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_17();
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 name];
  OUTLINED_FUNCTION_5_2();
  __int16 v5 = v3;
  uint64_t v6 = &unk_1EEC280A0;
  _os_log_fault_impl(&dword_19BE17000, v0, OS_LOG_TYPE_FAULT, "#SLDCK %@ previous version = %@, downgrading to version %@", v4, 0x20u);
}

void __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "#SLDCK account status fetch error: %@", v2, v3, v4, v5, v6);
}

void __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke_211_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "#SLDCK user record id fetch error: %@", v2, v3, v4, v5, v6);
}

void __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "#SLDCK Failed to fetch container information: %@", v2, v3, v4, v5, v6);
}

- (void)recordSupportsOurVersion:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "#SLDCK record missing minVersion", v2, v3, v4, v5, v6);
}

- (void)getIncrementedBatchNumber
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "#SLDCK using batch number %tu", v2, v3, v4, v5, v6);
}

void __52__SLDCloudKitSyncBase_syncEngine_didUpdateMetadata___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_17();
  [(id)OUTLINED_FUNCTION_10(v0) length];
  OUTLINED_FUNCTION_1_1(&dword_19BE17000, v1, v2, "#SLDCK updating sync engine metadata (length: %tu --> %tu)", v3, v4, v5, v6, 0);
}

@end