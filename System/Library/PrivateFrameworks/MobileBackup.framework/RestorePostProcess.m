@interface RestorePostProcess
- (BOOL)_configureAppPlaceholderAtPath:(id)a3 installType:(unint64_t)a4 isDataSeparated:(BOOL)a5 migratorCache:(id)a6;
- (BOOL)_createInstallCoordinatorForPlaceholderAtPath:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 isDataSeparated:(BOOL)a6 error:(id *)a7;
- (BOOL)_updateBundleIDsToPersonaIDMappingWithConfig:(id)a3 error:(id *)a4;
- (BOOL)_writeMigratorCache:(id)a3 config:(id)a4 error:(id *)a5;
- (BOOL)performMigration;
- (BOOL)performMigrationWithConfig:(id)a3 error:(id *)a4;
- (NSDictionary)bundleInstallTypeDictionary;
- (NSMutableDictionary)appInstallCoordinators;
- (NSString)currentPlaceholderRestoreDirectory;
- (OS_dispatch_group)placeholderInstallationGroup;
- (RestorePostProcess)init;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)_installCoordinatorForPlaceholder:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 isDataSeparated:(BOOL)a6 error:(id *)a7;
- (id)_placeholderAtPath:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 error:(id *)a6;
- (id)dataClassName;
- (unint64_t)installTypeForBundleID:(id)a3 demotedAppsPlist:(id)a4;
- (void)_configureAndIXInstallPlaceholdersInDirectory:(id)a3 isDataSeparated:(BOOL)a4 migratorCache:(id)a5 demotedAppsPlist:(id)a6;
- (void)_installedPlaceholderWithBundleID:(id)a3 error:(id)a4;
- (void)_registerSafeHarborsAtPath:(id)a3;
- (void)_resetTetheredSyncAnchors;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4;
- (void)setAppInstallCoordinators:(id)a3;
- (void)setBundleInstallTypeDictionary:(id)a3;
- (void)setCurrentPlaceholderRestoreDirectory:(id)a3;
- (void)setPlaceholderInstallationGroup:(id)a3;
@end

@implementation RestorePostProcess

- (RestorePostProcess)init
{
  v3.receiver = self;
  v3.super_class = (Class)RestorePostProcess;
  result = [(RestorePostProcess *)&v3 init];
  if (result)
  {
    result->_placeholderInstallationLock._os_unfair_lock_opaque = 0;
    result->_progress = 0.0;
  }
  return result;
}

- (id)dataClassName
{
  return @"restorePostProcess";
}

- (void)_resetTetheredSyncAnchors
{
  v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Resetting tethered sync anchors", buf, 2u);
    _MBLog();
  }

  uint64_t v3 = 0;
  v4 = "com.apple.Contacts";
  do
  {
    CFStringRef v5 = CFStringCreateWithCString(0, v4, 0x600u);
    v6 = MBGetDefaultLog();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = (void *)v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resetting sync anchors for data source %@", buf, 0xCu);
        _MBLog();
      }

      if (CreateDataSourceForDataClassName())
      {
        v8 = MBGetDefaultLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v11 = (void *)v5;
          __int16 v12 = 2112;
          uint64_t v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Couldn't create a data source for %@: %@", buf, 0x16u);
LABEL_20:
          _MBLog();
        }
      }
      else
      {
        if (DataSourceClearSyncAnchors())
        {
          v9 = MBGetDefaultLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v11 = (void *)v5;
            __int16 v12 = 2112;
            uint64_t v13 = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Couldn't reset sync anchors for data source %@: %@", buf, 0x16u);
            _MBLog();
          }
        }
        if (!DataSourceDeleteDataSource()) {
          goto LABEL_22;
        }
        v8 = MBGetDefaultLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v11 = (void *)v5;
          __int16 v12 = 2112;
          uint64_t v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Couldn't delete data source for %@: %@", buf, 0x16u);
          goto LABEL_20;
        }
      }

LABEL_22:
      CFRelease(v5);
      goto LABEL_23;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v11 = (void *)v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Can't make CFString data class name for %s to clear sync anchors after restore", buf, 0xCu);
      _MBLog();
    }

LABEL_23:
    v4 = off_1004133C0[++v3];
  }
  while (v3 != 4);
}

- (void)_configureAndIXInstallPlaceholdersInDirectory:(id)a3 isDataSeparated:(BOOL)a4 migratorCache:(id)a5 demotedAppsPlist:(id)a6
{
  id v44 = a3;
  id v42 = a5;
  id v43 = a6;
  v37 = +[NSDate now];
  [(RestorePostProcess *)self setCurrentPlaceholderRestoreDirectory:v44];
  v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v43 path];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v44;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reading the app placeholders at %{public}@, demotedAppsPlist:%{public}@", buf, 0x16u);

    [v43 path];
    v34 = id v33 = v44;
    _MBLog();
  }
  v38 = +[NSFileManager defaultManager];
  id v58 = 0;
  v39 = [v38 contentsOfDirectoryAtPath:v44 error:&v58];
  id v36 = v58;
  if (v39)
  {
    id v35 = [v39 count];
    v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v35;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Installing %lu app placeholders", buf, 0xCu);
      id v33 = v35;
      _MBLog();
    }

    v11 = objc_opt_new();
    [(RestorePostProcess *)self setAppInstallCoordinators:v11];

    dispatch_group_t v12 = dispatch_group_create();
    [(RestorePostProcess *)self setPlaceholderInstallationGroup:v12];

    uint64_t v13 = dispatch_semaphore_create(2);
    v14 = dispatch_group_create();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    int v65 = 0;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v39;
    id v15 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v55;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v55 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          dispatch_group_enter(v14);
          dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
          unint64_t v19 = [(RestorePostProcess *)self installTypeForBundleID:v18 demotedAppsPlist:v43];
          v20 = [v44 stringByAppendingPathComponent:v18];
          v21 = dispatch_get_global_queue(25, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000FB8D4;
          block[3] = &unk_1004133F0;
          block[4] = self;
          id v47 = v20;
          unint64_t v52 = v19;
          BOOL v53 = a4;
          id v48 = v42;
          v51 = buf;
          v49 = v13;
          v50 = v14;
          id v22 = v20;
          dispatch_async(v21, block);
        }
        id v15 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v15);
    }

    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    signed int v23 = atomic_load((unsigned int *)(*(void *)&buf[8] + 24));
    v24 = MBGetDefaultLog();
    uint64_t v25 = v23;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v59 = 134218240;
      *(void *)&double v60 = v23;
      __int16 v61 = 2048;
      id v62 = v35;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Done configuring %lu/%lu placeholders. Waiting for them to get installed", v59, 0x16u);
      id v33 = (id)v23;
      v34 = v35;
      _MBLog();
    }

    v26 = [(RestorePostProcess *)self placeholderInstallationGroup];
    dispatch_time_t v27 = dispatch_time(0, (uint64_t)((double)(unint64_t)(5 * v25) * 1000000000.0));
    BOOL v28 = dispatch_group_wait(v26, v27) == 0;

    if (!v28)
    {
      v29 = MBGetDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v59 = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Placeholder installations timed out. Proceeding anyway", v59, 2u);
        _MBLog();
      }
    }
    objc_msgSend(v37, "timeIntervalSinceNow", v33, v34);
    double v31 = v30;
    v32 = MBGetDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v59 = 134217984;
      double v60 = -v31;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Finished installing app placeholders in %.3fs", v59, 0xCu);
      _MBLog();
    }

    [(RestorePostProcess *)self setAppInstallCoordinators:0];
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v44;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v36;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "-contentsOfDirectoryAtPath: failed at %{public}@: %{public}@", buf, 0x16u);
      _MBLog();
    }
  }
}

- (unint64_t)installTypeForBundleID:(id)a3 demotedAppsPlist:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  bundleInstallTypeDictionary = self->_bundleInstallTypeDictionary;
  if (bundleInstallTypeDictionary) {
    goto LABEL_38;
  }
  v9 = [v7 path];
  id v57 = 0;
  v10 = +[NSData dataWithContentsOfFile:v9 options:0 error:&v57];
  v11 = (char *)v57;
  dispatch_group_t v12 = MBGetDefaultLog();
  uint64_t v13 = v12;
  if (!v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v61 = v9;
      __int16 v62 = 2114;
      v63 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to load the demoted apps plist at %{public}@: %{public}@", buf, 0x16u);
      v39 = v9;
      v40 = v11;
      _MBLog();
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (char *)[v10 length];
    *(_DWORD *)buf = 138543618;
    __int16 v61 = v9;
    __int16 v62 = 2048;
    v63 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found demoted apps plist at %{public}@ (%lu bytes)", buf, 0x16u);
    v39 = v9;
    v40 = (char *)[v10 length];
    _MBLog();
  }

  id v56 = 0;
  id v15 = +[NSPropertyListSerialization propertyListWithData:v10 options:0 format:0 error:&v56];
  uint64_t v16 = (char *)v56;

  if (!v15)
  {
    uint64_t v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v61 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to deserialize the demoted apps plist data: %{public}@", buf, 0xCu);
      v39 = v16;
      _MBLog();
    }
    v11 = v16;
LABEL_12:

    id v15 = 0;
    v41 = v11;
    goto LABEL_13;
  }
  v41 = v16;
LABEL_13:
  id v42 = v10;
  id v43 = v7;
  id v44 = v6;
  v17 = (NSDictionary *)objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v45 = v15;
  uint64_t v18 = [v15 objectForKeyedSubscript:@"IntentionalDowngrades"];
  id v19 = [v18 countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v19)
  {
    id v20 = v19;
    id v47 = 0;
    uint64_t v21 = *(void *)v53;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v53 != v21) {
          objc_enumerationMutation(v18);
        }
        signed int v23 = *(char **)(*((void *)&v52 + 1) + 8 * i);
        v24 = MBGetDefaultLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v61 = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Found intentionally downgraded app %{public}@", buf, 0xCu);
          v39 = v23;
          _MBLog();
        }

        [(NSDictionary *)v17 setObject:&off_100439F48 forKeyedSubscript:v23];
      }
      id v47 = &v47[(void)v20];
      id v20 = [v18 countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v20);
  }
  else
  {
    id v47 = 0;
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v25 = [v45 objectForKeyedSubscript:@"AutomaticDowngrades"];
  v26 = (char *)[v25 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v26)
  {
    dispatch_time_t v27 = v26;
    BOOL v28 = 0;
    uint64_t v29 = *(void *)v49;
    do
    {
      v46 = v28;
      for (j = 0; j != v27; ++j)
      {
        if (*(void *)v49 != v29) {
          objc_enumerationMutation(v25);
        }
        double v31 = *(char **)(*((void *)&v48 + 1) + 8 * (void)j);
        v32 = MBGetDefaultLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v61 = v31;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Found automatically downgraded app %{public}@", buf, 0xCu);
          v39 = v31;
          _MBLog();
        }

        [(NSDictionary *)v17 setObject:&off_100439F60 forKeyedSubscript:v31];
      }
      BOOL v28 = &v46[(void)v27];
      dispatch_time_t v27 = (char *)[v25 countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v27);
  }
  else
  {
    BOOL v28 = 0;
  }

  id v33 = self->_bundleInstallTypeDictionary;
  self->_bundleInstallTypeDictionary = v17;

  v34 = MBGetDefaultLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    __int16 v61 = v47;
    __int16 v62 = 2048;
    v63 = v28;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Found %lu intentionally demoted apps and %lu automatically demoted apps to restore", buf, 0x16u);
    v39 = v47;
    v40 = v28;
    _MBLog();
  }

  bundleInstallTypeDictionary = self->_bundleInstallTypeDictionary;
  id v7 = v43;
  id v6 = v44;
LABEL_38:
  id v35 = -[NSDictionary objectForKeyedSubscript:](bundleInstallTypeDictionary, "objectForKeyedSubscript:", v6, v39, v40);
  id v36 = v35;
  if (v35) {
    unint64_t v37 = [v35 unsignedIntValue];
  }
  else {
    unint64_t v37 = 2;
  }

  return v37;
}

- (BOOL)_configureAppPlaceholderAtPath:(id)a3 installType:(unint64_t)a4 isDataSeparated:(BOOL)a5 migratorCache:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a6;
  v11 = +[NSFileManager defaultManager];
  dispatch_group_t v12 = [v9 lastPathComponent];
  uint64_t v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v67 = v9;
    __int16 v68 = 2048;
    unint64_t v69 = a4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Installing app placeholder at %@, installType:%lu", buf, 0x16u);
    id v45 = v9;
    unint64_t v46 = a4;
    _MBLog();
  }

  [v9 stringByAppendingPathComponent:@"Payload"];
  id v56 = v65[1] = 0;
  unsigned __int8 v14 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
  id v15 = 0;
  id v16 = v15;
  if ((v14 & 1) == 0)
  {
    if ([v15 code] != (id)516
      || ([v16 domain],
          v17 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v18 = [v17 isEqualToString:NSCocoaErrorDomain],
          v17,
          (v18 & 1) == 0))
    {
      id v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v67 = v56;
        __int16 v68 = 2114;
        unint64_t v69 = (unint64_t)v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to create payload directory at %{public}@: %{public}@", buf, 0x16u);
        _MBLog();
      }
      goto LABEL_43;
    }
  }
  unint64_t v51 = a4;

  v65[0] = 0;
  id v19 = [v11 contentsOfDirectoryAtPath:v9 error:v65];
  id v16 = v65[0];
  if (!v19)
  {
    v39 = MBGetDefaultLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v67 = v9;
      __int16 v68 = 2114;
      unint64_t v69 = (unint64_t)v16;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to enumerate the files inside the placeholder app at %{public}@: %{public}@", buf, 0x16u);
      _MBLog();
    }

    id v19 = 0;
    goto LABEL_43;
  }
  if (![v19 count])
  {
    v40 = MBGetDefaultLog();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
LABEL_42:

LABEL_43:
      BOOL v38 = 0;
      goto LABEL_44;
    }
    *(_DWORD *)buf = 138543362;
    id v67 = v9;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Couldn't find any files inside the placeholder app at %{public}@", buf, 0xCu);
LABEL_41:
    _MBLog();
    goto LABEL_42;
  }
  long long v49 = v12;
  long long v50 = v10;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v19 = v19;
  id v57 = [v19 countByEnumeratingWithState:&v61 objects:v72 count:16];
  BOOL v48 = v7;
  if (!v57) {
    goto LABEL_26;
  }
  uint64_t v20 = *(void *)v62;
  id v54 = v9;
  long long v55 = v19;
  uint64_t v53 = *(void *)v62;
  do
  {
    uint64_t v21 = 0;
    id v22 = v16;
    do
    {
      if (*(void *)v62 != v20) {
        objc_enumerationMutation(v19);
      }
      signed int v23 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v21);
      v24 = objc_msgSend(v23, "lowercaseString", v45, v46, v47);
      unsigned int v25 = [v24 hasSuffix:@".app"];

      if (!v25)
      {
        id v16 = v22;
        goto LABEL_24;
      }
      v26 = [v9 stringByAppendingPathComponent:v23];
      dispatch_time_t v27 = [v56 stringByAppendingPathComponent:v23];
      BOOL v28 = [v26 stringByAppendingPathComponent:@"Info.plist"];
      uint64_t v29 = [v11 contentsAtPath:v28];
      if (v29)
      {
        double v30 = +[NSPropertyListSerialization propertyListWithData:v29 options:1 format:0 error:0];
        [v30 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IsRestore"];
        [v30 writeToFile:v28 atomically:1];
      }
      id v60 = v22;
      double v31 = v11;
      unsigned int v32 = [v11 moveItemAtPath:v26 toPath:v27 error:&v60];
      id v33 = v60;

      v34 = MBGetDefaultLog();
      id v35 = v34;
      if (v32)
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v67 = v26;
          __int16 v68 = 2114;
          unint64_t v69 = (unint64_t)v27;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Moved %{public}@ to %{public}@", buf, 0x16u);
          id v45 = v26;
          unint64_t v46 = (unint64_t)v27;
LABEL_22:
          _MBLog();
        }
      }
      else if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v67 = v26;
        __int16 v68 = 2114;
        unint64_t v69 = (unint64_t)v27;
        __int16 v70 = 2114;
        id v71 = v33;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to move %{public}@ to %{public}@: %{public}@", buf, 0x20u);
        unint64_t v46 = (unint64_t)v27;
        id v47 = v33;
        id v45 = v26;
        goto LABEL_22;
      }

      id v16 = v33;
      id v22 = v33;
      id v9 = v54;
      id v19 = v55;
      v11 = v31;
      uint64_t v20 = v53;
LABEL_24:
      uint64_t v21 = (char *)v21 + 1;
    }
    while (v57 != v21);
    id v57 = [v19 countByEnumeratingWithState:&v61 objects:v72 count:16];
  }
  while (v57);
LABEL_26:

  dispatch_group_t v12 = v49;
  +[AITransactionLog logStep:1 byParty:6 phase:1 success:1 forBundleID:v49 description:@"Starting placeholder install"];
  id v59 = v16;
  unsigned __int8 v36 = [(RestorePostProcess *)self _createInstallCoordinatorForPlaceholderAtPath:v9 bundleID:v49 installType:v51 isDataSeparated:v48 error:&v59];
  id v37 = v59;

  if ((v36 & 1) == 0)
  {
    v41 = MBGetDefaultLog();
    id v10 = v50;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v67 = v49;
      __int16 v68 = 2112;
      unint64_t v69 = (unint64_t)v9;
      __int16 v70 = 2112;
      id v71 = v37;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed to install the placeholder for %@ at %@: %@", buf, 0x20u);
      _MBLog();
    }

    +[AITransactionLog logStep:1 byParty:6 phase:2 success:0 forBundleID:v49 description:@"Placeholder install failed"];
    id v58 = v37;
    unsigned __int8 v42 = [v11 removeItemAtPath:v9 error:&v58];
    id v43 = v58;

    if (v42)
    {
      BOOL v38 = 0;
      id v16 = v43;
      goto LABEL_44;
    }
    v40 = MBGetDefaultLog();
    id v16 = v43;
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      goto LABEL_42;
    }
    *(_DWORD *)buf = 138412802;
    id v67 = v49;
    __int16 v68 = 2112;
    unint64_t v69 = (unint64_t)v9;
    __int16 v70 = 2112;
    id v71 = v43;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to remove the placeholder for %@ at %@: %@", buf, 0x20u);
    goto LABEL_41;
  }
  id v10 = v50;
  [v50 addBundleID:v49];
  BOOL v38 = 1;
  +[AITransactionLog logStep:1 byParty:6 phase:2 success:1 forBundleID:v49 description:@"Placeholder install succeeded"];
  id v16 = v37;
LABEL_44:

  return v38;
}

- (id)_placeholderAtPath:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = [v9 stringByAppendingPathComponent:a4];
  v11 = [v10 stringByAppendingPathExtension:@"ipa"];

  dispatch_group_t v12 = +[NSFileManager defaultManager];
  unsigned int v13 = [v12 fileExistsAtPath:v11];

  unsigned __int8 v14 = MBGetDefaultLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "IX: Restoring IPA-based app placeholder %@", buf, 0xCu);
      _MBLog();
    }

    id v16 = +[NSURL fileURLWithPath:v11];
    uint64_t v17 = +[IXPlaceholder placeholderFromSerializedPlaceholder:v16 client:2 installType:a5 error:a6];
  }
  else
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "IX: Restoring pre-expanded app placeholder %@", buf, 0xCu);
      _MBLog();
    }

    id v16 = +[NSURL fileURLWithPath:v9];
    uint64_t v17 = +[IXPlaceholder placeholderForInstallable:v16 client:2 installType:a5 metadata:0 error:a6];
  }
  unsigned __int8 v18 = (void *)v17;

  return v18;
}

- (id)_installCoordinatorForPlaceholder:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 isDataSeparated:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  if (!a7) {
    __assert_rtn("-[RestorePostProcess _installCoordinatorForPlaceholder:bundleID:installType:isDataSeparated:error:]", "RestorePostProcess.m", 332, "error");
  }
  unsigned int v13 = v12;
  if (a5 - 7 > 1)
  {
    if (a5 == 2)
    {
      char v26 = 0;
      unsigned __int8 v14 = +[IXRestoringAppInstallCoordinator coordinatorForAppWithBundleID:v12 withClientID:2 createIfNotExisting:1 created:&v26 error:a7];
      if (v14)
      {
        BOOL v15 = [v11 metadataWithError:a7];
        if (!v15)
        {
          id v16 = MBGetDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            id v17 = *a7;
            *(_DWORD *)buf = 138412802;
            unint64_t v28 = (unint64_t)v13;
            __int16 v29 = 2112;
            uint64_t v30 = (uint64_t)v11;
            __int16 v31 = 2112;
            id v32 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "IX: No placeholder metadata for %@:%@: %@", buf, 0x20u);
            _MBLog();
          }
        }
        if (v8) {
          uint64_t v18 = 23;
        }
        else {
          uint64_t v18 = 1;
        }
        if (objc_opt_respondsToSelector())
        {
          id v19 = [v15 distributorInfo];
          if ((objc_opt_respondsToSelector() & 1) != 0 && [v19 distributorIsThirdParty]) {
            uint64_t v18 = 28;
          }
        }
        uint64_t v20 = MBGetDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          unint64_t v28 = (unint64_t)v13;
          __int16 v29 = 2048;
          uint64_t v30 = v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "IX: Setting app asset DRI for %@ (%lu)", buf, 0x16u);
          _MBLog();
        }

        if (([v14 setAppAssetPromiseResponsibleClient:v18 error:a7] & 1) == 0)
        {
          id v21 = MBGetDefaultLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            id v22 = *a7;
            *(_DWORD *)buf = 138412546;
            unint64_t v28 = (unint64_t)v13;
            __int16 v29 = 2112;
            uint64_t v30 = (uint64_t)v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "IX: Failed to set app asset DRI for  %@: %@", buf, 0x16u);
            _MBLog();
          }
        }
        id v23 = v14;
      }
    }
    else
    {
      v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v28 = a5;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "IX: Did not create InstallCoordinator for unknown install type (%lu)", buf, 0xCu);
        _MBLog();
      }

      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    buf[0] = 0;
    unsigned __int8 v14 = +[IXRestoringDemotedAppInstallCoordinator coordinatorForAppWithBundleID:v12 withClientID:2 createIfNotExisting:1 created:buf error:a7];
  }

  return v14;
}

- (BOOL)_createInstallCoordinatorForPlaceholderAtPath:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 isDataSeparated:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v45 = 0;
  unsigned __int8 v14 = [(RestorePostProcess *)self _placeholderAtPath:v12 bundleID:v13 installType:a5 error:&v45];
  id v15 = v45;
  id v16 = v15;
  if (v14)
  {
    id v44 = v15;
    id v17 = [(RestorePostProcess *)self _installCoordinatorForPlaceholder:v14 bundleID:v13 installType:a5 isDataSeparated:v8 error:&v44];
    id v18 = v44;

    id v19 = MBGetDefaultLog();
    uint64_t v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v47 = v13;
        __int16 v48 = 2112;
        id v49 = v12;
        __int16 v50 = 2112;
        id v51 = v17;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "IX: Created the install coordinator for %@ at %@: %@", buf, 0x20u);
        _MBLog();
      }

      [v17 setObserver:self];
      id v43 = v18;
      unsigned __int8 v21 = [v14 setConfigurationCompleteWithError:&v43];
      id v22 = v43;

      if ((v21 & 1) == 0)
      {
        id v23 = MBGetDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v47 = v13;
          __int16 v48 = 2112;
          id v49 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "IX: Failed to configure the placeholder for %@: %@", buf, 0x16u);
          _MBLog();
        }
      }
      v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v47 = v13;
        __int16 v48 = 2112;
        id v49 = v12;
        __int16 v50 = 2112;
        id v51 = v14;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "IX: Configured the placeholder for %@ at %@: %@", buf, 0x20u);
        _MBLog();
      }

      p_placeholderInstallationLock = &self->_placeholderInstallationLock;
      os_unfair_lock_lock(&self->_placeholderInstallationLock);
      char v26 = [(RestorePostProcess *)self appInstallCoordinators];
      [v26 setObject:v17 forKeyedSubscript:v13];

      dispatch_time_t v27 = [(RestorePostProcess *)self placeholderInstallationGroup];
      dispatch_group_enter(v27);

      unint64_t v28 = [(RestorePostProcess *)self appInstallCoordinators];
      id v29 = [v28 count];

      os_unfair_lock_unlock(p_placeholderInstallationLock);
      uint64_t v30 = MBGetDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v47 = v13;
        __int16 v48 = 2048;
        id v49 = v29;
        __int16 v50 = 2112;
        id v51 = v17;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "IX: Added %@ to list of install coordinators (%lu): %@", buf, 0x20u);
        _MBLog();
      }

      id v42 = v22;
      unsigned __int8 v31 = [v17 setPlaceholderPromise:v14 error:&v42];
      id v32 = v42;

      if (v31)
      {
        BOOL v33 = 1;
        id v18 = v32;
      }
      else
      {
        id v35 = MBGetDefaultLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v47 = v17;
          __int16 v48 = 2112;
          id v49 = v32;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "IX: Failed to set the placeholder promise for %@: %@", buf, 0x16u);
          _MBLog();
        }

        unsigned __int8 v36 = +[MBError errorWithCode:1, @"Couldn't set placeholder promise on InstallCoordinator for bundleID %@ at path %@", v13, v12 format];
        id v41 = v32;
        unsigned __int8 v37 = [v17 cancelForReason:v36 client:2 error:&v41];
        id v18 = v41;

        if ((v37 & 1) == 0)
        {
          BOOL v38 = MBGetDefaultLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v47 = v13;
            __int16 v48 = 2112;
            id v49 = v18;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "IX: Failed to cancel the coordinator for %@: %@", buf, 0x16u);
            _MBLog();
          }
        }
        id v39 = v36;
        *a7 = v39;

        BOOL v33 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v47 = v13;
        __int16 v48 = 2112;
        id v49 = v12;
        __int16 v50 = 2112;
        id v51 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "IX: Failed to create the install coordinator for %@ at path %@: %@", buf, 0x20u);
        _MBLog();
      }

      +[MBError errorWithCode:1, @"Couldn't create the install coordinator for %@ at path %@", v13, v12 format];
      BOOL v33 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v16 = v18;
  }
  else
  {
    v34 = MBGetDefaultLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v47 = v13;
      __int16 v48 = 2112;
      id v49 = v16;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "IX: Failed to create the placeholder bundleID %@: %@", buf, 0x16u);
      _MBLog();
    }

    +[MBError errorWithCode:1, @"Failed to create the placeholder for %@ at path %@", v13, v12 format];
    BOOL v33 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v33;
}

- (void)_installedPlaceholderWithBundleID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[RestorePostProcess _installedPlaceholderWithBundleID:error:]", "RestorePostProcess.m", 434, "bundleID");
  }
  BOOL v8 = v7;
  p_placeholderInstallationLock = &self->_placeholderInstallationLock;
  os_unfair_lock_lock(&self->_placeholderInstallationLock);
  id v10 = [(RestorePostProcess *)self appInstallCoordinators];
  id v11 = [v10 objectForKeyedSubscript:v6];

  if (v11)
  {
    id v12 = [(RestorePostProcess *)self placeholderInstallationGroup];
    dispatch_group_leave(v12);

    id v13 = [(RestorePostProcess *)self appInstallCoordinators];
    [v13 removeObjectForKey:v6];

    self->_progress = self->_progress + 1.0;
    unsigned __int8 v14 = [(RestorePostProcess *)self appInstallCoordinators];
    id v15 = [v14 count];
  }
  else
  {
    id v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "IX: %@ not found in list of app coordinators", buf, 0xCu);
      _MBLog();
    }

    id v15 = 0;
  }
  os_unfair_lock_unlock(p_placeholderInstallationLock);
  id v17 = MBGetDefaultLog();
  id v18 = v17;
  if (v8)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = v6;
      __int16 v21 = 2048;
      id v22 = v15;
      __int16 v23 = 2112;
      v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "IX: Failed to install placeholder for %@ (%lu): %@", buf, 0x20u);
LABEL_12:
      _MBLog();
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v6;
    __int16 v21 = 2048;
    id v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "IX: Installed placeholder for %@ (%lu)", buf, 0x16u);
    goto LABEL_12;
  }
}

- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4
{
  uint64_t v6 = [a3 bundleID];
  id v7 = (void *)v6;
  if (!a3)
  {
    BOOL v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "IX: -coordinatorDidInstallPlaceholder: called with nil coordinator", buf, 2u);
LABEL_8:
      _MBLog();
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!v6)
  {
    BOOL v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "IX: -coordinatorDidInstallPlaceholder: called with nil bundleID", v9, 2u);
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  [(RestorePostProcess *)self _installedPlaceholderWithBundleID:v6 error:0];
LABEL_10:
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v9 = [a3 bundleID];
  id v10 = (void *)v9;
  if (!a3)
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v13 = a5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "IX: -coordinator:canceledWithReason:client: called with nil coordinator (%lu)", buf, 0xCu);
LABEL_8:
      _MBLog();
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!v9)
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v13 = a5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "IX: -coordinator:canceledWithReason:client: called with nil bundleID (%lu)", buf, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  [(RestorePostProcess *)self _installedPlaceholderWithBundleID:v9 error:v8];
LABEL_10:
}

- (void)_registerSafeHarborsAtPath:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  unsigned __int8 v31 = v3;
  uint64_t v30 = [[MBMobileInstallation alloc] initWithSafeHarborDir:v3];
  CFStringRef v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Registering safe harbors", buf, 2u);
    _MBLog();
  }

  id v37 = 0;
  uint64_t v6 = [v4 contentsOfDirectoryAtPath:v3 error:&v37];
  id v7 = v37;
  if (v6)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v33 objects:v44 count:16];
    if (v9)
    {
      id v10 = v9;
      dispatch_time_t v27 = v6;
      unint64_t v28 = v4;
      uint64_t v11 = *(void *)v34;
      id obj = v8;
      do
      {
        id v12 = 0;
        unint64_t v13 = v7;
        do
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(obj);
          }
          unsigned __int8 v14 = objc_msgSend(v31, "stringByAppendingPathComponent:", *(void *)(*((void *)&v33 + 1) + 8 * (void)v12), v23, v25, v26);
          id v15 = +[MBApp safeHarborWithPath:v14];
          if (!v15)
          {
            id v16 = MBGetDefaultLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v39 = v14;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error loading safe harbor at %@", buf, 0xCu);
              v24 = v14;
              _MBLog();
            }
          }
          uint64_t v17 = MBGetDefaultLog();
          if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [v15 bundleID];
            *(_DWORD *)buf = 138412546;
            id v39 = v18;
            __int16 v40 = 2112;
            id v41 = v14;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Registering safe harbor for %@ at %@", buf, 0x16u);

            v24 = [v15 bundleID];
            unsigned int v25 = v14;
            _MBLog();
          }
          LODWORD(v17) = [v15 containerType];
          if ([v15 containerType]) {
            uint64_t v17 = v17;
          }
          else {
            uint64_t v17 = 1;
          }
          id v19 = objc_msgSend(v15, "bundleID", v24);
          id v32 = v13;
          unsigned __int8 v20 = [(MBMobileInstallation *)v30 registerSafeHarborWithIdentifier:v19 path:v14 type:v17 error:&v32];
          id v7 = v32;

          if ((v20 & 1) == 0)
          {
            __int16 v21 = MBGetDefaultLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              id v22 = [v15 bundleID];
              *(_DWORD *)buf = 138412802;
              id v39 = v22;
              __int16 v40 = 2112;
              id v41 = v14;
              __int16 v42 = 2112;
              id v43 = v7;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Couldn't install safe harbor for %@ at %@ (already registered?): %@", buf, 0x20u);

              [v15 bundleID];
              unsigned int v25 = v14;
              __int16 v23 = v26 = v7;
              _MBLog();
            }
          }

          id v12 = (char *)v12 + 1;
          unint64_t v13 = v7;
        }
        while (v10 != v12);
        id v8 = obj;
        id v10 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
      }
      while (v10);
      uint64_t v6 = v27;
      v4 = v28;
    }
  }
  else
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v39 = v3;
      __int16 v40 = 2112;
      id v41 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Couldn't find any safe harbors at %@: %@", buf, 0x16u);
      _MBLog();
    }
  }
}

- (BOOL)_writeMigratorCache:(id)a3 config:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!a5) {
    __assert_rtn("-[RestorePostProcess _writeMigratorCache:config:error:]", "RestorePostProcess.m", 517, "error");
  }
  id v9 = v8;
  id v10 = [v8 migratorCacheURL];
  if (v10)
  {
    uint64_t v11 = [v7 bundleIDs];
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = [v10 path];
      *(_DWORD *)buf = 138543874;
      long long v35 = v9;
      __int16 v36 = 2114;
      id v37 = v13;
      __int16 v38 = 2114;
      id v39 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Writing MigratorCache for %{public}@ at %{public}@: %{public}@", buf, 0x20u);

      id v29 = [v10 path];
      unsigned __int8 v31 = v11;
      dispatch_time_t v27 = v9;
      _MBLog();
    }
    v32[0] = NSFileOwnerAccountName;
    v32[1] = NSFileGroupOwnerAccountName;
    v33[0] = @"mobile";
    v33[1] = @"mobile";
    unsigned __int8 v14 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    id v15 = +[NSFileManager defaultManager];
    unsigned __int8 v16 = [v15 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:v14 error:a5];

    if ((v16 & 1) == 0 && [*a5 code] != (id)516)
    {
      uint64_t v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = *a5;
        *(_DWORD *)buf = 138543618;
        long long v35 = v10;
        __int16 v36 = 2114;
        id v37 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to create directory at %{public}@: %{public}@", buf, 0x16u);
        dispatch_time_t v27 = v10;
        id v29 = *a5;
        _MBLog();
      }
    }
    id v19 = +[NSFileManager defaultManager];
    unsigned __int8 v20 = [v19 removeItemAtURL:v10 error:a5];

    if ((v20 & 1) == 0)
    {
      __int16 v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = *a5;
        *(_DWORD *)buf = 138543618;
        long long v35 = v10;
        __int16 v36 = 2114;
        id v37 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to remove existing MigratorCache at %{public}@: %{public}@", buf, 0x16u);
        unint64_t v28 = v10;
        id v30 = *a5;
        _MBLog();
      }
    }
    unsigned __int8 v23 = objc_msgSend(v7, "writeTo:error:", v10, a5, v28, v30);
    if ((v23 & 1) == 0)
    {
      v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = *a5;
        *(_DWORD *)buf = 138543618;
        long long v35 = v10;
        __int16 v36 = 2114;
        id v37 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to write MigratorCache at %{public}@: %{public}@", buf, 0x16u);
        _MBLog();
      }
    }
  }
  else
  {
    uint64_t v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v35 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping MigratorCache write for %{public}@", buf, 0xCu);
      _MBLog();
    }
    unsigned __int8 v23 = 1;
  }

  return v23;
}

- (BOOL)_updateBundleIDsToPersonaIDMappingWithConfig:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!a4) {
    __assert_rtn("-[RestorePostProcess _updateBundleIDsToPersonaIDMappingWithConfig:error:]", "RestorePostProcess.m", 546, "error");
  }
  uint64_t v6 = v5;
  id v7 = [v5 account];
  id v8 = [v7 persona];
  unsigned int v9 = [v8 isDataSeparatedPersona];

  if (v9)
  {
    id v10 = +[MDMClient sharedClient];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not updating bundleID to personaID mapping because it was already set by MDM", buf, 2u);
        _MBLog();
      }
      BOOL v13 = 1;
      goto LABEL_33;
    }
    id v12 = [v6 placeholderRestoreDirectory];
    *(void *)buf = 0;
    __int16 v40 = buf;
    uint64_t v41 = 0x3032000000;
    __int16 v42 = sub_1000FE8B0;
    id v43 = sub_1000FE8C0;
    id v44 = 0;
    unsigned __int8 v14 = +[NSFileManager defaultManager];
    id v15 = (id *)(v40 + 40);
    id obj = (id)*((void *)v40 + 5);
    unsigned __int8 v16 = [v14 contentsOfDirectoryAtPath:v12 error:&obj];
    objc_storeStrong(v15, obj);

    if (v16)
    {
      uint64_t v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v17;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = [v16 count];
          *(_DWORD *)id v45 = 134218242;
          unint64_t v46 = v19;
          __int16 v47 = 2114;
          __int16 v48 = v12;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found %ld placeholders at %{public}@", v45, 0x16u);
        }

        [v16 count];
        _MBLog();
      }

      if ([v16 count])
      {
        unsigned __int8 v20 = [v6 account];
        __int16 v21 = [v20 persona];
        id v22 = [v21 personaIdentifier];

        unsigned __int8 v23 = MBGetDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v45 = 138543618;
          unint64_t v46 = v22;
          __int16 v47 = 2112;
          __int16 v48 = v16;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Updating the bundle ID to persona ID mapping persona %{public}@: %@", v45, 0x16u);
          _MBLog();
        }

        v24 = dispatch_group_create();
        dispatch_group_enter(v24);
        id v25 = +[UMUserManager sharedManager];
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1000FE8C8;
        v35[3] = &unk_100410FC8;
        id v37 = buf;
        id v26 = v24;
        __int16 v36 = v26;
        [v25 setBundlesIdentifiers:v16 forPersonaWithPersonaUniqueString:v22 completionHandler:v35];

        MBGroupWaitForever();
        uint64_t v27 = *((void *)v40 + 5);
        BOOL v13 = v27 == 0;
        if (v27)
        {
          unint64_t v28 = MBGetDefaultLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            id v29 = *((void *)v40 + 5);
            *(_DWORD *)id v45 = 138543618;
            unint64_t v46 = v22;
            __int16 v47 = 2112;
            __int16 v48 = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to update the bundle ID to persona ID mapping for persona %{public}@: %@", v45, 0x16u);
            _MBLog();
          }

          *a4 = *((id *)v40 + 5);
        }
        else
        {
          long long v33 = MBGetDefaultLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v45 = 138543362;
            unint64_t v46 = v22;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Updated the bundle ID to persona ID mapping for persona %{public}@", v45, 0xCu);
            _MBLog();
          }
        }
        goto LABEL_32;
      }
    }
    else
    {
      if (!+[MBError isNSFileNotFoundError:*((void *)v40 + 5)])
      {
        unsigned __int8 v31 = MBGetDefaultLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v32 = *((void *)v40 + 5);
          *(_DWORD *)id v45 = 138543618;
          unint64_t v46 = v12;
          __int16 v47 = 2114;
          __int16 v48 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "-contentsOfDirectoryAtPath: failed at %{public}@: %{public}@", v45, 0x16u);
          _MBLog();
        }

        BOOL v13 = 0;
        *a4 = *((id *)v40 + 5);
        goto LABEL_32;
      }
      id v30 = MBGetDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v45 = 138543362;
        unint64_t v46 = v12;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No directory found at %{public}@", v45, 0xCu);
        _MBLog();
      }
    }
    BOOL v13 = 1;
LABEL_32:

    _Block_object_dispose(buf, 8);
LABEL_33:

    goto LABEL_34;
  }
  BOOL v13 = 1;
LABEL_34:

  return v13;
}

- (BOOL)performMigrationWithConfig:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(RestorePostProcess *)self context];
  double v8 = [v7 objectForKeyedSubscript:@"Reason"];

  unsigned int v9 = [(RestorePostProcess *)self didRestoreFromBackup];
  unsigned int v10 = [(RestorePostProcess *)self didRestoreFromCloudBackup];
  char v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      id v12 = "YES";
    }
    else {
      id v12 = "NO";
    }
    if (v10) {
      BOOL v13 = "YES";
    }
    else {
      BOOL v13 = "NO";
    }
    *(_DWORD *)buf = 138413314;
    double v43 = v8;
    __int16 v44 = 2112;
    id v45 = v6;
    __int16 v46 = 2080;
    __int16 v47 = v12;
    __int16 v48 = 2080;
    id v49 = v13;
    __int16 v50 = 2048;
    uint64_t v51 = [(RestorePostProcess *)self userDataDisposition];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Migrating, reason:\"%@\", %@, didRestoreFromBackup:%s, didRestoreFromCloudBackup:%s, userDataDisposition:0x%lx", buf, 0x34u);
    __int16 v38 = v13;
    uint64_t v39 = [(RestorePostProcess *)self userDataDisposition];
    id v36 = v6;
    id v37 = v12;
    double v35 = v8;
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v15 = v14;
  unsigned __int8 v16 = +[MBCKManager sharedInstance];
  if ([(RestorePostProcess *)self _updateBundleIDsToPersonaIDMappingWithConfig:v6 error:a4])
  {
    makeLockdownEncryptionInfoConsistentWithKeychain();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NewCarrierNotification", 0, 0, 0);
    id v18 = objc_alloc_init(_TtC7backupd13MigratorCache);
    id v19 = [v6 placeholderRestoreDirectory];
    id v20 = [v6 isDataSeparated];
    __int16 v21 = [v6 demotedAppsPlist];
    [(RestorePostProcess *)self _configureAndIXInstallPlaceholdersInDirectory:v19 isDataSeparated:v20 migratorCache:v18 demotedAppsPlist:v21];

    _MBLogFlushDeprecated();
    if ([v6 shouldRegisterSafeHarbors])
    {
      id v22 = [v6 safeHarborDirectory];
      [(RestorePostProcess *)self _registerSafeHarborsAtPath:v22];

      _MBLogFlushDeprecated();
    }
    _MBLogFlushDeprecated();
    id v41 = 0;
    unsigned __int8 v23 = [(RestorePostProcess *)self _writeMigratorCache:v18 config:v6 error:&v41];
    id v24 = v41;
    id v25 = v24;
    if (v23)
    {
      if ((-[RestorePostProcess shouldPreserveSettingsAfterRestore](self, "shouldPreserveSettingsAfterRestore") & 1) == 0&& [v6 shouldResetTetheredSyncAnchors])
      {
        [(RestorePostProcess *)self _resetTetheredSyncAnchors];
      }
      if (!objc_msgSend(v6, "shouldPrepareForBackgroundRestore", *(void *)&v35, v36, v37, v38, v39)) {
        goto LABEL_20;
      }
      id v26 = [v6 account];
      if (!v26) {
        __assert_rtn("-[RestorePostProcess performMigrationWithConfig:error:]", "RestorePostProcess.m", 655, "config.account");
      }

      uint64_t v27 = [v6 account];
      id v40 = 0;
      unsigned __int8 v28 = [v16 prepareForBackgroundRestoreWithAccount:v27 error:&v40];
      double v29 = COERCE_DOUBLE(v40);

      if (v28)
      {

LABEL_20:
        id v30 = MBGetDefaultLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          +[NSDate timeIntervalSinceReferenceDate];
          *(_DWORD *)buf = 134217984;
          double v43 = v31 - v15;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Migrated in %0.3f s", buf, 0xCu);
          +[NSDate timeIntervalSinceReferenceDate];
          _MBLog();
        }

        self->_progress = self->_progress + 1.0;
        BOOL v32 = 1;
        goto LABEL_32;
      }
      long long v33 = MBGetDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        double v43 = v29;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to prepare for background restore in-process: %@", buf, 0xCu);
        _MBLog();
      }

      if (a4) {
        *a4 = *(id *)&v29;
      }
    }
    else if (a4)
    {
      BOOL v32 = 0;
      *a4 = v24;
LABEL_32:

      goto LABEL_33;
    }
    BOOL v32 = 0;
    goto LABEL_32;
  }
  BOOL v32 = 0;
LABEL_33:

  return v32;
}

- (BOOL)performMigration
{
  MBLogEnableFileLogging();
  if (([(RestorePostProcess *)self didUpgrade] & 1) == 0)
  {
    unsigned __int8 v5 = [(RestorePostProcess *)self didRestoreFromBackup];
    id v6 = [(RestorePostProcess *)self didRestoreFromCloudBackup];
    if ((v5 & 1) == 0)
    {
      double v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Skipping migration, didRestoreFromBackup:%d", buf, 8u);
        _MBLog();
      }
      BOOL v4 = 1;
      goto LABEL_37;
    }
    id v7 = v6;
    double v8 = [(RestorePostProcess *)self restoredBackupDeviceName];
    +[MBLockdown setDeviceName:v8];

    int v9 = [(RestorePostProcess *)self userDataDisposition] & 0x20;
    if (v9 | [(RestorePostProcess *)self userDataDisposition] & 0x40)
    {
      unsigned int v10 = objc_opt_new();
      char v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Restoring previous settings enabled for mega backup", buf, 2u);
        _MBLog();
      }

      id v30 = 0;
      unsigned __int8 v12 = [v10 restorePreviousSettingsEnabledForMegaBackup:&v30];
      BOOL v13 = v30;
      if ((v12 & 1) == 0)
      {
        double v14 = MBGetDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          BOOL v32 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to restore previous settings enabled for mega backup: %@", buf, 0xCu);
          _MBLog();
        }
      }
    }
    if (v7)
    {
      double v15 = objc_alloc_init((Class)MBManager);
      uint64_t v16 = [v15 personalPersonaIdentifier];
      uint64_t v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        BOOL v32 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "personalPersonaIdentifier: %{public}@", buf, 0xCu);
        _MBLog();
      }

      if (!v16)
      {
        id v20 = MBGetDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to fetch the personal persona identifier", buf, 2u);
          _MBLog();
        }
        BOOL v4 = 0;
        goto LABEL_36;
      }

      double v15 = v16;
    }
    else
    {
      double v15 = 0;
    }
    id v29 = 0;
    id v18 = [[_TtC7backupd14MigratorConfig alloc] initWithPersonaID:v15 didRestoreFromBackup:1 didRestoreFromCloudBackup:v7 error:&v29];
    id v19 = v29;
    id v20 = v19;
    if (v18)
    {
      unsigned __int8 v28 = v19;
      BOOL v4 = [(RestorePostProcess *)self performMigrationWithConfig:v18 error:&v28];
      __int16 v21 = v28;

      if (!v4)
      {
        id v22 = MBGetDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          BOOL v32 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to perform migration with error: %{public}@", buf, 0xCu);
          _MBLog();
        }
      }
      _MBLogFlushDeprecated();
      id v20 = v21;
    }
    else if ([v19 code] == (id)22 {
           && ([v20 domain],
    }
               unsigned __int8 v23 = objc_claimAutoreleasedReturnValue(),
               unsigned int v24 = [v23 isEqual:NSPOSIXErrorDomain],
               v23,
               v24))
    {
      id v25 = MBGetDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v32 = v20;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Skipping migration for non-restore: %@", buf, 0xCu);
        _MBLog();
      }

      BOOL v4 = 1;
    }
    else
    {
      id v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        BOOL v32 = v20;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to create MigratorConfig for backup restore: %{public}@", buf, 0xCu);
        _MBLog();
      }

      BOOL v4 = 0;
    }

LABEL_36:
LABEL_37:

    goto LABEL_38;
  }
  BOOL v4 = 1;
LABEL_38:
  return v4;
}

- (float)estimatedDuration
{
  if (self->_estimatedDuration == 0.0)
  {
    if ([(RestorePostProcess *)self didRestoreFromBackup])
    {
      id v3 = [(RestorePostProcess *)self currentPlaceholderRestoreDirectory];

      if (v3)
      {
        BOOL v4 = +[NSFileManager defaultManager];
        unsigned __int8 v5 = [(RestorePostProcess *)self currentPlaceholderRestoreDirectory];
        id v6 = [v4 contentsOfDirectoryAtPath:v5 error:0];

        self->_estimatedDuration = (float)(unint64_t)[v6 count] + 1.0;
      }
    }
  }
  return self->_estimatedDuration;
}

- (float)migrationProgress
{
  float progress = self->_progress;
  [(RestorePostProcess *)self estimatedDuration];
  return progress / v3;
}

- (NSDictionary)bundleInstallTypeDictionary
{
  return self->_bundleInstallTypeDictionary;
}

- (void)setBundleInstallTypeDictionary:(id)a3
{
}

- (NSMutableDictionary)appInstallCoordinators
{
  return self->_appInstallCoordinators;
}

- (void)setAppInstallCoordinators:(id)a3
{
}

- (OS_dispatch_group)placeholderInstallationGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPlaceholderInstallationGroup:(id)a3
{
}

- (NSString)currentPlaceholderRestoreDirectory
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentPlaceholderRestoreDirectory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPlaceholderRestoreDirectory, 0);
  objc_storeStrong((id *)&self->_placeholderInstallationGroup, 0);
  objc_storeStrong((id *)&self->_appInstallCoordinators, 0);
  objc_storeStrong((id *)&self->_bundleInstallTypeDictionary, 0);
}

@end