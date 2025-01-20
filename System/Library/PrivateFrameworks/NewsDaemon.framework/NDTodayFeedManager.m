@interface NDTodayFeedManager
- (BOOL)_canAdoptFeedConfig;
- (FCANFHelper)ANFHelper;
- (FCContentContext)context;
- (NDContentArchiveStore)archiveStore;
- (NDTodayFeedManager)initWithContext:(id)a3 ANFHelper:(id)a4;
- (NSMutableArray)interestTokens;
- (NSOperationQueue)operationQueue;
- (NSString)rootDirectory;
- (OS_dispatch_queue)queue;
- (id)_configFromData:(id)a3;
- (id)_contentIDForConfig:(id)a3;
- (id)_keepAliveTokenForInstanceID:(id)a3;
- (id)_latestTodayFeed;
- (id)_mostRecentContentID;
- (id)_publishDateFromContentID:(id)a3;
- (id)_todayFeedForContentID:(id)a3;
- (void)adoptFeedConfigData:(id)a3;
- (void)fetchCachedTodayFeedWithCompletion:(id)a3;
- (void)flushWithCompletion:(id)a3;
@end

@implementation NDTodayFeedManager

- (NDTodayFeedManager)initWithContext:(id)a3 ANFHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)NDTodayFeedManager;
  v9 = [(NDTodayFeedManager *)&v32 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_ANFHelper, a4);
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    interestTokens = v10->_interestTokens;
    v10->_interestTokens = v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.news.NDTodayFeedManager", v13);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v14;

    v16 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v16;

    [(NSOperationQueue *)v10->_operationQueue setUnderlyingQueue:v10->_queue];
    [(NSOperationQueue *)v10->_operationQueue setMaxConcurrentOperationCount:1];
    v18 = [v7 contentDirectory];
    uint64_t v19 = [v18 stringByAppendingPathComponent:@"today-feed"];
    rootDirectory = v10->_rootDirectory;
    v10->_rootDirectory = (NSString *)v19;

    v21 = [NDContentArchiveStore alloc];
    v22 = [v7 contentDirectory];
    v23 = [(NDContentArchiveStore *)v21 initWithParentDirectory:v22 name:@"today-feed"];
    archiveStore = v10->_archiveStore;
    v10->_archiveStore = v23;

    v25 = [(NDTodayFeedManager *)v10 _mostRecentContentID];
    if (v25)
    {
      v26 = v10->_interestTokens;
      v27 = [(NDContentArchiveStore *)v10->_archiveStore interestTokenForContentID:v25];
      [(NSMutableArray *)v26 fc_safelyAddObject:v27];

      v28 = [(NDContentArchiveStore *)v10->_archiveStore manifestForContentID:v25];
      id v29 = [v28 copyWithAssetsOnly];
      v30 = [v7 interestTokenForContentManifest:v29];
      [(NSMutableArray *)v10->_interestTokens addObject:v30];
    }
    [(NDContentArchiveStore *)v10->_archiveStore enableFlushingWithFlushingThreshold:0];
  }
  return v10;
}

- (void)adoptFeedConfigData:(id)a3
{
  id v4 = a3;
  if ([(NDTodayFeedManager *)self _canAdoptFeedConfig])
  {
    v5 = +[NSUUID UUID];
    v6 = [v5 UUIDString];

    id v7 = FCOfflineDownloadsLog;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "TodayFeedService will enter operation queue (instance=%{public}@)", buf, 0xCu);
    }
    id v8 = [(NDTodayFeedManager *)self operationQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000059E0;
    v15[3] = &unk_100061798;
    id v16 = v6;
    id v17 = v4;
    v18 = self;
    id v9 = v6;
    objc_msgSend(v8, "fc_addAsyncOperationWithBlock:", v15);

    v10 = [(NDTodayFeedManager *)self _keepAliveTokenForInstanceID:v9];
    v11 = [(NDTodayFeedManager *)self operationQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000063B8;
    v13[3] = &unk_1000617C0;
    id v14 = v10;
    id v12 = v10;
    objc_msgSend(v11, "fc_addAsyncOperationWithBlock:", v13);
  }
}

- (void)fetchCachedTodayFeedWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  v5 = [(NDTodayFeedManager *)self _latestTodayFeed];
  if (v5)
  {
    v4[2](v4, v5, 0);
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100006488;
    v6[3] = &unk_1000616D0;
    id v7 = v4;
    sub_100006488((uint64_t)v6);
  }
}

- (void)flushWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(NDTodayFeedManager *)self operationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000065BC;
  v7[3] = &unk_1000616F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (BOOL)_canAdoptFeedConfig
{
  v2 = +[NSProcessInfo processInfo];
  unsigned int v3 = [v2 isLowPowerModeEnabled];

  if (v3)
  {
    return sub_1000067A4();
  }
  else
  {
    v5 = +[FCNetworkReachability sharedNetworkReachability];
    unsigned int v6 = [v5 isLowDataModeEnabled];

    if (v6)
    {
      return sub_1000067EC();
    }
    else
    {
      return 1;
    }
  }
}

- (id)_latestTodayFeed
{
  unsigned int v3 = [(NDTodayFeedManager *)self _mostRecentContentID];
  if (v3)
  {
    id v4 = [(NDTodayFeedManager *)self _todayFeedForContentID:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_configFromData:(id)a3
{
  id v3 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_10000606C;
  v22 = sub_10000607C;
  id v23 = 0;
  id v4 = +[NSDate date];
  v5 = NDTodayFeedConfigDecodingServiceXPCConnection();
  [v5 activate];
  unsigned int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&stru_100061800];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100006B8C;
  v17[3] = &unk_100061850;
  v17[4] = &v18;
  [v6 decodeTodayFeedConfigData:v3 completion:v17];

  [v5 invalidate];
  id v7 = (void *)v19[5];
  if (v7)
  {
    id v8 = FCOfflineDownloadsLog;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(id)v19[5] publishDate];
      v10 = [(id)v19[5] topStoriesArticleIDs];
      id v11 = [v10 count];
      id v12 = [(id)v19[5] topStoriesPackageURLs];
      id v13 = [v12 count];
      id v14 = objc_msgSend(v4, "fc_millisecondTimeIntervalUntilNow");
      *(_DWORD *)buf = 138544130;
      v25 = v9;
      __int16 v26 = 2048;
      id v27 = v11;
      __int16 v28 = 2048;
      id v29 = v13;
      __int16 v30 = 2048;
      id v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TodayFeedService successfully decoded config data, publishDate=%{public}@, articles=%lu, packages=%lu, time=%llums", buf, 0x2Au);
    }
    id v7 = (void *)v19[5];
  }
  id v15 = v7;

  _Block_object_dispose(&v18, 8);

  return v15;
}

- (id)_contentIDForConfig:(id)a3
{
  id v3 = [a3 publishDate];
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", objc_msgSend(v3, "fc_millisecondTimeIntervalSince1970"));

  return v4;
}

- (id)_publishDateFromContentID:(id)a3
{
  id v3 = objc_msgSend(a3, "fc_unsignedLongLongValue");

  return +[NSDate fc_dateWithMillisecondTimeIntervalSince1970:v3];
}

- (id)_mostRecentContentID
{
  v2 = [(NDTodayFeedManager *)self archiveStore];
  id v3 = [v2 allCompleteContentIDs];

  id v4 = [v3 sortedArrayUsingComparator:&stru_100061890];
  v5 = [v4 firstObject];

  return v5;
}

- (id)_todayFeedForContentID:(id)a3
{
  id v4 = a3;
  v5 = [(NDTodayFeedManager *)self archiveStore];
  unsigned int v6 = [v5 blobWithName:@"config" contentID:v4];

  id v7 = [(NDTodayFeedManager *)self archiveStore];
  id v8 = [v7 manifestForContentID:v4];

  id v9 = [(NDTodayFeedManager *)self archiveStore];
  v10 = [v9 aggregateArchiveForContentID:v4];

  id v11 = objc_alloc((Class)NDTodayFeed);
  id v12 = [(NDTodayFeedManager *)self _publishDateFromContentID:v4];

  id v13 = [v11 initWithConfigData:v6 publishDate:v12 contentManifest:v8 contentArchive:v10];

  return v13;
}

- (id)_keepAliveTokenForInstanceID:(id)a3
{
  id v3 = +[NSString stringWithFormat:@"com.apple.newsd.today-feed.adoptNewConfig-%@", a3];
  id v4 = [objc_alloc((Class)NDAssertion) initWithName:v3];

  return v4;
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCANFHelper)ANFHelper
{
  return self->_ANFHelper;
}

- (NSString)rootDirectory
{
  return self->_rootDirectory;
}

- (NDContentArchiveStore)archiveStore
{
  return self->_archiveStore;
}

- (NSMutableArray)interestTokens
{
  return self->_interestTokens;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interestTokens, 0);
  objc_storeStrong((id *)&self->_archiveStore, 0);
  objc_storeStrong((id *)&self->_rootDirectory, 0);
  objc_storeStrong((id *)&self->_ANFHelper, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end