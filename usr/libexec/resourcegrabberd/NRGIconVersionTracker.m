@interface NRGIconVersionTracker
- (BOOL)_appVersionChanged:(id)a3;
- (NRGIconVersionTracker)initWithDelegate:(id)a3;
- (NRGIconVersionTracking)delegate;
- (id)_activeVersionHistoryURL;
- (id)_noLongerTrackedBundleIDs:(id)a3;
- (id)_readActiveIconVersions;
- (void)_appConduitUpdated;
- (void)_removeActiveIconVersions;
- (void)_withLock:(id)a3;
- (void)_writeActiveIconVersions;
- (void)commit;
- (void)dealloc;
- (void)deviceSwitched;
- (void)reset;
- (void)setVersion:(id)a3 forBundleID:(id)a4;
- (void)start;
- (void)suspend;
@end

@implementation NRGIconVersionTracker

- (NRGIconVersionTracker)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NRGIconVersionTracker;
  v5 = [(NRGIconVersionTracker *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_appConduitNotifyToken = -1;
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [(NRGIconVersionTracker *)v6 _readActiveIconVersions];
    iconVersionDictionary = v6->_iconVersionDictionary;
    v6->_iconVersionDictionary = (NSMutableDictionary *)v7;

    v9 = nrg_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v6->_iconVersionDictionary;
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NRGIconVersionTracker initialized, iconVersionDictionary = %@", buf, 0xCu);
    }

    if ([(NSMutableDictionary *)v6->_iconVersionDictionary count]) {
      [(NRGIconVersionTracker *)v6 start];
    }
  }

  return v6;
}

- (void)dealloc
{
  [(NRGIconVersionTracker *)self suspend];
  v3.receiver = self;
  v3.super_class = (Class)NRGIconVersionTracker;
  [(NRGIconVersionTracker *)&v3 dealloc];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)start
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100007AD8;
  v2[3] = &unk_1000205E0;
  v2[4] = self;
  [(NRGIconVersionTracker *)self _withLock:v2];
}

- (void)suspend
{
  objc_super v3 = nrg_daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "suspending icon version tracker", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007E34;
  v4[3] = &unk_1000205E0;
  v4[4] = self;
  [(NRGIconVersionTracker *)self _withLock:v4];
}

- (void)deviceSwitched
{
  objc_super v3 = nrg_daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "icon version tracker device switched", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007F34;
  v4[3] = &unk_1000205E0;
  v4[4] = self;
  [(NRGIconVersionTracker *)self _withLock:v4];
}

- (void)setVersion:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008040;
  v9[3] = &unk_100020608;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(NRGIconVersionTracker *)self _withLock:v9];
}

- (void)commit
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100008134;
  v2[3] = &unk_1000205E0;
  v2[4] = self;
  [(NRGIconVersionTracker *)self _withLock:v2];
}

- (void)reset
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000081D8;
  v2[3] = &unk_1000205E0;
  v2[4] = self;
  [(NRGIconVersionTracker *)self _withLock:v2];
}

- (void)_appConduitUpdated
{
  objc_super v3 = NRGGetActivePairedDevice();
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"1CFACCB8-FFEB-4682-A50E-16F853583912"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  if (v5)
  {
    id v6 = +[NSMutableSet set];
    id v7 = +[NSMutableSet set];
    id v8 = +[ACXDeviceConnection sharedDeviceConnection];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000083CC;
    v11[3] = &unk_100020680;
    id v12 = v7;
    v13 = self;
    id v14 = v6;
    id v9 = v6;
    id v10 = v7;
    [v8 enumerateInstalledApplicationsOnPairedDevice:v3 withBlock:v11];
  }
  else
  {
    id v10 = nrg_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ignoring app conduit update as activeDevice %@ does not support the NRDEVICECAPABILITY_STANDALONE_APPS capability", buf, 0xCu);
    }
  }
}

- (id)_noLongerTrackedBundleIDs:(id)a3
{
  id v4 = a3;
  +[NSMutableSet set];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_1000088B0;
  id v11 = &unk_100020658;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = self;
  id v5 = v12;
  [(NRGIconVersionTracker *)self _withLock:&v8];
  [v5 minusSet:v4, v8, v9, v10, v11];

  id v6 = [v5 copy];

  return v6;
}

- (BOOL)_appVersionChanged:(id)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100008BBC;
  v22 = sub_100008BCC;
  id v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100008BD4;
  v14[3] = &unk_1000206A8;
  v17 = &v18;
  v15 = self;
  id v3 = a3;
  id v16 = v3;
  [(NRGIconVersionTracker *)v15 _withLock:v14];
  id v4 = (void *)v19[5];
  id v5 = [v3 bundleShortVersion];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = nrg_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v3 bundleIdentifier];
      uint64_t v9 = [v3 bundleShortVersion];
      *(_DWORD *)buf = 138412546;
      id v25 = v8;
      __int16 v26 = 2112;
      v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ (%@) version hasn't changed", buf, 0x16u);
    }
  }
  else
  {
    id v7 = nrg_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v3 bundleIdentifier];
      id v11 = (void *)v19[5];
      id v12 = [v3 bundleShortVersion];
      *(_DWORD *)buf = 138412802;
      id v25 = v10;
      __int16 v26 = 2112;
      v27 = v11;
      __int16 v28 = 2112;
      v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ version changed from %@ to %@", buf, 0x20u);
    }
  }

  _Block_object_dispose(&v18, 8);
  return v6 ^ 1;
}

- (id)_activeVersionHistoryURL
{
  v2 = +[NRGResourceCache cacheDirPathForPairedDevice];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"%@.archive", @"IconVersionDictionary"];
    v7[0] = v2;
    v7[1] = v3;
    id v4 = +[NSArray arrayWithObjects:v7 count:2];
    id v5 = +[NSURL fileURLWithPathComponents:v4];
  }
  else
  {
    id v3 = nrg_framework_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000149D4(v3);
    }
    id v5 = 0;
  }

  return v5;
}

- (id)_readActiveIconVersions
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(NRGIconVersionTracker *)self _activeVersionHistoryURL];
  if (v4)
  {
    id v5 = +[NSData dataWithContentsOfURL:v4];
    if (v5)
    {
      uint64_t v6 = objc_opt_class();
      id v12 = 0;
      id v7 = +[NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() fromData:v5 error:&v12];
      id v8 = v12;
      if (v7)
      {
        uint64_t v9 = nrg_framework_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v14 = v4;
          __int16 v15 = 2112;
          id v16 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "loaded icon versions from %@ %@", buf, 0x16u);
        }

        id v10 = v3;
        id v3 = [v7 mutableCopy];
      }
      else
      {
        id v10 = nrg_framework_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100014A18();
        }
      }
    }
  }

  return v3;
}

- (void)_writeActiveIconVersions
{
  id v3 = [(NRGIconVersionTracker *)self _activeVersionHistoryURL];
  if (v3)
  {
    iconVersionDictionary = self->_iconVersionDictionary;
    p_iconVersionDictionary = &self->_iconVersionDictionary;
    id v13 = 0;
    uint64_t v6 = +[NSKeyedArchiver archivedDataWithRootObject:iconVersionDictionary requiringSecureCoding:0 error:&v13];
    id v7 = v13;
    if (v7 || !v6)
    {
      id v10 = nrg_daemon_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100014BC8();
      }
    }
    else
    {
      id v12 = 0;
      [v6 writeToURL:v3 options:0x10000000 error:&v12];
      id v8 = v12;
      if (v8)
      {
        id v7 = v8;
        uint64_t v9 = nrg_daemon_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100014B60();
        }
      }
      else
      {
        id v7 = nrg_daemon_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = *p_iconVersionDictionary;
          *(_DWORD *)buf = 138412546;
          __int16 v15 = v3;
          __int16 v16 = 2112;
          v17 = v11;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "wrote icon versions to %@ %@", buf, 0x16u);
        }
      }
    }
  }
}

- (void)_removeActiveIconVersions
{
  v2 = [(NRGIconVersionTracker *)self _activeVersionHistoryURL];
  id v3 = v2;
  if (v2)
  {
    id v4 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", [v2 fileSystemRepresentation], 4);
    id v5 = +[NSFileManager defaultManager];
    unsigned int v6 = [v5 fileExistsAtPath:v4];

    if (v6)
    {
      id v7 = +[NSFileManager defaultManager];
      id v10 = 0;
      [v7 removeItemAtPath:v4 error:&v10];
      id v8 = v10;

      if (v8)
      {
        uint64_t v9 = nrg_daemon_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100014C30();
        }
      }
    }
    else
    {
      id v8 = nrg_daemon_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "icon version file does not exit %@", buf, 0xCu);
      }
    }
  }
}

- (NRGIconVersionTracking)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NRGIconVersionTracking *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_iconVersionDictionary, 0);
}

@end