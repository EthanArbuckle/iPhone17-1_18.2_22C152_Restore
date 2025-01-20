@interface WCDIndexManager
+ (id)sharedManager;
- (NSMutableDictionary)indexCache;
- (WCDIndexManager)init;
- (id)_bundleIDForApplication:(id)a3;
- (id)contentIndexWithApplication:(id)a3 type:(id)a4 pairingID:(id)a5;
- (id)fileIndexForApplication:(id)a3 pairingID:(id)a4;
- (id)fileResultsIndexForApplication:(id)a3 pairingID:(id)a4;
- (id)indexKeyWithBundleID:(id)a3 type:(id)a4 pairingID:(id)a5;
- (id)userInfoIndexForApplication:(id)a3 pairingID:(id)a4;
- (id)userInfoResultsIndexForApplication:(id)a3 pairingID:(id)a4;
- (int64_t)totalCount;
- (void)clearCacheForApplication:(id)a3;
- (void)setIndexCache:(id)a3;
- (void)setTotalCount:(int64_t)a3;
@end

@implementation WCDIndexManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F85C;
  block[3] = &unk_100044E28;
  block[4] = a1;
  if (qword_1000516D0 != -1) {
    dispatch_once(&qword_1000516D0, block);
  }
  v2 = (void *)qword_1000516C8;

  return v2;
}

- (WCDIndexManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)WCDIndexManager;
  v2 = [(WCDIndexManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    indexCache = v2->_indexCache;
    v2->_indexCache = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)_bundleIDForApplication:(id)a3
{
  return [a3 companionAppBundleIdentifier];
}

- (id)contentIndexWithApplication:(id)a3 type:(id)a4 pairingID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WCDIndexManager *)self _bundleIDForApplication:v8];
  v12 = [(WCDIndexManager *)self indexKeyWithBundleID:v11 type:v9 pairingID:v10];
  v13 = [(WCDIndexManager *)self indexCache];
  id v14 = [v13 objectForKeyedSubscript:v12];

  if (!v14)
  {
    v15 = +[WCDSystemMonitor sharedSystemMonitor];
    v16 = [v15 dataContainerURLForApplicationInfo:v8];

    if ([v9 isEqual:@"file"])
    {
      uint64_t v17 = WCSessionFilesURLInContainer();
    }
    else if ([v9 isEqual:@"file_results"])
    {
      uint64_t v17 = WCFileTransfersURLInContainer();
    }
    else if ([v9 isEqual:@"user_info"])
    {
      uint64_t v17 = WCTransferredUserInfoInboxURLInContainer();
    }
    else
    {
      if (![v9 isEqual:@"user_info_results"]) {
        goto LABEL_12;
      }
      uint64_t v17 = WCUserInfoTransfersInContainer();
    }
    v18 = (void *)v17;
    if (v17)
    {
      id v14 = [objc_alloc((Class)WCContentIndex) initWithContainingFolder:v17];
      v19 = [(WCDIndexManager *)self indexCache];
      [v19 setObject:v14 forKeyedSubscript:v12];

LABEL_13:
      goto LABEL_14;
    }
LABEL_12:
    id v14 = 0;
    goto LABEL_13;
  }
LABEL_14:

  return v14;
}

- (id)indexKeyWithBundleID:(id)a3 type:(id)a4 pairingID:(id)a5
{
  return +[NSString stringWithFormat:@"%@-%@-%@", a3, a4, a5];
}

- (id)fileIndexForApplication:(id)a3 pairingID:(id)a4
{
  return [(WCDIndexManager *)self contentIndexWithApplication:a3 type:@"file" pairingID:a4];
}

- (id)fileResultsIndexForApplication:(id)a3 pairingID:(id)a4
{
  return [(WCDIndexManager *)self contentIndexWithApplication:a3 type:@"file_results" pairingID:a4];
}

- (id)userInfoIndexForApplication:(id)a3 pairingID:(id)a4
{
  return [(WCDIndexManager *)self contentIndexWithApplication:a3 type:@"user_info" pairingID:a4];
}

- (id)userInfoResultsIndexForApplication:(id)a3 pairingID:(id)a4
{
  return [(WCDIndexManager *)self contentIndexWithApplication:a3 type:@"user_info_results" pairingID:a4];
}

- (void)clearCacheForApplication:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(WCDIndexManager *)self _bundleIDForApplication:v4];
    if (v5)
    {
      id v29 = v4;
      objc_super v6 = objc_opt_new();
      v7 = [(WCDIndexManager *)self indexCache];
      id v8 = [v7 allKeys];
      id v9 = [v8 copy];

      id v10 = wc_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = WCCompactStringFromCollection();
        *(_DWORD *)buf = 138543618;
        v41 = v5;
        __int16 v42 = 2114;
        v43 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ from indexCache with keys: %{public}@", buf, 0x16u);
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v12 = v9;
      id v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v35;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if ([v17 hasPrefix:v5]) {
              [v6 addObject:v17];
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v14);
      }

      v18 = wc_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = WCCompactStringFromCollection();
        *(_DWORD *)buf = 138543362;
        v41 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "removing %{public}@", buf, 0xCu);
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v20 = v6;
      id v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v31;
        do
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v31 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v30 + 1) + 8 * (void)j);
            v26 = [(WCDIndexManager *)self indexCache];
            v27 = [v26 objectForKeyedSubscript:v25];

            [v27 invalidate];
            v28 = [(WCDIndexManager *)self indexCache];
            [v28 removeObjectForKey:v25];
          }
          id v22 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v22);
      }

      id v4 = v29;
    }
    else
    {
      v20 = wc_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        sub_10002ACE8((uint64_t)v4, v20);
      }
    }
  }
  else
  {
    v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002ACA4(v5);
    }
  }
}

- (NSMutableDictionary)indexCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIndexCache:(id)a3
{
}

- (int64_t)totalCount
{
  return self->_totalCount;
}

- (void)setTotalCount:(int64_t)a3
{
  self->_totalCount = a3;
}

- (void).cxx_destruct
{
}

@end