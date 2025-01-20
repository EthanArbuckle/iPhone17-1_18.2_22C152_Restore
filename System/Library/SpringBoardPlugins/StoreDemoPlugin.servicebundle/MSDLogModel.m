@interface MSDLogModel
+ (id)sharedInstance;
- (BOOL)enableLogToFile:(id)a3;
- (BOOL)enableLogToFilesUnder:(id)a3 prefix:(id)a4 expireDays:(int64_t)a5;
- (__sFILE)logFP;
- (id)fileNameForTodayUnder:(id)a3 prefix:(id)a4;
- (void)logMessage:(id)a3;
- (void)logWithFormat:(id)a3 andArgs:(char *)a4;
- (void)setLogFP:(__sFILE *)a3;
@end

@implementation MSDLogModel

+ (id)sharedInstance
{
  if (qword_1E6E0 != -1) {
    dispatch_once(&qword_1E6E0, &stru_18770);
  }
  v2 = (void *)qword_1E6D8;

  return v2;
}

- (void)logWithFormat:(id)a3 andArgs:(char *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:a4];

  [(MSDLogModel *)self logMessage:v7];
}

- (void)logMessage:(id)a3
{
  id v9 = a3;
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  [v4 setDateFormat:@"dd-MM-yyyy HH:mm:ss:SSS"];
  v5 = +[NSDate now];
  id v6 = [v4 stringFromDate:v5];

  id v7 = +[NSString stringWithFormat:@"%@ %@\n", v6, v9];
  if ([(MSDLogModel *)self logFP])
  {
    v8 = self;
    objc_sync_enter(v8);
    fputs((const char *)[v7 UTF8String], -[MSDLogModel logFP](v8, "logFP"));
    fflush([(MSDLogModel *)v8 logFP]);
    objc_sync_exit(v8);
  }
}

- (BOOL)enableLogToFile:(id)a3
{
  id v4 = a3;
  v5 = +[NSFileManager defaultManager];
  id v6 = [v4 stringByExpandingTildeInPath];

  id v7 = [v6 stringByDeletingLastPathComponent];
  BOOL v8 = 0;
  if (([v5 fileExistsAtPath:v7] & 1) != 0
    || [v5 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0])
  {
    -[MSDLogModel setLogFP:](self, "setLogFP:", fopen((const char *)[v6 fileSystemRepresentation], "a"));
    if ([(MSDLogModel *)self logFP]) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (BOOL)enableLogToFilesUnder:(id)a3 prefix:(id)a4 expireDays:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[NSFileManager defaultManager];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_8594;
  v29[4] = sub_85A4;
  id v30 = 0;
  char v28 = 97;
  if (([v10 fileExistsAtPath:v8] & 1) == 0)
  {
    v11 = +[NSFileManager defaultManager];
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

  v18 = +[NSFileManager defaultManager];
  v19 = [v18 contentsOfDirectoryAtPath:v8 error:0];

  if (v19)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_85AC;
    v23[3] = &unk_18798;
    id v24 = v8;
    id v25 = v17;
    v27 = v29;
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
  v10 = [v7 components:28 fromDate:v9];
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/%@-%4ld%02ld%02ld.log", v6, v5, [v10 year], objc_msgSend(v10, "month"), objc_msgSend(v10, "day"));

  return v11;
}

- (__sFILE)logFP
{
  return self->_logFP;
}

- (void)setLogFP:(__sFILE *)a3
{
  self->_logFP = a3;
}

@end