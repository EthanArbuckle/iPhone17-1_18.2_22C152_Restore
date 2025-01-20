@interface _BAURLSessionDelegate
- (BAFileHandle)fileHandle;
- (BOOL)inBackground;
- (BOOL)taskCompleted;
- (BOOL)uniqueFileName;
- (NSData)resumeData;
- (NSError)mostRecentError;
- (NSMutableData)data;
- (NSURLResponse)response;
- (OS_dispatch_source)awaitingConnectivityTimer;
- (_BAURLSessionDelegate)initWithNotifyQueue:(id)a3 withDestinationDirectory:(id)a4 uniqueFileName:(BOOL)a5 inBackground:(BOOL)a6 withAuthenticationHandler:(id)a7 withRedirectResponseHandler:(id)a8 withBytesReceivedHandler:(id)a9 usingBlock:(id)a10;
- (double)awaitingConnectivityTimeout;
- (id)_combineExistingError:(id)a3 newError:(id)a4;
- (int64_t)fullDownloadSize;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4;
- (void)cancel;
- (void)cancelWithResumeData:(id)a3;
- (void)installConnectivityTimerWithTimeout:(double)a3 task:(id)a4;
- (void)setAwaitingConnectivityTimeout:(double)a3;
- (void)setAwaitingConnectivityTimer:(id)a3;
- (void)setData:(id)a3;
- (void)setFileHandle:(id)a3;
- (void)setFullDownloadSize:(int64_t)a3;
- (void)setInBackground:(BOOL)a3;
- (void)setMostRecentError:(id)a3;
- (void)setResponse:(id)a3;
- (void)setResumeData:(id)a3;
- (void)setTaskCompleted:(BOOL)a3;
- (void)setUniqueFileName:(BOOL)a3;
@end

@implementation _BAURLSessionDelegate

- (_BAURLSessionDelegate)initWithNotifyQueue:(id)a3 withDestinationDirectory:(id)a4 uniqueFileName:(BOOL)a5 inBackground:(BOOL)a6 withAuthenticationHandler:(id)a7 withRedirectResponseHandler:(id)a8 withBytesReceivedHandler:(id)a9 usingBlock:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v39.receiver = self;
  v39.super_class = (Class)_BAURLSessionDelegate;
  v22 = [(_BAURLSessionDelegate *)&v39 init];
  if (v22)
  {
    if (v16)
    {
      v23 = (OS_dispatch_queue *)v16;
      notifyQueue = v22->_notifyQueue;
      v22->_notifyQueue = v23;
    }
    else
    {
      qos_class_t v25 = qos_class_self();
      notifyQueue = dispatch_queue_attr_make_with_qos_class(0, v25, 0);
      dispatch_queue_t v26 = dispatch_queue_create("com.apple.BackgroundAssets.BAURLSession.DefaultNotifyQueue", notifyQueue);
      v27 = v22->_notifyQueue;
      v22->_notifyQueue = (OS_dispatch_queue *)v26;
    }
    v22->_stateLock._os_unfair_lock_opaque = 0;
    v28 = (NSString *)[v17 copy];
    destinationDirectory = v22->_destinationDirectory;
    v22->_destinationDirectory = v28;

    v22->_uniqueFileName = a5;
    id v30 = [v21 copy];
    id notifyBlock = v22->_notifyBlock;
    v22->_id notifyBlock = v30;

    id v32 = [v18 copy];
    id challengeBlock = v22->_challengeBlock;
    v22->_id challengeBlock = v32;

    id v34 = [v19 copy];
    id redirectResponseBlock = v22->_redirectResponseBlock;
    v22->_id redirectResponseBlock = v34;

    id v36 = [v20 copy];
    id bytesReceivedBlock = v22->_bytesReceivedBlock;
    v22->_id bytesReceivedBlock = v36;

    v22->_inBackground = a6;
  }

  return v22;
}

- (void)cancel
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = +[NSError errorWithDomain:NSURLErrorDomain code:-999 userInfo:0];
  [(_BAURLSessionDelegate *)self setMostRecentError:v4];

  os_unfair_lock_unlock(p_stateLock);
}

- (void)cancelWithResumeData:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = +[NSError errorWithDomain:NSURLErrorDomain code:-999 userInfo:0];
  [(_BAURLSessionDelegate *)self setMostRecentError:v4];

  [(_BAURLSessionDelegate *)self setResumeData:v5];
  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)installConnectivityTimerWithTimeout:(double)a3 task:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  v7 = [(_BAURLSessionDelegate *)self awaitingConnectivityTimer];

  if (v7)
  {
    v8 = [(_BAURLSessionDelegate *)self awaitingConnectivityTimer];
    dispatch_source_cancel(v8);

    [(_BAURLSessionDelegate *)self setAwaitingConnectivityTimer:0];
  }
  v9 = dispatch_queue_create("com.apple.BAURLSession.TimeOutQueue", 0);
  v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v9);
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10000FF44;
  id v17 = &unk_10005CC48;
  id v18 = self;
  id v19 = v10;
  id v20 = v6;
  double v21 = a3;
  id v12 = v6;
  v13 = v10;
  dispatch_source_set_event_handler(v13, &v14);
  -[_BAURLSessionDelegate setAwaitingConnectivityTimeout:](self, "setAwaitingConnectivityTimeout:", a3, v14, v15, v16, v17, v18);
  [(_BAURLSessionDelegate *)self setAwaitingConnectivityTimer:v13];
  dispatch_resume(v13);
  os_unfair_lock_unlock(&self->_stateLock);
}

- (id)_combineExistingError:(id)a3 newError:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    id v7 = a3;
    v8 = [v7 userInfo];
    id v9 = [v8 mutableCopy];

    if (v6) {
      [v9 setObject:v6 forKeyedSubscript:NSUnderlyingErrorKey];
    }
    v10 = [v7 domain];
    id v11 = [v7 code];

    id v12 = [v9 copy];
    id v13 = +[NSError errorWithDomain:v10 code:v11 userInfo:v12];
  }
  else
  {
    id v13 = v5;
  }

  return v13;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  id v7 = [(_BAURLSessionDelegate *)self awaitingConnectivityTimer];

  if (v7)
  {
    v8 = [(_BAURLSessionDelegate *)self awaitingConnectivityTimer];
    dispatch_source_cancel(v8);

    [(_BAURLSessionDelegate *)self setAwaitingConnectivityTimer:0];
  }
  id v9 = [(_BAURLSessionDelegate *)self mostRecentError];
  if (v6)
  {
    v10 = [(_BAURLSessionDelegate *)self mostRecentError];
    if (v10)
    {
      id v11 = [(_BAURLSessionDelegate *)self mostRecentError];
      if (!v11)
      {
LABEL_8:

        goto LABEL_9;
      }
      id v12 = [(_BAURLSessionDelegate *)self mostRecentError];
      id v13 = [v12 userInfo];
      v14 = [v13 objectForKey:NSUnderlyingErrorKey];

      if (v14) {
        goto LABEL_9;
      }
    }
    v10 = [(_BAURLSessionDelegate *)self mostRecentError];
    uint64_t v15 = [(_BAURLSessionDelegate *)self _combineExistingError:v10 newError:v6];

    id v9 = (void *)v15;
    goto LABEL_8;
  }
LABEL_9:
  id v16 = [(_BAURLSessionDelegate *)self data];
  id v17 = [(_BAURLSessionDelegate *)self response];
  id v18 = [(_BAURLSessionDelegate *)self resumeData];
  id v19 = [(_BAURLSessionDelegate *)self fileHandle];

  if (v19)
  {
    id v20 = [(_BAURLSessionDelegate *)self fileHandle];
    double v21 = [v20 filePath];
    v22 = +[NSURL fileURLWithPath:v21];

    v23 = [(_BAURLSessionDelegate *)self fileHandle];
    v24 = [v23 handle];
    id v34 = 0;
    [v24 synchronizeAndReturnError:&v34];
    id v25 = v34;

    [(_BAURLSessionDelegate *)self setFileHandle:0];
  }
  else
  {
    v22 = 0;
  }
  if (self->_notifyBlock)
  {
    notifyQueue = self->_notifyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000104C8;
    block[3] = &unk_10005CC70;
    block[4] = self;
    id v29 = v22;
    id v30 = v16;
    id v31 = v17;
    id v32 = v18;
    id v33 = v9;
    dispatch_async(notifyQueue, block);
  }
  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v17 = a4;
  id v8 = a5;
  id v9 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  v10 = [v17 response];
  [(_BAURLSessionDelegate *)self setResponse:v10];

  id v11 = [(_BAURLSessionDelegate *)self awaitingConnectivityTimer];

  if (v11)
  {
    id v12 = [(_BAURLSessionDelegate *)self awaitingConnectivityTimer];
    dispatch_source_cancel(v12);

    [(_BAURLSessionDelegate *)self setAwaitingConnectivityTimer:0];
  }
  if (v8)
  {
    id v13 = [(_BAURLSessionDelegate *)self mostRecentError];
    v14 = [(_BAURLSessionDelegate *)self _combineExistingError:v13 newError:v8];
    [(_BAURLSessionDelegate *)self setMostRecentError:v14];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v8 userInfo];
      id v16 = [v15 objectForKey:NSURLSessionDownloadTaskResumeData];

      if (v16) {
        [(_BAURLSessionDelegate *)self setResumeData:v16];
      }
    }
  }
  os_unfair_lock_unlock(&self->_stateLock);
  [v9 finishTasksAndInvalidate];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = (NSString *)v12;
    uint64_t v15 = (uint64_t)[(NSString *)v14 statusCode];
    if (v15 >= 400)
    {
      uint64_t v29 = v15;
      id v42 = v10;
      os_unfair_lock_lock(&self->_stateLock);
      [(_BAURLSessionDelegate *)self setResponse:v14];
      v44[0] = NSURLErrorFailingURLStringErrorKey;
      id v30 = [(NSString *)v14 URL];
      [v30 absoluteString];
      id v32 = v31 = v13;
      v45[0] = v32;
      v44[1] = @"ResponseStatusCode";
      id v33 = +[NSNumber numberWithInteger:v29];
      v45[1] = v33;
      v44[2] = @"ResponseHTTPHeaders";
      id v34 = [(NSString *)v14 allHeaderFields];
      v45[2] = v34;
      id v20 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];

      id v13 = v31;
      v35 = +[NSError errorWithDomain:@"BAURLSessionErrorDomain" code:100 userInfo:v20];
      [(_BAURLSessionDelegate *)self setMostRecentError:v35];

      id v10 = v42;
      os_unfair_lock_unlock(&self->_stateLock);
      v13[2](v13, 0);
LABEL_17:

      goto LABEL_21;
    }
  }
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  [(_BAURLSessionDelegate *)self setResponse:v12];
  -[_BAURLSessionDelegate setFullDownloadSize:](self, "setFullDownloadSize:", [v12 expectedContentLength]);
  v14 = self->_destinationDirectory;
  if (v14)
  {
    os_unfair_lock_t lock = &self->_stateLock;
    id v40 = v12;
    id v41 = v10;
    id v17 = [v11 currentRequest];
    id v18 = [v17 URL];
    uint64_t v19 = [v18 lastPathComponent];
    id v20 = (id)v19;
    while (1)
    {
      double v21 = [(NSString *)v14 stringByAppendingPathComponent:v19];

      int v22 = [(_BAURLSessionDelegate *)self uniqueFileName] ? 3586 : 1538;
      id v20 = v21;
      uint64_t v23 = open((const char *)[v20 fileSystemRepresentation], v22, 420);
      if ((v23 & 0x80000000) == 0) {
        break;
      }
      if (*__error() != 17 || ![(_BAURLSessionDelegate *)self uniqueFileName])
      {
        id v27 = +[NSError errorWithDomain:@"BAURLSessionErrorDomain" code:101 userInfo:0];
        [(_BAURLSessionDelegate *)self setMostRecentError:v27];

        os_unfair_lock_unlock(lock);
        v13[2](v13, 0);
        id v10 = v41;
LABEL_14:
        id v12 = v40;
        goto LABEL_17;
      }
      v24 = +[NSUUID UUID];
      id v25 = [v24 UUIDString];
      dispatch_queue_t v26 = [v25 substringToIndex:8];
      id v17 = +[NSString stringWithFormat:@"BAUnique-%@", v26];

      uint64_t v19 = [v17 stringByAppendingPathExtension:@"dat"];
      id v18 = (void *)v19;
    }
    uint64_t v36 = v23;
    memset(&v43, 0, sizeof(v43));
    id v10 = v41;
    if (fstat(v23, &v43) < 0)
    {
      v38 = +[NSError errorWithDomain:@"BAURLSessionErrorDomain" code:102 userInfo:0];
      [(_BAURLSessionDelegate *)self setMostRecentError:v38];

      os_unfair_lock_unlock(lock);
      close(v36);
      v13[2](v13, 0);
      goto LABEL_14;
    }
    v37 = [[BAFileHandle alloc] initWithFileDescriptor:v36 originalPath:v20 closeOnDealloc:1];
    [(_BAURLSessionDelegate *)self setFileHandle:v37];

    id v12 = v40;
    p_stateLock = &self->_stateLock;
  }
  else
  {
    v28 = +[NSMutableData data];
    [(_BAURLSessionDelegate *)self setData:v28];
  }
  os_unfair_lock_unlock(p_stateLock);
  v13[2](v13, 1);
LABEL_21:
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v55 = a3;
  id v8 = a4;
  id v9 = a5;
  v56 = v8;
  v57 = [v8 response];
  os_unfair_lock_lock(&self->_stateLock);
  [(_BAURLSessionDelegate *)self setResponse:v57];
  id v10 = self->_destinationDirectory;
  unsigned int v11 = [(_BAURLSessionDelegate *)self uniqueFileName];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v57;
    uint64_t v13 = (uint64_t)[v12 statusCode];
    if (v13 >= 400)
    {
      uint64_t v35 = v13;
      v54 = v10;
      v65[0] = NSURLErrorFailingURLStringErrorKey;
      uint64_t v36 = [v12 URL];
      v37 = [v36 absoluteString];
      v66[0] = v37;
      v65[1] = @"ResponseStatusCode";
      v38 = +[NSNumber numberWithInteger:v35];
      v66[1] = v38;
      v65[2] = @"ResponseHTTPHeaders";
      objc_super v39 = [v12 allHeaderFields];
      v66[2] = v39;
      id v40 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];

      id v41 = +[NSError errorWithDomain:@"BAURLSessionErrorDomain" code:100 userInfo:v40];
      [(_BAURLSessionDelegate *)self setMostRecentError:v41];

      os_unfair_lock_unlock(&self->_stateLock);
      goto LABEL_30;
    }
  }
  os_unfair_lock_unlock(&self->_stateLock);
  if (!v9 || !v10)
  {
    if (v9)
    {
      id v58 = 0;
      id v32 = +[NSData dataWithContentsOfURL:v9 options:8 error:&v58];
      id v33 = v58;
      if (v32)
      {
        id v34 = +[NSFileManager defaultManager];
        [v34 removeItemAtURL:v9 error:0];

        os_unfair_lock_lock(&self->_stateLock);
        [(_BAURLSessionDelegate *)self setData:v32];
      }
      else
      {
        os_unfair_lock_lock(&self->_stateLock);
        [(_BAURLSessionDelegate *)self setMostRecentError:v33];
      }
      os_unfair_lock_unlock(&self->_stateLock);
    }
    else
    {
      os_unfair_lock_lock(&self->_stateLock);
      v49 = +[NSError errorWithDomain:@"BAURLSessionErrorDomain" code:105 userInfo:0];
      [(_BAURLSessionDelegate *)self setMostRecentError:v49];

      os_unfair_lock_unlock(&self->_stateLock);
    }
    goto LABEL_31;
  }
  v54 = v10;
  v14 = [v56 currentRequest];
  uint64_t v15 = [v14 URL];
  id v16 = [v15 lastPathComponent];
  id v17 = [(NSString *)v54 stringByAppendingPathComponent:v16];

  while (1)
  {
    while (1)
    {
      id v18 = +[NSFileManager defaultManager];
      unsigned int v19 = [v18 fileExistsAtPath:v17];

      if (!v19) {
        goto LABEL_11;
      }
      if (!v11) {
        break;
      }
      dispatch_queue_t v26 = +[NSUUID UUID];
      id v27 = [v26 UUIDString];
      v28 = [v27 substringToIndex:8];
      uint64_t v29 = +[NSString stringWithFormat:@"BAUnique-%@", v28];

      id v30 = [v29 stringByAppendingPathExtension:@"dat"];
      uint64_t v31 = [(NSString *)v54 stringByAppendingPathComponent:v30];

      id v17 = (void *)v31;
    }
    id v20 = +[NSFileManager defaultManager];
    id v60 = 0;
    unsigned __int8 v21 = [v20 removeItemAtPath:v17 error:&v60];
    id v22 = v60;

    if ((v21 & 1) == 0)
    {
      os_unfair_lock_lock(&self->_stateLock);
      NSErrorUserInfoKey v63 = NSUnderlyingErrorKey;
      id v64 = v22;
      v50 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      v51 = +[NSError errorWithDomain:@"BAURLSessionErrorDomain" code:104 userInfo:v50];
      [(_BAURLSessionDelegate *)self setMostRecentError:v51];

      os_unfair_lock_unlock(&self->_stateLock);
      goto LABEL_29;
    }

LABEL_11:
    uint64_t v23 = (const char *)[v9 fileSystemRepresentation];
    id v24 = v17;
    if (!renamex_np(v23, (const char *)[v24 fileSystemRepresentation], 4u)) {
      break;
    }
    uint64_t v25 = *__error();
    if (v25 != 17)
    {
      os_unfair_lock_lock(&self->_stateLock);
      v46 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v25 userInfo:0];
      NSErrorUserInfoKey v61 = NSUnderlyingErrorKey;
      v62 = v46;
      v47 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      v48 = +[NSError errorWithDomain:@"BAURLSessionErrorDomain" code:103 userInfo:v47];
      [(_BAURLSessionDelegate *)self setMostRecentError:v48];

      goto LABEL_28;
    }
  }
  id v42 = v24;
  uint64_t v43 = open((const char *)[v42 fileSystemRepresentation], 0, 420);
  uint64_t v44 = v43;
  if ((v43 & 0x80000000) != 0)
  {
    os_unfair_lock_lock(&self->_stateLock);
    v52 = +[NSError errorWithDomain:@"BAURLSessionErrorDomain" code:101 userInfo:0];
    [(_BAURLSessionDelegate *)self setMostRecentError:v52];
  }
  else
  {
    memset(&v59, 0, sizeof(v59));
    if ((fstat(v43, &v59) & 0x80000000) == 0)
    {
      os_unfair_lock_lock(&self->_stateLock);
      v45 = [[BAFileHandle alloc] initWithFileDescriptor:v44 originalPath:v42 closeOnDealloc:1];
      [(_BAURLSessionDelegate *)self setFileHandle:v45];

      os_unfair_lock_unlock(&self->_stateLock);
      goto LABEL_30;
    }
    close(v44);
    os_unfair_lock_lock(&self->_stateLock);
    v53 = +[NSError errorWithDomain:@"BAURLSessionErrorDomain" code:102 userInfo:0];
    [(_BAURLSessionDelegate *)self setMostRecentError:v53];
  }
LABEL_28:
  os_unfair_lock_unlock(&self->_stateLock);
LABEL_29:

LABEL_30:
  id v10 = v54;
LABEL_31:
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a5;
  os_unfair_lock_lock(&self->_stateLock);
  id v7 = [(_BAURLSessionDelegate *)self awaitingConnectivityTimer];

  if (v7)
  {
    id v8 = [(_BAURLSessionDelegate *)self awaitingConnectivityTimer];
    dispatch_source_cancel(v8);

    [(_BAURLSessionDelegate *)self setAwaitingConnectivityTimer:0];
  }
  id v9 = [v6 length];
  id v10 = [(_BAURLSessionDelegate *)self fileHandle];

  if (v10)
  {
    unsigned int v11 = [(_BAURLSessionDelegate *)self fileHandle];
    id v12 = [v11 handle];
    [v12 writeData:v6];

    uint64_t v13 = [(_BAURLSessionDelegate *)self fileHandle];
    v14 = [v13 handle];
    id v15 = [v14 offsetInFile];
  }
  else
  {
    id v16 = [(_BAURLSessionDelegate *)self data];
    [v16 appendData:v6];

    uint64_t v13 = [(_BAURLSessionDelegate *)self data];
    id v15 = [v13 length];
  }

  int64_t v17 = [(_BAURLSessionDelegate *)self fullDownloadSize];
  os_unfair_lock_unlock(&self->_stateLock);
  if (self->_bytesReceivedBlock)
  {
    notifyQueue = self->_notifyQueue;
    if (notifyQueue)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000114B0;
      v19[3] = &unk_10005CC98;
      v19[4] = self;
      v19[5] = v9;
      v19[6] = v15;
      v19[7] = v17;
      dispatch_async(notifyQueue, v19);
    }
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v12 = [(_BAURLSessionDelegate *)self awaitingConnectivityTimer];

  if (v12)
  {
    uint64_t v13 = [(_BAURLSessionDelegate *)self awaitingConnectivityTimer];
    dispatch_source_cancel(v13);

    [(_BAURLSessionDelegate *)self setAwaitingConnectivityTimer:0];
  }
  os_unfair_lock_unlock(p_stateLock);
  if (self->_bytesReceivedBlock)
  {
    notifyQueue = self->_notifyQueue;
    if (notifyQueue)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100011600;
      v15[3] = &unk_10005CC98;
      v15[4] = self;
      v15[5] = a5;
      v15[6] = a6;
      v15[7] = a7;
      dispatch_async(notifyQueue, v15);
    }
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6
{
  if (self->_bytesReceivedBlock)
  {
    notifyQueue = self->_notifyQueue;
    if (notifyQueue)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000116DC;
      block[3] = &unk_10005CCC0;
      block[4] = self;
      void block[5] = a5;
      block[6] = a6;
      dispatch_async(notifyQueue, block);
    }
  }
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v4 = a4;
  id v5 = sub_100013C84();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BAURLSession: Task %{public}@ is awaiting connectivity.", (uint8_t *)&v6, 0xCu);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void *))a5;
  if (!self->_challengeBlock)
  {
    id v16 = [v9 protectionSpace];
    int64_t v17 = [v16 authenticationMethod];
    if ([v17 isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
      id v18 = [v9 previousFailureCount];

      if (!v18)
      {
        unsigned int v19 = [v9 protectionSpace];
        id v20 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v19 serverTrust]);

        goto LABEL_13;
      }
    }
    else
    {
    }
    if ([v9 previousFailureCount])
    {
      id v20 = 0;
      uint64_t v23 = 1;
LABEL_14:
      v10[2](v10, v23, v20);

      goto LABEL_15;
    }
    id v20 = [v9 proposedCredential];
LABEL_13:
    uint64_t v23 = 0;
    goto LABEL_14;
  }
  os_unfair_lock_lock(&self->_stateLock);
  id v12 = [(_BAURLSessionDelegate *)self awaitingConnectivityTimer];

  if (v12)
  {
    uint64_t v13 = [(_BAURLSessionDelegate *)self awaitingConnectivityTimer];
    dispatch_suspend(v13);

    id v12 = [(_BAURLSessionDelegate *)self awaitingConnectivityTimer];
    [(_BAURLSessionDelegate *)self awaitingConnectivityTimeout];
    id v15 = v14;
    [(_BAURLSessionDelegate *)self setAwaitingConnectivityTimer:0];
  }
  else
  {
    id v15 = 0;
  }
  os_unfair_lock_unlock(&self->_stateLock);
  objc_initWeak(&location, self);
  id challengeBlock = (void (**)(id, id, void *))self->_challengeBlock;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100011A88;
  v24[3] = &unk_10005CCE8;
  objc_copyWeak(v27, &location);
  id v22 = v12;
  id v25 = v22;
  v27[1] = v15;
  dispatch_queue_t v26 = v10;
  challengeBlock[2](challengeBlock, v9, v24);

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

LABEL_15:
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int64_t v17 = (void (**)(void, void))v16;
  if (self->_redirectResponseBlock)
  {
    notifyQueue = self->_notifyQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100011D04;
    v20[3] = &unk_10005CD10;
    id v23 = v16;
    v20[4] = self;
    id v21 = v15;
    id v22 = v14;
    dispatch_async(notifyQueue, v20);
  }
  else
  {
    ((void (**)(void, id))v17)[2](v17, v15);
  }
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 72, 1);
}

- (void)setResponse:(id)a3
{
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setData:(id)a3
{
}

- (BAFileHandle)fileHandle
{
  return (BAFileHandle *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFileHandle:(id)a3
{
}

- (BOOL)uniqueFileName
{
  return self->_uniqueFileName;
}

- (void)setUniqueFileName:(BOOL)a3
{
  self->_uniqueFileName = a3;
}

- (int64_t)fullDownloadSize
{
  return self->_fullDownloadSize;
}

- (void)setFullDownloadSize:(int64_t)a3
{
  self->_fullDownloadSize = a3;
}

- (NSData)resumeData
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setResumeData:(id)a3
{
}

- (NSError)mostRecentError
{
  return self->_mostRecentError;
}

- (void)setMostRecentError:(id)a3
{
}

- (BOOL)taskCompleted
{
  return self->_taskCompleted;
}

- (void)setTaskCompleted:(BOOL)a3
{
  self->_taskCompleted = a3;
}

- (BOOL)inBackground
{
  return self->_inBackground;
}

- (void)setInBackground:(BOOL)a3
{
  self->_inBackground = a3;
}

- (OS_dispatch_source)awaitingConnectivityTimer
{
  return self->_awaitingConnectivityTimer;
}

- (void)setAwaitingConnectivityTimer:(id)a3
{
}

- (double)awaitingConnectivityTimeout
{
  return self->_awaitingConnectivityTimeout;
}

- (void)setAwaitingConnectivityTimeout:(double)a3
{
  self->_awaitingConnectivityTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awaitingConnectivityTimer, 0);
  objc_storeStrong((id *)&self->_mostRecentError, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_bytesReceivedBlock, 0);
  objc_storeStrong(&self->_redirectResponseBlock, 0);
  objc_storeStrong(&self->_challengeBlock, 0);
  objc_storeStrong(&self->_notifyBlock, 0);
  objc_storeStrong((id *)&self->_destinationDirectory, 0);

  objc_storeStrong((id *)&self->_notifyQueue, 0);
}

@end