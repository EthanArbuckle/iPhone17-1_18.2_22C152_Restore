@interface CRLRemotePropertyList
- (CRLRemotePropertyList)init;
- (CRLRemotePropertyList)initWithRemoteURL:(id)a3 localURL:(id)a4;
- (NSURL)localURL;
- (NSURL)remoteURL;
- (double)timeIntervalUntilNextUpdate;
- (id)URLForKey:(id)a3;
- (id)URLRequest;
- (id)arrayForKey:(id)a3;
- (id)deserializePropertyListData:(id)a3 error:(id *)a4;
- (id)dictionaryForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (id)validateUserDefaultsDownloadURL:(id)a3;
- (void)checkForUpdateWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)processDidResume:(id)a3;
- (void)processPropertyList:(id)a3;
- (void)processResponse:(id)a3 data:(id)a4 error:(id)a5;
- (void)processWillSuspend:(id)a3;
- (void)startUpdateTimer;
- (void)updateIfNeededWithCompletionHandler:(id)a3;
@end

@implementation CRLRemotePropertyList

- (CRLRemotePropertyList)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FFB38);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLRemotePropertyList init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRemoteDefaults.m";
    __int16 v17 = 1024;
    int v18 = 41;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FFB58);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLRemotePropertyList init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRemoteDefaults.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:41 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLRemotePropertyList init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (CRLRemotePropertyList)initWithRemoteURL:(id)a3 localURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CRLRemotePropertyList;
  v8 = [(CRLRemotePropertyList *)&v32 init];
  if (v8)
  {
    v9 = (NSURL *)[v6 copy];
    remoteURL = v8->_remoteURL;
    v8->_remoteURL = v9;

    v11 = (NSURL *)[v7 copy];
    localURL = v8->_localURL;
    v8->_localURL = v11;

    if (v7)
    {
      if (([v7 isFileURL] & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FFB78);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010BC62C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FFB98);
        }
        __int16 v13 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v13);
        }
        v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLRemotePropertyList initWithRemoteURL:localURL:]");
        __int16 v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRemoteDefaults.m"];
        +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:52 isFatal:0 description:"Local URL should be a file URL."];
      }
      v16 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithContentsOfURL:v7];
      propertyList = v8->_propertyList;
      v8->_propertyList = v16;
    }
    int v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = [v19 stringByAppendingString:@".Access"];

    id v21 = v20;
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], 0);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v22;

    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v26 = [v25 stringByAppendingString:@".Check"];

    id v27 = v26;
    dispatch_queue_t v28 = dispatch_queue_create((const char *)[v27 UTF8String], 0);
    checkQueue = v8->_checkQueue;
    v8->_checkQueue = (OS_dispatch_queue *)v28;

    [(CRLRemotePropertyList *)v8 startUpdateTimer];
    v30 = +[NSNotificationCenter defaultCenter];
    [v30 addObserver:v8 selector:"processWillSuspend:" name:UIApplicationWillResignActiveNotification object:0];
    [v30 addObserver:v8 selector:"processDidResume:" name:UIApplicationDidBecomeActiveNotification object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  updateTimer = self->_updateTimer;
  if (updateTimer) {
    dispatch_source_cancel(updateTimer);
  }
  v5.receiver = self;
  v5.super_class = (Class)CRLRemotePropertyList;
  [(CRLRemotePropertyList *)&v5 dealloc];
}

- (void)startUpdateTimer
{
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_checkQueue);
  updateTimer = self->_updateTimer;
  self->_updateTimer = v3;

  [(CRLRemotePropertyList *)self timeIntervalUntilNextUpdate];
  dispatch_source_set_timer((dispatch_source_t)self->_updateTimer, (unint64_t)(v5 * 1000000000.0), 0x4E94914F0000uLL, 0x34630B8A000uLL);
  objc_initWeak(&location, self);
  id v6 = self->_updateTimer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004CB364;
  v7[3] = &unk_1014CBF60;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_updateTimer);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)processWillSuspend:(id)a3
{
  updateTimer = self->_updateTimer;
  if (updateTimer)
  {
    dispatch_source_cancel(updateTimer);
    double v5 = self->_updateTimer;
    self->_updateTimer = 0;
  }
}

- (void)processDidResume:(id)a3
{
  if (!self->_updateTimer) {
    [(CRLRemotePropertyList *)self startUpdateTimer];
  }
}

- (void)updateIfNeededWithCompletionHandler:(id)a3
{
  id v4 = a3;
  checkQueue = self->_checkQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004CB4A0;
  v7[3] = &unk_1014D0AB0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(checkQueue, v7);
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = sub_1004CB5E4;
  v16 = sub_1004CB5F4;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004CB5FC;
  block[3] = &unk_1014CEE50;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(CRLRemotePropertyList *)self objectForKey:v4];

  id v7 = sub_1002469D0(v5, v6);

  return v7;
}

- (id)URLForKey:(id)a3
{
  v3 = [(CRLRemotePropertyList *)self objectForKey:a3];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = sub_1002469D0(v4, v3);
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (!v6)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = sub_1002469D0(v7, v3);
    if (v8)
    {
      uint64_t v5 = +[NSURL URLWithString:v8];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = [(CRLRemotePropertyList *)self objectForKey:v4];

  uint64_t v7 = sub_1002469D0(v5, v6);

  return v7;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = [(CRLRemotePropertyList *)self objectForKey:v4];

  uint64_t v7 = sub_1002469D0(v5, v6);

  return v7;
}

- (void)checkForUpdateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLRemotePropertyList *)self URLRequest];
  dispatch_suspend((dispatch_object_t)self->_checkQueue);
  +[UIApplication sharedApplication];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  __int16 v13 = sub_1004CB9C8;
  uint64_t v14 = &unk_1014FFBC0;
  __int16 v15 = self;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v4;
  id v18 = [v16 beginBackgroundTaskWithExpirationHandler:0];
  id v6 = v4;
  id v7 = v16;
  id v8 = objc_retainBlock(&v11);
  v9 = +[NSURLSession sharedSession];
  id v10 = [v9 dataTaskWithRequest:v5 completionHandler:v8];

  [v10 resume];
}

- (id)validateUserDefaultsDownloadURL:(id)a3
{
  id v3 = a3;

  return v3;
}

- (double)timeIntervalUntilNextUpdate
{
  unsigned int v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v4 stringByAppendingString:@"NextUpdate"];
  id v6 = [v2 objectForKey:v5];

  double v7 = 0.0;
  if (v6)
  {
    id v8 = (objc_class *)objc_opt_class();
    v9 = sub_10024715C(v8, v6);

    if (v9)
    {
      id v10 = +[NSDate date];
      [v6 timeIntervalSinceDate:v10];
      double v12 = v11;

      double v7 = fmax(v12, 0.0);
    }
  }

  return v7;
}

- (id)URLRequest
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v5 stringByAppendingString:@"DownloadURL"];
  double v7 = [v3 stringForKey:v6];

  if (![v7 length]
    || (+[NSURL URLWithString:v7],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v9 = (void *)v8,
        [(CRLRemotePropertyList *)self validateUserDefaultsDownloadURL:v8],
        id v10 = (NSURL *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    id v10 = self->_remoteURL;
  }
  id v11 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v10];
  [v11 setTimeoutInterval:20.0];
  [v11 setCachePolicy:1];
  double v12 = (objc_class *)objc_opt_class();
  __int16 v13 = NSStringFromClass(v12);
  uint64_t v14 = [v13 stringByAppendingString:@"ETag"];
  __int16 v15 = [v3 stringForKey:v14];

  if ([v15 length]) {
    [v11 setValue:v15 forHTTPHeaderField:@"If-None-Match"];
  }

  return v11;
}

- (void)processResponse:(id)a3 data:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 statusCode];
  id v12 = v11;
  if (v11 == (id)304 || v11 == (id)200)
  {
    __int16 v13 = +[NSUserDefaults standardUserDefaults];
    uint64_t v14 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
    __int16 v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    id v17 = [v16 stringByAppendingString:@"NextUpdate"];
    [v13 setObject:v14 forKey:v17];

    if (v12 == (id)200 && [v9 length])
    {
      id v26 = 0;
      id v18 = [(CRLRemotePropertyList *)self deserializePropertyListData:v9 error:&v26];
      id v19 = v26;

      if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        [(CRLRemotePropertyList *)self processPropertyList:v18];
        v20 = [v8 allHeaderFields];
        id v21 = [v20 objectForKey:@"Etag"];

        dispatch_queue_t v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        v24 = [v23 stringByAppendingString:@"ETag"];
        [v13 setObject:v21 forKey:v24];

        self->_didUpdateAtLeastOnce = 1;
      }
      else
      {
        if (qword_101719A68 != -1) {
          dispatch_once(&qword_101719A68, &stru_1014FFBE0);
        }
        v25 = off_10166B498;
        if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
          sub_1010BC6B4(v25, v19);
        }
      }
    }
    else
    {
      id v19 = v10;
    }

    id v10 = v19;
  }
}

- (id)deserializePropertyListData:(id)a3 error:(id *)a4
{
  return +[NSPropertyListSerialization propertyListWithData:a3 options:0 format:0 error:a4];
}

- (void)processPropertyList:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  localURL = self->_localURL;
  if (localURL && ([v4 writeToURL:localURL atomically:0] & 1) == 0)
  {
    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_1014FFC00);
    }
    double v7 = off_10166B498;
    if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
      sub_1010BC7A4((void **)&self->_localURL, v7);
    }
  }
  accessQueue = self->_accessQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1004CC158;
  v10[3] = &unk_1014CBE78;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(accessQueue, v10);
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (NSURL)localURL
{
  return self->_localURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_checkQueue, 0);
  objc_storeStrong((id *)&self->_propertyList, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end