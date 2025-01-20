@interface TSPAVAssetResourceLoaderDelegate
+ (BOOL)shouldDisableEntireLengthAvailableOnDemand;
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (TSPAVAssetResourceLoaderDelegate)init;
- (TSPAVAssetResourceLoaderDelegate)initWithData:(id)a3;
- (id)delegateQueue;
- (void)_provideContentInformationToLoadingRequest:(id)a3;
- (void)_provideDataToLoadingRequest:(id)a3;
- (void)_provideNextDataBlockToLoadingRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
@end

@implementation TSPAVAssetResourceLoaderDelegate

- (TSPAVAssetResourceLoaderDelegate)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C56A0);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPAVAssetResourceLoaderDelegate init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPAVAssetResourceLoaderDelegate.mm";
    __int16 v14 = 1024;
    int v15 = 21;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPAVAssetResourceLoaderDelegate init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPAVAssetResourceLoaderDelegate.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:21 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPAVAssetResourceLoaderDelegate init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPAVAssetResourceLoaderDelegate)initWithData:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TSPAVAssetResourceLoaderDelegate;
  v6 = [(TSPAVAssetResourceLoaderDelegate *)&v20 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v7->_dataLength = (int64_t)[v5 length];
    v8 = [v5 digestString];
    id v9 = +[NSString stringWithFormat:@"TSPAVAssetResourceLoaderDelegate.DelegateQueue[%@]", v8];
    __int16 v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    delegateQueue = v7->_delegateQueue;
    v7->_delegateQueue = (OS_dispatch_queue *)v12;

    id v14 = +[NSString stringWithFormat:@"TSPAVAssetResourceLoaderDelegate.RequestHandlingQueue[%@]", v8];
    int v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    requestHandlingQueue = v7->_requestHandlingQueue;
    v7->_requestHandlingQueue = (OS_dispatch_queue *)v17;
  }
  return v7;
}

- (void)dealloc
{
  [(TSUReadChannel *)self->_readChannel close];
  v3.receiver = self;
  v3.super_class = (Class)TSPAVAssetResourceLoaderDelegate;
  [(TSPAVAssetResourceLoaderDelegate *)&v3 dealloc];
}

- (id)delegateQueue
{
  return self->_delegateQueue;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v5 = a4;
  if (([v5 isCancelled] & 1) == 0)
  {
    v6 = [v5 contentInformationRequest];

    if (v6) {
      [(TSPAVAssetResourceLoaderDelegate *)self _provideContentInformationToLoadingRequest:v5];
    }
    id v7 = [v5 dataRequest];

    if (v7) {
      [(TSPAVAssetResourceLoaderDelegate *)self _provideDataToLoadingRequest:v5];
    }
  }

  return 1;
}

+ (BOOL)shouldDisableEntireLengthAvailableOnDemand
{
  if (qword_1001EB318 != -1) {
    dispatch_once(&qword_1001EB318, &stru_1001C56C0);
  }
  return byte_1001EB310;
}

- (void)_provideContentInformationToLoadingRequest:(id)a3
{
  id v4 = a3;
  requestHandlingQueue = self->_requestHandlingQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C96C;
  v7[3] = &unk_1001C52A0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(requestHandlingQueue, v7);
}

- (void)_provideDataToLoadingRequest:(id)a3
{
  id v4 = a3;
  requestHandlingQueue = self->_requestHandlingQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CAEC;
  v7[3] = &unk_1001C52A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(requestHandlingQueue, v7);
}

- (void)_provideNextDataBlockToLoadingRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([v6 isCancelled])
  {
    v7[2](v7);
  }
  else
  {
    id v8 = [v6 dataRequest];
    if (!v8)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C5730);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_10015FF7C();
      }
      id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPAVAssetResourceLoaderDelegate _provideNextDataBlockToLoadingRequest:completion:]");
      __int16 v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPAVAssetResourceLoaderDelegate.mm"];
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 142, 0, "invalid nil value for '%{public}s'", "dataRequest");

      +[TSUAssertionHandler logBacktraceThrottled];
    }
    v11 = [v8 currentOffset];
    dispatch_queue_t v12 = [v8 requestedLength];
    v13 = (char *)[v8 requestedOffset];
    int64_t dataLength = self->_dataLength;
    int v15 = &v13[v12 - v11];
    if (dataLength - (uint64_t)v11 < (uint64_t)v15) {
      int v15 = (char *)(dataLength - (void)v11);
    }
    if (dataLength >= (uint64_t)v11) {
      uint64_t v16 = (uint64_t)v15;
    }
    else {
      uint64_t v16 = 0;
    }
    if (v16 >= 0x20000) {
      uint64_t v17 = 0x20000;
    }
    else {
      uint64_t v17 = v16;
    }
    if (v17)
    {
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x3032000000;
      v29[3] = sub_10000D18C;
      v29[4] = sub_10000D19C;
      id v18 = &_dispatch_data_empty;
      id v30 = &_dispatch_data_empty;
      readChannel = self->_readChannel;
      if (!readChannel)
      {
        +[TSUAssertionHandler _atomicIncrementAssertCount];
        if (TSUAssertCat_init_token != -1) {
          dispatch_once(&TSUAssertCat_init_token, &stru_1001C5750);
        }
        if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
          sub_10015FECC();
        }
        objc_super v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPAVAssetResourceLoaderDelegate _provideNextDataBlockToLoadingRequest:completion:]");
        v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPAVAssetResourceLoaderDelegate.mm"];
        +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 162, 0, "invalid nil value for '%{public}s'", "_readChannel");

        +[TSUAssertionHandler logBacktraceThrottled];
        readChannel = self->_readChannel;
      }
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10000D1E8;
      v22[3] = &unk_1001C5778;
      v26 = v29;
      id v23 = v6;
      v24 = self;
      v25 = v7;
      uint64_t v27 = v16;
      uint64_t v28 = v17;
      [(TSUReadChannel *)readChannel readFromOffset:v11 length:v17 handler:v22];

      _Block_object_dispose(v29, 8);
    }
    else
    {
      [v6 finishLoading];
      v7[2](v7);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readChannel, 0);
  objc_storeStrong((id *)&self->_requestHandlingQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end