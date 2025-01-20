@interface SYDDaemon
+ (id)containerForStoreType:(int64_t)a3 containerID:(id)a4 testConfiguration:(id)a5;
+ (id)defaultTestConfiguration;
+ (id)syncManagerLookupKeyForCurrentPersonaWithTestConfiguration:(id)a3;
- (ACAccountStore)accountStore;
- (BOOL)isInitializingSyncManagers;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)syncManager:(id)a3 shouldSyncStoreWithIdentifier:(id)a4;
- (NSMutableDictionary)syncManagersByPersona;
- (NSMutableSet)clientConnections;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)queue;
- (SYDDaemon)init;
- (SYDDaemon)initWithInitialStoreCreation:(BOOL)a3;
- (id)_queue_allSyncManagers;
- (id)allStoreIdentifiersWithError:(id *)a3;
- (id)allSyncManagers;
- (id)applicationIdentifiersForStoreIdentifiers:(id)a3;
- (id)connection:(id)a3 syncManagerForStoreID:(id)a4 error:(id *)a5;
- (id)syncManagerForStoreType:(int64_t)a3 containerID:(id)a4 testConfiguration:(id)a5 createIfNecessary:(BOOL)a6 error:(id *)a7;
- (void)_processAccountChanges;
- (void)connectionDidInvalidate:(id)a3;
- (void)initializeKnownSyncManagers;
- (void)processAccountChanges;
- (void)registerForPeriodAnalyticsXPCActivity;
- (void)removeInvalidSyncManagers;
- (void)sendAnalyticsEventForCurrentState;
- (void)setClientConnections:(id)a3;
- (void)setInitializingSyncManagers:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSyncManagersByPersona:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)start;
- (void)uploadContent;
- (void)willSwitchUser;
@end

@implementation SYDDaemon

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [(SYDDaemon *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000045F8;
  v9[3] = &unk_100050AA0;
  id v10 = v5;
  v11 = self;
  id v7 = v5;
  dispatch_sync(v6, v9);

  return 1;
}

- (NSMutableSet)clientConnections
{
  return self->_clientConnections;
}

- (id)connection:(id)a3 syncManagerForStoreID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_100010ED4;
  v29 = sub_100010E9C;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100010ED4;
  v23 = sub_100010E9C;
  id v24 = 0;
  id v10 = [(SYDDaemon *)self queue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000A18C;
  v14[3] = &unk_100050B40;
  id v11 = v9;
  id v15 = v11;
  v16 = self;
  v17 = &v19;
  v18 = &v25;
  dispatch_sync(v10, v14);

  if (a5) {
    *a5 = (id) v26[5];
  }
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)syncManagerForStoreType:(int64_t)a3 containerID:(id)a4 testConfiguration:(id)a5 createIfNecessary:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  if (sub_10000AC84())
  {
    v14 = [(id)objc_opt_class() syncManagerLookupKeyForCurrentPersonaWithTestConfiguration:v13];
    id v15 = SYDGetConnectionLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v48 = sub_10000AC60(a3);
      *(_DWORD *)buf = 138412802;
      v75 = v14;
      __int16 v76 = 2112;
      v77 = v48;
      __int16 v78 = 2112;
      id v79 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Getting sync manager for lookup key=%@ storeType=%@ container=%@", buf, 0x20u);
    }
    v16 = [(SYDDaemon *)self syncManagersByPersona];
    v17 = [v16 objectForKeyedSubscript:v14];

    if (!v17)
    {
      v17 = +[NSMutableDictionary dictionary];
      v18 = [(SYDDaemon *)self syncManagersByPersona];
      [v18 setObject:v17 forKeyedSubscript:v14];
    }
    uint64_t v19 = [v17 objectForKeyedSubscript:v12];
    id v20 = 0;
    if (v19 || !v8) {
      goto LABEL_55;
    }
    uint64_t v21 = SYDGetConnectionLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v14;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "No existing sync manager, creating now for lookupKey=%@", buf, 0xCu);
    }

    v22 = [(id)objc_opt_class() containerForStoreType:a3 containerID:v12 testConfiguration:v13];
    id v71 = 0;
    v23 = sub_100018990(v12, v13, &v71);
    id v20 = v71;
    v62 = v23;
    if (v20)
    {
      id v24 = SYDGetConnectionLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10002F334();
      }

      if (a7)
      {
        id v20 = v20;
        uint64_t v19 = 0;
        *a7 = v20;
      }
      else
      {
        uint64_t v19 = 0;
      }
      goto LABEL_54;
    }
    v61 = v22;
    unsigned __int8 v56 = [v23 checkResourceIsReachableAndReturnError:0];
    if (v56) {
      goto LABEL_30;
    }
    id v70 = 0;
    v26 = sub_100018B68(v12, &v70);
    id v27 = v70;
    if (v27)
    {
      v28 = SYDGetConnectionLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10002F2C0();
      }

      v23 = v62;
    }
    v59 = v27;
    id v20 = 0;
    if (![v26 checkResourceIsReachableAndReturnError:0])
    {
LABEL_29:

LABEL_30:
      v54 = v14;
      NSFileAttributeKey v72 = NSFileProtectionKey;
      NSFileProtectionType v73 = NSFileProtectionCompleteUntilFirstUserAuthentication;
      uint64_t v31 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1, v53);
      uint64_t v32 = [v23 URLByDeletingLastPathComponent];
      v33 = +[NSFileManager defaultManager];
      id v66 = v20;
      v57 = (void *)v32;
      v60 = (void *)v31;
      LOBYTE(v32) = [v33 createDirectoryAtURL:v32 withIntermediateDirectories:1 attributes:v31 error:&v66];
      id v34 = v66;

      if ((v32 & 1) == 0)
      {
        v35 = SYDGetConnectionLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
          sub_10002F038();
        }
      }
      v36 = +[NSFileManager defaultManager];
      v37 = [v57 path];
      id v65 = v34;
      unsigned __int8 v38 = [v36 setAttributes:v60 ofItemAtPath:v37 error:&v65];
      id v20 = v65;

      if ((v38 & 1) == 0)
      {
        v39 = SYDGetConnectionLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
          sub_10002EFD0();
        }
      }
      v40 = sub_10000B284(a3);
      v41 = [[SYDCoreDataStore alloc] initWithURL:v62 fileProtectionType:v40];
      if ((v56 & 1) == 0)
      {
        v42 = SYDGetConnectionLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Will set initial account identifier", buf, 2u);
        }

        dispatch_time_t v43 = dispatch_time(0, 500000000);
        v44 = dispatch_get_global_queue(0, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100013994;
        block[3] = &unk_100050AA0;
        block[4] = self;
        v64 = v41;
        dispatch_after(v43, v44, block);
      }
      if (!a3 && (sub_10000AD74() & 1) == 0) {
        +[SYDPlistToCoreDataMigrator migrateAllPlistsIfNecessaryToCoreDataStore:v41 deleteMigratedPlists:1 error:0];
      }
      uint64_t v19 = [[SYDSyncManager alloc] initWithContainer:v61 coreDataStore:v41 storeType:a3 testConfiguration:v13];
      [(SYDSyncManager *)v19 setDelegate:self];
      [v17 setObject:v19 forKeyedSubscript:v12];
      v45 = SYDGetConnectionLog();
      v14 = v54;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v19;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Created sync manager %@", buf, 0xCu);
      }

      if (![(SYDDaemon *)self isInitializingSyncManagers])
      {
        v46 = SYDGetConnectionLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
          sub_10002EF68();
        }
      }
LABEL_52:
      v22 = v61;
LABEL_54:

LABEL_55:
      goto LABEL_56;
    }
    v29 = SYDGetConnectionLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Need to migrate old store", buf, 2u);
    }

    id v69 = 0;
    char v30 = sub_100017F40(&v69);
    id v20 = v69;
    if (v30)
    {
LABEL_28:
      v23 = v62;
      goto LABEL_29;
    }
    id v68 = 0;
    v55 = v26;
    HIDWORD(v53) = [v26 checkResourceIsReachableAndReturnError:&v68];
    id v49 = v68;
    id v67 = 0;
    LODWORD(v53) = [v62 checkResourceIsReachableAndReturnError:&v67];
    unint64_t v50 = (unint64_t)v67;
    if (sub_100017C38(v49))
    {

      uint64_t v58 = 0;
    }
    else
    {
      uint64_t v58 = (uint64_t)v49;
    }
    v26 = v55;
    if (sub_100017C38((void *)v50))
    {

      unint64_t v50 = 0;
    }
    if (v58 | v50)
    {
      v51 = SYDGetConnectionLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
        sub_10002F0A0(v58);
      }
    }
    else
    {
      if ((HIDWORD(v53) ^ 1 | v53))
      {
        if ((HIDWORD(v53) ^ 1 | v53 ^ 1))
        {
          if ((HIDWORD(v53) | v53))
          {
            if ((HIDWORD(v53) | v53 ^ 1)) {
              goto LABEL_28;
            }
            v52 = SYDGetConnectionLog();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
              sub_10002F120();
            }
          }
          else
          {
            v52 = SYDGetConnectionLog();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
              sub_10002F188();
            }
          }
        }
        else
        {
          v52 = SYDGetConnectionLog();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
            sub_10002F1F0();
          }
        }

        id v20 = 0;
        goto LABEL_28;
      }
      v51 = SYDGetConnectionLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
        sub_10002F258();
      }
    }

    if (a7) {
      *a7 = v20;
    }

    uint64_t v19 = 0;
    goto LABEL_52;
  }
  uint64_t v25 = SYDGetConnectionLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v75) = a3;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Not creating sync manager for store type %d because it is not supported", buf, 8u);
  }

  uint64_t v19 = 0;
  if (a7) {
    *a7 = 0;
  }
LABEL_56:

  return v19;
}

- (NSMutableDictionary)syncManagersByPersona
{
  return self->_syncManagersByPersona;
}

+ (id)syncManagerLookupKeyForCurrentPersonaWithTestConfiguration:(id)a3
{
  id v3 = a3;
  if (!sub_10000AD74())
  {
    id v5 = @"PersonalPersona";
    if (!v3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v4 = +[UMUserPersona currentPersona];
  id v5 = [v4 userPersonaUniqueString];

  if (v3)
  {
LABEL_5:
    v6 = [v3 testServerName];
    id v7 = [v3 testDeviceID];
    uint64_t v8 = [(__CFString *)v5 stringByAppendingFormat:@"::%@::%@", v6, v7];

    id v5 = (__CFString *)v8;
  }
LABEL_6:

  return v5;
}

- (SYDDaemon)init
{
  return [(SYDDaemon *)self initWithInitialStoreCreation:1];
}

- (SYDDaemon)initWithInitialStoreCreation:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SYDDaemon;
  v4 = [(SYDDaemon *)&v15 init];
  if (v4)
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    syncManagersByPersona = v4->_syncManagersByPersona;
    v4->_syncManagersByPersona = v5;

    id v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clientConnections = v4->_clientConnections;
    v4->_clientConnections = v7;

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.kvs.daemon.queue", v9);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v10;

    if (v3) {
      [(SYDDaemon *)v4 initializeKnownSyncManagers];
    }
    id v12 = SYDGetMiscLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10002EBF4();
    }

    id v13 = +[UMUserManager sharedManager];
    [v13 registerUserSyncStakeholder:v4 withMachServiceName:@"com.apple.syncdefaultsd.usermanager.sync"];
  }
  return v4;
}

- (void)start
{
  BOOL v3 = SYDGetConnectionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002EC28();
  }

  id v4 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.kvsd"];
  [(SYDDaemon *)self setXpcListener:v4];

  id v5 = [(SYDDaemon *)self xpcListener];
  [v5 setDelegate:self];

  v6 = [(SYDDaemon *)self xpcListener];
  [v6 resume];

  [(SYDDaemon *)self registerForPeriodAnalyticsXPCActivity];
}

- (id)allSyncManagers
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  dispatch_queue_t v10 = sub_100010ED4;
  id v11 = sub_100010E9C;
  id v12 = 0;
  BOOL v3 = [(SYDDaemon *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100012720;
  v6[3] = &unk_100050AC8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_queue_allSyncManagers
{
  BOOL v3 = [(SYDDaemon *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[NSMutableSet set];
  id v5 = [(SYDDaemon *)self syncManagersByPersona];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001285C;
  v9[3] = &unk_100050B18;
  id v10 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  uint64_t v7 = [v6 allObjects];

  return v7;
}

- (ACAccountStore)accountStore
{
  return (ACAccountStore *)+[ACAccountStore defaultStore];
}

- (void)connectionDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDDaemon *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000129B0;
  v7[3] = &unk_100050AA0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)processAccountChanges
{
  BOOL v3 = [(SYDDaemon *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012AA0;
  block[3] = &unk_100050A50;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_processAccountChanges
{
  v2 = [(SYDDaemon *)self queue];
  dispatch_assert_queue_V2(v2);

  BOOL v3 = SYDGetConnectionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Processing account changes", buf, 2u);
  }

  uint64_t v55 = 0;
  unsigned __int8 v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  *(void *)buf = 0;
  unint64_t v50 = buf;
  uint64_t v51 = 0x3032000000;
  v52 = sub_100010ED4;
  uint64_t v53 = sub_100010E9C;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_100010ED4;
  v47 = sub_100010E9C;
  id v48 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v4 = [(SYDDaemon *)self _queue_allSyncManagers];
  id v5 = [v4 countByEnumeratingWithState:&v37 objects:v63 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v38;
    *(void *)&long long v6 = 138412290;
    long long v26 = v6;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v8);
        id v10 = SYDGetConnectionLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v61 = v26;
          v62 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Processing account changes for sync manager %@", v61, 0xCu);
        }

        id v11 = [v9 personaUniqueString];
        if (v11)
        {
          id v12 = +[UMUserPersonaAttributes personaAttributesForPersonaUniqueString:v11];
          if (v12) {
            goto LABEL_12;
          }
        }
        else
        {
          id v12 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
          id v11 = [v12 userPersonaUniqueString];
          if (v12)
          {
LABEL_12:
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_100013104;
            v36[3] = &unk_100050B68;
            v36[4] = self;
            v36[5] = v9;
            v36[6] = &v55;
            v36[7] = v41;
            v36[8] = buf;
            v36[9] = &v43;
            sub_100018CC4(v11, v36);
            goto LABEL_17;
          }
        }
        id v13 = SYDGetConnectionLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v61 = v26;
          v62 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Persona doesn't exist for sync manager %@", v61, 0xCu);
        }

LABEL_17:
        id v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v37 objects:v63 count:16];
    }
    while (v5);
  }

  [(SYDDaemon *)self removeInvalidSyncManagers];
  [(SYDDaemon *)self initializeKnownSyncManagers];
  if (*((unsigned char *)v56 + 24))
  {
    v14 = SYDGetConnectionLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v61 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "The account did change, will notify clients and tell the sync engine", v61, 2u);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    objc_super v15 = [(SYDDaemon *)self clientConnections];
    id v16 = [v15 countByEnumeratingWithState:&v32 objects:v60 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v33;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "notifyAccountDidChangeFromAccountID:toAccountID:completionHandler:", *((void *)v50 + 5), v44[5], 0, v26);
        }
        id v16 = [v15 countByEnumeratingWithState:&v32 objects:v60 count:16];
      }
      while (v16);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v19 = [(SYDDaemon *)self _queue_allSyncManagers];
    id v20 = [v19 countByEnumeratingWithState:&v28 objects:v59 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v29;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v19);
          }
          v23 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
          id v24 = SYDGetConnectionLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v61 = 138412290;
            v62 = v23;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Will tell sync engine to reload the account for sync manager %@", v61, 0xCu);
          }

          uint64_t v25 = [v23 engine];
          [v25 setNeedsToReloadAccount:1];
        }
        id v20 = [v19 countByEnumeratingWithState:&v28 objects:v59 count:16];
      }
      while (v20);
    }
  }
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v55, 8);
}

- (BOOL)syncManager:(id)a3 shouldSyncStoreWithIdentifier:(id)a4
{
  id v4 = a4;
  id v5 = +[SYDStoreBundleMap sharedInstance];
  unsigned __int8 v6 = [v5 shouldSyncStoreWithIdentifier:v4];

  return v6;
}

- (id)applicationIdentifiersForStoreIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v12 = +[SYDStoreBundleMap sharedInstance];
        id v13 = [v12 bundleIdentifiersForStoreIdentifier:v11];

        if (v13) {
          [v5 addObjectsFromArray:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  v14 = [(SYDDaemon *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013710;
  block[3] = &unk_100050B90;
  block[4] = self;
  id v15 = v6;
  id v21 = v15;
  id v16 = v5;
  id v22 = v16;
  dispatch_sync(v14, block);

  if (![v16 count])
  {
    uint64_t v17 = SYDGetConnectionLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10002EF00();
    }
  }
  v18 = [v16 allObjects];

  return v18;
}

- (void)initializeKnownSyncManagers
{
  BOOL v3 = SYDGetMiscLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002F3A8();
  }

  [(SYDDaemon *)self setInitializingSyncManagers:1];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = +[UMUserManager sharedManager];
  id v5 = [v4 listAllPersonaWithAttributes];

  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v11 = (unint64_t)[v10 userPersonaType];
        if (v11 <= 6 && ((1 << v11) & 0x45) != 0)
        {
          id v13 = [v10 userPersonaUniqueString];
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100013C60;
          v14[3] = &unk_100050AA0;
          void v14[4] = v10;
          v14[5] = self;
          sub_100018CC4(v13, v14);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [(SYDDaemon *)self setInitializingSyncManagers:0];
}

- (void)removeInvalidSyncManagers
{
  BOOL v3 = +[NSMutableSet set];
  id v4 = [(SYDDaemon *)self syncManagersByPersona];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100013FC8;
  v9[3] = &unk_100050B18;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  if ([v5 count])
  {
    id v6 = SYDGetConnectionLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Forgetting about sync managers for account identifiers: %@", buf, 0xCu);
    }

    id v7 = [(SYDDaemon *)self syncManagersByPersona];
    uint64_t v8 = [v5 allObjects];
    [v7 removeObjectsForKeys:v8];
  }
}

+ (id)containerForStoreType:(int64_t)a3 containerID:(id)a4 testConfiguration:(id)a5
{
  id v7 = a4;
  id v8 = objc_alloc_init((Class)CKContainerOptions);
  uint64_t v9 = v8;
  if (!a3) {
    [v8 setUseClearAssetEncryption:1];
  }
  if (a5 && qword_10005BAE0 != -1) {
    dispatch_once(&qword_10005BAE0, &stru_100050BD8);
  }
  id v10 = [objc_alloc((Class)CKContainer) initWithContainerID:v7 options:v9];

  unint64_t v11 = +[UMUserPersona currentPersona];
  id v12 = [v11 userPersonaUniqueString];
  [v10 setPersonaIdentifier:v12];

  return v10;
}

+ (id)defaultTestConfiguration
{
  id v2 = [objc_alloc((Class)SYDTestConfiguration) initWithTestServerName:@"CloudKeyValues" testDeviceID:@"DefaultDevice"];
  return v2;
}

- (id)allStoreIdentifiersWithError:(id *)a3
{
  id v20 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = sub_100010ED4;
  long long v33 = sub_100010E9C;
  id v34 = 0;
  id v5 = [(SYDDaemon *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014704;
  block[3] = &unk_100050AC8;
  block[4] = self;
  void block[5] = &v29;
  dispatch_sync(v5, block);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)v30[5];
  id v6 = 0;
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v35 count:16];
  if (v7)
  {
    uint64_t v22 = *(void *)v25;
    do
    {
      id v8 = 0;
      uint64_t v9 = v6;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v8);
        unint64_t v11 = objc_msgSend(v10, "coreDataStore", v20);
        id v23 = v9;
        id v12 = [v11 allStoreIdentifiersWithError:&v23];
        id v6 = v23;

        id v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 storeType]);
        v14 = [v4 objectForKeyedSubscript:v13];

        if (v14)
        {
          uint64_t v15 = [v12 arrayByAddingObjectsFromArray:v14];

          id v12 = (void *)v15;
        }
        long long v16 = [v12 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
        long long v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 storeType]);
        [v4 setObject:v16 forKeyedSubscript:v17];

        id v8 = (char *)v8 + 1;
        uint64_t v9 = v6;
      }
      while (v7 != v8);
      id v7 = [obj countByEnumeratingWithState:&v24 objects:v35 count:16];
    }
    while (v7);
  }

  if (v20) {
    id *v20 = v6;
  }
  id v18 = objc_msgSend(v4, "copy", v20);

  _Block_object_dispose(&v29, 8);
  return v18;
}

- (void)registerForPeriodAnalyticsXPCActivity
{
  BOOL v3 = SYDGetAnalyticsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002F520();
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100014804;
  handler[3] = &unk_100050C00;
  handler[4] = self;
  xpc_activity_register("com.apple.kvs.periodic-analytics", XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)sendAnalyticsEventForCurrentState
{
  BOOL v3 = SYDGetAnalyticsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002F5BC();
  }

  uint64_t v53 = 0;
  id v54 = &v53;
  uint64_t v55 = 0x3032000000;
  unsigned __int8 v56 = sub_100010ED4;
  uint64_t v57 = sub_100010E9C;
  id v58 = 0;
  id v4 = [(SYDDaemon *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014FEC;
  block[3] = &unk_100050AC8;
  block[4] = self;
  void block[5] = &v53;
  dispatch_sync(v4, block);

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = (id)v54[5];
  id v36 = [obj countByEnumeratingWithState:&v48 objects:v68 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v49;
    *(void *)&long long v5 = 138412290;
    long long v33 = v5;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v49 != v35) {
          objc_enumerationMutation(obj);
        }
        char v42 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        id v6 = objc_msgSend(v42, "coreDataStore", v33);
        id v7 = [v6 allStoreIdentifiersWithError:0];

        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v38 = v7;
        id v8 = [v38 countByEnumeratingWithState:&v44 objects:v67 count:16];
        if (v8)
        {
          uint64_t v41 = 0;
          uint64_t v39 = *(void *)v45;
          do
          {
            uint64_t v9 = 0;
            id v40 = v8;
            do
            {
              if (*(void *)v45 != v39) {
                objc_enumerationMutation(v38);
              }
              id v10 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v9);
              unint64_t v11 = [v42 coreDataStore];
              id v12 = [v11 numberOfKeyValuesInStoreWithIdentifier:v10 error:0];

              id v13 = v10;
              uint64_t v43 = v13;
              if (([(__CFString *)v13 hasPrefix:@"com.apple."] & 1) == 0)
              {
                uint64_t v43 = v13;
                if (arc4random_uniform(0x3E8u) != 13)
                {

                  uint64_t v43 = @"ThirdPartyStore";
                }
              }
              v65[0] = @"containerIdentifier";
              v14 = [v42 container];
              uint64_t v15 = [v14 containerIdentifier];
              v66[0] = v15;
              v65[1] = @"containerEnvironment";
              long long v16 = [v42 container];
              long long v17 = [v16 containerID];
              id v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v17 environment]);
              v66[1] = v18;
              v66[2] = v43;
              v65[2] = @"storeIdentifier";
              v65[3] = @"keyValueCount";
              uint64_t v19 = +[NSNumber numberWithUnsignedInteger:v12];
              v66[3] = v19;
              id v20 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:4];

              id v21 = SYDGetAnalyticsLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v62 = v13;
                __int16 v63 = 2112;
                v64 = v20;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Store state for %@: %@", buf, 0x16u);
              }

              AnalyticsSendEvent();
              v41 += (uint64_t)v12;
              uint64_t v9 = (char *)v9 + 1;
            }
            while (v40 != v9);
            id v8 = [v38 countByEnumeratingWithState:&v44 objects:v67 count:16];
          }
          while (v8);
        }
        else
        {
          uint64_t v41 = 0;
        }

        v59[0] = @"containerIdentifier";
        uint64_t v22 = [v42 container];
        id v23 = [v22 containerIdentifier];
        v60[0] = v23;
        v59[1] = @"containerEnvironment";
        long long v24 = [v42 container];
        long long v25 = [v24 containerID];
        long long v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v25 environment]);
        v60[1] = v26;
        v59[2] = @"storeCount";
        long long v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v38 count]);
        v60[2] = v27;
        v59[3] = @"keyValueCount";
        long long v28 = +[NSNumber numberWithUnsignedInteger:v41];
        v60[3] = v28;
        v59[4] = @"databaseSizeBytes";
        uint64_t v29 = [v42 coreDataStore];
        long long v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v29 fileSizeBytes]);
        v60[4] = v30;
        uint64_t v31 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:5];

        long long v32 = SYDGetAnalyticsLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v33;
          v62 = v31;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Container state: %@", buf, 0xCu);
        }

        AnalyticsSendEvent();
      }
      id v36 = [obj countByEnumeratingWithState:&v48 objects:v68 count:16];
    }
    while (v36);
  }

  _Block_object_dispose(&v53, 8);
}

- (void)willSwitchUser
{
  BOOL v3 = SYDGetMiscLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002F5F0();
  }

  id v4 = [(SYDDaemon *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000150EC;
  block[3] = &unk_100050A50;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (void)uploadContent
{
  BOOL v3 = [(SYDDaemon *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000152D0;
  block[3] = &unk_100050A50;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (BOOL)isInitializingSyncManagers
{
  return self->_initializingSyncManagers;
}

- (void)setInitializingSyncManagers:(BOOL)a3
{
  self->_initializingSyncManagers = a3;
}

- (void)setClientConnections:(id)a3
{
}

- (void)setSyncManagersByPersona:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncManagersByPersona, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end