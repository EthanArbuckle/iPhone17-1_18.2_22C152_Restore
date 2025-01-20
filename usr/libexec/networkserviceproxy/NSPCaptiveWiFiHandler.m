@interface NSPCaptiveWiFiHandler
+ (id)sharedHandler;
- (BOOL)evaluate:(id)a3 completionHandler:(id)a4;
- (void)abort;
@end

@implementation NSPCaptiveWiFiHandler

+ (id)sharedHandler
{
  if (qword_100123310 != -1) {
    dispatch_once(&qword_100123310, &stru_1001072A0);
  }
  v2 = (void *)qword_100123308;

  return v2;
}

- (BOOL)evaluate:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (!v9)
  {

    goto LABEL_5;
  }
  if (!v9->_isRunning)
  {
    id v11 = v7;
    id v12 = v8;
    v13 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    v14 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v9->_operationQueue;
    v9->_operationQueue = v14;

    v16 = NPGetInternalQueue();
    [(NSOperationQueue *)v9->_operationQueue setUnderlyingQueue:v16];

    uint64_t v17 = +[NSURLSession sessionWithConfiguration:v13 delegate:0 delegateQueue:v9->_operationQueue];
    urlSession = v9->_urlSession;
    v9->_urlSession = (NSURLSession *)v17;

    [(NSURLSession *)v9->_urlSession setSessionDescription:@"PrivacyProxyCaptiveProbe"];
    id v19 = objc_retainBlock(v12);

    id completionHandler = v9->_completionHandler;
    v9->_id completionHandler = v19;

    objc_storeStrong((id *)&v9->_interfaceName, a3);
    v9->_isRunning = 1;

    objc_initWeak(&location, v9);
    v21 = +[NSURL URLWithString:@"http://netcts.cdn-apple.com"];
    v22 = +[NSMutableURLRequest requestWithURL:v21 cachePolicy:4 timeoutInterval:10.0];
    [v22 setBoundInterfaceIdentifier:v9->_interfaceName];
    v23 = v9->_urlSession;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000BC748;
    v27[3] = &unk_1001072C8;
    objc_copyWeak(&v28, &location);
    v27[4] = v9;
    uint64_t v24 = [(NSURLSession *)v23 dataTaskWithRequest:v22 completionHandler:v27];
    dataTask = v9->_dataTask;
    v9->_dataTask = (NSURLSessionDataTask *)v24;

    [(NSURLSessionDataTask *)v9->_dataTask resume];
    [(NSURLSession *)v9->_urlSession finishTasksAndInvalidate];
    objc_destroyWeak(&v28);

    objc_destroyWeak(&location);
LABEL_5:
    BOOL v10 = 1;
    goto LABEL_6;
  }
  BOOL v10 = 0;
LABEL_6:
  objc_sync_exit(v9);

  return v10;
}

- (void)abort
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);

  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end