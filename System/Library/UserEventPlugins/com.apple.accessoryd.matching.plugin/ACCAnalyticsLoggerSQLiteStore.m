@interface ACCAnalyticsLoggerSQLiteStore
+ (ACCAnalyticsLoggerSQLiteStore)storeWithPath:(id)a3 schema:(id)a4;
- (BOOL)tryToOpenDatabase;
- (NSArray)allEvents;
- (NSDate)uploadDate;
- (id)summaryCounts;
- (int64_t)successCount;
- (int64_t)wrapFailureCount;
- (void)addEventDict:(id)a3 toTable:(id)a4;
- (void)clearAllData;
- (void)dealloc;
- (void)incrementSuccessCount;
- (void)incrementWrapFailureCount;
- (void)setUploadDate:(id)a3;
@end

@implementation ACCAnalyticsLoggerSQLiteStore

+ (ACCAnalyticsLoggerSQLiteStore)storeWithPath:(id)a3 schema:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_class();
  objc_sync_enter(v8);
  if (storeWithPath_schema__onceToken != -1) {
    dispatch_once(&storeWithPath_schema__onceToken, &__block_literal_global_322);
  }
  v9 = [v6 stringByStandardizingPath];
  id v10 = [(id)storeWithPath_schema__loggingStores objectForKeyedSubscript:v9];
  if (!v10)
  {
    id v10 = [objc_alloc((Class)a1) initWithPath:v9 schema:v7];
    [(id)storeWithPath_schema__loggingStores setObject:v10 forKeyedSubscript:v9];
  }

  objc_sync_exit(v8);

  return (ACCAnalyticsLoggerSQLiteStore *)v10;
}

void __54__ACCAnalyticsLoggerSQLiteStore_storeWithPath_schema___block_invoke(id a1)
{
  storeWithPath_schema__loggingStores = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);

  _objc_release_x1();
}

- (void)dealloc
{
  [(ACCSQLite *)self close];
  v3.receiver = self;
  v3.super_class = (Class)ACCAnalyticsLoggerSQLiteStore;
  [(ACCSQLite *)&v3 dealloc];
}

- (BOOL)tryToOpenDatabase
{
  if ([(ACCSQLite *)self isOpen]) {
    return 1;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] ACCEventLogger: db is closed, attempting to open", buf, 2u);
  }
  id v6 = 0;
  BOOL v3 = [(ACCSQLite *)self openWithError:&v6];
  id v4 = v6;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] ACCEventLogger: failed to open db with error %@", buf, 0xCu);
  }

  return v3;
}

- (int64_t)successCount
{
  if (![(ACCAnalyticsLoggerSQLiteStore *)self tryToOpenDatabase]) {
    return 0;
  }
  v11 = @"success_count";
  BOOL v3 = +[NSArray arrayWithObjects:&v11 count:1];
  id v10 = @"accessoryDatabaseCounts";
  id v4 = +[NSArray arrayWithObjects:&v10 count:1];
  v5 = [(ACCSQLite *)self select:v3 from:@"success_count" where:@"event_type = ?" bindings:v4];
  id v6 = [v5 firstObject];
  id v7 = [v6 valueForKey:@"success_count"];
  id v8 = [v7 integerValue];

  return (int64_t)v8;
}

- (int64_t)wrapFailureCount
{
  if (![(ACCAnalyticsLoggerSQLiteStore *)self tryToOpenDatabase]) {
    return 0;
  }
  v11 = @"wrap_failure_count";
  BOOL v3 = +[NSArray arrayWithObjects:&v11 count:1];
  id v10 = @"accessoryDatabaseCounts";
  id v4 = +[NSArray arrayWithObjects:&v10 count:1];
  v5 = [(ACCSQLite *)self select:v3 from:@"success_count" where:@"event_type = ?" bindings:v4];
  id v6 = [v5 firstObject];
  id v7 = [v6 valueForKey:@"wrap_failure_count"];
  id v8 = [v7 integerValue];

  return (int64_t)v8;
}

- (void)incrementSuccessCount
{
  if ([(ACCAnalyticsLoggerSQLiteStore *)self tryToOpenDatabase])
  {
    int64_t v3 = [(ACCAnalyticsLoggerSQLiteStore *)self successCount];
    int64_t v4 = [(ACCAnalyticsLoggerSQLiteStore *)self wrapFailureCount];
    v9[0] = @"accessoryDatabaseCounts";
    v8[0] = @"event_type";
    v8[1] = @"success_count";
    v5 = +[NSNumber numberWithInteger:v3 + 1];
    v9[1] = v5;
    v8[2] = @"wrap_failure_count";
    id v6 = +[NSNumber numberWithInteger:v4];
    v9[2] = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
    [(ACCSQLite *)self insertOrReplaceInto:@"success_count" values:v7];
  }
}

- (void)incrementWrapFailureCount
{
  if ([(ACCAnalyticsLoggerSQLiteStore *)self tryToOpenDatabase])
  {
    int64_t v3 = [(ACCAnalyticsLoggerSQLiteStore *)self successCount];
    int64_t v4 = [(ACCAnalyticsLoggerSQLiteStore *)self wrapFailureCount];
    v9[0] = @"accessoryDatabaseCounts";
    v8[0] = @"event_type";
    v8[1] = @"success_count";
    v5 = +[NSNumber numberWithInteger:v3];
    v9[1] = v5;
    v8[2] = @"wrap_failure_count";
    id v6 = +[NSNumber numberWithInteger:v4 + 1];
    v9[2] = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
    [(ACCSQLite *)self insertOrReplaceInto:@"success_count" values:v7];
  }
}

- (id)summaryCounts
{
  if ([(ACCAnalyticsLoggerSQLiteStore *)self tryToOpenDatabase])
  {
    id v14 = +[NSMutableDictionary dictionary];
    [(ACCSQLite *)self selectAllFrom:@"success_count" where:0 bindings:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v16;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v16 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v8 = [v7 objectForKeyedSubscript:@"event_type"];
          if (v8)
          {
            v21[0] = @"success_count";
            v9 = [v7 objectForKeyedSubscript:@"success_count"];
            v21[1] = @"wrap_failure_count";
            v22[0] = v9;
            id v10 = [v7 objectForKeyedSubscript:@"wrap_failure_count"];
            v22[1] = v10;
            v11 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
            [v14 setObject:v11 forKeyedSubscript:v8];
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] ACCEventLogger: ignoring entry in success counts table without an event name", buf, 2u);
          }
        }
        id v4 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v4);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v14;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] successCountsDict: %@", buf, 0xCu);
    }
  }
  else
  {
    id v14 = (id)objc_opt_new();
  }

  return v14;
}

- (NSArray)allEvents
{
  if ([(ACCAnalyticsLoggerSQLiteStore *)self tryToOpenDatabase])
  {
    v19 = @"data";
    id v3 = +[NSArray arrayWithObjects:&v19 count:1];
    id v4 = [(ACCSQLite *)self select:v3 from:@"all_events"];

    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "objectForKeyedSubscript:", @"data", (void)v14);
          v12 = +[NSPropertyListSerialization propertyListWithData:v11 options:0 format:0 error:0];

          [v5 addObject:v12];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = (id)objc_opt_new();
  }

  return (NSArray *)v5;
}

- (void)addEventDict:(id)a3 toTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ACCAnalyticsLoggerSQLiteStore *)self tryToOpenDatabase])
  {
    id v13 = 0;
    id v8 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:&v13];
    id v9 = v13;
    id v10 = v9;
    if (v9 || !v8)
    {
      if (v9 && !v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v15 = v10;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Couldn't serialize failure record: %@", buf, 0xCu);
      }
    }
    else
    {
      v16[0] = @"timestamp";
      v11 = +[NSDate date];
      v16[1] = @"data";
      v17[0] = v11;
      v17[1] = v8;
      v12 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      [(ACCSQLite *)self insertOrReplaceInto:v7 values:v12];
    }
  }
}

- (NSDate)uploadDate
{
  if ([(ACCAnalyticsLoggerSQLiteStore *)self tryToOpenDatabase])
  {
    id v3 = [(ACCSQLite *)self datePropertyForKey:@"upload_date"];
  }
  else
  {
    id v3 = 0;
  }

  return (NSDate *)v3;
}

- (void)setUploadDate:(id)a3
{
  id v4 = a3;
  if ([(ACCAnalyticsLoggerSQLiteStore *)self tryToOpenDatabase]) {
    [(ACCSQLite *)self setDateProperty:v4 forKey:@"upload_date"];
  }
}

- (void)clearAllData
{
  if ([(ACCAnalyticsLoggerSQLiteStore *)self tryToOpenDatabase])
  {
    [(ACCSQLite *)self deleteFrom:@"success_count" where:@"event_type like ?" bindings:&off_5A768];
    [(ACCSQLite *)self deleteFrom:@"all_events" where:@"id >= 0" bindings:0];
  }
}

@end