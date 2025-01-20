@interface BCStackManager
- (BCCacheStackManagerDelegate)delegate;
- (BCStackManager)initWithHighPriorityTargetQueue:(id)a3 backgroundTargetQueue:(id)a4 renderer:(id)a5;
- (BCStackRendering)renderer;
- (BICWorkQueue)workQueue;
- (NSMutableArray)imagesProcessing;
- (void)_renderCompleteSource:(id)a3 to:(id)a4 forRequest:(id)a5;
- (void)renderStackFromSource:(id)a3 forRequest:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setImagesProcessing:(id)a3;
- (void)setRenderer:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation BCStackManager

- (BCStackManager)initWithHighPriorityTargetQueue:(id)a3 backgroundTargetQueue:(id)a4 renderer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BCStackManager;
  v11 = [(BCStackManager *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v13 = +[NSMutableArray array];
    imagesProcessing = v12->_imagesProcessing;
    v12->_imagesProcessing = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v12->_renderer, a5);
    uint64_t v15 = +[BICWorkQueue workQueueWithHighPriorityTargetQueue:v8 backgroundTargetQueue:v9 numConcurrentWorkItems:6];
    workQueue = v12->_workQueue;
    v12->_workQueue = (BICWorkQueue *)v15;

    [(BICWorkQueue *)v12->_workQueue setIdentifier:@"StackManager"];
    [(BICWorkQueue *)v12->_workQueue setManualCompletion:1];
    [(BICWorkQueue *)v12->_workQueue setWorkItemTimeout:10.0];
  }

  return v12;
}

- (void)renderStackFromSource:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v25 = sub_8B18;
  v26 = &unk_2C3AD0;
  v29 = &v30;
  v27 = self;
  id v8 = v6;
  id v28 = v8;
  id v9 = v24;
  os_unfair_lock_lock(&self->_accessLock);
  v25((uint64_t)v9);
  os_unfair_lock_unlock(&self->_accessLock);

  if (!*((unsigned char *)v31 + 24)) {
    goto LABEL_5;
  }
  id v10 = BCImageCacheLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v8;
    _os_log_impl(&def_7D91C, v10, OS_LOG_TYPE_INFO, "BCStackManager: Already Rendering stack for: %@", buf, 0xCu);
  }

  if (!*((unsigned char *)v31 + 24))
  {
LABEL_5:
    v11 = BCImageCacheLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v8;
      _os_log_impl(&def_7D91C, v11, OS_LOG_TYPE_INFO, "BCStackManager: Rendering stack for: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    +[BICCacheStats incrementCounter:kBICCacheStatsCounterStacks[0]];
    +[BICCacheStats logOperation:BICCacheStatsOperationStackCreationQueueStart[0] forRequest:v7];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v20 = sub_8B78;
    v21 = &unk_2C3AF8;
    v22 = self;
    id v12 = v8;
    id v23 = v12;
    uint64_t v13 = v19;
    os_unfair_lock_lock(&self->_accessLock);
    v20((uint64_t)v13);
    os_unfair_lock_unlock(&self->_accessLock);

    v14 = [(BCStackManager *)self workQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_8BCC;
    v15[3] = &unk_2C3B98;
    objc_copyWeak(&v18, (id *)buf);
    id v16 = v7;
    id v17 = v12;
    [v14 addWorkItemWithPriority:v16 description:@"StackManager render stack" block:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

  _Block_object_dispose(&v30, 8);
}

- (void)_renderCompleteSource:(id)a3 to:(id)a4 forRequest:(id)a5
{
  id v8 = a3;
  id v9 = BICCacheStatsOperationStackCreationEnd[0];
  id v10 = a5;
  id v11 = a4;
  +[BICCacheStats logOperation:v9 forRequest:v10];
  id v12 = BCImageCacheLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v8;
    _os_log_impl(&def_7D91C, v12, OS_LOG_TYPE_INFO, "BCStackManager: Completed Rendering stack for: %@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v13 = [(BCStackManager *)self delegate];
  [v13 stackRenderingResultSrc:v8 result:v11 forRequest:v10];
}

- (BCCacheStackManagerDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (BCCacheStackManagerDelegate *)a3;
}

- (BCStackRendering)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (BICWorkQueue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSMutableArray)imagesProcessing
{
  return self->_imagesProcessing;
}

- (void)setImagesProcessing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagesProcessing, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_renderer, 0);
}

@end