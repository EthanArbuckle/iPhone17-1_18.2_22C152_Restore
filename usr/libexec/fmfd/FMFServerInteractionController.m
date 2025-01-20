@interface FMFServerInteractionController
- (FMFServerInteractionController)init;
- (NSHTTPCookieStorage)cookieStorage;
- (OpaqueCFHTTPCookieStorage)cookieStorageRef;
- (double)lastSuccessfulResponseTimestamp;
- (id)session;
- (id)sessionConfiguration;
- (void)dealloc;
- (void)preflightValidateCommand:(id)a3;
- (void)processResponseForCommand:(id)a3 callback:(id)a4;
- (void)sendCommand:(id)a3 completionBlock:(id)a4;
- (void)setCookieStorage:(id)a3;
- (void)setCookieStorageRef:(OpaqueCFHTTPCookieStorage *)a3;
- (void)setLastSuccessfulResponseTimestamp:(double)a3;
- (void)setSession:(id)a3;
@end

@implementation FMFServerInteractionController

- (void)dealloc
{
  session = self->_session;
  if (session)
  {
    [(NSURLSession *)session invalidateAndCancel];
    v4 = self->_session;
    self->_session = 0;
  }
  v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFServerInteractionController dealloc: %@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)FMFServerInteractionController;
  [(FMFServerInteractionController *)&v6 dealloc];
}

- (FMFServerInteractionController)init
{
  v3.receiver = self;
  v3.super_class = (Class)FMFServerInteractionController;
  return [(FMFServerInteractionController *)&v3 init];
}

- (id)session
{
  session = self->_session;
  if (!session)
  {
    v4 = [(FMFServerInteractionController *)self sessionConfiguration];
    v5 = [(FMFServerInteractionController *)self queue];
    objc_super v6 = +[NSURLSession sessionWithConfiguration:v4 delegate:self delegateQueue:v5];
    v7 = self->_session;
    self->_session = v6;

    v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_session;
      int v12 = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Where is my session: %@", (uint8_t *)&v12, 0xCu);
    }

    session = self->_session;
  }
  v10 = session;

  return v10;
}

- (id)sessionConfiguration
{
  v2 = +[NSBundle mainBundle];
  objc_super v3 = [v2 bundleIdentifier];

  id v4 = [objc_alloc((Class)AKAppleIDSession) initWithIdentifier:v3];
  v5 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  [v5 setURLCache:0];
  [v5 setHTTPCookieStorage:0];
  [v5 setHTTPCookieAcceptPolicy:1];
  [v5 setURLCredentialStorage:0];
  [v5 setRequestCachePolicy:1];
  [v5 set_appleIDContext:v4];

  return v5;
}

- (void)preflightValidateCommand:(id)a3
{
  id v3 = a3;
  id v4 = +[FMFAccountManager sharedInstance];
  unsigned __int8 v5 = [v4 hasFirstUnlocked];

  if ((v5 & 1) == 0)
  {
    v16 = +[NSError errorWithDomain:FMFErrorDomain code:1010 userInfo:0];
    [v3 setError:v16];

    v15 = sub_100005560();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10006B514();
    }
    goto LABEL_20;
  }
  objc_super v6 = [v3 username];

  if (!v6)
  {
    v17 = +[NSError errorWithDomain:FMFErrorDomain code:1000 userInfo:0];
    [v3 setError:v17];

    v15 = sub_100005560();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10006B2EC();
    }
    goto LABEL_20;
  }
  v7 = [v3 password];

  id v8 = [v3 isUserAction];
  id v9 = v8;
  if (!v7)
  {
    v18 = sub_100005560();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10006B3BC();
    }

    v19 = +[FMFAccountManager sharedInstance];
    [v19 updateAccountCredentials:v9];

    v20 = +[NSError errorWithDomain:FMFErrorDomain code:1001 userInfo:0];
    [v3 setError:v20];

    v15 = sub_100005560();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10006B354();
    }
    goto LABEL_20;
  }
  if ((v8 & 1) == 0)
  {
    v10 = +[FMFAccountManager sharedInstance];
    unsigned __int8 v11 = [v10 isAccountAuthorized];

    if ((v11 & 1) == 0)
    {
      v21 = +[NSError errorWithDomain:FMFErrorDomain code:1003 userInfo:0];
      [v3 setError:v21];

      v15 = sub_100005560();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10006B4AC();
      }
      goto LABEL_20;
    }
  }
  if (([v3 isUserAction] & 1) == 0)
  {
    int v12 = +[FMFCommandManager sharedInstance];
    unsigned int v13 = [v12 isIn5XXGracePeriod];

    if (v13)
    {
      v14 = +[NSError errorWithDomain:FMFErrorDomain code:1006 userInfo:0];
      [v3 setError:v14];

      v15 = sub_100005560();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10006B444();
      }
LABEL_20:
    }
  }
}

- (void)sendCommand:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  [(FMFServerInteractionController *)self preflightValidateCommand:v6];
  id v8 = [v6 error];

  if (v8)
  {
    v7[2](v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)FMFServerInteractionController;
    [(FMFServerInteractionController *)&v9 sendCommand:v6 completionBlock:v7];
  }
}

- (void)processResponseForCommand:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[FMXPCTransactionManager sharedInstance];
  [v8 beginTransaction:@"fmfCommandResponseTransactionIdentifier"];

  objc_super v9 = +[NSDate date];
  [v9 timeIntervalSince1970];
  -[FMFServerInteractionController setLastSuccessfulResponseTimestamp:](self, "setLastSuccessfulResponseTimestamp:");

  v10 = +[FMFXPCSessionManager sharedInstance];
  [v10 resetRefreshTimer];

  if ([v6 wasRedirected])
  {
    unsigned __int8 v11 = [v6 redirectedHostname];
    int v12 = +[FMFAccountManager sharedInstance];
    unsigned int v13 = [v12 account];
    [v13 setFmfAppHostName:v11];
  }
  v15 = [v6 jsonResponseDictionary];
  [v6 processCommandResponse:v15];

  v16 = +[FMFDataManager sharedInstance];
  [v16 digestCommand:v6];

  v17 = +[FMFHeartbeatManager sharedInstance];
  [v17 updateHeartbeat];

  if ([v6 wasSuccessful])
  {
    v18 = +[FMFAccountManager sharedInstance];
    [v18 setAccountStateAuthorizedDueTo401];

    v19 = +[FMFCommandManager sharedInstance];
    [v19 exit5XXGracePeriod];

    v20 = +[FMFAccountManager sharedInstance];
    [v20 setRetryAfterRenewCount:0];
  }
  v22.receiver = self;
  v22.super_class = (Class)FMFServerInteractionController;
  [(FMFServerInteractionController *)&v22 processResponseForCommand:v6 callback:v7];
  v21 = +[FMXPCTransactionManager sharedInstance];
  [v21 endTransaction:@"fmfCommandResponseTransactionIdentifier"];
}

- (void)setSession:(id)a3
{
}

- (double)lastSuccessfulResponseTimestamp
{
  return self->_lastSuccessfulResponseTimestamp;
}

- (void)setLastSuccessfulResponseTimestamp:(double)a3
{
  self->_lastSuccessfulResponseTimestamp = a3;
}

- (NSHTTPCookieStorage)cookieStorage
{
  return self->_cookieStorage;
}

- (void)setCookieStorage:(id)a3
{
}

- (OpaqueCFHTTPCookieStorage)cookieStorageRef
{
  return self->_cookieStorageRef;
}

- (void)setCookieStorageRef:(OpaqueCFHTTPCookieStorage *)a3
{
  self->_cookieStorageRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cookieStorage, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end