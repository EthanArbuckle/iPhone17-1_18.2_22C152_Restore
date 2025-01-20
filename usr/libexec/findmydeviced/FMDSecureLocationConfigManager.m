@interface FMDSecureLocationConfigManager
+ (id)defaultStorageLocation;
- (BOOL)featureEnabled;
- (FMDSecureLocationConfig)activeConfig;
- (FMDSecureLocationConfigManager)init;
- (FMDSecureLocationsConfigManagerDelegate)delegate;
- (FMDataArchiver)dataArchiver;
- (NSMutableDictionary)activePolicies;
- (NSMutableDictionary)policyExpirationTimes;
- (NSMutableDictionary)publishPolicies;
- (OS_dispatch_queue)policyManagerQueue;
- (id)_dictionaryFromConfigData:(id)a3;
- (id)_parseConfigFile:(id)a3;
- (id)_readConfigFromDictionary:(id)a3;
- (id)_removeContext:(id)a3;
- (id)configForPolicy:(id)a3;
- (id)expirationTimeFor:(id)a3;
- (void)_addContext:(id)a3 withExpiration:(id)a4;
- (void)_archiveConfigFile:(id)a3;
- (void)_policyRequested:(id)a3;
- (void)_readExistingConfigFile;
- (void)policyExpired:(id)a3;
- (void)removeMonitorWithContext:(id)a3;
- (void)requestMonitorWithContext:(id)a3;
- (void)setActiveConfig:(id)a3;
- (void)setActivePolicies:(id)a3;
- (void)setDataArchiver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeatureEnabled:(BOOL)a3;
- (void)setPolicyExpirationTimes:(id)a3;
- (void)setPolicyManagerQueue:(id)a3;
- (void)setPublishPolicies:(id)a3;
- (void)updateConfigData:(id)a3;
@end

@implementation FMDSecureLocationConfigManager

- (FMDSecureLocationConfigManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)FMDSecureLocationConfigManager;
  v2 = [(FMDSecureLocationConfigManager *)&v18 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("FMDSecureLocationConfigManagerPolicyUpdate", 0);
    policyManagerQueue = v2->_policyManagerQueue;
    v2->_policyManagerQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    policyExpirationTimes = v2->_policyExpirationTimes;
    v2->_policyExpirationTimes = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activePolicies = v2->_activePolicies;
    v2->_activePolicies = v7;

    id v9 = objc_alloc((Class)FMDataArchiver);
    v10 = [(id)objc_opt_class() defaultStorageLocation];
    id v11 = [v9 initWithFileURL:v10];
    [(FMDSecureLocationConfigManager *)v2 setDataArchiver:v11];

    v12 = [(FMDSecureLocationConfigManager *)v2 dataArchiver];
    [v12 setDataProtectionClass:4];

    v13 = [(FMDSecureLocationConfigManager *)v2 dataArchiver];
    [v13 setBackedUp:0];

    v14 = [(FMDSecureLocationConfigManager *)v2 dataArchiver];
    [v14 setCreateDirectories:1];

    [(FMDSecureLocationConfigManager *)v2 _readExistingConfigFile];
    uint64_t v15 = [(FMDSecureLocationConfigManager *)v2 configForPolicy:kFMDSecureLocationModeBackgroundProactive];
    activeConfig = v2->_activeConfig;
    v2->_activeConfig = (FMDSecureLocationConfig *)v15;
  }
  return v2;
}

+ (id)defaultStorageLocation
{
  id v2 = objc_alloc_init((Class)FMInternalFileContainer);
  dispatch_queue_t v3 = [v2 url];
  v4 = [v3 fm_preferencesPathURLForDomain:@"com.apple.icloud.findmydeviced.secureLocations.config"];

  v5 = sub_1000599A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    CFStringRef v8 = @"SecureLocationConfig";
    __int16 v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ archiverURL %@", (uint8_t *)&v7, 0x16u);
  }

  [v4 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:0];

  return v4;
}

- (void)_readExistingConfigFile
{
  dispatch_queue_t v3 = [(FMDSecureLocationConfigManager *)self policyManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009655C;
  block[3] = &unk_1002D9378;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_archiveConfigFile:(id)a3
{
  id v4 = a3;
  v5 = [(FMDSecureLocationConfigManager *)self policyManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000967F4;
  v7[3] = &unk_1002D93F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updateConfigData:(id)a3
{
  id v4 = a3;
  v5 = sub_1000599A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v11 = @"SecureLocationConfig";
    __int16 v12 = 1024;
    BOOL v13 = v4 != 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Received updated config from server. Not nil %d", buf, 0x12u);
  }

  id v6 = [(FMDSecureLocationConfigManager *)self policyManagerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100096A7C;
  v8[3] = &unk_1002D93F0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (id)_dictionaryFromConfigData:(id)a3
{
  id v8 = 0;
  dispatch_queue_t v3 = +[NSJSONSerialization JSONObjectWithData:a3 options:4 error:&v8];
  id v4 = v8;
  if (v4)
  {
    v5 = sub_1000599A8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100241ED4();
    }

    id v6 = 0;
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (id)_parseConfigFile:(id)a3
{
  id v4 = [(FMDSecureLocationConfigManager *)self _dictionaryFromConfigData:a3];
  if (v4)
  {
    v5 = [(FMDSecureLocationConfigManager *)self _readConfigFromDictionary:v4];
  }
  else
  {
    id v6 = sub_1000599A8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100241F48(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    v5 = 0;
  }

  return v5;
}

- (id)_readConfigFromDictionary:(id)a3
{
  id v4 = [a3 objectForKey:@"publishPolicies"];
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  publishPolicies = self->_publishPolicies;
  self->_publishPolicies = v5;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [v4 allKeys];
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = [v4 objectForKeyedSubscript:v12];
        v14 = [[FMDSecureLocationConfig alloc] initWithName:v12 values:v13];
        [(NSMutableDictionary *)self->_publishPolicies setObject:v14 forKey:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v9);
  }

  uint64_t v15 = sub_1000599A8();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(FMDSecureLocationConfigManager *)self publishPolicies];
    id v17 = [v16 count];
    objc_super v18 = self->_publishPolicies;
    *(_DWORD *)buf = 138412802;
    CFStringRef v30 = @"SecureLocationConfig";
    __int16 v31 = 2048;
    id v32 = v17;
    __int16 v33 = 2112;
    v34 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ Read %lu policies from config. Policies %@", buf, 0x20u);
  }
  v19 = [(NSMutableDictionary *)self->_publishPolicies objectForKeyedSubscript:kFMDSecureLocationModeBackgroundProactive];
  v20 = sub_1000599A8();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      v22 = [v19 policyName];
      *(_DWORD *)buf = 138412546;
      CFStringRef v30 = @"SecureLocationConfig";
      __int16 v31 = 2112;
      id v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ Setting defaultPolicy %@", buf, 0x16u);
    }
    id v23 = v19;
  }
  else
  {
    if (v21)
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v30 = @"SecureLocationConfig";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ Failed to read policy from config data", buf, 0xCu);
    }
  }

  return v19;
}

- (id)configForPolicy:(id)a3
{
  id v4 = a3;
  v5 = [(FMDSecureLocationConfigManager *)self publishPolicies];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = sub_1000599A8();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v16 = 138412546;
      CFStringRef v17 = @"SecureLocationConfig";
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ Found config for policy %@", (uint8_t *)&v16, 0x16u);
    }

    id v9 = v6;
    goto LABEL_5;
  }
  if (v8)
  {
    int v16 = 138412546;
    CFStringRef v17 = @"SecureLocationConfig";
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ No config found with name %@ from server configs. Creating with default values if name matches", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v11 = kFMDSecureLocationModeLive;
  if (![v4 caseInsensitiveCompare:kFMDSecureLocationModeLive])
  {
    uint64_t v13 = +[NSMutableDictionary dictionary];
    [v13 setObject:@"1.0" forKeyedSubscript:@"minDistanceBetweenPublish"];
    [v13 setObject:@"0.97" forKeyedSubscript:@"minTimeBetweenPublish"];
    [v13 setObject:@"3600" forKeyedSubscript:@"expirationInterval"];
    [v13 setObject:@"4" forKeyedSubscript:@"heartbeatPublish"];
    [v13 setObject:@"5" forKeyedSubscript:@"priority"];
    v14 = off_1002DC9C8;
LABEL_21:
    [v13 setObject:*v14 forKeyedSubscript:@"desiredAccuracy"];
    uint64_t v10 = [[FMDSecureLocationConfig alloc] initWithName:v11 values:v13];

    goto LABEL_22;
  }
  uint64_t v11 = kFMDSecureLocationModeProactiveShallow;
  if (![v4 caseInsensitiveCompare:kFMDSecureLocationModeProactiveShallow])
  {
    uint64_t v13 = +[NSMutableDictionary dictionary];
    [v13 setObject:@"25" forKeyedSubscript:@"minDistanceBetweenPublish"];
    [v13 setObject:@"30" forKeyedSubscript:@"minTimeBetweenPublish"];
    [v13 setObject:@"240" forKeyedSubscript:@"expirationInterval"];
    [v13 setObject:@"50" forKeyedSubscript:@"heartbeatPublish"];
    [v13 setObject:@"4" forKeyedSubscript:@"priority"];
    v14 = off_1002DC9D8;
    goto LABEL_21;
  }
  uint64_t v11 = kFMDSecureLocationModeOwnerProactive;
  if (![v4 caseInsensitiveCompare:kFMDSecureLocationModeOwnerProactive])
  {
    uint64_t v13 = +[NSMutableDictionary dictionary];
    [v13 setObject:@"0.0" forKeyedSubscript:@"minDistanceBetweenPublish"];
    [v13 setObject:@"3000" forKeyedSubscript:@"minTimeBetweenPublish"];
    [v13 setObject:@"86400.0" forKeyedSubscript:@"expirationInterval"];
    [v13 setObject:@"3000" forKeyedSubscript:@"heartbeatPublish"];
    [v13 setObject:@"1" forKeyedSubscript:@"priority"];
    v14 = off_1002DC9E0;
    goto LABEL_21;
  }
  if (![v4 caseInsensitiveCompare:kFMDSecureLocationModeProactive])
  {
    id v9 = objc_alloc_init(FMDSecureLocationConfig);
LABEL_5:
    uint64_t v10 = v9;
    goto LABEL_22;
  }
  uint64_t v11 = kFMDSecureLocationModeBackgroundProactive;
  if (![v4 caseInsensitiveCompare:kFMDSecureLocationModeBackgroundProactive])
  {
    uint64_t v13 = +[NSMutableDictionary dictionary];
    [v13 setObject:@"10000" forKeyedSubscript:@"minDistanceBetweenPublish"];
    [v13 setObject:@"3600" forKeyedSubscript:@"minTimeBetweenPublish"];
    [v13 setObject:@"86400.0" forKeyedSubscript:@"expirationInterval"];
    [v13 setObject:@"900" forKeyedSubscript:@"minTimeBetweenVisitPublish"];
    [v13 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldWakeDevice"];
    [v13 setObject:@"0" forKeyedSubscript:@"priority"];
    v14 = &off_1002DC9F8;
    goto LABEL_21;
  }
  uint64_t v12 = sub_1000599A8();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    CFStringRef v17 = @"SecureLocationConfig";
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ Invalid policy name specified %@", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v10 = 0;
LABEL_22:

  return v10;
}

- (void)requestMonitorWithContext:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(FMDSecureLocationConfigManager *)self policyManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000976C8;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_addContext:(id)a3 withExpiration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FMDSecureLocationConfigManager *)self policyManagerQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(FMDSecureLocationConfigManager *)self activePolicies];
  uint64_t v10 = [v6 mode];
  uint64_t v11 = [v9 objectForKey:v10];

  if (!v11)
  {
    uint64_t v11 = +[NSMutableDictionary dictionary];
    uint64_t v12 = [(FMDSecureLocationConfigManager *)self activePolicies];
    uint64_t v13 = [v6 mode];
    [v12 setObject:v11 forKey:v13];
  }
  v14 = [v6 findMyId];
  [v11 setObject:v7 forKey:v14];

  uint64_t v15 = sub_1000599A8();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = [v6 mode];
    CFStringRef v17 = [v6 findMyId];
    int v18 = 138413058;
    CFStringRef v19 = @"SecureLocationConfig";
    __int16 v20 = 2112;
    BOOL v21 = v16;
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2112;
    long long v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ Added policy %@ expiration to %@ for %@", (uint8_t *)&v18, 0x2Au);
  }
}

- (void)_policyRequested:(id)a3
{
  id v4 = a3;
  v5 = [(FMDSecureLocationConfigManager *)self policyManagerQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(FMDSecureLocationConfigManager *)self delegate];
  id v7 = [(FMDSecureLocationConfigManager *)self configForPolicy:v4];
  id v8 = sub_1000599A8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(FMDSecureLocationConfigManager *)self activeConfig];
    int v23 = 138412802;
    CFStringRef v24 = @"SecureLocationConfig";
    __int16 v25 = 2112;
    id v26 = v4;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ policyRequested %@. Current activeConfig %@", (uint8_t *)&v23, 0x20u);
  }
  uint64_t v10 = [(FMDSecureLocationConfigManager *)self activeConfig];
  if (v10
    && (uint64_t v11 = (void *)v10,
        id v12 = [v7 priority],
        [(FMDSecureLocationConfigManager *)self activeConfig],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        id v14 = [v13 priority],
        v13,
        v11,
        (uint64_t)v12 <= (uint64_t)v14))
  {
    CFStringRef v19 = [v7 policyName];
    __int16 v20 = [(FMDSecureLocationConfigManager *)self activeConfig];
    BOOL v21 = [v20 policyName];
    unsigned int v22 = [v19 isEqualToString:v21];

    if (v22 && v6)
    {
      int v18 = [(FMDSecureLocationConfigManager *)self activeConfig];
      [v6 activeConfigExtended:v18];
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v15 = sub_1000599A8();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [(FMDSecureLocationConfigManager *)self activeConfig];
      CFStringRef v17 = [v16 policyName];
      int v23 = 138412802;
      CFStringRef v24 = @"SecureLocationConfig";
      __int16 v25 = 2112;
      id v26 = v17;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ Switching active policy from %@ to %@", (uint8_t *)&v23, 0x20u);
    }
    [(FMDSecureLocationConfigManager *)self setActiveConfig:v7];
    if (v6)
    {
      int v18 = [(FMDSecureLocationConfigManager *)self activeConfig];
      [v6 activeConfigChanged:v18];
LABEL_12:
    }
  }
}

- (void)removeMonitorWithContext:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(FMDSecureLocationConfigManager *)self policyManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100097D78;
  v7[3] = &unk_1002DA298;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)_removeContext:(id)a3
{
  id v4 = a3;
  v5 = [(FMDSecureLocationConfigManager *)self policyManagerQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 mode];
  if (!v6
    || (id v7 = (void *)v6,
        [v4 findMyId],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    uint64_t v11 = sub_1000599A8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100242038(v11, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_10;
  }
  id v9 = [(FMDSecureLocationConfigManager *)self activePolicies];
  id v10 = [v4 mode];
  uint64_t v11 = [v9 objectForKey:v10];

  if (!v11)
  {
    CFStringRef v17 = sub_1000599A8();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [v4 mode];
      int v28 = 138412546;
      CFStringRef v29 = @"SecureLocationConfig";
      __int16 v30 = 2114;
      __int16 v31 = v26;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ No active contexts for mode %{public}@", (uint8_t *)&v28, 0x16u);
    }
    int v18 = 0;
    goto LABEL_14;
  }
  id v12 = [v4 findMyId];
  [v11 removeObjectForKey:v12];

  uint64_t v13 = sub_1000599A8();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v4 findMyId];
    uint64_t v15 = [v4 mode];
    int v28 = 138412802;
    CFStringRef v29 = @"SecureLocationConfig";
    __int16 v30 = 2114;
    __int16 v31 = v14;
    __int16 v32 = 2114;
    __int16 v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ Removed active sub for %{public}@ in mode %{public}@", (uint8_t *)&v28, 0x20u);
  }
  if (![v11 count])
  {
LABEL_10:
    int v18 = 0;
    goto LABEL_15;
  }
  int v16 = [v11 allValues];
  CFStringRef v17 = [v16 sortedArrayUsingComparator:&stru_1002DC7D8];

  int v18 = [v17 lastObject];
LABEL_14:

LABEL_15:

  return v18;
}

- (id)expirationTimeFor:(id)a3
{
  id v4 = a3;
  v5 = [(FMDSecureLocationConfigManager *)self policyExpirationTimes];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)policyExpired:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(FMDSecureLocationConfigManager *)self policyManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100098504;
  v7[3] = &unk_1002DA298;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (FMDSecureLocationConfig)activeConfig
{
  return (FMDSecureLocationConfig *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActiveConfig:(id)a3
{
}

- (FMDSecureLocationsConfigManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMDSecureLocationsConfigManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)featureEnabled
{
  return self->_featureEnabled;
}

- (void)setFeatureEnabled:(BOOL)a3
{
  self->_featureEnabled = a3;
}

- (OS_dispatch_queue)policyManagerQueue
{
  return self->_policyManagerQueue;
}

- (void)setPolicyManagerQueue:(id)a3
{
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
}

- (NSMutableDictionary)publishPolicies
{
  return self->_publishPolicies;
}

- (void)setPublishPolicies:(id)a3
{
}

- (NSMutableDictionary)policyExpirationTimes
{
  return self->_policyExpirationTimes;
}

- (void)setPolicyExpirationTimes:(id)a3
{
}

- (NSMutableDictionary)activePolicies
{
  return self->_activePolicies;
}

- (void)setActivePolicies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePolicies, 0);
  objc_storeStrong((id *)&self->_policyExpirationTimes, 0);
  objc_storeStrong((id *)&self->_publishPolicies, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_policyManagerQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_activeConfig, 0);
}

@end