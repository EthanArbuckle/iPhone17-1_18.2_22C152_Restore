@interface BKCoverCacheURLSchemeHandler
+ (id)urlStringForAssetID:(id)a3 dataSourceID:(id)a4;
- (BKCoverCacheURLSchemeHandler)init;
- (BOOL)canFetchCoverForURL:(id)a3;
- (void)_fetchCoverForDataSourceURL:(id)a3 completion:(id)a4;
- (void)fetchCoverForURL:(id)a3 completion:(id)a4;
@end

@implementation BKCoverCacheURLSchemeHandler

- (BKCoverCacheURLSchemeHandler)init
{
  v13.receiver = self;
  v13.super_class = (Class)BKCoverCacheURLSchemeHandler;
  v2 = [(BKCoverCacheURLSchemeHandler *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v6 = dispatch_queue_create("BKCoverCacheURLSchemeHandler.schedule", v5);
    scheduleQueue = v3->_scheduleQueue;
    v3->_scheduleQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("BKCoverCacheURLSchemeHandler.completion", v5);
    completionQueue = v3->_completionQueue;
    v3->_completionQueue = (OS_dispatch_queue *)v8;

    dispatch_semaphore_t v10 = dispatch_semaphore_create(16);
    concurrentTasks = v3->_concurrentTasks;
    v3->_concurrentTasks = (OS_dispatch_semaphore *)v10;
  }
  return v3;
}

+ (id)urlStringForAssetID:(id)a3 dataSourceID:(id)a4
{
  v11[0] = a3;
  v11[1] = a4;
  id v5 = a4;
  id v6 = a3;
  v7 = +[NSArray arrayWithObjects:v11 count:2];

  dispatch_queue_t v8 = [v7 componentsJoinedByString:@"#item#"];
  v9 = [@"datasource://assetID-" stringByAppendingString:v8];

  return v9;
}

- (void)fetchCoverForURL:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 hasPrefix:@"datasource://assetID-"]) {
    [(BKCoverCacheURLSchemeHandler *)self _fetchCoverForDataSourceURL:v7 completion:v6];
  }
}

- (void)_fetchCoverForDataSourceURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [v6 stringByReplacingOccurrencesOfString:@"datasource://assetID-" withString:&stru_100A70340];
  v9 = [v8 componentsSeparatedByString:@"#item#"];

  if ([v9 count])
  {
    dispatch_semaphore_t v10 = [v9 objectAtIndexedSubscript:0];
  }
  else
  {
    dispatch_semaphore_t v10 = 0;
  }
  if ((unint64_t)[v9 count] < 2)
  {
    v11 = 0;
  }
  else
  {
    v11 = [v9 objectAtIndexedSubscript:1];
  }
  v12 = +[BKLibraryManager defaultManager];
  objc_super v13 = [v12 dataSourceWithIdentifier:v11];

  +[BKLibraryManager defaultManager];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10018D640;
  v20[3] = &unk_100A491D0;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v10;
  v23 = self;
  id v24 = v11;
  id v26 = v6;
  id v27 = v7;
  id v25 = v13;
  id v14 = v6;
  id v15 = v13;
  id v16 = v7;
  id v17 = v11;
  id v18 = v10;
  id v19 = v21;
  [v19 performBackgroundReadOnlyBlock:v20];
}

- (BOOL)canFetchCoverForURL:(id)a3
{
  return [a3 hasPrefix:@"datasource://assetID-"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concurrentTasks, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);

  objc_storeStrong((id *)&self->_scheduleQueue, 0);
}

@end