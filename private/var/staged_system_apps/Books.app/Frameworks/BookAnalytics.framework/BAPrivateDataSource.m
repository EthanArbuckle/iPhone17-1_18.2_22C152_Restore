@interface BAPrivateDataSource
- (BAPrivateDataSource)init;
- (BAPrivateDataSourceDelegate)delegate;
- (OS_dispatch_queue)workQueue;
- (id)generatePrivateData;
- (void)_BCCloudSecureUserDataManagerChanged:(id)a3;
- (void)dealloc;
- (void)fetchPrivateData:(id)a3;
- (void)fetchPrivateDataForKey:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)syncPrivateData:(id)a3 toCloudWithCompletion:(id)a4;
@end

@implementation BAPrivateDataSource

- (BAPrivateDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)BAPrivateDataSource;
  v2 = [(BAPrivateDataSource *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("BAPrivateDataSource.workQueue", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    v6 = +[NSDistributedNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_BCCloudSecureUserDataManagerChanged:" name:BCCloudSecureUserDataManagerChanged object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self name:BCCloudSecureUserDataManagerChanged object:0];

  v4.receiver = self;
  v4.super_class = (Class)BAPrivateDataSource;
  [(BAPrivateDataSource *)&v4 dealloc];
}

- (void)_BCCloudSecureUserDataManagerChanged:(id)a3
{
  objc_super v4 = [(BAPrivateDataSource *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_30F0;
  block[3] = &unk_2F6AA0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)fetchPrivateData:(id)a3
{
  id v4 = a3;
  v5 = [(BAPrivateDataSource *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3850;
  v7[3] = &unk_2F6B18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)fetchPrivateDataForKey:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[BDSSecureManager sharedManager];
  id v8 = [v7 userDataManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_3C14;
  v11[3] = &unk_2F6B68;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 userDatumForKey:v10 completion:v11];
}

- (id)generatePrivateData
{
  v2 = BAPrivateAllKeys();
  v3 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v2 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v18;
    *(void *)&long long v6 = 138412546;
    long long v16 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", @"userPrivateSeed", v16, (void)v17) & 1) != 0
          || ([v10 isEqualToString:@"contentPrivateSeed"] & 1) != 0)
        {
          v11 = BAGenerateSeed();
        }
        else
        {
          id v12 = +[NSUUID UUID];
          v11 = [v12 UUIDString];
        }
        id v13 = BALog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v16;
          v22 = v10;
          __int16 v23 = 2112;
          v24 = v11;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "generatePrivateData: key: %@ value: %@", buf, 0x16u);
        }

        [v3 setObject:v11 forKeyedSubscript:v10];
      }
      id v7 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v7);
  }

  id v14 = [v3 copy];

  return v14;
}

- (void)syncPrivateData:(id)a3 toCloudWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BAPrivateDataSource *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4270;
  block[3] = &unk_2F6C08;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (BAPrivateDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BAPrivateDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end