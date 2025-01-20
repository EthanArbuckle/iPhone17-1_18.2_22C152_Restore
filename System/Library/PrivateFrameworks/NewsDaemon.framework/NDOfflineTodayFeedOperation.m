@interface NDOfflineTodayFeedOperation
- (BOOL)cachedOnly;
- (FCANFHelper)ANFHelper;
- (FCContentContext)context;
- (FCThreadSafeMutableArray)resultErrors;
- (FCThreadSafeMutableArray)resultInterestTokens;
- (NDOfflineTodayFeedOperation)initWithFeedConfig:(id)a3 context:(id)a4 ANFHelper:(id)a5;
- (NDTodayFeedConfig)feedConfig;
- (NSOperationQueue)serialQueue;
- (OS_dispatch_queue)archiveQueue;
- (OS_dispatch_queue)fetchCompletionQueue;
- (OS_dispatch_queue)progressQueue;
- (double)progress;
- (id)archiveHandler;
- (id)fetchCompletionHandler;
- (id)progressHandler;
- (void)_handleArchive:(id)a3;
- (void)_handleError:(id)a3;
- (void)_handleInterestToken:(id)a3;
- (void)_updateProgress:(double)a3;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setArchiveHandler:(id)a3;
- (void)setArchiveQueue:(id)a3;
- (void)setCachedOnly:(BOOL)a3;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setFetchCompletionQueue:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgressHandler:(id)a3;
- (void)setProgressQueue:(id)a3;
@end

@implementation NDOfflineTodayFeedOperation

- (NDOfflineTodayFeedOperation)initWithFeedConfig:(id)a3 context:(id)a4 ANFHelper:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)NDOfflineTodayFeedOperation;
  v12 = [(NDOfflineTodayFeedOperation *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_feedConfig, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeStrong((id *)&v13->_ANFHelper, a5);
    v14 = (FCThreadSafeMutableArray *)objc_alloc_init((Class)FCThreadSafeMutableArray);
    resultInterestTokens = v13->_resultInterestTokens;
    v13->_resultInterestTokens = v14;

    v16 = (FCThreadSafeMutableArray *)objc_alloc_init((Class)FCThreadSafeMutableArray);
    resultErrors = v13->_resultErrors;
    v13->_resultErrors = v16;

    v18 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    serialQueue = v13->_serialQueue;
    v13->_serialQueue = v18;

    [(NSOperationQueue *)v13->_serialQueue setName:@"com.apple.newsd.download.todayFeedSerial"];
    [(NSOperationQueue *)v13->_serialQueue setMaxConcurrentOperationCount:1];
  }

  return v13;
}

- (void)performOperation
{
  v3 = [(NDOfflineTodayFeedOperation *)self ANFHelper];
  [v3 pushInterest];

  v4 = dispatch_group_create();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v5 = [(NDOfflineTodayFeedOperation *)self feedConfig];
  v6 = [v5 topStoriesArticleIDs];

  id v7 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v24 = *(void *)v35;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        id v11 = objc_alloc((Class)FCOfflineArticleFetchOperation);
        v12 = [(NDOfflineTodayFeedOperation *)self context];
        v13 = [(NDOfflineTodayFeedOperation *)self ANFHelper];
        id v14 = [v11 initWithContext:v12 ANFHelper:v13 articleID:v10];

        objc_msgSend(v14, "setCachedOnly:", -[NDOfflineTodayFeedOperation cachedOnly](self, "cachedOnly"));
        [v14 setProgressHandler:&stru_100061CF8];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10000FC98;
        v33[3] = &unk_100061D20;
        v33[4] = self;
        [v14 setArchiveHandler:v33];
        dispatch_group_enter(v4);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10000FCA4;
        v31[3] = &unk_100061D48;
        v31[4] = self;
        v32 = v4;
        [v14 setFetchCompletionHandler:v31];
        [(NDOfflineTodayFeedOperation *)self associateChildOperation:v14];
        v15 = [(NDOfflineTodayFeedOperation *)self serialQueue];
        [v15 addOperation:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v8);
  }

  v16 = [(NDOfflineTodayFeedOperation *)self feedConfig];
  v17 = [v16 topStoriesPackageURLs];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10000FD0C;
  v30[3] = &unk_100061D70;
  v30[4] = self;
  v18 = objc_msgSend(v17, "fc_arrayByTransformingWithBlock:", v30);

  id v19 = [objc_alloc((Class)FCAssetsFetchOperation) initWithAssetHandles:v18];
  [v19 setMaxConcurrentFetchCount:20];
  if ([(NDOfflineTodayFeedOperation *)self cachedOnly]) {
    uint64_t v20 = 3;
  }
  else {
    uint64_t v20 = 0;
  }
  [v19 setCachePolicy:v20];
  [v19 setShouldFailOnMissingObjects:1];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000FD8C;
  v29[3] = &unk_100061D20;
  v29[4] = self;
  [v19 setArchiveHandler:v29];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10000FD98;
  v28[3] = &unk_100061D98;
  v28[4] = self;
  [v19 setInterestTokenHandler:v28];
  dispatch_group_enter(v4);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000FDA4;
  v26[3] = &unk_100061DC0;
  v26[4] = self;
  v27 = v4;
  objc_super v21 = v4;
  [v19 setFetchCompletionBlock:v26];
  [(NDOfflineTodayFeedOperation *)self associateChildOperation:v19];
  v22 = [(NDOfflineTodayFeedOperation *)self serialQueue];
  [v22 addOperation:v19];

  [(NDOfflineTodayFeedOperation *)self qualityOfService];
  v23 = FCDispatchQueueForQualityOfService();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FE04;
  block[3] = &unk_100061828;
  block[4] = self;
  dispatch_group_notify(v21, v23, block);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [(NDOfflineTodayFeedOperation *)self _updateProgress:1.0];
  }
  v5 = [(NDOfflineTodayFeedOperation *)self fetchCompletionQueue];

  v6 = [(NDOfflineTodayFeedOperation *)self fetchCompletionHandler];

  if (v5)
  {
    if (v6)
    {
      id v7 = [(NDOfflineTodayFeedOperation *)self fetchCompletionQueue];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10000FFD4;
      v11[3] = &unk_1000618B8;
      v11[4] = self;
      id v12 = v4;
      dispatch_async(v7, v11);
    }
  }
  else if (v6)
  {
    id v8 = [(NDOfflineTodayFeedOperation *)self fetchCompletionHandler];
    id v9 = [(NDOfflineTodayFeedOperation *)self resultInterestTokens];
    uint64_t v10 = [v9 readOnlyArray];
    ((void (**)(void, void *, id))v8)[2](v8, v10, v4);
  }
}

- (void)_updateProgress:(double)a3
{
  if (([(NDOfflineTodayFeedOperation *)self isFinished] & 1) == 0)
  {
    [(NDOfflineTodayFeedOperation *)self setProgress:a3];
    v5 = [(NDOfflineTodayFeedOperation *)self progressQueue];

    v6 = [(NDOfflineTodayFeedOperation *)self progressHandler];

    if (v5)
    {
      if (v6)
      {
        id v7 = [(NDOfflineTodayFeedOperation *)self progressQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000101A4;
        block[3] = &unk_100061828;
        block[4] = self;
        dispatch_async(v7, block);
      }
    }
    else if (v6)
    {
      id v8 = [(NDOfflineTodayFeedOperation *)self progressHandler];
      [(NDOfflineTodayFeedOperation *)self progress];
      v8[2]();
    }
  }
}

- (void)_handleInterestToken:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(NDOfflineTodayFeedOperation *)self resultInterestTokens];
    [v5 addObject:v4];
  }
}

- (void)_handleArchive:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NDOfflineTodayFeedOperation *)self archiveQueue];

    v6 = [(NDOfflineTodayFeedOperation *)self archiveHandler];

    if (v5)
    {
      if (v6)
      {
        id v7 = [(NDOfflineTodayFeedOperation *)self archiveQueue];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100010384;
        v9[3] = &unk_1000618B8;
        v9[4] = self;
        id v10 = v4;
        dispatch_async(v7, v9);
      }
    }
    else if (v6)
    {
      id v8 = [(NDOfflineTodayFeedOperation *)self archiveHandler];
      ((void (**)(void, id))v8)[2](v8, v4);
    }
  }
}

- (void)_handleError:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(NDOfflineTodayFeedOperation *)self resultErrors];
    [v5 addObject:v4];
  }
}

- (id)archiveHandler
{
  return self->archiveHandler;
}

- (void)setArchiveHandler:(id)a3
{
}

- (OS_dispatch_queue)archiveQueue
{
  return self->archiveQueue;
}

- (void)setArchiveQueue:(id)a3
{
}

- (BOOL)cachedOnly
{
  return self->cachedOnly;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->cachedOnly = a3;
}

- (id)fetchCompletionHandler
{
  return self->fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
}

- (OS_dispatch_queue)fetchCompletionQueue
{
  return self->fetchCompletionQueue;
}

- (void)setFetchCompletionQueue:(id)a3
{
}

- (id)progressHandler
{
  return self->progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (OS_dispatch_queue)progressQueue
{
  return self->progressQueue;
}

- (void)setProgressQueue:(id)a3
{
}

- (NDTodayFeedConfig)feedConfig
{
  return self->_feedConfig;
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCANFHelper)ANFHelper
{
  return self->_ANFHelper;
}

- (FCThreadSafeMutableArray)resultInterestTokens
{
  return self->_resultInterestTokens;
}

- (FCThreadSafeMutableArray)resultErrors
{
  return self->_resultErrors;
}

- (NSOperationQueue)serialQueue
{
  return self->_serialQueue;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_resultErrors, 0);
  objc_storeStrong((id *)&self->_resultInterestTokens, 0);
  objc_storeStrong((id *)&self->_ANFHelper, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_feedConfig, 0);
  objc_storeStrong((id *)&self->progressQueue, 0);
  objc_storeStrong(&self->progressHandler, 0);
  objc_storeStrong((id *)&self->fetchCompletionQueue, 0);
  objc_storeStrong(&self->fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->archiveQueue, 0);

  objc_storeStrong(&self->archiveHandler, 0);
}

@end