@interface FTContentPrefetchManager
+ (void)initialize;
- (FCAssetManager)assetManager;
- (FTContentPrefetchManager)init;
- (OS_dispatch_queue)workQueue;
- (void)prefetchContentForBanner:(id)a3 withQualityOfService:(int64_t)a4 completionHandler:(id)a5;
- (void)prefetchContentForHeadlines:(id)a3 withQualityOfService:(int64_t)a4 completionHandler:(id)a5;
- (void)setAssetManager:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation FTContentPrefetchManager

+ (void)initialize
{
  id v3 = +[NSFileManager defaultManager];
  v2 = FCURLForLegacyWidgetReferralItems();
  [v3 removeItemAtURL:v2 error:0];
}

- (FTContentPrefetchManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)FTContentPrefetchManager;
  v2 = [(FTContentPrefetchManager *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)FCAssetManager);
    v4 = FCURLForContainerizedUserAccountCachesDirectory();
    v5 = [v4 path];
    v6 = +[FCNetworkReachability sharedNetworkReachability];
    v7 = (FCAssetManager *)[v3 initWithName:@"widget-assets" directory:v5 keyManager:0 avAssetFactory:0 resourceURLGenerator:0 networkBehaviorMonitor:0 networkReachability:v6];

    assetManager = v2->_assetManager;
    v2->_assetManager = v7;
    v9 = v7;

    [(FCAssetManager *)v9 enableFlushingWithFlushingThreshold:1];
  }
  return v2;
}

- (void)prefetchContentForBanner:(id)a3 withQualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = PrefetchLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "prefetching content for widget banner", buf, 2u);
  }

  v10 = dispatch_group_create();
  if ([v7 imageMethod] == (id)2
    && ([v7 imageURL], objc_super v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    v12 = [v7 imageURL];
    v13 = [(FTContentPrefetchManager *)self assetManager];
    v14 = [v13 assetHandleForCKAssetURL:v12 lifetimeHint:0];

    dispatch_group_enter(v10);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000139D4;
    v23[3] = &unk_100123EA8;
    id v15 = v14;
    id v24 = v15;
    id v25 = v7;
    v26 = v10;
    id v16 = [v15 downloadIfNeededWithCompletion:v23];
  }
  else
  {
    id v15 = 0;
  }
  v17 = FCDispatchQueueForQualityOfService();
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100013ADC;
  v20[3] = &unk_100123EF8;
  id v21 = v15;
  id v22 = v8;
  v20[4] = self;
  id v18 = v15;
  id v19 = v8;
  dispatch_group_notify(v10, v17, v20);
}

- (void)prefetchContentForHeadlines:(id)a3 withQualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  int64_t v23 = a4;
  id v6 = a3;
  id v24 = a5;
  id v7 = PrefetchLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v40 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "prefetching content for %zd headlines", buf, 0xCu);
  }

  id v25 = objc_opt_new();
  id v8 = dispatch_group_create();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v15 = [v14 flintDocumentURL:v23];
        if (v15)
        {
          id v16 = [(FTContentPrefetchManager *)self assetManager];
          v17 = [v16 assetHandleForCKAssetURL:v15 lifetimeHint:0];

          [v25 setObject:v17 forKeyedSubscript:v15];
          dispatch_group_enter(v8);
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_100013EBC;
          v30[3] = &unk_100123EA8;
          id v31 = v17;
          v32 = v14;
          v33 = v8;
          id v18 = v17;
          id v19 = [v18 downloadIfNeededWithCompletion:v30];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v11);
  }

  v20 = FCDispatchQueueForQualityOfService();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013FC4;
  block[3] = &unk_100123EF8;
  block[4] = self;
  id v28 = v25;
  id v29 = v24;
  id v21 = v25;
  id v22 = v24;
  dispatch_group_notify(v8, v20, block);
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
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

  objc_storeStrong((id *)&self->_assetManager, 0);
}

@end