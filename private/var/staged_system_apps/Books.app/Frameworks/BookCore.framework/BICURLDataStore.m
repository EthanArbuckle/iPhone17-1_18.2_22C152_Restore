@interface BICURLDataStore
- (BICDataStoringDelegate)delegate;
- (BICURLDataStore)initWithCachePath:(id)a3;
- (BICWorkQueue)workQueue;
- (BOOL)canStoreDescribedImage:(id)a3;
- (NSString)identifier;
- (OS_dispatch_queue)completionQueue;
- (id)imageForEntryLocation:(id)a3;
- (int64_t)costFor:(signed __int16)a3;
- (signed)storingMedium;
- (void)_clean:(id)a3;
- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5;
- (void)afterAllStoreOperationsCompletedPerformBlock:(id)a3;
- (void)deleteRemovedEntries:(id)a3 deletingCompletedHandler:(id)a4;
- (void)fetchImagesForEntry:(id)a3 forRequest:(id)a4 completion:(id)a5;
- (void)setCompletionQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)storeAddedEntries:(id)a3 forRequest:(id)a4 storingCompletedHandler:(id)a5;
@end

@implementation BICURLDataStore

- (BICURLDataStore)initWithCachePath:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)BICURLDataStore;
  v3 = [(BICURLDataStore *)&v17 init];
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v6 = dispatch_queue_create("URLDataStore", v5);

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v9 = dispatch_queue_create("URLDataStore", v8);

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("URLDataStore Completion", v11);
    completionQueue = v3->_completionQueue;
    v3->_completionQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = +[BICWorkQueue workQueueWithHighPriorityTargetQueue:v6 backgroundTargetQueue:v9 numConcurrentWorkItems:16];
    workQueue = v3->_workQueue;
    v3->_workQueue = (BICWorkQueue *)v14;

    [(BICWorkQueue *)v3->_workQueue setIdentifier:@"URLDataStore"];
    [(BICWorkQueue *)v3->_workQueue setManualCompletion:1];
  }
  return v3;
}

- (signed)storingMedium
{
  return 2;
}

- (BOOL)canStoreDescribedImage:(id)a3
{
  id v3 = a3;
  v4 = [v3 urlString];
  if (v4)
  {
    v5 = [v3 urlString];
    unsigned int v6 = [v5 isEqualToString:@"test"] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)deleteRemovedEntries:(id)a3 deletingCompletedHandler:(id)a4
{
  id v7 = a3;
  id v5 = objc_retainBlock(a4);
  unsigned int v6 = v5;
  if (v5) {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }
}

- (void)afterAllStoreOperationsCompletedPerformBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[BICDescribedImage describedImageWithPriority:3];
  objc_initWeak(&location, self);
  unsigned int v6 = [(BICURLDataStore *)self workQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_BC1CC;
  v8[3] = &unk_2C8590;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v6 addWorkItemWithPriority:v5 description:@"URLDataStore after all ops" block:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)fetchImagesForEntry:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[BICDescribedImage describedImageFromImageEntry:v8];
  [v11 setExpiry:0];
  dispatch_queue_t v12 = [v8 dataStoreInformation];
  if (v12)
  {
    v13 = [(BICURLDataStore *)self delegate];
    unsigned int v14 = [v13 canFetchCoverForURL:v12];
    objc_initWeak(&location, self);
    v15 = BICCacheStatsOperationNetworkDownloadQueueStart;
    if (v14) {
      v15 = BICCacheStatsOperationNetworkDownloadQueueStartFromDataSource;
    }
    +[BICCacheStats logOperation:*v15 forRequest:v9];
    v16 = [(BICURLDataStore *)self completionQueue];
    objc_super v17 = [(BICURLDataStore *)self workQueue];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_BC50C;
    v22[3] = &unk_2C8630;
    objc_copyWeak(&v29, &location);
    id v23 = v9;
    char v30 = v14;
    id v24 = v12;
    id v18 = v13;
    id v25 = v18;
    id v26 = v11;
    id v28 = v10;
    id v19 = v16;
    id v27 = v19;
    [v17 addWorkItemWithPriority:v23 description:@"URLDataStore read" block:v22];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    id v20 = objc_retainBlock(v10);
    v21 = v20;
    if (v20) {
      (*((void (**)(id, void))v20 + 2))(v20, 0);
    }
  }
}

- (id)imageForEntryLocation:(id)a3
{
  return 0;
}

- (void)storeAddedEntries:(id)a3 forRequest:(id)a4 storingCompletedHandler:(id)a5
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void *))a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        dispatch_queue_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = [v12 imageDescription];
        unsigned int v14 = [v13 urlString];
        [v12 setStoredData:v14];
      }
      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  v7[2](v7, v6, &__NSArray0__struct);
}

- (int64_t)costFor:(signed __int16)a3
{
  return 0;
}

- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void *))v5 + 2))(v5, &__NSArray0__struct);
    id v5 = v6;
  }
}

- (void)_clean:(id)a3
{
  id v3 = (void (**)(void))objc_retainBlock(a3);
  if (v3)
  {
    id v4 = v3;
    v3[2]();
    id v3 = v4;
  }
}

- (BICDataStoringDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BICWorkQueue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->identifier, 0);

  objc_storeStrong((id *)&self->delegate, 0);
}

@end