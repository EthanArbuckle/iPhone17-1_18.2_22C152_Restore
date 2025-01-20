@interface FMFDStoreController
+ (id)cacheFileURL;
+ (id)sharedInstance;
+ (void)cleanupLegacyStoredDataIfNeeded;
- (FMDataArchiver)dataArchiver;
- (FMKeychainManager)keychainManager;
- (OS_dispatch_queue)queue;
- (id)modelCache;
- (id)passwordData;
- (void)accountWasRemoved;
- (void)cleanup;
- (void)cleanupOldModel;
- (void)setDataArchiver:(id)a3;
- (void)setKeychainManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)updateModelCacheWithData:(id)a3;
@end

@implementation FMFDStoreController

+ (id)cacheFileURL
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 firstObject];

  v4 = +[NSBundle mainBundle];
  v5 = [v4 bundleIdentifier];
  v6 = [v3 stringByAppendingPathComponent:v5];

  v7 = [v6 stringByAppendingPathComponent:@"FMFDStoreCache.data"];

  v8 = +[NSURL fileURLWithPath:v7];

  return v8;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009B68;
  block[3] = &unk_1000A1440;
  block[4] = a1;
  if (qword_1000BB6A8 != -1) {
    dispatch_once(&qword_1000BB6A8, block);
  }
  v2 = (void *)qword_1000BB6A0;

  return v2;
}

- (void)accountWasRemoved
{
  v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up local model cache due to account removed notification", v4, 2u);
  }

  [(FMFDStoreController *)self cleanup];
}

- (void)cleanupOldModel
{
  v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up local model cache due to old model notification", v4, 2u);
  }

  [(FMFDStoreController *)self cleanup];
  [(id)objc_opt_class() cleanupLegacyStoredDataIfNeeded];
}

+ (void)cleanupLegacyStoredDataIfNeeded
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:off_1000BAC98];

  if (v3 != (id)qword_1000BACA0)
  {
    +[FMPreferencesUtil removeKey:off_1000BAC60[0] inDomain:off_1000BB028];
    id v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setInteger:qword_1000BACA0 forKey:off_1000BAC98];
  }
}

- (id)passwordData
{
  id v3 = [(FMFDStoreController *)self keychainManager];
  id v4 = [v3 dataForAccount:@"FMFDStoreControllerKey" service:@"FMFDStoreController"];

  if (!v4)
  {
    id v4 = +[NSData fm_randomBytes:32];
    v5 = [(FMFDStoreController *)self keychainManager];
    [v5 setData:v4 forAccount:@"FMFDStoreControllerKey" service:@"FMFDStoreController" synchronizable:0 dataProtectionClass:3 migratable:0];
  }

  return v4;
}

- (void)updateModelCacheWithData:(id)a3
{
  id v4 = a3;
  v5 = [(FMFDStoreController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A048;
  v7[3] = &unk_1000A1468;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)modelCache
{
  uint64_t v35 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v35, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v12 = [(FMFDStoreController *)self dataArchiver];
  id v39 = 0;
  id v13 = [v12 readDictionaryAndClasses:v11 error:&v39];
  id v14 = v39;

  if (!v14)
  {
    v15 = [v13 objectForKeyedSubscript:@"modelCache"];
    v17 = [(FMFDStoreController *)self passwordData];
    id v38 = 0;
    v18 = [v15 decryptWithKey:v17 error:&v38];
    id v14 = v38;

    if (v18)
    {
      if (!v14)
      {
        id v37 = 0;
        v21 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v18 error:&v37];
        id v14 = v37;

        v22 = sub_100005560();
        v23 = v22;
        if (v14)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_10006AB0C(v14);
          }

          v16 = 0;
          id v13 = v21;
        }
        else
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v24 = [v21 allKeys];
            *(_DWORD *)buf = 138412290;
            v41 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Unarchived data keys: %@", buf, 0xCu);
          }
          v25 = sub_100005560();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = [v21 objectForKeyedSubscript:off_1000BAC90[0]];
            *(_DWORD *)buf = 138412290;
            v41 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Unarchived model version: %@", buf, 0xCu);
          }
          v27 = sub_100005560();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [v21 objectForKeyedSubscript:off_1000BAC88[0]];
            *(_DWORD *)buf = 138412290;
            v41 = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Unarchived fences: %@", buf, 0xCu);
          }
          v29 = sub_100005560();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = [v21 objectForKeyedSubscript:off_1000BAC80[0]];
            *(_DWORD *)buf = 138412290;
            v41 = v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Unarchived devices: %@", buf, 0xCu);
          }
          v31 = sub_100005560();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = [v21 objectForKeyedSubscript:off_1000BAC68[0]];
            *(_DWORD *)buf = 138412290;
            v41 = v32;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Unarchived followers: %@", buf, 0xCu);
          }
          v33 = sub_100005560();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = [v21 objectForKeyedSubscript:off_1000BAC70[0]];
            *(_DWORD *)buf = 138412290;
            v41 = v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Unarchived following: %@", buf, 0xCu);
          }
          id v13 = v21;
          id v14 = 0;
          v16 = v13;
        }
        goto LABEL_11;
      }
      v19 = sub_100005560();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10006AB90(v14);
      }
    }
    v16 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v15 = sub_100005560();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10006AC14(v14);
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (void)cleanup
{
  uint64_t v3 = [(FMFDStoreController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A838;
  block[3] = &unk_1000A14E8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
}

- (FMKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainManager, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end