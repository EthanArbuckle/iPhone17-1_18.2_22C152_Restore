@interface IPPControlLogging
- (IPPControlLogging)initWithIdentifier:(id)a3;
- (void)_now:(id)a3 appendString:(id)a4;
- (void)_withFile:(id)a3;
- (void)onQueueAsyncIfPreserving:(id)a3;
- (void)preserveRequest:(id)a3 forSequence:(int)a4;
- (void)preserveResponse:(id)a3 forSequence:(int)a4;
- (void)preserveResponseFailure:(id)a3 forSequence:(int)a4;
@end

@implementation IPPControlLogging

- (IPPControlLogging)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IPPControlLogging;
  v5 = [(IPPControlLogging *)&v14 init];
  if (v5)
  {
    v6 = NSTemporaryDirectory();
    v7 = +[NSURL fileURLWithPath:v6 isDirectory:1];

    v8 = +[NSString stringWithFormat:@"control-%d-%@.txt", getpid(), v4];
    uint64_t v9 = [v7 URLByAppendingPathComponent:v8];
    controlFilePath = v5->_controlFilePath;
    v5->_controlFilePath = (NSURL *)v9;

    v11 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v5->_dateFormatter;
    v5->_dateFormatter = v11;

    [(NSDateFormatter *)v5->_dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSSSSz"];
  }

  return v5;
}

- (void)_withFile:(id)a3
{
  id v4 = (uint64_t (**)(id, void))a3;
  uint64_t v5 = open([(NSURL *)self->_controlFilePath fileSystemRepresentation], 521, 438);
  if (v5 == -1)
  {
    v7 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      controlFilePath = self->_controlFilePath;
      int v13 = *__error();
      *(_DWORD *)buf = 138543618;
      v16 = controlFilePath;
      __int16 v17 = 1024;
      int v18 = v13;
      uint64_t v9 = "Could not create serialization for %{public}@ - %d";
      v10 = v7;
      uint32_t v11 = 18;
      goto LABEL_7;
    }
LABEL_8:

    objc_super v14 = self->_controlFilePath;
    self->_controlFilePath = 0;

    goto LABEL_9;
  }
  char v6 = v4[2](v4, v5);
  close(v5);
  if ((v6 & 1) == 0)
  {
    v7 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_controlFilePath;
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      uint64_t v9 = "No longer serializing for %{public}@";
      v10 = v7;
      uint32_t v11 = 12;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_now:(id)a3 appendString:(id)a4
{
  id v5 = a4;
  dateFormatter = self->_dateFormatter;
  v7 = +[NSDate date];
  v8 = [(NSDateFormatter *)dateFormatter stringFromDate:v7];
  uint64_t v9 = +[NSString stringWithFormat:@"[%@]\n", v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004943C;
  v12[3] = &unk_1000A3338;
  id v13 = v9;
  id v10 = v5;
  id v14 = v10;
  id v11 = v9;
  [(IPPControlLogging *)self _withFile:v12];
}

- (void)onQueueAsyncIfPreserving:(id)a3
{
  id v4 = a3;
  if (qword_1000C8B68 != -1)
  {
    id v6 = v4;
    dispatch_once(&qword_1000C8B68, &stru_1000A3358);
    id v4 = v6;
  }
  if (self->_controlFilePath)
  {
    id v5 = v4;
    dispatch_async((dispatch_queue_t)qword_1000C8B60, v4);
    id v4 = v5;
  }
}

- (void)preserveRequest:(id)a3 forSequence:(int)a4
{
  id v6 = a3;
  v7 = +[NSDate date];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004976C;
  v10[3] = &unk_1000A3380;
  int v14 = a4;
  id v8 = v6;
  id v11 = v8;
  v12 = self;
  id v13 = v7;
  id v9 = v7;
  [(IPPControlLogging *)self onQueueAsyncIfPreserving:v10];
}

- (void)preserveResponse:(id)a3 forSequence:(int)a4
{
  id v6 = a3;
  v7 = +[NSDate date];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004991C;
  v10[3] = &unk_1000A3380;
  int v14 = a4;
  id v8 = v6;
  id v11 = v8;
  v12 = self;
  id v13 = v7;
  id v9 = v7;
  [(IPPControlLogging *)self onQueueAsyncIfPreserving:v10];
}

- (void)preserveResponseFailure:(id)a3 forSequence:(int)a4
{
  id v6 = a3;
  v7 = +[NSDate date];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100049ACC;
  v10[3] = &unk_1000A3380;
  int v14 = a4;
  id v8 = v6;
  id v11 = v8;
  v12 = self;
  id v13 = v7;
  id v9 = v7;
  [(IPPControlLogging *)self onQueueAsyncIfPreserving:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);

  objc_storeStrong((id *)&self->_controlFilePath, 0);
}

@end