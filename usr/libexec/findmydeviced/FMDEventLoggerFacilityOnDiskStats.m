@interface FMDEventLoggerFacilityOnDiskStats
+ (id)facilityName;
- (BOOL)shouldLog;
- (FMDEventLoggerFacilityOnDiskStats)init;
- (FMDataArchiver)archiver;
- (NSMutableDictionary)logs;
- (NSURL)cachedLogFileURL;
- (OS_dispatch_queue)serialQueue;
- (id)loggedEvents;
- (id)loggedEventsForEventName:(id)a3;
- (void)_logEvent:(id)a3;
- (void)loadLogs;
- (void)logEvent:(id)a3;
- (void)reset;
- (void)setArchiver:(id)a3;
- (void)setCachedLogFileURL:(id)a3;
- (void)setLogs:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation FMDEventLoggerFacilityOnDiskStats

+ (id)facilityName
{
  return @"FMDEventLoggerFacilityOnDiskStats";
}

- (FMDEventLoggerFacilityOnDiskStats)init
{
  v15.receiver = self;
  v15.super_class = (Class)FMDEventLoggerFacilityOnDiskStats;
  v2 = [(FMDEventLoggerFacilityOnDiskStats *)&v15 init];
  if (v2)
  {
    v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v4 = [v3 objectAtIndex:0];
    v5 = [v4 stringByAppendingPathComponent:@"com.apple.icloud.findmydeviced"];
    v6 = [v5 stringByAppendingPathComponent:@"com.apple.icloud.findmydeviced.eventlogger.stats"];

    v7 = +[NSURL URLWithString:v6];
    [(FMDEventLoggerFacilityOnDiskStats *)v2 setCachedLogFileURL:v7];

    id v8 = objc_alloc((Class)FMDataArchiver);
    v9 = [(FMDEventLoggerFacilityOnDiskStats *)v2 cachedLogFileURL];
    id v10 = [v8 initWithFileURL:v9];
    [(FMDEventLoggerFacilityOnDiskStats *)v2 setArchiver:v10];

    v11 = [(FMDEventLoggerFacilityOnDiskStats *)v2 archiver];
    [v11 setBackedUp:0];

    v12 = [(FMDEventLoggerFacilityOnDiskStats *)v2 archiver];
    [v12 setCreateDirectories:1];

    dispatch_queue_t v13 = dispatch_queue_create("FMDEventLoggerFacilityOnDisk.serialQueue", 0);
    [(FMDEventLoggerFacilityOnDiskStats *)v2 setSerialQueue:v13];

    [(FMDEventLoggerFacilityOnDiskStats *)v2 loadLogs];
  }
  return v2;
}

- (void)logEvent:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(FMDEventLoggerFacilityOnDiskStats *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003DBD0;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_logEvent:(id)a3
{
  id v4 = a3;
  if ([(FMDEventLoggerFacilityOnDiskStats *)self shouldLog])
  {
    v5 = [(FMDEventLoggerFacilityOnDiskStats *)self logs];
    id v6 = [v4 userInfo];
    v7 = [v4 groupByKey];
    id v8 = [v6 objectForKey:v7];
    [v8 doubleValue];
    double v10 = v9;

    v11 = [v4 eventName];
    v12 = [v4 eventName];
    dispatch_queue_t v13 = [v5 objectForKey:v12];

    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = sub_10003DF94;
    v34 = sub_10003DFA4;
    id v35 = 0;
    if (v13)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10003DFAC;
      v26[3] = &unk_1002DADC8;
      double v29 = v10;
      id v27 = v4;
      v28 = &v30;
      [v13 enumerateObjectsUsingBlock:v26];
    }
    else
    {
      dispatch_queue_t v13 = +[NSMutableArray array];
      [v5 setObject:v13 forKey:v11];
    }
    v14 = (void *)v31[5];
    if (v14)
    {
      objc_super v15 = [v14 statValue];
      v16 = (char *)[v15 integerValue];

      v17 = +[NSNumber numberWithInteger:v16 + 1];
      [(id)v31[5] setStatValue:v17];
    }
    else
    {
      v18 = [[FMDEventLoggerEventStat alloc] initWithEventName:v11];
      v19 = (void *)v31[5];
      v31[5] = (uint64_t)v18;

      [(id)v31[5] setStatValue:&off_1002F1F78];
      v20 = +[NSNumber numberWithDouble:v10];
      [(id)v31[5] setGroupValue:v20];

      [v13 addObject:v31[5]];
    }
    id v21 = [v13 count];
    if ((unint64_t)v21 > qword_10031CD28) {
      [v13 removeObjectAtIndex:0];
    }
    v22 = sub_100004238();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10023D8CC((uint64_t)v5, v22);
    }

    v23 = [(FMDEventLoggerFacilityOnDiskStats *)self archiver];
    v24 = [v23 saveDictionary:v5];

    if (v24)
    {
      v25 = sub_100004238();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10023D854((uint64_t)v24, v25);
      }
    }
    _Block_object_dispose(&v30, 8);
  }
}

- (void)reset
{
  v3 = +[NSFileManager defaultManager];
  id v4 = [(FMDEventLoggerFacilityOnDiskStats *)self cachedLogFileURL];
  v5 = [v4 path];
  id v8 = 0;
  [v3 removeItemAtPath:v5 error:&v8];
  id v6 = v8;

  if (v6)
  {
    v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10023D944(self, (uint64_t)v6, v7);
    }
  }
  [(FMDEventLoggerFacilityOnDiskStats *)self loadLogs];
}

- (id)loggedEvents
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = sub_10003DF94;
  v11 = sub_10003DFA4;
  id v12 = 0;
  v3 = [(FMDEventLoggerFacilityOnDiskStats *)self serialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003E268;
  v6[3] = &unk_1002D9210;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)loggedEventsForEventName:(id)a3
{
  id v4 = a3;
  v5 = [(FMDEventLoggerFacilityOnDiskStats *)self logs];
  id v6 = [v5 objectForKey:v4];

  id v7 = [v6 copy];

  return v7;
}

- (BOOL)shouldLog
{
  return 1;
}

- (void)loadLogs
{
  v3 = [(FMDEventLoggerFacilityOnDiskStats *)self archiver];
  id v4 = +[NSSet setWithObject:objc_opt_class()];
  id v15 = 0;
  v5 = [v3 readDictionaryAndClasses:v4 error:&v15];
  id v6 = v15;

  if (v6)
  {
    id v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "FMDEventLoggerFacilityOnDisk read error %@", buf, 0xCu);
    }

    id v8 = +[FMDEventLoggerGeneral sharedInstance];
    [v8 sendError:v6 forEventName:@"FMDEventLoggerFacilityOnDiskStatsFailedReadEventName"];

    id v9 = 0;
  }
  else
  {
    id v9 = [v5 mutableCopy];
  }
  objc_initWeak((id *)buf, self);
  double v10 = [(FMDEventLoggerFacilityOnDiskStats *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E588;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v14, (id *)buf);
  id v13 = v9;
  id v11 = v9;
  dispatch_async(v10, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (NSURL)cachedLogFileURL
{
  return self->_cachedLogFileURL;
}

- (void)setCachedLogFileURL:(id)a3
{
}

- (NSMutableDictionary)logs
{
  return self->_logs;
}

- (void)setLogs:(id)a3
{
}

- (FMDataArchiver)archiver
{
  return self->_archiver;
}

- (void)setArchiver:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_archiver, 0);
  objc_storeStrong((id *)&self->_logs, 0);

  objc_storeStrong((id *)&self->_cachedLogFileURL, 0);
}

@end