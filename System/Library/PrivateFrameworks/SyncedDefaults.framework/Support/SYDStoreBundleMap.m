@interface SYDStoreBundleMap
+ (id)disabledStoreIdentifiers;
+ (id)sharedInstance;
- (BOOL)isCloudSyncUserDefaultEnabledForStoreIdentifier:(id)a3;
- (BOOL)isStoreIdentifierUsedOnThisDevice:(id)a3;
- (BOOL)shouldSyncStoreWithIdentifier:(id)a3;
- (NSDictionary)cachedStoreBundleMap;
- (OS_dispatch_queue)queue;
- (SYDStoreBundleMap)init;
- (id)bundleIdentifiersForStoreIdentifier:(id)a3;
- (id)generateStoreBundleMap;
- (id)storeIdentifiersForInstalledBundles;
- (void)clearCachedStoreBundleMap;
- (void)dealloc;
- (void)generateStoreBundleMapIfNecessary;
- (void)installedAppsDidChange:(id)a3;
- (void)setCachedStoreBundleMap:(id)a3;
- (void)setCloudSyncUserDefaultEnabled:(BOOL)a3 storeIdentifier:(id)a4;
- (void)setQueue:(id)a3;
@end

@implementation SYDStoreBundleMap

+ (id)sharedInstance
{
  if (qword_10005BAC8 != -1) {
    dispatch_once(&qword_10005BAC8, &stru_100050990);
  }
  v2 = (void *)qword_10005BAC0;
  return v2;
}

- (BOOL)isStoreIdentifierUsedOnThisDevice:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() disabledStoreIdentifiers];
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = SYDGetConnectionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002E980();
    }

    unsigned __int8 v8 = 0;
  }
  else
  {
    v9 = [(SYDStoreBundleMap *)self storeIdentifiersForInstalledBundles];
    unsigned __int8 v10 = [v9 containsObject:v4];

    if (v10) {
      unsigned __int8 v8 = 1;
    }
    else {
      unsigned __int8 v8 = [v4 hasPrefix:@"com.apple."];
    }
  }

  return v8;
}

- (id)storeIdentifiersForInstalledBundles
{
  uint64_t v7 = 0;
  unsigned __int8 v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned __int8 v10 = sub_100010EC4;
  v11 = sub_100010E94;
  id v12 = 0;
  v3 = [(SYDStoreBundleMap *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000EF18;
  v6[3] = &unk_100050A78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (id)disabledStoreIdentifiers
{
  if (qword_10005BAD8 != -1) {
    dispatch_once(&qword_10005BAD8, &stru_100050A00);
  }
  v2 = (void *)qword_10005BAD0;
  return v2;
}

- (void)generateStoreBundleMapIfNecessary
{
  v3 = [(SYDStoreBundleMap *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SYDStoreBundleMap *)self cachedStoreBundleMap];

  if (!v4)
  {
    v5 = SYDGetMiscLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10002EADC(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    v13 = [(SYDStoreBundleMap *)self generateStoreBundleMap];
    [(SYDStoreBundleMap *)self setCachedStoreBundleMap:v13];
  }
}

- (NSDictionary)cachedStoreBundleMap
{
  return self->_cachedStoreBundleMap;
}

- (SYDStoreBundleMap)init
{
  v9.receiver = self;
  v9.super_class = (Class)SYDStoreBundleMap;
  v2 = [(SYDStoreBundleMap *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.kvs.bundle-store-map", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSDistributedNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"installedAppsDidChange:" name:@"com.apple.LaunchServices.applicationRegistered" object:0];

    uint64_t v7 = +[NSDistributedNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"installedAppsDidChange:" name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SYDStoreBundleMap;
  [(SYDStoreBundleMap *)&v4 dealloc];
}

- (BOOL)shouldSyncStoreWithIdentifier:(id)a3
{
  id v4 = a3;
  if (![(SYDStoreBundleMap *)self isStoreIdentifierUsedOnThisDevice:v4])
  {
    uint64_t v7 = SYDGetConnectionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002E838();
    }
    goto LABEL_11;
  }
  v5 = +[SYDTCCHelper sharedHelper];
  unsigned int v6 = [v5 isUbiquityDisabledForStoreIdentifier:v4];

  if (v6)
  {
    uint64_t v7 = SYDGetConnectionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002E768();
    }
LABEL_11:

    BOOL v8 = 0;
    goto LABEL_12;
  }
  if (![(SYDStoreBundleMap *)self isCloudSyncUserDefaultEnabledForStoreIdentifier:v4])
  {
    uint64_t v7 = SYDGetConnectionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002E7D0();
    }
    goto LABEL_11;
  }
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (BOOL)isCloudSyncUserDefaultEnabledForStoreIdentifier:(id)a3
{
  id v5 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  unsigned int v6 = [(SYDStoreBundleMap *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000115A4;
  v9[3] = &unk_1000509B8;
  id v10 = v5;
  uint64_t v11 = self;
  uint64_t v12 = &v14;
  SEL v13 = a2;
  id v7 = v5;
  dispatch_sync(v6, v9);

  LOBYTE(self) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (void)setCloudSyncUserDefaultEnabled:(BOOL)a3 storeIdentifier:(id)a4
{
  id v7 = a4;
  BOOL v8 = [(SYDStoreBundleMap *)self queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100011790;
  v10[3] = &unk_1000509E0;
  uint64_t v12 = self;
  SEL v13 = a2;
  id v11 = v7;
  BOOL v14 = a3;
  id v9 = v7;
  dispatch_sync(v8, v10);
}

- (id)bundleIdentifiersForStoreIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_100010EC4;
  char v17 = sub_100010E94;
  id v18 = 0;
  id v5 = [(SYDStoreBundleMap *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011B38;
  block[3] = &unk_100050A28;
  block[4] = self;
  uint64_t v12 = &v13;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync(v5, block);

  if ([(id)v14[5] count])
  {
    id v7 = SYDGetMiscLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002EA50();
    }
  }
  else
  {
    id v7 = SYDGetMiscLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002E9E8();
    }
  }

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)clearCachedStoreBundleMap
{
  v3 = [(SYDStoreBundleMap *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011C34;
  block[3] = &unk_100050A50;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)generateStoreBundleMap
{
  v2 = SYDGetMiscLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10002EB4C(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v11 = +[LSApplicationRecord enumeratorWithOptions:0];
  +[LSApplicationExtensionRecord enumeratorWithOptions:0];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v43 = long long v66 = 0u;
  v44 = (void *)v11;
  v75[0] = v11;
  v75[1] = v43;
  id obj = +[NSArray arrayWithObjects:v75 count:2];
  id v47 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v64;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v64 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v48 = v12;
        uint64_t v13 = *(void **)(*((void *)&v63 + 1) + 8 * v12);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v51 = v13;
        id v14 = [v51 countByEnumeratingWithState:&v59 objects:v74 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v60;
          uint64_t v49 = *(void *)v60;
          do
          {
            char v17 = 0;
            id v50 = v15;
            do
            {
              if (*(void *)v60 != v16) {
                objc_enumerationMutation(v51);
              }
              id v18 = *(NSObject **)(*((void *)&v59 + 1) + 8 * (void)v17);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v19 = [v18 effectiveBundleIdentifier];
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v31 = SYDGetMiscLog();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v69 = v18;
                    _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "LSBundleRecord did not map to an effectiveBundleIdentifier or contain one: %@", buf, 0xCu);
                  }

                  goto LABEL_25;
                }
                uint64_t v19 = [v18 bundleIdentifier];
              }
              v20 = v19;
              if (v19)
              {
                v21 = SYDGetMiscLog();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v69 = v20;
                  _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Checking if bundle identifier: %@ is entitled for KVS", buf, 0xCu);
                }

                v22 = [v18 entitlements];
                uint64_t v23 = [v22 objectForKey:@"com.apple.developer.ubiquity-kvstore-identifier" ofClass:objc_opt_class()];
                uint64_t v24 = objc_opt_class();
                uint64_t v25 = objc_opt_class();
                uint64_t v26 = v24;
                v27 = (void *)v23;
                v28 = [v22 objectForKey:@"com.apple.private.ubiquity-additional-kvstore-identifiers" ofClass:v26 valuesOfClass:v25];
                v29 = v28;
                v54 = v28;
                if (v27)
                {
                  id v30 = objc_alloc_init((Class)NSMutableArray);
                  [v30 addObject:v27];
                  goto LABEL_29;
                }
                if ([v28 count])
                {
                  id v30 = objc_alloc_init((Class)NSMutableArray);
                  v29 = v54;
LABEL_29:
                  if ([v29 count]) {
                    [v30 addObjectsFromArray:v29];
                  }
                  v52 = v27;
                  v53 = v22;
                  v32 = SYDGetMiscLog();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                  {
                    v40 = [v30 count];
                    *(_DWORD *)buf = 134218498;
                    v69 = v40;
                    __int16 v70 = 2112;
                    v71 = v20;
                    __int16 v72 = 2112;
                    id v73 = v30;
                    _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Found %ld store identifiers for bundle identifier: %@ %@ ", buf, 0x20u);
                  }

                  long long v57 = 0u;
                  long long v58 = 0u;
                  long long v55 = 0u;
                  long long v56 = 0u;
                  id v33 = v30;
                  id v34 = [v33 countByEnumeratingWithState:&v55 objects:v67 count:16];
                  if (v34)
                  {
                    id v35 = v34;
                    uint64_t v36 = *(void *)v56;
                    do
                    {
                      for (i = 0; i != v35; i = (char *)i + 1)
                      {
                        if (*(void *)v56 != v36) {
                          objc_enumerationMutation(v33);
                        }
                        uint64_t v38 = *(void *)(*((void *)&v55 + 1) + 8 * i);
                        id v39 = [v10 objectForKeyedSubscript:v38];
                        if (!v39)
                        {
                          id v39 = objc_alloc_init((Class)NSMutableArray);
                          [v10 setObject:v39 forKeyedSubscript:v38];
                        }
                        [v39 addObject:v20];
                      }
                      id v35 = [v33 countByEnumeratingWithState:&v55 objects:v67 count:16];
                    }
                    while (v35);
                  }

                  uint64_t v16 = v49;
                  id v15 = v50;
                  v27 = v52;
                  v22 = v53;
                }

                goto LABEL_44;
              }
LABEL_25:
              v20 = SYDGetMiscLog();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v69 = v18;
                _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "No bundle identifier found using LSBundleRecord for: %@", buf, 0xCu);
              }
LABEL_44:

              char v17 = (char *)v17 + 1;
            }
            while (v17 != v15);
            id v15 = [v51 countByEnumeratingWithState:&v59 objects:v74 count:16];
          }
          while (v15);
        }

        uint64_t v12 = v48 + 1;
      }
      while ((id)(v48 + 1) != v47);
      id v47 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
    }
    while (v47);
  }

  v41 = SYDGetMiscLog();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v10;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Generated new store bundle mapping: %@", buf, 0xCu);
  }

  return v10;
}

- (void)installedAppsDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SYDStoreBundleMap *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012380;
  v7[3] = &unk_100050AA0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setQueue:(id)a3
{
}

- (void)setCachedStoreBundleMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStoreBundleMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end