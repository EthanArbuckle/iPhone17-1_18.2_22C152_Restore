@interface BAURLSession
- (BAURLSession)init;
- (BAURLSession)initWithResumeData:(id)a3 withDestinationDirectory:(id)a4 inBackground:(BOOL)a5 withAuthenticationHandler:(id)a6 withRedirectResponseHandler:(id)a7;
- (BAURLSession)initWithURLRequest:(id)a3 withDestinationDirectory:(id)a4 inBackground:(BOOL)a5;
- (BAURLSession)initWithURLRequest:(id)a3 withDestinationDirectory:(id)a4 inBackground:(BOOL)a5 withAuthenticationHandler:(id)a6;
- (BAURLSession)initWithURLRequest:(id)a3 withDestinationDirectory:(id)a4 inBackground:(BOOL)a5 withAuthenticationHandler:(id)a6 withRedirectResponseHandler:(id)a7;
- (BOOL)inBackground;
- (BOOL)useUniqueFileName;
- (NSData)resumeData;
- (NSLock)connectionLock;
- (NSString)destinationDirectory;
- (NSURLRequest)urlRequest;
- (NSURLSession)urlSession;
- (NSURLSessionDownloadTask)downloadTask;
- (_BAURLSessionDelegate)baURLSessionDelegate;
- (double)initialConnectivityTimeout;
- (id)_initWithURLRequest:(id)a3 withResumeData:(id)a4 withDestinationDirectory:(id)a5 inBackground:(BOOL)a6 withAuthenticationHandler:(id)a7 withRedirectResponseHandler:(id)a8;
- (void)cancel;
- (void)invalidate;
- (void)setBaURLSessionDelegate:(id)a3;
- (void)setConnectionLock:(id)a3;
- (void)setDestinationDirectory:(id)a3;
- (void)setDownloadTask:(id)a3;
- (void)setInBackground:(BOOL)a3;
- (void)setInitialConnectivityTimeout:(double)a3;
- (void)setResumeData:(id)a3;
- (void)setUrlRequest:(id)a3;
- (void)setUrlSession:(id)a3;
- (void)setUseUniqueFileName:(BOOL)a3;
- (void)startAsyncDownloadNotifyingOnQueue:(id)a3 sessionConfiguration:(id)a4 bytesReceivedHandler:(id)a5 completionHandler:(id)a6;
@end

@implementation BAURLSession

- (BAURLSession)init
{
  return 0;
}

- (BAURLSession)initWithURLRequest:(id)a3 withDestinationDirectory:(id)a4 inBackground:(BOOL)a5
{
  return [(BAURLSession *)self initWithURLRequest:a3 withDestinationDirectory:a4 inBackground:a5 withAuthenticationHandler:0 withRedirectResponseHandler:0];
}

- (BAURLSession)initWithURLRequest:(id)a3 withDestinationDirectory:(id)a4 inBackground:(BOOL)a5 withAuthenticationHandler:(id)a6
{
  return [(BAURLSession *)self initWithURLRequest:a3 withDestinationDirectory:a4 inBackground:a5 withAuthenticationHandler:a6 withRedirectResponseHandler:0];
}

- (BAURLSession)initWithURLRequest:(id)a3 withDestinationDirectory:(id)a4 inBackground:(BOOL)a5 withAuthenticationHandler:(id)a6 withRedirectResponseHandler:(id)a7
{
  return (BAURLSession *)[(BAURLSession *)self _initWithURLRequest:a3 withResumeData:0 withDestinationDirectory:a4 inBackground:a5 withAuthenticationHandler:a6 withRedirectResponseHandler:a7];
}

- (BAURLSession)initWithResumeData:(id)a3 withDestinationDirectory:(id)a4 inBackground:(BOOL)a5 withAuthenticationHandler:(id)a6 withRedirectResponseHandler:(id)a7
{
  return (BAURLSession *)[(BAURLSession *)self _initWithURLRequest:0 withResumeData:a3 withDestinationDirectory:a4 inBackground:a5 withAuthenticationHandler:a6 withRedirectResponseHandler:a7];
}

- (id)_initWithURLRequest:(id)a3 withResumeData:(id)a4 withDestinationDirectory:(id)a5 inBackground:(BOOL)a6 withAuthenticationHandler:(id)a7 withRedirectResponseHandler:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  v53.receiver = self;
  v53.super_class = (Class)BAURLSession;
  v20 = [(BAURLSession *)&v53 init];
  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v47 = a6;
      id v48 = a4;
      id v49 = v16;
      id v50 = v15;
      if (([v17 isFileURL] & 1) == 0)
      {
        v21 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Destination directory must be a file URL." userInfo:0];
        [v21 raise];
      }
      unsigned __int8 v52 = 0;
      v22 = +[NSFileManager defaultManager];
      v23 = [v17 path];
      v24 = [v23 stringByStandardizingPath];
      unsigned int v25 = [v22 fileExistsAtPath:v24 isDirectory:&v52];
      int v26 = v52;

      if (!v25 || v26)
      {
        v28 = +[NSFileManager defaultManager];
        v29 = [v17 path];
        v30 = [v29 stringByStandardizingPath];
        id v51 = 0;
        unsigned __int8 v31 = [v28 createDirectoryAtPath:v30 withIntermediateDirectories:1 attributes:0 error:&v51];
        id v46 = v51;

        if (v31)
        {
          v32 = [v17 path];
          uint64_t v33 = [v32 stringByStandardizingPath];
          destinationDirectory = v20->_destinationDirectory;
          v20->_destinationDirectory = (NSString *)v33;

          id v16 = v49;
          id v15 = v50;
          a4 = v48;
        }
        else
        {
          v35 = sub_1000196F4();
          uint64_t v36 = [v35 stringByAppendingPathComponent:@"BAURLSessionStaging"];
          v37 = v20->_destinationDirectory;
          v20->_destinationDirectory = (NSString *)v36;

          v38 = sub_100013C84();
          a4 = v48;
          id v16 = v49;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            sub_100039048((uint64_t)v46, v38);
          }

          id v15 = v50;
        }
        a6 = v47;
        v27 = v46;
      }
      else
      {
        v27 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Destination directory must exist and be a valid directory." userInfo:0];
        [v27 raise];
        id v16 = v49;
        id v15 = v50;
        a4 = v48;
        a6 = v47;
      }
    }
    uint64_t v39 = objc_opt_new();
    connectionLock = v20->_connectionLock;
    v20->_connectionLock = (NSLock *)v39;

    objc_storeStrong((id *)&v20->_urlRequest, a3);
    id v41 = [v18 copy];
    id challengeBlock = v20->_challengeBlock;
    v20->_id challengeBlock = v41;

    id v43 = [v19 copy];
    id redirectResponseBlock = v20->_redirectResponseBlock;
    v20->_id redirectResponseBlock = v43;

    v20->_inBackground = a6;
    objc_storeStrong((id *)&v20->_resumeData, a4);
  }

  return v20;
}

- (void)invalidate
{
  v3 = [(BAURLSession *)self connectionLock];
  [v3 lock];

  v4 = [(BAURLSession *)self urlSession];
  [v4 finishTasksAndInvalidate];

  id v5 = [(BAURLSession *)self connectionLock];
  [v5 unlock];
}

- (void)cancel
{
  v3 = [(BAURLSession *)self connectionLock];
  [v3 lock];

  v4 = [(BAURLSession *)self downloadTask];

  if (v4)
  {
    id v5 = [(BAURLSession *)self downloadTask];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100012428;
    v8[3] = &unk_10005CD38;
    v8[4] = self;
    [v5 cancelByProducingResumeData:v8];
  }
  else
  {
    id v5 = [(BAURLSession *)self baURLSessionDelegate];
    [v5 cancel];
  }

  v6 = [(BAURLSession *)self urlSession];
  [v6 invalidateAndCancel];

  [(BAURLSession *)self setUrlSession:0];
  v7 = [(BAURLSession *)self connectionLock];
  [v7 unlock];
}

- (void)startAsyncDownloadNotifyingOnQueue:(id)a3 sessionConfiguration:(id)a4 bytesReceivedHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v15 = v14;
  if (v10)
  {
    objc_super v53 = v14;
    id v16 = [(BAURLSession *)self connectionLock];
    [v16 lock];

    id v17 = [(BAURLSession *)self urlSession];
    [v17 invalidateAndCancel];

    [(BAURLSession *)self setUrlSession:0];
    [(BAURLSession *)self setBaURLSessionDelegate:0];
    [(BAURLSession *)self setDownloadTask:0];
    id v18 = [_BAURLSessionDelegate alloc];
    id v19 = [(BAURLSession *)self destinationDirectory];
    v20 = [(_BAURLSessionDelegate *)v18 initWithNotifyQueue:v10 withDestinationDirectory:v19 uniqueFileName:[(BAURLSession *)self useUniqueFileName] inBackground:self->_inBackground withAuthenticationHandler:self->_challengeBlock withRedirectResponseHandler:self->_redirectResponseBlock withBytesReceivedHandler:v12 usingBlock:v13];
    baURLSessionDelegate = self->_baURLSessionDelegate;
    self->_baURLSessionDelegate = v20;

    v22 = [(BAURLSession *)self baURLSessionDelegate];
    v23 = +[NSURLSession sessionWithConfiguration:v11 delegate:v22 delegateQueue:0];
    urlSession = self->_urlSession;
    self->_urlSession = v23;

    unsigned int v25 = [(BAURLSession *)self urlRequest];
    id v26 = [v25 copy];

    v27 = [(BAURLSession *)self connectionLock];
    [v27 unlock];

    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2020000000;
    char v62 = 0;
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_1000129C0;
    v54[3] = &unk_10005CD88;
    id v28 = v26;
    id v55 = v28;
    v58 = &v59;
    id v56 = v10;
    id v57 = v13;
    v29 = objc_retainBlock(v54);
    v30 = [(BAURLSession *)self urlSession];

    if (v30)
    {
      unsigned __int8 v31 = [(BAURLSession *)self connectionLock];
      [v31 lock];
      id v52 = v11;

      v32 = [(BAURLSession *)self resumeData];

      if (v32)
      {
        uint64_t v33 = [(BAURLSession *)self urlSession];
        v34 = [(BAURLSession *)self resumeData];
        v35 = [v33 downloadTaskWithResumeData:v34];
        downloadTask = self->_downloadTask;
        self->_downloadTask = v35;

        v37 = [(BAURLSession *)self downloadTask];

        if (!v37)
        {
          *((unsigned char *)v60 + 24) = 1;
          ((void (*)(void *))v29[2])(v29);
        }
        v38 = [(BAURLSession *)self downloadTask];
        [(BAURLSession *)self setResumeData:0];
      }
      else if (self->_inBackground {
             || ([(BAURLSession *)self destinationDirectory],
      }
                 v40 = objc_claimAutoreleasedReturnValue(),
                 v40,
                 v40))
      {
        id v41 = [(BAURLSession *)self urlSession];
        v42 = [v41 downloadTaskWithRequest:v28];
        id v43 = self->_downloadTask;
        self->_downloadTask = v42;

        v44 = [(BAURLSession *)self downloadTask];

        if (!v44)
        {
          *((unsigned char *)v60 + 24) = 1;
          ((void (*)(void *))v29[2])(v29);
        }
        v38 = [(BAURLSession *)self downloadTask];
      }
      else
      {
        id v51 = [(BAURLSession *)self urlSession];
        v38 = [v51 dataTaskWithRequest:v28];

        if (!v38)
        {
          *((unsigned char *)v60 + 24) = 1;
          ((void (*)(void *))v29[2])(v29);
        }
      }
      [(BAURLSession *)self initialConnectivityTimeout];
      if (v45 >= 0.0)
      {
        id v46 = [(BAURLSession *)self urlSession];
        BOOL v47 = [v46 configuration];
        unsigned int v48 = [v47 waitsForConnectivity];

        if (v48)
        {
          id v49 = [(BAURLSession *)self baURLSessionDelegate];
          [(BAURLSession *)self initialConnectivityTimeout];
          [v49 installConnectivityTimerWithTimeout:v38];
        }
      }
      [v38 resume];
      id v50 = [(BAURLSession *)self connectionLock];
      [v50 unlock];

      id v11 = v52;
    }
    else
    {
      [(BAURLSession *)self setBaURLSessionDelegate:0];
      ((void (*)(void *))v29[2])(v29);
    }

    _Block_object_dispose(&v59, 8);
    id v15 = v53;
  }
  else
  {
    uint64_t v39 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"A queue must be passed to _startAsyncDownloadNotifyingOnQueue:" userInfo:0];
    [v39 raise];
  }
}

- (BOOL)useUniqueFileName
{
  return self->_useUniqueFileName;
}

- (void)setUseUniqueFileName:(BOOL)a3
{
  self->_useUniqueFileName = a3;
}

- (double)initialConnectivityTimeout
{
  return self->_initialConnectivityTimeout;
}

- (void)setInitialConnectivityTimeout:(double)a3
{
  self->_initialConnectivityTimeout = a3;
}

- (NSLock)connectionLock
{
  return (NSLock *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConnectionLock:(id)a3
{
}

- (NSURLSession)urlSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUrlSession:(id)a3
{
}

- (NSURLSessionDownloadTask)downloadTask
{
  return (NSURLSessionDownloadTask *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDownloadTask:(id)a3
{
}

- (_BAURLSessionDelegate)baURLSessionDelegate
{
  return (_BAURLSessionDelegate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBaURLSessionDelegate:(id)a3
{
}

- (NSData)resumeData
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setResumeData:(id)a3
{
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (void)setUrlRequest:(id)a3
{
}

- (NSString)destinationDirectory
{
  return self->_destinationDirectory;
}

- (void)setDestinationDirectory:(id)a3
{
}

- (BOOL)inBackground
{
  return self->_inBackground;
}

- (void)setInBackground:(BOOL)a3
{
  self->_inBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationDirectory, 0);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_baURLSessionDelegate, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong(&self->_redirectResponseBlock, 0);

  objc_storeStrong(&self->_challengeBlock, 0);
}

@end