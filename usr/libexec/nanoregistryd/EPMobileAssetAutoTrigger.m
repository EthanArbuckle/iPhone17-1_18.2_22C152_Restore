@interface EPMobileAssetAutoTrigger
+ (id)newService:(id)a3;
- (BOOL)isUIUnlocked;
- (BOOL)wasUIUnlocked;
- (EPMobileAssetAutoTrigger)initWithServiceRegistry:(id)a3;
- (EPServiceRegistry)serviceRegistry;
- (NRPreferences)prefs;
- (double)getLastAssetUpdateCheckInterval;
- (id)getLatestAssetFromQueryResults:(id)a3;
- (id)mobileAssetDownloadOptionsUserInitiated:(BOOL)a3;
- (int)uiUnlockNotifyToken;
- (void)dealloc;
- (void)downloadAssetCatalogFor:(id)a3 userInitiated:(BOOL)a4 withCompletion:(id)a5;
- (void)queryAndGetLatestAssetForAssetType:(id)a3 installedAssetsOnly:(BOOL)a4 withCompletion:(id)a5;
- (void)registerForNotifications;
- (void)setLastAssetUpdateCheckDate:(id)a3;
- (void)setPrefs:(id)a3;
- (void)setServiceRegistry:(id)a3;
- (void)setUiUnlockNotifyToken:(int)a3;
- (void)setWasUIUnlocked:(BOOL)a3;
- (void)unregisterForNotifications;
- (void)update;
- (void)updateAssetFor:(id)a3 onQueue:(id)a4 userInitiated:(BOOL)a5 withCompletion:(id)a6;
- (void)updateCompatibilityIndexAssetOnQueue:(id)a3 userInitiated:(BOOL)a4 withCompletion:(id)a5;
@end

@implementation EPMobileAssetAutoTrigger

+ (id)newService:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithServiceRegistry:v4];

  return v5;
}

- (EPMobileAssetAutoTrigger)initWithServiceRegistry:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_serviceRegistry, a3);
  v6 = [(EPMobileAssetAutoTrigger *)self init];
  if (v6)
  {
    v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "EPMobileAssetAutoTrigger: Init", v13, 2u);
      }
    }
    v10 = [[NRPreferences alloc] initWithDomain:@"com.apple.nanoregistryd"];
    prefs = v6->_prefs;
    v6->_prefs = v10;

    v6->_uiUnlockNotifyToken = -1;
    [(EPMobileAssetAutoTrigger *)v6 registerForNotifications];
  }

  return v6;
}

- (void)dealloc
{
  [(EPMobileAssetAutoTrigger *)self unregisterForNotifications];
  v3.receiver = self;
  v3.super_class = (Class)EPMobileAssetAutoTrigger;
  [(EPMobileAssetAutoTrigger *)&v3 dealloc];
}

- (void)registerForNotifications
{
  p_uiUnlockNotifyToken = &self->_uiUnlockNotifyToken;
  if (self->_uiUnlockNotifyToken == -1)
  {
    id v4 = +[NRQueue registryDaemonQueue];
    id v5 = [v4 queue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000F5C0;
    handler[3] = &unk_100165958;
    handler[4] = self;
    uint32_t v6 = notify_register_dispatch("com.apple.springboard.lockstate", p_uiUnlockNotifyToken, v5, handler);

    if (v6)
    {
      v7 = nr_daemon_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (v8)
      {
        v9 = nr_daemon_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000F6520(v6, v9);
        }
      }
    }
  }
}

- (void)unregisterForNotifications
{
  int uiUnlockNotifyToken = self->_uiUnlockNotifyToken;
  if (uiUnlockNotifyToken != -1)
  {
    notify_cancel(uiUnlockNotifyToken);
    self->_int uiUnlockNotifyToken = -1;
  }
}

- (BOOL)isUIUnlocked
{
  uint64_t state64 = 0;
  int uiUnlockNotifyToken = self->_uiUnlockNotifyToken;
  if (uiUnlockNotifyToken != -1)
  {
    uint32_t state = notify_get_state(uiUnlockNotifyToken, &state64);
    if (state)
    {
      int v4 = state;
      id v5 = nr_daemon_log();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

      if (v6)
      {
        v7 = nr_daemon_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_1000F659C(v4, v7);
        }
      }
    }
  }
  return state64 == 0;
}

- (void)update
{
  BOOL v3 = [(EPMobileAssetAutoTrigger *)self isUIUnlocked];
  if (v3)
  {
    BOOL wasUIUnlocked = self->_wasUIUnlocked;
    self->_BOOL wasUIUnlocked = v3;
    if (!wasUIUnlocked)
    {
      [(EPMobileAssetAutoTrigger *)self getLastAssetUpdateCheckInterval];
      double v6 = v5;
      v7 = sub_1000A3CF0();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v6 <= 0.0 || v6 >= 604800.0)
      {
        if (v8)
        {
          v10 = sub_1000A3CF0();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPMobileAssetAutoTrigger: Cooldown elapsed; triggering scan",
              buf,
              2u);
          }
        }
        v11 = +[NRQueue assetDownloadQueue];
        v12 = [v11 queue];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10000F8E4;
        v13[3] = &unk_100165980;
        v13[4] = self;
        [(EPMobileAssetAutoTrigger *)self updateCompatibilityIndexAssetOnQueue:v12 userInitiated:0 withCompletion:v13];
      }
      else if (v8)
      {
        v9 = sub_1000A3CF0();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "EPMobileAssetAutoTrigger: Cooldown has not elapsed; deferring scan",
            buf,
            2u);
        }
      }
    }
  }
  else
  {
    self->_BOOL wasUIUnlocked = 0;
  }
}

- (void)setLastAssetUpdateCheckDate:(id)a3
{
  id v4 = a3;
  double v5 = sub_1000A3CF0();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = sub_1000A3CF0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPMobileAssetAutoTrigger: setLastAssetUpdateCheckDate: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  if (v4)
  {
    [v4 timeIntervalSinceReferenceDate];
    BOOL v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    prefs = self->_prefs;
    p_prefs = &self->_prefs;
    [(NRPreferences *)prefs setObject:v8 forKeyedSubscript:@"lastAssetUpdateCheckDate"];
  }
  else
  {
    v11 = self->_prefs;
    p_prefs = &self->_prefs;
    [(NRPreferences *)v11 setObject:0 forKeyedSubscript:@"lastAssetUpdateCheckDate"];
  }
  [(NRPreferences *)*p_prefs synchronize];
}

- (double)getLastAssetUpdateCheckInterval
{
  BOOL v3 = +[NSDate date];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  BOOL v6 = [(NRPreferences *)self->_prefs objectForKeyedSubscript:@"lastAssetUpdateCheckDate"];
  double v7 = 0.0;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      double v9 = v8;
      v10 = sub_1000A3CF0();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (v11)
      {
        int v12 = sub_1000A3CF0();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v9];
          int v15 = 138543362;
          v16 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "EPMobileAssetAutoTrigger: getLastAssetUpdateCheckInterval: %{public}@", (uint8_t *)&v15, 0xCu);
        }
      }
      double v7 = v5 - v9;
    }
  }

  return v7;
}

- (void)updateCompatibilityIndexAssetOnQueue:(id)a3 userInitiated:(BOOL)a4 withCompletion:(id)a5
{
}

- (void)updateAssetFor:(id)a3 onQueue:(id)a4 userInitiated:(BOOL)a5 withCompletion:(id)a6
{
  id v10 = a3;
  BOOL v11 = a4;
  id v12 = a6;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_10000FE60;
  v22[4] = sub_10000FE70;
  id v23 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000FE78;
  v17[3] = &unk_100165A48;
  v17[4] = self;
  BOOL v21 = a5;
  id v13 = v10;
  id v18 = v13;
  v20 = v22;
  id v14 = v12;
  id v19 = v14;
  int v15 = objc_retainBlock(v17);
  v16 = v15;
  if (v11) {
    dispatch_async(v11, v15);
  }
  else {
    ((void (*)(void *))v15[2])(v15);
  }

  _Block_object_dispose(v22, 8);
}

- (void)downloadAssetCatalogFor:(id)a3 userInitiated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = nr_framework_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = nr_framework_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "EPMobileAssetAutoTrigger: Downloading asset catalog for %{public}@", buf, 0xCu);
    }
  }
  id v13 = [(EPMobileAssetAutoTrigger *)self mobileAssetDownloadOptionsUserInitiated:v6];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100010A28;
  v16[3] = &unk_100165A98;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  +[MAAsset startCatalogDownload:v15 options:v13 completionWithError:v16];
}

- (void)queryAndGetLatestAssetForAssetType:(id)a3 installedAssetsOnly:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [objc_alloc((Class)MAAssetQuery) initWithType:v8];
  BOOL v11 = v10;
  if (v6) {
    [v10 returnTypes:2];
  }
  id v12 = nr_framework_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    id v14 = nr_framework_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = "NO";
      if (v6) {
        id v15 = "YES";
      }
      *(_DWORD *)buf = 138543618;
      id v22 = v8;
      __int16 v23 = 2080;
      v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NRMobileAssetManager — Query for %{public}@, installed assets only: %s", buf, 0x16u);
    }
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100010DD4;
  v18[3] = &unk_100165AC0;
  v18[4] = self;
  id v19 = v11;
  id v20 = v9;
  id v16 = v9;
  id v17 = v11;
  [v17 queryMetaData:v18];
}

- (id)getLatestAssetFromQueryResults:(id)a3
{
  id v3 = a3;
  double v4 = [v3 results];

  double v5 = nr_framework_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    if (v6)
    {
      double v7 = nr_framework_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [v3 results];
        id v9 = [v8 count];
        *(_DWORD *)buf = 134217984;
        id v37 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPMobileAssetAutoTrigger: Query returned %lu assets", buf, 0xCu);
      }
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = [v3 results];
    id v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v11)
    {
      id v12 = v11;
      id v29 = v3;
      id v13 = 0;
      uint64_t v14 = *(void *)v32;
      uint64_t v15 = ASAttributeContentVersion;
      obj = v10;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          [v17 logAsset:v29];
          if (v13)
          {
            id v18 = [v13 attributes];
            id v19 = [v18 objectForKey:v15];
            id v20 = [v19 integerValue];

            BOOL v21 = [v17 attributes];
            id v22 = [v21 objectForKey:v15];
            id v23 = [v22 integerValue];

            if ((uint64_t)v23 > (uint64_t)v20)
            {
              id v24 = v17;

              id v13 = v24;
            }
          }
          else
          {
            id v13 = v17;
          }
        }
        id v10 = obj;
        id v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v12);
      id v3 = v29;
      goto LABEL_22;
    }
LABEL_21:
    id v13 = 0;
LABEL_22:

    goto LABEL_23;
  }
  if (v6)
  {
    id v10 = nr_framework_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NRMobileAssetManager — Query returned no assets", buf, 2u);
    }
    goto LABEL_21;
  }
  id v13 = 0;
LABEL_23:
  v25 = nr_framework_log();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

  if (v26)
  {
    v27 = nr_framework_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v37 = v13;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "EPMobileAssetAutoTrigger: Latest asset in query is %{public}@", buf, 0xCu);
    }
  }

  return v13;
}

- (id)mobileAssetDownloadOptionsUserInitiated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init((Class)MADownloadOptions);
  [v4 setDiscretionary:!v3];
  [v4 setDisableUI:1];
  [v4 setAllowsCellularAccess:1];
  [v4 setAllowDaemonConnectionRetries:1];

  return v4;
}

- (BOOL)wasUIUnlocked
{
  return self->_wasUIUnlocked;
}

- (void)setWasUIUnlocked:(BOOL)a3
{
  self->_BOOL wasUIUnlocked = a3;
}

- (int)uiUnlockNotifyToken
{
  return self->_uiUnlockNotifyToken;
}

- (void)setUiUnlockNotifyToken:(int)a3
{
  self->_int uiUnlockNotifyToken = a3;
}

- (NRPreferences)prefs
{
  return self->_prefs;
}

- (void)setPrefs:(id)a3
{
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (void)setServiceRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceRegistry, 0);

  objc_storeStrong((id *)&self->_prefs, 0);
}

@end