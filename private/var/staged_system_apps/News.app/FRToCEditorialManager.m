@interface FRToCEditorialManager
- (BOOL)_editorialItemHasBadge:(id)a3;
- (FCANFHelper)ANFHelper;
- (FCCloudContext)cloudContext;
- (FCKeyValueStore)localStore;
- (FCOperationThrottler)refreshThrottler;
- (FRAppActivityMonitor)activityMonitor;
- (FREditorialConfigurationProvider)editorialConfigurationProvider;
- (FREditorialItemDownloader)articleEditorialItemDownloader;
- (FREditorialItemDownloader)tagEditorialItemDownloader;
- (FREditorialItemEntryManager)editorialItemEntryManager;
- (FREditorialItemThumbnailCreator)thumbnailCreator;
- (FRToCEditorialManager)init;
- (FRToCEditorialManager)initWithCloudContext:(id)a3 activityMonitor:(id)a4 editorialItemEntryManager:(id)a5 articleEditorialItemDownloader:(id)a6 tagEditorialItemDownloader:(id)a7 editorialConfigurationProvider:(id)a8 thumbnailCreator:(id)a9 ANFHelper:(id)a10;
- (NSMutableArray)interestTokens;
- (TSEditorialItemChangeDelegate)itemChangeDelegate;
- (id)cachedEditorialItems;
- (void)_fetchInterestTokenForArticleID:(id)a3 completion:(id)a4;
- (void)_fetchTagsAndRefreshEditorialItems;
- (void)_refreshEditorialItemsOrderedWith:(id)a3;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
- (void)prewarmWithCompletion:(id)a3;
- (void)processOverrideEditorialItems:(id)a3;
- (void)refreshEditorialItems;
- (void)removeBadgeForArticleID:(id)a3;
- (void)setInterestTokens:(id)a3;
- (void)setItemChangeDelegate:(id)a3;
- (void)tappedEditorialItemWithIdentifier:(id)a3;
@end

@implementation FRToCEditorialManager

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100046194;
  v5[3] = &unk_1000C5988;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:v5];
}

- (FRToCEditorialManager)initWithCloudContext:(id)a3 activityMonitor:(id)a4 editorialItemEntryManager:(id)a5 articleEditorialItemDownloader:(id)a6 tagEditorialItemDownloader:(id)a7 editorialConfigurationProvider:(id)a8 thumbnailCreator:(id)a9 ANFHelper:(id)a10
{
  id v16 = a3;
  id v33 = a4;
  id v17 = a5;
  id obj = a6;
  id v35 = a6;
  id v31 = a7;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v34 = v16;
  if (!v16 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100076BE4();
    if (v17) {
      goto LABEL_6;
    }
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100076B20();
  }
LABEL_6:
  if (!v35 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100076A5C();
    if (v18) {
      goto LABEL_11;
    }
  }
  else if (v18)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100076998();
  }
LABEL_11:
  if (!v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000768D4();
    if (v20) {
      goto LABEL_16;
    }
  }
  else if (v20)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100076810();
  }
LABEL_16:
  if (!v21 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007674C();
  }
  v36.receiver = self;
  v36.super_class = (Class)FRToCEditorialManager;
  v22 = [(FRToCEditorialManager *)&v36 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_cloudContext, a3);
    objc_storeStrong((id *)&v23->_activityMonitor, a4);
    [(FRAppActivityMonitor *)v23->_activityMonitor addObserver:v23];
    objc_storeStrong((id *)&v23->_editorialConfigurationProvider, a8);
    objc_storeStrong((id *)&v23->_editorialItemEntryManager, a5);
    objc_storeStrong((id *)&v23->_articleEditorialItemDownloader, obja);
    objc_storeStrong((id *)&v23->_tagEditorialItemDownloader, v31);
    objc_storeStrong((id *)&v23->_thumbnailCreator, a9);
    objc_storeStrong((id *)&v23->_ANFHelper, a10);
    uint64_t v24 = +[NSMutableArray array];
    interestTokens = v23->_interestTokens;
    v23->_interestTokens = (NSMutableArray *)v24;

    v26 = (FCOperationThrottler *)[objc_alloc((Class)FCOperationThrottler) initWithDelegate:v23];
    refreshThrottler = v23->_refreshThrottler;
    v23->_refreshThrottler = v26;
  }
  return v23;
}

- (void)setItemChangeDelegate:(id)a3
{
}

- (FCOperationThrottler)refreshThrottler
{
  return self->_refreshThrottler;
}

- (void)refreshEditorialItems
{
  id v2 = [(FRToCEditorialManager *)self refreshThrottler];
  [v2 tickle];
}

- (FRToCEditorialManager)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v6 = "-[FRToCEditorialManager init]";
    __int16 v7 = 2080;
    v8 = "FRToCEditorialManager.m";
    __int16 v9 = 1024;
    int v10 = 66;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRToCEditorialManager init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)processOverrideEditorialItems:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  id v6 = +[NSMutableArray array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v7);
        }
        __int16 v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v12 = [v11 identifier];
        unsigned int v13 = [v12 fc_isValidTagID];

        v14 = [v11 identifier];
        v15 = v14;
        if (v13)
        {
          [v6 addObject:v14];
        }
        else
        {
          unsigned int v16 = [v14 fc_isValidArticleID];

          if (!v16) {
            continue;
          }
          v15 = [v11 identifier];
          [v5 addObject:v15];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v8);
  }

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_100018AE0;
  v33[4] = sub_1000189F8;
  id v34 = +[NSMutableDictionary dictionary];
  id v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  id v18 = [(FRToCEditorialManager *)self articleEditorialItemDownloader];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000430D8;
  v30[3] = &unk_1000C8098;
  v32 = v33;
  id v19 = v17;
  id v31 = v19;
  [v18 downloadEditorialItemWithIDs:v5 completion:v30];

  dispatch_group_enter(v19);
  id v20 = [(FRToCEditorialManager *)self tagEditorialItemDownloader];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100043174;
  v27[3] = &unk_1000C8098;
  v29 = v33;
  id v21 = v19;
  v28 = v21;
  [v20 downloadEditorialItemWithIDs:v6 completion:v27];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043210;
  block[3] = &unk_1000C8160;
  v25 = self;
  v26 = v33;
  id v24 = v7;
  id v22 = v7;
  dispatch_group_notify(v21, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v33, 8);
}

- (BOOL)_editorialItemHasBadge:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [v3 attributes];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100043B14;
  v6[3] = &unk_1000C8188;
  v6[4] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

- (id)cachedEditorialItems
{
  +[NSThread isMainThread];
  id v3 = +[NSMutableArray array];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v4 = [(FRToCEditorialManager *)self editorialItemEntryManager];
  v5 = [v4 orderedEditorialItemIDs];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100043CAC;
  v10[3] = &unk_1000C81B0;
  v10[4] = self;
  id v12 = &v13;
  id v6 = v3;
  id v11 = v6;
  [v5 enumerateObjectsUsingBlock:v10];

  if (*((unsigned char *)v14 + 24)) {
    [(FRToCEditorialManager *)self _fetchTagsAndRefreshEditorialItems];
  }
  uint64_t v7 = v11;
  id v8 = v6;

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)_fetchTagsAndRefreshEditorialItems
{
  +[NSThread isMainThread];
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = objc_opt_new();
  v5 = objc_opt_new();
  id v6 = [(FRToCEditorialManager *)self editorialItemEntryManager];
  uint64_t v7 = [v6 orderedEditorialItemIDs];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100044520;
  v34[3] = &unk_1000C81D8;
  v34[4] = self;
  id v8 = v5;
  id v35 = v8;
  id v9 = v4;
  id v36 = v9;
  [v7 enumerateObjectsUsingBlock:v34];

  char v10 = dispatch_group_create();
  if ([v8 count])
  {
    dispatch_group_enter(v10);
    objc_initWeak(&location, self);
    id v11 = [(FRToCEditorialManager *)self cloudContext];
    id v12 = [v11 articleController];
    uint64_t v13 = [v8 allKeys];
    v14 = [v12 headlinesFetchOperationForArticleIDs:v13];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100044618;
    v28[3] = &unk_1000C8250;
    objc_copyWeak(&v32, &location);
    v29 = v10;
    id v30 = v8;
    id v31 = v3;
    [v14 setFetchCompletionBlock:v28];
    uint64_t v15 = +[NSOperationQueue fc_sharedConcurrentQueue];
    [v15 addOperation:v14];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  if ([v9 count])
  {
    dispatch_group_enter(v10);
    objc_initWeak(&location, self);
    char v16 = [(FRToCEditorialManager *)self cloudContext];
    id v17 = [v16 tagController];
    id v18 = [v9 allKeys];
    id v19 = &_dispatch_main_q;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100044AF0;
    v23[3] = &unk_1000C82A0;
    objc_copyWeak(&v27, &location);
    id v24 = v9;
    id v25 = v3;
    v26 = v10;
    [v17 fetchTagsForTagIDs:v18 qualityOfService:9 callbackQueue:&_dispatch_main_q completionHandler:v23];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044E64;
  block[3] = &unk_1000C56D0;
  void block[4] = self;
  id v22 = v3;
  id v20 = v3;
  dispatch_group_notify(v10, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_refreshEditorialItemsOrderedWith:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  id v6 = [(FRToCEditorialManager *)self editorialItemEntryManager];
  uint64_t v7 = [v6 orderedEditorialItemIDs];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_100044F80;
  v14 = &unk_1000C82C8;
  id v15 = v4;
  id v16 = v5;
  id v8 = v5;
  id v9 = v4;
  [v7 enumerateObjectsUsingBlock:&v11];

  char v10 = [(FRToCEditorialManager *)self itemChangeDelegate];
  [v10 refreshEditorialItemsWithItems:v8];
}

- (void)removeBadgeForArticleID:(id)a3
{
  id v4 = a3;
  v5 = [(FRToCEditorialManager *)self editorialItemEntryManager];
  id v6 = [v5 orderedEditorialItemIDs];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000450A8;
  v8[3] = &unk_1000C80E8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (void)tappedEditorialItemWithIdentifier:(id)a3
{
  id v40 = a3;
  val = self;
  id v4 = [(FRToCEditorialManager *)self editorialItemEntryManager];
  v5 = [v4 editorialItemsByID];
  id v6 = [v5 objectForKey:v40];

  unsigned int v7 = [v6 showBadge];
  v39 = [v6 documentVersion];
  id v8 = [FREditorialItemEntry alloc];
  id v9 = [v6 editorialItemID];
  char v10 = [v6 title];
  id v11 = [v6 subtitle];
  uint64_t v12 = [v6 subtitleColorString];
  uint64_t v13 = [v6 image];
  v14 = [v6 actionUrlString];
  id v15 = [v6 lastModifiedDate];
  LOBYTE(v37) = 0;
  id v16 = [(FREditorialItemEntry *)v8 initWithEditorialItemID:v9 title:v10 subtitle:v11 subtitleColorString:v12 image:v13 actionUrlString:v14 lastModifiedDate:v15 documentVersion:v39 lastSeenDocumentVersion:v39 showBadge:v37];

  id v17 = [(FRToCEditorialManager *)val editorialItemEntryManager];
  [v17 addEditorialItem:v16];

  if (v16) {
    unsigned int v18 = v7;
  }
  else {
    unsigned int v18 = 0;
  }
  if (v18 == 1)
  {
    id v19 = [(FREditorialItemEntry *)v16 editorialItemID];
    unsigned int v20 = [v19 fc_isValidArticleID];

    if (v20)
    {
      id v21 = [(FREditorialItemEntry *)v16 image];

      if (v21)
      {
        id v22 = [(FRToCEditorialManager *)val thumbnailCreator];
        v23 = [(FREditorialItemEntry *)v16 image];
        id v24 = [v22 editorialThumbnailImageWith:v23];
      }
      else
      {
        id v24 = 0;
      }
      objc_initWeak(&location, val);
      id v30 = [(FRToCEditorialManager *)val cloudContext];
      id v31 = [v30 articleController];
      id v32 = [(FREditorialItemEntry *)v16 editorialItemID];
      v49 = v32;
      id v33 = +[NSArray arrayWithObjects:&v49 count:1];
      id v34 = [v31 headlinesFetchOperationForArticleIDs:v33];

      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100045668;
      v44[3] = &unk_1000C82F0;
      objc_copyWeak(&v47, &location);
      v45 = v16;
      id v35 = v24;
      id v46 = v35;
      [v34 setFetchCompletionBlock:v44];
      id v36 = +[NSOperationQueue fc_sharedConcurrentQueue];
      [v36 addOperation:v34];

      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);
    }
    else
    {
      id v25 = [(FREditorialItemEntry *)v16 editorialItemID];
      unsigned int v26 = [v25 fc_isValidTagID];

      if (v26)
      {
        objc_initWeak(&location, val);
        id v27 = [(FRToCEditorialManager *)val cloudContext];
        v28 = [v27 tagController];
        id v29 = &_dispatch_main_q;
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_10004596C;
        v41[3] = &unk_1000C8340;
        objc_copyWeak(&v43, &location);
        v42 = v16;
        [v28 fetchTagForTagID:v40 qualityOfService:25 callbackQueue:&_dispatch_main_q completionHandler:v41];

        objc_destroyWeak(&v43);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)prewarmWithCompletion:(id)a3
{
  uint64_t v13 = a3;
  id v4 = [(FRToCEditorialManager *)self editorialItemEntryManager];
  v14 = [v4 cachedArticleIDs];

  if ([v14 count])
  {
    objc_initWeak(location, self);
    v5 = dispatch_group_create();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v14;
    id v6 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v22;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v8);
          dispatch_group_enter(v5);
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_100045EC8;
          v18[3] = &unk_1000C8368;
          objc_copyWeak(&v20, location);
          id v19 = v5;
          [(FRToCEditorialManager *)self _fetchInterestTokenForArticleID:v9 completion:v18];

          objc_destroyWeak(&v20);
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v6);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100045FE4;
    block[3] = &unk_1000C6E28;
    id v17 = v13;
    char v10 = v13;
    dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(location);
  }
  else
  {
    location[1] = _NSConcreteStackBlock;
    location[2] = (id)3221225472;
    location[3] = sub_100045EB0;
    location[4] = &unk_1000C6E28;
    id v26 = v13;
    if (v13)
    {
      id v11 = (void (*)(void))v13[2];
      uint64_t v12 = v13;
      v11();
    }
  }
}

- (void)_fetchInterestTokenForArticleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100076E04();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100076D40();
  }
LABEL_6:
  id v8 = objc_alloc((Class)FCOfflineArticleFetchOperation);
  uint64_t v9 = [(FRToCEditorialManager *)self cloudContext];
  char v10 = [(FRToCEditorialManager *)self ANFHelper];
  id v11 = [v8 initWithContext:v9 ANFHelper:v10 articleID:v6];

  [v11 setQualityOfService:9];
  [v11 setRelativePriority:-1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100046174;
  v13[3] = &unk_1000C8390;
  id v14 = v7;
  id v12 = v7;
  [v11 setFetchCompletionHandler:v13];
  +[FCTaskScheduler scheduleLowPriorityOperation:v11];
}

- (TSEditorialItemChangeDelegate)itemChangeDelegate
{
  return self->itemChangeDelegate;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (FRAppActivityMonitor)activityMonitor
{
  return self->_activityMonitor;
}

- (FREditorialConfigurationProvider)editorialConfigurationProvider
{
  return self->_editorialConfigurationProvider;
}

- (FCKeyValueStore)localStore
{
  return self->_localStore;
}

- (NSMutableArray)interestTokens
{
  return self->_interestTokens;
}

- (void)setInterestTokens:(id)a3
{
}

- (FREditorialItemEntryManager)editorialItemEntryManager
{
  return self->_editorialItemEntryManager;
}

- (FREditorialItemDownloader)articleEditorialItemDownloader
{
  return self->_articleEditorialItemDownloader;
}

- (FREditorialItemDownloader)tagEditorialItemDownloader
{
  return self->_tagEditorialItemDownloader;
}

- (FREditorialItemThumbnailCreator)thumbnailCreator
{
  return self->_thumbnailCreator;
}

- (FCANFHelper)ANFHelper
{
  return self->_ANFHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshThrottler, 0);
  objc_storeStrong((id *)&self->_ANFHelper, 0);
  objc_storeStrong((id *)&self->_thumbnailCreator, 0);
  objc_storeStrong((id *)&self->_tagEditorialItemDownloader, 0);
  objc_storeStrong((id *)&self->_articleEditorialItemDownloader, 0);
  objc_storeStrong((id *)&self->_editorialItemEntryManager, 0);
  objc_storeStrong((id *)&self->_interestTokens, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_editorialConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_activityMonitor, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);

  objc_storeStrong((id *)&self->itemChangeDelegate, 0);
}

@end