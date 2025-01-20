@interface CAAPIHandler
- (CAAPIHandler)initWithURLString:(id)a3 queue:(id)a4 responseHandler:(id)a5;
- (NSOperationQueue)opQueue;
- (NSString)interfaceName;
- (NSString)userAgent;
- (NSURL)apiURL;
- (NSURLSessionDataTask)dataTask;
- (id)responseHandler;
- (unsigned)timeoutSeconds;
- (void)cancel;
- (void)fetchAPI;
- (void)sendResponseCode:(unsigned int)a3 dictionary:(id)a4;
- (void)setApiURL:(id)a3;
- (void)setDataTask:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setOpQueue:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setTimeoutSeconds:(unsigned int)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation CAAPIHandler

- (CAAPIHandler)initWithURLString:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CAAPIHandler;
  v11 = [(CAAPIHandler *)&v20 init];
  if (!v11)
  {
LABEL_4:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = +[NSURL URLWithString:v8];
  [(CAAPIHandler *)v11 setApiURL:v12];

  v13 = [(CAAPIHandler *)v11 apiURL];

  if (v13)
  {
    v14 = [(CAAPIHandler *)v11 apiURL];
    v15 = [v14 scheme];
    id v16 = [v15 compare:@"https" options:1];

    if (!v16)
    {
      id v17 = objc_alloc_init((Class)NSOperationQueue);
      [(CAAPIHandler *)v11 setOpQueue:v17];

      v18 = [(CAAPIHandler *)v11 opQueue];
      [v18 setUnderlyingQueue:v9];

      [(CAAPIHandler *)v11 setResponseHandler:v10];
      v13 = v11;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v13;
}

- (void)cancel
{
  id v2 = [(CAAPIHandler *)self dataTask];
  [v2 cancel];
}

- (void)sendResponseCode:(unsigned int)a3 dictionary:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  v6 = [(CAAPIHandler *)self responseHandler];

  if (v6)
  {
    v7 = [(CAAPIHandler *)self responseHandler];
    ((void (**)(void, uint64_t, id))v7)[2](v7, v4, v8);
  }
  [(CAAPIHandler *)self cancel];
}

- (void)fetchAPI
{
  v3 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  [v3 setHTTPCookieStorage:0];
  [v3 setURLCache:0];
  [v3 setURLCredentialStorage:0];
  uint64_t v4 = [(CAAPIHandler *)self opQueue];
  v5 = +[NSURLSession sessionWithConfiguration:v3 delegate:0 delegateQueue:v4];

  v6 = [(CAAPIHandler *)self apiURL];
  if ([(CAAPIHandler *)self timeoutSeconds]) {
    double v7 = (double)[(CAAPIHandler *)self timeoutSeconds];
  }
  else {
    double v7 = 60.0;
  }
  id v8 = +[NSMutableURLRequest requestWithURL:v6 cachePolicy:4 timeoutInterval:v7];

  [v8 setValue:@"application/captive+json" forHTTPHeaderField:@"Accept"];
  id v9 = [(CAAPIHandler *)self userAgent];
  [v8 setValue:v9 forHTTPHeaderField:@"User-Agent"];

  id v10 = [(CAAPIHandler *)self interfaceName];
  [v8 setBoundInterfaceIdentifier:v10];

  objc_initWeak(&location, self);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_10000AEF4;
  id v16 = &unk_100010A40;
  objc_copyWeak(&v17, &location);
  v11 = [v5 dataTaskWithRequest:v8 completionHandler:&v13];
  -[CAAPIHandler setDataTask:](self, "setDataTask:", v11, v13, v14, v15, v16);

  v12 = [(CAAPIHandler *)self dataTask];
  [v12 resume];

  [v5 finishTasksAndInvalidate];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (NSURL)apiURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApiURL:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInterfaceName:(id)a3
{
}

- (unsigned)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(unsigned int)a3
{
  self->_timeoutSeconds = a3;
}

- (NSOperationQueue)opQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOpQueue:(id)a3
{
}

- (NSURLSessionDataTask)dataTask
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDataTask:(id)a3
{
}

- (id)responseHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);

  objc_storeStrong((id *)&self->_apiURL, 0);
}

@end