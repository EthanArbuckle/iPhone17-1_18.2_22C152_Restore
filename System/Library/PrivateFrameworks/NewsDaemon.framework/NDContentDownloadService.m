@interface NDContentDownloadService
+ (id)_cacheLookupQueue;
+ (id)_downloadQueue;
- (BOOL)_canRetryDownloadWithError:(id)a3;
- (BOOL)_hasReachedStorageLimits;
- (BOOL)_isFatalError:(id)a3;
- (FCANFHelper)ANFHelper;
- (FCContentContext)contentContext;
- (FCContentManifest)activeDownloadManifest;
- (FCKeyedOperationQueue)downloadKeyedOperationQueue;
- (NDContentArchiveStore)contentArchiveStore;
- (NDContentDownloadService)initWithContentContext:(id)a3 ANFHelper:(id)a4;
- (NDDownloadConsumerProxy)currentConsumer;
- (NDDownloadLimits)downloadLimits;
- (NDDownloadOperationFactory)operationFactory;
- (NDDownloadRequest)activeDownloadRequest;
- (NDDownloadServiceStore)store;
- (NSArray)downloadRequests;
- (NSMutableDictionary)errorsByContentID;
- (NSMutableDictionary)interestTokensByContentID;
- (NSMutableSet)downloadedContentIDs;
- (NSXPCConnection)currentConnection;
- (OS_dispatch_group)prewarmGroup;
- (OS_dispatch_queue)xpcMessageQueue;
- (double)activeDownloadProgress;
- (id)_downloadKeyQueue;
- (id)_unfinishedRequests;
- (id)keyedOperationQueue:(id)a3 performAsyncOperationForKey:(id)a4 completion:(id)a5;
- (int)batteryStateNotificationToken;
- (unint64_t)_storageUsedByDownloads;
- (void)_catchUpConsumer;
- (void)_initMain;
- (void)_prewarmFromLastKnownRequests;
- (void)_pruneUnneededInterestTokens;
- (void)_recordWhetherTasksAreUnfinished;
- (void)_revisitDownloadQueue;
- (void)batteryStateDidChange;
- (void)dealloc;
- (void)flushCacheLookupsWithCompletion:(id)a3;
- (void)ping;
- (void)powerStateDidChange;
- (void)registerDownloadConsumer:(id)a3;
- (void)setActiveDownloadManifest:(id)a3;
- (void)setActiveDownloadProgress:(double)a3;
- (void)setActiveDownloadRequest:(id)a3;
- (void)setCurrentConnection:(id)a3;
- (void)setCurrentConsumer:(id)a3;
- (void)setDownloadLimits:(id)a3;
- (void)setDownloadRequests:(id)a3;
- (void)setDownloadedContentIDs:(id)a3;
- (void)setErrorsByContentID:(id)a3;
- (void)setInterestTokensByContentID:(id)a3;
@end

@implementation NDContentDownloadService

- (NDContentDownloadService)initWithContentContext:(id)a3 ANFHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100048214();
  }
  v30.receiver = self;
  v30.super_class = (Class)NDContentDownloadService;
  id v9 = [(NDContentDownloadService *)&v30 init];
  if (v9)
  {
    v10 = [NDDownloadServiceStore alloc];
    v11 = [v7 contentDirectory];
    v12 = [(NDDownloadServiceStore *)v10 initWithParentDirectory:v11];
    v13 = (void *)*((void *)v9 + 5);
    *((void *)v9 + 5) = v12;

    objc_storeStrong((id *)v9 + 6, a3);
    objc_storeStrong((id *)v9 + 7, a4);
    id v14 = objc_alloc_init((Class)NSMutableSet);
    v15 = (void *)*((void *)v9 + 16);
    *((void *)v9 + 16) = v14;

    id v16 = objc_alloc_init((Class)NSMutableDictionary);
    v17 = (void *)*((void *)v9 + 17);
    *((void *)v9 + 17) = v16;

    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    v19 = (void *)*((void *)v9 + 18);
    *((void *)v9 + 18) = v18;

    v20 = [[NDDownloadOperationFactory alloc] initWithContext:v7 ANFHelper:*((void *)v9 + 7)];
    v21 = (void *)*((void *)v9 + 8);
    *((void *)v9 + 8) = v20;

    v22 = [NDContentArchiveStore alloc];
    v23 = [v7 contentDirectory];
    v24 = [(NDContentArchiveStore *)v22 initWithCacheDirectory:v23];
    v25 = (void *)*((void *)v9 + 11);
    *((void *)v9 + 11) = v24;

    dispatch_group_t v26 = dispatch_group_create();
    v27 = (void *)*((void *)v9 + 9);
    *((void *)v9 + 9) = v26;

    dispatch_group_enter(*((dispatch_group_t *)v9 + 9));
    id v29 = v9;
    FCPerformBlockOnMainThread();
  }
  return (NDContentDownloadService *)v9;
}

- (void)_initMain
{
  +[NSThread isMainThread];
  v3 = (FCKeyedOperationQueue *)[objc_alloc((Class)FCKeyedOperationQueue) initWithDelegate:self maxConcurrentOperationCount:1];
  downloadKeyedOperationQueue = self->_downloadKeyedOperationQueue;
  self->_downloadKeyedOperationQueue = v3;

  [(FCKeyedOperationQueue *)self->_downloadKeyedOperationQueue setLog:FCOfflineDownloadsLog];
  v5 = +[FCNetworkReachability sharedNetworkReachability];
  [v5 addObserver:self];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"powerStateDidChange" name:NSProcessInfoPowerStateDidChangeNotification object:0];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000A1C0;
  handler[3] = &unk_1000619F8;
  handler[4] = self;
  notify_register_dispatch("com.apple.system.powersources.source", &self->_batteryStateNotificationToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  [(NDContentDownloadService *)self _prewarmFromLastKnownRequests];
}

- (void)dealloc
{
  notify_cancel(self->_batteryStateNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)NDContentDownloadService;
  [(NDContentDownloadService *)&v3 dealloc];
}

- (OS_dispatch_queue)xpcMessageQueue
{
  id v2 = &_dispatch_main_q;
  return (OS_dispatch_queue *)&_dispatch_main_q;
}

- (void)setCurrentConnection:(id)a3
{
  id v4 = a3;
  v5 = [(NDContentDownloadService *)self currentConsumer];

  if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100048300();
  }
  objc_storeWeak((id *)&self->_currentConnection, v4);
}

- (void)registerDownloadConsumer:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  v5 = (void *)os_transaction_create();
  v6 = [(NDContentDownloadService *)self prewarmGroup];
  int IsEmpty = FCDispatchGroupIsEmpty();

  if (IsEmpty)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000A43C;
    v18[3] = &unk_100061980;
    id v8 = &v19;
    v18[4] = self;
    id v19 = v4;
    id v9 = &v20;
    v20 = v5;
    id v10 = v5;
    id v11 = v4;
    sub_10000A43C((uint64_t)v18);
  }
  else
  {
    v12 = [(NDContentDownloadService *)self prewarmGroup];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000A5A0;
    v15[3] = &unk_100061980;
    id v8 = &v16;
    v15[4] = self;
    id v16 = v4;
    id v9 = &v17;
    v17 = v5;
    id v13 = v5;
    id v14 = v4;
    dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, v15);
  }
}

- (void)setDownloadRequests:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  v5 = (void *)os_transaction_create();
  v6 = [(NDContentDownloadService *)self prewarmGroup];
  int IsEmpty = FCDispatchGroupIsEmpty();

  if (IsEmpty)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000A888;
    v18[3] = &unk_100061980;
    id v8 = &v19;
    v18[4] = self;
    id v19 = v4;
    id v9 = &v20;
    v20 = v5;
    id v10 = v5;
    id v11 = v4;
    sub_10000A888((uint64_t)v18);
  }
  else
  {
    v12 = [(NDContentDownloadService *)self prewarmGroup];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000A9C8;
    v15[3] = &unk_100061980;
    id v8 = &v16;
    v15[4] = self;
    id v16 = v4;
    id v9 = &v17;
    v17 = v5;
    id v13 = v5;
    id v14 = v4;
    dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, v15);
  }
}

- (void)setDownloadLimits:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  v5 = (void *)os_transaction_create();
  v6 = [(NDContentDownloadService *)self prewarmGroup];
  int IsEmpty = FCDispatchGroupIsEmpty();

  if (IsEmpty)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000AC8C;
    v18[3] = &unk_100061980;
    id v8 = (id *)v19;
    v19[0] = v4;
    v19[1] = self;
    id v9 = &v20;
    v20 = v5;
    id v10 = v5;
    id v11 = v4;
    sub_10000AC8C((uint64_t)v18);
  }
  else
  {
    v12 = [(NDContentDownloadService *)self prewarmGroup];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000AD5C;
    v15[3] = &unk_100061980;
    id v8 = (id *)v16;
    v16[0] = v4;
    v16[1] = self;
    id v9 = &v17;
    v17 = v5;
    id v13 = v5;
    id v14 = v4;
    dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, v15);
  }
}

- (void)flushCacheLookupsWithCompletion:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  v5 = (void *)os_transaction_create();
  v6 = [(NDContentDownloadService *)self prewarmGroup];
  int IsEmpty = FCDispatchGroupIsEmpty();

  if (IsEmpty)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000AFB8;
    v18[3] = &unk_100061A48;
    id v8 = &v20;
    id v19 = v5;
    id v20 = v4;
    id v9 = &v19;
    void v18[4] = self;
    id v10 = v5;
    id v11 = v4;
    sub_10000AFB8((uint64_t)v18);
  }
  else
  {
    v12 = [(NDContentDownloadService *)self prewarmGroup];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000B13C;
    v15[3] = &unk_100061A48;
    id v8 = &v17;
    id v16 = v5;
    id v17 = v4;
    id v9 = &v16;
    void v15[4] = self;
    id v13 = v5;
    id v14 = v4;
    dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, v15);
  }
}

- (void)ping
{
  id v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "received ping from another process", v3, 2u);
  }
}

- (id)keyedOperationQueue:(id)a3 performAsyncOperationForKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  +[NSThread isMainThread];
  id v11 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    id v13 = [v9 description];
    *(_DWORD *)buf = 138543362;
    v37 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "will handle next request in queue, request=%{public}@", buf, 0xCu);
  }
  [(NDContentDownloadService *)self setActiveDownloadRequest:v9];
  id v14 = [(NDContentDownloadService *)self contentArchiveStore];
  v15 = [v9 contentID];
  id v16 = [v14 interestTokenForContentID:v15];

  id v17 = [(NDContentDownloadService *)self contentArchiveStore];
  id v18 = [v9 contentID];
  [v17 prepareForContentID:v18];

  id v19 = [(NDContentDownloadService *)self operationFactory];
  id v20 = [v19 operationForRequest:v9];

  if (v20)
  {
    id v21 = v20;
    [v21 setCachedOnly:0];
    [v21 setRelativePriority:-1];
    [v21 setQualityOfService:9];
    [v21 setArchiveQueue:&_dispatch_main_q];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10000B76C;
    v34[3] = &unk_100061A70;
    v34[4] = self;
    id v22 = v9;
    id v35 = v22;
    [v21 setArchiveHandler:v34];
    [v21 setProgressQueue:&_dispatch_main_q];

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10000B8D4;
    v32[3] = &unk_100061A98;
    v32[4] = self;
    id v23 = v22;
    id v33 = v23;
    [v21 setProgressHandler:v32];
    objc_initWeak((id *)buf, v21);
    [v21 setFetchCompletionQueue:&_dispatch_main_q];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000B974;
    v26[3] = &unk_100061AE8;
    objc_copyWeak(&v31, (id *)buf);
    id v27 = v23;
    id v30 = v10;
    v28 = self;
    id v29 = v16;
    [v21 setFetchCompletionHandler:v26];
    v24 = [(id)objc_opt_class() _downloadQueue];
    [v24 addOperation:v21];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    +[NSException raise:NSGenericException format:@"Failed to create operation for download request"];
  }

  return v20;
}

- (void)powerStateDidChange
{
}

- (void)batteryStateDidChange
{
}

- (void)_prewarmFromLastKnownRequests
{
  +[NSThread isMainThread];
  id v33 = (void *)os_transaction_create();
  objc_super v3 = [(NDContentDownloadService *)self store];
  id v4 = [v3 lastKnownRequests];
  downloadRequests = self->_downloadRequests;
  self->_downloadRequests = v4;

  v6 = [(NDContentDownloadService *)self store];
  id v7 = [v6 lastKnownLimits];
  downloadLimits = self->_downloadLimits;
  self->_downloadLimits = v7;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [(NDContentDownloadService *)self downloadRequests];
  id v36 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v42;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v42 != v35) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v9);
        v12 = +[NSMutableArray array];
        id v13 = [(NDContentDownloadService *)self contentArchiveStore];
        id v14 = [v10 contentID];
        v15 = [v13 interestTokenForContentID:v14];

        [v12 addObject:v15];
        id v16 = [(NDContentDownloadService *)self contentArchiveStore];
        id v17 = [v10 contentID];
        id v18 = [v16 manifestForContentID:v17];

        if (v18)
        {
          id v19 = [v18 copyWithAssetsOnly];
          id v20 = [(NDContentDownloadService *)self contentContext];
          id v21 = [v20 interestTokenForContentManifest:v19];

          [v12 addObject:v21];
        }
        id v22 = [(NDContentDownloadService *)self interestTokensByContentID];
        id v23 = [v10 contentID];
        [v22 setObject:v12 forKey:v23];

        v24 = [(NDContentDownloadService *)self contentArchiveStore];
        v25 = [v10 contentID];
        unsigned int v26 = [v24 isContentIDComplete:v25];

        if (v26)
        {
          id v27 = [(NDContentDownloadService *)self downloadedContentIDs];
          v28 = [v10 contentID];
          [v27 addObject:v28];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v36 != v9);
      id v36 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v36);
  }

  id v29 = [(id)objc_opt_class() _cacheLookupQueue];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10000C5B0;
  v40[3] = &unk_100061828;
  v40[4] = self;
  objc_msgSend(v29, "fc_addMainThreadOperationWithBlock:", v40);

  id v30 = [(id)objc_opt_class() _cacheLookupQueue];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10000C620;
  v39[3] = &unk_100061828;
  v39[4] = self;
  objc_msgSend(v30, "fc_addMainThreadOperationWithBlock:", v39);

  id v31 = [(id)objc_opt_class() _cacheLookupQueue];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10000C628;
  v37[3] = &unk_1000618B8;
  v37[4] = self;
  id v38 = v33;
  id v32 = v33;
  [v31 addOperationWithBlock:v37];
}

- (void)_catchUpConsumer
{
  +[NSThread isMainThread];
  objc_super v3 = [(NDContentDownloadService *)self downloadRequests];
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_10000CD8C;
  v74[3] = &unk_100061B10;
  v74[4] = self;
  id v4 = objc_msgSend(v3, "fc_arrayOfObjectsPassingTest:", v74);

  v5 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    id v7 = [(NDContentDownloadService *)self currentConsumer];
    objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &stru_100061B50);
    id v8 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v78 = v7;
    __int16 v79 = 2114;
    v80 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "will catch up consumer %p on downloaded contentIDs=%{public}@", buf, 0x16u);
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v4;
  id v9 = [obj countByEnumeratingWithState:&v70 objects:v83 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v71;
    do
    {
      v12 = 0;
      id v60 = v10;
      do
      {
        if (*(void *)v71 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v70 + 1) + 8 * (void)v12);
        id v14 = [(NDContentDownloadService *)self contentArchiveStore];
        v15 = [v13 contentID];
        unsigned __int8 v16 = [v14 isContentIDComplete:v15];

        if (v16)
        {
          id v17 = [(NDContentDownloadService *)self contentArchiveStore];
          id v18 = [v13 contentID];
          id v19 = [v17 archivesForContentID:v18];

          id v20 = (void *)FCOperationLog;
          if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = v20;
            id v22 = (const char *)[v19 count];
            id v23 = [v13 contentID];
            *(_DWORD *)buf = 134218242;
            v78 = v22;
            __int16 v79 = 2114;
            v80 = v23;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "will send %lu content archives to consumer for contentID=%{public}@", buf, 0x16u);
          }
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v24 = v19;
          id v25 = [v24 countByEnumeratingWithState:&v66 objects:v76 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v67;
            do
            {
              for (i = 0; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v67 != v27) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v29 = *(void *)(*((void *)&v66 + 1) + 8 * i);
                id v30 = [(NDContentDownloadService *)self currentConsumer];
                [v30 downloadProgressedForRequest:v13 contentArchive:v29];
              }
              id v26 = [v24 countByEnumeratingWithState:&v66 objects:v76 count:16];
            }
            while (v26);
          }

          id v31 = [(NDContentDownloadService *)self currentConsumer];
          [v31 downloadFinishedForRequest:v13 error:0];

          id v10 = v60;
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          id v32 = objc_alloc((Class)NSString);
          id v33 = [v13 contentID];
          id v34 = [v32 initWithFormat:@"download is finished but archives are missing for contentID=%@", v33];
          *(_DWORD *)buf = 136315906;
          v78 = "-[NDContentDownloadService _catchUpConsumer]";
          __int16 v79 = 2080;
          v80 = "NDContentDownloadService.m";
          __int16 v81 = 1024;
          LODWORD(v82[0]) = 405;
          WORD2(v82[0]) = 2114;
          *(void *)((char *)v82 + 6) = v34;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id v10 = [obj countByEnumeratingWithState:&v70 objects:v83 count:16];
    }
    while (v10);
  }

  uint64_t v35 = [(NDContentDownloadService *)self activeDownloadRequest];
  if (v35)
  {
    id v36 = (void *)v35;
    v37 = [(NDContentDownloadService *)self downloadRequests];
    id v38 = [(NDContentDownloadService *)self activeDownloadRequest];
    unsigned int v39 = [v37 containsObject:v38];

    if (v39)
    {
      v40 = (void *)FCOfflineDownloadsLog;
      if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
      {
        long long v41 = v40;
        long long v42 = [(NDContentDownloadService *)self currentConsumer];
        long long v43 = [(NDContentDownloadService *)self activeDownloadRequest];
        long long v44 = [v43 contentID];
        [(NDContentDownloadService *)self activeDownloadProgress];
        *(_DWORD *)buf = 134218498;
        v78 = v42;
        __int16 v79 = 2114;
        v80 = v44;
        __int16 v81 = 2048;
        v82[0] = v45;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "will catch up consumer %p on active download id=%{public}@, progress=%.2f", buf, 0x20u);
      }
      v46 = [(NDContentDownloadService *)self currentConsumer];
      v47 = [(NDContentDownloadService *)self activeDownloadRequest];
      [(NDContentDownloadService *)self activeDownloadProgress];
      objc_msgSend(v46, "downloadProgressedForRequest:progress:", v47);

      v48 = [(NDContentDownloadService *)self contentArchiveStore];
      v49 = [(NDContentDownloadService *)self activeDownloadRequest];
      v50 = [v49 contentID];
      v51 = [v48 archivesForContentID:v50];

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v52 = v51;
      id v53 = [v52 countByEnumeratingWithState:&v62 objects:v75 count:16];
      if (v53)
      {
        id v54 = v53;
        uint64_t v55 = *(void *)v63;
        do
        {
          for (j = 0; j != v54; j = (char *)j + 1)
          {
            if (*(void *)v63 != v55) {
              objc_enumerationMutation(v52);
            }
            uint64_t v57 = *(void *)(*((void *)&v62 + 1) + 8 * (void)j);
            v58 = [(NDContentDownloadService *)self currentConsumer];
            v59 = [(NDContentDownloadService *)self activeDownloadRequest];
            [v58 downloadProgressedForRequest:v59 contentArchive:v57];
          }
          id v54 = [v52 countByEnumeratingWithState:&v62 objects:v75 count:16];
        }
        while (v54);
      }
    }
  }
}

- (void)_revisitDownloadQueue
{
  +[NSThread isMainThread];
  objc_super v3 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    v5 = [(NDContentDownloadService *)self downloadRequests];
    v6 = [(NDContentDownloadService *)self downloadedContentIDs];
    id v7 = [(NDContentDownloadService *)self errorsByContentID];
    *(_DWORD *)buf = 138543874;
    id v21 = v5;
    __int16 v22 = 2114;
    id v23 = v6;
    __int16 v24 = 2114;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "will revisit queues with requests=%{public}@, downloadFinished=%{public}@, errors=%{public}@", buf, 0x20u);
  }
  id v8 = [(NDContentDownloadService *)self _downloadKeyQueue];
  id v9 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    uint64_t v11 = [v8 array];
    v12 = objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", &stru_100061B70);
    *(_DWORD *)buf = 138543362;
    id v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "will perform downloads with queue=%{public}@", buf, 0xCu);
  }
  id v13 = [(NDContentDownloadService *)self downloadKeyedOperationQueue];
  [v13 setKeyQueue:v8];

  [(NDContentDownloadService *)self _recordWhetherTasksAreUnfinished];
  id v14 = [(NDContentDownloadService *)self ANFHelper];
  [v14 pushInterest];

  v15 = (void *)os_transaction_create();
  unsigned __int8 v16 = [(NDContentDownloadService *)self downloadKeyedOperationQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000D084;
  v18[3] = &unk_1000618B8;
  void v18[4] = self;
  id v19 = v15;
  id v17 = v15;
  [v16 notifyWhenAllOperationsAreFinishedUsingBlock:v18];
}

- (id)_downloadKeyQueue
{
  +[NSThread isMainThread];
  objc_super v3 = +[FCNetworkReachability sharedNetworkReachability];
  id v4 = +[NSProcessInfo processInfo];
  unsigned int v5 = [v3 isNetworkReachable];
  if ([v3 isNetworkOnlyReachableViaCellular]) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = [v3 isNetworkUsageExpensive];
  }
  unsigned int v7 = [v3 isLowDataModeEnabled];
  unsigned int v8 = [v4 isLowPowerModeEnabled];
  int v9 = IOPSDrawingUnlimitedPower();
  unsigned int v10 = [(NDContentDownloadService *)self _hasReachedStorageLimits];
  uint64_t v11 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"false";
    if (v5) {
      CFStringRef v13 = @"true";
    }
    else {
      CFStringRef v13 = @"false";
    }
    if (v6) {
      CFStringRef v14 = @"true";
    }
    else {
      CFStringRef v14 = @"false";
    }
    *(_DWORD *)buf = 138544642;
    CFStringRef v31 = v13;
    if (v7) {
      CFStringRef v15 = @"true";
    }
    else {
      CFStringRef v15 = @"false";
    }
    __int16 v32 = 2114;
    CFStringRef v33 = v14;
    if (v8) {
      CFStringRef v16 = @"true";
    }
    else {
      CFStringRef v16 = @"false";
    }
    __int16 v34 = 2114;
    CFStringRef v35 = v15;
    if (v9) {
      CFStringRef v17 = @"false";
    }
    else {
      CFStringRef v17 = @"true";
    }
    __int16 v36 = 2114;
    CFStringRef v37 = v16;
    if (v10) {
      CFStringRef v12 = @"true";
    }
    __int16 v38 = 2114;
    CFStringRef v39 = v17;
    __int16 v40 = 2114;
    CFStringRef v41 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "will filter download requests with networkReachable=%{public}@, expensiveNetwork=%{public}@, lowDataMode=%{public}@, lowPowerMode=%{public}@, batteryPowered=%{public}@, lowStorage=%{public}@", buf, 0x3Eu);
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000D3F8;
  v24[3] = &unk_100061B90;
  char v25 = v6;
  char v26 = v7;
  char v27 = v8;
  char v28 = v9 ^ 1;
  char v29 = v10;
  id v18 = objc_retainBlock(v24);
  id v19 = [(NDContentDownloadService *)self _unfinishedRequests];
  id v20 = objc_msgSend(v19, "fc_arrayOfObjectsPassingTest:", v18);

  id v21 = [(NDContentDownloadService *)self downloadedContentIDs];
  [v21 count];
  [v20 count];

  __int16 v22 = +[NSOrderedSet orderedSetWithArray:v20];

  return v22;
}

- (id)_unfinishedRequests
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D754;
  v7[3] = &unk_100061B10;
  v7[4] = self;
  objc_super v3 = objc_retainBlock(v7);
  id v4 = [(NDContentDownloadService *)self downloadRequests];
  unsigned int v5 = objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", v3);

  return v5;
}

- (BOOL)_canRetryDownloadWithError:(id)a3
{
  if ([(NDContentDownloadService *)self _isFatalError:a3]) {
    return 0;
  }
  id v4 = +[FCNetworkReachability sharedNetworkReachability];
  unsigned __int8 v5 = [v4 isNetworkReachable];

  return v5;
}

- (BOOL)_isFatalError:(id)a3
{
  id v3 = a3;
  if ((objc_msgSend(v3, "fc_isOfflineError") & 1) != 0
    || (objc_msgSend(v3, "fc_isCancellationError") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    unsigned int v4 = objc_msgSend(v3, "fc_isRecoverableNetworkError") ^ 1;
  }

  return v4;
}

- (void)_pruneUnneededInterestTokens
{
  +[NSThread isMainThread];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DA30;
  v7[3] = &unk_100061BB8;
  v7[4] = self;
  id v3 = +[NSSet fc_set:v7];
  unsigned int v4 = FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "pruning interest tokens not in list=%{public}@", buf, 0xCu);
  }
  unsigned __int8 v5 = [(NDContentDownloadService *)self interestTokensByContentID];
  objc_msgSend(v5, "fc_removeObjectsForKeysNotInSet:", v3);

  unsigned int v6 = [(NDContentDownloadService *)self downloadedContentIDs];
  [v6 intersectSet:v3];
}

- (void)_recordWhetherTasksAreUnfinished
{
  +[NSThread isMainThread];
  id v3 = [(NDContentDownloadService *)self _unfinishedRequests];
  id v4 = [v3 count];
  unsigned __int8 v5 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      CFStringRef v6 = @"unfinished";
    }
    else {
      CFStringRef v6 = @"finished";
    }
    unsigned int v7 = v5;
    int v9 = 138543618;
    CFStringRef v10 = v6;
    __int16 v11 = 2048;
    id v12 = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "recording that work is %{public}@ due to unfinished count=%lu", (uint8_t *)&v9, 0x16u);
  }
  unsigned int v8 = NewsCoreUserDefaults();
  [v8 setBool:v4 != 0 forKey:NDDownloadServiceHasUnfinishedWorkKey];
}

- (BOOL)_hasReachedStorageLimits
{
  +[NSThread isMainThread];
  id v3 = [(NDContentDownloadService *)self contentContext];
  id v4 = [v3 contentHostDirectoryURL];

  id v5 = objc_msgSend(v4, "fc_fileSystemFreeSize");
  CFStringRef v6 = [(NDContentDownloadService *)self downloadLimits];
  id v7 = [v6 minDeviceStorage];

  if (v5 <= v7)
  {
    CFStringRef v17 = (void *)FCOfflineDownloadsLog;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v17;
      CFStringRef v13 = +[NSByteCountFormatter stringFromByteCount:v5 countStyle:0];
      CFStringRef v14 = [(NDContentDownloadService *)self downloadLimits];
      CFStringRef v15 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v14 minDeviceStorage], 0);
      int v20 = 138543618;
      id v21 = v13;
      __int16 v22 = 2114;
      id v23 = v15;
      CFStringRef v16 = "available device storage has reached minimum, available=%{public}@, minimum=%{public}@";
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t v8 = [(NDContentDownloadService *)self _storageUsedByDownloads];
    int v9 = [(NDContentDownloadService *)self downloadLimits];
    id v10 = [v9 maxDownloadStorage];

    if (v8 <= (unint64_t)v10)
    {
      BOOL v18 = 0;
      goto LABEL_10;
    }
    __int16 v11 = (void *)FCOfflineDownloadsLog;
    if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      CFStringRef v13 = +[NSByteCountFormatter stringFromByteCount:v8 countStyle:0];
      CFStringRef v14 = [(NDContentDownloadService *)self downloadLimits];
      CFStringRef v15 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v14 maxDownloadStorage], 0);
      int v20 = 138543618;
      id v21 = v13;
      __int16 v22 = 2114;
      id v23 = v15;
      CFStringRef v16 = "download storage has reached maximum, used=%{public}@, maximum=%{public}@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0x16u);
    }
  }
  BOOL v18 = 1;
LABEL_10:

  return v18;
}

- (unint64_t)_storageUsedByDownloads
{
  id v3 = [(NDContentDownloadService *)self contentContext];
  id v4 = (char *)[v3 storageSize];
  id v5 = [(NDContentDownloadService *)self contentArchiveStore];
  CFStringRef v6 = &v4[(void)[v5 storageSize]];

  return (unint64_t)v6;
}

+ (id)_cacheLookupQueue
{
  if (qword_10006BCB0 != -1) {
    dispatch_once(&qword_10006BCB0, &stru_100061BF8);
  }
  id v2 = (void *)qword_10006BCA8;

  return v2;
}

+ (id)_downloadQueue
{
  if (qword_10006BCC0[0] != -1) {
    dispatch_once(qword_10006BCC0, &stru_100061C18);
  }
  id v2 = (void *)qword_10006BCB8;

  return v2;
}

- (NSXPCConnection)currentConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (NSArray)downloadRequests
{
  return self->_downloadRequests;
}

- (NDDownloadLimits)downloadLimits
{
  return self->_downloadLimits;
}

- (NDDownloadServiceStore)store
{
  return self->_store;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (FCANFHelper)ANFHelper
{
  return self->_ANFHelper;
}

- (NDDownloadOperationFactory)operationFactory
{
  return self->_operationFactory;
}

- (OS_dispatch_group)prewarmGroup
{
  return self->_prewarmGroup;
}

- (FCKeyedOperationQueue)downloadKeyedOperationQueue
{
  return self->_downloadKeyedOperationQueue;
}

- (int)batteryStateNotificationToken
{
  return self->_batteryStateNotificationToken;
}

- (NDContentArchiveStore)contentArchiveStore
{
  return self->_contentArchiveStore;
}

- (NDDownloadRequest)activeDownloadRequest
{
  return self->_activeDownloadRequest;
}

- (void)setActiveDownloadRequest:(id)a3
{
}

- (FCContentManifest)activeDownloadManifest
{
  return self->_activeDownloadManifest;
}

- (void)setActiveDownloadManifest:(id)a3
{
}

- (double)activeDownloadProgress
{
  return self->_activeDownloadProgress;
}

- (void)setActiveDownloadProgress:(double)a3
{
  self->_activeDownloadProgress = a3;
}

- (NDDownloadConsumerProxy)currentConsumer
{
  return self->_currentConsumer;
}

- (void)setCurrentConsumer:(id)a3
{
}

- (NSMutableSet)downloadedContentIDs
{
  return self->_downloadedContentIDs;
}

- (void)setDownloadedContentIDs:(id)a3
{
}

- (NSMutableDictionary)interestTokensByContentID
{
  return self->_interestTokensByContentID;
}

- (void)setInterestTokensByContentID:(id)a3
{
}

- (NSMutableDictionary)errorsByContentID
{
  return self->_errorsByContentID;
}

- (void)setErrorsByContentID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsByContentID, 0);
  objc_storeStrong((id *)&self->_interestTokensByContentID, 0);
  objc_storeStrong((id *)&self->_downloadedContentIDs, 0);
  objc_storeStrong((id *)&self->_currentConsumer, 0);
  objc_storeStrong((id *)&self->_activeDownloadManifest, 0);
  objc_storeStrong((id *)&self->_activeDownloadRequest, 0);
  objc_storeStrong((id *)&self->_contentArchiveStore, 0);
  objc_storeStrong((id *)&self->_downloadKeyedOperationQueue, 0);
  objc_storeStrong((id *)&self->_prewarmGroup, 0);
  objc_storeStrong((id *)&self->_operationFactory, 0);
  objc_storeStrong((id *)&self->_ANFHelper, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_downloadLimits, 0);
  objc_storeStrong((id *)&self->_downloadRequests, 0);

  objc_destroyWeak((id *)&self->_currentConnection);
}

@end