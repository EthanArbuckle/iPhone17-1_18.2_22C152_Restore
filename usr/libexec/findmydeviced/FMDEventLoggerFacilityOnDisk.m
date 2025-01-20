@interface FMDEventLoggerFacilityOnDisk
+ (id)facilityName;
- (BOOL)shouldLog;
- (FMDEventLoggerFacilityOnDisk)init;
- (FMDataArchiver)archiver;
- (NSMutableArray)logs;
- (NSURL)cachedLogFileURL;
- (OS_dispatch_queue)serialQueue;
- (id)loggedEvents;
- (void)_logEvent:(id)a3;
- (void)loadLogs;
- (void)logEvent:(id)a3;
- (void)reset;
- (void)setArchiver:(id)a3;
- (void)setCachedLogFileURL:(id)a3;
- (void)setLogs:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation FMDEventLoggerFacilityOnDisk

+ (id)facilityName
{
  return @"FMDEventLoggerFacilityOnDisk";
}

- (FMDEventLoggerFacilityOnDisk)init
{
  v15.receiver = self;
  v15.super_class = (Class)FMDEventLoggerFacilityOnDisk;
  v2 = [(FMDEventLoggerFacilityOnDisk *)&v15 init];
  if (v2)
  {
    v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v4 = [v3 objectAtIndex:0];
    v5 = [v4 stringByAppendingPathComponent:@"com.apple.icloud.findmydeviced"];
    v6 = [v5 stringByAppendingPathComponent:@"com.apple.icloud.findmydeviced.eventlogger"];

    v7 = +[NSURL URLWithString:v6];
    [(FMDEventLoggerFacilityOnDisk *)v2 setCachedLogFileURL:v7];

    id v8 = objc_alloc((Class)FMDataArchiver);
    v9 = [(FMDEventLoggerFacilityOnDisk *)v2 cachedLogFileURL];
    id v10 = [v8 initWithFileURL:v9];
    [(FMDEventLoggerFacilityOnDisk *)v2 setArchiver:v10];

    v11 = [(FMDEventLoggerFacilityOnDisk *)v2 archiver];
    [v11 setBackedUp:0];

    v12 = [(FMDEventLoggerFacilityOnDisk *)v2 archiver];
    [v12 setCreateDirectories:1];

    dispatch_queue_t v13 = dispatch_queue_create("FMDEventLoggerFacilityOnDisk.serialQueue", 0);
    [(FMDEventLoggerFacilityOnDisk *)v2 setSerialQueue:v13];

    [(FMDEventLoggerFacilityOnDisk *)v2 loadLogs];
  }
  return v2;
}

- (void)logEvent:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(FMDEventLoggerFacilityOnDisk *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008F2AC;
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
  if ([(FMDEventLoggerFacilityOnDisk *)self shouldLog])
  {
    v5 = [(FMDEventLoggerFacilityOnDisk *)self logs];
    [v5 addObject:v4];
    id v6 = [v5 count];
    if ((unint64_t)v6 > qword_10031D580) {
      [v5 removeObjectAtIndex:0];
    }
    v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100241A90((uint64_t)v5, v7);
    }

    id v8 = [(FMDEventLoggerFacilityOnDisk *)self archiver];
    id v9 = [v8 saveArray:v5];

    if (v9)
    {
      id v10 = sub_100004238();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100241A18((uint64_t)v9, v10);
      }
    }
  }
}

- (void)reset
{
  v3 = +[NSFileManager defaultManager];
  id v4 = [(FMDEventLoggerFacilityOnDisk *)self cachedLogFileURL];
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
  [(FMDEventLoggerFacilityOnDisk *)self loadLogs];
}

- (id)loggedEvents
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10008F5F0;
  v11 = sub_10008F600;
  id v12 = 0;
  v3 = [(FMDEventLoggerFacilityOnDisk *)self serialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008F608;
  v6[3] = &unk_1002D9210;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)shouldLog
{
  return 1;
}

- (void)loadLogs
{
  v3 = [(FMDEventLoggerFacilityOnDisk *)self archiver];
  id v4 = +[NSSet setWithObject:objc_opt_class()];
  id v15 = 0;
  v5 = [v3 readArrayAndClasses:v4 error:&v15];
  id v6 = v15;

  if (v6)
  {
    uint64_t v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "FMDEventLoggerFacilityOnDisk read error %@", buf, 0xCu);
    }

    id v8 = +[FMDEventLoggerGeneral sharedInstance];
    [v8 sendError:v6 forEventName:@"FMDEventLoggerFacilityOnDiskFailedReadEventName"];

    id v9 = 0;
  }
  else
  {
    id v9 = [v5 mutableCopy];
  }
  objc_initWeak((id *)buf, self);
  id v10 = [(FMDEventLoggerFacilityOnDisk *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008F89C;
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

- (NSMutableArray)logs
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