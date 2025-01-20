@interface NDODownloader
- (NDODownloader)initWithURL:(id)a3 callingProcessBundleID:(id)a4 sessionID:(id)a5;
- (NSMutableURLRequest)request;
- (NSString)callingProcessBundleID;
- (NSString)sessionID;
- (int)retries;
- (void)downloadWithRetryCount:(int)a3 prepareBlock:(id)a4 completion:(id)a5;
- (void)setCallingProcessBundleID:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRetries:(int)a3;
- (void)setSessionID:(id)a3;
@end

@implementation NDODownloader

- (NDODownloader)initWithURL:(id)a3 callingProcessBundleID:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = _NDOLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138477827;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "initWithURL %{private}@", (uint8_t *)&v16, 0xCu);
  }

  [(NDODownloader *)self setSessionID:v9];
  [(NDODownloader *)self setCallingProcessBundleID:v10];
  v12 = +[NSMutableURLRequest requestWithURL:v8];
  [(NDODownloader *)self setRequest:v12];

  v13 = [(NDODownloader *)self request];
  [v13 setTimeoutInterval:30.0];

  v14 = [(NDODownloader *)self request];
  objc_msgSend(v14, "ndo_addBasicHeadersWithBundleID:", v10);

  return self;
}

- (void)downloadWithRetryCount:(int)a3 prepareBlock:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void *))a4;
  id v9 = a5;
  id v10 = [(NDODownloader *)self request];
  unsigned int v11 = objc_msgSend(v10, "ndo_signWithAccountHeaders:avoidUI:", a3 != 2, 1);

  v12 = _NDOLogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Retrying request:", buf, 2u);
    }

    v14 = +[NSURLSession sharedSession];
    v15 = [(NDODownloader *)self callingProcessBundleID];
    int v16 = [v14 configuration];
    objc_msgSend(v16, "set_sourceApplicationBundleIdentifier:", v15);

    id v17 = [v14 configuration];
    [v17 setTimeoutIntervalForRequest:30.0];

    v18 = [v14 configuration];
    [v18 setTimeoutIntervalForResource:30.0];

    v19 = [(NDODownloader *)self sessionID];

    if (v19)
    {
      v20 = [(NDODownloader *)self request];
      v21 = [(NDODownloader *)self sessionID];
      [v20 setValue:v21 forHTTPHeaderField:@"x-apple-session"];
    }
    v22 = [(NDODownloader *)self request];
    v8[2](v8, v22);

    v23 = _NDOLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [(NDODownloader *)self request];
      v25 = [v24 headerDescription];
      *(_DWORD *)buf = 138412290;
      v41 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Headers: %@", buf, 0xCu);
    }
    v26 = _NDOLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(NDODownloader *)self request];
      v28 = [v27 bodyDescription];
      *(_DWORD *)buf = 138412290;
      v41 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Body: %@", buf, 0xCu);
    }
    v29 = _NDOLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Starting request", buf, 2u);
    }

    v30 = [(NDODownloader *)self request];
    v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    v34 = sub_10000AF9C;
    v35 = &unk_10001CA88;
    int v39 = a3;
    v36 = self;
    id v37 = v9;
    v38 = v8;
    v31 = [v14 dataTaskWithRequest:v30 completionHandler:&v32];

    objc_msgSend(v31, "resume", v32, v33, v34, v35, v36);
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to load sign request, failing warranty download", buf, 2u);
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

- (int)retries
{
  return self->_retries;
}

- (void)setRetries:(int)a3
{
  self->_retries = a3;
}

- (NSMutableURLRequest)request
{
  return (NSMutableURLRequest *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSessionID:(id)a3
{
}

- (NSString)callingProcessBundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCallingProcessBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callingProcessBundleID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end