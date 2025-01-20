@interface MLSyncClientEnvironmentPolicyChangeHandler
+ (id)sharedInstance;
- (id)_atAssetTypeForRemovedMediaApp:(int64_t)a3;
- (id)_init;
- (id)_observers;
- (void)_cancelDownloadsMatchingPredicate:(id)a3 excludeActiveDownloads:(BOOL)a4 error:(id)a5;
- (void)_handleNetworkConditionsOrCellularDataPolicyChanged;
- (void)_notifyAppRemoved:(int64_t)a3;
- (void)_notifyPowerStateChangedInitiateSyncOrKeepLocalSessionWithOptions:(id)a3;
- (void)addObserver:(id)a3;
- (void)assetLinkControllerDidProcessAllTrackAssets:(id)a3;
- (void)environmentMonitorDidChangeBatteryLevel:(id)a3;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)environmentMonitorDidChangePower:(id)a3;
- (void)environmentMonitorDidChangeThermalLevel:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation MLSyncClientEnvironmentPolicyChangeHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_handleNetworkConditionsOrCellularDataPolicyChanged
{
  v3 = +[ICEnvironmentMonitor sharedMonitor];
  unsigned int v4 = sub_6EB14(8);
  unsigned int v5 = sub_6EB14(4);
  unsigned int v6 = [v3 isNetworkConstrained];
  [v3 networkType];
  int IsCellular = ICEnvironmentNetworkTypeIsCellular();
  unsigned int v8 = [v3 isCurrentNetworkLinkHighQuality];
  v32 = v3;
  [v3 lastKnownNetworkType];
  int v9 = ICEnvironmentNetworkTypeIsCellular();
  v10 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    unsigned int v41 = v4;
    __int16 v42 = 1024;
    unsigned int v43 = v5;
    __int16 v44 = 1024;
    unsigned int v45 = v6;
    __int16 v46 = 1024;
    int v47 = IsCellular;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "handling network reachability or cellular policy changed notification. musicDownloadsAllowed=%{BOOL}u, podcastsDownloadsAllowed=%{BOOL}u, isNetworkConstrained=%{BOOL}u, networkTypeIsCellular=%{BOOL}u", buf, 0x1Au);
  }

  if ((v4 & 1) == 0)
  {
    if (IsCellular) {
      uint64_t v11 = 35;
    }
    else {
      uint64_t v11 = 8;
    }
    v12 = +[NSError errorWithDomain:@"ATError" code:v11 userInfo:0];
    +[NSPredicate predicateWithFormat:@"enqueueSource=%d and assetType=%@", 2, @"Music"];
    v14 = unsigned int v13 = v5;
    [(MLSyncClientEnvironmentPolicyChangeHandler *)self _cancelDownloadsMatchingPredicate:v14 excludeActiveDownloads:0 error:v12];

    unsigned int v5 = v13;
  }
  if ((v5 & 1) == 0)
  {
    if (IsCellular) {
      uint64_t v15 = 35;
    }
    else {
      uint64_t v15 = 8;
    }
    v16 = +[NSError errorWithDomain:@"ATError" code:v15 userInfo:0];
    v17 = +[NSPredicate predicateWithFormat:@"enqueueSource=%d and assetType=%@", 2, @"Podcast"];
    [(MLSyncClientEnvironmentPolicyChangeHandler *)self _cancelDownloadsMatchingPredicate:v17 excludeActiveDownloads:0 error:v16];
  }
  if (v6)
  {
    v18 = +[ICDeviceInfo currentDeviceInfo];
    unsigned int v19 = [v18 isWatch];

    if (v19)
    {
      v20 = +[NSError errorWithDomain:@"ATError" code:34 userInfo:0];
      v21 = +[NSPredicate predicateWithFormat:@"allowDownloadOnConstrainedNetwork=%d", 0];
      [(MLSyncClientEnvironmentPolicyChangeHandler *)self _cancelDownloadsMatchingPredicate:v21 excludeActiveDownloads:1 error:v20];
    }
  }
  v22 = +[ICDeviceInfo currentDeviceInfo];
  unsigned int v23 = [v22 isWatch] & v9;

  if (((v23 ^ 1 | v8) & 1) == 0)
  {
    unsigned int v31 = v5;
    v24 = +[NSError errorWithDomain:@"ATError" code:35 userInfo:0];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v25 = [&off_9D028 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v34;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(&off_9D028);
          }
          v29 = +[NSPredicate predicateWithFormat:@"enqueueSource=%d and assetType=%@ and isForeground=%d", 2, *(void *)(*((void *)&v33 + 1) + 8 * i), 0];
          [(MLSyncClientEnvironmentPolicyChangeHandler *)self _cancelDownloadsMatchingPredicate:v29 excludeActiveDownloads:0 error:v24];
        }
        id v26 = [&off_9D028 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v26);
    }

    unsigned int v5 = v31;
  }
  if ((v4 | v5) == 1)
  {
    CFStringRef v37 = @"MLSyncPolicyChangedObserverStartKeepLocalSessionEnqueueAssetsKey";
    v38 = &off_9CAB0;
    v30 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    [(MLSyncClientEnvironmentPolicyChangeHandler *)self _notifyPowerStateChangedInitiateSyncOrKeepLocalSessionWithOptions:v30];
  }
}

- (id)_atAssetTypeForRemovedMediaApp:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return *(&off_9A808 + a3);
  }
}

- (void)_cancelDownloadsMatchingPredicate:(id)a3 excludeActiveDownloads:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = +[ATAssetLinkController sharedInstance];
  [v9 cancelAllAssetsMatchingPredicate:v8 excludeActiveDownloads:v5 withError:v7 completion:0];
}

- (void)_notifyAppRemoved:(int64_t)a3
{
  BOOL v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v11) = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Media App %d removed", buf, 8u);
  }

  unsigned int v6 = [(MLSyncClientEnvironmentPolicyChangeHandler *)self _atAssetTypeForRemovedMediaApp:a3];
  if (v6)
  {
    id v7 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 1024;
      int v13 = 2;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Cancelling all assets with assetType=%{public}@, source=%d as media app is removed.", buf, 0x12u);
    }

    id v8 = +[NSError errorWithDomain:@"ATError" code:2 userInfo:0];
    id v9 = +[NSPredicate predicateWithFormat:@"enqueueSource=%d and assetType=%@", 2, v6];
    [(MLSyncClientEnvironmentPolicyChangeHandler *)self _cancelDownloadsMatchingPredicate:v9 excludeActiveDownloads:0 error:v8];
  }
}

- (void)_notifyPowerStateChangedInitiateSyncOrKeepLocalSessionWithOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MLSyncClientEnvironmentPolicyChangeHandler *)self _observers];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          calloutQueue = self->_calloutQueue;
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_5E154;
          v12[3] = &unk_9A930;
          v12[4] = v10;
          id v13 = v4;
          dispatch_async(calloutQueue, v12);
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)_observers
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [(NSHashTable *)self->_observers copy];
  os_unfair_recursive_lock_unlock();

  return v3;
}

- (void)assetLinkControllerDidProcessAllTrackAssets:(id)a3
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5E22C;
  block[3] = &unk_9AF48;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)environmentMonitorDidChangeBatteryLevel:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5E3BC;
  v7[3] = &unk_9A930;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5E640;
  v7[3] = &unk_9A930;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

- (void)environmentMonitorDidChangePower:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5E948;
  v7[3] = &unk_9A930;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5EB88;
  block[3] = &unk_9AF48;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    os_unfair_recursive_lock_lock_with_options();
    [(NSHashTable *)self->_observers removeObject:v4];

    os_unfair_recursive_lock_unlock();
  }
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    os_unfair_recursive_lock_lock_with_options();
    [(NSHashTable *)self->_observers addObject:v4];

    os_unfair_recursive_lock_unlock();
  }
}

- (id)_init
{
  v23.receiver = self;
  v23.super_class = (Class)MLSyncClientEnvironmentPolicyChangeHandler;
  v2 = [(MLSyncClientEnvironmentPolicyChangeHandler *)&v23 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.amp.MLSyncClientEnvironmentPolicyChangeHandler.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.amp.MLSyncClientEnvironmentPolicyChangeHandler.calloutQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v7;

    v2->_observersLock = 0;
    id v9 = +[ICEnvironmentMonitor sharedMonitor];
    [v9 registerObserver:v2];

    uint64_t v10 = +[ATAssetLinkController sharedInstance];
    [v10 addObserver:v2];

    uint64_t v11 = +[ICEnvironmentMonitor sharedMonitor];
    [v11 currentBatteryLevel];
    v2->_cachedBatteryLevel = v12;

    id v13 = +[ICEnvironmentMonitor sharedMonitor];
    v2->_cachedThermalLevel = (unint64_t)[v13 currentThermalLevel];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_5F0F8, @"com.apple.Music-AllowsCellularDataDownloads", 0, CFNotificationSuspensionBehaviorDrop);
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v2, (CFNotificationCallback)sub_5EFBC, @"com.apple.LaunchServices.applicationUnregistered", 0, CFNotificationSuspensionBehaviorCoalesce);
    long long v16 = +[ICDeviceInfo currentDeviceInfo];
    unsigned int v17 = [v16 isWatch];

    if (v17)
    {
      id v18 = objc_alloc((Class)ICStoreRequestContext);
      unsigned int v19 = +[ICUserIdentity activeAccount];
      id v20 = [v18 initWithIdentity:v19];

      v21 = +[ICURLBagProvider sharedBagProvider];
      [v21 getBagForRequestContext:v20 withCompletionHandler:&stru_9A7C0];
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_A4B20 != -1) {
    dispatch_once(&qword_A4B20, &stru_9A780);
  }
  v2 = (void *)qword_A4B28;

  return v2;
}

@end