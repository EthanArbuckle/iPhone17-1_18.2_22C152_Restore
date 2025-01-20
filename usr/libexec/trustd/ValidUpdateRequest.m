@interface ValidUpdateRequest
- (BOOL)scheduleUpdateFromServer:(id)a3 forVersion:(int64_t)a4 withQueue:(id)a5;
- (BOOL)updateNowFromServer:(id)a3 version:(int64_t)a4 queue:(id)a5;
- (NSURLSession)backgroundSession;
- (NSURLSession)ephemeralSession;
- (double)updateScheduled;
- (id)createSession:(BOOL)a3 queue:(id)a4 forServer:(id)a5;
- (id)validUpdateConfiguration:(BOOL)a3;
- (void)createSessions:(id)a3 forServer:(id)a4;
- (void)setBackgroundSession:(id)a3;
- (void)setEphemeralSession:(id)a3;
- (void)setUpdateScheduled:(double)a3;
@end

@implementation ValidUpdateRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralSession, 0);

  objc_storeStrong((id *)&self->_backgroundSession, 0);
}

- (void)setEphemeralSession:(id)a3
{
}

- (NSURLSession)ephemeralSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBackgroundSession:(id)a3
{
}

- (NSURLSession)backgroundSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUpdateScheduled:(double)a3
{
  self->_updateScheduled = a3;
}

- (double)updateScheduled
{
  return self->_updateScheduled;
}

- (BOOL)updateNowFromServer:(id)a3 version:(int64_t)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (!v8)
  {
    v15 = sub_10001CB28("validupdate");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "invalid update request";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    }
LABEL_10:
    BOOL v17 = 0;
    goto LABEL_15;
  }
  if (!v9)
  {
    v15 = sub_10001CB28("validupdate");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "missing update queue, skipping update";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v11 = [(ValidUpdateRequest *)self ephemeralSession];

  if (v11)
  {
    v12 = [(ValidUpdateRequest *)self ephemeralSession];
    v13 = [v12 delegate];

    id v14 = [v8 copy];
    [v13 setCurrentUpdateServer:v14];
  }
  else
  {
    [(ValidUpdateRequest *)self createSessions:v10 forServer:v8];
  }
  v18 = +[NSString stringWithFormat:@"https://%@/g%ld/v%ld", v8, sub_10005233C(), a4];
  v15 = +[NSURL URLWithString:v18];

  v19 = [(ValidUpdateRequest *)self ephemeralSession];
  v20 = [v19 dataTaskWithURL:v15];

  v21 = +[NSString stringWithFormat:@"%ld", a4];
  [v20 setTaskDescription:v21];

  [v20 resume];
  v22 = sub_10001CB28("validupdate");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v20;
    __int16 v26 = 2048;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    __int16 v28 = 2112;
    v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "running foreground data task %@ at %f URL:%@", buf, 0x20u);
  }

  BOOL v17 = 1;
LABEL_15:

  return v17;
}

- (BOOL)scheduleUpdateFromServer:(id)a3 forVersion:(int64_t)a4 withQueue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (!v8)
  {
    v12 = sub_10001CB28("validupdate");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "invalid update request";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }
LABEL_9:

    BOOL v11 = 0;
    goto LABEL_10;
  }
  if (!v9)
  {
    v12 = sub_10001CB28("validupdate");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "missing update queue, skipping update";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003EA9C;
  v15[3] = &unk_10007F460;
  v15[4] = self;
  dispatch_queue_t v16 = (dispatch_queue_t)v9;
  id v17 = v8;
  int64_t v18 = a4;
  dispatch_async(v16, v15);

  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (void)createSessions:(id)a3 forServer:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [(ValidUpdateRequest *)self createSession:0 queue:v14 forServer:v6];
  [(ValidUpdateRequest *)self setEphemeralSession:v7];

  CFBooleanRef v8 = (const __CFBoolean *)CFPreferencesCopyValue(@"ValidUpdateBackground", @"com.apple.security", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
  if (v8)
  {
    CFBooleanRef v9 = v8;
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFBooleanGetTypeID())
    {
      int Value = CFBooleanGetValue(v9);
      CFRelease(v9);
      if (!Value)
      {
        uint64_t v12 = [(ValidUpdateRequest *)self ephemeralSession];
        goto LABEL_7;
      }
    }
    else
    {
      CFRelease(v9);
    }
  }
  uint64_t v12 = [(ValidUpdateRequest *)self createSession:1 queue:v14 forServer:v6];
LABEL_7:
  v13 = (void *)v12;
  [(ValidUpdateRequest *)self setBackgroundSession:v12];
}

- (id)createSession:(BOOL)a3 queue:(id)a4 forServer:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  CFTypeID v10 = [(ValidUpdateRequest *)self validUpdateConfiguration:v6];
  BOOL v11 = objc_alloc_init(ValidDelegate);
  [(ValidDelegate *)v11 setHandler:&stru_10007F3F8];
  [(ValidDelegate *)v11 setTransaction:0];
  [(ValidDelegate *)v11 setRevDbUpdateQueue:v9];

  [(ValidDelegate *)v11 setFinishedDownloading:0];
  id v12 = [v8 copy];

  [(ValidDelegate *)v11 setCurrentUpdateServer:v12];
  id v13 = objc_alloc_init((Class)NSOperationQueue);
  [v13 setMaxConcurrentOperationCount:1];
  id v14 = +[NSURLSession sessionWithConfiguration:v10 delegate:v11 delegateQueue:v13];

  return v14;
}

- (id)validUpdateConfiguration:(BOOL)a3
{
  if (a3)
  {
    CFBooleanRef v3 = (const __CFBoolean *)CFPreferencesCopyValue(@"ValidUpdateWiFiOnly", @"com.apple.security", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
    if (v3)
    {
      CFBooleanRef v4 = v3;
      CFTypeID v5 = CFGetTypeID(v3);
      BOOL v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) == 0;
      CFRelease(v4);
    }
    else
    {
      BOOL v6 = 0;
    }
    v7 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.apple.trustd.networking.background"];
    [v7 setNetworkServiceType:3];
    [v7 setDiscretionary:1];
    [v7 set_requiresPowerPluggedIn:1];
    [v7 setAllowsCellularAccess:v6];
  }
  else
  {
    v7 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    [v7 setNetworkServiceType:0];
    [v7 setDiscretionary:0];
  }
  v10[0] = @"User-Agent";
  v10[1] = @"Accept";
  v11[0] = @"com.apple.trustd/3.0";
  v11[1] = @"*/*";
  v10[2] = @"Accept-Encoding";
  v11[2] = @"gzip,deflate,br";
  id v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  [v7 setHTTPAdditionalHeaders:v8];

  [v7 setTLSMinimumSupportedProtocol:8];
  [v7 setHTTPCookieStorage:0];
  [v7 setURLCache:0];

  return v7;
}

@end