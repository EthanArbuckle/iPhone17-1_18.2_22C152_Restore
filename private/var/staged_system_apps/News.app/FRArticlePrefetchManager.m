@interface FRArticlePrefetchManager
- (FCCloudContext)context;
- (FCKeyedOperationQueue)prefetchQueue;
- (FRArticleContentPool)articleContentPool;
- (FRArticlePrefetchManager)initWithCloudContext:(id)a3 articleContentPool:(id)a4;
- (NSMutableDictionary)prefetchRequestsByID;
- (id)keyedOperationQueue:(id)a3 performAsyncOperationForKey:(id)a4 completion:(id)a5;
- (int64_t)suspendedDepth;
- (void)_prefetchRequestsChanged;
- (void)_revisitSuspendedState;
- (void)addPrefetchInterestInHeadline:(id)a3 priority:(unint64_t)a4 options:(unint64_t)a5;
- (void)dealloc;
- (void)popPrefetchSuspended;
- (void)pushPrefetchSuspended;
- (void)removePrefetchInterestInHeadline:(id)a3;
- (void)resetPrefetchStateForArticleID:(id)a3 withHeadline:(id)a4;
- (void)setArticleContentPool:(id)a3;
- (void)setContext:(id)a3;
- (void)setPrefetchQueue:(id)a3;
- (void)setPrefetchRequestsByID:(id)a3;
- (void)setSuspendedDepth:(int64_t)a3;
@end

@implementation FRArticlePrefetchManager

- (void)_revisitSuspendedState
{
  if ([(FRArticlePrefetchManager *)self suspendedDepth] < 1)
  {
    id v5 = [(FRArticlePrefetchManager *)self context];
    v4 = [v5 networkReachability];
    [(FCKeyedOperationQueue *)self->_prefetchQueue setSuspended:FRShouldPrefetchIgnoringNetworkInterface(v4) ^ 1];
  }
  else
  {
    prefetchQueue = self->_prefetchQueue;
    [(FCKeyedOperationQueue *)prefetchQueue setSuspended:1];
  }
}

- (FRArticlePrefetchManager)initWithCloudContext:(id)a3 articleContentPool:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FRArticlePrefetchManager;
  v9 = [(FRArticlePrefetchManager *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_articleContentPool, a4);
    v11 = (FCKeyedOperationQueue *)[objc_alloc((Class)FCKeyedOperationQueue) initWithDelegate:v10 maxConcurrentOperationCount:1];
    prefetchQueue = v10->_prefetchQueue;
    v10->_prefetchQueue = v11;

    v13 = FCDispatchQueueForQualityOfService();
    [(FCKeyedOperationQueue *)v10->_prefetchQueue setExecutionQueue:v13];

    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    prefetchRequestsByID = v10->_prefetchRequestsByID;
    v10->_prefetchRequestsByID = v14;

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v10 selector:"_prefetchRequestsChanged" name:@"FRArticlePrefetchRequestsDidChangeNotification" object:v10];

    v17 = [(FRArticlePrefetchManager *)v10 context];
    v18 = [v17 networkReachability];
    [v18 addObserver:v10];

    [(FRArticlePrefetchManager *)v10 _revisitSuspendedState];
  }

  return v10;
}

- (int64_t)suspendedDepth
{
  return self->_suspendedDepth;
}

- (FCCloudContext)context
{
  return self->_context;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FRArticlePrefetchManager;
  [(FRArticlePrefetchManager *)&v4 dealloc];
}

- (void)addPrefetchInterestInHeadline:(id)a3 priority:(unint64_t)a4 options:(unint64_t)a5
{
  id v8 = a3;
  +[NSThread isMainThread];
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007ABB4();
  }
  v9 = [(FRArticlePrefetchManager *)self prefetchRequestsByID];
  v10 = [v8 articleID];
  v11 = [v9 objectForKey:v10];

  if (!v11)
  {
    v12 = (void *)FRArticlePrefetchLog;
    if (os_log_type_enabled((os_log_t)FRArticlePrefetchLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = [v8 articleID];
      v15 = [v8 title];
      int v23 = 138412546;
      v24 = v14;
      __int16 v25 = 2114;
      v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "prefetch interest added to article %@, '%{public}@'", (uint8_t *)&v23, 0x16u);
    }
    v16 = [(FRArticlePrefetchManager *)self articleContentPool];
    v17 = [v8 articleID];
    [v16 addInterestInArticleWithID:v17];

    v18 = objc_alloc_init(FRArticlePrefetchRequest);
    [(FRArticlePrefetchRequest *)v18 setHeadline:v8];
    [(FRArticlePrefetchRequest *)v18 setPriority:a4];
    [(FRArticlePrefetchRequest *)v18 setOptions:a5];
    v19 = [(FRArticlePrefetchManager *)self prefetchRequestsByID];
    objc_super v20 = [v8 articleID];
    [v19 setObject:v18 forKey:v20];

    v21 = +[NSNotification notificationWithName:@"FRArticlePrefetchRequestsDidChangeNotification" object:self];
    v22 = +[NSNotificationQueue defaultQueue];
    [v22 enqueueNotification:v21 postingStyle:1];
  }
}

- (void)removePrefetchInterestInHeadline:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007AC7C();
  }
  id v5 = [(FRArticlePrefetchManager *)self prefetchRequestsByID];
  v6 = [v4 articleID];
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    id v8 = (void *)FRArticlePrefetchLog;
    if (os_log_type_enabled((os_log_t)FRArticlePrefetchLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = [v4 articleID];
      v11 = [v4 title];
      int v18 = 138412546;
      v19 = v10;
      __int16 v20 = 2114;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "prefetch interest removed from article %@, '%{public}@'", (uint8_t *)&v18, 0x16u);
    }
    v12 = [(FRArticlePrefetchManager *)self articleContentPool];
    v13 = [v4 articleID];
    [v12 removeInterestInArticleWithID:v13];

    v14 = [(FRArticlePrefetchManager *)self prefetchRequestsByID];
    v15 = [v4 articleID];
    [v14 removeObjectForKey:v15];

    v16 = +[NSNotification notificationWithName:@"FRArticlePrefetchRequestsDidChangeNotification" object:self];
    v17 = +[NSNotificationQueue defaultQueue];
    [v17 enqueueNotification:v16 postingStyle:1];
  }
}

- (void)resetPrefetchStateForArticleID:(id)a3 withHeadline:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[NSThread isMainThread];
  if (v6)
  {
    if (v7)
    {
      id v8 = [(FRArticlePrefetchManager *)self articleContentPool];
      [v8 flushContentWithArticleID:v6];

      v9 = [(FRArticlePrefetchManager *)self prefetchRequestsByID];
      v10 = [v9 objectForKey:v6];

      if (v10)
      {
        v11 = [(FRArticlePrefetchManager *)self prefetchQueue];
        [v11 setKeyQueue:0];

        v12 = [v10 headline];
        [(FRArticlePrefetchManager *)self removePrefetchInterestInHeadline:v12];

        [self addPrefetchInterestInHeadline:v7 priority:[v10 priority] options:[v10 options]];
      }

      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007AE0C();
  }
  if (!v7)
  {
LABEL_9:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007AD44();
    }
  }
LABEL_11:
}

- (void)pushPrefetchSuspended
{
  +[NSThread isMainThread];
  [(FRArticlePrefetchManager *)self setSuspendedDepth:(char *)[(FRArticlePrefetchManager *)self suspendedDepth] + 1];

  [(FRArticlePrefetchManager *)self _revisitSuspendedState];
}

- (void)popPrefetchSuspended
{
  if (![(FRArticlePrefetchManager *)self suspendedDepth]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007AED4();
  }
  [(FRArticlePrefetchManager *)self setSuspendedDepth:(char *)[(FRArticlePrefetchManager *)self suspendedDepth] - 1];
  [(FRArticlePrefetchManager *)self _revisitSuspendedState];
}

- (id)keyedOperationQueue:(id)a3 performAsyncOperationForKey:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  objc_opt_class();
  v9 = FCCheckedDynamicCast();

  id v10 = objc_alloc_init((Class)FCOnce);
  v11 = [(FRArticlePrefetchManager *)self articleContentPool];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10006574C;
  v24[3] = &unk_1000C5988;
  id v12 = v10;
  id v25 = v12;
  id v13 = v7;
  id v26 = v13;
  v14 = [v9 executeWithArticleContentPool:v11 completionHandler:v24];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100065884;
  v20[3] = &unk_1000C8598;
  id v21 = v14;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v14;
  int v18 = +[FCCancelHandler cancelHandlerWithBlock:v20];

  return v18;
}

- (void)_prefetchRequestsChanged
{
  +[NSThread isMainThread];
  v3 = +[NSMutableOrderedSet orderedSet];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(FRArticlePrefetchManager *)self prefetchRequestsByID];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v8);
        id v10 = [(FRArticlePrefetchManager *)self prefetchRequestsByID];
        v11 = [v10 objectForKey:v9];

        id v12 = [v11 headline];
        unsigned __int8 v13 = [v12 isDeleted];

        if ((v13 & 1) == 0) {
          [v11 addPrefetchOperationsToOrderedSet:v3];
        }

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  [v3 sortUsingComparator:&stru_1000CA060];
  v14 = [(FRArticlePrefetchManager *)self prefetchQueue];
  [v14 setKeyQueue:v3];
}

- (void)setContext:(id)a3
{
}

- (FRArticleContentPool)articleContentPool
{
  return self->_articleContentPool;
}

- (void)setArticleContentPool:(id)a3
{
}

- (FCKeyedOperationQueue)prefetchQueue
{
  return self->_prefetchQueue;
}

- (void)setPrefetchQueue:(id)a3
{
}

- (void)setSuspendedDepth:(int64_t)a3
{
  self->_suspendedDepth = a3;
}

- (NSMutableDictionary)prefetchRequestsByID
{
  return self->_prefetchRequestsByID;
}

- (void)setPrefetchRequestsByID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchRequestsByID, 0);
  objc_storeStrong((id *)&self->_prefetchQueue, 0);
  objc_storeStrong((id *)&self->_articleContentPool, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end