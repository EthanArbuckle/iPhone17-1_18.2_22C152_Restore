@interface VoicemailCompanionReplication
- (BOOL)_considerMigrationSync;
- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5;
- (BOOL)sigtermCalled;
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (NSCondition)isSyncingCondition;
- (NSCondition)voicemailsLoadedCondition;
- (OS_os_transaction)syncTransaction;
- (SYService)vmSyncService;
- (VoicemailCompanionReplication)init;
- (_TtC12TelephonyRPC25FTMSVoicemailManager_ObjC)voicemailManager;
- (id)changeSetForRemoteVoicemails:(id)a3 fromVMVoicemails:(id)a4;
- (id)listOfVoicemailsToSync;
- (id)remoteVoicemails;
- (id)voicemailChangeSetFrom:(id)a3;
- (int64_t)indexOfVoicemail:(id)a3 inArray:(id)a4;
- (void)_deltaSyncIsReunion:(BOOL)a3;
- (void)_enqueueChangesForDeltaSync;
- (void)_enqueueChangesForResetSync;
- (void)_handleVoicemailsChangedNotification:(id)a3;
- (void)_initializeDomainAccessor;
- (void)_performAfterFirstDeviceUnlockAndSyncRestrictionNone:(id)a3;
- (void)_registerForNotifications;
- (void)_retrySyncSession:(id)a3;
- (void)dealloc;
- (void)handleSIGTERM;
- (void)remoteVoicemails;
- (void)removeFromRemoteVoicemails:(id)a3;
- (void)reportProgress:(double)a3;
- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5;
- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5;
- (void)serviceDidPairDevice:(id)a3;
- (void)setIsSyncingCondition:(id)a3;
- (void)setRemoteVoicemails:(id)a3;
- (void)setSigtermCalled:(BOOL)a3;
- (void)setSyncTransaction:(id)a3;
- (void)setVmSyncService:(id)a3;
- (void)setVoicemailManager:(id)a3;
- (void)setVoicemailsLoadedCondition:(id)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
@end

@implementation VoicemailCompanionReplication

- (VoicemailCompanionReplication)init
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v50 = "-[VoicemailCompanionReplication init]";
    _os_log_impl(&dword_234652000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v48.receiver = self;
  v48.super_class = (Class)VoicemailCompanionReplication;
  v4 = [(VoicemailCompanionReplication *)&v48 init];
  if (v4)
  {
    uint64_t v5 = +[FTMSVoicemailManager_ObjC shared];
    voicemailManager = v4->_voicemailManager;
    v4->_voicemailManager = (_TtC12TelephonyRPC25FTMSVoicemailManager_ObjC *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mobilephone.VoicemailCompanionReplication.concurent", MEMORY[0x263EF83A8]);
    concurrentQueue = v4->_concurrentQueue;
    v4->_concurrentQueue = (OS_dispatch_queue *)v7;

    v9 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    voicemailsLoadedCondition = v4->_voicemailsLoadedCondition;
    v4->_voicemailsLoadedCondition = v9;

    v11 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    isSyncingCondition = v4->_isSyncingCondition;
    v4->_isSyncingCondition = v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.mobilephone.VoicemailCompanionReplication.vmSyncServiceQueue", 0);
    vmSyncServiceQueue = v4->_vmSyncServiceQueue;
    v4->_vmSyncServiceQueue = (OS_dispatch_queue *)v13;

    v15 = objc_alloc_init(NPHVMSyncSessionManager);
    vmSyncSessionManager = v4->_vmSyncSessionManager;
    v4->_vmSyncSessionManager = v15;

    [(NPHVMSyncSessionManager *)v4->_vmSyncSessionManager setVmSessionDelegate:v4];
    uint64_t v17 = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.mobilephone"];
    domainAccessor = v4->_domainAccessor;
    v4->_domainAccessor = (NPSDomainAccessor *)v17;

    pthread_mutex_init(&v4->_domainAccessorMutexLock, 0);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.mobilephone.VoicemailCompanionReplication.companionSync", 0);
    companionSyncQueue = v4->_companionSyncQueue;
    v4->_companionSyncQueue = (OS_dispatch_queue *)v19;

    v4->_didSuspendCompanionSyncQueue = 0;
    uint64_t v21 = [MEMORY[0x263F5BB20] syncCoordinatorWithServiceName:@"com.apple.pairedsync.nanophone"];
    coordinator = v4->_coordinator;
    v4->_coordinator = (PSYSyncCoordinator *)v21;

    [(PSYSyncCoordinator *)v4->_coordinator setDelegate:v4];
    id v23 = objc_alloc(MEMORY[0x263F33280]);
    v24 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", MEMORY[0x263EFFA88], *MEMORY[0x263F49F90], 0);
    uint64_t v25 = [v23 initWithService:@"com.apple.private.alloy.voicemailsync" priority:0 asMasterStore:1 options:v24];
    vmSyncService = v4->_vmSyncService;
    v4->_vmSyncService = (SYService *)v25;

    uint64_t v27 = [(PSYSyncCoordinator *)v4->_coordinator syncRestriction];
    char v28 = 0;
    if (v27 == 1)
    {
      dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
      waitForFirstSyncRestrictionSemaphore = v4->waitForFirstSyncRestrictionSemaphore;
      v4->waitForFirstSyncRestrictionSemaphore = (OS_dispatch_semaphore *)v29;

      char v28 = 1;
    }
    v4->_BOOL syncRestrictionsAtStartup = v28;
    v31 = nph_general_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      BOOL syncRestrictionsAtStartup = v4->_syncRestrictionsAtStartup;
      *(_DWORD *)buf = 67109120;
      LODWORD(v50) = syncRestrictionsAtStartup;
      _os_log_impl(&dword_234652000, v31, OS_LOG_TYPE_DEFAULT, "_syncRestrictionsAtStartup: %d", buf, 8u);
    }

    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __37__VoicemailCompanionReplication_init__block_invoke;
    v46[3] = &unk_264BF5EF0;
    v33 = v4;
    v47 = v33;
    [(VoicemailCompanionReplication *)v33 _performAfterFirstDeviceUnlockAndSyncRestrictionNone:v46];
    [(VoicemailCompanionReplication *)v33 _registerForNotifications];
    uint64_t v34 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v35 = *MEMORY[0x263F576B8];
    v36 = [MEMORY[0x263F08A48] currentQueue];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __37__VoicemailCompanionReplication_init__block_invoke_34;
    v44[3] = &unk_264BF5F18;
    v37 = v33;
    v45 = v37;
    id v38 = (id)[(id)v34 addObserverForName:v35 object:0 queue:v36 usingBlock:v44];

    [(SYService *)v4->_vmSyncService setDelegate:v37 queue:v4->_vmSyncServiceQueue];
    v39 = v4->_vmSyncService;
    id v43 = 0;
    LOBYTE(v34) = [(SYService *)v39 resume:&v43];
    id v40 = v43;
    if ((v34 & 1) == 0)
    {
      v41 = nph_general_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "-[VoicemailCompanionReplication init]";
        __int16 v51 = 2112;
        id v52 = v40;
        _os_log_impl(&dword_234652000, v41, OS_LOG_TYPE_DEFAULT, "%s - Error resuming _vmSyncService:%@", buf, 0x16u);
      }
    }
  }
  return v4;
}

uint64_t __37__VoicemailCompanionReplication_init__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = objc_msgSend(MEMORY[0x263F089F8], "FTMSVoicemailManager_ObjCVoicemailsChangedNotification");
  [v2 addObserver:v3 selector:sel__handleVoicemailsChangedNotification_ name:v4 object:0];

  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 168))
  {
    uint64_t result = [(id)result _considerMigrationSync];
    if ((result & 1) == 0)
    {
      v6 = nph_general_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315138;
        v8 = "-[VoicemailCompanionReplication init]_block_invoke";
        _os_log_impl(&dword_234652000, v6, OS_LOG_TYPE_DEFAULT, "%s - calling [self _deltaSyncIsReunion:NO]", (uint8_t *)&v7, 0xCu);
      }

      return [*(id *)(a1 + 32) _deltaSyncIsReunion:0];
    }
  }
  return result;
}

uint64_t __37__VoicemailCompanionReplication_init__block_invoke_34(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  v4 = (pthread_mutex_t *)(*(void *)(a1 + 32) + 16);
  return pthread_mutex_unlock(v4);
}

- (BOOL)_considerMigrationSync
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
  v4 = [(NPSDomainAccessor *)self->_domainAccessor objectForKey:@"NPHVoicemailCompanionReplicationCurrentMigrationVersionKey"];
  uint64_t v5 = [v4 integerValue];

  v6 = nph_general_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    uint64_t v9 = "-[VoicemailCompanionReplication _considerMigrationSync]";
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = 1;
    _os_log_impl(&dword_234652000, v6, OS_LOG_TYPE_DEFAULT, "%s: currentMigrationVersion: %ld requiredMigrationVersion: %ld", (uint8_t *)&v8, 0x20u);
  }

  if (v5 <= 0) {
    [(SYService *)self->_vmSyncService setNeedsResetSync];
  }
  return v5 < 1;
}

- (void)_registerForNotifications
{
  objc_initWeak(&location, self);
  uint64_t v2 = MEMORY[0x263EF83A0];
  id v3 = MEMORY[0x263EF83A0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__VoicemailCompanionReplication__registerForNotifications__block_invoke;
  v4[3] = &unk_264BF5F40;
  objc_copyWeak(&v5, &location);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v2, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __58__VoicemailCompanionReplication__registerForNotifications__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86C8]));
  v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    __int16 v10 = v3;
    _os_log_impl(&dword_234652000, v4, OS_LOG_TYPE_DEFAULT, "Beginning XPC transaction for com.apple.notifyd.matching notification named %@", (uint8_t *)&v9, 0xCu);
  }

  id v5 = (void *)os_transaction_create();
  if ([v3 isEqualToString:@"com.apple.nanophone.vm.fullsync"])
  {
    v6 = nph_general_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_234652000, v6, OS_LOG_TYPE_DEFAULT, "com.apple.nanophone.vm.fullsync notification, setNeedsFullSync", (uint8_t *)&v9, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v8 = [WeakRetained vmSyncService];
    [v8 setNeedsResetSync];
  }
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_storeStrong((id *)&self->_vmServiceSyncSession, a4);
  if ([v6 syncSessionType])
  {
    if ([v6 syncSessionType] == 1)
    {
      int v7 = nph_general_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        __int16 v10 = "-[VoicemailCompanionReplication syncCoordinator:beginSyncSession:]";
        _os_log_impl(&dword_234652000, v7, OS_LOG_TYPE_DEFAULT, "%s - calling [self _deltaSyncIsReunion:YES]", (uint8_t *)&v9, 0xCu);
      }

      [(VoicemailCompanionReplication *)self _deltaSyncIsReunion:1];
    }
  }
  else
  {
    int v8 = nph_general_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      __int16 v10 = "-[VoicemailCompanionReplication syncCoordinator:beginSyncSession:]";
      _os_log_impl(&dword_234652000, v8, OS_LOG_TYPE_DEFAULT, "%s, setNeedsFullSync", (uint8_t *)&v9, 0xCu);
    }

    [(SYService *)self->_vmSyncService setNeedsResetSync];
  }
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    vmServiceSyncSession = self->_vmServiceSyncSession;
    int v7 = 136315650;
    int v8 = "-[VoicemailCompanionReplication syncCoordinator:didInvalidateSyncSession:]";
    __int16 v9 = 2112;
    id v10 = v5;
    __int16 v11 = 2112;
    __int16 v12 = vmServiceSyncSession;
    _os_log_impl(&dword_234652000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s - session:%@ _vmServiceSyncSession:%@", (uint8_t *)&v7, 0x20u);
  }
  [(NPHVMSyncSessionManager *)self->_vmSyncSessionManager setSessionInvalidated:1];
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[VoicemailCompanionReplication syncCoordinatorDidChangeSyncRestriction:]";
    __int16 v9 = 2048;
    uint64_t v10 = [v4 syncRestriction];
    _os_log_impl(&dword_234652000, v5, OS_LOG_TYPE_DEFAULT, "%s %lu", (uint8_t *)&v7, 0x16u);
  }

  if (self->waitForFirstSyncRestrictionSemaphore)
  {
    coordinator = self->_coordinator;
    if (coordinator)
    {
      if (![(PSYSyncCoordinator *)coordinator syncRestriction]) {
        dispatch_semaphore_signal((dispatch_semaphore_t)self->waitForFirstSyncRestrictionSemaphore);
      }
    }
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  coordinator = self->_coordinator;
  self->_coordinator = 0;

  v5.receiver = self;
  v5.super_class = (Class)VoicemailCompanionReplication;
  [(VoicemailCompanionReplication *)&v5 dealloc];
}

- (void)_initializeDomainAccessor
{
  p_domainAccessorMutexLock = &self->_domainAccessorMutexLock;
  pthread_mutex_lock(&self->_domainAccessorMutexLock);
  if (!self->_domainAccessor)
  {
    id v4 = (NPSDomainAccessor *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.mobilephone"];
    domainAccessor = self->_domainAccessor;
    self->_domainAccessor = v4;
  }
  pthread_mutex_unlock(p_domainAccessorMutexLock);
}

- (void)handleSIGTERM
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v8 = "-[VoicemailCompanionReplication handleSIGTERM]";
    _os_log_impl(&dword_234652000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(NSCondition *)self->_isSyncingCondition lock];
  self->_sigtermCalled = 1;
  [(NPHVMSyncSessionManager *)self->_vmSyncSessionManager cancel];
  while (self->_syncTransaction)
  {
    id v4 = nph_general_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v8 = "-[VoicemailCompanionReplication handleSIGTERM]";
      _os_log_impl(&dword_234652000, v4, OS_LOG_TYPE_DEFAULT, "%s - sync in progress; waiting for it to cancel out",
        buf,
        0xCu);
    }

    [(NSCondition *)self->_isSyncingCondition wait];
  }
  objc_super v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v8 = "-[VoicemailCompanionReplication handleSIGTERM]";
    _os_log_impl(&dword_234652000, v5, OS_LOG_TYPE_DEFAULT, "%s - sync no longer in progress; exiting", buf, 0xCu);
  }

  id v6 = nph_general_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v8 = "-[VoicemailCompanionReplication handleSIGTERM]";
    _os_log_impl(&dword_234652000, v6, OS_LOG_TYPE_DEFAULT, "%s - done waiting", buf, 0xCu);
  }
}

- (void)setSyncTransaction:(id)a3
{
  id v5 = a3;
  [(NSCondition *)self->_isSyncingCondition lock];
  objc_storeStrong((id *)&self->_syncTransaction, a3);
  if (!self->_syncTransaction) {
    [(NSCondition *)self->_isSyncingCondition broadcast];
  }
  [(NSCondition *)self->_isSyncingCondition unlock];
}

- (void)_deltaSyncIsReunion:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v10 = "-[VoicemailCompanionReplication _deltaSyncIsReunion:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_234652000, v5, OS_LOG_TYPE_DEFAULT, "%s: %d", buf, 0x12u);
  }

  companionSyncQueue = self->_companionSyncQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__VoicemailCompanionReplication__deltaSyncIsReunion___block_invoke;
  v7[3] = &unk_264BF5F68;
  v7[4] = self;
  BOOL v8 = v3;
  dispatch_async(companionSyncQueue, v7);
}

void __53__VoicemailCompanionReplication__deltaSyncIsReunion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8)) {
    goto LABEL_15;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v2 + 16));
  uint64_t v3 = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.mobilephone"];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v3;

  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
LABEL_15:
    if (!*(unsigned char *)(v2 + 169))
    {
      id v6 = [(id)v2 listOfVoicemailsToSync];
      int v7 = [*(id *)(a1 + 32) voicemailChangeSetFrom:v6];
      BOOL v8 = v7;
      if (*(unsigned char *)(a1 + 40)) {
        goto LABEL_9;
      }
      uint64_t v9 = [v7 added];
      uint64_t v10 = [v9 count];
      __int16 v11 = [v8 updated];
      uint64_t v12 = [v11 count] + v10;
      uint64_t v13 = [v8 deleted];
      uint64_t v14 = [v13 count];

      if (v12 + v14)
      {
LABEL_9:
        v16 = (void *)os_transaction_create();
        [*(id *)(a1 + 32) setSyncTransaction:v16];

        uint64_t v17 = nph_general_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_234652000, v17, OS_LOG_TYPE_DEFAULT, "about to call setHasChangesAvailable", (uint8_t *)&v18, 2u);
        }

        [*(id *)(*(void *)(a1 + 32) + 176) setHasChangesAvailable];
      }
      else
      {
        v15 = nph_general_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315138;
          dispatch_queue_t v19 = "-[VoicemailCompanionReplication _deltaSyncIsReunion:]_block_invoke";
          _os_log_impl(&dword_234652000, v15, OS_LOG_TYPE_DEFAULT, "%s: no changes, bailing", (uint8_t *)&v18, 0xCu);
        }
      }
    }
  }
}

- (void)_enqueueChangesForDeltaSync
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(VoicemailCompanionReplication *)self listOfVoicemailsToSync];
  uint64_t v4 = (NSMutableArray *)[v3 mutableCopy];
  vmAfterSyncComplete = self->_vmAfterSyncComplete;
  self->_vmAfterSyncComplete = v4;

  id v6 = [(VoicemailCompanionReplication *)self voicemailChangeSetFrom:v3];
  int v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [(VoicemailCompanionReplication *)self remoteVoicemails];
    *(_DWORD *)buf = 138412290;
    dispatch_semaphore_t v29 = v8;
    _os_log_impl(&dword_234652000, v7, OS_LOG_TYPE_DEFAULT, "VM are currently on remote: %@", buf, 0xCu);
  }
  uint64_t v9 = nph_general_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    dispatch_semaphore_t v29 = v3;
    _os_log_impl(&dword_234652000, v9, OS_LOG_TYPE_DEFAULT, "VM that we want to end up with on remote: %@", buf, 0xCu);
  }

  uint64_t v10 = [v6 added];
  __int16 v11 = [v6 updated];
  uint64_t v12 = [v6 deleted];
  uint64_t v13 = [v10 count];
  uint64_t v14 = [v11 count];
  if (v14 + v13 + [v12 count])
  {
    v15 = nph_general_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_semaphore_t v29 = v10;
      _os_log_impl(&dword_234652000, v15, OS_LOG_TYPE_DEFAULT, "changeSet added: %@", buf, 0xCu);
    }

    v16 = nph_general_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_semaphore_t v29 = v11;
      _os_log_impl(&dword_234652000, v16, OS_LOG_TYPE_DEFAULT, "changeSet updated: %@", buf, 0xCu);
    }

    uint64_t v17 = nph_general_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_semaphore_t v29 = v12;
      _os_log_impl(&dword_234652000, v17, OS_LOG_TYPE_DEFAULT, "changeSet deleted: %@", buf, 0xCu);
    }

    if ([v10 count])
    {
      vmSyncSessionManager = self->_vmSyncSessionManager;
      dispatch_queue_t v19 = [v10 allObjects];
      [(NPHVMSyncSessionManager *)vmSyncSessionManager enqueueVoicemailChanges:v19 changeType:1];
    }
    if ([v11 count])
    {
      uint64_t v20 = self->_vmSyncSessionManager;
      uint64_t v21 = [v11 allObjects];
      [(NPHVMSyncSessionManager *)v20 enqueueVoicemailChanges:v21 changeType:2];
    }
    if ([v12 count])
    {
      v22 = self->_vmSyncSessionManager;
      id v23 = [v12 allObjects];
      [(NPHVMSyncSessionManager *)v22 enqueueVoicemailChanges:v23 changeType:3];
    }
    vmServiceSyncSession = self->_vmServiceSyncSession;
    if (vmServiceSyncSession && [(PSYServiceSyncSession *)vmServiceSyncSession syncSessionType] == 1)
    {
      objc_initWeak((id *)buf, self);
      uint64_t v25 = self->_vmSyncSessionManager;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __60__VoicemailCompanionReplication__enqueueChangesForDeltaSync__block_invoke;
      v26[3] = &unk_264BF5F90;
      objc_copyWeak(&v27, (id *)buf);
      [(NPHVMSyncSessionManager *)v25 setVmSessionProgressCallback:v26];
      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(NPHVMSyncSessionManager *)self->_vmSyncSessionManager setVmSessionProgressCallback:0];
    }
    self->_deltaSyncSuccessful = 1;
  }
}

void __60__VoicemailCompanionReplication__enqueueChangesForDeltaSync__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained reportProgress:a2];
    id WeakRetained = v4;
  }
}

- (void)_enqueueChangesForResetSync
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_queue_t v19 = "-[VoicemailCompanionReplication _enqueueChangesForResetSync]";
    _os_log_impl(&dword_234652000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  companionSyncQueue = self->_companionSyncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__VoicemailCompanionReplication__enqueueChangesForResetSync__block_invoke;
  block[3] = &unk_264BF5FB8;
  objc_copyWeak(&v16, &location);
  dispatch_sync(companionSyncQueue, block);
  id v5 = [(VoicemailCompanionReplication *)self listOfVoicemailsToSync];
  id v6 = (NSMutableArray *)[v5 mutableCopy];
  vmAfterSyncComplete = self->_vmAfterSyncComplete;
  self->_vmAfterSyncComplete = v6;

  BOOL v8 = nph_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = self->_vmAfterSyncComplete;
    if (v9)
    {
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_vmAfterSyncComplete, "count"));
      uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v10 = 0;
    }
    *(_DWORD *)buf = 138412290;
    dispatch_queue_t v19 = v10;
    _os_log_impl(&dword_234652000, v8, OS_LOG_TYPE_DEFAULT, "sVMServiceClient told us that there are %@ voicemails", buf, 0xCu);
    if (v9) {
  }
    }
  [(NPHVMSyncSessionManager *)self->_vmSyncSessionManager enqueueVoicemailChanges:self->_vmAfterSyncComplete changeType:1];
  vmSyncSessionManager = self->_vmSyncSessionManager;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__VoicemailCompanionReplication__enqueueChangesForResetSync__block_invoke_47;
  v13[3] = &unk_264BF5F90;
  objc_copyWeak(&v14, &location);
  [(NPHVMSyncSessionManager *)vmSyncSessionManager setVmSessionProgressCallback:v13];
  uint64_t v12 = (void *)os_transaction_create();
  [(VoicemailCompanionReplication *)self setSyncTransaction:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __60__VoicemailCompanionReplication__enqueueChangesForResetSync__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *((unsigned char *)WeakRetained + 152) = 1;
  dispatch_suspend(*((dispatch_object_t *)WeakRetained + 10));
}

void __60__VoicemailCompanionReplication__enqueueChangesForResetSync__block_invoke_47(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained reportProgress:a2];
    id WeakRetained = v4;
  }
}

- (void)reportProgress:(double)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[VoicemailCompanionReplication reportProgress:]";
    __int16 v8 = 2048;
    double v9 = a3;
    _os_log_impl(&dword_234652000, v5, OS_LOG_TYPE_DEFAULT, "%s progress:%f", (uint8_t *)&v6, 0x16u);
  }

  [(PSYServiceSyncSession *)self->_vmServiceSyncSession reportProgress:a3];
}

- (void)_retrySyncSession:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VoicemailCompanionReplication _retrySyncSession:]";
    _os_log_impl(&dword_234652000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  int v6 = [v4 isResetSync];
  int v7 = [v4 wasCancelled];
  if (v6)
  {
    if (v7) {
      int64_t v8 = 0;
    }
    else {
      int64_t v8 = 3600000000000;
    }
    double v9 = nph_general_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[VoicemailCompanionReplication _retrySyncSession:]";
      __int16 v16 = 2048;
      int64_t v17 = v8;
      _os_log_impl(&dword_234652000, v9, OS_LOG_TYPE_DEFAULT, "%s setNeedsResetSync after:%lld ", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    dispatch_time_t v10 = dispatch_time(0, v8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__VoicemailCompanionReplication__retrySyncSession___block_invoke;
    block[3] = &unk_264BF5FB8;
    objc_copyWeak(&v13, (id *)buf);
    dispatch_after(v10, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else if (v7)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__VoicemailCompanionReplication__retrySyncSession___block_invoke_48;
    v11[3] = &unk_264BF5EF0;
    v11[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
}

void __51__VoicemailCompanionReplication__retrySyncSession___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained remoteVoicemails];
  uint64_t v4 = [v3 count];

  id v5 = nph_general_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v8 = 136315394;
      double v9 = "-[VoicemailCompanionReplication _retrySyncSession:]_block_invoke";
      __int16 v10 = 2048;
      uint64_t v11 = v4;
      _os_log_impl(&dword_234652000, v5, OS_LOG_TYPE_DEFAULT, "%s setNeedsResetSync trigger canceled. Remote Voicemail count: %lu", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    if (v6)
    {
      int v8 = 136315138;
      double v9 = "-[VoicemailCompanionReplication _retrySyncSession:]_block_invoke";
      _os_log_impl(&dword_234652000, v5, OS_LOG_TYPE_DEFAULT, "%s setNeedsResetSync triggered", (uint8_t *)&v8, 0xCu);
    }

    id v5 = objc_loadWeakRetained(v1);
    int v7 = [v5 vmSyncService];
    [v7 setNeedsResetSync];
  }
}

uint64_t __51__VoicemailCompanionReplication__retrySyncSession___block_invoke_48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deltaSyncIsReunion:0];
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = nph_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136315394;
    id v27 = "-[VoicemailCompanionReplication syncSession:didEndWithError:]";
    __int16 v28 = 2112;
    *(void *)dispatch_semaphore_t v29 = v7;
    _os_log_impl(&dword_234652000, v8, OS_LOG_TYPE_DEFAULT, "%s - error:%@", (uint8_t *)&v26, 0x16u);
  }

  if ([v6 isResetSync])
  {
    if (v7)
    {
      double v9 = (NSMutableArray *)objc_opt_new();
      vmAfterSyncComplete = self->_vmAfterSyncComplete;
      self->_vmAfterSyncComplete = v9;

      [(PSYServiceSyncSession *)self->_vmServiceSyncSession syncDidFailWithError:v7];
    }
    else
    {
      [(PSYServiceSyncSession *)self->_vmServiceSyncSession syncDidCompleteSending];
    }
    [(VoicemailCompanionReplication *)self _initializeDomainAccessor];
    [(VoicemailCompanionReplication *)self setRemoteVoicemails:self->_vmAfterSyncComplete];
    [(NPSDomainAccessor *)self->_domainAccessor setObject:&unk_26E76AAD8 forKey:@"NPHVoicemailCompanionReplicationCurrentMigrationVersionKey"];
    id v16 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
    int64_t v17 = nph_general_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315394;
      id v27 = "-[VoicemailCompanionReplication syncSession:didEndWithError:]";
      __int16 v28 = 2048;
      *(void *)dispatch_semaphore_t v29 = 1;
      _os_log_impl(&dword_234652000, v17, OS_LOG_TYPE_DEFAULT, "%s: set currentMigrationVersion: %ld", (uint8_t *)&v26, 0x16u);
    }

    [(VoicemailCompanionReplication *)self setSyncTransaction:0];
    if (self->_didSuspendCompanionSyncQueue)
    {
      self->_didSuspendCompanionSyncQueue = 0;
      dispatch_resume((dispatch_object_t)self->_companionSyncQueue);
    }
    [(PSYServiceSyncSession *)self->_vmServiceSyncSession syncDidComplete];
  }
  else
  {
    uint64_t v11 = [(PSYSyncCoordinator *)self->_coordinator activeSyncSession];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      id v13 = [(PSYSyncCoordinator *)self->_coordinator activeSyncSession];
      uint64_t v14 = [v13 syncSessionType];

      if (v14 == 1)
      {
        v15 = nph_general_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 136315138;
          id v27 = "-[VoicemailCompanionReplication syncSession:didEndWithError:]";
          _os_log_impl(&dword_234652000, v15, OS_LOG_TYPE_DEFAULT, "%s - syncDidComplete", (uint8_t *)&v26, 0xCu);
        }

        [(PSYServiceSyncSession *)self->_vmServiceSyncSession syncDidCompleteSending];
        [(PSYServiceSyncSession *)self->_vmServiceSyncSession syncDidComplete];
      }
    }
    self->_deltaSyncSuccessful = v7 == 0;
    if ([v6 isSending])
    {
      if (self->_deltaSyncSuccessful)
      {
        [(VoicemailCompanionReplication *)self setRemoteVoicemails:self->_vmAfterSyncComplete];
      }
      else
      {
        uint64_t v18 = (NSMutableArray *)objc_opt_new();
        dispatch_queue_t v19 = self->_vmAfterSyncComplete;
        self->_vmAfterSyncComplete = v18;
      }
      [(VoicemailCompanionReplication *)self setSyncTransaction:0];
    }
  }
  vmServiceSyncSession = self->_vmServiceSyncSession;
  self->_vmServiceSyncSession = 0;

  uint64_t v21 = nph_general_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = [v6 isSending];
    int v23 = [v6 wasCancelled];
    int v24 = [v6 isResetSync];
    int v26 = 136315906;
    id v27 = "-[VoicemailCompanionReplication syncSession:didEndWithError:]";
    __int16 v28 = 1024;
    *(_DWORD *)dispatch_semaphore_t v29 = v22;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = v23;
    __int16 v30 = 1024;
    int v31 = v24;
    _os_log_impl(&dword_234652000, v21, OS_LOG_TYPE_DEFAULT, "%s - session isSending:%d wasCanceled:%d isResetSync:%d", (uint8_t *)&v26, 0x1Eu);
  }

  if ([v6 isSending])
  {
    int v25 = [v6 wasCancelled];
    if (v7 || v25) {
      [(VoicemailCompanionReplication *)self _retrySyncSession:v6];
    }
  }
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v24 = (void (**)(id, uint64_t, void))a5;
  double v9 = nph_general_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[VoicemailCompanionReplication syncSession:applyChanges:completion:]";
    _os_log_impl(&dword_234652000, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(char **)(*((void *)&v27 + 1) + 8 * i);
        v15 = nph_general_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v14;
          _os_log_impl(&dword_234652000, v15, OS_LOG_TYPE_DEFAULT, "change: %@", buf, 0xCu);
        }

        id v16 = nph_general_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [v14 changeType];
          *(_DWORD *)buf = 134217984;
          v33 = (const char *)v17;
          _os_log_impl(&dword_234652000, v16, OS_LOG_TYPE_DEFAULT, "changeType: %ld", buf, 0xCu);
        }

        uint64_t v18 = [v7 serializer];
        dispatch_queue_t v19 = [v18 dataFromChange:v14];

        uint64_t v20 = [[NanoPhoneVoicemailMeta alloc] initWithData:v19];
        uint64_t v21 = nph_general_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v33 = (const char *)v20;
          _os_log_impl(&dword_234652000, v21, OS_LOG_TYPE_DEFAULT, "vmMeta: %@", buf, 0xCu);
        }

        uint64_t v22 = [v14 changeType];
        switch(v22)
        {
          case 3:
            [(VoicemailCompanionReplication *)self removeFromRemoteVoicemails:v20];
            [(FTMSVoicemailManager_ObjC *)self->_voicemailManager trashVoicemail:v20];
            break;
          case 2:
            if ([(NanoPhoneVoicemailMeta *)v20 flags]) {
              [(FTMSVoicemailManager_ObjC *)self->_voicemailManager markVoicemailAsRead:v20];
            }
            break;
          case 1:
            int v23 = nph_general_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v33 = "-[VoicemailCompanionReplication syncSession:applyChanges:completion:]";
              _os_log_impl(&dword_234652000, v23, OS_LOG_TYPE_DEFAULT, "%s - did not expect gizmo to be adding a voicemail!", buf, 0xCu);
            }

            break;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  v24[2](v24, 1, 0);
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[VoicemailCompanionReplication syncSession:resetDataStoreWithError:]";
    _os_log_impl(&dword_234652000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (id)changeSetForRemoteVoicemails:(id)a3 fromVMVoicemails:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    id v5 = (id)objc_opt_new();
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x263F33278]) initWithChangesBetween:v5 and:v6];
  uint64_t v8 = nph_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = [v7 added];
    uint64_t v10 = [v9 count];
    uint64_t v11 = [v7 updated];
    uint64_t v12 = [v11 count];
    id v13 = [v7 deleted];
    int v15 = 134218496;
    uint64_t v16 = v10;
    __int16 v17 = 2048;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    uint64_t v20 = [v13 count];
    _os_log_impl(&dword_234652000, v8, OS_LOG_TYPE_DEFAULT, "vmVoicemails changeSet added:%lu updated:%lu deleted:%lu", (uint8_t *)&v15, 0x20u);
  }
  return v7;
}

- (id)voicemailChangeSetFrom:(id)a3
{
  id v4 = a3;
  id v5 = [(VoicemailCompanionReplication *)self remoteVoicemails];
  id v6 = [(VoicemailCompanionReplication *)self changeSetForRemoteVoicemails:v5 fromVMVoicemails:v4];

  return v6;
}

- (void)_performAfterFirstDeviceUnlockAndSyncRestrictionNone:(id)a3
{
  id v4 = a3;
  concurrentQueue = self->_concurrentQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __86__VoicemailCompanionReplication__performAfterFirstDeviceUnlockAndSyncRestrictionNone___block_invoke;
  v7[3] = &unk_264BF5FE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(concurrentQueue, v7);
}

uint64_t __86__VoicemailCompanionReplication__performAfterFirstDeviceUnlockAndSyncRestrictionNone___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = nph_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "void waitForFirstUnlockIfNecessary()";
    _os_log_impl(&dword_234652000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  BOOL v3 = MKBGetDeviceLockState() == 3 || MKBDeviceUnlockedSinceBoot() == 1;
  id v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v3;
    _os_log_impl(&dword_234652000, v4, OS_LOG_TYPE_DEFAULT, "Protected data available: %d", (uint8_t *)&buf, 8u);
  }

  if (!v3)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    int out_token = 0;
    id v6 = dispatch_get_global_queue(0, 0);
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v18 = __waitForFirstUnlockIfNecessary_block_invoke;
    __int16 v19 = &unk_264BF6008;
    id v7 = v5;
    uint64_t v20 = v7;
    uint32_t v8 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v6, &buf);

    double v9 = nph_general_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)int v15 = 0;
        _os_log_impl(&dword_234652000, v9, OS_LOG_TYPE_DEFAULT, "Failed to register for first unlock notification; continuing anyway",
          v15,
          2u);
      }
    }
    else
    {
      if (v10)
      {
        *(_WORD *)int v15 = 0;
        _os_log_impl(&dword_234652000, v9, OS_LOG_TYPE_DEFAULT, "VoiceMailSync waiting for first unlock", v15, 2u);
      }

      dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v11 = nph_general_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v15 = 0;
        _os_log_impl(&dword_234652000, v11, OS_LOG_TYPE_DEFAULT, "VoiceMailSync got first unlock notification", v15, 2u);
      }

      notify_cancel(out_token);
    }
  }
  uint64_t v12 = *(id *)(*(void *)(a1 + 32) + 144);
  id v13 = nph_general_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "void waitForFirstSyncCompleteIfNecessary(__strong dispatch_semaphore_t)";
    _os_log_impl(&dword_234652000, v13, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (v12) {
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_handleVoicemailsChangedNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[VoicemailCompanionReplication _handleVoicemailsChangedNotification:]";
    _os_log_impl(&dword_234652000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  dispatch_semaphore_t v5 = ListOfVoicemailsToSyncWithManager(self->_voicemailManager);

  if (v5)
  {
    id v6 = [(VoicemailCompanionReplication *)self voicemailsLoadedCondition];
    [v6 lock];

    id v7 = [(VoicemailCompanionReplication *)self voicemailsLoadedCondition];
    [v7 broadcast];

    uint32_t v8 = [(VoicemailCompanionReplication *)self voicemailsLoadedCondition];
    [v8 unlock];

    double v9 = nph_general_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[VoicemailCompanionReplication _handleVoicemailsChangedNotification:]";
      _os_log_impl(&dword_234652000, v9, OS_LOG_TYPE_DEFAULT, "%s: broadcasted voicemailsLoadedCondition", (uint8_t *)&v11, 0xCu);
    }
  }
  BOOL v10 = nph_general_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[VoicemailCompanionReplication _handleVoicemailsChangedNotification:]";
    _os_log_impl(&dword_234652000, v10, OS_LOG_TYPE_DEFAULT, "%s - calling [self _deltaSyncIsReunion:NO]", (uint8_t *)&v11, 0xCu);
  }

  [(VoicemailCompanionReplication *)self _deltaSyncIsReunion:0];
}

- (void)serviceDidPairDevice:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  vmSyncService = self->_vmSyncService;
  id v7 = 0;
  char v4 = [(SYService *)vmSyncService resume:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    id v6 = nph_general_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      double v9 = "-[VoicemailCompanionReplication serviceDidPairDevice:]";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_234652000, v6, OS_LOG_TYPE_DEFAULT, "%s - Error resuming _vmSyncService:%@", buf, 0x16u);
    }
  }
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = (char *)a3;
  uint32_t v8 = (char *)a4;
  double v9 = nph_general_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    unint64_t v19 = (unint64_t)"-[VoicemailCompanionReplication service:startSession:error:]";
    _os_log_impl(&dword_234652000, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  __int16 v10 = nph_general_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    unint64_t v19 = (unint64_t)v7;
    _os_log_impl(&dword_234652000, v10, OS_LOG_TYPE_DEFAULT, "service: %@", buf, 0xCu);
  }

  id v11 = nph_general_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    unint64_t v19 = (unint64_t)v8;
    _os_log_impl(&dword_234652000, v11, OS_LOG_TYPE_DEFAULT, "session: %@", buf, 0xCu);
  }

  uint64_t v12 = nph_general_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [v8 state];
    *(_DWORD *)long long buf = 134217984;
    unint64_t v19 = v13;
    _os_log_impl(&dword_234652000, v12, OS_LOG_TYPE_DEFAULT, "session.state: %ld", buf, 0xCu);
  }

  [(NPHVMSyncSessionManager *)self->_vmSyncSessionManager setSessionInvalidated:0];
  [v8 setDelegate:self->_vmSyncSessionManager];
  [v8 setSerializer:self->_vmSyncSessionManager];
  [v8 setTargetQueue:self->_vmSyncServiceQueue];
  uint64_t v16 = *MEMORY[0x263F49EB0];
  uint64_t v17 = MEMORY[0x263EFFA88];
  uint64_t v14 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [v8 setOptions:v14];

  if ([v8 isResetSync]) {
    [(VoicemailCompanionReplication *)self _enqueueChangesForResetSync];
  }
  else {
    [(VoicemailCompanionReplication *)self _enqueueChangesForDeltaSync];
  }

  return 1;
}

- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = (char *)a3;
  uint32_t v8 = (char *)a4;
  double v9 = (char *)a5;
  __int16 v10 = nph_general_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    int v15 = "-[VoicemailCompanionReplication service:sessionEnded:error:]";
    _os_log_impl(&dword_234652000, v10, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  id v11 = nph_general_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    int v15 = v7;
    _os_log_impl(&dword_234652000, v11, OS_LOG_TYPE_DEFAULT, "service: %@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v12 = nph_general_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    int v15 = v8;
    _os_log_impl(&dword_234652000, v12, OS_LOG_TYPE_DEFAULT, "session: %@", (uint8_t *)&v14, 0xCu);
  }

  unsigned int v13 = nph_general_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    int v15 = v9;
    _os_log_impl(&dword_234652000, v13, OS_LOG_TYPE_DEFAULT, "error: %@", (uint8_t *)&v14, 0xCu);
  }
}

- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = (char *)a3;
  uint32_t v8 = (char *)a4;
  double v9 = (char *)a5;
  __int16 v10 = nph_general_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    int v15 = "-[VoicemailCompanionReplication service:encounteredError:context:]";
    _os_log_impl(&dword_234652000, v10, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  id v11 = nph_general_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    int v15 = v7;
    _os_log_impl(&dword_234652000, v11, OS_LOG_TYPE_DEFAULT, "service: %@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v12 = nph_general_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    int v15 = v9;
    _os_log_impl(&dword_234652000, v12, OS_LOG_TYPE_DEFAULT, "context: %@", (uint8_t *)&v14, 0xCu);
  }

  unsigned int v13 = nph_general_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    int v15 = v8;
    _os_log_impl(&dword_234652000, v13, OS_LOG_TYPE_DEFAULT, "error: %@", (uint8_t *)&v14, 0xCu);
  }
}

- (id)remoteVoicemails
{
  id v3 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
  char v4 = [(NPSDomainAccessor *)self->_domainAccessor objectForKey:@"kVoicemailForReplicationKey"];
  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  id v13 = 0;
  uint32_t v8 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v7 fromData:v4 error:&v13];
  id v9 = v13;
  if (v9)
  {
    __int16 v10 = nph_general_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[VoicemailCompanionReplication remoteVoicemails]();
    }
  }
  id v11 = (void *)[v8 mutableCopy];
  if (!v11) {
    id v11 = objc_opt_new();
  }

  return v11;
}

- (void)setRemoteVoicemails:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * v8) voicemailBody];
        [v9 setVoicemailRecording:0];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  id v14 = 0;
  __int16 v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v14];
  id v11 = v14;
  if (v11)
  {
    uint64_t v12 = nph_general_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[VoicemailCompanionReplication setRemoteVoicemails:]();
    }
  }
  [(NPSDomainAccessor *)self->_domainAccessor setObject:v10 forKey:@"kVoicemailForReplicationKey"];
  id v13 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
}

- (void)removeFromRemoteVoicemails:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(VoicemailCompanionReplication *)self remoteVoicemails];
  uint64_t v6 = nph_general_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "-[VoicemailCompanionReplication removeFromRemoteVoicemails:]";
    __int16 v10 = 2112;
    id v11 = v4;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_234652000, v6, OS_LOG_TYPE_DEFAULT, "%s - %@ removed from %@", (uint8_t *)&v8, 0x20u);
  }

  int64_t v7 = [(VoicemailCompanionReplication *)self indexOfVoicemail:v4 inArray:v5];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 removeObjectAtIndex:v7];
  }
  [(VoicemailCompanionReplication *)self setRemoteVoicemails:v5];
}

- (int64_t)indexOfVoicemail:(id)a3 inArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    int64_t v7 = 0;
    while (1)
    {
      int v8 = [v6 objectAtIndex:v7];
      uint64_t v9 = [v8 identifier];
      uint64_t v10 = [v5 identifier];

      if (v9 == v10) {
        break;
      }
      if (++v7 >= (unint64_t)[v6 count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)listOfVoicemailsToSync
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = ListOfVoicemailsToSyncWithManager(self->_voicemailManager);
  if (!v3)
  {
    do
    {
      id v4 = nph_general_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        id v13 = "-[VoicemailCompanionReplication listOfVoicemailsToSync]";
        _os_log_impl(&dword_234652000, v4, OS_LOG_TYPE_DEFAULT, "%s: waiting for voicemailsLoadedCondition", buf, 0xCu);
      }

      id v5 = [(VoicemailCompanionReplication *)self voicemailsLoadedCondition];
      [v5 lock];

      id v6 = [(VoicemailCompanionReplication *)self voicemailsLoadedCondition];
      [v6 wait];

      int64_t v7 = [(VoicemailCompanionReplication *)self voicemailsLoadedCondition];
      [v7 unlock];

      uint64_t v8 = ListOfVoicemailsToSyncWithManager(self->_voicemailManager);
    }
    while (!v8);
    id v3 = (void *)v8;
  }
  uint64_t v9 = nph_general_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v3 count];
    *(_DWORD *)long long buf = 136315394;
    id v13 = "-[VoicemailCompanionReplication listOfVoicemailsToSync]";
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    _os_log_impl(&dword_234652000, v9, OS_LOG_TYPE_DEFAULT, "%s: %lu", buf, 0x16u);
  }

  return v3;
}

- (SYService)vmSyncService
{
  return self->_vmSyncService;
}

- (void)setVmSyncService:(id)a3
{
}

- (BOOL)sigtermCalled
{
  return self->_sigtermCalled;
}

- (void)setSigtermCalled:(BOOL)a3
{
  self->_sigtermCalled = a3;
}

- (_TtC12TelephonyRPC25FTMSVoicemailManager_ObjC)voicemailManager
{
  return (_TtC12TelephonyRPC25FTMSVoicemailManager_ObjC *)objc_getProperty(self, a2, 184, 1);
}

- (void)setVoicemailManager:(id)a3
{
}

- (NSCondition)voicemailsLoadedCondition
{
  return (NSCondition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setVoicemailsLoadedCondition:(id)a3
{
}

- (NSCondition)isSyncingCondition
{
  return (NSCondition *)objc_getProperty(self, a2, 200, 1);
}

- (void)setIsSyncingCondition:(id)a3
{
}

- (OS_os_transaction)syncTransaction
{
  return self->_syncTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncTransaction, 0);
  objc_storeStrong((id *)&self->_isSyncingCondition, 0);
  objc_storeStrong((id *)&self->_voicemailsLoadedCondition, 0);
  objc_storeStrong((id *)&self->_voicemailManager, 0);
  objc_storeStrong((id *)&self->_vmSyncService, 0);
  objc_storeStrong((id *)&self->vmdIsReadySemaphore, 0);
  objc_storeStrong((id *)&self->waitForFirstSyncRestrictionSemaphore, 0);
  objc_storeStrong((id *)&self->_vmServiceSyncSession, 0);
  objc_storeStrong((id *)&self->_vmSyncSessionManager, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_vmAfterSyncComplete, 0);
  objc_storeStrong((id *)&self->_vmSyncServiceQueue, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_companionSyncQueue, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

- (void)remoteVoicemails
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_234652000, v0, OS_LOG_TYPE_ERROR, "%s - Error unarchiving array of NanoPhoneVoicemailMeta objects: %@", (uint8_t *)v1, 0x16u);
}

- (void)setRemoteVoicemails:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_234652000, v0, OS_LOG_TYPE_ERROR, "%s - Error archiving remoteVoicemails: %@", (uint8_t *)v1, 0x16u);
}

@end