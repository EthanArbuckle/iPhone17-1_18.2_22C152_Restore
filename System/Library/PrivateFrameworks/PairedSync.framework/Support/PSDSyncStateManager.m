@interface PSDSyncStateManager
+ (id)sharedSyncStateManager;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PSDSyncStateManager)init;
- (id)_queue_deviceSyncStateEntryForPairingID:(id)a3;
- (id)domainAccessorForPairingID:(id)a3;
- (id)isInitialSyncCompleteForPairingID:(id)a3;
- (id)isSyncCompleteForPairingID:(id)a3;
- (id)syncStatePersistentURL;
- (void)_loadLegacySyncStateAndMigrateIfNeeded;
- (void)_queue_tellRemoteObserversDidCompleteSyncForPairingID:(id)a3;
- (void)_updateMigrationCounter;
- (void)connectionInterrupted:(id)a3;
- (void)requestDeviceSyncStateEntriesForPairingIDs:(id)a3 completion:(id)a4;
- (void)setSyncCompleteForPairingID:(id)a3 withBlock:(id)a4;
- (void)setupListener;
@end

@implementation PSDSyncStateManager

+ (id)sharedSyncStateManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AF00;
  block[3] = &unk_10002C778;
  block[4] = a1;
  if (qword_1000384B8 != -1) {
    dispatch_once(&qword_1000384B8, block);
  }
  v2 = (void *)qword_1000384B0;

  return v2;
}

- (PSDSyncStateManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)PSDSyncStateManager;
  v2 = [(PSDSyncStateManager *)&v24 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.pairedsyncd.syncstatemanager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    syncStateCache = v2->_syncStateCache;
    v2->_syncStateCache = v6;

    [(PSDSyncStateManager *)v2 _loadLegacySyncStateAndMigrateIfNeeded];
    v8 = +[PSYRegistrySingleton registry];
    v9 = [v8 getPairedDevices];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v14), "pairingID", (void)v20);
          id v16 = [(PSDSyncStateManager *)v2 isSyncCompleteForPairingID:v15];

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v12);
    }

    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    activeConnections = v2->_activeConnections;
    v2->_activeConnections = v17;

    [(PSDSyncStateManager *)v2 setupListener];
  }
  return v2;
}

- (void)_updateMigrationCounter
{
  v2 = psd_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    dispatch_queue_t v4 = psd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating last watch migration counter dictionary.", buf, 2u);
    }
  }
  v5 = +[PSYRegistrySingleton registry];
  v6 = [v5 pairingID];

  if (v6)
  {
    v7 = [v6 UUIDString];
    v8 = +[PSYRegistrySingleton registry];
    v9 = [v8 deviceForPairingID:v6];

    v28 = v9;
    id v10 = [v9 valueForProperty:PDRDevicePropertyKeyMigrationCount];
    id v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 integerValue]);
    id v12 = [v11 stringValue];

    CFStringRef v13 = (const __CFString *)PSYPairedSyncDomainName;
    v14 = (void *)CFPreferencesCopyValue(@"pairingIDMigrationCountDictionary", PSYPairedSyncDomainName, @"mobile", kCFPreferencesAnyHost);
    v15 = v14;
    if (v14)
    {
      id v16 = [v14 mutableCopy];
    }
    else
    {
      id v16 = +[NSMutableDictionary dictionary];
    }
    v19 = v16;
    long long v20 = psd_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      long long v22 = psd_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "_updateMigrationCounter: Reading pairingIDMigrationCountDictionary- Value is %@", buf, 0xCu);
      }
    }
    long long v23 = [v19 objectForKeyedSubscript:v7];
    unsigned __int8 v24 = [v12 isEqual:v23];

    if ((v24 & 1) == 0)
    {
      [v19 setObject:v12 forKeyedSubscript:v7];
      v25 = psd_log();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

      if (v26)
      {
        v27 = psd_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v19;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "_updateMigrationCounter: Updating pairingIDMigrationCountDictionary- Value is %@", buf, 0xCu);
        }
      }
      CFPreferencesSetValue(@"pairingIDMigrationCountDictionary", v19, v13, @"mobile", kCFPreferencesAnyHost);
      CFPreferencesSynchronize(v13, @"mobile", kCFPreferencesAnyHost);
    }

LABEL_23:
    goto LABEL_24;
  }
  v17 = psd_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    v7 = psd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not updating because no active paired device", buf, 2u);
    }
    goto LABEL_23;
  }
LABEL_24:
}

- (void)setSyncCompleteForPairingID:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = +[PSYRegistrySingleton registry];
  v9 = [v8 deviceForPairingID:v6];

  unsigned int v10 = [v9 isPaired];
  unsigned int v11 = [v9 isAltAccount];
  id v12 = psd_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

  if (v11) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v10 == 0;
  }
  if (v14)
  {
    if (v13)
    {
      v15 = psd_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10001C700(v15);
      }
    }
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    if (v13)
    {
      id v16 = psd_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10001C688((uint64_t)v6, v16);
      }
    }
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B668;
    block[3] = &unk_10002C908;
    id v19 = v6;
    long long v20 = self;
    BOOL v21 = v7;
    dispatch_async((dispatch_queue_t)queue, block);
  }
}

- (id)isSyncCompleteForPairingID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000B98C;
  v17 = sub_10000B99C;
  id v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B9A4;
    block[3] = &unk_10002C7C8;
    void block[4] = self;
    id v11 = v4;
    id v12 = &v13;
    dispatch_sync((dispatch_queue_t)queue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)isInitialSyncCompleteForPairingID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000B98C;
  v17 = sub_10000B99C;
  id v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BB4C;
    block[3] = &unk_10002C7C8;
    void block[4] = self;
    id v11 = v4;
    id v12 = &v13;
    dispatch_sync((dispatch_queue_t)queue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)_queue_deviceSyncStateEntryForPairingID:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_syncStateCache objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = [(PSDSyncStateManager *)self domainAccessorForPairingID:v4];
    if (v6)
    {
      v5 = objc_opt_new();
      if ([v6 BOOLForKey:@"hasCompletedInitialSync"]) {
        uint64_t v7 = 3;
      }
      else {
        uint64_t v7 = 4;
      }
      [v5 setInitialSyncState:v7];
      objc_msgSend(v5, "setMigrationIndex:", objc_msgSend(v6, "integerForKey:", @"migrationCount"));
      char v13 = 0;
      objc_msgSend(v5, "setSyncSwitchIndex:", objc_msgSend(v6, "integerForKey:keyExistsAndHasValidFormat:", @"syncSwitchIndex", &v13));
      if (!v13)
      {
        id v8 = +[PSYRegistrySingleton registry];
        objc_msgSend(v5, "setSyncSwitchIndex:", objc_msgSend(v8, "switchIndex"));
      }
      [v5 setPairingID:v4];
      [(NSMutableDictionary *)self->_syncStateCache setObject:v5 forKeyedSubscript:v4];
    }
    else
    {
      v9 = psd_log();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (v10)
      {
        id v11 = psd_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10001C7E0(v4);
        }
      }
      v5 = 0;
    }
  }

  return v5;
}

- (id)domainAccessorForPairingID:(id)a3
{
  id v3 = a3;
  id v4 = +[PSYRegistrySingleton registry];
  v5 = [v4 deviceForPairingID:v3];

  uint64_t v6 = [v5 pairingStorePath];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    id v9 = 0;
  }
  else {
    id v9 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.pairedsync" pairingID:v3 pairingDataStore:v6];
  }

  return v9;
}

- (void)setupListener
{
  id v3 = objc_alloc((Class)NSXPCListener);
  id v4 = (NSXPCListener *)[v3 initWithMachServiceName:PSYInitialSyncStateMachServiceName];
  listener = self->_listener;
  self->_listener = v4;

  [(NSXPCListener *)self->_listener setDelegate:self];
  uint64_t v6 = self->_listener;

  [(NSXPCListener *)v6 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 setExportedObject:self];
  BOOL v8 = PSYSyncStateProviderXPCInterface();
  [v7 setExportedInterface:v8];

  id v9 = PSYSyncStateObserverXPCInterface();
  [v7 setRemoteObjectInterface:v9];

  objc_initWeak(&location, v7);
  objc_initWeak(&from, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000C078;
  v19[3] = &unk_10002CA90;
  objc_copyWeak(&v20, &from);
  objc_copyWeak(&v21, &location);
  [v7 setInterruptionHandler:v19];
  queue = self->_queue;
  char v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_10000C0DC;
  id v16 = &unk_10002C8B8;
  v17 = self;
  id v11 = v7;
  id v18 = v11;
  dispatch_sync((dispatch_queue_t)queue, &v13);
  objc_msgSend(v11, "resume", v13, v14, v15, v16, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (void)connectionInterrupted:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C180;
  v7[3] = &unk_10002C8B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)requestDeviceSyncStateEntriesForPairingIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C250;
  block[3] = &unk_10002C908;
  id v12 = v6;
  char v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_queue_tellRemoteObserversDidCompleteSyncForPairingID:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_activeConnections;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v9), "remoteObjectProxy", (void)v11);
        [v10 didUpdateSyncForPairingID:v4];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_loadLegacySyncStateAndMigrateIfNeeded
{
  id v3 = [(PSDSyncStateManager *)self syncStatePersistentURL];
  id v4 = +[NSData dataWithContentsOfURL:v3 options:0 error:0];
  if (v4)
  {
    +[NSKeyedUnarchiver setClass:objc_opt_class() forClassName:@"PSDDeviceSyncState"];
    v5 = +[NSSet setWithObject:objc_opt_class()];
    id v6 = +[NSKeyedUnarchiver secureUnarchiveObjectOfClasses:v5 withData:v4];

    id v7 = [v6 pairingID];

    if (v7 && [v6 hasCompletedInitialSync])
    {
      uint64_t v8 = [v6 pairingID];
      [(PSDSyncStateManager *)self setSyncCompleteForPairingID:v8 withBlock:0];
    }
    id v9 = +[NSFileManager defaultManager];
    v15[0] = 0;
    unsigned __int8 v10 = [v9 removeItemAtURL:v3 error:v15];
    id v11 = v15[0];

    if ((v10 & 1) == 0)
    {
      long long v12 = psd_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (v13)
      {
        long long v14 = psd_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10001C87C((uint64_t)v3, v11);
        }
      }
    }
  }
}

- (id)syncStatePersistentURL
{
  v2 = +[PSDFileManager defaultManager];
  id v3 = [v2 storageURL];
  id v4 = [v3 URLByAppendingPathComponent:@"/syncState.state"];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_syncStateCache, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end