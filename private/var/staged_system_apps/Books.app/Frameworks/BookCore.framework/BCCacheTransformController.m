@interface BCCacheTransformController
- (BCCacheImageTransforming)transformer;
- (BCCacheTransformController)initWithHighPriorityTargetQueue:(id)a3 backgroundTargetQueue:(id)a4 transformer:(id)a5;
- (BCCacheTransformDelegate)delegate;
- (BICWorkQueue)workQueue;
- (NSMutableArray)imagesProcessing;
- (void)_transformCompleteSource:(id)a3 to:(id)a4 forRequest:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setImagesProcessing:(id)a3;
- (void)setTransformer:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)transformSource:(id)a3 to:(id)a4 forRequest:(id)a5;
@end

@implementation BCCacheTransformController

- (BCCacheTransformController)initWithHighPriorityTargetQueue:(id)a3 backgroundTargetQueue:(id)a4 transformer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BCCacheTransformController;
  v11 = [(BCCacheTransformController *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v13 = +[NSMutableArray array];
    imagesProcessing = v12->_imagesProcessing;
    v12->_imagesProcessing = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v12->_transformer, a5);
    uint64_t v15 = +[BICWorkQueue workQueueWithHighPriorityTargetQueue:v8 backgroundTargetQueue:v9 numConcurrentWorkItems:1];
    workQueue = v12->_workQueue;
    v12->_workQueue = (BICWorkQueue *)v15;

    [(BICWorkQueue *)v12->_workQueue setIdentifier:@"TransformController"];
  }

  return v12;
}

- (void)transformSource:(id)a3 to:(id)a4 forRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init(BICDescribedImagePair);
  [(BICDescribedImagePair *)v11 setSourceImage:v8];
  [(BICDescribedImagePair *)v11 setDestinationImage:v9];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v32 = sub_14646C;
  v33 = &unk_2C3AD0;
  v36 = &v37;
  v34 = self;
  v12 = v11;
  v35 = v12;
  uint64_t v13 = v31;
  os_unfair_lock_lock(&self->_accessLock);
  v32((uint64_t)v13);
  os_unfair_lock_unlock(&self->_accessLock);

  if (*((unsigned char *)v38 + 24))
  {
    v14 = BCImageCacheLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = v9;
      __int16 v43 = 2112;
      id v44 = v10;
      _os_log_impl(&def_7D91C, v14, OS_LOG_TYPE_INFO, "BCCacheTransformController: Transform is already in progress for: %@ for request: %@", buf, 0x16u);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    unsigned int v15 = [v9 processingOptions];
    v16 = kBICCacheStatsCounterTransformSpine;
    if (!v15) {
      v16 = kBICCacheStatsCounterTransformResize;
    }
    +[BICCacheStats incrementCounter:*v16];
    +[BICCacheStats logOperation:BICCacheStatsOperationTransformQueueStart[0] forRequest:v10];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v27 = sub_1464CC;
    v28 = &unk_2C3AF8;
    v29 = self;
    v17 = v12;
    v30 = v17;
    objc_super v18 = v26;
    os_unfair_lock_lock(&self->_accessLock);
    v27((uint64_t)v18);
    os_unfair_lock_unlock(&self->_accessLock);

    v19 = [(BCCacheTransformController *)self workQueue];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_146520;
    v20[3] = &unk_2C9E18;
    id v21 = v10;
    objc_copyWeak(&v25, (id *)buf);
    id v22 = v8;
    id v23 = v9;
    v24 = v17;
    [v19 addWorkItemWithPriority:v21 description:@"Transformer transform" block:v20];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }

  _Block_object_dispose(&v37, 8);
}

- (void)_transformCompleteSource:(id)a3 to:(id)a4 forRequest:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  id v9 = BICCacheStatsOperationTransformEnd[0];
  id v10 = a3;
  +[BICCacheStats logOperation:v9 forRequest:v8];
  if ([v12 quality] == 101) {
    +[BICCacheStats logOperation:BICCacheStatsOperationTransformedFromSmaller[0] forRequest:v8];
  }
  v11 = [(BCCacheTransformController *)self delegate];
  [v11 transformResultSrc:v10 result:v12 forRequest:v8];
}

- (BCCacheTransformDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (BCCacheTransformDelegate *)a3;
}

- (BCCacheImageTransforming)transformer
{
  return self->_transformer;
}

- (void)setTransformer:(id)a3
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

  objc_storeStrong((id *)&self->_transformer, 0);
}

@end