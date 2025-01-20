@interface MTFeedUpdateIdleCoordinator
+ (id)sharedInstance;
- (BOOL)_shouldDeferWork;
- (NSMutableArray)deferredWorkBlocks;
- (id)_dequeueAllDeferredWorkBlocks;
- (id)_initShared;
- (void)_appendDeferredWorkBlock:(id)a3;
- (void)_attemptToPerformDeferredWork;
- (void)scheduleFeedUpdateIdleBlock:(id)a3;
@end

@implementation MTFeedUpdateIdleCoordinator

+ (id)sharedInstance
{
  if (qword_10060A680 != -1) {
    dispatch_once(&qword_10060A680, &stru_10054E850);
  }
  v2 = (void *)qword_10060A688;

  return v2;
}

- (id)_initShared
{
  v9.receiver = self;
  v9.super_class = (Class)MTFeedUpdateIdleCoordinator;
  v2 = [(MTFeedUpdateIdleCoordinator *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    deferredWorkBlocks = v2->_deferredWorkBlocks;
    v2->_deferredWorkBlocks = (NSMutableArray *)v3;

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_attemptToPerformDeferredWork" name:@"MTSyncControllerDidStartRunningNotification" object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_attemptToPerformDeferredWork" name:@"MTSyncControllerOperationCompleted" object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_attemptToPerformDeferredWork" name:@"MTFeedUpdateDidEndUpdatingAllFeeds" object:0];
  }
  return v2;
}

- (void)scheduleFeedUpdateIdleBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  if (v4)
  {
    v5 = v4;
    if ([(MTFeedUpdateIdleCoordinator *)self _shouldDeferWork]) {
      [(MTFeedUpdateIdleCoordinator *)self _appendDeferredWorkBlock:v5];
    }
    else {
      v5[2]();
    }
    v4 = v5;
  }
}

- (void)_attemptToPerformDeferredWork
{
  if (![(MTFeedUpdateIdleCoordinator *)self _shouldDeferWork])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = [(MTFeedUpdateIdleCoordinator *)self _dequeueAllDeferredWorkBlocks];
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) + 16))();
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)_appendDeferredWorkBlock:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  deferredWorkBlocks = v4->_deferredWorkBlocks;
  id v6 = objc_retainBlock(v7);
  [(NSMutableArray *)deferredWorkBlocks addObject:v6];

  objc_sync_exit(v4);
}

- (id)_dequeueAllDeferredWorkBlocks
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(MTFeedUpdateIdleCoordinator *)v2 deferredWorkBlocks];
  id v4 = [v3 copy];

  id v5 = [(MTFeedUpdateIdleCoordinator *)v2 deferredWorkBlocks];
  [v5 removeAllObjects];

  objc_sync_exit(v2);

  return v4;
}

- (BOOL)_shouldDeferWork
{
  v2 = +[SyncControllerFactory resolvedSyncController];
  unsigned int v3 = [v2 isRunning];

  if (!v3) {
    return 1;
  }
  id v4 = +[SyncControllerFactory resolvedSyncController];
  unsigned __int8 v5 = [v4 isSyncing];

  if (v5) {
    return 1;
  }
  id v7 = +[MTFeedUpdateManager sharedInstance];
  long long v8 = [v7 statusManager];
  unsigned __int8 v9 = [v8 isUpdating];

  return v9;
}

- (NSMutableArray)deferredWorkBlocks
{
  return self->_deferredWorkBlocks;
}

- (void).cxx_destruct
{
}

@end