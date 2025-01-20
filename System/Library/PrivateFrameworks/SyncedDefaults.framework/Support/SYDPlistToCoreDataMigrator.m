@interface SYDPlistToCoreDataMigrator
+ (BOOL)isSharedIPad;
+ (BOOL)migrateAllPlistsIfNecessaryToCoreDataStore:(id)a3 deleteMigratedPlists:(BOOL)a4 error:(id *)a5;
+ (BOOL)migrateAllPlistsIfNecessaryToCoreDataStore:(id)a3 deleteMigratedPlists:(BOOL)a4 libraryDirectoryURL:(id)a5 error:(id *)a6;
+ (BOOL)migrateAllPlistsToCoreDataStore:(id)a3 deleteMigratedPlists:(BOOL)a4 libraryDirectoryURL:(id)a5 error:(id *)a6;
+ (BOOL)migratePlist:(id)a3 forStoreWithIdentifier:(id)a4 toCoreDataStore:(id)a5 error:(id *)a6;
+ (BOOL)shouldIncrementFailureCountForError:(id)a3;
+ (BOOL)shouldStopMigrationAfterError:(id)a3;
+ (BOOL)shouldUseTransactionForPlistAtURL:(id)a3;
+ (id)allPossibleStorePlistURLsWithLibraryDirectoryURL:(id)a3;
+ (id)keyValueStorePlistFromURL:(id)a3 error:(id *)a4;
+ (id)knownDaemons;
+ (void)addPlistURLsAndStoreIdentifiersForBundleRecord:(id)a3 toDictionary:(id)a4 uncontainerizedSyncedPreferencesDirectoryURL:(id)a5;
+ (void)addPlistURLsAndStoreIdentifiersForKnownDaemonsToDictionary:(id)a3 uncontainerizedSyncedPreferencesDirectoryURL:(id)a4;
+ (void)addPlistURLsForBundleIdentifier:(id)a3 defaultStoreIdentifier:(id)a4 additionalStoreIdentifiers:(id)a5 toDictionary:(id)a6 syncedPreferencesDirectoryURL:(id)a7;
@end

@implementation SYDPlistToCoreDataMigrator

+ (BOOL)migrateAllPlistsIfNecessaryToCoreDataStore:(id)a3 deleteMigratedPlists:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = +[NSFileManager defaultManager];
  id v15 = 0;
  v10 = [v9 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:0 error:&v15];
  id v11 = v15;

  if (v10)
  {
    unsigned __int8 v12 = [a1 migrateAllPlistsIfNecessaryToCoreDataStore:v8 deleteMigratedPlists:v6 libraryDirectoryURL:v10 error:a5];
  }
  else
  {
    v13 = SYDGetMigrationLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_100034DD0();
    }

    unsigned __int8 v12 = 0;
    if (a5) {
      *a5 = v11;
    }
  }

  return v12;
}

+ (BOOL)migrateAllPlistsIfNecessaryToCoreDataStore:(id)a3 deleteMigratedPlists:(BOOL)a4 libraryDirectoryURL:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  unsigned __int8 v12 = _os_activity_create((void *)&_mh_execute_header, "kvs/migrate-if-necessary", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v13 = SYDGetMigrationLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100035268();
  }

  id v40 = 0;
  unsigned int v14 = [v10 didMigrateFromPlistsWithError:&v40];
  id v15 = v40;
  if (!v15)
  {
    if (v14)
    {
      v17 = SYDGetMigrationLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_100034E38();
      }
LABEL_30:
      v16 = 0;
      BOOL v18 = 1;
      goto LABEL_31;
    }
    if ([a1 isSharedIPad])
    {
      v17 = SYDGetMigrationLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_100034E6C();
      }
      goto LABEL_30;
    }
    v19 = SYDGetMigrationLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_1000351CC();
    }

    id v39 = 0;
    unsigned int v20 = [a1 migrateAllPlistsToCoreDataStore:v10 deleteMigratedPlists:v8 libraryDirectoryURL:v11 error:&v39];
    v21 = v39;
    v16 = v21;
    if (v20)
    {
      v38 = v21;
      [v10 setDidMigrateFromPlists:1 error:&v38];
      v17 = v38;

      if (v17)
      {
        v22 = SYDGetMigrationLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          sub_100034ED4();
        }
      }
      else
      {
        v17 = SYDGetMigrationLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          sub_100034EA0();
        }
      }
      goto LABEL_30;
    }
    v23 = SYDGetMigrationLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      sub_100035164();
    }

    if (![a1 shouldIncrementFailureCountForError:v16])
    {
      BOOL v18 = 0;
      goto LABEL_32;
    }
    id v37 = 0;
    unsigned __int16 v24 = (unsigned __int16)[v10 failedMigrationCountWithError:&v37];
    v25 = v37;
    if (v25)
    {
      v26 = v25;
      v27 = SYDGetMigrationLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000350FC();
      }
    }
    else
    {
      int v29 = (__int16)(v24 + 1);
      id v36 = 0;
      unsigned __int8 v30 = [v10 setFailedMigrationCount:v29 error:&v36];
      v17 = v36;
      if ((v30 & 1) == 0)
      {
        v27 = SYDGetMigrationLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_100035094();
        }
        BOOL v18 = 0;
        v26 = v17;
        goto LABEL_48;
      }
      v31 = SYDGetMigrationLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_100035018(v29, v31);
      }

      if (v29 < 10) {
        goto LABEL_6;
      }
      v32 = SYDGetMigrationLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        sub_100034FD8();
      }

      v35 = v17;
      unsigned __int8 v33 = [v10 setDidMigrateFromPlists:1 error:&v35];
      v26 = v35;

      if (v33)
      {
        v34 = SYDGetMigrationLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          sub_100034F3C();
        }

        BOOL v18 = 1;
        v27 = v16;
        v16 = 0;
        goto LABEL_48;
      }
      v27 = SYDGetMigrationLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100034F70();
      }
    }
    BOOL v18 = 0;
LABEL_48:

    v17 = v26;
    goto LABEL_31;
  }
  v16 = v15;
  v17 = SYDGetMigrationLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100035200();
  }
LABEL_6:
  BOOL v18 = 0;
LABEL_31:

LABEL_32:
  if (a6) {
    *a6 = v16;
  }

  os_activity_scope_leave(&state);
  return v18;
}

+ (BOOL)migrateAllPlistsToCoreDataStore:(id)a3 deleteMigratedPlists:(BOOL)a4 libraryDirectoryURL:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  unsigned __int8 v12 = _os_activity_create((void *)&_mh_execute_header, "kvs/migrate-all-plists", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  if (sub_10000AD74())
  {
    v13 = SYDGetMigrationLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_10003529C();
    }

    NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
    CFStringRef v50 = @"Cannot migrate the non-personal persona";
    unsigned int v14 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    id v15 = +[NSError errorWithDomain:@"SyncedDefaults" code:1025 userInfo:v14];

    if (a6)
    {
      id v15 = v15;
      BOOL v16 = 0;
      *a6 = v15;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    v17 = SYDGetMigrationLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1000353A8();
    }

    id v15 = +[NSDate date];
    uint64_t v41 = 0;
    v42[0] = &v41;
    v42[1] = 0x2020000000;
    v42[2] = 0;
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = sub_100010F04;
    id v39 = sub_100010EB4;
    id v40 = 0;
    BOOL v18 = [a1 allPossibleStorePlistURLsWithLibraryDirectoryURL:v11];
    v19 = SYDGetMigrationLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100035368((uint64_t)v48, (uint64_t)[v18 count], v19);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10002541C;
    v29[3] = &unk_100051460;
    id v33 = a1;
    v31 = &v35;
    id v30 = v10;
    v32 = &v41;
    BOOL v34 = a4;
    [v18 enumerateKeysAndObjectsUsingBlock:v29];
    [v15 timeIntervalSinceNow];
    double v21 = v20;
    v22 = SYDGetMigrationLog();
    double v23 = -v21;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_1000352DC((uint64_t)v42, v22, v23);
    }

    unsigned __int16 v24 = (void *)v36[5];
    if (v24)
    {
      CFStringRef v46 = @"errorDomainAndCode";
      v25 = [v24 domain];
      v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%ld", v25, [(id)v36[5] code]);
      v47 = v26;
      +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    }
    else
    {
      v44[0] = @"storeCount";
      v25 = +[NSNumber numberWithUnsignedInteger:*(void *)(v42[0] + 24)];
      v45[0] = v25;
      v44[1] = @"duration";
      v26 = +[NSNumber numberWithDouble:v23];
      v45[1] = v26;
      +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
    v27 = };
    AnalyticsSendEvent();

    if (a6) {
      *a6 = (id) v36[5];
    }
    BOOL v16 = v36[5] == 0;

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);
  }

  os_activity_scope_leave(&state);
  return v16;
}

+ (BOOL)migratePlist:(id)a3 forStoreWithIdentifier:(id)a4 toCoreDataStore:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unsigned __int8 v12 = SYDGetMigrationLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1000357B4();
  }

  v13 = +[NSDate date];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_100010F04;
  int v29 = sub_100010EB4;
  id v30 = 0;
  unsigned int v14 = [v9 objectForKeyedSubscript:@"values"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100025A1C;
  v21[3] = &unk_100051488;
  id v15 = v10;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  unsigned __int16 v24 = &v25;
  [v14 enumerateKeysAndObjectsUsingBlock:v21];
  v17 = SYDGetMigrationLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    [v13 timeIntervalSinceNow];
    sub_100035760((uint64_t)v15, (uint64_t)v31, v17, v18);
  }

  if (a6) {
    *a6 = (id) v26[5];
  }
  BOOL v19 = v26[5] == 0;

  _Block_object_dispose(&v25, 8);
  return v19;
}

+ (id)keyValueStorePlistFromURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = +[NSInputStream inputStreamWithURL:v5];
  [v6 open];
  id v18 = 0;
  v7 = +[NSPropertyListSerialization propertyListWithStream:v6 options:0 format:0 error:&v18];
  id v8 = v18;
  [v6 close];
  if (v8)
  {
    id v9 = [v8 domain];
    if ([v9 isEqualToString:NSCocoaErrorDomain])
    {
      id v10 = [v8 code];

      if (v10 != (id)3842) {
        goto LABEL_9;
      }
      id v11 = [v8 userInfo];
      id v9 = [v11 objectForKeyedSubscript:NSUnderlyingErrorKey];

      unsigned __int8 v12 = [v9 domain];
      if ([v12 isEqualToString:NSPOSIXErrorDomain])
      {
        id v13 = [v9 code];

        if (v13 == (id)2)
        {

          id v8 = 0;
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
      }
    }

LABEL_9:
    id v9 = SYDGetMigrationLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000356F8();
    }
    goto LABEL_11;
  }
LABEL_12:
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v14 = SYDGetMigrationLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100035B90();
      }

      v7 = 0;
    }
    id v15 = [v7 objectForKeyedSubscript:@"values"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v16 = SYDGetMigrationLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100035B28();
      }

      v7 = 0;
    }
  }
  if (a4) {
    *a4 = v8;
  }

  return v7;
}

+ (BOOL)shouldStopMigrationAfterError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (sub_10000E824(v3)) {
      char v5 = 1;
    }
    else {
      char v5 = sub_10000E8F4(v4);
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldIncrementFailureCountForError:(id)a3
{
  id v3 = a3;
  if (sub_10000E824(v3)) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = sub_10000E8F4(v3) ^ 1;
  }

  return v4;
}

+ (BOOL)shouldUseTransactionForPlistAtURL:(id)a3
{
  id v3 = a3;
  id v13 = 0;
  id v12 = 0;
  unsigned __int8 v4 = [v3 getResourceValue:&v13 forKey:NSURLFileSizeKey error:&v12];
  id v5 = v13;
  id v6 = v12;
  if (v4)
  {
    id v7 = [v5 unsignedLongValue];
    BOOL v8 = (unint64_t)v7 < 0x500000;
    id v9 = SYDGetMigrationLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [v3 lastPathComponent];
      *(_DWORD *)buf = 138412802;
      id v15 = v10;
      __int16 v16 = 1024;
      BOOL v17 = (unint64_t)v7 < 0x500000;
      __int16 v18 = 2048;
      id v19 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Plist %@: useTransaction=%d size=%ld KB", buf, 0x1Cu);
    }
  }
  else
  {
    id v9 = SYDGetMigrationLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100035BF8();
    }
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)isSharedIPad
{
  v2 = +[UMUserManager sharedManager];
  unsigned __int8 v3 = [v2 isSharedIPad];

  return v3;
}

+ (id)allPossibleStorePlistURLsWithLibraryDirectoryURL:(id)a3
{
  id v4 = a3;
  id v5 = SYDGetMigrationLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100035C60();
  }

  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = [v4 URLByAppendingPathComponent:@"SyncedPreferences" isDirectory:1];
  BOOL v8 = +[LSApplicationRecord enumeratorWithOptions:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        [a1 addPlistURLsAndStoreIdentifiersForBundleRecord:*(void *)(*((void *)&v23 + 1) + 8 * i) toDictionary:v6 uncontainerizedSyncedPreferencesDirectoryURL:v7];
      }
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }
  id v13 = +[LSApplicationExtensionRecord enumeratorWithOptions:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        [a1 addPlistURLsAndStoreIdentifiersForBundleRecord:*(void *)(*((void *)&v19 + 1) + 8 * (void)j) toDictionary:v6 uncontainerizedSyncedPreferencesDirectoryURL:v7];
      }
      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }
  [a1 addPlistURLsAndStoreIdentifiersForKnownDaemonsToDictionary:v6 uncontainerizedSyncedPreferencesDirectoryURL:v7];

  return v6;
}

+ (void)addPlistURLsAndStoreIdentifiersForBundleRecord:(id)a3 toDictionary:(id)a4 uncontainerizedSyncedPreferencesDirectoryURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = SYDGetMigrationLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100035E40(v8, v11);
  }

  id v12 = [v8 entitlements];
  id v13 = [v12 objectForKey:@"com.apple.developer.ubiquity-kvstore-identifier" ofClass:objc_opt_class()];
  uint64_t v14 = objc_opt_class();
  id v15 = [v12 objectForKey:@"com.apple.private.ubiquity-additional-kvstore-identifiers" ofClass:v14 valuesOfClass:objc_opt_class()];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v16 = [v8 bundleIdentifier];
  }
  else
  {
    uint64_t v16 = [v8 effectiveBundleIdentifier];
  }
  BOOL v17 = (void *)v16;
  if (v13 || [v15 count])
  {
    if (v17)
    {
      __int16 v18 = [v8 dataContainerURL];
      long long v19 = v18;
      id v25 = v9;
      id v20 = a1;
      if (v18)
      {
        long long v21 = [v18 URLByAppendingPathComponent:@"Library" isDirectory:1];
        long long v22 = [v21 URLByAppendingPathComponent:@"SyncedPreferences" isDirectory:1];
      }
      else
      {
        long long v23 = SYDGetMigrationLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          sub_100035DB4(v8, v23);
        }

        long long v22 = v10;
      }
      long long v24 = v20;
      id v9 = v25;
      [v24 addPlistURLsForBundleIdentifier:v17 defaultStoreIdentifier:v13 additionalStoreIdentifiers:v15 toDictionary:v25 syncedPreferencesDirectoryURL:v22];
    }
    else
    {
      long long v22 = SYDGetMigrationLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        sub_100035D20(v8, v22);
      }
    }
  }
  else
  {
    long long v22 = SYDGetMigrationLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100035C94(v8, v22);
    }
  }
}

+ (void)addPlistURLsAndStoreIdentifiersForKnownDaemonsToDictionary:(id)a3 uncontainerizedSyncedPreferencesDirectoryURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SYDGetMigrationLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100035ECC();
  }

  id v9 = [a1 knownDaemons];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000268E8;
  v12[3] = &unk_1000514B0;
  id v14 = v7;
  id v15 = a1;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];
}

+ (void)addPlistURLsForBundleIdentifier:(id)a3 defaultStoreIdentifier:(id)a4 additionalStoreIdentifiers:(id)a5 toDictionary:(id)a6 syncedPreferencesDirectoryURL:(id)a7
{
  id v34 = a3;
  id v11 = a4;
  id v12 = a5;
  id v33 = a6;
  id v32 = a7;
  id v13 = SYDGetMigrationLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v29 = [v12 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138412802;
    id v41 = v34;
    __int16 v42 = 2112;
    id v43 = v11;
    __int16 v44 = 2112;
    v45 = v29;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Adding plist URLs for bundle identifier %@ with defaultStoreIdentifier=(%@) additionalStoreIdentifiers=[%@]", buf, 0x20u);
  }
  if (v11)
  {
    id v14 = [v32 URLByAppendingPathComponent:v34];
    id v15 = [v14 URLByAppendingPathExtension:@"plist"];

    [v33 setObject:v11 forKeyedSubscript:v15];
  }
  uint64_t v16 = (char *)[v12 count];
  if (v11) {
    BOOL v17 = v16 + 1;
  }
  else {
    BOOL v17 = v16;
  }
  __int16 v18 = +[NSMutableSet setWithCapacity:v17];
  long long v19 = v18;
  if (v11) {
    [v18 addObject:v11];
  }
  v31 = v11;
  if (v12) {
    [v19 addObjectsFromArray:v12];
  }
  id v30 = v12;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v20 = v19;
  id v21 = [v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v36;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        long long v26 = +[NSString stringWithFormat:@"%@-%@", v34, v25];
        uint64_t v27 = [v26 stringByAppendingPathExtension:@"plist"];

        v28 = [v32 URLByAppendingPathComponent:v27];
        [v33 setObject:v25 forKeyedSubscript:v28];
      }
      id v22 = [v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v22);
  }
}

+ (id)knownDaemons
{
  v4[0] = @"com.apple.sbd";
  v4[1] = @"com.apple.security.cloudkeychainproxy3";
  v5[0] = &off_100053DF8;
  v5[1] = &off_100053E20;
  v4[2] = @"accountsd";
  v4[3] = @"com.apple.finder";
  v5[2] = &off_100053E48;
  v5[3] = &off_100053E70;
  v4[4] = @"com.apple.accessibility.AccessibilityUIServer";
  v4[5] = @"com.apple.VoiceOverTouch";
  v5[4] = &off_100053E98;
  v5[5] = &off_100053EC0;
  v4[6] = @"com.apple.TextInput.kbd";
  v4[7] = @"com.apple.nanoweatherprefsd";
  v5[6] = &off_100053EE8;
  v5[7] = &off_100053F10;
  v4[8] = @"com.apple.springboard";
  v4[9] = @"com.apple.backboardd";
  v5[8] = &off_100053F38;
  v5[9] = &off_100053F60;
  v4[10] = @"com.apple.datamigrator";
  v4[11] = @"com.apple.CoreSuggestions";
  v5[10] = &off_100053F88;
  v5[11] = &off_100053FB0;
  v4[12] = @"com.apple.cmfsyncagent";
  v4[13] = @"com.apple.accessibility.heard";
  v5[12] = &off_100053FD8;
  v5[13] = &off_100054000;
  v4[14] = @"com.apple.wifid";
  v4[15] = @"com.apple.coretelephony";
  v5[14] = &off_100054028;
  v5[15] = &off_100054050;
  v4[16] = @"com.apple.cloudrecents.CloudRecentsAgent";
  v4[17] = @"com.apple.mediaaccessibilityd";
  v5[16] = &off_100054078;
  v5[17] = &off_1000540A0;
  v4[18] = @"com.apple.email.maild";
  v4[19] = @"com.apple.tipsd";
  v5[18] = &off_1000540C8;
  v5[19] = &off_1000540F0;
  v4[20] = @"com.apple.touristd";
  v5[20] = &off_100054118;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:21];
  return v2;
}

@end