@interface ASKLoadImageResourceOperation
+ (NSURLSession)URLSession;
+ (OS_dispatch_queue)dataConsumerQueue;
+ (id)keyPathsForValuesAffectingIsExecuting;
+ (id)keyPathsForValuesAffectingIsFinished;
- (ASKImageDataConsumer)dataConsumer;
- (ASKLoadImageResourceOperation)initWithURLRequest:(id)a3 URLSession:(id)a4 dataConsumer:(id)a5 dataConsumerQueue:(id)a6;
- (ASKLoadImageResourceOperation)initWithURLRequest:(id)a3 dataConsumer:(id)a4;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (NSURLSessionDataTask)task;
- (OS_dispatch_queue)dataConsumerQueue;
- (void)cancel;
- (void)didFinishTaskWithData:(id)a3 response:(id)a4 error:(id)a5;
- (void)setQueuePriority:(int64_t)a3;
- (void)start;
@end

@implementation ASKLoadImageResourceOperation

+ (NSURLSession)URLSession
{
  if (URLSession_onceToken != -1) {
    dispatch_once(&URLSession_onceToken, &__block_literal_global);
  }
  v2 = (void *)URLSession_URLSession;

  return (NSURLSession *)v2;
}

void __43__ASKLoadImageResourceOperation_URLSession__block_invoke(id a1)
{
  v1 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  CFStringRef v7 = @"User-Agent";
  v2 = +[AMSProcessInfo currentProcess];
  v3 = +[AMSUserAgent userAgentForProcessInfo:v2];
  v8 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v1 setHTTPAdditionalHeaders:v4];

  uint64_t v5 = +[NSURLSession sessionWithConfiguration:v1];
  v6 = (void *)URLSession_URLSession;
  URLSession_URLSession = v5;
}

+ (OS_dispatch_queue)dataConsumerQueue
{
  if (dataConsumerQueue_onceToken != -1) {
    dispatch_once(&dataConsumerQueue_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)dataConsumerQueue_dataConsumerQueue;

  return (OS_dispatch_queue *)v2;
}

void __50__ASKLoadImageResourceOperation_dataConsumerQueue__block_invoke(id a1)
{
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_UNSPECIFIED, 0);

  dispatch_queue_t v2 = dispatch_queue_create("ShelfKit.LoadImageResourceOperation.dataConsumerQueue", attr);
  v3 = (void *)dataConsumerQueue_dataConsumerQueue;
  dataConsumerQueue_dataConsumerQueue = (uint64_t)v2;
}

- (ASKLoadImageResourceOperation)initWithURLRequest:(id)a3 URLSession:(id)a4 dataConsumer:(id)a5 dataConsumerQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)ASKLoadImageResourceOperation;
  v14 = [(ASKLoadImageResourceOperation *)&v27 init];
  if (v14)
  {
    objc_initWeak(&location, v14);
    v15 = [v10 URL];
    v16 = (char *)[v15 hash];

    if (!v16)
    {
      v17 = _MTLogCategoryArtworkDownload();
      v16 = (char *)os_signpost_id_generate(v17);
    }
    v14->_signpostID = (unint64_t)v16;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __94__ASKLoadImageResourceOperation_initWithURLRequest_URLSession_dataConsumer_dataConsumerQueue___block_invoke;
    v24[3] = &unk_470F30;
    v25[1] = v16;
    objc_copyWeak(v25, &location);
    uint64_t v18 = [v11 dataTaskWithRequest:v10 completionHandler:v24];
    task = v14->_task;
    v14->_task = (NSURLSessionDataTask *)v18;

    v20 = _MTLogCategoryArtworkDownload();
    v21 = v20;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v21, OS_SIGNPOST_EVENT, (os_signpost_id_t)v16, "ASKLoadImageResourceOperation task created", "", v23, 2u);
    }

    objc_storeStrong((id *)&v14->_dataConsumer, a5);
    objc_storeStrong((id *)&v14->_dataConsumerQueue, a6);
    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __94__ASKLoadImageResourceOperation_initWithURLRequest_URLSession_dataConsumer_dataConsumerQueue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = _MTLogCategoryArtworkDownload();
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 40);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_END, v12, "ASKLoadImageResourceOperation", "", v14, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didFinishTaskWithData:v9 response:v8 error:v7];
}

- (ASKLoadImageResourceOperation)initWithURLRequest:(id)a3 dataConsumer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() URLSession];
  id v9 = [(id)objc_opt_class() dataConsumerQueue];
  id v10 = [(ASKLoadImageResourceOperation *)self initWithURLRequest:v7 URLSession:v8 dataConsumer:v6 dataConsumerQueue:v9];

  return v10;
}

- (void)didFinishTaskWithData:(id)a3 response:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [(ASKLoadImageResourceOperation *)self willChangeValueForKey:@"isExecuting"];
  id v9 = [(ASKLoadImageResourceOperation *)self dataConsumerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __70__ASKLoadImageResourceOperation_didFinishTaskWithData_response_error___block_invoke;
  block[3] = &unk_470F58;
  id v13 = v7;
  v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);

  [(ASKLoadImageResourceOperation *)self didChangeValueForKey:@"isExecuting"];
}

void __70__ASKLoadImageResourceOperation_didFinishTaskWithData_response_error___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_queue_t v2 = *(void **)(a1 + 40);
  if (v3)
  {
    v4 = [v2 dataConsumer];
    uint64_t v5 = *(void *)(a1 + 32);
    id v11 = 0;
    id v6 = [v4 objectForData:v5 error:&v11];
    id v7 = v11;

    if (v7)
    {
      id v8 = 0;
      id v9 = v7;
    }
    else
    {
      id v8 = v6;
      id v9 = 0;
    }
    [*(id *)(a1 + 40) didCompleteWithResource:v8 error:v9];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 48);
    [v2 didCompleteWithResource:0 error:v10];
  }
}

- (BOOL)isAsynchronous
{
  return 1;
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return +[NSSet setWithObjects:@"isCancelled", 0];
}

- (BOOL)isExecuting
{
  if ([(ASKLoadImageResourceOperation *)self isCancelled]) {
    return 0;
  }
  v4 = [(ASKLoadImageResourceOperation *)self task];
  BOOL v3 = [v4 state] == 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return +[NSSet setWithObjects:@"isCancelled", @"isExecuting", 0];
}

- (BOOL)isFinished
{
  if ([(ASKLoadImageResourceOperation *)self isCancelled]) {
    return 1;
  }
  v4 = [(ASKLoadImageResourceOperation *)self task];
  BOOL v3 = [v4 state] == (char *)&dword_0 + 3;

  return v3;
}

- (void)setQueuePriority:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ASKLoadImageResourceOperation;
  -[ASKLoadImageResourceOperation setQueuePriority:](&v10, "setQueuePriority:");
  *((void *)&v5 + 1) = a3;
  *(void *)&long long v5 = a3 + 8;
  unint64_t v6 = (v5 >> 2) - 1;
  if (v6 > 3) {
    int v7 = 1045220557;
  }
  else {
    int v7 = dword_3DD3D0[v6];
  }
  id v8 = [(ASKLoadImageResourceOperation *)self task];
  LODWORD(v9) = v7;
  [v8 setPriority:v9];
}

- (void)start
{
  BOOL v3 = [(ASKLoadImageResourceOperation *)self task];
  v4 = (char *)[v3 state];

  if (([(ASKLoadImageResourceOperation *)self isCancelled] & 1) == 0
    && v4 != (unsigned char *)&dword_0 + 2)
  {
    if (v4 == (unsigned char *)&dword_0 + 1)
    {
      [(ASKLoadImageResourceOperation *)self willChangeValueForKey:@"isExecuting"];
      *((void *)&v5 + 1) = [(ASKLoadImageResourceOperation *)self queuePriority];
      *(void *)&long long v5 = *((void *)&v5 + 1) + 8;
      unint64_t v6 = (v5 >> 2) - 1;
      if (v6 > 3) {
        int v7 = 1045220557;
      }
      else {
        int v7 = dword_3DD3D0[v6];
      }
      id v8 = [(ASKLoadImageResourceOperation *)self task];
      LODWORD(v9) = v7;
      [v8 setPriority:v9];

      objc_super v10 = _MTLogCategoryArtworkDownload();
      id v11 = v10;
      os_signpost_id_t signpostID = self->_signpostID;
      if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "ASKLoadImageResourceOperation", "", buf, 2u);
      }

      id v13 = [(ASKLoadImageResourceOperation *)self task];
      [v13 resume];

      [(ASKLoadImageResourceOperation *)self didChangeValueForKey:@"isExecuting"];
    }
    else
    {
      NSLog(@"*** Warning, %s called multiple times on %@", "-[ASKLoadImageResourceOperation start]", self);
    }
  }
}

- (void)cancel
{
  BOOL v3 = [(ASKLoadImageResourceOperation *)self task];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)ASKLoadImageResourceOperation;
  [(ASKLoadImageResourceOperation *)&v4 cancel];
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (ASKImageDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (OS_dispatch_queue)dataConsumerQueue
{
  return self->_dataConsumerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataConsumerQueue, 0);
  objc_storeStrong((id *)&self->_dataConsumer, 0);

  objc_storeStrong((id *)&self->_task, 0);
}

@end