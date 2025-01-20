@interface WLDAppVisibilityManager
+ (id)sharedManager;
- (WLDAppVisibilityManager)init;
- (void)_accountDidChangeNotification:(id)a3;
- (void)_networkReachabilityDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)updateAppVisibility;
@end

@implementation WLDAppVisibilityManager

+ (id)sharedManager
{
  if (sharedManager___once_0 != -1) {
    dispatch_once(&sharedManager___once_0, &__block_literal_global_8);
  }
  v2 = (void *)sharedManager___sharedManager_0;

  return v2;
}

void __40__WLDAppVisibilityManager_sharedManager__block_invoke(id a1)
{
  sharedManager___sharedManager_0 = objc_alloc_init(WLDAppVisibilityManager);

  _objc_release_x1();
}

- (WLDAppVisibilityManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)WLDAppVisibilityManager;
  v2 = [(WLDAppVisibilityManager *)&v12 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v3;

    [(NSOperationQueue *)v2->_queue setName:@"com.apple.WLDAppVisibilitymanager"];
    [(NSOperationQueue *)v2->_queue setMaxConcurrentOperationCount:1];
    v5 = +[NSNotificationCenter defaultCenter];
    uint64_t v6 = WLKReachabilityMonitorReachabilityDidChange;
    v7 = +[WLKReachabilityMonitor sharedInstance];
    [v5 addObserver:v2 selector:"_networkReachabilityDidChangeNotification:" name:v6 object:v7];

    v8 = +[NSNotificationCenter defaultCenter];
    uint64_t v9 = WLKAccountMonitorAccountDidChange;
    v10 = +[WLKAccountMonitor sharedInstance];
    [v8 addObserver:v2 selector:"_accountDidChangeNotification:" name:v9 object:v10];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = WLKReachabilityMonitorReachabilityDidChange;
  v5 = +[WLKReachabilityMonitor sharedInstance];
  [v3 removeObserver:self name:v4 object:v5];

  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v7 = WLKAccountMonitorAccountDidChange;
  v8 = +[WLKAccountMonitor sharedInstance];
  [v6 removeObserver:self name:v7 object:v8];

  v9.receiver = self;
  v9.super_class = (Class)WLDAppVisibilityManager;
  [(WLDAppVisibilityManager *)&v9 dealloc];
}

- (void)_networkReachabilityDidChangeNotification:(id)a3
{
  id v4 = a3;
  if (self->_updateRequestedOnNetworkChange)
  {
    id v7 = v4;
    v5 = +[WLKReachabilityMonitor sharedInstance];
    unsigned int v6 = [v5 isNetworkReachable];

    id v4 = v7;
    if (v6)
    {
      NSLog(@"WLDAppVisibilityManager - reachability changed");
      [(WLDAppVisibilityManager *)self updateAppVisibility];
      id v4 = v7;
    }
  }
}

- (void)_accountDidChangeNotification:(id)a3
{
  id v6 = a3;
  if (self->_updateRequestedOnAccountChange)
  {
    id v4 = +[ACAccountStore ams_sharedAccountStore];
    v5 = objc_msgSend(v4, "ams_activeiTunesAccount");

    if (v5)
    {
      NSLog(@"WLDAppVisibilityManager - account changed");
      [(WLDAppVisibilityManager *)self updateAppVisibility];
    }
  }
}

- (void)updateAppVisibility
{
  v3 = WLKTVAppEnabledOverride();
  id v4 = v3;
  if (v3)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __46__WLDAppVisibilityManager_updateAppVisibility__block_invoke;
    v19[3] = &unk_100045508;
    id v20 = v3;
    v5 = +[WLDTransactionBlockOperation blockOperationWithBlock:v19];
  }
  else
  {
    v5 = objc_alloc_init(WLDTransactionBlockOperation);
    objc_initWeak(&location, v5);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __46__WLDAppVisibilityManager_updateAppVisibility__block_invoke_2;
    v16[3] = &unk_100045798;
    v16[4] = self;
    objc_copyWeak(&v17, &location);
    [(WLDTransactionBlockOperation *)v5 addExecutionBlock:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(NSOperationQueue *)self->_queue operations];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v10 isExecuting] & 1) == 0)
        {
          NSLog(@"WLDAppVisibilityManager - cancelling queued op %@", v10);
          [v10 cancel];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v21 count:16];
    }
    while (v7);
  }

  v11 = (void *)MGCopyAnswer();
  NSLog(@"WLDAppVisibilityManager - Enqueue appVisibilityOp for region: %@ %@", v11, v5);
  [(NSOperationQueue *)self->_queue addOperation:v5];
}

id __46__WLDAppVisibilityManager_updateAppVisibility__block_invoke(uint64_t a1)
{
  NSLog(@"WLDAppVisibilityManager - TV app enabled *override*: %d", [*(id *)(a1 + 32) BOOLValue]);
  id v2 = [*(id *)(a1 + 32) BOOLValue];

  return +[WLKManagedConfigurationInterface setTVAppAllowed:v2];
}

void __46__WLDAppVisibilityManager_updateAppVisibility__block_invoke_2(uint64_t a1)
{
  id v2 = +[ACAccountStore ams_sharedAccountStore];
  v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  id v4 = objc_msgSend(v3, "ams_storefront");
  NSLog(@"WLDAppVisibilityManager - active account storefront: %@", v4);
  v5 = +[WLKAccountMonitor sharedInstance];
  id v6 = [v5 activeAccount];
  id v7 = objc_msgSend(v6, "ams_storefront");
  NSLog(@"WLDAppVisibilityManager - device storefront: %@", v7);

  if (v3)
  {
    if ([v4 length])
    {
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      objc_super v9 = objc_opt_class();
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __46__WLDAppVisibilityManager_updateAppVisibility__block_invoke_3;
      v14[3] = &unk_1000455D0;
      objc_copyWeak(&v17, (id *)(a1 + 40));
      v10 = v8;
      uint64_t v11 = *(void *)(a1 + 32);
      long long v15 = v10;
      uint64_t v16 = v11;
      [v9 isFullTVAppEnabledWithCompletion:v14];
      dispatch_time_t v12 = dispatch_time(0, 30000000000);
      if (dispatch_semaphore_wait(v10, v12))
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
        NSLog(&CFSTR("WLDAppVisibilityManager - Unable to update TV app visibility, bag fetch timed out. Will try again on reac"
                     "hability change.").isa);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        [WeakRetained cancel];
      }
      objc_destroyWeak(&v17);
    }
    else
    {
      NSLog(@"WLDAppVisibilityManager - Error: Nil storefront identifier.");
    }
  }
  else
  {
    NSLog(@"WLDAppVisibilityManager - Error: no active account. Will retry on account change.");
    *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  }
}

void __46__WLDAppVisibilityManager_updateAppVisibility__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained
    && (id v6 = WeakRetained,
        id v7 = objc_loadWeakRetained((id *)(a1 + 48)),
        unsigned int v8 = [v7 isCancelled],
        v7,
        v6,
        !v8))
  {
    if (v9)
    {
      *(unsigned char *)(*(void *)(a1 + 40) + 8) = 1;
      NSLog(@"WLDAppVisibilityManager - Unable to update TV app visibility: %@. Will try again on reachability change.", v9);
    }
    else
    {
      NSLog(@"WLDAppVisibilityManager - TV app will be enabled: %d", a2);
      +[WLKManagedConfigurationInterface setTVAppAllowed:a2];
    }
  }
  else
  {
    NSLog(@"WLDAppVisibilityManager - operation was cancelled during bag fetch.");
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end