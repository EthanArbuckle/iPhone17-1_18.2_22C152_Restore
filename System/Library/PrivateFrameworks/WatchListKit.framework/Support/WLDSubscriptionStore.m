@interface WLDSubscriptionStore
+ (id)_coalescingIDForUser:(id)a3 forcedReload:(BOOL)a4;
+ (id)sharedInstance;
+ (void)_postDidUpdateCrossProcessNotificationWithProcessID:(unint64_t)a3;
- (BOOL)_shouldFetchFreshCopy;
- (WLDSubscriptionStore)init;
- (id)_coalescedCompletion;
- (id)_getSubscriptionDataMaxAge;
- (id)_inflightCoalescingID;
- (id)_readFromDisk;
- (id)_stubbedDataPath;
- (id)_supportPath;
- (void)_activeAccountChangedNotification:(id)a3;
- (void)_fetchDataFromCommerceWithCoalescingID:(id)a3 completion:(id)a4;
- (void)_setAdPlatformsStatusCondition:(id)a3;
- (void)_setCoalescedCompletion:(id)a3;
- (void)_setInflightCoalescingID:(id)a3;
- (void)_writeToDisk:(id)a3;
- (void)dealloc;
- (void)fetchSubscriptionData:(BOOL)a3 callerProcessID:(unint64_t)a4 completion:(id)a5;
@end

@implementation WLDSubscriptionStore

- (void)fetchSubscriptionData:(BOOL)a3 callerProcessID:(unint64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if (self->_enabled)
  {
    v9 = +[ACAccountStore ams_sharedAccountStore];
    v10 = objc_msgSend(v9, "ams_activeiTunesAccount");
    v11 = objc_msgSend(v10, "ams_DSID");

    if (v11 && (v6 || [(WLDSubscriptionStore *)self _shouldFetchFreshCopy]))
    {
      if ([(WLDSubscriptionStore *)self _shouldFetchFreshCopy])
      {
        v12 = WLKSubscriptionSyncLogObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Subscription data has expired or is nil.", buf, 2u);
        }
      }
      if (v6)
      {
        v13 = WLKSubscriptionSyncLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Subscription client is requesting forced refresh", buf, 2u);
        }
      }
      v14 = +[WLDSubscriptionStore _coalescingIDForUser:v11 forcedReload:v6];
      v15 = WLKSubscriptionSyncLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fetching for coalescingID: %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = __73__WLDSubscriptionStore_fetchSubscriptionData_callerProcessID_completion___block_invoke;
      v18[3] = &unk_100045B00;
      v18[4] = self;
      objc_copyWeak(v20, (id *)buf);
      v20[1] = (id)a4;
      id v19 = v8;
      [(WLDSubscriptionStore *)self _fetchDataFromCommerceWithCoalescingID:v14 completion:v18];

      objc_destroyWeak(v20);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v17 = WLKSubscriptionSyncLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Subscription data is still valid, returning cache", buf, 2u);
      }

      if (v8) {
        (*((void (**)(id, WLKSubscriptionData *, void))v8 + 2))(v8, self->_subscriptionData, 0);
      }
    }
  }
  else
  {
    v16 = WLKSubscriptionSyncLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Subscription sync is disabled", buf, 2u);
    }

    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

- (BOOL)_shouldFetchFreshCopy
{
  v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"SubscriptionSyncLastSync"];
  p_propLock = &self->_propLock;
  os_unfair_lock_lock(&self->_propLock);
  if (v3)
  {
    v5 = +[NSDate date];
    [v5 timeIntervalSinceDate:v3];
    double v7 = v6;
    [(NSNumber *)self->_maxAgeInSeconds doubleValue];
    BOOL v9 = v7 > v8;
  }
  else
  {
    BOOL v9 = 1;
  }
  os_unfair_lock_unlock(p_propLock);

  return v9;
}

+ (id)sharedInstance
{
  if (sharedInstance___once_0 != -1) {
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance___singleInstance;

  return v2;
}

void __38__WLDSubscriptionStore_sharedInstance__block_invoke(id a1)
{
  sharedInstance___singleInstance = objc_alloc_init(WLDSubscriptionStore);

  _objc_release_x1();
}

- (WLDSubscriptionStore)init
{
  v20.receiver = self;
  v20.super_class = (Class)WLDSubscriptionStore;
  v2 = [(WLDSubscriptionStore *)&v20 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSUserDefaults);
    v4 = (NSUserDefaults *)[v3 initWithSuiteName:WLKDefaultsDomain];
    defaults = v2->_defaults;
    v2->_defaults = v4;

    v2->_enabled = 1;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.WatchListKit.SubscriptionStore", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [(WLDSubscriptionStore *)v2 _readFromDisk];
    subscriptionData = v2->_subscriptionData;
    v2->_subscriptionData = (WLKSubscriptionData *)v8;

    v10 = +[ACAccountStore ams_sharedAccountStore];
    v11 = objc_msgSend(v10, "ams_activeiTunesAccount");
    uint64_t v12 = objc_msgSend(v11, "ams_DSID");
    accountID = v2->_accountID;
    v2->_accountID = (NSNumber *)v12;

    v14 = +[NSNotificationCenter defaultCenter];
    uint64_t v15 = WLKAccountMonitorAccountDidChange;
    v16 = +[WLKAccountMonitor sharedInstance];
    [v14 addObserver:v2 selector:"_activeAccountChangedNotification:" name:v15 object:v16];

    v2->_propLock._os_unfair_lock_opaque = 0;
    uint64_t v17 = [(WLDSubscriptionStore *)v2 _getSubscriptionDataMaxAge];
    maxAgeInSeconds = v2->_maxAgeInSeconds;
    v2->_maxAgeInSeconds = (NSNumber *)v17;
  }
  return v2;
}

- (void)dealloc
{
  if (self->_enabled)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)WLDSubscriptionStore;
  [(WLDSubscriptionStore *)&v4 dealloc];
}

void __73__WLDSubscriptionStore_fetchSubscriptionData_callerProcessID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __73__WLDSubscriptionStore_fetchSubscriptionData_callerProcessID_completion___block_invoke_2;
  block[3] = &unk_100045AD8;
  objc_copyWeak(v16, (id *)(a1 + 48));
  uint64_t v8 = *(void **)(a1 + 56);
  id v13 = v5;
  v16[1] = v8;
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(v16);
}

void __73__WLDSubscriptionStore_fetchSubscriptionData_callerProcessID_completion___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = [objc_alloc((Class)WLKSubscriptionData) initWithDictionary:*(void *)(a1 + 32)];
    if (v3)
    {
      unsigned int v4 = [WeakRetained[5] isEqual:v3];
      id v5 = WLKSubscriptionSyncLogObject();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v6)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "There has been no change in subscription data.", buf, 2u);
        }

        id v7 = WeakRetained[3];
        uint64_t v8 = +[NSDate now];
        [v7 setObject:v8 forKey:@"SubscriptionSyncLastSync"];
      }
      else
      {
        if (v6)
        {
          v12[0] = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Subscription data has changed. Update cached copy.", (uint8_t *)v12, 2u);
        }

        objc_storeStrong(WeakRetained + 5, v3);
        [WeakRetained _writeToDisk:v3];
        id v10 = WeakRetained[3];
        id v11 = +[NSDate now];
        [v10 setObject:v11 forKey:@"SubscriptionSyncLastSync"];

        [(id)objc_opt_class() _postDidUpdateCrossProcessNotificationWithProcessID:*(void *)(a1 + 64)];
      }
    }
    else
    {
      id v9 = WLKSubscriptionSyncLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetched subscription data is nil. No update.", v14, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [WeakRetained _setAdPlatformsStatusCondition:v3];
  }
}

- (id)_inflightCoalescingID
{
  p_propLock = &self->_propLock;
  os_unfair_lock_lock(&self->_propLock);
  unsigned int v4 = self->_inflightCoalescingID;
  os_unfair_lock_unlock(p_propLock);

  return v4;
}

- (void)_setInflightCoalescingID:(id)a3
{
  p_propLock = &self->_propLock;
  id v5 = a3;
  os_unfair_lock_lock(p_propLock);
  BOOL v6 = (NSString *)[v5 copy];

  inflightCoalescingID = self->_inflightCoalescingID;
  self->_inflightCoalescingID = v6;

  os_unfair_lock_unlock(p_propLock);
}

- (id)_coalescedCompletion
{
  p_propLock = &self->_propLock;
  os_unfair_lock_lock(&self->_propLock);
  id v4 = objc_retainBlock(self->_coalescedCompletion);
  os_unfair_lock_unlock(p_propLock);
  id v5 = objc_retainBlock(v4);

  return v5;
}

- (void)_setCoalescedCompletion:(id)a3
{
  p_propLock = &self->_propLock;
  id v5 = a3;
  os_unfair_lock_lock(p_propLock);
  id v6 = objc_retainBlock(v5);

  id coalescedCompletion = self->_coalescedCompletion;
  self->_id coalescedCompletion = v6;

  os_unfair_lock_unlock(p_propLock);
}

+ (id)_coalescingIDForUser:(id)a3 forcedReload:(BOOL)a4
{
  CFStringRef v4 = @"NF";
  if (a4) {
    CFStringRef v4 = @"F";
  }
  return +[NSString stringWithFormat:@"SR-%@-%@", a3, v4];
}

- (void)_fetchDataFromCommerceWithCoalescingID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WLDSubscriptionStore *)self _inflightCoalescingID];
  if ([v8 isEqualToString:v6]
    && ([(WLDSubscriptionStore *)self _coalescedCompletion],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    uint64_t v12 = WLKSubscriptionSyncLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Will coalesce operation: %@. Will _not_ go outbound.", (uint8_t *)location, 0xCu);
    }

    [(WLDSubscriptionStore *)self _setCoalescedCompletion:v7];
  }
  else
  {
    id v10 = objc_alloc_init((Class)WLKSubscriptionDataRequestOperation);
    objc_initWeak(location, v10);
    objc_initWeak(&from, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __74__WLDSubscriptionStore__fetchDataFromCommerceWithCoalescingID_completion___block_invoke;
    v13[3] = &unk_100045B50;
    objc_copyWeak(&v15, &from);
    id v14 = v7;
    objc_copyWeak(&v16, location);
    v13[4] = self;
    [v10 setCompletionBlock:v13];
    id v11 = +[NSOperationQueue wlkDefaultQueue];
    [v11 addOperation:v10];

    [(WLDSubscriptionStore *)self _setInflightCoalescingID:v6];
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
}

void __74__WLDSubscriptionStore__fetchDataFromCommerceWithCoalescingID_completion___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained _coalescedCompletion];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __74__WLDSubscriptionStore__fetchDataFromCommerceWithCoalescingID_completion___block_invoke_2;
  v24[3] = &unk_100045B28;
  id v25 = a1[5];
  id v4 = v3;
  id v26 = v4;
  id v5 = objc_retainBlock(v24);
  id v6 = objc_loadWeakRetained(a1 + 7);
  id v7 = [v6 error];
  id v8 = [v7 copy];

  if (v8)
  {
    id v9 = WLKSubscriptionSyncLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to fetch subscription data", buf, 2u);
    }

    ((void (*)(void *, void, id))v5[2])(v5, 0, v8);
  }
  else if ([*((id *)a1[4] + 3) BOOLForKey:@"SubscriptionSyncUseStubbedData"])
  {
    id v10 = WLKSubscriptionSyncLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Using stubbed subscription data", buf, 2u);
    }

    id v11 = [a1[4] _stubbedDataPath];
    uint64_t v12 = +[NSData dataWithContentsOfFile:v11];

    if (v12)
    {
      id v22 = 0;
      id v13 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v12 error:&v22];
      id v21 = v22;
      if (v21)
      {
        id v14 = WLKSubscriptionSyncLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          __74__WLDSubscriptionStore__fetchDataFromCommerceWithCoalescingID_completion___block_invoke_cold_1();
        }
        id v15 = 0;
      }
      else
      {
        uint64_t v20 = objc_opt_class();
        uint64_t v19 = objc_opt_class();
        uint64_t v17 = objc_opt_class();
        uint64_t v18 = objc_opt_class();
        id v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, v19, v17, v18, objc_opt_class(), 0);
        id v15 = [v13 decodeObjectOfClasses:v14 forKey:NSKeyedArchiveRootObjectKey];
      }
    }
    else
    {
      id v15 = 0;
    }
    ((void (*)(void *, void *, void))v5[2])(v5, v15, 0);
  }
  else
  {
    id v16 = [v6 response];
    ((void (*)(void *, void *, void))v5[2])(v5, v16, 0);
  }
  [a1[4] _setInflightCoalescingID:0];
  [a1[4] _setCoalescedCompletion:0];
}

void __74__WLDSubscriptionStore__fetchDataFromCommerceWithCoalescingID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

- (id)_readFromDisk
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__3;
  id v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __37__WLDSubscriptionStore__readFromDisk__block_invoke;
  v5[3] = &unk_100045A20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__WLDSubscriptionStore__readFromDisk__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _supportPath];
  id v3 = +[NSData dataWithContentsOfFile:v2];

  if (v3)
  {
    id v16 = 0;
    id v4 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v3 error:&v16];
    id v5 = v16;
    if (v5)
    {
      uint64_t v6 = WLKSubscriptionSyncLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __74__WLDSubscriptionStore__fetchDataFromCommerceWithCoalescingID_completion___block_invoke_cold_1();
      }
    }
    else
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
      uint64_t v12 = [v4 decodeObjectOfClasses:v6 forKey:NSKeyedArchiveRootObjectKey];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        id v14 = v12;
        id v15 = *(NSObject **)(v13 + 40);
        *(void *)(v13 + 40) = v14;
      }
      else
      {
        id v15 = WLKSubscriptionSyncLogObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __37__WLDSubscriptionStore__readFromDisk__block_invoke_cold_1();
        }
      }
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:@"SubscriptionSyncLastSync"];
  }
}

- (void)_writeToDisk:(id)a3
{
  id v4 = a3;
  id v5 = +[NSFileManager defaultManager];
  uint64_t v6 = WLKDefaultSupportPath();
  id v13 = 0;
  [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v13];
  id v7 = v13;

  if (v7)
  {
    uint64_t v8 = WLKSubscriptionSyncLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WLDSubscriptionStore _writeToDisk:](v7, v8);
    }
  }
  else
  {
    id v12 = 0;
    uint64_t v8 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v12];
    id v7 = v12;
    if (v7)
    {
      uint64_t v9 = WLKSubscriptionSyncLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[WLDSubscriptionStore _writeToDisk:](v7, v9);
      }
    }
    else
    {
      if (v8)
      {
        uint64_t v10 = [(WLDSubscriptionStore *)self _supportPath];
        unsigned int v11 = [v8 writeToFile:v10 atomically:1];
      }
      else
      {
        unsigned int v11 = 0;
      }
      uint64_t v9 = WLKSubscriptionSyncLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Wrote subscription store %d", buf, 8u);
      }
    }
  }
}

- (id)_supportPath
{
  v2 = WLKDefaultSupportPath();
  id v3 = [v2 stringByAppendingPathComponent:@"subscription.plist"];

  id v4 = [v3 stringByExpandingTildeInPath];

  return v4;
}

- (id)_stubbedDataPath
{
  v2 = WLKDefaultSupportPath();
  id v3 = [v2 stringByAppendingPathComponent:@"stubbedData.plist"];

  id v4 = [v3 stringByExpandingTildeInPath];

  return v4;
}

- (void)_activeAccountChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v5 = +[ACAccountStore ams_sharedAccountStore];
  uint64_t v6 = objc_msgSend(v5, "ams_activeiTunesAccount");
  id v7 = objc_msgSend(v6, "ams_DSID");

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __58__WLDSubscriptionStore__activeAccountChangedNotification___block_invoke;
  block[3] = &unk_100045B78;
  id v9 = v7;
  id v16 = v9;
  uint64_t v17 = self;
  uint64_t v18 = &v19;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v20 + 24) || !v9)
  {
    uint64_t v10 = WLKSubscriptionSyncLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User sign-in or sign-out. Remove persisted cache", (uint8_t *)&buf, 2u);
    }

    [(NSUserDefaults *)self->_defaults removeObjectForKey:@"SubscriptionSyncLastSync"];
    objc_initWeak(&buf, self);
    unsigned int v11 = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __58__WLDSubscriptionStore__activeAccountChangedNotification___block_invoke_49;
    v12[3] = &unk_1000456B0;
    objc_copyWeak(&v13, &buf);
    v12[4] = self;
    dispatch_async(v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&buf);
  }

  _Block_object_dispose(&v19, 8);
}

void __58__WLDSubscriptionStore__activeAccountChangedNotification___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
LABEL_5:
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = 0;

    return;
  }
  if (*(void *)(*(void *)(a1 + 40) + 8) && (objc_msgSend(v2, "isEqualToNumber:") & 1) != 0)
  {
    if (*(void *)(a1 + 32)) {
      return;
    }
    goto LABEL_5;
  }
  id v5 = WLKSubscriptionSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DSID changed", v6, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 8), *(id *)(a1 + 32));
}

void __58__WLDSubscriptionStore__activeAccountChangedNotification___block_invoke_49(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)WeakRetained[5];
  WeakRetained[5] = 0;

  uint64_t v3 = +[NSFileManager defaultManager];
  id v4 = [*(id *)(a1 + 32) _supportPath];
  [v3 removeItemAtPath:v4 error:0];

  id v5 = +[WLDSubscriptionStore sharedInstance];
  [v5 fetchSubscriptionData:0 callerProcessID:getpid() completion:&__block_literal_global_52];

  [(id)objc_opt_class() _postDidUpdateCrossProcessNotificationWithProcessID:_WLKSystemSubscriptionPID];
}

- (id)_getSubscriptionDataMaxAge
{
  v2 = +[TVAppBag app];
  uint64_t v3 = [v2 integerForKey:@"tvSubscriptionStatusMaxAgeInSeconds"];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = &off_100049C20;
  }

  return v4;
}

+ (void)_postDidUpdateCrossProcessNotificationWithProcessID:(unint64_t)a3
{
  id v4 = WLKSubscriptionSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Posting did update cross process note", v7, 2u);
  }

  int v5 = _postDidUpdateCrossProcessNotificationWithProcessID__token;
  uint64_t v6 = (const char *)_WLKSubscriptionStoreSubscriptionDataDidChangeInternal;
  if (!_postDidUpdateCrossProcessNotificationWithProcessID__token)
  {
    notify_register_check(_WLKSubscriptionStoreSubscriptionDataDidChangeInternal, &_postDidUpdateCrossProcessNotificationWithProcessID__token);
    int v5 = _postDidUpdateCrossProcessNotificationWithProcessID__token;
  }
  notify_set_state(v5, a3);
  notify_post(v6);
}

- (void)_setAdPlatformsStatusCondition:(id)a3
{
  unsigned int v4 = [a3 isTVPlusSubscriber];
  if (v4 == [(NSUserDefaults *)self->_defaults BOOLForKey:@"IsTVPlusSubscriberLastSetValue"])
  {
    int v5 = WLKSubscriptionSyncLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No change in condition. Skip setting status condition in adPlatforms", v6, 2u);
    }
  }
  else
  {
    int v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"25EF2050-5D1D-419D-AC15-CCA299E77EE0"];
    if (v5)
    {
      if (v4)
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = __55__WLDSubscriptionStore__setAdPlatformsStatusCondition___block_invoke;
        v8[3] = &unk_100045BE0;
        v8[4] = self;
        +[PCStatusConditions setStatusCondition:v5 completionHandler:v8];
      }
      else
      {
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = __55__WLDSubscriptionStore__setAdPlatformsStatusCondition___block_invoke_58;
        v7[3] = &unk_100045BE0;
        v7[4] = self;
        +[PCStatusConditions clearStatusCondition:v5 completionHandler:v7];
      }
    }
  }
}

void __55__WLDSubscriptionStore__setAdPlatformsStatusCondition___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unsigned int v4 = WLKSubscriptionSyncLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      int v5 = "Failed to set status condition in adPlatforms: %@";
      uint64_t v6 = v4;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 24) setBool:1 forKey:@"IsTVPlusSubscriberLastSetValue"];
    unsigned int v4 = WLKSubscriptionSyncLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      int v5 = "Successfully set status condition in adPlatforms";
      uint64_t v6 = v4;
      uint32_t v7 = 2;
      goto LABEL_6;
    }
  }
}

void __55__WLDSubscriptionStore__setAdPlatformsStatusCondition___block_invoke_58(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unsigned int v4 = WLKSubscriptionSyncLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      int v5 = "Failed to clear status condition in adPlatforms: %@";
      uint64_t v6 = v4;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 24) setBool:0 forKey:@"IsTVPlusSubscriberLastSetValue"];
    unsigned int v4 = WLKSubscriptionSyncLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      int v5 = "Successfully cleared status condition in adPlatforms";
      uint64_t v6 = v4;
      uint32_t v7 = 2;
      goto LABEL_6;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_coalescedCompletion, 0);
  objc_storeStrong((id *)&self->_inflightCoalescingID, 0);
  objc_storeStrong((id *)&self->_maxAgeInSeconds, 0);
  objc_storeStrong((id *)&self->_subscriptionData, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

void __74__WLDSubscriptionStore__fetchDataFromCommerceWithCoalescingID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Read failed secure unarchiver error: %@", v2, v3, v4, v5, v6);
}

void __37__WLDSubscriptionStore__readFromDisk__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Read ignoring unsupported root object: %@", v2, v3, v4, v5, v6);
}

- (void)_writeToDisk:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to archive subscription data: %@", v4, 0xCu);
}

- (void)_writeToDisk:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v4 = WLKDefaultSupportPath();
  uint64_t v5 = [a1 description];
  int v6 = 138412546;
  uint32_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create directory %@: %@", (uint8_t *)&v6, 0x16u);
}

@end