@interface BICProductProfileDataStore
- (BICDataStoringDelegate)delegate;
- (BICProductProfileDataStore)initWithCachePath:(id)a3;
- (BICWorkQueue)workQueue;
- (BOOL)canStoreDescribedImage:(id)a3;
- (NSString)identifier;
- (OS_dispatch_queue)completionQ;
- (id)imageForEntryLocation:(id)a3;
- (int64_t)costFor:(signed __int16)a3;
- (signed)storingMedium;
- (void)_clean:(id)a3;
- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5;
- (void)afterAllStoreOperationsCompletedPerformBlock:(id)a3;
- (void)deleteRemovedEntries:(id)a3 deletingCompletedHandler:(id)a4;
- (void)fetchImagesForEntry:(id)a3 forRequest:(id)a4 completion:(id)a5;
- (void)setCompletionQ:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)storeAddedEntries:(id)a3 forRequest:(id)a4 storingCompletedHandler:(id)a5;
@end

@implementation BICProductProfileDataStore

- (BICProductProfileDataStore)initWithCachePath:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)BICProductProfileDataStore;
  v3 = [(BICProductProfileDataStore *)&v17 init];
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v6 = dispatch_queue_create("ProductProfileDataStore", v5);

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v9 = dispatch_queue_create("ProductProfileDataStore", v8);

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("ProductProfileCompletion", v11);
    completionQ = v3->_completionQ;
    v3->_completionQ = (OS_dispatch_queue *)v12;

    uint64_t v14 = +[BICWorkQueue workQueueWithHighPriorityTargetQueue:v6 backgroundTargetQueue:v9 numConcurrentWorkItems:16];
    workQueue = v3->_workQueue;
    v3->_workQueue = (BICWorkQueue *)v14;

    [(BICWorkQueue *)v3->_workQueue setIdentifier:@"ProductProfileDataStore"];
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
  v4 = [v3 adamID];
  if (v4)
  {
    v5 = [v3 adamID];
    BOOL v6 = [v5 integerValue] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)deleteRemovedEntries:(id)a3 deletingCompletedHandler:(id)a4
{
  id v7 = a3;
  id v5 = objc_retainBlock(a4);
  BOOL v6 = v5;
  if (v5) {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }
}

- (void)afterAllStoreOperationsCompletedPerformBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[BICDescribedImage describedImageWithPriority:3];
  objc_initWeak(&location, self);
  BOOL v6 = [(BICProductProfileDataStore *)self workQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_11D87C;
  v8[3] = &unk_2C8590;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v6 addWorkItemWithPriority:v5 description:@"ProfileDataStore after all ops" block:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)fetchImagesForEntry:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 dataStoreInformation];
  if (v11)
  {
    objc_initWeak(&location, self);
    +[BICCacheStats logOperation:BICCacheStatsOperationProfileDownloadQueueStart[0] forRequest:v9];
    dispatch_queue_t v12 = [(BICProductProfileDataStore *)self workQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_11DB00;
    v15[3] = &unk_2C9510;
    objc_copyWeak(&v19, &location);
    id v16 = v9;
    id v17 = v11;
    id v18 = v10;
    [v12 addWorkItemWithPriority:v16 description:@"ProfileDataStore read" block:v15];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    id v13 = objc_retainBlock(v10);
    uint64_t v14 = v13;
    if (v13) {
      (*((void (**)(id, void))v13 + 2))(v13, 0);
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
        id v13 = [v12 imageDescription];
        uint64_t v14 = [v13 adamID];
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

- (OS_dispatch_queue)completionQ
{
  return self->_completionQ;
}

- (void)setCompletionQ:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQ, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->identifier, 0);

  objc_storeStrong((id *)&self->delegate, 0);
}

@end