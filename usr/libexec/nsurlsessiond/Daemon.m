@interface Daemon
+ (id)sharedDaemon;
- (BOOL)applicationIsInstalled:(id)a3;
- (BOOL)isInSyncBubble;
- (BOOL)isPrivileged;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (Daemon)init;
- (NDUserSyncStakeholder)stakeholder;
- (OS_dispatch_queue)queue;
- (id)archivePath;
- (id)bundleIDsForAppProxies:(id)a3;
- (id)getSessionWithIdentifier:(id)a3 forBundleID:(id)a4;
- (void)addTransaction;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)archiveState;
- (void)createDaemonDirectory;
- (void)managerBecameEmpty:(id)a3 bundleID:(id)a4 withCompletionHandler:(id)a5;
- (void)releaseTransaction;
- (void)restoreState;
- (void)setInSyncBubble:(BOOL)a3;
- (void)setPrivileged:(BOOL)a3;
- (void)setStakeholder:(id)a3;
- (void)setupArchiveTimer;
- (void)setupNewClassMappingsForUnarchiver;
- (void)start;
- (void)waitUntilDeviceIsUnlocked;
@end

@implementation Daemon

- (id)archivePath
{
  v2 = +[NDFileUtilities nsurlsessiondPath];
  v3 = [v2 stringByAppendingPathComponent:@"bundles.plist"];

  return v3;
}

- (void)archiveState
{
  v3 = [(Daemon *)self archivePath];
  v4 = +[NSMutableDictionary dictionary];
  clients = self->_clients;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000068D4;
  v10[3] = &unk_1000B5E30;
  id v6 = v4;
  id v11 = v6;
  [(NSMutableDictionary *)clients enumerateKeysAndObjectsUsingBlock:v10];
  v7 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
  unsigned __int8 v8 = [v7 writeToFile:v3 atomically:1];

  if ((v8 & 1) == 0)
  {
    v9 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to write archive to path: %@", buf, 0xCu);
    }
  }
}

+ (id)sharedDaemon
{
  if (qword_1000CB118 != -1) {
    dispatch_once(&qword_1000CB118, &stru_1000B5DC8);
  }
  v2 = (void *)qword_1000CB120;

  return v2;
}

- (BOOL)isInSyncBubble
{
  return self->_inSyncBubble;
}

- (BOOL)isPrivileged
{
  return self->_privileged;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  id v6 = v5;
  long long v16 = 0u;
  long long v17 = 0u;
  if (v5) {
    [v5 auditToken];
  }
  uint64_t v15 = 0;
  long long v13 = v16;
  long long v14 = v17;
  CPCopyBundleIdentifierAndTeamFromAuditToken();
  v7 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Evaluating new XPC connection %@ with client bundle identifier %@", buf, 0x16u);
  }
  unsigned int v11 = [v6 processIdentifier];
  unsigned __int8 v8 = [v6 _xpcConnection];
  xpc_connection_is_extension();
  v9 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Process with pid %d does not have a bundle ID, rejecting connection", buf, 8u);
  }

  return 0;
}

- (void)addTransaction
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stakeholder, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionTasksDB, 0);
  objc_storeStrong((id *)&self->_archiveTimer, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

- (void)setStakeholder:(id)a3
{
}

- (NDUserSyncStakeholder)stakeholder
{
  return (NDUserSyncStakeholder *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInSyncBubble:(BOOL)a3
{
  self->_inSyncBubble = a3;
}

- (void)setPrivileged:(BOOL)a3
{
  self->_privileged = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)start
{
  if (![(Daemon *)self isInSyncBubble]) {
    [(Daemon *)self waitUntilDeviceIsUnlocked];
  }
  v3 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "nsurlsessiond started", buf, 2u);
  }
  v4 = +[NDUserEventAgentConnection sharedUserEventAgentConnection];
  [v4 start];

  [(Daemon *)self createDaemonDirectory];
  id v5 = +[NDStatusMonitor sharedMonitor];
  [v5 start];

  id v6 = +[_DASScheduler sharedScheduler];
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"ConnectionPoolLimit", @"com.apple.nsurlsessiond", 0);
  if (AppIntegerValue) {
    uint64_t v8 = AppIntegerValue;
  }
  else {
    uint64_t v8 = 3;
  }
  v9 = +[_DASActivityGroup groupWithName:@"NSURLSessionBackgroundPoolName" maxConcurrent:v8];
  [v6 createActivityGroup:v9];

  if ([(Daemon *)self isInSyncBubble])
  {
    v10 = +[NSString stringWithFormat:@"NSURLSessionBackgroundPoolName-sync-%d", geteuid()];
    CFIndex v11 = CFPreferencesGetAppIntegerValue(@"ConnectionPoolLimit", @"com.apple.nsurlsessiond", 0);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 3;
    }
    long long v13 = +[_DASActivityGroup groupWithName:v10 maxConcurrent:v12];
    [v6 createActivityGroup:v13];
  }
  notify_post("com.apple.nsurlsessiond.started");
}

- (void)waitUntilDeviceIsUnlocked
{
  if (MKBDeviceFormattedForContentProtection() && MKBDeviceUnlockedSinceBoot() != 1)
  {
    v2 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Waiting for first unlock", buf, 2u);
    }
    *(void *)buf = 0;
    v19 = buf;
    uint64_t v20 = 0x2020000000;
    int v21 = 0;
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    v4 = dispatch_queue_create("com.apple.nsurlsessiond.wait-unlock", 0);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10005E7C0;
    v16[3] = &unk_1000B6380;
    id v5 = v3;
    long long v17 = v5;
    id v6 = objc_retainBlock(v16);
    v7 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    uint64_t v8 = (int *)(v19 + 24);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005E858;
    handler[3] = &unk_1000B5F78;
    uint64_t v15 = buf;
    v9 = v6;
    id v14 = v9;
    if (notify_register_dispatch(v7, v8, v4, handler))
    {
      v10 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to regsiter for lock status notification! Calling abort()", v12, 2u);
      }
      abort();
    }
    dispatch_async(v4, v9);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005E880;
    block[3] = &unk_1000B5FA0;
    block[4] = buf;
    dispatch_sync(v4, block);

    _Block_object_dispose(buf, 8);
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005E954;
  v7[3] = &unk_1000B63D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005EBC8;
  v7[3] = &unk_1000B63D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)bundleIDsForAppProxies:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableSet set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v9 = [v8 bundleIdentifier];
        [v4 addObject:v9];
        v10 = [v8 plugInKitPlugins];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v19;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v11);
              }
              uint64_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)j) pluginIdentifier];
              [v4 addObject:v15];
            }
            id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  return v4;
}

- (void)releaseTransaction
{
}

- (void)managerBecameEmpty:(id)a3 bundleID:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F0FC;
  block[3] = &unk_1000B5F10;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (id)getSessionWithIdentifier:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = sub_10005F2F0;
  long long v21 = sub_10005F300;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005F308;
  v13[3] = &unk_1000B5EE8;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  long long v16 = &v17;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

- (void)setupArchiveTimer
{
  if (!self->_archiveTimer)
  {
    id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    archiveTimer = self->_archiveTimer;
    self->_archiveTimer = v3;

    id v5 = self->_archiveTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000C740;
    handler[3] = &unk_1000B6380;
    void handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    id v6 = self->_archiveTimer;
    dispatch_time_t v7 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v6, v7, 0x2540BE400uLL, 0x3B9ACA00uLL);
    dispatch_resume((dispatch_object_t)self->_archiveTimer);
  }
}

- (void)restoreState
{
  [(Daemon *)self setupNewClassMappingsForUnarchiver];
  v36 = +[NSMutableArray array];
  v38 = +[NSFileManager defaultManager];
  id v3 = [(Daemon *)self archivePath];
  v35 = sub_10000FB54((uint64_t)NSKeyedUnarchiver, v3);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v39 = v35;
    id v4 = [v39 allKeys];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v35;
    }
    else
    {
      if (v35)
      {
        id v5 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v35;
          _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Bundle ID Archive %@ has unexpected format", buf, 0xCu);
        }
      }
      id v4 = 0;
    }
    id v39 = 0;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v47;
    p_inst_props = &OBJC_PROTOCOL___NSCopying.inst_props;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        id v11 = +[NDFileUtilities bundleManagerPath:](NDFileUtilities, "bundleManagerPath:", v10, v35);
        if (v39)
        {
          id v12 = [v39 objectForKeyedSubscript:v10];
          uint64_t v13 = (uint64_t)[v12 BOOLValue];
        }
        else
        {
          uint64_t v13 = 1;
        }
        char v45 = 0;
        unsigned int v14 = [v38 fileExistsAtPath:v11 isDirectory:&v45];
        if (v45) {
          unsigned int v15 = v14;
        }
        else {
          unsigned int v15 = 0;
        }
        if (v15 == 1)
        {
          if (v13 && ![(Daemon *)self applicationIsInstalled:v10])
          {
            long long v20 = p_inst_props[41];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v53 = v10;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Application %@ is not installed, removing directory", buf, 0xCu);
            }
            +[NDFileUtilities removeItemAtPath:v11];
          }
          else
          {
            long long v16 = [[NDSessionManager alloc] initWithDelegate:self bundleID:v10 isSpringBoardApp:v13 forPersona:0 dataSeparatedPath:0 db:self->_sessionTasksDB];
            char v44 = 0;
            uint64_t v17 = [(NDSessionManager *)v16 restoreState:&v44];
            if (v44)
            {
              long long v18 = p_inst_props[41];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v53 = v10;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "NDSessionManager for client %@ was empty, not restoring", buf, 0xCu);
              }
            }
            else
            {
              [v36 addObjectsFromArray:v17];
              [(NSMutableDictionary *)self->_clients setObject:v16 forKeyedSubscript:v10];
            }

            p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___NSCopying + 56);
          }
        }
        else
        {
          uint64_t v19 = p_inst_props[41];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "No directory for bundleID: %@", buf, 0xCu);
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v6);
  }

  [(Daemon *)self archiveState];
  [v36 sortedArrayUsingComparator:&stru_1000B5E08];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = [v21 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v41;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(v21);
        }
        long long v25 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
        if ([(Daemon *)self isInSyncBubble])
        {
          if ([v25 taskKind] != (id)1) {
            continue;
          }
          v26 = [v25 originalRequest];
          [v26 _timeWindowDelay];
          BOOL v28 = v27 == 0.0;

          if (!v28) {
            continue;
          }
        }
        v29 = +[NDUserSyncStakeholder sharedStakeholder];
        v30 = [v25 uniqueIdentifier];
        [v29 restoredTaskEnqueued:v30];

        v31 = [v25 sessionID];
        v32 = [v25 bundleID];
        v33 = [(Daemon *)self getSessionWithIdentifier:v31 forBundleID:v32];

        [v33 requeueTask:[v25 identifier]];
      }
      id v22 = [v21 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v22);
  }

  v34 = +[NDUserSyncStakeholder sharedStakeholder];
  [v34 tasksHaveBeenEnqueued];
}

- (void)setupNewClassMappingsForUnarchiver
{
  uint64_t v2 = objc_opt_class();

  +[NSKeyedUnarchiver setClass:v2 forClassName:@"NDTaskInfo"];
}

- (BOOL)applicationIsInstalled:(id)a3
{
  id v3 = +[LSBundleRecord bundleRecordWithBundleIdentifier:a3 allowPlaceholder:0 error:0];
  BOOL v4 = v3 != 0;

  return v4;
}

- (Daemon)init
{
  v17.receiver = self;
  v17.super_class = (Class)Daemon;
  uint64_t v2 = [(Daemon *)&v17 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v3;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.nsurlsessiond.daemon-queue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.nsurlsessiond-xpc-transaction-queue", v10);
    transactionQueue = v2->_transactionQueue;
    v2->_transactionQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = +[LSApplicationWorkspace defaultWorkspace];
    [v13 addObserver:v2];

    id v14 = +[NDUserSyncStakeholder sharedStakeholder];
    archiveTimer = v2->_archiveTimer;
    v2->_archiveTimer = 0;
  }
  return v2;
}

- (void)createDaemonDirectory
{
  NSFileAttributeKey v29 = NSFileProtectionKey;
  NSFileProtectionType v30 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  BOOL v4 = +[NSFileManager defaultManager];
  char v22 = 0;
  id v5 = +[NDFileUtilities nsurlsessiondPath];
  unsigned int v6 = [v4 fileExistsAtPath:v5 isDirectory:&v22];

  if (v6)
  {
    if (v22)
    {
      dispatch_queue_t v7 = +[NDFileUtilities nsurlsessiondPath];
      id v21 = 0;
      unsigned __int8 v8 = [v4 setAttributes:v3 ofItemAtPath:v7 error:&v21];
      id v9 = v21;

      if ((v8 & 1) == 0)
      {
        id v10 = (id)qword_1000CB148;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = +[NDFileUtilities nsurlsessiondPath];
          id v20 = [v9 code];
          *(_DWORD *)buf = 138412802;
          long long v24 = v19;
          __int16 v25 = 2112;
          id v26 = v9;
          __int16 v27 = 2048;
          id v28 = v20;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not set attributes of directory at %@, error: %@ [%ld]", buf, 0x20u);
        }
      }
    }
    else
    {
      dispatch_queue_t v11 = (id)qword_1000CB148;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        long long v18 = +[NDFileUtilities nsurlsessiondPath];
        *(_DWORD *)buf = 138412290;
        long long v24 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Non-directory file exists at: %@. Removing it.", buf, 0xCu);
      }
      id v9 = +[NDFileUtilities nsurlsessiondPath];
      +[NDFileUtilities removeItemAtPath:v9];
    }
  }
  id v12 = +[NDFileUtilities nsurlsessiondPath];
  self->_createdDataVault = +[NDFileUtilities createDataVaultDirectoryAtPath:v12];

  uint64_t v13 = +[NDFileUtilities nsurlsessiondLaunchdPath];
  +[NDFileUtilities createDirectoryAtPath:v13];

  id v14 = +[NDFileUtilities nsurlsessiondPath];
  unsigned int v15 = +[NSURL fileURLWithPath:v14];

  long long v16 = [[NDTaskStorageDB alloc] _initDB:v15];
  sessionTasksDB = self->_sessionTasksDB;
  self->_sessionTasksDB = v16;
}

@end