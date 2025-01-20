@interface NRSyncDataDeleter
+ (id)buildQuarantineJobWithStoreUUID:(id)a3 services:(id)a4;
+ (id)deleterDataDescriptionPath;
+ (id)getLocalPairingStorePairingID:(id)a3;
+ (id)getLocalPairingStorePath;
+ (id)mobileLibraryPath;
+ (id)quarantineBasePathWithStoreUUID:(id)a3;
+ (void)addPathJobsTo:(id)a3 basePath:(id)a4 paths:(id)a5;
- (NRSyncDataDeleter)initWithStoreUUID:(id)a3 services:(id)a4;
- (NRSyncDataDeleterQuarantineJob)job;
- (id)_quarantineDataAfterCreatingDirectoryWithBasePath:(id)a3;
- (void)deleteQuarantinedDataWithCompletion:(id)a3;
- (void)quarantineDataWithCompletion:(id)a3;
- (void)setJob:(id)a3;
- (void)unquarantineDataWithCompletion:(id)a3;
@end

@implementation NRSyncDataDeleter

- (NRSyncDataDeleter)initWithStoreUUID:(id)a3 services:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NRSyncDataDeleter;
  v8 = [(NRSyncDataDeleter *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [(id)objc_opt_class() buildQuarantineJobWithStoreUUID:v6 services:v7];
    job = v8->_job;
    v8->_job = (NRSyncDataDeleterQuarantineJob *)v9;
  }
  return v8;
}

+ (id)deleterDataDescriptionPath
{
  return [@"/" stringByAppendingPathComponent:@"/System/Library/PrivateFrameworks/NanoRegistry.framework/DeleterDataDescription.plist"];
}

+ (id)mobileLibraryPath
{
  return @"/var/mobile/Library";
}

+ (id)getLocalPairingStorePath
{
  v2 = [a1 mobileLibraryPath];
  v3 = [v2 stringByAppendingPathComponent:@"DeviceRegistry"];

  return v3;
}

+ (id)getLocalPairingStorePairingID:(id)a3
{
  id v4 = a3;
  v5 = [a1 getLocalPairingStorePath];
  id v6 = [v4 UUIDString];

  id v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

+ (id)quarantineBasePathWithStoreUUID:(id)a3
{
  v3 = [a1 getLocalPairingStorePairingID:a3];
  id v4 = [v3 stringByAppendingPathComponent:@"MigrationQuarantine"];

  return v4;
}

+ (id)buildQuarantineJobWithStoreUUID:(id)a3 services:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  v31 = v6;
  [v8 setPairingStoreUUID:v6];
  uint64_t v9 = objc_opt_new();
  id v27 = v8;
  [v8 setItems:v9];
  uint64_t v10 = [a1 deleterDataDescriptionPath];
  v11 = +[NSDictionary dictionaryWithContentsOfFile:v10];
  objc_super v12 = nr_root_daemon_log();
  LODWORD(v6) = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v13 = nr_root_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v38 = v10;
      __int16 v39 = 2112;
      v40 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Read plist %@ %@", buf, 0x16u);
    }
  }
  v28 = v11;
  v29 = (void *)v10;
  v14 = [v11 objectForKeyedSubscript:@"Services"];
  v15 = v14;
  if (!v7)
  {
    v16 = [v14 allKeys];
    id v7 = +[NSSet setWithArray:v16];
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v7;
  id v17 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = [v15 objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        v22 = [v21 objectForKeyedSubscript:@"MobileLibrary"];
        if ([v22 count])
        {
          v23 = [a1 mobileLibraryPath];
          [a1 addPathJobsTo:v9 basePath:v23 paths:v22];
        }
        v24 = [v21 objectForKeyedSubscript:@"PairingStorePath"];

        if ([v24 count])
        {
          v25 = [a1 getLocalPairingStorePairingID:v31];
          [a1 addPathJobsTo:v9 basePath:v25 paths:v24];
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v18);
  }

  return v27;
}

+ (void)addPathJobsTo:(id)a3 basePath:(id)a4 paths:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [v8 stringByAppendingPathComponent:*(void *)(*((void *)&v16 + 1) + 8 * (void)v13)];
        v15 = [[NRSyncDataDeleterQuarantineJobItem alloc] initWithSourcePath:v14];
        [v7 addObject:v15];

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (id)_quarantineDataAfterCreatingDirectoryWithBasePath:(id)a3
{
  id v30 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = [(NRSyncDataDeleterQuarantineJob *)self->_job items];
  id v5 = [v4 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (!v5)
  {
    id v8 = 0;
    goto LABEL_23;
  }
  id v7 = v5;
  id v8 = 0;
  uint64_t v9 = *(void *)v33;
  *(void *)&long long v6 = 138412290;
  long long v29 = v6;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v33 != v9) {
        objc_enumerationMutation(v4);
      }
      id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      uint64_t v12 = +[NSFileManager defaultManager];
      v13 = [v11 sourcePath];
      unsigned int v14 = [v12 fileExistsAtPath:v13];

      if (v14)
      {
        v15 = [v11 quarantinePath];
        long long v16 = [v30 stringByAppendingPathComponent:v15];

        long long v17 = +[NSFileManager defaultManager];
        [v17 removeItemAtPath:v16 error:0];

        long long v18 = nr_root_daemon_log();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

        if (v19)
        {
          v20 = nr_root_daemon_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = [v11 sourcePath];
            *(_DWORD *)buf = 138412546;
            v37 = v21;
            __int16 v38 = 2112;
            __int16 v39 = v16;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Moving source path %@ to quarantine path %@", buf, 0x16u);
          }
        }
        v22 = +[NSFileManager defaultManager];
        v23 = [v11 sourcePath];
        id v31 = 0;
        [v22 moveItemAtPath:v23 toPath:v16 error:&v31];
        id v24 = v31;

        if (v24 && !v8) {
          id v8 = v24;
        }

LABEL_15:
        continue;
      }
      v25 = nr_root_daemon_log();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

      if (v26)
      {
        long long v16 = nr_root_daemon_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = [v11 sourcePath];
          *(_DWORD *)buf = v29;
          v37 = v27;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Source path %@ does not exist", buf, 0xCu);
        }
        goto LABEL_15;
      }
    }
    id v7 = [v4 countByEnumeratingWithState:&v32 objects:v40 count:16];
  }
  while (v7);
LABEL_23:

  return v8;
}

- (void)quarantineDataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = objc_opt_class();
  long long v6 = [(NRSyncDataDeleterQuarantineJob *)self->_job pairingStoreUUID];
  id v7 = [v5 quarantineBasePathWithStoreUUID:v6];

  id v8 = +[NSFileManager defaultManager];
  unsigned __int8 v9 = [v8 fileExistsAtPath:v7];

  id v10 = nr_root_daemon_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    if (v11)
    {
      uint64_t v12 = nr_root_daemon_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Quarantine base path %@ already exists", buf, 0xCu);
      }
    }
    id v13 = 0;
  }
  else
  {
    if (v11)
    {
      unsigned int v14 = nr_root_daemon_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Creating quarantine base path %@", buf, 0xCu);
      }
    }
    v15 = +[NSFileManager defaultManager];
    id v16 = 0;
    [v15 createDirectoryAtPath:v7 withIntermediateDirectories:0 attributes:0 error:&v16];
    id v13 = v16;

    if (!v13)
    {
      id v13 = [(NRSyncDataDeleter *)self _quarantineDataAfterCreatingDirectoryWithBasePath:v7];
    }
  }
  if (v4) {
    v4[2](v4, v13);
  }
}

- (void)unquarantineDataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = objc_opt_class();
  long long v6 = [(NRSyncDataDeleterQuarantineJob *)self->_job pairingStoreUUID];
  id v7 = [v5 quarantineBasePathWithStoreUUID:v6];

  id v8 = +[NSFileManager defaultManager];
  unsigned int v9 = [v8 fileExistsAtPath:v7];

  if (v9)
  {
    v37 = v4;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = [(NRSyncDataDeleterQuarantineJob *)self->_job items];
    id v10 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (!v10)
    {
      uint64_t v12 = 0;
      goto LABEL_29;
    }
    id v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v42;
    while (1)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v16 = [v15 quarantinePath];
        long long v17 = [v7 stringByAppendingPathComponent:v16];

        long long v18 = +[NSFileManager defaultManager];
        unsigned int v19 = [v18 fileExistsAtPath:v17];

        if (v19)
        {
          v20 = +[NSFileManager defaultManager];
          v21 = [v15 sourcePath];
          [v20 removeItemAtPath:v21 error:0];

          v22 = nr_root_daemon_log();
          LODWORD(v21) = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

          if (v21)
          {
            v23 = nr_root_daemon_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              id v24 = [v15 sourcePath];
              *(_DWORD *)buf = 138412546;
              v46 = v17;
              __int16 v47 = 2112;
              v48 = v24;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Moving quarantine path %@ to source path %@", buf, 0x16u);
            }
          }
          v25 = +[NSFileManager defaultManager];
          BOOL v26 = [v15 sourcePath];
          id v40 = 0;
          [v25 moveItemAtPath:v17 toPath:v26 error:&v40];
          id v27 = v40;

          if (v27 && !v12)
          {
            id v27 = v27;
            uint64_t v12 = v27;
          }
        }
        else
        {
          v28 = nr_root_daemon_log();
          BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

          if (!v29) {
            goto LABEL_19;
          }
          id v27 = nr_root_daemon_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v17;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Quarantine path %@ does not exist", buf, 0xCu);
          }
        }

LABEL_19:
      }
      id v11 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (!v11)
      {
LABEL_29:

        long long v34 = nr_root_daemon_log();
        BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

        if (v35)
        {
          v36 = nr_root_daemon_log();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v7;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Deleting quarantine base path %@", buf, 0xCu);
          }
        }
        long long v32 = +[NSFileManager defaultManager];
        __int16 v39 = v12;
        [v32 removeItemAtPath:v7 error:&v39];
        long long v33 = v39;

        id v4 = v37;
        goto LABEL_34;
      }
    }
  }
  id v30 = nr_root_daemon_log();
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);

  if (!v31)
  {
    long long v33 = 0;
    if (!v4) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  long long v32 = nr_root_daemon_log();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v7;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "No quarantine base path %@", buf, 0xCu);
  }
  long long v33 = 0;
LABEL_34:

  if (v4) {
LABEL_35:
  }
    v4[2](v4, v33);
LABEL_36:
}

- (void)deleteQuarantinedDataWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = objc_opt_class();
  long long v6 = [(NRSyncDataDeleterQuarantineJob *)self->_job pairingStoreUUID];
  id v7 = [v5 quarantineBasePathWithStoreUUID:v6];

  id v8 = nr_root_daemon_log();
  LODWORD(v6) = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    unsigned int v9 = nr_root_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deleting quarantine base path %@", (uint8_t *)&v11, 0xCu);
    }
  }
  id v10 = +[NSFileManager defaultManager];
  [v10 removeItemAtPath:v7 error:0];

  if (v4) {
    v4[2](v4);
  }
}

- (NRSyncDataDeleterQuarantineJob)job
{
  return self->_job;
}

- (void)setJob:(id)a3
{
}

- (void).cxx_destruct
{
}

@end