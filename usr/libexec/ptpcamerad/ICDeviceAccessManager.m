@interface ICDeviceAccessManager
+ (id)sharedAccessManager;
- (BOOL)captureUserIntentForBundleIdentifier:(id)a3 withNotification:(id)a4;
- (BOOL)validateBundleIdentifierInstalled:(id)a3;
- (ICDeviceAccessManager)init;
- (NSArray)allBundleIdentifiers;
- (NSArray)bundleIdentifiersAccessingExternalCameras;
- (NSArray)bundleIdentifiersAccessingExternalCamerasWithStatus;
- (OS_dispatch_queue)deviceAccessQueue;
- (id)bundleIdentifiersWithAccessType:(id)a3;
- (int)openDB:(id)a3;
- (sqlite3)externalMediaAccessDB;
- (unint64_t)bundleIdentifier:(id)a3 stateForAccessType:(id)a4;
- (unint64_t)connection:(id)a3 stateForAccessType:(id)a4;
- (void)addBundleIdentifier:(id)a3;
- (void)dealloc;
- (void)displayAlertForApplication:(id)a3 withNotification:(id)a4 completionBlock:(id)a5;
- (void)revokeBundleIdentifier:(id)a3;
- (void)setDeviceAccessQueue:(id)a3;
- (void)setExternalMediaAccessDB:(sqlite3 *)a3;
- (void)updateApplicationWithBundleIdentifier:(id)a3 withStatus:(BOOL)a4;
- (void)updateBundleIdentifier:(id)a3 accessType:(id)a4 withState:(unint64_t)a5;
@end

@implementation ICDeviceAccessManager

- (ICDeviceAccessManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)ICDeviceAccessManager;
  v2 = [(ICDeviceAccessManager *)&v18 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("ICDeviceAccessManagerQueue", 0);
    deviceAccessQueue = v2->_deviceAccessQueue;
    v2->_deviceAccessQueue = (OS_dispatch_queue *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    v6 = [(ICDeviceAccessManager *)v2 deviceAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018C0C;
    block[3] = &unk_10004CA88;
    v2 = v2;
    v11 = v2;
    v13 = &v14;
    v7 = v5;
    v12 = v7;
    dispatch_async(v6, block);

    dispatch_time_t v8 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v7, v8);
    if (!*((unsigned char *)v15 + 24))
    {

      v2 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }
  return v2;
}

- (int)openDB:(id)a3
{
  v4 = (const char *)[a3 UTF8String];

  return sqlite3_open(v4, &self->_externalMediaAccessDB);
}

- (void)dealloc
{
  if (sqlite3_close(self->_externalMediaAccessDB))
  {
    __ICOSLogCreate();
    dispatch_queue_t v3 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      v4 = [@"icaccess" substringWithRange:0, 18];
      dispatch_queue_t v3 = [v4 stringByAppendingString:@".."];
    }
    dispatch_semaphore_t v5 = +[NSString stringWithFormat:@"Failed to close database"];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033C1C();
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)ICDeviceAccessManager;
  [(ICDeviceAccessManager *)&v6 dealloc];
}

+ (id)sharedAccessManager
{
  if (qword_100063498 != -1) {
    dispatch_once(&qword_100063498, &stru_10004CB90);
  }
  v2 = (void *)qword_100063490;

  return v2;
}

- (NSArray)bundleIdentifiersAccessingExternalCameras
{
  dispatch_queue_t v3 = +[NSMutableArray array];
  v4 = [(ICDeviceAccessManager *)self bundleIdentifiersWithAccessType:@"read_access"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) objectForKeyedSubscript:@"bundle_id"];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)updateApplicationWithBundleIdentifier:(id)a3 withStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = [(ICDeviceAccessManager *)self bundleIdentifier:v6 stateForAccessType:@"write_access"];
  unint64_t v8 = [(ICDeviceAccessManager *)self bundleIdentifier:v6 stateForAccessType:@"read_access"];
  if (v7)
  {
    if (v4) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    [(ICDeviceAccessManager *)self updateBundleIdentifier:v6 accessType:@"write_access" withState:v9];
    __ICOSLogCreate();
    v10 = @"PrivacySettings";
    if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
    {
      long long v11 = [@"PrivacySettings" substringWithRange:0, 18];
      v10 = [v11 stringByAppendingString:@".."];
    }
    long long v12 = +[NSString stringWithFormat:@"%@ Setting (write) Access State %d", v6, v4];
    long long v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:
      v10 = v10;
      v15 = v13;
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = [(__CFString *)v10 UTF8String];
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  else
  {
    __ICOSLogCreate();
    v10 = @"PrivacySettings";
    if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
    {
      long long v14 = [@"PrivacySettings" substringWithRange:0, 18];
      v10 = [v14 stringByAppendingString:@".."];
    }
    long long v12 = +[NSString stringWithFormat:@"%@ (write) Access State Unknown, not updating", v6];
    long long v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
  }

  if (v8)
  {
    if (v4) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 1;
    }
    [(ICDeviceAccessManager *)self updateBundleIdentifier:v6 accessType:@"read_access" withState:v16];
    __ICOSLogCreate();
    char v17 = @"PrivacySettings";
    if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
    {
      objc_super v18 = [@"PrivacySettings" substringWithRange:0, 18];
      char v17 = [v18 stringByAppendingString:@".."];
    }
    v19 = +[NSString stringWithFormat:@"%@ Setting (read) Access State %d", v6, v4, *(_OWORD *)buf, *(void *)&buf[16]];
    v20 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_24:
      char v17 = v17;
      v22 = v20;
      id v23 = [(__CFString *)v17 UTF8String];
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  else
  {
    __ICOSLogCreate();
    char v17 = @"PrivacySettings";
    if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
    {
      v21 = [@"PrivacySettings" substringWithRange:0, 18];
      char v17 = [v21 stringByAppendingString:@".."];
    }
    v19 = +[NSString stringWithFormat:@"%@ (read) Access State Unknown, not updating", v6];
    v20 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
  }

  __ICOSLogCreate();
  v24 = @"DEPRECATED";
  if ((unint64_t)[@"DEPRECATED" length] >= 0x15)
  {
    v25 = [@"DEPRECATED" substringWithRange:0, 18];
    v24 = [v25 stringByAppendingString:@".."];
  }
  v26 = +[NSString stringWithFormat:@"updateApplicationWithBundleIdentifier:%@ withStatus:%d", v6, v4, *(void *)buf, *(_OWORD *)&buf[8]];
  v27 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v24;
    v29 = v27;
    id v30 = [(__CFString *)v28 UTF8String];
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v26;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

- (NSArray)bundleIdentifiersAccessingExternalCamerasWithStatus
{
  id v60 = +[NSMutableArray array];
  v56 = self;
  [(ICDeviceAccessManager *)self bundleIdentifiersWithAccessType:@"read_access"];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v66;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v66 != v5) {
          objc_enumerationMutation(obj);
        }
        unint64_t v7 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        unint64_t v8 = [v7 objectForKeyedSubscript:@"read_access"];
        unsigned int v9 = [v8 intValue];

        if (v9 == 1)
        {
          uint64_t v10 = 0;
          goto LABEL_10;
        }
        if (v9 == 2)
        {
          uint64_t v10 = 1;
LABEL_10:
          long long v11 = +[NSMutableDictionary dictionary];
          long long v12 = +[NSNumber numberWithBool:v10];
          [(__CFString *)v11 setObject:v12 forKeyedSubscript:@"whitelisted"];

          long long v13 = [v7 objectForKeyedSubscript:@"bundle_id"];
          [(__CFString *)v11 setObject:v13 forKeyedSubscript:@"bundle_id"];

          [v60 addObject:v11];
          __ICOSLogCreate();
          long long v14 = @"PrivacySettings";
          if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
          {
            v15 = [@"PrivacySettings" substringWithRange:0, 18];
            long long v14 = [v15 stringByAppendingString:@".."];
          }
          uint64_t v16 = [v7 objectForKeyedSubscript:@"bundle_id"];
          char v17 = +[NSString stringWithFormat:@"%@ (read) Access State %d, adding", v16, v10];

          objc_super v18 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v19 = v14;
            v20 = v18;
            id v21 = [(__CFString *)v19 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v71 = v21;
            __int16 v72 = 2114;
            v73 = v17;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          goto LABEL_18;
        }
        __ICOSLogCreate();
        long long v11 = @"PrivacySettings";
        if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
        {
          v22 = [@"PrivacySettings" substringWithRange:0, 18];
          long long v11 = [v22 stringByAppendingString:@".."];
        }
        id v23 = [v7 objectForKeyedSubscript:@"bundle_id"];
        long long v14 = +[NSString stringWithFormat:@"%@ (read) Access State Unknown, not adding", v23];

        v24 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          long long v11 = v11;
          char v17 = v24;
          id v25 = [(__CFString *)v11 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v71 = v25;
          __int16 v72 = 2114;
          v73 = v14;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
LABEL_18:
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
    }
    while (v4);
  }
  [(ICDeviceAccessManager *)v56 bundleIdentifiersWithAccessType:@"write_access"];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v57 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = [v57 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (!v26) {
    goto LABEL_41;
  }
  id v27 = v26;
  uint64_t v59 = *(void *)v62;
  do
  {
    for (j = 0; j != v27; j = (char *)j + 1)
    {
      if (*(void *)v62 != v59) {
        objc_enumerationMutation(v57);
      }
      v29 = *(void **)(*((void *)&v61 + 1) + 8 * (void)j);
      id v30 = [v29 objectForKeyedSubscript:@"write_access"];
      unsigned int v31 = [v30 intValue];

      if (v31 == 1)
      {
        uint64_t v32 = 0;
        goto LABEL_30;
      }
      if (v31 == 2)
      {
        uint64_t v32 = 1;
LABEL_30:
        v33 = +[NSMutableDictionary dictionary];
        v34 = +[NSNumber numberWithBool:v32];
        [(__CFString *)v33 setObject:v34 forKeyedSubscript:@"whitelisted"];

        v35 = [v29 objectForKeyedSubscript:@"bundle_id"];
        [(__CFString *)v33 setObject:v35 forKeyedSubscript:@"bundle_id"];

        [v60 addObject:v33];
        __ICOSLogCreate();
        v36 = @"PrivacySettings";
        if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
        {
          v37 = [@"PrivacySettings" substringWithRange:0, 18];
          v36 = [v37 stringByAppendingString:@".."];
        }
        v38 = [v29 objectForKeyedSubscript:@"bundle_id"];
        v39 = +[NSString stringWithFormat:@"%@ (write) Access State %d, adding", v38, v32];

        v40 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v41 = v36;
          v42 = v40;
          id v43 = [(__CFString *)v41 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v71 = v43;
          __int16 v72 = 2114;
          v73 = v39;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        goto LABEL_38;
      }
      __ICOSLogCreate();
      v33 = @"PrivacySettings";
      if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
      {
        v44 = [@"PrivacySettings" substringWithRange:0, 18];
        v33 = [v44 stringByAppendingString:@".."];
      }
      v45 = [v29 objectForKeyedSubscript:@"bundle_id"];
      v36 = +[NSString stringWithFormat:@"%@ (write) Access State Unknown, not adding", v45];

      v46 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v33;
        v39 = v46;
        id v47 = [(__CFString *)v33 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v71 = v47;
        __int16 v72 = 2114;
        v73 = v36;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
LABEL_38:
      }
    }
    id v27 = [v57 countByEnumeratingWithState:&v61 objects:v69 count:16];
  }
  while (v27);
LABEL_41:
  __ICOSLogCreate();
  v48 = @"DEPRECATED";
  if ((unint64_t)[@"DEPRECATED" length] >= 0x15)
  {
    v49 = [@"DEPRECATED" substringWithRange:0, 18];
    v48 = [v49 stringByAppendingString:@".."];
  }
  v50 = +[NSString stringWithFormat:@"bundleIdentifiersAccessingExternalCamerasWithStatus: %@", v60];
  v51 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v52 = v48;
    v53 = v51;
    id v54 = [(__CFString *)v52 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v71 = v54;
    __int16 v72 = 2114;
    v73 = v50;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  return (NSArray *)v60;
}

- (NSArray)allBundleIdentifiers
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = sub_10001A0E0;
  v15 = sub_10001A0F0;
  id v16 = +[NSMutableArray array];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(ICDeviceAccessManager *)self deviceAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A0F8;
  block[3] = &unk_10004CA88;
  dispatch_semaphore_t v9 = v3;
  uint64_t v10 = &v11;
  void block[4] = self;
  uint64_t v5 = v3;
  dispatch_async(v4, block);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return (NSArray *)v6;
}

- (void)addBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICDeviceAccessManager *)self allBundleIdentifiers];
  if ([v5 containsObject:v4])
  {
    __ICOSLogCreate();
    id v6 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      unint64_t v7 = [@"icaccess" substringWithRange:0, 18];
      id v6 = [v7 stringByAppendingString:@".."];
    }
    unint64_t v8 = +[NSString stringWithFormat:@"%@ is already in the database, will not be added again", v4];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033C1C();
    }
  }
  else
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    uint64_t v10 = [(ICDeviceAccessManager *)self deviceAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A5DC;
    block[3] = &unk_10004C908;
    id v13 = v4;
    long long v14 = self;
    dispatch_semaphore_t v15 = v9;
    id v6 = v9;
    dispatch_async(v10, block);

    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v6, v11);

    unint64_t v8 = v13;
  }
}

- (void)updateBundleIdentifier:(id)a3 accessType:(id)a4 withState:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  dispatch_time_t v11 = [(ICDeviceAccessManager *)self deviceAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A7D0;
  block[3] = &unk_10004CBB8;
  dispatch_semaphore_t v20 = v10;
  unint64_t v21 = a5;
  id v17 = v9;
  id v18 = v8;
  v19 = self;
  long long v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, block);

  dispatch_time_t v15 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v12, v15);
}

- (id)bundleIdentifiersWithAccessType:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  dispatch_semaphore_t v20 = sub_10001A0E0;
  unint64_t v21 = sub_10001A0F0;
  id v22 = +[NSMutableArray array];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(ICDeviceAccessManager *)self deviceAccessQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001AAC0;
  v12[3] = &unk_10004CBE0;
  id v13 = v4;
  id v14 = self;
  dispatch_semaphore_t v15 = v5;
  id v16 = &v17;
  unint64_t v7 = v5;
  id v8 = v4;
  dispatch_async(v6, v12);

  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v7, v9);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v10;
}

- (unint64_t)connection:(id)a3 stateForAccessType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)xpc_connection_copy_entitlement_value();
  dispatch_time_t v9 = v8;
  if (v8 && xpc_BOOL_get_value(v8))
  {
    unint64_t v10 = 2;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    xpc_connection_get_audit_token();
    memset(&v15, 0, sizeof(v15));
    dispatch_time_t v11 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v15);
    if (v11)
    {
      long long v12 = v11;
      *(void *)v15.val = 0;
      id v13 = (__CFString *)SecTaskCopySigningIdentifier(v11, (CFErrorRef *)&v15);
      CFRelease(v12);
    }
    else
    {
      id v13 = 0;
    }
    unint64_t v10 = [(ICDeviceAccessManager *)self bundleIdentifier:v13 stateForAccessType:v7];
  }
  return v10;
}

- (unint64_t)bundleIdentifier:(id)a3 stateForAccessType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ICDeviceAccessManager *)self validateBundleIdentifierInstalled:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v19 = v7;
  id v8 = [(ICDeviceAccessManager *)self bundleIdentifiersWithAccessType:v7];
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        audit_token_t v15 = [v14 objectForKeyedSubscript:@"bundle_id"];
        unsigned int v16 = [v15 isEqualToString:v6];

        if (v16)
        {
          long long v17 = [v14 objectForKeyedSubscript:v19];
          unint64_t v11 = (int)[v17 intValue];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (void)revokeBundleIdentifier:(id)a3
{
  id v4 = a3;
  __ICOSLogCreate();
  dispatch_semaphore_t v5 = @"icaccess";
  if ((unint64_t)[@"icaccess" length] >= 0x15)
  {
    id v6 = [[@"icaccess" substringWithRange:0, 18];
    dispatch_semaphore_t v5 = [v6 stringByAppendingString:@".."];
  }
  id v7 = +[NSString stringWithFormat:@"Revoking Application BundleID %@", v4];
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
    sub_100033C1C();
  }

  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  id v9 = [(ICDeviceAccessManager *)self deviceAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B210;
  block[3] = &unk_10004C908;
  id v14 = v4;
  audit_token_t v15 = self;
  dispatch_semaphore_t v16 = v8;
  id v10 = v8;
  id v11 = v4;
  dispatch_async(v9, block);

  dispatch_time_t v12 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v10, v12);
}

- (BOOL)validateBundleIdentifierInstalled:(id)a3
{
  id v3 = a3;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_10001A0E0;
  v40 = sub_10001A0F0;
  id v41 = +[NSMutableArray array];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v5 = [(ICDeviceAccessManager *)self deviceAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B754;
  block[3] = &unk_10004CBE0;
  id v6 = v3;
  id v32 = v6;
  v33 = self;
  v35 = &v36;
  id v7 = v4;
  v34 = v7;
  dispatch_async(v5, block);

  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v7, v8);
  id v30 = 0;
  id v9 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v30];
  id v10 = v30;
  v24 = v10;
  if (v9 && !v10)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = (id)v37[5];
    id v12 = [v11 countByEnumeratingWithState:&v26 objects:v46 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v27;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v11);
          }
          audit_token_t v15 = [*(id *)(*((void *)&v26 + 1) + 8 * i) objectForKeyedSubscript:@"bundle_id"];
          unsigned __int8 v16 = [v15 isEqualToString:v6];

          if (v16)
          {

            BOOL v22 = 1;
            goto LABEL_19;
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v26 objects:v46 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }
  __ICOSLogCreate();
  if ((unint64_t)[@"icaccess" length] < 0x15)
  {
    id v18 = @"icaccess";
  }
  else
  {
    long long v17 = [@"icaccess" substringWithRange:0, 18];
    id v18 = [v17 stringByAppendingString:@".."];
  }
  uint64_t v19 = +[NSString stringWithFormat:@"Bundle was not found to be installed on the device, revoking access defensively to require the user to re-authorize upon install.", v24];
  long long v20 = (id)_gICOSLog;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [(__CFString *)v18 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v43 = v21;
    __int16 v44 = 2114;
    v45 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  [(ICDeviceAccessManager *)self revokeBundleIdentifier:v6];
  BOOL v22 = 0;
LABEL_19:

  _Block_object_dispose(&v36, 8);
  return v22;
}

- (void)displayAlertForApplication:(id)a3 withNotification:(id)a4 completionBlock:(id)a5
{
  id v6 = (void (**)(id, uint64_t, CFOptionFlags))a5;
  SInt32 error = 0;
  id v7 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, &error, (CFDictionaryRef)a4);
  if (v7)
  {
    dispatch_time_t v8 = v7;
    CFOptionFlags v9 = 0;
    CFUserNotificationReceiveResponse(v7, 0.0, &v9);
    v6[2](v6, 1, v9);
    CFRelease(v8);
  }
}

- (BOOL)captureUserIntentForBundleIdentifier:(id)a3 withNotification:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  unsigned __int8 v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (v6)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    dispatch_time_t v8 = +[ICDeviceAccessManager sharedAccessManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001BAAC;
    v12[3] = &unk_10004CC08;
    id v14 = &v15;
    CFOptionFlags v9 = v7;
    uint64_t v13 = v9;
    [v8 displayAlertForApplication:v5 withNotification:v6 completionBlock:v12];

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v10 = *((unsigned char *)v16 + 24) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (sqlite3)externalMediaAccessDB
{
  return self->_externalMediaAccessDB;
}

- (void)setExternalMediaAccessDB:(sqlite3 *)a3
{
  self->_externalMediaAccessDB = a3;
}

- (OS_dispatch_queue)deviceAccessQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end