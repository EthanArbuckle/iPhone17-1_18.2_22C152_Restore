@interface PSYSyncCoordinator
+ (PSYSyncCoordinator)syncCoordinatorWithServiceName:(id)a3;
+ (id)filteredErrorWithError:(id)a3;
- (BOOL)_pairedSyncFinishedMigrationSyncWithPairingID:(id)a3;
- (BOOL)_pairedSyncFinishedReunionSync;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)serviceName;
- (NSXPCConnection)connection;
- (PSYServiceSyncSession)activeSyncSession;
- (PSYSyncCoordinator)initWithServiceName:(id)a3;
- (PSYSyncCoordinator)initWithServiceName:(id)a3 serviceLookupPath:(id)a4;
- (PSYSyncCoordinatorDelegate)delegate;
- (id)progressHandler;
- (id)syncSessionForOptions:(id)a3 supportsMigrationSync:(BOOL)a4;
- (int)registerNotifyTokenWithName:(id)a3 withBlock:(id)a4;
- (int)registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5;
- (unint64_t)_syncRestriction;
- (unint64_t)readNotifyToken:(int)a3;
- (unint64_t)syncRestriction;
- (void)_cleanup;
- (void)_registerMonitorAllNRDevicesForMigrationChanges:(id)a3;
- (void)_syncRestrictionDidUpdate:(id)a3 forServiceName:(id)a4;
- (void)_unregisterNRDeviceMonitors;
- (void)abortSyncWithCompletion:(id)a3;
- (void)beginDryRunSyncWithOptions:(id)a3 completion:(id)a4;
- (void)beginMonitoringDeviceChanges;
- (void)beginSyncWithOptions:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deviceChanged:(id)a3;
- (void)endMonitoringDeviceChanges;
- (void)exitForTestInput:(id)a3;
- (void)invalidateActiveSyncSession;
- (void)performDelegateBlock:(id)a3;
- (void)registry:(id)a3 added:(id)a4;
- (void)registry:(id)a3 changed:(id)a4 properties:(id)a5;
- (void)reportProgress:(double)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)syncDidComplete;
- (void)syncDidCompleteSending;
- (void)syncDidFailWithError:(id)a3;
- (void)syncSession:(id)a3 didFailWithError:(id)a4;
- (void)syncSession:(id)a3 reportProgress:(double)a4;
- (void)syncSessionDidComplete:(id)a3;
- (void)syncSessionDidCompleteSending:(id)a3;
@end

@implementation PSYSyncCoordinator

- (unint64_t)syncRestriction
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__PSYSyncCoordinator_syncRestriction__block_invoke;
  v5[3] = &unk_2642B3E08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__PSYSyncCoordinator_syncRestriction__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _syncRestriction];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_syncRestriction
{
  unint64_t v3 = +[PSYRegistrySingleton registry];
  v4 = [v3 pairingID];

  if (v4
    && ((BOOL v5 = [(PSYSyncCoordinator *)self _pairedSyncFinishedMigrationSyncWithPairingID:v4], syncIDOfStartedSync = self->_syncIDOfStartedSync, v5)|| syncIDOfStartedSync))
  {
    uint64_t v9 = +[PSYRegistrySingleton registry];
    uint64_t v10 = [v9 switchIndex];

    if (syncIDOfStartedSync == v10) {
      unint64_t v7 = 0;
    }
    else {
      unint64_t v7 = [(PSYSyncCoordinator *)self _pairedSyncFinishedReunionSync] ^ 1;
    }
  }
  else
  {
    unint64_t v7 = 1;
  }

  return v7;
}

+ (PSYSyncCoordinator)syncCoordinatorWithServiceName:(id)a3
{
  id v4 = a3;
  if (syncCoordinatorWithServiceName__onceToken != -1) {
    dispatch_once(&syncCoordinatorWithServiceName__onceToken, &__block_literal_global_0);
  }
  pthread_mutex_lock(&__serviceLock);
  uint64_t v5 = [(id)syncCoordinatorWithServiceName____listeners objectForKey:v4];
  uint64_t v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithServiceName:v4];
      if (v6) {
        [(id)syncCoordinatorWithServiceName____listeners setObject:v6 forKey:v4];
      }
    }
  }
  pthread_mutex_unlock(&__serviceLock);

  return (PSYSyncCoordinator *)v6;
}

uint64_t __53__PSYSyncCoordinator_syncCoordinatorWithServiceName___block_invoke()
{
  syncCoordinatorWithServiceName____listeners = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);

  return MEMORY[0x270F9A758]();
}

- (PSYSyncCoordinator)initWithServiceName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PSYGetClientListDirectory();
  uint64_t v6 = [(PSYSyncCoordinator *)self initWithServiceName:v4 serviceLookupPath:v5];

  return v6;
}

- (PSYSyncCoordinator)initWithServiceName:(id)a3 serviceLookupPath:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)PSYSyncCoordinator;
  uint64_t v8 = [(PSYSyncCoordinator *)&v35 init];
  if (v8)
  {
    uint64_t v9 = psy_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = psy_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[PSYSyncCoordinator initWithServiceName:serviceLookupPath:]";
        __int16 v38 = 2114;
        id v39 = v6;
        _os_log_impl(&dword_2179FA000, v11, OS_LOG_TYPE_DEFAULT, "%s: %{public}@", buf, 0x16u);
      }
    }
    v8->_syncSwitchIDToken = -1;
    v28 = [v6 stringByAppendingPathExtension:@"plist"];
    v12 = [v7 URLByAppendingPathComponent:v28];
    v13 = [NSDictionary dictionaryWithContentsOfURL:v12];
    v14 = +[PSYActivityInfo activityWithPlist:v13];
    v8->_syncRestriction = 1;
    objc_initWeak((id *)buf, v8);
    if (v14)
    {
      v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v15 = dispatch_queue_create("com.apple.pairedsync.coordinator", v27);
      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v15;

      objc_storeStrong((id *)&v8->_delegateQueue, MEMORY[0x263EF83A0]);
      uint64_t v17 = [v6 copy];
      serviceName = v8->_serviceName;
      v8->_serviceName = (NSString *)v17;

      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __60__PSYSyncCoordinator_initWithServiceName_serviceLookupPath___block_invoke;
      v32[3] = &unk_2642B3FD0;
      objc_copyWeak(&v34, (id *)buf);
      v19 = v8;
      v33 = v19;
      v20 = (void *)MEMORY[0x21D452D80](v32);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __60__PSYSyncCoordinator_initWithServiceName_serviceLookupPath___block_invoke_2;
      v29[3] = &unk_2642B3FF8;
      objc_copyWeak(&v31, (id *)buf);
      id v21 = v20;
      id v30 = v21;
      v8->_syncSwitchIDToken = [(PSYSyncCoordinator *)v19 registerNotifyTokenWithName:@"com.apple.pairedsync.lastsyncswitchid" withBlock:v29];
      [(PSYSyncCoordinator *)v19 _registerMonitorAllNRDevicesForMigrationChanges:v21];
      +[PSYRegistrySingleton addDelegate:v19];
      pthread_mutex_init(&v19->_delegateLock, 0);
      id v22 = objc_alloc(MEMORY[0x263F08D88]);
      v23 = [v14 machServiceName];
      uint64_t v24 = [v22 initWithMachServiceName:v23];
      listener = v19->_listener;
      v19->_listener = (NSXPCListener *)v24;

      [(NSXPCListener *)v19->_listener setDelegate:v19];
      objc_destroyWeak(&v31);

      objc_destroyWeak(&v34);
    }
    else
    {

      NSLog(&cfstr_ErrorCouldNotC.isa, v12, v6);
      v19 = 0;
    }
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __60__PSYSyncCoordinator_initWithServiceName_serviceLookupPath___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unint64_t v3 = *(void **)(a1 + 32);
    uint64_t v5 = WeakRetained;
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(WeakRetained, "_syncRestriction"));
    [v3 _syncRestrictionDidUpdate:v4 forServiceName:v5[20]];

    WeakRetained = v5;
  }
}

void __60__PSYSyncCoordinator_initWithServiceName_serviceLookupPath___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    unint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(WeakRetained, "_syncRestriction"));
    [v4 _syncRestrictionDidUpdate:v3 forServiceName:v4[20]];

    [v4 _registerMonitorAllNRDevicesForMigrationChanges:*(void *)(a1 + 32)];
    WeakRetained = v4;
  }
}

- (unint64_t)readNotifyToken:(int)a3
{
  if (a3 == -1) {
    return 0;
  }
  uint64_t state64 = 0;
  if (notify_get_state(a3, &state64)) {
    return 0;
  }
  else {
    return state64;
  }
}

- (int)registerNotifyTokenWithName:(id)a3 withBlock:(id)a4
{
  return [(PSYSyncCoordinator *)self registerNotifyTokenWithName:a3 withQueue:self->_queue withBlock:a4];
}

- (int)registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = a4;
  id v9 = a5;
  int out_token = -1;
  id v10 = v7;
  v11 = (const char *)[v10 UTF8String];
  if (v9) {
    uint32_t v12 = notify_register_dispatch(v11, &out_token, v8, v9);
  }
  else {
    uint32_t v12 = notify_register_check(v11, &out_token);
  }
  uint32_t v13 = v12;
  if (v12)
  {
    v14 = psy_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      v16 = psy_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        uint32_t v21 = v13;
        __int16 v22 = 2114;
        id v23 = v10;
        _os_log_impl(&dword_2179FA000, v16, OS_LOG_TYPE_DEFAULT, "notify_register call failed with state: (%u) for %{public}@", buf, 0x12u);
      }
    }
  }
  int v17 = out_token;

  return v17;
}

- (void)_registerMonitorAllNRDevicesForMigrationChanges:(id)a3
{
  self->_migrationChangeBlock = (id)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)_unregisterNRDeviceMonitors
{
  self->_migrationChangeBlock = 0;
  MEMORY[0x270F9A758]();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 valueForEntitlement:@"com.apple.pairedsync.scheduler"];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    id v10 = PSYActivityXPCInterface();
    [v7 setExportedInterface:v10];

    [v7 setExportedObject:self];
    v11 = PSYActivityProgressXPCInterface();
    [v7 setRemoteObjectInterface:v11];

    objc_initWeak((id *)location, self);
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __57__PSYSyncCoordinator_listener_shouldAcceptNewConnection___block_invoke;
    v19 = &unk_2642B4020;
    v20 = self;
    objc_copyWeak(&v21, (id *)location);
    [v7 setInvalidationHandler:&v16];
    objc_storeStrong((id *)&self->_connection, a4);
    objc_msgSend(v7, "resume", v16, v17, v18, v19, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)location);
  }
  else
  {
    uint32_t v12 = psy_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      v14 = psy_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 138543618;
        *(void *)&location[4] = v7;
        __int16 v23 = 2112;
        uint64_t v24 = @"com.apple.pairedsync.scheduler";
        _os_log_impl(&dword_2179FA000, v14, OS_LOG_TYPE_DEFAULT, "Dropping connection %{public}@ because it's missing the entitlement for %@", location, 0x16u);
      }
    }
  }

  return v9;
}

void __57__PSYSyncCoordinator_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__PSYSyncCoordinator_listener_shouldAcceptNewConnection___block_invoke_2;
  block[3] = &unk_2642B3F20;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __57__PSYSyncCoordinator_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnection:0];

  id v3 = psd_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = psd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_2179FA000, v5, OS_LOG_TYPE_DEFAULT, "Connection to pairedsyncd lost, invalidating sync session", v7, 2u);
    }
  }
  id v6 = objc_loadWeakRetained(v1);
  [v6 invalidateActiveSyncSession];
}

- (BOOL)_pairedSyncFinishedReunionSync
{
  unint64_t v2 = [(PSYSyncCoordinator *)self readNotifyToken:self->_syncSwitchIDToken];
  id v3 = +[PSYRegistrySingleton registry];
  LOBYTE(v2) = v2 == [v3 switchIndex];

  return v2;
}

- (BOOL)_pairedSyncFinishedMigrationSyncWithPairingID:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 UUIDString];
  uint64_t v5 = +[PSYRegistrySingleton registry];
  id v6 = [v5 deviceForPairingID:v3];

  id v7 = [v6 valueForProperty:*MEMORY[0x263F5BB08]];
  uint64_t v8 = [v7 integerValue];
  CFStringRef v9 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSynchronize(@"com.apple.pairedsyncd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  id v10 = (void *)CFPreferencesCopyValue(@"pairingIDMigrationCountDictionary", @"com.apple.pairedsyncd", @"mobile", v9);
  v11 = [v10 objectForKeyedSubscript:v4];
  LOBYTE(v8) = v8 == [v11 integerValue];

  return v8;
}

- (void)_syncRestrictionDidUpdate:(id)a3 forServiceName:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_syncRestriction];
  char v9 = [v8 isEqual:v6];

  if ((v9 & 1) == 0)
  {
    self->_syncRestriction = [v6 integerValue];
    if ([v7 isEqual:self->_serviceName])
    {
      pthread_mutex_lock(&self->_delegateLock);
      id v10 = self->_delegateQueue;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      pthread_mutex_unlock(&self->_delegateLock);
      uint32_t v12 = psy_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        v14 = psy_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = objc_loadWeakRetained((id *)&self->_delegate);
          uint64_t v16 = (objc_class *)objc_opt_class();
          uint64_t v17 = NSStringFromClass(v16);
          *(_DWORD *)buf = 138543874;
          __int16 v23 = v10;
          __int16 v24 = 2112;
          uint64_t v25 = v17;
          __int16 v26 = 1024;
          int v27 = [v6 integerValue];
          _os_log_impl(&dword_2179FA000, v14, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - dispatching sync restriction did update on queue %{public}@ to delegate %@ (%d)", buf, 0x1Cu);
        }
      }
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __63__PSYSyncCoordinator__syncRestrictionDidUpdate_forServiceName___block_invoke;
      v19[3] = &unk_2642B3DE0;
      id v20 = WeakRetained;
      id v21 = self;
      id v18 = WeakRetained;
      dispatch_async((dispatch_queue_t)v10, v19);
    }
  }
}

uint64_t __63__PSYSyncCoordinator__syncRestrictionDidUpdate_forServiceName___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 syncCoordinatorDidChangeSyncRestriction:v4];
  }
  return result;
}

- (void)beginSyncWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = psy_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = psy_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v6;
      _os_log_impl(&dword_2179FA000, v10, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - beginSyncWithOptions: %{public}@", buf, 0xCu);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__PSYSyncCoordinator_beginSyncWithOptions_completion___block_invoke;
  block[3] = &unk_2642B4048;
  void block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(queue, block);
}

void __54__PSYSyncCoordinator_beginSyncWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
  unint64_t v2 = *(id *)(*(void *)(a1 + 32) + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
  char v4 = objc_opt_respondsToSelector();
  uint64_t v5 = psd_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = psd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      BOOL v9 = @"DOES NOT SUPPORT";
      *(_DWORD *)buf = 138412802;
      v50 = v8;
      if (v4) {
        BOOL v9 = @"SUPPORTS";
      }
      __int16 v51 = 2048;
      id v52 = WeakRetained;
      __int16 v53 = 2112;
      v54 = v9;
      id v10 = v8;
      _os_log_impl(&dword_2179FA000, v7, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator: in beginSyncWithOptions determined that delegate %@<%p> %@ migration sync", buf, 0x20u);
    }
  }
  v11 = [*(id *)(a1 + 32) syncSessionForOptions:*(void *)(a1 + 40) supportsMigrationSync:v4 & 1];
  if (v11) {
    BOOL v12 = WeakRetained == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    id v13 = psy_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (WeakRetained)
    {
      if (v14)
      {
        id v15 = psy_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2179FA000, v15, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - No sync session could be created. Most likely no active device in NanoRegistry. Skipping beginSyncSession call into client.", buf, 2u);
        }
      }
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = 6;
    }
    else
    {
      if (v14)
      {
        v36 = psy_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2179FA000, v36, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - client delegate missing.", buf, 2u);
        }
      }
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = 7;
    }
    v37 = PSYErrorForCode(v17);
    (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v37);
  }
  else
  {
    id v18 = +[PSYRegistrySingleton registry];
    *(void *)(*(void *)(a1 + 32) + 136) = [v18 switchIndex];

    uint64_t v19 = *(void **)(a1 + 32);
    id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "_syncRestriction"));
    [v19 _syncRestrictionDidUpdate:v20 forServiceName:*(void *)(*(void *)(a1 + 32) + 160)];

    uint64_t v21 = MEMORY[0x21D452D80](*(void *)(a1 + 48));
    uint64_t v22 = *(void *)(a1 + 32);
    __int16 v23 = *(void **)(v22 + 16);
    *(void *)(v22 + 16) = v21;

    __int16 v24 = [*(id *)(*(void *)(a1 + 32) + 112) sessionIdentifier];
    uint64_t v25 = [*(id *)(a1 + 40) sessionIdentifier];
    int v26 = [v24 isEqual:v25];

    if (v26)
    {
      int v27 = psd_log();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

      if (v28)
      {
        v29 = psd_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2179FA000, v29, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator received beginSyncWithOptions: for the current sessionIdentifier. Ignoring message", buf, 2u);
        }
      }
    }
    uint64_t v30 = *(void *)(a1 + 32);
    uint64_t v32 = *(void *)(v30 + 112);
    id v31 = (id *)(v30 + 112);
    if (v32)
    {
      v33 = psy_log();
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);

      if (v34)
      {
        objc_super v35 = psy_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          __54__PSYSyncCoordinator_beginSyncWithOptions_completion___block_invoke_cold_1(v35);
        }
      }
    }
    else
    {
      objc_storeStrong(v31, v11);
      [*(id *)(a1 + 32) beginMonitoringDeviceChanges];
      int v38 = [*(id *)(a1 + 40) dryRun];
      id v39 = psy_log();
      BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);

      if (v38)
      {
        if (v40)
        {
          v41 = psy_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2179FA000, v41, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - Dry run - not calling delegate", buf, 2u);
          }
        }
        [*(id *)(a1 + 32) beginDryRunSyncWithOptions:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
      }
      else
      {
        if (v40)
        {
          v42 = psy_log();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            id v43 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
            v44 = (objc_class *)objc_opt_class();
            v45 = NSStringFromClass(v44);
            NSStringfromPSYSyncSessionType([v11 syncSessionType]);
            v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v50 = v2;
            __int16 v51 = 2112;
            id v52 = v45;
            __int16 v53 = 2112;
            v54 = v46;
            _os_log_impl(&dword_2179FA000, v42, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - dispatching start sync on queue %{public}@ to delegate %@ syncType %@", buf, 0x20u);
          }
        }
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __54__PSYSyncCoordinator_beginSyncWithOptions_completion___block_invoke_31;
        v47[3] = &unk_2642B3DE0;
        v47[4] = *(void *)(a1 + 32);
        id v48 = WeakRetained;
        dispatch_async(v2, v47);
      }
    }
  }
}

void __54__PSYSyncCoordinator_beginSyncWithOptions_completion___block_invoke_31(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) activeSyncSession];

  if (v2)
  {
    if (!*(void *)(a1 + 40)) {
      return;
    }
    char v3 = objc_opt_respondsToSelector();
    char v4 = *(void **)(a1 + 40);
    if (v3)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      id v14 = [v5 activeSyncSession];
      [v4 syncCoordinator:v5 beginSyncSession:v14];
LABEL_15:

      return;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v11 = (void *)MEMORY[0x263EFF940];
      uint64_t v12 = *MEMORY[0x263EFF498];
      id v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      [v11 raise:v12, @"delegate %@ must respond to either syncCoordinator:beginSyncSession: or syncCoordinatorDidReceiveStartSyncCommand:", v14 format];
      goto LABEL_15;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    BOOL v9 = *(void **)(a1 + 40);
    [v9 syncCoordinatorDidReceiveStartSyncCommand:v10];
  }
  else
  {
    BOOL v6 = psy_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      uint64_t v8 = psy_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2179FA000, v8, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - Sync session disappeared before it could be started. Most likely the daemon has died due to a quickswitch.", buf, 2u);
      }
    }
  }
}

- (void)abortSyncWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = psy_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = psy_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2179FA000, v7, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator - abortSyncWithCompletion:", buf, 2u);
    }
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__PSYSyncCoordinator_abortSyncWithCompletion___block_invoke;
  v10[3] = &unk_2642B4070;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(queue, v10);
}

uint64_t __46__PSYSyncCoordinator_abortSyncWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateActiveSyncSession];
  unint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (PSYServiceSyncSession)activeSyncSession
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__PSYSyncCoordinator_activeSyncSession__block_invoke;
  v5[3] = &unk_2642B3E08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PSYServiceSyncSession *)v3;
}

void __39__PSYSyncCoordinator_activeSyncSession__block_invoke(uint64_t a1)
{
}

- (id)progressHandler
{
  unint64_t v2 = [(PSYSyncCoordinator *)self connection];
  id v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)syncSessionDidCompleteSending:(id)a3
{
  id v3 = [(PSYSyncCoordinator *)self progressHandler];
  [v3 activityDidCompleteSending];
}

- (void)syncSessionDidComplete:(id)a3
{
  pendingCompletion = (void (**)(id, uint64_t, void))self->_pendingCompletion;
  if (pendingCompletion)
  {
    pendingCompletion[2](pendingCompletion, 1, 0);
    [(PSYSyncCoordinator *)self _cleanup];
    [(PSYSyncCoordinator *)self invalidateActiveSyncSession];
  }
}

- (void)syncSession:(id)a3 didFailWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = psy_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = psy_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_msgSend(v5, "psy_safeDescription");
      int v14 = 138543362;
      id v15 = v9;
      _os_log_impl(&dword_2179FA000, v8, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator client called syncDidFailWithError: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
  if (self->_pendingCompletion)
  {
    id v10 = +[PSYSyncCoordinator filteredErrorWithError:v5];
    if (v10 != v5)
    {
      id v11 = psy_log();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (v12)
      {
        id v13 = psy_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138412290;
          id v15 = v10;
          _os_log_impl(&dword_2179FA000, v13, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator client has custom classes in NSError userinfo, filtered error is: %@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    (*((void (**)(void))self->_pendingCompletion + 2))();
    [(PSYSyncCoordinator *)self _cleanup];
    [(PSYSyncCoordinator *)self invalidateActiveSyncSession];
  }
}

+ (id)filteredErrorWithError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = +[PSYPlistFilter filteredPlistDictionary:v4];

  uint64_t v6 = [v3 userInfo];

  if (v5 == v6)
  {
    id v9 = v3;
  }
  else
  {
    BOOL v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = [v3 domain];
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v3, "code"), v5);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)syncSession:(id)a3 reportProgress:(double)a4
{
  id v6 = [(PSYSyncCoordinator *)self progressHandler];
  *(float *)&double v5 = a4;
  [v6 activityDidUpdateProgress:v5];
}

- (void)syncDidCompleteSending
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__PSYSyncCoordinator_syncDidCompleteSending__block_invoke;
  block[3] = &unk_2642B3DB8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __44__PSYSyncCoordinator_syncDidCompleteSending__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) syncDidCompleteSending];
}

- (void)syncDidComplete
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__PSYSyncCoordinator_syncDidComplete__block_invoke;
  block[3] = &unk_2642B3DB8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__PSYSyncCoordinator_syncDidComplete__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) syncDidComplete];
}

- (void)syncDidFailWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__PSYSyncCoordinator_syncDidFailWithError___block_invoke;
  v7[3] = &unk_2642B3DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __43__PSYSyncCoordinator_syncDidFailWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) syncDidFailWithError:*(void *)(a1 + 40)];
}

- (void)reportProgress:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__PSYSyncCoordinator_reportProgress___block_invoke;
  v4[3] = &unk_2642B3F90;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __37__PSYSyncCoordinator_reportProgress___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) reportProgress:*(double *)(a1 + 40)];
}

- (void)setDelegate:(id)a3
{
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id obj = a4;
  if (!obj)
  {
    id obj = (id)MEMORY[0x263EF83A0];
    id v6 = MEMORY[0x263EF83A0];
  }
  id v7 = a3;
  pthread_mutex_lock(&self->_delegateLock);
  objc_storeWeak((id *)&self->_delegate, v7);

  objc_storeStrong((id *)&self->_delegateQueue, obj);
  if (!self->_hasStartedListening)
  {
    [(NSXPCListener *)self->_listener resume];
    self->_hasStartedListening = 1;
  }
  pthread_mutex_unlock(&self->_delegateLock);
}

- (PSYSyncCoordinatorDelegate)delegate
{
  p_delegateLock = &self->_delegateLock;
  pthread_mutex_lock(&self->_delegateLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  pthread_mutex_unlock(p_delegateLock);

  return (PSYSyncCoordinatorDelegate *)WeakRetained;
}

- (void)performDelegateBlock:(id)a3
{
  id v4 = a3;
  p_delegateLock = &self->_delegateLock;
  pthread_mutex_lock(&self->_delegateLock);
  p_delegate = &self->_delegate;
  id v7 = self->_delegateQueue;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  pthread_mutex_unlock(p_delegateLock);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__PSYSyncCoordinator_performDelegateBlock___block_invoke;
  v11[3] = &unk_2642B3E58;
  id v12 = WeakRetained;
  id v13 = v4;
  id v9 = WeakRetained;
  id v10 = v4;
  dispatch_async((dispatch_queue_t)v7, v11);
}

uint64_t __43__PSYSyncCoordinator_performDelegateBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)invalidateActiveSyncSession
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  activeSyncSession = self->_activeSyncSession;
  if (activeSyncSession)
  {
    id v4 = activeSyncSession;
    double v5 = self->_activeSyncSession;
    self->_activeSyncSession = 0;

    [(PSYSyncCoordinator *)self endMonitoringDeviceChanges];
    id v6 = psy_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      id v8 = psy_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v4;
        _os_log_impl(&dword_2179FA000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating sync session: %{public}@", buf, 0xCu);
      }
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __49__PSYSyncCoordinator_invalidateActiveSyncSession__block_invoke;
    v10[3] = &unk_2642B4098;
    v10[4] = self;
    id v11 = v4;
    id v9 = v4;
    [(PSYSyncCoordinator *)self performDelegateBlock:v10];
  }
}

void __49__PSYSyncCoordinator_invalidateActiveSyncSession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 syncCoordinator:*(void *)(a1 + 32) didInvalidateSyncSession:*(void *)(a1 + 40)];
  }
}

- (void)dealloc
{
  id v3 = +[PSYRegistrySingleton registry];
  [v3 removeDelegate:self];

  int syncSwitchIDToken = self->_syncSwitchIDToken;
  if (syncSwitchIDToken != -1) {
    notify_cancel(syncSwitchIDToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)PSYSyncCoordinator;
  [(PSYSyncCoordinator *)&v5 dealloc];
}

- (void)_cleanup
{
  self->_pendingCompletion = 0;
  MEMORY[0x270F9A758]();
}

- (void)beginMonitoringDeviceChanges
{
  self->_monitoringDeviceChanges = 1;
}

- (void)endMonitoringDeviceChanges
{
  self->_monitoringDeviceChanges = 0;
}

- (void)deviceChanged:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__PSYSyncCoordinator_deviceChanged___block_invoke;
  block[3] = &unk_2642B3DB8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __36__PSYSyncCoordinator_deviceChanged___block_invoke(uint64_t a1)
{
  unint64_t v2 = +[PSYRegistrySingleton registry];
  id v3 = [v2 pairingID];

  id v4 = *(void **)(*(void *)(a1 + 32) + 112);
  if (v4)
  {
    objc_super v5 = [v4 pairingID];
    char v6 = [v5 isEqual:v3];

    if ((v6 & 1) == 0)
    {
      BOOL v7 = psd_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        id v9 = psd_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v10 = 0;
          _os_log_impl(&dword_2179FA000, v9, OS_LOG_TYPE_DEFAULT, "Device changed, invalidating sync session", v10, 2u);
        }
      }
      [*(id *)(a1 + 32) invalidateActiveSyncSession];
    }
  }
}

- (id)syncSessionForOptions:(id)a3 supportsMigrationSync:(BOOL)a4
{
  BOOL v24 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = +[PSYRegistrySingleton registry];
  BOOL v7 = [v6 getPairedDevices];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
      uint64_t v14 = [v13 pairingID];
      id v15 = [v5 pairingIdentifier];
      char v16 = [v14 isEqual:v15];

      if (v16) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v17 = v13;

    if (!v17) {
      goto LABEL_12;
    }
    id v18 = [[PSYServiceSyncSession alloc] initWithQueue:self->_queue supportsMigrationSync:v24];
    [(PSYServiceSyncSession *)v18 setPdrPairedDevice:v17];
    -[PSYServiceSyncSession setSyncSessionType:](v18, "setSyncSessionType:", [v5 syncSessionType]);
    uint64_t v19 = [v5 sessionIdentifier];
    [(PSYServiceSyncSession *)v18 setSessionIdentifier:v19];

    [(PSYServiceSyncSession *)v18 setDelegate:self];
    [(PSYServiceSyncSession *)v18 setSyncCoordinator:self];
    id v20 = +[PSYRegistrySingleton registry];
    -[PSYServiceSyncSession setSwitchID:](v18, "setSwitchID:", [v20 switchIndex]);

    goto LABEL_16;
  }
LABEL_9:

LABEL_12:
  uint64_t v21 = psd_log();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

  if (v22)
  {
    uint64_t v17 = psd_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PSYSyncCoordinator syncSessionForOptions:supportsMigrationSync:](v8, v17);
    }
    id v18 = 0;
LABEL_16:

    goto LABEL_18;
  }
  id v18 = 0;
LABEL_18:

  return v18;
}

- (void)beginDryRunSyncWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  id v8 = [v6 testInput];
  uint64_t v9 = [v8 action];
  uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v11 = dispatch_queue_create(0, v10);
  uint64_t v12 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v11);

  dispatch_source_set_timer(v12, 0, 0x5F5E100uLL, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __60__PSYSyncCoordinator_beginDryRunSyncWithOptions_completion___block_invoke;
  handler[3] = &unk_2642B40C0;
  uint64_t v21 = v12;
  BOOL v22 = v23;
  handler[4] = self;
  id v13 = v12;
  dispatch_source_set_event_handler(v13, handler);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__PSYSyncCoordinator_beginDryRunSyncWithOptions_completion___block_invoke_2;
  v16[3] = &unk_2642B40E8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v7;
  uint64_t v19 = v9;
  id v14 = v7;
  id v15 = v8;
  dispatch_source_set_cancel_handler(v13, v16);
  dispatch_resume(v13);

  _Block_object_dispose(v23, 8);
}

void __60__PSYSyncCoordinator_beginDryRunSyncWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  float v3 = *(float *)(v2 + 24) + 0.1;
  *(float *)(v2 + 24) = v3;
  [*(id *)(a1 + 32) reportProgress:*(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  if (*(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 1.0)
  {
    id v4 = *(NSObject **)(a1 + 40);
    dispatch_source_cancel(v4);
  }
}

void __60__PSYSyncCoordinator_beginDryRunSyncWithOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 56);
  if ((unint64_t)(v2 - 2) >= 2)
  {
    uint64_t v3 = 0;
    id v5 = 0;
    int v4 = 1;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.pairedsync.synccoordinator" code:1 userInfo:0];
    int v4 = 0;
    uint64_t v2 = *(void *)(a1 + 56);
    id v5 = (void *)v3;
  }
  if (v2 == 1)
  {
    [*(id *)(a1 + 32) exitForTestInput:*(void *)(a1 + 40)];
    id v5 = (void *)v3;
  }
  id v6 = psy_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = psy_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) serviceName];
      uint64_t v10 = objc_msgSend(v5, "psy_safeDescription");
      int v13 = 138543874;
      id v14 = v9;
      __int16 v15 = 1024;
      int v16 = v4;
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_impl(&dword_2179FA000, v8, OS_LOG_TYPE_DEFAULT, "Service %{public}@ completed dry run with success: %d error: %{public}@", (uint8_t *)&v13, 0x1Cu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 16);
  *(void *)(v11 + 16) = 0;
}

- (void)exitForTestInput:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = psy_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = psy_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "action"));
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_2179FA000, v6, OS_LOG_TYPE_DEFAULT, "Exiting due to test input action: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  exit(1);
}

- (void)registry:(id)a3 added:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (self->_monitoringDeviceChanges && [v6 isActive]) {
    [(PSYSyncCoordinator *)self deviceChanged:v7];
  }
}

- (void)registry:(id)a3 changed:(id)a4 properties:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (self->_monitoringDeviceChanges)
  {
    int v11 = [v9 containsObject:*MEMORY[0x263F5BB00]];
    int v12 = [v10 containsObject:*MEMORY[0x263F5BAF8]];
    if (v12) {
      int v12 = [v8 isActive];
    }
    if (v12 | v11) {
      [(PSYSyncCoordinator *)self deviceChanged:v8];
    }
  }
  if (self->_migrationChangeBlock && [v10 containsObject:*MEMORY[0x263F5BB08]]) {
    dispatch_async((dispatch_queue_t)self->_queue, self->_migrationChangeBlock);
  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong(&self->_migrationChangeBlock, 0);
  objc_storeStrong((id *)&self->_activeSyncSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_pendingCompletion, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

void __54__PSYSyncCoordinator_beginSyncWithOptions_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2179FA000, log, OS_LOG_TYPE_ERROR, "PSYSyncCoordinator - Sync session already in progress.  Ignoring additional begin sync message. This is a serious error", v1, 2u);
}

- (void)syncSessionForOptions:(void *)a1 supportsMigrationSync:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_error_impl(&dword_2179FA000, a2, OS_LOG_TYPE_ERROR, "missing paired device. devices count: %tu", (uint8_t *)&v3, 0xCu);
}

@end