@interface MSDLogModel
+ (id)sharedInstance;
- (BOOL)enableLogToFile:(id)a3;
- (BOOL)enableLogToFilesUnder:(id)a3 prefix:(id)a4 expireDays:(int64_t)a5;
- (MSDLogModel)init;
- (NSString)logFolderPath;
- (id)fileNameForTodayUnder:(id)a3 prefix:(id)a4;
- (void)logMessage:(int)a3 prefix:(id)a4 message:(id)a5;
- (void)setLoggingLevelToFile:(int)a3;
- (void)setLoggingLevelToStdout:(int)a3;
@end

@implementation MSDLogModel

+ (id)sharedInstance
{
  if (qword_10000C738 != -1) {
    dispatch_once(&qword_10000C738, &stru_100008348);
  }
  v2 = (void *)qword_10000C730;

  return v2;
}

- (MSDLogModel)init
{
  v10.receiver = self;
  v10.super_class = (Class)MSDLogModel;
  v2 = [(MSDLogModel *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_logFP = 0;
    logFolderPath = v2->_logFolderPath;
    v2->_logFolderPath = 0;

    *(void *)&v3->_loggingLevelToFile = 0x300000001;
    v5 = getprogname();
    os_log_t v6 = os_log_create("com.apple.MobileDemo", v5);
    osLog = v3->_osLog;
    v3->_osLog = (OS_os_log *)v6;

    v8 = v3;
  }

  return v3;
}

- (void)setLoggingLevelToFile:(int)a3
{
  self->_loggingLevelToFile = a3;
}

- (void)setLoggingLevelToStdout:(int)a3
{
  self->_loggingLevelToStdout = a3;
}

- (void)logMessage:(int)a3 prefix:(id)a4 message:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = self;
  objc_sync_enter(v10);
  if (v10->_loggingLevelToFile <= a3)
  {
    v24[1] = (__uint64_t)&v29;
    id v11 = [objc_alloc((Class)NSString) initWithFormat:v9 arguments:&v29];
    v24[0] = 0;
    pthread_threadid_np(0, v24);
    v23 = +[NSDate date];
    id v12 = objc_alloc_init((Class)NSDateFormatter);
    [v12 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    v13 = [v12 stringFromDate:v23];
    v14 = +[NSString stringWithFormat:@"0x%llx %d [%@] %@ %@\n", v24[0], getpid(), v13, v8, v11];
    v15 = v14;
    logFP = v10->_logFP;
    if (logFP)
    {
      fputs((const char *)[v14 UTF8String], logFP);
      fflush(v10->_logFP);
    }
    if (v10->_loggingLevelToStdout <= a3)
    {
      v21 = __stdoutp;
      v20 = (const char *)[v13 UTF8String];
      v17 = getprogname();
      id v18 = [v8 substringToIndex:5];
      fprintf(v21, "%s %s %s %s\n", v20, v17, (const char *)[v18 UTF8String], (const char *)[v11 UTF8String]);

      fflush(__stdoutp);
    }
    osLog = v10->_osLog;
    if (os_log_type_enabled(osLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v26 = v8;
      __int16 v27 = 2114;
      id v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, osLog, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }
  objc_sync_exit(v10);
}

- (BOOL)enableLogToFile:(id)a3
{
  id v4 = a3;
  v5 = +[NSFileManager defaultManager];
  os_log_t v6 = [v4 stringByExpandingTildeInPath];

  v7 = [v6 stringByDeletingLastPathComponent];
  BOOL v9 = 0;
  if (([v5 fileExistsAtPath:v7] & 1) != 0
    || [v5 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0])
  {
    objc_storeStrong((id *)&self->_logFolderPath, v7);
    id v8 = fopen((const char *)[v6 fileSystemRepresentation], "a");
    self->_logFP = v8;
    if (v8) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (BOOL)enableLogToFilesUnder:(id)a3 prefix:(id)a4 expireDays:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = +[NSFileManager defaultManager];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_100002268;
  v29[4] = sub_100002278;
  id v30 = 0;
  char v28 = 97;
  if (([v10 fileExistsAtPath:v8] & 1) == 0)
  {
    id v11 = +[NSFileManager defaultManager];
    unsigned __int8 v12 = [v11 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];

    if ((v12 & 1) == 0)
    {
      v17 = 0;
      v19 = 0;
      v13 = 0;
      goto LABEL_10;
    }
  }
  v13 = [v8 stringByAppendingPathComponent:@"testWritability.log"];
  v14 = +[NSData dataWithBytes:&v28 length:1];
  unsigned int v15 = [v10 createFileAtPath:v13 contents:v14 attributes:0];

  if (!v15)
  {
    v17 = 0;
    v19 = 0;
LABEL_10:
    BOOL v21 = 0;
    goto LABEL_7;
  }
  [v10 removeItemAtPath:v13 error:0];
  v16 = +[NSDate date];
  v17 = +[NSDate dateWithTimeInterval:v16 sinceDate:(double)a5 * -86400.0];

  id v18 = +[NSFileManager defaultManager];
  v19 = [v18 contentsOfDirectoryAtPath:v8 error:0];

  if (v19)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100002280;
    v23[3] = &unk_100008370;
    id v24 = v8;
    id v25 = v17;
    __int16 v27 = v29;
    id v26 = v10;
    [v19 enumerateObjectsUsingBlock:v23];
  }
  v20 = [(MSDLogModel *)self fileNameForTodayUnder:v8 prefix:v9];
  BOOL v21 = [(MSDLogModel *)self enableLogToFile:v20];

LABEL_7:
  _Block_object_dispose(v29, 8);

  return v21;
}

- (id)fileNameForTodayUnder:(id)a3 prefix:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  id v8 = +[NSLocale currentLocale];
  [v7 setLocale:v8];

  id v9 = +[NSDate date];
  objc_super v10 = [v7 components:28 fromDate:v9];
  id v11 = [NSString stringWithFormat:@"%@/%@-%4ld%02ld%02ld.log", v6, v5, [v10 year], objc_msgSend(v10, "month"), objc_msgSend(v10, "day")];

  return v11;
}

- (NSString)logFolderPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logFolderPath, 0);

  objc_storeStrong((id *)&self->_osLog, 0);
}

@end