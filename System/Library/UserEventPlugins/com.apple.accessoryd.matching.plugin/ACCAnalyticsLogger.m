@interface ACCAnalyticsLogger
+ (id)databasePathForUser:(int)a3;
+ (id)loggerForUser:(int)a3;
+ (int64_t)fuzzyDaysSinceDate:(id)a3;
+ (void)addBuiltInFieldsToEvent:(id)a3;
- (BOOL)_onQueuePostJSON:(id)a3 error:(id *)a4 httpStatusCode:(int64_t *)a5;
- (BOOL)allowsInsecureFigaroCert;
- (BOOL)forceUploadWithError:(id *)a3 httpStatusCode:(int64_t *)a4;
- (BOOL)ignoreServerDisablingMessages;
- (NSLock)eventCacheLock;
- (NSMutableArray)accessorydEventsBeforeFirstUnlock;
- (NSMutableArray)pluginEventsBeforeFirstUnlock;
- (NSString)figaroTopicName;
- (NSURL)figaroBagURL;
- (NSURL)figaroUploadURL;
- (OS_dispatch_queue)loggingQueue;
- (id)datePropertyForKey:(id)a3;
- (id)eventDictForEventName:(id)a3 withAttributes:(id)a4;
- (id)eventDictWithBlacklistedFieldsStrippedFrom:(id)a3;
- (id)getLoggingJSON:(BOOL)a3 error:(id *)a4;
- (id)initForUser:(int)a3;
- (int)user;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)_logEventNamed:(id)a3 withAttributes:(id)a4;
- (void)logEventNamed:(id)a3 withAttributes:(id)a4;
- (void)resetUploadDateAndClearDBEntries:(BOOL)a3 dueToError:(BOOL)a4;
- (void)setAccessorydEventsBeforeFirstUnlock:(id)a3;
- (void)setAllowsInsecureFigaroCert:(BOOL)a3;
- (void)setDateProperty:(id)a3 forKey:(id)a4;
- (void)setEventCacheLock:(id)a3;
- (void)setIgnoreServerDisablingMessages:(BOOL)a3;
- (void)setLoggingQueue:(id)a3;
- (void)setPluginEventsBeforeFirstUnlock:(id)a3;
- (void)setUser:(int)a3;
@end

@implementation ACCAnalyticsLogger

+ (id)loggerForUser:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((id)objc_opt_class() == a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] attempt to instatiate abstract class ACCEventLogger", v8, 2u);
    }
    id v6 = 0;
  }
  else
  {
    id v5 = a1;
    objc_sync_enter(v5);
    objc_getAssociatedObject(v5, "ACCAnalyticsLoggerInstance");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      id v6 = [objc_alloc((Class)v5) initForUser:v3];
      objc_setAssociatedObject(v5, "ACCAnalyticsLoggerInstance", v6, &stru_2E8.segname[9]);
    }
    objc_sync_exit(v5);
  }

  return v6;
}

+ (id)databasePathForUser:(int)a3
{
  if (a3) {
    return @"/var/mobile/Library/CoreAccessories/Analytics/acc_analytics_accessoryd_v3.db";
  }
  else {
    return @"/var/mobile/Library/CoreAccessories/Analytics/acc_analytics_UserEventAgent_v3.db";
  }
}

+ (int64_t)fuzzyDaysSinceDate:(id)a3
{
  id v3 = a3;
  v4 = +[NSDate date];
  [v4 timeIntervalSinceDate:v3];
  double v6 = v5;

  if (v6 < 86400.0) {
    return 0;
  }
  if (v6 < 604800.0) {
    return 1;
  }
  if (v6 < 2592000.0) {
    return 7;
  }
  if (v6 >= 31536000.0) {
    return 365;
  }
  return 30;
}

- (id)initForUser:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v50.receiver = self;
  v50.super_class = (Class)ACCAnalyticsLogger;
  v4 = [(ACCAnalyticsLogger *)&v50 init];
  double v5 = v4;
  if (v4)
  {
    v4->_user = v3;
    uint64_t v6 = +[NSMutableArray array];
    pluginEventsBeforeFirstUnlock = v5->_pluginEventsBeforeFirstUnlock;
    v5->_pluginEventsBeforeFirstUnlock = (NSMutableArray *)v6;

    uint64_t v8 = +[NSMutableArray array];
    accessorydEventsBeforeFirstUnlock = v5->_accessorydEventsBeforeFirstUnlock;
    v5->_accessorydEventsBeforeFirstUnlock = (NSMutableArray *)v8;

    v10 = (NSLock *)objc_alloc_init((Class)NSLock);
    eventCacheLock = v5->_eventCacheLock;
    v5->_eventCacheLock = v10;

    v12 = +[ACCAnalyticsLogger databasePathForUser:v3];
    uint64_t v13 = +[ACCAnalyticsLoggerSQLiteStore storeWithPath:v12 schema:@"CREATE TABLE IF NOT EXISTS all_events (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,data BLOB\n)\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_all_events AFTER INSERT ON all_events\nBEGIN\nDELETE FROM all_events WHERE id != NEW.id AND id % 999 = NEW.id % 999;\nEND;\nCREATE TABLE IF NOT EXISTS success_count (\nevent_type STRING PRIMARY KEY,\nsuccess_count INTEGER,\nwrap_failure_count INTEGER\n);\n"];;
    database = v5->_database;
    v5->_database = (ACCAnalyticsLoggerSQLiteStore *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.accessoryd.eventLogging", v15);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.accessoryd.eventLoggingQueue", 0);
    loggingQueue = v5->_loggingQueue;
    v5->_loggingQueue = (OS_dispatch_queue *)v18;

    int isInternalBuild = systemInfo_isInternalBuild();
    uint64_t v21 = 259200;
    if (isInternalBuild) {
      uint64_t v21 = 86400;
    }
    v5->_secondsBetweenUploads = v21;
    v5->_secondsBetweenUploadError = 3600;
    v22 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/CoreAccessories.framework"];
    v23 = [v22 pathForResource:@"ACCAnalyticsLogging" ofType:@"plist"];
    v24 = +[NSDictionary dictionaryWithContentsOfFile:v23];

    uint64_t v25 = [v24 objectForKeyedSubscript:@"figaro_topic"];
    figaroTopicName = v5->_figaroTopicName;
    v5->_figaroTopicName = (NSString *)v25;

    v27 = [v24 objectForKeyedSubscript:@"figaro_uploadURL"];
    uint64_t v28 = +[NSURL URLWithString:v27];
    p_figaroUploadURL = (void **)&v5->_figaroUploadURL;
    figaroUploadURL = v5->_figaroUploadURL;
    v5->_figaroUploadURL = (NSURL *)v28;

    v31 = [v24 objectForKeyedSubscript:@"figaro_bagURL"];
    uint64_t v32 = +[NSURL URLWithString:v31];
    figaroBagURL = v5->_figaroBagURL;
    v5->_figaroBagURL = (NSURL *)v32;

    v34 = [v24 valueForKey:@"figaro_allowInsecureCertificate"];
    *((unsigned char *)v5 + 88) = *((unsigned char *)v5 + 88) & 0xFE | [v34 BOOLValue];

    v35 = [v24 objectForKeyedSubscript:@"figaro_endpointDomain"];
    id v36 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.accessory.eventLogging"];
    v37 = [v36 stringForKey:@"figaro_topic"];
    if (v37) {
      objc_storeStrong((id *)&v5->_figaroTopicName, v37);
    }
    v49 = v37;
    v38 = [v36 stringForKey:@"figaro_uploadURL"];
    v39 = +[NSURL URLWithString:v38];

    if (v39) {
      objc_storeStrong((id *)&v5->_figaroUploadURL, v39);
    }
    v40 = [v36 stringForKey:@"figaro_bagURL"];
    v41 = +[NSURL URLWithString:v40];

    if (v41) {
      objc_storeStrong((id *)&v5->_figaroBagURL, v41);
    }
    *((unsigned char *)v5 + 88) |= [v36 BOOLForKey:@"figaro_allowInsecureCertificate"];
    v42 = [v36 stringForKey:@"figaro_endpointDomain"];
    v43 = v42;
    if (v42)
    {
      v44 = v42;

      v35 = v44;
    }
    if (systemInfo_isInternalBuild())
    {

      *((unsigned char *)v5 + 88) |= 8u;
      v35 = @"xp-qa.apple.com";
      if (!v5->_figaroUploadURL)
      {
        v45 = +[NSString stringWithFormat:@"https://%@/report/2/%@", @"xp-qa.apple.com", v5->_figaroTopicName];
        uint64_t v46 = +[NSURL URLWithString:v45];
        v47 = *p_figaroUploadURL;
        *p_figaroUploadURL = (void *)v46;
      }
    }
  }
  return v5;
}

- (void)logEventNamed:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_67;
    }
    *(_WORD *)buf = 0;
    uint64_t v25 = "[#ACCEventLogger] attempt to log an event with no name";
LABEL_33:
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
    goto LABEL_67;
  }
  if (!v7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_67;
    }
    *(_WORD *)buf = 0;
    uint64_t v25 = "[#ACCEventLogger] attempt to log an event with no attributes";
    goto LABEL_33;
  }
  if (_isDeviceAnalyticsEnabled_onceToken != -1) {
    dispatch_once(&_isDeviceAnalyticsEnabled_onceToken, &__block_literal_global_360);
  }
  if (_isDeviceAnalyticsEnabled_dataCollectionEnabled)
  {
    v9 = +[NSMutableDictionary dictionaryWithDictionary:v8];
    +[ACCAnalyticsLogger addBuiltInFieldsToEvent:v9];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v80 = v6;
      __int16 v81 = 2112;
      v82 = v9;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Figaro event: %@\neventDict: %@", buf, 0x16u);
    }
    int v10 = MKBDeviceUnlockedSinceBoot();
    v11 = [(ACCAnalyticsLogger *)self eventCacheLock];
    [v11 lock];

    unsigned int v12 = [(ACCAnalyticsLogger *)self user];
    if (v10)
    {
      if (v12)
      {
        if ([(ACCAnalyticsLogger *)self user] != 1) {
          goto LABEL_59;
        }
        uint64_t v13 = [(ACCAnalyticsLogger *)self accessorydEventsBeforeFirstUnlock];
        id v14 = [v13 count];

        if (!v14) {
          goto LABEL_59;
        }
        v48 = v9;
        v49 = v8;
        id v50 = v6;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id obj = [(ACCAnalyticsLogger *)self accessorydEventsBeforeFirstUnlock];
        id v55 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
        if (v55)
        {
          uint64_t v53 = *(void *)v64;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v64 != v53) {
                objc_enumerationMutation(obj);
              }
              uint64_t v57 = v15;
              dispatch_queue_t v16 = *(void **)(*((void *)&v63 + 1) + 8 * v15);
              long long v59 = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              id v17 = v16;
              id v18 = [v17 countByEnumeratingWithState:&v59 objects:v75 count:16];
              if (v18)
              {
                id v19 = v18;
                uint64_t v20 = *(void *)v60;
                do
                {
                  for (i = 0; i != v19; i = (char *)i + 1)
                  {
                    if (*(void *)v60 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    v22 = *(void **)(*((void *)&v59 + 1) + 8 * i);
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v80 = v22;
                      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] send event: %@ to sql db", buf, 0xCu);
                    }
                    v23 = [v17 objectForKey:v22];
                    [(ACCAnalyticsLogger *)self _logEventNamed:v22 withAttributes:v23];
                  }
                  id v19 = [v17 countByEnumeratingWithState:&v59 objects:v75 count:16];
                }
                while (v19);
              }

              uint64_t v15 = v57 + 1;
            }
            while ((id)(v57 + 1) != v55);
            id v55 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
          }
          while (v55);
        }

        v24 = [(ACCAnalyticsLogger *)self accessorydEventsBeforeFirstUnlock];
      }
      else
      {
        v31 = [(ACCAnalyticsLogger *)self pluginEventsBeforeFirstUnlock];
        id v32 = [v31 count];

        if (!v32)
        {
LABEL_59:
          v43 = [(ACCAnalyticsLogger *)self eventCacheLock];
          [v43 unlock];

          [(ACCAnalyticsLogger *)self _logEventNamed:v6 withAttributes:v9];
LABEL_66:

          goto LABEL_67;
        }
        v48 = v9;
        v49 = v8;
        id v50 = v6;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id obja = [(ACCAnalyticsLogger *)self pluginEventsBeforeFirstUnlock];
        id v56 = [obja countByEnumeratingWithState:&v71 objects:v78 count:16];
        if (v56)
        {
          uint64_t v54 = *(void *)v72;
          do
          {
            uint64_t v33 = 0;
            do
            {
              if (*(void *)v72 != v54) {
                objc_enumerationMutation(obja);
              }
              uint64_t v58 = v33;
              v34 = *(void **)(*((void *)&v71 + 1) + 8 * v33);
              long long v67 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              long long v70 = 0u;
              id v35 = v34;
              id v36 = [v35 countByEnumeratingWithState:&v67 objects:v77 count:16];
              if (v36)
              {
                id v37 = v36;
                uint64_t v38 = *(void *)v68;
                do
                {
                  for (j = 0; j != v37; j = (char *)j + 1)
                  {
                    if (*(void *)v68 != v38) {
                      objc_enumerationMutation(v35);
                    }
                    v40 = *(void **)(*((void *)&v67 + 1) + 8 * (void)j);
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v80 = v40;
                      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] send event: %@ to sql db", buf, 0xCu);
                    }
                    v41 = [v35 objectForKey:v40];
                    [(ACCAnalyticsLogger *)self _logEventNamed:v40 withAttributes:v41];
                  }
                  id v37 = [v35 countByEnumeratingWithState:&v67 objects:v77 count:16];
                }
                while (v37);
              }

              uint64_t v33 = v58 + 1;
            }
            while ((id)(v58 + 1) != v56);
            id v56 = [obja countByEnumeratingWithState:&v71 objects:v78 count:16];
          }
          while (v56);
        }

        v24 = [(ACCAnalyticsLogger *)self pluginEventsBeforeFirstUnlock];
      }
      v42 = v24;
      [v24 removeAllObjects];

      uint64_t v8 = v49;
      id v6 = v50;
      v9 = v48;
      goto LABEL_59;
    }
    if (v12)
    {
      if ([(ACCAnalyticsLogger *)self user] != 1) {
        goto LABEL_65;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v80 = v6;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Adding event: %@ to accessoryd array", buf, 0xCu);
      }
      v26 = [(ACCAnalyticsLogger *)self accessorydEventsBeforeFirstUnlock];
      v27 = +[NSDictionary dictionaryWithObject:v9 forKey:v6];
      [v26 addObject:v27];

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_65;
      }
      uint64_t v28 = [(ACCAnalyticsLogger *)self accessorydEventsBeforeFirstUnlock];
      id v29 = [v28 count];
      *(_DWORD *)buf = 134217984;
      id v80 = v29;
      v30 = "[#ACCEventLogger] accessorydEventsBeforeFirstUnlock count: %lu";
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v80 = v6;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Adding event: %@ to plugin array", buf, 0xCu);
      }
      v44 = [(ACCAnalyticsLogger *)self pluginEventsBeforeFirstUnlock];
      v45 = +[NSDictionary dictionaryWithObject:v9 forKey:v6];
      [v44 addObject:v45];

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_65;
      }
      uint64_t v28 = [(ACCAnalyticsLogger *)self pluginEventsBeforeFirstUnlock];
      id v46 = [v28 count];
      *(_DWORD *)buf = 134217984;
      id v80 = v46;
      v30 = "[#ACCEventLogger] pluginEventsBeforeFirstUnlock count: %lu";
    }
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);

LABEL_65:
    v47 = [(ACCAnalyticsLogger *)self eventCacheLock];
    [v47 unlock];

    goto LABEL_66;
  }
LABEL_67:
}

- (void)_logEventNamed:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v8 = [(ACCAnalyticsLogger *)self loggingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke;
  block[3] = &unk_51128;
  objc_copyWeak(&v15, &location);
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke(uint64_t a1)
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = +[NSDictionary dictionaryWithDictionary:*(void *)(a1 + 32)];
  v4 = *(NSObject **)(*(void *)(a1 + 40) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_107;
  block[3] = &unk_51100;
  void block[4] = WeakRetained;
  id v14 = *(id *)(a1 + 48);
  id v5 = v3;
  id v15 = v5;
  dispatch_queue_t v16 = &v17;
  dispatch_sync(v4, block);
  id v6 = +[NSDate date];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v7 = (void *)v18[5];
    *(_DWORD *)buf = 138412290;
    id v24 = v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[#ACCEventLogger] ACCEventLogging: figaroDate %@", buf, 0xCu);
  }
  if (!v18[5])
  {
    [WeakRetained resetUploadDateAndClearDBEntries:0 dueToError:1];
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "compare:") == (char *)&dword_0 + 1)
  {
    id v11 = 0;
    uint64_t v12 = 0;
    unsigned int v8 = [WeakRetained forceUploadWithError:&v11 httpStatusCode:&v12];
    id v9 = v11;
    if ((v8 & 1) == 0)
    {
      if ((unint64_t)(v12 - 400) > 0x63)
      {
        uint64_t v10 = 0;
LABEL_12:
        [WeakRetained resetUploadDateAndClearDBEntries:v10 dueToError:v8 ^ 1];
        if (v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v9;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] ACCEventLogging: failed with error: %@", buf, 0xCu);
        }

        goto LABEL_16;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_cold_1(&v12);
      }
    }
    uint64_t v10 = 1;
    goto LABEL_12;
  }
LABEL_16:

  _Block_object_dispose(&v17, 8);
}

void __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_107(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1
    && (*(unsigned char *)(v1 + 88) & 2) == 0
    && ([*(id *)(v1 + 80) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) eventDictForEventName:*(void *)(a1 + 40) withAttributes:*(void *)(a1 + 48)];
    v4 = [*(id *)(a1 + 32) eventDictWithBlacklistedFieldsStrippedFrom:v3];
    id v5 = [*(id *)(*(void *)(a1 + 32) + 8) allEvents];
    id v6 = (char *)[v5 count];

    [*(id *)(*(void *)(a1 + 32) + 8) addEventDict:v4 toTable:@"all_events"];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 8) allEvents];
    unsigned int v8 = (char *)[v7 count];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = v8;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] database entry count: %lu", (uint8_t *)&v12, 0xCu);
    }
    if ((unint64_t)v8 > 0x3E7 || v6 == &stru_3D8.sectname[15])
    {
      if ((v6 != &stru_3D8.sectname[15] || v8 != &stru_3D8.sectname[15])
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_107_cold_1((uint64_t)v8);
      }
      [*(id *)(*(void *)(a1 + 32) + 8) incrementWrapFailureCount];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 8) incrementSuccessCount];
    }
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) uploadDate];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (void)resetUploadDateAndClearDBEntries:(BOOL)a3 dueToError:(BOOL)a4
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __66__ACCAnalyticsLogger_resetUploadDateAndClearDBEntries_dueToError___block_invoke;
  block[3] = &unk_51150;
  objc_copyWeak(&v9, &location);
  BOOL v10 = a3;
  BOOL v11 = a4;
  dispatch_sync(queue, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __66__ACCAnalyticsLogger_resetUploadDateAndClearDBEntries_dueToError___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 40)) {
      [WeakRetained[1] clearAllData];
    }
    if (!*(unsigned char *)(a1 + 41))
    {
      id v5 = +[NSDate dateWithTimeIntervalSinceNow:(double)(uint64_t)v3[6]];
      [v3[1] setUploadDate:v5];
      goto LABEL_8;
    }
    v4 = +[NSDate dateWithTimeIntervalSinceNow:(double)(uint64_t)v3[7]];
    [v3[1] setUploadDate:v4];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3[1] uploadDate];
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] ACCEventLogging: next analytic sync event: %@", (uint8_t *)&v6, 0xCu);
LABEL_8:
    }
  }
}

- (id)eventDictForEventName:(id)a3 withAttributes:(id)a4
{
  if (a4)
  {
    id v7 = a3;
    id v8 = [a4 mutableCopy];
  }
  else
  {
    id v9 = a3;
    id v8 = +[NSMutableDictionary dictionary];
  }
  BOOL v10 = v8;
  [v8 setObject:self->_figaroTopicName forKeyedSubscript:@"topic"];
  [v10 setObject:a3 forKeyedSubscript:@"eventType"];

  BOOL v11 = +[NSDate date];
  [v11 timeIntervalSince1970];
  uint64_t v13 = +[NSNumber numberWithDouble:v12 * 1000.0];
  [v10 setObject:v13 forKeyedSubscript:@"eventTime"];

  metricsBase = self->_metricsBase;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __59__ACCAnalyticsLogger_eventDictForEventName_withAttributes___block_invoke;
  v17[3] = &unk_51178;
  id v15 = v10;
  id v18 = v15;
  [(NSDictionary *)metricsBase enumerateKeysAndObjectsUsingBlock:v17];

  return v15;
}

void __59__ACCAnalyticsLogger_eventDictForEventName_withAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  int v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

- (id)eventDictWithBlacklistedFieldsStrippedFrom:(id)a3
{
  id v4 = [a3 mutableCopy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_blacklistedFields;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "removeObjectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45__ACCAnalyticsLogger_setDateProperty_forKey___block_invoke;
  block[3] = &unk_511A0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

id __45__ACCAnalyticsLogger_setDateProperty_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) setDateProperty:a1[5] forKey:a1[6]];
}

- (id)datePropertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  dispatch_queue_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __41__ACCAnalyticsLogger_datePropertyForKey___block_invoke;
  block[3] = &unk_511C8;
  id v10 = v4;
  long long v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __41__ACCAnalyticsLogger_datePropertyForKey___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) datePropertyForKey:a1[5]];

  return _objc_release_x1();
}

- (NSURL)figaroUploadURL
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  figaroUploadURL = self->_figaroUploadURL;
  if (figaroUploadURL)
  {
    id v4 = figaroUploadURL;
  }
  else
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy_;
    v27[4] = __Block_byref_object_dispose_;
    id v28 = 0;
    id v6 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    v30 = @"User-Agent";
    id v7 = +[NSString stringWithFormat:@"accessoryd/%s", "1.1"];
    v31 = v7;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    [v6 setHTTPAdditionalHeaders:v8];

    id v9 = +[NSURLSession sessionWithConfiguration:v6 delegate:self delegateQueue:0];
    id v10 = self->_figaroBagURL;
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy_;
    uint64_t v25 = __Block_byref_object_dispose_;
    id v26 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __37__ACCAnalyticsLogger_figaroUploadURL__block_invoke;
    v15[3] = &unk_511F0;
    objc_copyWeak(&v20, &location);
    id v18 = v27;
    long long v11 = v5;
    dispatch_queue_t v16 = v11;
    uint64_t v19 = &v21;
    id v12 = v9;
    id v17 = v12;
    id v13 = [v12 dataTaskWithURL:v10 completionHandler:v15];
    [v13 resume];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    id v4 = (NSURL *)(id)v22[5];

    objc_destroyWeak(&v20);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(v27, 8);
    objc_destroyWeak(&location);
  }

  return v4;
}

void __37__ACCAnalyticsLogger_figaroUploadURL__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained) {
    goto LABEL_35;
  }
  if (!v6 || v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v9 + 40);
  id v10 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
LABEL_26:

LABEL_27:
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_34:
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
        [*(id *)(a1 + 40) invalidateAndCancel];
        goto LABEL_35;
      }
      *(_WORD *)buf = 0;
      id v28 = "[#ACCEventLogger] Unable to fetch figaro endpoint";
    }
    else
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
        || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      id v28 = "[#ACCEventLogger] Malformed config payload!";
    }
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
    goto LABEL_34;
  }
  if ((WeakRetained[11] & 8) != 0)
  {
LABEL_19:
    uint64_t v21 = [v10 objectForKeyedSubscript:@"metricsBase"];
    id v22 = (void *)WeakRetained[8];
    WeakRetained[8] = v21;

    uint64_t v23 = [v10 objectForKeyedSubscript:@"metricsUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = [v23 stringByAppendingFormat:@"/2/%@", WeakRetained[3]];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v24;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] got metrics endpoint: %@", buf, 0xCu);
      }
      uint64_t v25 = +[NSURL URLWithString:v24];
      id v26 = [v25 scheme];
      unsigned int v27 = [v26 isEqualToString:@"https"];

      if (v27) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v25);
      }
    }
    goto LABEL_26;
  }
  long long v11 = [v10 valueForKey:@"disabled"];
  if ([v11 BOOLValue]) {
    char v12 = 2;
  }
  else {
    char v12 = 0;
  }
  *((unsigned char *)WeakRetained + 88) = WeakRetained[11] & 0xFD | v12;

  if ((WeakRetained[11] & 2) == 0)
  {
    id v13 = [v10 valueForKey:@"sendDisabled"];
    unsigned int v14 = [v13 BOOLValue];

    if (!v14)
    {
      id v15 = [v10 valueForKey:@"postFrequency"];
      unint64_t v16 = (unint64_t)[v15 unsignedIntegerValue];

      if (v16 >= 0x3E8) {
        WeakRetained[6] = v16 / 0x3E8;
      }
      uint64_t v17 = [v10 objectForKeyedSubscript:@"blacklistedEvents"];
      id v18 = (void *)WeakRetained[10];
      WeakRetained[10] = v17;

      uint64_t v19 = [v10 objectForKeyedSubscript:@"blacklistedFields"];
      id v20 = (void *)WeakRetained[9];
      WeakRetained[9] = v19;

      goto LABEL_19;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] figaro is disabled", buf, 2u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

LABEL_35:
}

- (BOOL)forceUploadWithError:(id *)a3 httpStatusCode:(int64_t *)a4
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v7 = [(ACCAnalyticsLogger *)self getLoggingJSON:0 error:a3];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __58__ACCAnalyticsLogger_forceUploadWithError_httpStatusCode___block_invoke;
  block[3] = &unk_51218;
  id v12 = v7;
  id v13 = self;
  id v15 = &v21;
  unint64_t v16 = a3;
  unsigned int v14 = &v17;
  id v9 = v7;
  dispatch_sync(queue, block);
  *a4 = v18[3];
  LOBYTE(a4) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return (char)a4;
}

id *__58__ACCAnalyticsLogger_forceUploadWithError_httpStatusCode___block_invoke(id *result)
{
  uint64_t v1 = result;
  id v2 = result[4];
  BOOL v3 = 0;
  if (v2)
  {
    result = (id *)[result[5] _onQueuePostJSON:v2 error:result[8] httpStatusCode:*((void *)result[6] + 1) + 24];
    if (result) {
      BOOL v3 = 1;
    }
  }
  *(unsigned char *)(*((void *)v1[7] + 1) + 24) = v3;
  return result;
}

- (BOOL)_onQueuePostJSON:(id)a3 error:(id *)a4 httpStatusCode:(int64_t *)a5
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  uint64_t v33 = @"User-Agent";
  id v9 = +[NSString stringWithFormat:@"accessoryd/%s", "1.1"];
  v34 = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  [v8 setHTTPAdditionalHeaders:v10];

  long long v11 = +[NSURLSession sessionWithConfiguration:v8 delegate:self delegateQueue:0];
  id v12 = [(ACCAnalyticsLogger *)self figaroUploadURL];
  if (v12) {
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] failed to get a figaro endpoint - using bag instead", buf, 2u);
  }
  id v12 = [(ACCAnalyticsLogger *)self figaroBagURL];
  if (v12)
  {
LABEL_5:
    id v13 = objc_alloc_init((Class)NSMutableURLRequest);
    [v13 setURL:v12];
    [v13 setHTTPMethod:@"POST"];
    [v13 setHTTPBody:v7];
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    v30 = buf;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __60__ACCAnalyticsLogger__onQueuePostJSON_error_httpStatusCode___block_invoke;
    v20[3] = &unk_51240;
    uint64_t v23 = &v25;
    char v24 = buf;
    id v15 = v14;
    uint64_t v21 = v15;
    id v22 = v11;
    unint64_t v16 = [v22 dataTaskWithRequest:v13 completionHandler:v20];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Figaro start", v19, 2u);
    }
    [v16 resume];
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    *a5 = v26[3];
    BOOL v17 = v30[24] != 0;

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v17 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] failed to get a figaro endpoint", buf, 2u);
      BOOL v17 = 0;
    }
  }

  return v17;
}

void __60__ACCAnalyticsLogger__onQueuePostJSON_error_httpStatusCode___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v9;
      id v10 = "[#ACCEventLogger] Figaro event error: %@";
      uint32_t v11 = 12;
LABEL_11:
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v11);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v8;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v12 statusCode];
    if ((uint64_t)[v12 statusCode] < 200 || (uint64_t)objc_msgSend(v12, "statusCode") > 299)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 67109120;
        LODWORD(v16) = [v12 statusCode];
        id v13 = "[#ACCEventLogger] Figaro error: %d";
        uint32_t v14 = 8;
        goto LABEL_14;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        id v13 = "[#ACCEventLogger] Figaro success";
        uint32_t v14 = 2;
LABEL_14:
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, v14);
      }
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    id v10 = "[#ACCEventLogger] Received the wrong kind of class";
    uint32_t v11 = 2;
    goto LABEL_11;
  }
LABEL_16:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  [*(id *)(a1 + 40) invalidateAndCancel];
}

+ (void)addBuiltInFieldsToEvent:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (addBuiltInFieldsToEvent__onceToken != -1)
  {
    dispatch_once(&addBuiltInFieldsToEvent__onceToken, &__block_literal_global_1);
    id v3 = v4;
  }
  if (addBuiltInFieldsToEvent__build)
  {
    [v4 setObject:addBuiltInFieldsToEvent__build forKeyedSubscript:@"build"];
    id v3 = v4;
  }
  if (addBuiltInFieldsToEvent__productVersion)
  {
    [v4 setObject:addBuiltInFieldsToEvent__productVersion forKeyedSubscript:@"productVersion"];
    id v3 = v4;
  }
  if (addBuiltInFieldsToEvent__modelNumberStr)
  {
    [v4 setObject:addBuiltInFieldsToEvent__modelNumberStr forKeyedSubscript:@"modelString"];
    id v3 = v4;
  }
  if (addBuiltInFieldsToEvent__platform)
  {
    [v4 setObject:addBuiltInFieldsToEvent__platform forKeyedSubscript:@"platform"];
    id v3 = v4;
  }
  if (addBuiltInFieldsToEvent__productType)
  {
    [v4 setObject:addBuiltInFieldsToEvent__productType forKeyedSubscript:@"productType"];
    id v3 = v4;
  }
}

void __46__ACCAnalyticsLogger_addBuiltInFieldsToEvent___block_invoke(id a1)
{
  uint64_t v1 = (void *)_CFCopySystemVersionDictionary();
  if (v1)
  {
    id v14 = v1;
    uint64_t v2 = [v1 objectForKeyedSubscript:_kCFSystemVersionBuildVersionKey];
    id v3 = (void *)addBuiltInFieldsToEvent__build;
    addBuiltInFieldsToEvent__build = v2;

    uint64_t v4 = [v14 objectForKeyedSubscript:_kCFSystemVersionProductVersionKey];
    dispatch_semaphore_t v5 = (void *)addBuiltInFieldsToEvent__productVersion;
    addBuiltInFieldsToEvent__productVersion = v4;

    uint64_t v6 = MGCopyAnswer();
    id v7 = (void *)addBuiltInFieldsToEvent__modelNumberStr;
    addBuiltInFieldsToEvent__modelNumberStr = v6;

    uint64_t v8 = MGCopyAnswer();
    id v9 = (void *)addBuiltInFieldsToEvent__platform;
    addBuiltInFieldsToEvent__platform = v8;

    uint64_t v10 = MGCopyAnswer();
    uint32_t v11 = (void *)addBuiltInFieldsToEvent__productVersion;
    addBuiltInFieldsToEvent__productVersion = v10;

    uint64_t v12 = MGCopyAnswer();
    id v13 = (void *)addBuiltInFieldsToEvent__productType;
    addBuiltInFieldsToEvent__productType = v12;

    uint64_t v1 = v14;
  }
}

- (id)getLoggingJSON:(BOOL)a3 error:(id *)a4
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy_;
  id v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __43__ACCAnalyticsLogger_getLoggingJSON_error___block_invoke;
  v7[3] = &unk_51288;
  v7[5] = &v9;
  v7[6] = a4;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_sync(queue, v7);
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __43__ACCAnalyticsLogger_getLoggingJSON_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) tryToOpenDatabase])
  {
    v30 = [*(id *)(*(void *)(a1 + 32) + 8) allEvents];
    uint64_t v28 = +[NSDate date];
    uint64_t v29 = a1;
    [*(id *)(*(void *)(a1 + 32) + 8) summaryCounts];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v27 = v34 = 0u;
    uint64_t v2 = [v27 objectEnumerator];
    id v3 = [v2 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v32;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v32 != v7) {
            objc_enumerationMutation(v2);
          }
          uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v10 = [v9 objectForKeyedSubscript:@"success_count"];
          v5 += (uint64_t)[v10 integerValue];

          uint64_t v11 = [v9 objectForKeyedSubscript:@"wrap_failure_count"];
          v6 += (uint64_t)[v11 integerValue];
        }
        id v4 = [v2 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v4);
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
    }

    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    id v13 = v12;
    uint64_t v14 = *(void *)(*(void *)(v29 + 32) + 24);
    if (v14)
    {
      [v12 setObject:v14 forKeyedSubscript:@"topic"];
    }
    else
    {
      int v15 = +[NSNull null];
      [v13 setObject:v15 forKeyedSubscript:@"topic"];
    }
    [v28 timeIntervalSince1970];
    BOOL v17 = +[NSNumber numberWithDouble:v16 * 1000.0];
    [v13 setObject:v17 forKeyedSubscript:@"eventTime"];

    [v13 setObject:@"accessoryHealthSummary" forKeyedSubscript:@"eventType"];
    id v18 = +[NSNumber numberWithInteger:v5];
    [v13 setObject:v18 forKeyedSubscript:@"success_count"];

    uint64_t v19 = +[NSNumber numberWithInteger:v6];
    [v13 setObject:v19 forKeyedSubscript:@"wrap_failure_count"];

    +[ACCAnalyticsLogger addBuiltInFieldsToEvent:v13];
    id v20 = [v30 mutableCopy];
    [v20 addObject:v13];
    v36[0] = @"postTime";
    [v28 timeIntervalSince1970];
    id v22 = +[NSNumber numberWithDouble:v21 * 1000.0];
    v36[1] = @"events";
    v37[0] = v22;
    v37[1] = v20;
    uint64_t v23 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

    uint64_t v24 = +[NSJSONSerialization dataWithJSONObject:v23 options:*(unsigned __int8 *)(v29 + 56) error:*(void *)(v29 + 48)];
    uint64_t v25 = *(void *)(*(void *)(v29 + 40) + 8);
    id v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] can't get logging JSON because database is not openable", buf, 2u);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    -[ACCAnalyticsLogger URLSession:didReceiveChallenge:completionHandler:]();
  }
  uint64_t v11 = (void (**)(void, void, void))v10;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Figaro challenge", buf, 2u);
  }
  SecTrustResultType result = kSecTrustResultInvalid;
  if ((uint64_t)[v9 previousFailureCount] >= 1) {
    goto LABEL_5;
  }
  id v12 = [v9 protectionSpace];
  id v13 = [v12 authenticationMethod];
  unsigned int v14 = [v13 isEqualToString:NSURLAuthenticationMethodServerTrust];

  if (!v14)
  {
    v11[2](v11, 1, 0);
    goto LABEL_12;
  }
  int v15 = [v9 protectionSpace];
  double v16 = (__SecTrust *)[v15 serverTrust];

  SecTrustEvaluate(v16, &result);
  if (*((unsigned char *)self + 88))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Force Accepting Figaro Credential", v18, 2u);
    }
    goto LABEL_15;
  }
  if (result == kSecTrustResultProceed || result == kSecTrustResultUnspecified)
  {
LABEL_15:
    BOOL v17 = +[NSURLCredential credentialForTrust:v16];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v17);

    goto LABEL_12;
  }
LABEL_5:
  v11[2](v11, 2, 0);
LABEL_12:
}

- (BOOL)ignoreServerDisablingMessages
{
  return (*((unsigned __int8 *)self + 88) >> 3) & 1;
}

- (void)setIgnoreServerDisablingMessages:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 88) = *((unsigned char *)self + 88) & 0xF7 | v3;
}

- (BOOL)allowsInsecureFigaroCert
{
  return *((unsigned char *)self + 88) & 1;
}

- (void)setAllowsInsecureFigaroCert:(BOOL)a3
{
  *((unsigned char *)self + 88) = *((unsigned char *)self + 88) & 0xFE | a3;
}

- (NSURL)figaroBagURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)figaroTopicName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int)user
{
  return self->_user;
}

- (void)setUser:(int)a3
{
  self->_user = a3;
}

- (NSMutableArray)pluginEventsBeforeFirstUnlock
{
  return self->_pluginEventsBeforeFirstUnlock;
}

- (void)setPluginEventsBeforeFirstUnlock:(id)a3
{
}

- (NSMutableArray)accessorydEventsBeforeFirstUnlock
{
  return self->_accessorydEventsBeforeFirstUnlock;
}

- (void)setAccessorydEventsBeforeFirstUnlock:(id)a3
{
}

- (NSLock)eventCacheLock
{
  return self->_eventCacheLock;
}

- (void)setEventCacheLock:(id)a3
{
}

- (OS_dispatch_queue)loggingQueue
{
  return self->_loggingQueue;
}

- (void)setLoggingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_eventCacheLock, 0);
  objc_storeStrong((id *)&self->_accessorydEventsBeforeFirstUnlock, 0);
  objc_storeStrong((id *)&self->_pluginEventsBeforeFirstUnlock, 0);
  objc_storeStrong((id *)&self->_blacklistedEvents, 0);
  objc_storeStrong((id *)&self->_blacklistedFields, 0);
  objc_storeStrong((id *)&self->_metricsBase, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_figaroBagURL, 0);
  objc_storeStrong((id *)&self->_figaroTopicName, 0);
  objc_storeStrong((id *)&self->_figaroUploadURL, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

void __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = 134217984;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[#ACCEventLogger] ACCEventLogging: error %lu forced events to be dropped", (uint8_t *)&v2, 0xCu);
}

void __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_107_cold_1(uint64_t a1)
{
  int v1 = 134218240;
  uint64_t v2 = a1;
  __int16 v3 = 1024;
  int v4 = 999;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[#ACCEventLogger] database count: %lu greater than max count allowed (%d)", (uint8_t *)&v1, 0x12u);
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.1()
{
}

@end