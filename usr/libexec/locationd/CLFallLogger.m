@interface CLFallLogger
- (BOOL)_shouldRotate;
- (BOOL)_shouldRotateToHour:(int64_t *)a3 date:(id *)a4;
- (CLFallLogger)init;
- (id)_currentFilename;
- (id)_outputStream;
- (id)currentFilename;
- (id)initToDirectory:(id)a3 prefix:(id)a4 rotation:(int64_t)a5;
- (id)logDirectory;
- (void)_stopLoggingOnQueue;
- (void)clearLogs;
- (void)dealloc;
- (void)flushInMemoryDataWithCompletionQueue:(id)a3 completionBlock:(id)a4;
- (void)flushToFile;
- (void)logData:(id)a3;
- (void)stopLogging;
@end

@implementation CLFallLogger

- (CLFallLogger)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLFallLogger;
  v2 = [(CLFallLogger *)&v4 init];
  if (v2) {
    v2->fQueue = (OS_dispatch_queue *)dispatch_queue_create("CLFallLogger", 0);
  }
  return v2;
}

- (id)initToDirectory:(id)a3 prefix:(id)a4 rotation:(int64_t)a5
{
  v8 = [(CLFallLogger *)self init];
  if (v8)
  {
    v8->fLogDirectory = (NSString *)a3;
    v8->fLogFilePrefix = (NSString *)a4;
    v8->fRotation = a5;
  }
  return v8;
}

- (void)dealloc
{
  [(CLFallLogger *)self _stopLoggingOnQueue];
  dispatch_release((dispatch_object_t)self->fQueue);

  v3.receiver = self;
  v3.super_class = (Class)CLFallLogger;
  [(CLFallLogger *)&v3 dealloc];
}

- (id)logDirectory
{
  return self->fLogDirectory;
}

- (id)_currentFilename
{
  if (!self->fHour && !self->fDate) {
    return &stru_10234F018;
  }
  id v3 = objc_alloc_init((Class)NSDateFormatter);
  [v3 setDateFormat:@"yyyyMMdd"];
  if (self->fRotation) {
    objc_super v4 = (NSNumber *)[v3 stringFromDate:self->fDate];
  }
  else {
    objc_super v4 = +[NSNumber numberWithLongLong:self->fHour];
  }
  v5 = v4;

  return +[NSString stringWithFormat:@"%@.v%d.%@.%@", self->fLogFilePrefix, 11, v5, @"bin"];
}

- (id)currentFilename
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_100177F80;
  v10 = sub_1001776E8;
  uint64_t v11 = 0;
  fQueue = self->fQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1013B4E74;
  v5[3] = &unk_1022CFE18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(fQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_stopLoggingOnQueue
{
  self->fOutputStream = 0;
  self->fHour = 0;

  self->fDate = 0;
}

- (BOOL)_shouldRotate
{
  return [(CLFallLogger *)self _shouldRotateToHour:0 date:0];
}

- (BOOL)_shouldRotateToHour:(int64_t *)a3 date:(id *)a4
{
  if (!self->fLogDirectory) {
    return 0;
  }
  if (!self->fRotation)
  {
    int64_t v8 = (uint64_t)CFAbsoluteTimeGetCurrent() / 3600;
    if (self->fHour != v8)
    {
      v7 = 0;
      if (!a3) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    return 0;
  }
  v7 = +[NSDate date];
  if ([+[NSCalendar currentCalendar] isDate:self->fDate inSameDayAsDate:v7])
  {
    return 0;
  }
  int64_t v8 = 0;
  if (a3) {
LABEL_5:
  }
    *a3 = v8;
LABEL_6:
  if (a4) {
    *a4 = v7;
  }
  return 1;
}

- (void)stopLogging
{
  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1013B5034;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_sync(fQueue, block);
}

- (void)clearLogs
{
  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1013B50B0;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_async(fQueue, block);
}

- (void)flushToFile
{
  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1013B518C;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_sync(fQueue, block);
}

- (void)flushInMemoryDataWithCompletionQueue:(id)a3 completionBlock:(id)a4
{
  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1013B5250;
  block[3] = &unk_1022F5FB0;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(fQueue, block);
}

- (id)_outputStream
{
  if (!self->fLogDirectory)
  {
    if (self->fOutputStream) {
      return self->fOutputStream;
    }
    uint64_t v6 = (NSOutputStream *)[objc_alloc((Class)NSOutputStream) initToMemory];
    goto LABEL_32;
  }
  id v15 = 0;
  int64_t v16 = 0;
  if (![(CLFallLogger *)self _shouldRotateToHour:&v16 date:&v15]) {
    return self->fOutputStream;
  }
  [(CLFallLogger *)self _stopLoggingOnQueue];
  char v14 = 1;
  unsigned int v3 = [+[NSFileManager defaultManager] fileExistsAtPath:self->fLogDirectory isDirectory:&v14];
  if (v3) {
    BOOL v4 = v14 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    if ((v3 & 1) == 0)
    {
      uint64_t v13 = 0;
      [+[NSFileManager defaultManager] createDirectoryAtPath:self->fLogDirectory withIntermediateDirectories:1 attributes:0 error:&v13];
      if (v13)
      {
        if (qword_1024190F0 != -1) {
          dispatch_once(&qword_1024190F0, &stru_1023231B8);
        }
        v5 = qword_1024190F8;
        if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v13;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Directory creation failed: %@", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024190F0 != -1) {
            dispatch_once(&qword_1024190F0, &stru_1023231B8);
          }
          int v18 = 138412290;
          uint64_t v19 = v13;
LABEL_27:
          int64_t v8 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLFallLogger _outputStream]", "%s\n", v8);
          if (v8 != (char *)buf) {
            free(v8);
          }
          return self->fOutputStream;
        }
        return self->fOutputStream;
      }
    }
    self->fHour = v16;
    self->fDate = (NSDate *)v15;
    v17[0] = self->fLogDirectory;
    v17[1] = [(CLFallLogger *)self _currentFilename];
    v9 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:v17 count:2]);
    if (![+[NSFileManager defaultManager](NSFileManager, "defaultManager") fileExistsAtPath:v9]&& ![+[NSFileManager defaultManager] createFileAtPath:v9 contents:0 attributes:0])
    {
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_1023231B8);
      }
      uint64_t v11 = qword_1024190F8;
      if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "File creation failed", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024190F0 != -1) {
          dispatch_once(&qword_1024190F0, &stru_1023231B8);
        }
        LOWORD(v18) = 0;
        v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLFallLogger _outputStream]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
      [(CLFallLogger *)self _stopLoggingOnQueue];
      return self->fOutputStream;
    }
    uint64_t v6 = (NSOutputStream *)[objc_alloc((Class)NSOutputStream) initToFileAtPath:v9 append:1];
LABEL_32:
    self->fOutputStream = v6;
    [(NSOutputStream *)v6 open];
    return self->fOutputStream;
  }
  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_1023231B8);
  }
  v7 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Unable to create directory. There is a file with the same name.", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_1023231B8);
    }
    LOWORD(v18) = 0;
    goto LABEL_27;
  }
  return self->fOutputStream;
}

- (void)logData:(id)a3
{
  fQueue = self->fQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1013B58A0;
  v4[3] = &unk_10229FEB0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fQueue, v4);
}

@end