@interface NRLaunchDaemon
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NRLaunchDaemon)init;
- (NSPointerArray)xpcClients;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)launchdQueue;
- (id)_enableAltOnlyDaemons:(BOOL)a3;
- (id)_enableNanoDaemons:(unint64_t)a3;
- (id)deletePairedStoreWithUUID:(id)a3;
- (id)getLocalPairingStorePairingID:(id)a3;
- (id)getLocalPairingStorePath;
- (id)launchDaemonsPaths;
- (void)chownWhine:(id)a3;
- (void)dealloc;
- (void)setLaunchdQueue:(id)a3;
- (void)setXpcClients:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)xpcCheckIfFlaggedForRecoveryWithCompletion:(id)a3;
- (void)xpcCleanupPairingStoreWithUUIDs:(id)a3 withCompletion:(id)a4;
- (void)xpcClearRecoveryFlagWithCompletion:(id)a3;
- (void)xpcDeletePairedStoreWithUUID:(id)a3 withCompletion:(id)a4;
- (void)xpcDeleteQuarantinedDataWithStoreUUID:(id)a3 completion:(id)a4;
- (void)xpcEnableAltOnlyNanoDaemons:(BOOL)a3 withCompletion:(id)a4;
- (void)xpcEnableNanoDaemons:(unint64_t)a3 withCompletion:(id)a4;
- (void)xpcGetBackupHashWithCompletion:(id)a3;
- (void)xpcQuarantineDataWithStoreUUID:(id)a3 services:(id)a4 completion:(id)a5;
- (void)xpcStartListener;
- (void)xpcUnquarantineDataWithStoreUUID:(id)a3 services:(id)a4 completion:(id)a5;
@end

@implementation NRLaunchDaemon

- (NRLaunchDaemon)init
{
  v8.receiver = self;
  v8.super_class = (Class)NRLaunchDaemon;
  v2 = [(NRLaunchDaemon *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nanoregistry.nanoregistrylaunchd", v4);
    launchdQueue = v2->_launchdQueue;
    v2->_launchdQueue = (OS_dispatch_queue *)v5;

    [(NRLaunchDaemon *)v2 xpcStartListener];
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002124;
  block[3] = &unk_1000082A0;
  block[4] = a1;
  if (qword_10000CE88 != -1) {
    dispatch_once(&qword_10000CE88, block);
  }
  v2 = (void *)qword_10000CE80;

  return v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_xpcListener invalidate];
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(NRLaunchDaemon *)self xpcClients];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      objc_super v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if (v9) {
          [v9 invalidate];
        }
        objc_super v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)NRLaunchDaemon;
  [(NRLaunchDaemon *)&v10 dealloc];
}

- (void)xpcStartListener
{
  v3 = +[NSPointerArray weakObjectsPointerArray];
  xpcClients = self->_xpcClients;
  self->_xpcClients = v3;

  id v5 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.nano.nanoregistry.nanoregistrylaunchd"];
  xpcListener = self->_xpcListener;
  self->_xpcListener = v5;

  [(NSXPCListener *)self->_xpcListener setDelegate:self];
  uint64_t v7 = self->_xpcListener;

  [(NSXPCListener *)v7 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [v5 valueForEntitlement:@"com.apple.nano.nanoregistry.nanoregistrylaunchd"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 BOOLValue])
  {
    [v5 setExportedObject:self];
    uint64_t v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NRLaunchDaemonXPCDaemonDelegate];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_super v8 = +[NSArray arrayWithObjects:v20 count:2];
    v9 = +[NSSet setWithArray:v8];
    [v7 setClasses:v9 forSelector:"xpcQuarantineDataWithStoreUUID:services:completion:" argumentIndex:0 ofReply:0];

    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_super v10 = +[NSArray arrayWithObjects:v19 count:2];
    long long v11 = +[NSSet setWithArray:v10];
    [v7 setClasses:v11 forSelector:"xpcCleanupPairingStoreWithUUIDs:withCompletion:" argumentIndex:0 ofReply:0];

    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    long long v12 = +[NSArray arrayWithObjects:v18 count:2];
    long long v13 = +[NSSet setWithArray:v12];
    BOOL v14 = 1;
    [v7 setClasses:v13 forSelector:"xpcUnquarantineDataWithStoreUUID:services:completion:" argumentIndex:1 ofReply:0];

    [v5 setExportedInterface:v7];
    [v5 resume];
    [(NSPointerArray *)self->_xpcClients compact];
    [(NSPointerArray *)self->_xpcClients addPointer:v5];
  }
  else
  {
    v15 = nr_root_daemon_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

    if (!v16)
    {
      BOOL v14 = 0;
      goto LABEL_10;
    }
    uint64_t v7 = nr_root_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000057A4(v7);
    }
    BOOL v14 = 0;
  }

LABEL_10:
  return v14;
}

- (id)launchDaemonsPaths
{
  v2 = objc_opt_new();
  v15[0] = @"/System/Library/NanoLaunchDaemons";
  v15[1] = @"/System/Library/NanoLaunchDaemonsAltAccount";
  +[NSArray arrayWithObjects:v15 count:2];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = objc_msgSend(@"/", "stringByAppendingPathComponent:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        [v2 addObject:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (void)xpcEnableAltOnlyNanoDaemons:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  launchdQueue = self->_launchdQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000027D8;
  block[3] = &unk_1000082C8;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)launchdQueue, block);
}

- (id)_enableAltOnlyDaemons:(BOOL)a3
{
  return 0;
}

- (void)xpcEnableNanoDaemons:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  launchdQueue = self->_launchdQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000028EC;
  block[3] = &unk_1000082F0;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)launchdQueue, block);
}

- (id)_enableNanoDaemons:(unint64_t)a3
{
  id v4 = (void *)CFPreferencesCopyValue(@"StoreDemoMode", @"com.apple.demo-settings", @"mobile", kCFPreferencesAnyHost);
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v6 = [(NRLaunchDaemon *)self launchDaemonsPaths];
    goto LABEL_33;
  }
  unsigned __int8 v5 = [v4 BOOLValue];
  id v6 = [(NRLaunchDaemon *)self launchDaemonsPaths];
  if ((v5 & 1) == 0)
  {
LABEL_33:
    if (![v6 count])
    {
      id v78 = 0;
      goto LABEL_87;
    }
    v76 = v4;
    unint64_t v32 = 0;
    id v78 = 0;
    while (1)
    {
      if (v32)
      {
        if (v32 != 1)
        {
          int v33 = 0;
          goto LABEL_42;
        }
        if (a3 - 1 < 2) {
          goto LABEL_38;
        }
      }
      else if (a3 == 1)
      {
LABEL_38:
        int v33 = 1;
        CFStringRef v34 = @"launch_enable_directory";
        goto LABEL_43;
      }
      int v33 = 0;
LABEL_42:
      CFStringRef v34 = @"launch_disable_directory";
LABEL_43:
      v35 = [v6 objectAtIndexedSubscript:v32];
      v36 = +[NSString stringWithFormat:@"%@(\"%@\")", v34, v35];

      v37 = nr_root_daemon_log();
      BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);

      if (v38)
      {
        v39 = nr_root_daemon_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v98 = v36;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Calling %{public}@", buf, 0xCu);
        }
      }
      v40 = +[NSDate date];
      v41 = v6;
      id v42 = [v6 objectAtIndexedSubscript:v32];
      [v42 cStringUsingEncoding:4];
      if (v33) {
        uint64_t v43 = launch_enable_directory();
      }
      else {
        uint64_t v43 = launch_disable_directory();
      }
      uint64_t v44 = v43;

      v45 = +[NSDate date];
      [v45 timeIntervalSinceDate:v40];
      v47 = +[NSString stringWithFormat:@"%@ duration: %1.3f returned %d", v36, v46, v44];

      v48 = nr_root_daemon_log();
      v49 = v48;
      if (v44)
      {
        BOOL v50 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);

        if (v50)
        {
          v51 = nr_root_daemon_log();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v98 = v47;
            _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }
        }
        if (v78) {
          goto LABEL_61;
        }
        NSErrorUserInfoKey v93 = NSLocalizedDescriptionKey;
        v94 = v47;
        v52 = +[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
        id v78 = +[NSError errorWithDomain:@"com.apple.nanoregistry.pairingerror" code:5 userInfo:v52];
        goto LABEL_60;
      }
      BOOL v53 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);

      if (v53)
      {
        v52 = nr_root_daemon_log();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v98 = v47;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
LABEL_60:
      }
LABEL_61:

      ++v32;
      id v6 = v41;
      if (v32 >= (unint64_t)[v41 count])
      {
        id v4 = v76;
        goto LABEL_87;
      }
    }
  }
  uint64_t v7 = +[NSMutableDictionary dictionary];
  id v8 = v6;
  v75 = v4;
  if ([v6 count])
  {
    unint64_t v9 = 0;
    id v78 = 0;
    unint64_t v10 = a3 - 1;
    BOOL v82 = a3 == 1;
    BOOL v79 = v10 < 2;
    do
    {
      if (v9 == 1)
      {
        BOOL v11 = v79;
      }
      else if (v9)
      {
        BOOL v11 = 0;
      }
      else
      {
        BOOL v11 = v82;
      }
      long long v12 = nr_root_daemon_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        BOOL v14 = nr_root_daemon_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = [v6 objectAtIndexedSubscript:v9];
          *(_DWORD *)buf = 138543362;
          v98 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Scanning NanoLaunchDaemons directory at %{public}@", buf, 0xCu);
        }
      }
      BOOL v16 = +[NSFileManager defaultManager];
      v17 = [v6 objectAtIndexedSubscript:v9];
      if (v78)
      {
        v18 = [v16 contentsOfDirectoryAtPath:v17 error:0];
      }
      else
      {
        id v92 = 0;
        v18 = [v16 contentsOfDirectoryAtPath:v17 error:&v92];
        id v78 = v92;
      }

      if (!v18)
      {
        v19 = nr_root_daemon_log();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

        if (v20)
        {
          v21 = nr_root_daemon_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v31 = [v8 objectAtIndexedSubscript:v9];
            *(_DWORD *)buf = 138543362;
            v98 = v31;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to scan NanoLaunchDaemons directory at %{public}@", buf, 0xCu);
          }
        }
      }
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v22 = v18;
      id v23 = [v22 countByEnumeratingWithState:&v88 objects:v96 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v89;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v89 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v88 + 1) + 8 * i);
            v28 = [v8 objectAtIndexedSubscript:v9];
            v29 = [v28 stringByAppendingPathComponent:v27];

            v30 = +[NSNumber numberWithBool:v11];
            [v7 setObject:v30 forKeyedSubscript:v29];
          }
          id v24 = [v22 countByEnumeratingWithState:&v88 objects:v96 count:16];
        }
        while (v24);
      }

      ++v9;
      id v6 = v8;
    }
    while (v9 < (unint64_t)[v8 count]);
  }
  else
  {
    id v78 = 0;
  }
  hostName = (__CFString *)CFPreferencesCopyValue(@"ServiceLabelBlocklistArray", @"com.apple.demo-settings", @"mobile", kCFPreferencesAnyHost);
  v83 = +[NSSet setWithArray:](NSSet, "setWithArray:");
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v54 = v7;
  id v55 = [v54 countByEnumeratingWithState:&v84 objects:v95 count:16];
  if (v55)
  {
    id v56 = v55;
    uint64_t v80 = *(void *)v85;
    do
    {
      for (j = 0; j != v56; j = (char *)j + 1)
      {
        if (*(void *)v85 != v80) {
          objc_enumerationMutation(v54);
        }
        v58 = *(void **)(*((void *)&v84 + 1) + 8 * (void)j);
        v59 = [v54 objectForKeyedSubscript:v58];
        unsigned int v60 = [v59 BOOLValue];

        id v61 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v58];
        v62 = [v61 valueForKey:@"Label"];
        unsigned int v63 = [v83 containsObject:v62];
        id v64 = v58;
        [v64 UTF8String];
        if (v63) {
          BOOL v65 = 1;
        }
        else {
          BOOL v65 = v60 == 0;
        }
        if (v65)
        {
          uint64_t v66 = launch_disable_directory();
          v67 = "launch_disable_directory";
        }
        else
        {
          uint64_t v66 = launch_enable_directory();
          v67 = "launch_enable_directory";
        }
        v68 = +[NSString stringWithFormat:@"%s(%@) returned %d", v67, v64, v66];
        v69 = nr_root_daemon_log();
        v70 = v69;
        if (v66)
        {
          BOOL v71 = os_log_type_enabled(v69, OS_LOG_TYPE_ERROR);

          if (!v71) {
            goto LABEL_84;
          }
          v72 = nr_root_daemon_log();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v98 = v68;
            _os_log_error_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }
        }
        else
        {
          BOOL v73 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);

          if (!v73) {
            goto LABEL_84;
          }
          v72 = nr_root_daemon_log();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v98 = v68;
            _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }
        }

LABEL_84:
      }
      id v56 = [v54 countByEnumeratingWithState:&v84 objects:v95 count:16];
    }
    while (v56);
  }

  id v4 = v75;
  id v6 = v8;
LABEL_87:

  return v78;
}

- (id)getLocalPairingStorePath
{
  return [@"/var/mobile/Library" stringByAppendingPathComponent:@"DeviceRegistry"];
}

- (id)getLocalPairingStorePairingID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(NRLaunchDaemon *)self getLocalPairingStorePath];
  if (v4)
  {
    id v6 = [v4 UUIDString];
    uint64_t v7 = [v5 stringByAppendingPathComponent:v6];

    unsigned __int8 v5 = (void *)v7;
  }

  return v5;
}

- (void)xpcDeletePairedStoreWithUUID:(id)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = [(NRLaunchDaemon *)self deletePairedStoreWithUUID:a3];
  v6[2](v6, v7);
}

- (id)deletePairedStoreWithUUID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSFileManager defaultManager];
  id v6 = [(NRLaunchDaemon *)self getLocalPairingStorePairingID:v4];

  id v9 = 0;
  [v5 removeItemAtPath:v6 error:&v9];
  id v7 = v9;

  return v7;
}

- (void)chownWhine:(id)a3
{
  memset(&v7, 0, sizeof(v7));
  id v3 = a3;
  stat([v3 UTF8String], &v7);
  if (!v7.st_uid || !v7.st_gid)
  {
    id v4 = nr_root_daemon_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      id v6 = nr_root_daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100005828((uint64_t)v3, v6);
      }
    }
    chown((const char *)[v3 UTF8String], 0x1F5u, 0x1F5u);
  }
}

- (void)xpcCleanupPairingStoreWithUUIDs:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nr_root_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    unint64_t v10 = nr_root_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Began pairing store cleanup", buf, 2u);
    }
  }
  BOOL v11 = dispatch_get_global_queue(5, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003724;
  block[3] = &unk_100008318;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_sync(v11, block);
}

- (void)xpcQuarantineDataWithStoreUUID:(id)a3 services:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = nr_root_daemon_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = nr_root_daemon_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Began quarantine %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x3032000000;
  BOOL v20 = sub_100003CFC;
  v21 = sub_100003D0C;
  id v22 = [[NRSyncDataDeleter alloc] initWithStoreUUID:v7 services:v8];
  id v13 = *(void **)(*((void *)&buf + 1) + 40);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_100003D14;
  v15[3] = &unk_100008340;
  id v14 = v9;
  id v16 = v14;
  p_long long buf = &buf;
  [v13 quarantineDataWithCompletion:v15];

  _Block_object_dispose(&buf, 8);
}

- (void)xpcUnquarantineDataWithStoreUUID:(id)a3 services:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = nr_root_daemon_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = nr_root_daemon_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Began unquarantine %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x3032000000;
  BOOL v20 = sub_100003CFC;
  v21 = sub_100003D0C;
  id v22 = [[NRSyncDataDeleter alloc] initWithStoreUUID:v7 services:v8];
  id v13 = *(void **)(*((void *)&buf + 1) + 40);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_100003F64;
  v15[3] = &unk_100008340;
  id v14 = v9;
  id v16 = v14;
  p_long long buf = &buf;
  [v13 unquarantineDataWithCompletion:v15];

  _Block_object_dispose(&buf, 8);
}

- (void)xpcDeleteQuarantinedDataWithStoreUUID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = nr_root_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = nr_root_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Began delete %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x3032000000;
  v17 = sub_100003CFC;
  v18 = sub_100003D0C;
  uint64_t v19 = [[NRSyncDataDeleter alloc] initWithStoreUUID:v5 services:0];
  unint64_t v10 = *(void **)(*((void *)&buf + 1) + 40);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000419C;
  v12[3] = &unk_100008368;
  id v11 = v6;
  id v13 = v11;
  p_long long buf = &buf;
  [v10 deleteQuarantinedDataWithCompletion:v12];

  _Block_object_dispose(&buf, 8);
}

- (void)xpcGetBackupHashWithCompletion:(id)a3
{
  id v9 = (void (**)(id, void *, void))a3;
  id v3 = objc_opt_new();
  CFPreferencesSynchronize(@"com.apple.MobileBackup", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  id v4 = (void *)CFPreferencesCopyAppValue(@"RestoreInfo", @"com.apple.MobileBackup");
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 objectForKeyedSubscript:@"RestoreDate"];
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v6 = [v5 description];
        id v7 = [v6 dataUsingEncoding:4];
        uint64_t v8 = [v7 NRSHA256];

        id v3 = (void *)v8;
      }
    }
  }
  v9[2](v9, v3, 0);
}

- (void)xpcCheckIfFlaggedForRecoveryWithCompletion:(id)a3
{
}

- (void)xpcClearRecoveryFlagWithCompletion:(id)a3
{
}

- (NSPointerArray)xpcClients
{
  return self->_xpcClients;
}

- (void)setXpcClients:(id)a3
{
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (OS_dispatch_queue)launchdQueue
{
  return self->_launchdQueue;
}

- (void)setLaunchdQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchdQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);

  objc_storeStrong((id *)&self->_xpcClients, 0);
}

@end