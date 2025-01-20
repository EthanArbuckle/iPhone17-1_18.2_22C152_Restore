@interface DMDEngineDatabaseInitializationOperation
- (BOOL)destroyPersistentStoresWithError:(id *)a3;
- (BOOL)isReady;
- (BOOL)updateMetadataForManagedObjectContext:(id)a3 error:(id *)a4;
- (DMDDeviceStateProvider)deviceStateProvider;
- (void)dealloc;
- (void)destroyLegacyDatabaseIfNeeded;
- (void)fixupDatabaseWithCompletionHandler:(id)a3;
- (void)loadPersistentStoresWithCompletionHandler:(id)a3;
- (void)main;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)operationWillStart;
- (void)setDeviceStateProvider:(id)a3;
@end

@implementation DMDEngineDatabaseInitializationOperation

- (void)dealloc
{
  [(DMDDeviceStateProvider *)self->_deviceStateProvider removeObserver:self forKeyPath:@"hasKeychainUnlockedSinceBoot" context:"DMDEngineDatabaseInitializationOperationContext"];
  v3.receiver = self;
  v3.super_class = (Class)DMDEngineDatabaseInitializationOperation;
  [(DMDEngineDatabaseOperation *)&v3 dealloc];
}

- (BOOL)isReady
{
  objc_super v3 = [(DMDEngineDatabaseInitializationOperation *)self deviceStateProvider];
  v7.receiver = self;
  v7.super_class = (Class)DMDEngineDatabaseInitializationOperation;
  if ([(DMDEngineDatabaseInitializationOperation *)&v7 isReady]) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    unsigned __int8 v5 = 0;
  }
  else {
    unsigned __int8 v5 = [v3 hasKeychainUnlockedSinceBoot];
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == "DMDEngineDatabaseInitializationOperationContext")
  {
    if (objc_msgSend(a3, "isEqualToString:", @"hasKeychainUnlockedSinceBoot", a4, a5))
    {
      [(DMDEngineDatabaseInitializationOperation *)self willChangeValueForKey:@"isReady"];
      [(DMDEngineDatabaseInitializationOperation *)self didChangeValueForKey:@"isReady"];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DMDEngineDatabaseInitializationOperation;
    -[DMDEngineDatabaseInitializationOperation observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)setDeviceStateProvider:(id)a3
{
  BOOL v4 = (DMDDeviceStateProvider *)a3;
  [(DMDDeviceStateProvider *)self->_deviceStateProvider removeObserver:self forKeyPath:@"hasKeychainUnlockedSinceBoot" context:"DMDEngineDatabaseInitializationOperationContext"];
  deviceStateProvider = self->_deviceStateProvider;
  self->_deviceStateProvider = v4;
  v6 = v4;

  [(DMDDeviceStateProvider *)self->_deviceStateProvider addObserver:self forKeyPath:@"hasKeychainUnlockedSinceBoot" options:4 context:"DMDEngineDatabaseInitializationOperationContext"];
}

- (void)operationWillStart
{
  [(DMDEngineDatabaseInitializationOperation *)self setDeviceStateProvider:0];
  v3.receiver = self;
  v3.super_class = (Class)DMDEngineDatabaseInitializationOperation;
  [(DMDEngineDatabaseInitializationOperation *)&v3 operationWillStart];
}

- (void)main
{
  [(DMDEngineDatabaseInitializationOperation *)self destroyLegacyDatabaseIfNeeded];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003EA98;
  v3[3] = &unk_1000CADD0;
  v3[4] = self;
  [(DMDEngineDatabaseInitializationOperation *)self loadPersistentStoresWithCompletionHandler:v3];
}

- (void)destroyLegacyDatabaseIfNeeded
{
  v2 = +[NSFileManager defaultManager];
  objc_super v3 = +[NSFileManager dmd_legacyUserConfigurationEngineDatabaseURL];
  if ([v3 checkResourceIsReachableAndReturnError:0])
  {
    BOOL v4 = [v3 path];
    unsigned __int8 v5 = [v4 stringByAppendingString:@"-wal"];
    v6 = +[NSURL fileURLWithPath:v5 isDirectory:0];

    objc_super v7 = [v3 path];
    v8 = [v7 stringByAppendingString:@"-shm"];
    v9 = +[NSURL fileURLWithPath:v8 isDirectory:0];

    v36[0] = v3;
    v36[1] = v9;
    v36[2] = v6;
    v10 = +[NSArray arrayWithObjects:v36 count:3];
    v11 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "removing legacy database...", buf, 2u);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v13)
    {
      id v14 = v13;
      v24 = v9;
      v25 = v6;
      v26 = v3;
      id v15 = 0;
      uint64_t v16 = *(void *)v30;
      char v17 = 1;
      do
      {
        v18 = 0;
        v19 = v15;
        do
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v18);
          id v28 = v19;
          unsigned __int8 v21 = [v2 removeItemAtURL:v20 error:&v28];
          id v15 = v28;

          if ((v21 & 1) == 0)
          {
            v22 = DMFConfigurationEngineLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_100084104(buf, v15, &v34, v22);
            }

            char v17 = 0;
          }
          v18 = (char *)v18 + 1;
          v19 = v15;
        }
        while (v14 != v18);
        id v14 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v14);

      v6 = v25;
      objc_super v3 = v26;
      v9 = v24;
      if ((v17 & 1) == 0) {
        goto LABEL_21;
      }
    }
    else
    {

      id v15 = 0;
    }
    v23 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "deleted legacy database", v27, 2u);
    }

LABEL_21:
  }
}

- (void)loadPersistentStoresWithCompletionHandler:(id)a3
{
  id v5 = a3;
  v6 = [(DMDEngineDatabaseOperation *)self database];
  objc_super v7 = [v6 persistentStoreDescriptions];
  id v8 = [v7 mutableCopy];

  if (![v8 count])
  {
    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"DMDEngineDatabaseInitializationOperation.m" lineNumber:112 description:@"Configuration database does not have registered persistent stores"];
  }
  v9 = objc_opt_new();
  v10 = [(DMDEngineDatabaseOperation *)self database];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003F0A0;
  v15[3] = &unk_1000CAE90;
  id v16 = v9;
  id v17 = v8;
  id v18 = v5;
  id v11 = v5;
  id v12 = v8;
  id v13 = v9;
  [v10 loadPersistentStoresWithCompletionHandler:v15];
}

- (void)fixupDatabaseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(DMDEngineDatabaseOperation *)self database];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003F3D4;
  v7[3] = &unk_1000CAEE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBackgroundTask:v7];
}

- (BOOL)updateMetadataForManagedObjectContext:(id)a3 error:(id *)a4
{
  id v17 = a4;
  id v18 = a3;
  id v5 = [(DMDEngineDatabaseOperation *)self database];
  id v6 = [v5 persistentStoreCoordinator];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v7 = [v6 persistentStores];
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v13 = [v6 metadataForPersistentStore:v12, v17];
        id v14 = [v13 mutableCopy];

        [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"DMDEngineDatabaseFixedDigitalHealthUsageEventMetadataKey"];
        [v6 setMetadata:v14 forPersistentStore:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  unsigned __int8 v15 = [v18 save:v17];
  return v15;
}

- (BOOL)destroyPersistentStoresWithError:(id *)a3
{
  v26 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v29 = self;
  id v4 = [(DMDEngineDatabaseOperation *)self database];
  id v5 = [v4 persistentStoreDescriptions];

  id obj = v5;
  id v30 = [v5 countByEnumeratingWithState:&v32 objects:v42 count:16];
  id v6 = 0;
  if (v30)
  {
    uint64_t v28 = *(void *)v33;
    do
    {
      objc_super v7 = 0;
      id v8 = v6;
      do
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v7);
        uint64_t v10 = [(DMDEngineDatabaseOperation *)v29 database];
        id v11 = [v10 persistentStoreCoordinator];
        uint64_t v12 = [v9 URL];
        id v13 = [v9 type];
        id v14 = [v9 options];
        id v31 = v8;
        unsigned __int8 v15 = [v11 destroyPersistentStoreAtURL:v12 withType:v13 options:v14 error:&v31];
        id v6 = v31;

        if ((v15 & 1) == 0)
        {
          id v16 = DMFConfigurationEngineLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v17 = [v9 URL];
            id v18 = [v17 lastPathComponent];
            long long v19 = [v6 verboseDescription];
            *(_DWORD *)buf = 138543618;
            v39 = v18;
            __int16 v40 = 2114;
            v41 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "unable to remove persistent store %{public}@: %{public}@", buf, 0x16u);
          }
          [v26 addObject:v6];
        }
        objc_super v7 = (char *)v7 + 1;
        id v8 = v6;
      }
      while (v30 != v7);
      id v30 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v30);
  }

  id v20 = [v26 count];
  id v21 = v20;
  if (a3 && v20)
  {
    uint64_t v36 = DMFErrorFailedConfigurationDatabaseStoreKey;
    id v22 = [v26 copy];
    id v37 = v22;
    v23 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    DMFErrorWithCodeAndUserInfo();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v21 == 0;
}

- (DMDDeviceStateProvider)deviceStateProvider
{
  return self->_deviceStateProvider;
}

- (void).cxx_destruct
{
}

@end