@interface NWActivityDistributionStoreDescriptor
+ (id)withGroupAndOptions:(int64_t)a3 groupTarget:(id)a4;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (id)_initWithGroupAndOptions:(int64_t)a3 groupTarget:(id)a4;
- (void)findInterpolatedPercentileFromWiFiStats:(id)a3 andReply:(id)a4;
@end

@implementation NWActivityDistributionStoreDescriptor

+ (id)withGroupAndOptions:(int64_t)a3 groupTarget:(id)a4
{
  id v5 = a4;
  v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446978;
    v10 = "+[NWActivityDistributionStoreDescriptor withGroupAndOptions:groupTarget:]";
    __int16 v11 = 1024;
    int v12 = 58;
    __int16 v13 = 2048;
    int64_t v14 = a3;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Initiating store descriptor for %ld and options %@", (uint8_t *)&v9, 0x26u);
  }

  id v7 = [[NWActivityDistributionStoreDescriptor alloc] _initWithGroupAndOptions:a3 groupTarget:v5];

  return v7;
}

- (id)_initWithGroupAndOptions:(int64_t)a3 groupTarget:(id)a4
{
  id v5 = a4;
  v42.receiver = self;
  v42.super_class = (Class)NWActivityDistributionStoreDescriptor;
  v6 = [(NWActivityDistributionStoreDescriptor *)&v42 init];
  if (!v6) {
    goto LABEL_29;
  }
  v8 = +[WAUtil resourcePath];
  int v9 = NSSQLiteStoreType;
  v10 = NSFileProtectionNone;
  __int16 v11 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v45 = "_Bool createPolicy(_Bool, _Bool, NSString *__autoreleasing *, NSString *__autoreleasing *)";
    __int16 v46 = 1024;
    int v47 = 29;
    __int16 v48 = 2112;
    CFStringRef v49 = @"LEGACY";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NWActivityDistributionStoreDescriptor is running in %@ MODE", buf, 0x1Cu);
  }

  int v12 = v9;
  __int16 v13 = v10;
  if (!v8)
  {
    __int16 v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v45 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
      __int16 v46 = 1024;
      int v47 = 79;
      __int16 v48 = 2112;
      CFStringRef v49 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to access bundle path %@", buf, 0x1Cu);
    }
    goto LABEL_39;
  }
  int64_t v14 = +[NSFileManager defaultManager];
  __int16 v15 = [v14 contentsOfDirectoryAtPath:v8 error:0];

  if (![v15 count])
  {
    v31 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v45 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
      __int16 v46 = 1024;
      int v47 = 83;
      __int16 v48 = 2112;
      CFStringRef v49 = v8;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}s::%d:Found no files in %@", buf, 0x1Cu);
    }

LABEL_39:
    int v27 = 0;
    LODWORD(v16) = 0;
    goto LABEL_26;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  __int16 v15 = v15;
  id v16 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v16)
  {
    v32 = v13;
    v33 = v12;
    v34 = v8;
    v35 = v7;
    v36 = v6;
    uint64_t v17 = *(void *)v39;
    while (2)
    {
      for (i = 0; i != v16; i = ((char *)i + 1))
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v20 = [v19 componentsSeparatedByString:@".", v32, v33, v34, v35];
        v21 = [v20 firstObject];

        if ([v19 hasSuffix:@"sqlite"]
          && [(__CFString *)v21 hasPrefix:@"NWActivity_"])
        {
          if (a3)
          {
            v22 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v45 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
              __int16 v46 = 1024;
              int v47 = 106;
              __int16 v48 = 2048;
              CFStringRef v49 = (const __CFString *)a3;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unsupported Group %ld", buf, 0x1Cu);
            }
          }
          else if ([(__CFString *)v21 hasSuffix:@"cdf_allActivities"])
          {
            id v16 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              v45 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
              __int16 v46 = 1024;
              int v47 = 99;
              __int16 v48 = 2112;
              CFStringRef v49 = v21;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found file %@", buf, 0x1Cu);
            }

            uint64_t v23 = +[NSString stringWithString:v19];
            v6 = v36;
            backingStore = v36->backingStore;
            v36->backingStore = (NSString *)v23;

            uint64_t v25 = +[NSString stringWithString:v21];
            sqlTable = v36->sqlTable;
            v36->sqlTable = (NSString *)v25;

            LODWORD(v16) = 1;
            goto LABEL_24;
          }
        }
      }
      id v16 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v16) {
        continue;
      }
      break;
    }
    v6 = v36;
LABEL_24:
    v8 = v34;
    id v7 = v35;
    __int16 v13 = v32;
    int v12 = v33;
  }

  int v27 = 1;
LABEL_26:

  if (!v27)
  {
LABEL_32:
    v28 = 0;
    goto LABEL_33;
  }
  if (!v16)
  {
LABEL_29:
    v29 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v45 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
      __int16 v46 = 1024;
      int v47 = 112;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find distribution", buf, 0x12u);
    }

    goto LABEL_32;
  }
  v28 = v6;
LABEL_33:

  return v28;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  v3 = +[NSMutableDictionary dictionary];
  __int16 v15 = +[NSURL fileURLWithPath:self->backingStore];
  [v3 addEntriesFromDictionary:&off_1000E3F48];
  storeProt = self->storeProt;
  id v5 = +[NSNumber numberWithBool:1];
  v6 = +[NSNumber numberWithBool:1];
  id v7 = +[NSNumber numberWithBool:1];
  v8 = v3;
  int v9 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v3, NSSQLitePragmasOption, storeProt, NSPersistentStoreFileProtectionKey, v5, NSMigratePersistentStoresAutomaticallyOption, v6, NSInferMappingModelAutomaticallyOption, v7, NSReadOnlyPersistentStoreOption, 0);

  storeKind = self->storeKind;
  id v16 = 0;
  __int16 v11 = [0 addPersistentStoreWithType:storeKind configuration:0 URL:v15 options:v9 error:&v16];
  id v12 = v16;

  if (v11)
  {
    persistentStoreCoordinator = self->__persistentStoreCoordinator;
    self->__persistentStoreCoordinator = 0;
  }
  return 0;
}

- (void)findInterpolatedPercentileFromWiFiStats:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  ppDb = 0;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  int v9 = &AnalyticsSendEventLazy_ptr;
  id v10 = +[NSString stringWithFormat:@"/System/Library/PrivateFrameworks/WiFiAnalytics.framework/%@", self->backingStore];
  if (sqlite3_open_v2((const char *)[v10 UTF8String], &ppDb, 1, 0))
  {
    sqlite3_close_v2(ppDb);
    __int16 v11 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = sqlite3_errmsg(ppDb);
      id v13 = [v10 UTF8String];
      *(_DWORD *)buf = 136446978;
      v61 = "-[NWActivityDistributionStoreDescriptor findInterpolatedPercentileFromWiFiStats:andReply:]";
      __int16 v62 = 1024;
      int v63 = 166;
      __int16 v64 = 2080;
      v65 = v12;
      __int16 v66 = 2080;
      id v67 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to open database with message '%s' for file %s", buf, 0x26u);
    }

    NSErrorUserInfoKey v69 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v70 = @"WAErrorCodeSQLiteNotOK";
    int64_t v14 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    __int16 v15 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9020 userInfo:v14];

    v7[2](v7, 0, v15);
  }
  else
  {
    id v36 = v10;
    v37 = v7;
    ppStmt = 0;
    bzero(buf, 0x320uLL);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v38 = v6;
    id v16 = v6;
    id v40 = [v16 countByEnumeratingWithState:&v41 objects:v59 count:16];
    if (v40)
    {
      uint64_t v39 = *(void *)v42;
      do
      {
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(void *)v42 != v39) {
            objc_enumerationMutation(v16);
          }
          uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          v19 = [v16 objectForKeyedSubscript:v18];
          [v19 doubleValue];
          double v21 = v20;
          v22 = v9;
          uint64_t v23 = [v9[294] stringWithFormat:@"SELECT \"%@\" from \"%@\";", v18, self->sqlTable];
          v24 = ppDb;
          id v25 = v23;
          int v26 = sqlite3_prepare_v2(v24, (const char *)[v25 UTF8String], -1, &ppStmt, 0);
          if (v26)
          {
            int v27 = v26;
            v28 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              backingStore = self->backingStore;
              sqlTable = self->sqlTable;
              *(_DWORD *)int v47 = 136447490;
              __int16 v48 = "-[NWActivityDistributionStoreDescriptor findInterpolatedPercentileFromWiFiStats:andReply:]";
              __int16 v49 = 1024;
              int v50 = 187;
              __int16 v51 = 2112;
              uint64_t v52 = v18;
              __int16 v53 = 2112;
              v54 = backingStore;
              __int16 v55 = 2112;
              v56 = sqlTable;
              __int16 v57 = 1024;
              int v58 = v27;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}s::%d:Parameter %@ not found in file %@ table %@ returned %d", v47, 0x36u);
            }

            int v9 = v22;
          }
          else
          {
            uint64_t v31 = 0;
            while (sqlite3_step(ppStmt) == 100)
            {
              double v32 = sqlite3_column_double(ppStmt, 0);
              *(double *)&v68[8 * v31] = v32;
              if (v21 >= v32)
              {
                double v33 = 99.0;
                if ((v31 + 100) <= 0x63) {
                  double v33 = (double)(v31 + 100)
                }
                      - (v21 - *(double *)&v68[8 * v31 + 8]) / (v32 - *(double *)&v68[8 * v31 + 8]);
                v34 = +[NSNumber numberWithDouble:v33];
                [v8 setObject:v34 forKey:v18];

                break;
              }
              if (--v31 == -99) {
                break;
              }
            }
            sqlite3_finalize(ppStmt);
          }
        }
        id v40 = [v16 countByEnumeratingWithState:&v41 objects:v59 count:16];
      }
      while (v40);
    }

    id v7 = v37;
    ((void (**)(id, id, void *))v37)[2](v37, v8, 0);
    id v6 = v38;
    id v10 = v36;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->storeProt, 0);
  objc_storeStrong((id *)&self->storeKind, 0);
  objc_storeStrong((id *)&self->sqlTable, 0);

  objc_storeStrong((id *)&self->backingStore, 0);
}

@end