@interface CSDCallProviderManager
+ (id)_providersByIdentifierByFilteringForRemoteClientsFromProvidersByIdentifier:(id)a3;
+ (id)defaultAppBundleIdentifier;
- (BOOL)appShouldUseDeprecatedCallingIntents:(id)a3;
- (BOOL)validateUserIntentForCallSource:(id)a3;
- (CSDCallProviderManager)init;
- (CSDCallProviderManager)initWithDataSource:(id)a3 serialQueue:(id)a4;
- (CSDCallProviderManager)initWithDataSource:(id)a3 serialQueue:(id)a4 featureFlags:(id)a5;
- (CSDCallProviderManagerDataSource)dataSource;
- (CSDDeviceLockStateObserver)lockStateObserver;
- (CSDProtectedAppsUtilitiesProtocol)protectedAppsUtilities;
- (CSDUserIntentManager)userIntentManager;
- (NSDictionary)providersByIdentifier;
- (NSMapTable)delegateToQueue;
- (NSMutableDictionary)localProvidersByIdentifier;
- (NSMutableDictionary)pairedHostDeviceProvidersByIdentifier;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (id)_defaultAppProviderForRemoteClients:(BOOL)a3;
- (id)_providersByIdentifierForRemoteClients:(BOOL)a3;
- (id)_providersPassingTest:(id)a3 forRemoteClients:(BOOL)a4;
- (id)_sortedProvidersForRemoteClients:(BOOL)a3;
- (id)defaultAppProviderForRemoteClients:(BOOL)a3;
- (id)defaultAppRelayProviderToUse;
- (id)localProvidersByIdentifierForRemoteClients:(BOOL)a3;
- (id)pairedHostDeviceProvidersByIdentifierForRemoteClients:(BOOL)a3;
- (id)providersByIdentifierForRemoteClients:(BOOL)a3;
- (id)sortedProvidersForRemoteClients:(BOOL)a3;
- (id)uniqueRingtoneSoundLinkFilenameWithOriginalFilename:(id)a3;
- (void)_donateUserIntentForProviderWithIdentifier:(id)a3;
- (void)_unregisterUninstalledProvidersAndNotify:(BOOL)a3;
- (void)_updateProvidersByIdentifierAndNotify:(BOOL)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)donateUserIntentForProviderWithIdentifier:(id)a3;
- (void)installedProvidersChangedForDataSource:(id)a3;
- (void)launchAppForDialRequest:(id)a3 completion:(id)a4;
- (void)registerLocalProvider:(id)a3;
- (void)registerPairedHostDeviceProviders:(id)a3;
- (void)relayCallingStateChangedForDataSource:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)retrieveSavedProvidersByIdentifierAndNotify:(BOOL)a3 unregister:(BOOL)a4;
- (void)setDelegateToQueue:(id)a3;
- (void)setProtectedAppsUtilities:(id)a3;
- (void)setProvidersByIdentifier:(id)a3;
@end

@implementation CSDCallProviderManager

- (id)localProvidersByIdentifierForRemoteClients:(BOOL)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_10017EB9C;
  v14 = sub_10017EBAC;
  id v15 = 0;
  v5 = [(CSDCallProviderManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008030;
  block[3] = &unk_1005079F0;
  BOOL v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)pairedHostDeviceProvidersByIdentifierForRemoteClients:(BOOL)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_10017EB9C;
  v14 = sub_10017EBAC;
  id v15 = 0;
  v5 = [(CSDCallProviderManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007F98;
  block[3] = &unk_1005079F0;
  BOOL v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)providersByIdentifierForRemoteClients:(BOOL)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_10017EB9C;
  v14 = sub_10017EBAC;
  id v15 = 0;
  v5 = [(CSDCallProviderManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000080C8;
  block[3] = &unk_1005079F0;
  block[4] = self;
  block[5] = &v10;
  BOOL v9 = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

+ (id)_providersByIdentifierByFilteringForRemoteClientsFromProvidersByIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableDictionary dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = objc_msgSend(v3, "allValues", 0);
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 supportsCurrentPlatform])
        {
          v11 = [v10 identifier];
          [v4 setObject:v10 forKeyedSubscript:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v4 copy];

  return v12;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDictionary)providersByIdentifier
{
  return self->_providersByIdentifier;
}

- (NSMutableDictionary)pairedHostDeviceProvidersByIdentifier
{
  return self->_pairedHostDeviceProvidersByIdentifier;
}

- (NSMutableDictionary)localProvidersByIdentifier
{
  return self->_localProvidersByIdentifier;
}

- (CSDCallProviderManager)init
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.callprovidermanager", 0);
  v4 = [[CSDCallProviderManagerDataSource alloc] initWithSerialQueue:v3];
  v5 = [(CSDCallProviderManager *)self initWithDataSource:v4 serialQueue:v3];

  return v5;
}

- (CSDCallProviderManager)initWithDataSource:(id)a3 serialQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)TUFeatureFlags);
  BOOL v9 = [(CSDCallProviderManager *)self initWithDataSource:v7 serialQueue:v6 featureFlags:v8];

  return v9;
}

- (CSDCallProviderManager)initWithDataSource:(id)a3 serialQueue:(id)a4 featureFlags:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)CSDCallProviderManager;
  id v12 = [(CSDCallProviderManager *)&v32 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a4);
    objc_storeStrong((id *)&v13->_dataSource, a3);
    [(CSDCallProviderManagerDataSource *)v13->_dataSource setDelegate:v13];
    uint64_t v14 = +[NSMapTable weakToStrongObjectsMapTable];
    delegateToQueue = v13->_delegateToQueue;
    v13->_delegateToQueue = (NSMapTable *)v14;

    uint64_t v16 = +[NSMutableDictionary dictionary];
    localProvidersByIdentifier = v13->_localProvidersByIdentifier;
    v13->_localProvidersByIdentifier = (NSMutableDictionary *)v16;

    uint64_t v18 = +[NSMutableDictionary dictionary];
    pairedHostDeviceProvidersByIdentifier = v13->_pairedHostDeviceProvidersByIdentifier;
    v13->_pairedHostDeviceProvidersByIdentifier = (NSMutableDictionary *)v18;

    providersByIdentifier = v13->_providersByIdentifier;
    v13->_providersByIdentifier = (NSDictionary *)&__NSDictionary0__struct;

    v21 = [[CSDUserIntentManager alloc] initWithQueue:v10];
    userIntentManager = v13->_userIntentManager;
    v13->_userIntentManager = v21;

    objc_storeStrong((id *)&v13->_featureFlags, a5);
    v23 = objc_alloc_init(CSDProtectedAppsUtilities);
    protectedAppsUtilities = v13->_protectedAppsUtilities;
    v13->_protectedAppsUtilities = (CSDProtectedAppsUtilitiesProtocol *)v23;

    objc_initWeak(&location, v13);
    queue = v13->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017DD48;
    block[3] = &unk_100507678;
    v26 = v13;
    v29 = v26;
    objc_copyWeak(&v30, &location);
    dispatch_sync(queue, block);
    [(CSDCallProviderManager *)v26 retrieveSavedProvidersByIdentifierAndNotify:0 unregister:1];
    objc_destroyWeak(&v30);

    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)retrieveSavedProvidersByIdentifierAndNotify:(BOOL)a3 unregister:(BOOL)a4
{
  id v7 = [(CSDCallProviderManager *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017DF50;
  v8[3] = &unk_100508FB0;
  v8[4] = self;
  BOOL v9 = a4;
  BOOL v10 = a3;
  dispatch_async(v7, v8);
}

- (void)_updateProvidersByIdentifierAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CSDCallProviderManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDCallProviderManager *)self localProvidersByIdentifier];
  id v7 = [(CSDCallProviderManager *)self dataSource];
  if ([v7 isRelayCallingGuaranteed])
  {
    id v8 = [(CSDCallProviderManager *)self pairedHostDeviceProvidersByIdentifier];
    id v9 = [v8 count];

    if (!v9) {
      goto LABEL_5;
    }
    [(CSDCallProviderManager *)self pairedHostDeviceProvidersByIdentifier];
    id v6 = v7 = v6;
  }

LABEL_5:
  BOOL v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating current providers to %@", buf, 0xCu);
  }

  [(CSDCallProviderManager *)self setProvidersByIdentifier:v6];
  if (v3)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = [(CSDCallProviderManager *)self delegateToQueue];
    id v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v16 = [(CSDCallProviderManager *)self delegateToQueue];
          long long v17 = [v16 objectForKey:v15];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10017E4D8;
          block[3] = &unk_100504F10;
          void block[4] = v15;
          block[5] = self;
          dispatch_async(v17, block);
        }
        id v12 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
  }
}

- (void)_unregisterUninstalledProvidersAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CSDCallProviderManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDCallProviderManager *)self localProvidersByIdentifier];
  id v7 = [v6 allValues];
  id v8 = +[NSMutableSet setWithArray:v7];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = [v8 copy];
  id v10 = [v9 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (([v14 isSystemProvider] & 1) == 0)
        {
          uint64_t v15 = [(CSDCallProviderManager *)self dataSource];
          unsigned int v16 = [v15 isProviderInstalled:v14];

          if (!v16) {
            continue;
          }
        }
        [v8 removeObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    BOOL v28 = v3;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v17 = v8;
    id v18 = [v17 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
          long long v23 = sub_100008DCC();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v22;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Unregistering provider because its application is no longer installed: %@", buf, 0xCu);
          }

          v24 = [(CSDCallProviderManager *)self localProvidersByIdentifier];
          v25 = [v22 identifier];
          [v24 setObject:0 forKeyedSubscript:v25];
        }
        id v19 = [v17 countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v19);
    }

    v26 = [(CSDCallProviderManager *)self localProvidersByIdentifier];
    v27 = [(CSDCallProviderManager *)self dataSource];
    [v27 setRegisteredLocalProvidersByIdentifier:v26];

    [(CSDCallProviderManager *)self _updateProvidersByIdentifierAndNotify:v28];
  }
}

- (id)uniqueRingtoneSoundLinkFilenameWithOriginalFilename:(id)a3
{
  id v3 = a3;
  v4 = +[NSUUID UUID];
  v5 = [v4 UUIDString];
  id v6 = +[NSString stringWithFormat:@"%@-%@", v5, v3];

  return v6;
}

- (void)_donateUserIntentForProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallProviderManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Donating user intent to call provider with identifier: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(CSDCallProviderManager *)self userIntentManager];
  [v7 donateUserIntentForCallProviderIdentifier:v4];
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CSDCallProviderManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017EA40;
  block[3] = &unk_100504FE0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallProviderManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017EB48;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (id)_providersByIdentifierForRemoteClients:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CSDCallProviderManager *)self queue];
  dispatch_assert_queue_V2(v5);

  if (v3)
  {
    id v6 = objc_opt_class();
    id v7 = [(CSDCallProviderManager *)self providersByIdentifier];
    id v8 = [v6 _providersByIdentifierByFilteringForRemoteClientsFromProvidersByIdentifier:v7];
  }
  else
  {
    id v7 = [(CSDCallProviderManager *)self providersByIdentifier];
    id v8 = [v7 copy];
  }
  id v9 = v8;

  return v9;
}

- (id)sortedProvidersForRemoteClients:(BOOL)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10017EB9C;
  uint64_t v14 = sub_10017EBAC;
  id v15 = 0;
  v5 = [(CSDCallProviderManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017ED7C;
  block[3] = &unk_1005079F0;
  void block[4] = self;
  void block[5] = &v10;
  BOOL v9 = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)_sortedProvidersForRemoteClients:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CSDCallProviderManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDCallProviderManager *)self _defaultAppProviderForRemoteClients:v3];
  id v7 = [(CSDCallProviderManager *)self _providersByIdentifierForRemoteClients:v3];
  id v8 = [v7 allValues];

  BOOL v9 = [v8 sortedArrayUsingComparator:&stru_100508FF0];
  id v10 = [v9 mutableCopy];

  if (v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10017EF94;
    v14[3] = &unk_100509018;
    id v11 = v6;
    id v15 = v11;
    uint64_t v12 = [v10 indexesOfObjectsPassingTest:v14];
    [v10 removeObjectsAtIndexes:v12];
    [v10 insertObject:v11 atIndex:0];
  }

  return v10;
}

- (id)defaultAppProviderForRemoteClients:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10017EB9C;
  unsigned int v16 = sub_10017EBAC;
  id v17 = 0;
  v5 = [(CSDCallProviderManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017F160;
  block[3] = &unk_1005079F0;
  void block[4] = self;
  void block[5] = &v12;
  BOOL v11 = v3;
  dispatch_sync(v5, block);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v13[5];
    *(_DWORD *)buf = 67109378;
    BOOL v19 = v3;
    __int16 v20 = 2112;
    uint64_t v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetched default app provider forRemoteClient %d %@", buf, 0x12u);
  }

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (id)_defaultAppProviderForRemoteClients:(BOOL)a3
{
  uint64_t v3 = a3;
  v5 = [(CSDCallProviderManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDCallProviderManager *)self localProvidersByIdentifier];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"com.apple.coretelephony"];

  id v8 = [(CSDCallProviderManager *)self featureFlags];
  unsigned __int8 v9 = [v8 defaultAppsEnabled];

  if ((v9 & 1) == 0)
  {
    id v26 = v7;
    goto LABEL_32;
  }
  id v10 = [(CSDCallProviderManager *)self _providersByIdentifierForRemoteClients:v3];
  BOOL v11 = [v10 allValues];

  uint64_t v12 = +[IMLockdownManager sharedInstance];
  unsigned int v13 = [v12 isInternalInstall];

  if (v13)
  {
    uint64_t v14 = +[NSUserDefaults tu_defaults];
    id v15 = [v14 stringForKey:@"DebugDefaultAppsProvider"];

    if ([v15 length])
    {
      unsigned int v35 = v3;
      unsigned int v16 = sub_100008DCC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[Internal] Found DebugDefaultAppsProvider userdefault value %@", buf, 0xCu);
      }

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v17 = v11;
      id v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v39;
        long long v33 = v11;
        long long v34 = v7;
LABEL_8:
        uint64_t v21 = 0;
        while (1)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v38 + 1) + 8 * v21);
          long long v23 = objc_msgSend(v22, "identifier", v33, v34);
          if ([v23 isEqualToString:v15]) {
            break;
          }
          v24 = [v22 bundleIdentifier];
          unsigned __int8 v25 = [v24 isEqualToString:v15];

          if (v25) {
            goto LABEL_18;
          }
          if (v19 == (id)++v21)
          {
            id v19 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
            BOOL v11 = v33;
            uint64_t v7 = v34;
            if (v19) {
              goto LABEL_8;
            }
            goto LABEL_15;
          }
        }

LABEL_18:
        id v26 = v22;

        BOOL v11 = v33;
        uint64_t v7 = v34;
        uint64_t v3 = v35;
        if (!v26) {
          goto LABEL_22;
        }
        v27 = sub_100008DCC();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v44 = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[Internal] Found matching debug provider %@", buf, 0xCu);
        }

        goto LABEL_31;
      }
LABEL_15:

      uint64_t v3 = v35;
    }
LABEL_22:
  }
  BOOL v28 = [(CSDCallProviderManager *)self defaultAppRelayProviderToUse];
  id v15 = v28;
  if (v28)
  {
    id v15 = v28;
    id v26 = v15;
  }
  else
  {
    long long v29 = [(id)objc_opt_class() defaultAppBundleIdentifier];
    if (![v29 length]) {
      goto LABEL_27;
    }
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10017F5D4;
    v36[3] = &unk_100509040;
    id v37 = v29;
    long long v30 = [(CSDCallProviderManager *)self _providersPassingTest:v36 forRemoteClients:v3];
    id v26 = [v30 firstObject];

    if (!v26)
    {
LABEL_27:
      long long v31 = sub_100008DCC();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_1003AE8D0();
      }

      id v26 = v7;
    }
  }
LABEL_31:

LABEL_32:

  return v26;
}

- (void)registerLocalProvider:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallProviderManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017F6CC;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  unsigned __int8 v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)registerPairedHostDeviceProviders:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallProviderManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017FC1C;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  unsigned __int8 v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)donateUserIntentForProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallProviderManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017FF50;
  v7[3] = &unk_100504F10;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (BOOL)validateUserIntentForCallSource:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(CSDCallProviderManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018005C;
  block[3] = &unk_100507368;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)launchAppForDialRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallProviderManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100180194;
  block[3] = &unk_100507D10;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (BOOL)appShouldUseDeprecatedCallingIntents:(id)a3
{
  id v3 = a3;
  id v4 = +[LSApplicationRecord csd_applicationRecordForBundleIdentifier:v3];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 compatibilityObject];
    id v7 = [v6 plugInKitPlugins];
    id v8 = INSupportedIntentsByExtensions();
    id v9 = 0;

    uint64_t v10 = TUDialRequestUserActivityTypeCall;
    unsigned int v11 = [v8 containsObject:TUDialRequestUserActivityTypeCall];
    if (v11)
    {
      id v12 = sub_100008DCC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v21 = v3;
        __int16 v22 = 2114;
        uint64_t v23 = v10;
        uint64_t v13 = "App %{public}@ supports %{public}@.";
        id v14 = v12;
        uint32_t v15 = 22;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
    else
    {
      uint64_t v17 = TUDialRequestUserActivityTypeAudioCall;
      if (([v8 containsObject:TUDialRequestUserActivityTypeAudioCall] & 1) == 0)
      {
        uint64_t v18 = TUDialRequestUserActivityTypeVideoCall;
        if (![v8 containsObject:TUDialRequestUserActivityTypeVideoCall])
        {
          id v12 = sub_100008DCC();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            id v21 = v3;
            __int16 v22 = 2114;
            uint64_t v23 = v17;
            __int16 v24 = 2114;
            uint64_t v25 = v18;
            __int16 v26 = 2112;
            v27 = v9;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "App %{public}@ does not declare support for any dialing intents. Using %{public}@ or %{public}@. Error: %@", buf, 0x2Au);
          }
          goto LABEL_15;
        }
      }
      id v12 = sub_100008DCC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        id v21 = v3;
        __int16 v22 = 2114;
        uint64_t v23 = v10;
        __int16 v24 = 2114;
        uint64_t v25 = v17;
        __int16 v26 = 2114;
        v27 = TUDialRequestUserActivityTypeVideoCall;
        uint64_t v13 = "[WARN] App %{public}@ does not support %{public}@, using deprecated %{public}@ and %{public}@.";
        id v14 = v12;
        uint32_t v15 = 42;
        goto LABEL_12;
      }
    }
LABEL_15:

    char v16 = v11 ^ 1;
    goto LABEL_16;
  }
  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1003AEA50();
  }
  char v16 = 0;
LABEL_16:

  return v16;
}

- (id)_providersPassingTest:(id)a3 forRemoteClients:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (unsigned int (**)(id, void))a3;
  id v7 = [(CSDCallProviderManager *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDCallProviderManager *)self _providersByIdentifierForRemoteClients:v4];
  id v9 = [v8 allValues];
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (v6[2](v6, v16)) {
          objc_msgSend(v10, "addObject:", v16, (void)v19);
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v17 = [v10 copy];

  return v17;
}

+ (id)defaultAppBundleIdentifier
{
  return (id)_defaultCallingAppLSBundleIdentifier(a1, a2);
}

- (id)defaultAppRelayProviderToUse
{
  v2 = [(CSDCallProviderManager *)self localProvidersByIdentifier];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.coretelephony"];

  if ((unint64_t)(defaultAppRelayTelephonySetting() - 1) > 1) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }

  return v4;
}

- (void)relayCallingStateChangedForDataSource:(id)a3
{
  id v4 = [(CSDCallProviderManager *)self queue];
  dispatch_assert_queue_V2(v4);

  [(CSDCallProviderManager *)self _updateProvidersByIdentifierAndNotify:1];
}

- (void)installedProvidersChangedForDataSource:(id)a3
{
  id v4 = [(CSDCallProviderManager *)self queue];
  dispatch_assert_queue_V2(v4);

  [(CSDCallProviderManager *)self _unregisterUninstalledProvidersAndNotify:1];
}

- (CSDUserIntentManager)userIntentManager
{
  return self->_userIntentManager;
}

- (CSDCallProviderManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setProvidersByIdentifier:(id)a3
{
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (void)setDelegateToQueue:(id)a3
{
}

- (CSDDeviceLockStateObserver)lockStateObserver
{
  return self->_lockStateObserver;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CSDProtectedAppsUtilitiesProtocol)protectedAppsUtilities
{
  return self->_protectedAppsUtilities;
}

- (void)setProtectedAppsUtilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedAppsUtilities, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_lockStateObserver, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_providersByIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedHostDeviceProvidersByIdentifier, 0);
  objc_storeStrong((id *)&self->_localProvidersByIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_userIntentManager, 0);
}

@end