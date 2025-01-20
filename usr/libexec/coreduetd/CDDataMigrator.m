@interface CDDataMigrator
+ (BOOL)dkcMigration;
+ (BOOL)logMigration;
+ (BOOL)performMigration;
+ (BOOL)remoteHistogramMigration;
+ (BOOL)spotlightViewerEventsMigration;
+ (CDDataMigrator)sharedInstance;
+ (void)_migrateSpotlightEvents;
+ (void)removeFileAtPath:(id)a3;
- (CDDataMigrator)init;
@end

@implementation CDDataMigrator

+ (CDDataMigrator)sharedInstance
{
  if (qword_100040F60 != -1) {
    dispatch_once(&qword_100040F60, &stru_1000392F8);
  }
  v2 = (void *)qword_100040F58;

  return (CDDataMigrator *)v2;
}

- (CDDataMigrator)init
{
  v8.receiver = self;
  v8.super_class = (Class)CDDataMigrator;
  v2 = [(CDDataMigrator *)&v8 init];
  if (v2
    && (int out_token = 0,
        dispatch_get_global_queue(-32768, 0),
        v3 = objc_claimAutoreleasedReturnValue(),
        uint32_t v4 = notify_register_dispatch("com.apple.datamigrator.migrationDidFinish", &out_token, v3, &stru_100039318),
        v3,
        v4))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100022E44(v4);
    }
    v5 = 0;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

+ (BOOL)performMigration
{
  v2 = _os_activity_create((void *)&_mh_execute_header, "Duet: CDDataMigrator performMigration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v2, &v14);
  os_activity_scope_leave(&v14);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14.opaque[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Beginning CoreDuet Migration....", (uint8_t *)&v14, 2u);
  }
  v3 = (void *)os_transaction_create();
  unsigned int v5 = !+[CDDataMigrator logMigration];
  unsigned int v7 = !+[CDDataMigrator dkcMigration] + v5;
  unsigned int v9 = !+[CDDataMigrator spotlightViewerEventsMigration];
  uint64_t v11 = v7 + v9 + !+[CDDataMigrator remoteHistogramMigration];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v12 = +[NSNumber numberWithInt:v11];
    LODWORD(v14.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v14.opaque + 4) = (uint64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Finished CoreDuet migration with %@ errors.", (uint8_t *)&v14, 0xCu);
  }
  return v11 == 0;
}

+ (BOOL)logMigration
{
  v2 = _os_activity_create((void *)&_mh_execute_header, "Duet: CDDataMigrator logMigration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  +[CDDataMigrator removeFileAtPath:@"/var/log/CoreDuet/coreduetd.log"];
  +[CDDataMigrator removeFileAtPath:@"/var/log/CoreDuet/duetknowledged.log"];
  +[CDDataMigrator removeFileAtPath:@"/var/log/CoreDuet/duetexpertd.log"];
  uint64_t v3 = 0;
  do
  {
    uint32_t v4 = +[NSString stringWithFormat:@"%@.%d.gz", @"/var/log/CoreDuet/coreduetd.log", v3];
    +[CDDataMigrator removeFileAtPath:v4];

    unsigned int v5 = +[NSString stringWithFormat:@"%@.%d.gz", @"/var/log/CoreDuet/duetknowledged.log", v3];
    +[CDDataMigrator removeFileAtPath:v5];

    v6 = +[NSString stringWithFormat:@"%@.%d.gz", @"/var/log/CoreDuet/duetexpertd.log", v3];
    +[CDDataMigrator removeFileAtPath:v6];

    uint64_t v3 = (v3 + 1);
  }
  while (v3 != 15);
  return 1;
}

+ (void)removeFileAtPath:(id)a3
{
  id v3 = a3;
  uint32_t v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    v6 = +[NSFileManager defaultManager];
    id v8 = 0;
    [v6 removeItemAtPath:v3 error:&v8];
    id v7 = v8;

    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100022F40();
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      sub_100022EC4();
    }
  }
}

+ (BOOL)dkcMigration
{
  v2 = _os_activity_create((void *)&_mh_execute_header, "Duet: CDDataMigrator dkcMigration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v2, &v5);
  os_activity_scope_leave(&v5);

  id v3 = +[_DKKnowledgeStore knowledgeStoreWithDirectReadOnlyAccess];
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100022FC8();
  }

  return v3 != 0;
}

+ (void)_migrateSpotlightEvents
{
  v2 = +[NSMutableArray array];
  id v3 = +[NSDate date];
  os_activity_scope_state_s v14 = 0;
  ppDb = 0;
  sqlite3_open("/var/mobile/Library/CoreDuet/coreduetdClassD.db", &ppDb);
  uint32_t v4 = (const char *)[@"SELECT ZINTEGERID from ZCDDMATTRIBUTENAMEMAPPER where ZNAME==\"com.apple.spotlightviewer.events\";"
                       "UTF8String");
  sqlite3_exec(ppDb, v4, (int (__cdecl *)(void *, int, char **, char **))sub_10001E044, 0, 0);
  sqlite3_close(ppDb);
  ppDb = 0;
  if (!qword_100040F68)
  {
    id v8 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Couldn't find spotlight viewer events", buf, 2u);
    }
    goto LABEL_12;
  }
  sqlite3_open("/var/mobile/Library/CoreDuet/coreduetd.db", &v14);
  +[NSString stringWithFormat:@"SELECT ZVALUE,ZCREATIONDATE from ZCDDMSTRINGATTRIBUTE where ZINTEGERID==%lld", qword_100040F68];
  id v5 = objc_claimAutoreleasedReturnValue();
  v6 = (const char *)[v5 UTF8String];

  sqlite3_exec(v14, v6, (int (__cdecl *)(void *, int, char **, char **))sub_10001E0C4, v2, 0);
  sqlite3_close(v14);
  os_activity_scope_state_s v14 = 0;
  if ([v2 count])
  {
    id v7 = +[_DKKnowledgeStore knowledgeStore];
    id v13 = 0;
    [v7 saveObjects:v2 error:&v13];
    id v8 = v13;
    if (v8)
    {
      unsigned int v9 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100023010();
      }
    }
    v10 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v3 timeIntervalSinceNow];
      v12 = +[NSNumber numberWithDouble:-v11];
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Migration took %@", buf, 0xCu);
    }
LABEL_12:
  }
}

+ (BOOL)spotlightViewerEventsMigration
{
  id v3 = _os_activity_create((void *)&_mh_execute_header, "Duet: CDDataMigrator spotlightViewerEventsMigration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  uint32_t v4 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Migrating spotlight events!", (uint8_t *)&state, 2u);
  }

  v15 = +[NSFileManager defaultManager];
  unsigned int v5 = [v15 fileExistsAtPath:@"/var/mobile/Library/CoreDuet/coreduetd.db"];
  v6 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(state.opaque[0]) = 67109120;
    HIDWORD(state.opaque[0]) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Old DB Exists: %u", (uint8_t *)&state, 8u);
  }

  if (v5)
  {
    [a1 _migrateSpotlightEvents];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = [&off_10003BBD0 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(&off_10003BBD0);
          }
          v12 = +[NSString stringWithFormat:@"/var/mobile/Library/CoreDuet/%@", *(void *)(*((void *)&v16 + 1) + 8 * i)];
          id v13 = +[_CDLogging knowledgeChannel];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(state.opaque[0]) = 138412290;
            *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deleting file: %@", (uint8_t *)&state, 0xCu);
          }

          +[CDDataMigrator removeFileAtPath:v12];
        }
        id v9 = [&off_10003BBD0 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }

  return 1;
}

+ (BOOL)remoteHistogramMigration
{
  v2 = _os_activity_create((void *)&_mh_execute_header, "Duet: CDDataMigrator remoteHistogramMigration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  id v3 = +[CDDPaths knowledgeDatabaseDirectory];
  uint32_t v4 = +[_DKKnowledgeStorage storageWithDirectory:v3 readOnly:0];

  id v5 = objc_alloc((Class)NSDateInterval);
  v6 = +[NSDate distantPast];
  id v7 = +[NSDate distantFuture];
  id v8 = [v5 initWithStartDate:v6 endDate:v7];

  id v9 = +[_DKSystemEventStreams pairedDeviceForecastStream];
  uint64_t v10 = +[NSPredicate predicateWithValue:1];
  double v11 = +[_DKHistogramQuery histogramQueryForStream:v9 interval:v8 withPredicate:v10];

  [v11 setIncludeLocalResults:0];
  [v11 setIncludeRemoteResults:1];
  [v11 setRemoteHistogramLimit:1];
  v12 = [v4 executeQuery:v11 error:0];
  id v13 = [v12 identifier];

  if (v13)
  {
    id v34 = v8;
    os_activity_scope_state_s v14 = +[NSMutableArray array];
    v15 = [v12 identifier];
    long long v16 = +[NSPredicate predicateWithFormat:@"identifier != %@", v15];
    [v14 addObject:v16];

    long long v17 = [v12 stream];

    if (v17)
    {
      long long v18 = [v12 stream];
      long long v19 = [v18 name];
      v20 = +[NSPredicate predicateWithFormat:@"streamName = %@", v19];
      [v14 addObject:v20];
    }
    v21 = [v12 deviceIdentifiers];
    id v22 = [v21 count];

    if (v22)
    {
      v23 = [v12 deviceIdentifiers];
      v24 = [v23 firstObject];
      v25 = +[NSPredicate predicateWithFormat:@"deviceIdentifier = %@", v24];
      [v14 addObject:v25];
    }
    v26 = +[NSCompoundPredicate andPredicateWithSubpredicates:v14];
    v27 = [v4 storage];
    v28 = [v27 managedObjectContextFor:NSFileProtectionCompleteUntilFirstUserAuthentication identifier:@"com.apple.coreduet.datamigrator"];
    LOBYTE(v33) = 1;
    id v29 = +[_DKCoreDataStorage deleteObjectsInContext:v28 entityName:@"Histogram" predicate:v26 sortDescriptors:0 fetchLimit:0x7FFFFFFFFFFFFFFFLL includeSubentities:1 includePendingChanges:v33];

    v30 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = +[NSNumber numberWithUnsignedInteger:v29];
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Removed %@ stale PairedDeviceForecast histograms.", (uint8_t *)&state, 0xCu);
    }
    id v8 = v34;
  }

  return v13 != 0;
}

@end