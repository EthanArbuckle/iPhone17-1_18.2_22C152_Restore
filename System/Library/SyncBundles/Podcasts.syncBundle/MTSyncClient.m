@interface MTSyncClient
- (BOOL)_canEnqueueAssetsToSync;
- (BOOL)_canEnqueueAssetsUnderBatteryAndThermalLevels;
- (BOOL)_canEnqueueAssetsWithNetworkType:(int64_t)a3;
- (BOOL)_isPodcastsSyncSessionCurrentlyRunning;
- (BOOL)_shouldRunPodcastsSyncClient;
- (BOOL)isEnabled;
- (MTSyncClient)init;
- (PFSecureDownloadRenewalManager)secureDownloadRenewalManager;
- (id)_assetWithItemInfo:(id)a3 forEpisode:(id)a4;
- (id)_episodePropertiesToFetch;
- (id)_stringForAsset:(id)a3;
- (id)revisionVersionToken;
- (id)supportedDataclasses;
- (id)syncDataClass;
- (unint64_t)currentRevision;
- (void)_NRPairedDeviceRegistryWatchDidBecomeActiveDarwinNotification;
- (void)_cancelAsset:(id)a3 withError:(id)a4;
- (void)_cancelPodcastsDownloadsWithError:(id)a3 excludeActiveDownloads:(BOOL)a4;
- (void)_clearAssetURLForEpisode:(id)a3;
- (void)_clearAssetURLForEpisodeWithUUID:(id)a3;
- (void)_handleATCStartupCompletedNotification:(id)a3;
- (void)_handleDownloadInfoDidInvalidateNotification:(id)a3;
- (void)_handleNewBatteryAndThermalLevelsWithMonitor:(id)a3;
- (void)_performCleanupTask;
- (void)_syncPodcastsChangesIfCanEnqueueAssets;
- (void)applicationsDidUninstall:(id)a3;
- (void)applyChangesForSyncType:(unsigned int)a3 endpointType:(int)a4 fromStream:(id)a5 withSyncParams:(id)a6 withProgressHandler:(id)a7 withCompletionHandler:(id)a8;
- (void)assetLinkController:(id)a3 didEnqueueAsset:(id)a4;
- (void)assetLinkController:(id)a3 didFinishAsset:(id)a4;
- (void)assetLinkController:(id)a3 didProcessAllTrackAssetsWithAssetType:(id)a4;
- (void)dealloc;
- (void)environmentMonitorDidChangeBatteryLevel:(id)a3;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)environmentMonitorDidChangePower:(id)a3;
- (void)environmentMonitorDidChangeThermalLevel:(id)a3;
- (void)extensionAccessDidChange;
- (void)getChangesForSyncType:(unsigned int)a3 endpointType:(int)a4 afterRevision:(unint64_t)a5 upToRevision:(unint64_t)a6 withSyncParams:(id)a7 intoOutputStream:(id)a8 withStartHandler:(id)a9 withProgressHandler:(id)a10 withCompletionHandler:(id)a11;
- (void)initiateAssetDownloadsWithCompletion:(id)a3;
- (void)resetSyncDataWithCompletion:(id)a3;
- (void)setSecureDownloadRenewalManager:(id)a3;
@end

@implementation MTSyncClient

- (MTSyncClient)init
{
  v15.receiver = self;
  v15.super_class = (Class)MTSyncClient;
  id v2 = [(MTSyncClient *)&v15 init];
  if (v2)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    v3 = (void (*)(void))off_15A20;
    v24 = off_15A20;
    if (!off_15A20)
    {
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      v18 = sub_A7F4;
      v19 = &unk_104E0;
      v20 = &v21;
      v4 = (void *)sub_A844();
      v5 = dlsym(v4, "_MTLogCategoryDefault");
      *(void *)(v20[1] + 24) = v5;
      off_15A20 = *(_UNKNOWN **)(v20[1] + 24);
      v3 = (void (*)(void))v22[3];
    }
    _Block_object_dispose(&v21, 8);
    if (!v3) {
      sub_AF14();
    }
    v6 = v3();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "MTSyncBundle was loaded.", buf, 2u);
    }

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.Podcasts.MTSyncClient", v7);
    v9 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.Podcasts.MTSyncClient.callBackQueue", v10);
    v12 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v11;

    *((unsigned char *)v2 + 40) = 0;
    dispatch_async(*((dispatch_queue_t *)v2 + 1), &stru_10328);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_4D60, NRPairedDeviceRegistryWatchDidBecomeActiveDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return (MTSyncClient *)v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, NRPairedDeviceRegistryWatchDidBecomeActiveDarwinNotification, 0);
  v4.receiver = self;
  v4.super_class = (Class)MTSyncClient;
  [(MTSyncClient *)&v4 dealloc];
}

- (void)_handleATCStartupCompletedNotification:(id)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4E70;
  v5[3] = &unk_10350;
  objc_copyWeak(&v6, &location);
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (PFSecureDownloadRenewalManager)secureDownloadRenewalManager
{
  secureDownloadRenewalManager = self->_secureDownloadRenewalManager;
  if (!secureDownloadRenewalManager)
  {
    uint64_t v10 = 0;
    dispatch_queue_t v11 = &v10;
    uint64_t v12 = 0x2050000000;
    objc_super v4 = (void *)qword_15A48;
    uint64_t v13 = qword_15A48;
    if (!qword_15A48)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_AAB8;
      v9[3] = &unk_104E0;
      v9[4] = &v10;
      sub_AAB8((uint64_t)v9);
      objc_super v4 = (void *)v11[3];
    }
    v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = (PFSecureDownloadRenewalManager *)objc_alloc_init(v5);
    v7 = self->_secureDownloadRenewalManager;
    self->_secureDownloadRenewalManager = v6;

    secureDownloadRenewalManager = self->_secureDownloadRenewalManager;
  }

  return secureDownloadRenewalManager;
}

- (void)_clearAssetURLForEpisode:(id)a3
{
  id v4 = a3;
  [v4 setAssetURL:0];
  if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", [v4 storeTrackId]))
  {
    v5 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 uuid];
      v7 = [v4 title];
      int v9 = 138412802;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      id v14 = [v4 storeTrackId];
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Requesting secure deletion for episode <%@ - %@> with adam id %lld", (uint8_t *)&v9, 0x20u);
    }
    dispatch_queue_t v8 = [(MTSyncClient *)self secureDownloadRenewalManager];
    objc_msgSend(v8, "requestSecureDeletionOfEpisodeWithAdamID:", objc_msgSend(v4, "storeTrackId"));
  }
}

- (void)_clearAssetURLForEpisodeWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [sub_54D4() sharedInstance];
  id v6 = [v5 privateQueueContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_55B8;
  v9[3] = &unk_10378;
  id v10 = v6;
  id v11 = v4;
  uint64_t v12 = self;
  id v7 = v4;
  id v8 = v6;
  [v8 performBlockAndWaitWithSave:v9];
}

- (id)supportedDataclasses
{
  return &off_10770;
}

- (void)initiateAssetDownloadsWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  v5 = sub_4FB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Initiating asset downloads", buf, 2u);
  }

  if (![(MTSyncClient *)self _shouldRunPodcastsSyncClient])
  {
    id v6 = sub_4FB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "No assets to sync for Podcasts sync client", v7, 2u);
    }
  }
  if (v4) {
    v4[2](v4);
  }
}

- (void)environmentMonitorDidChangePower:(id)a3
{
  unsigned int v4 = [a3 isCharging];
  v5 = sub_4FB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Device is now on charger %x", (uint8_t *)&buf, 8u);
  }

  if (v4)
  {
    objc_initWeak(&buf, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_59A4;
    block[3] = &unk_10350;
    objc_copyWeak(&v9, &buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&buf);
  }
  else
  {
    id v7 = +[NSError errorWithDomain:@"ATError" code:31 userInfo:0];
    [(MTSyncClient *)self _cancelPodcastsDownloadsWithError:v7 excludeActiveDownloads:0];
  }
}

- (void)environmentMonitorDidChangeBatteryLevel:(id)a3
{
}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = a3;
  v5 = sub_4FB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 134217984;
    id v11 = [v4 networkType];
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Network type is now %ld", buf, 0xCu);
  }

  if (-[MTSyncClient _canEnqueueAssetsWithNetworkType:](self, "_canEnqueueAssetsWithNetworkType:", [v4 networkType]))
  {
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5B80;
    block[3] = &unk_10350;
    objc_copyWeak(&v9, (id *)buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v7 = +[NSError errorWithDomain:@"ATError" code:35 userInfo:0];
    [(MTSyncClient *)self _cancelPodcastsDownloadsWithError:v7 excludeActiveDownloads:0];
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "bundleIdentifier", (void)v14);
        uint64_t v23 = 0;
        v24 = &v23;
        uint64_t v25 = 0x2020000000;
        id v9 = (void *)qword_15A60;
        uint64_t v26 = qword_15A60;
        if (!qword_15A60)
        {
          *(void *)id buf = _NSConcreteStackBlock;
          uint64_t v19 = 3221225472;
          v20 = sub_ABB8;
          uint64_t v21 = &unk_104E0;
          v22 = &v23;
          id v10 = (void *)sub_A844();
          id v11 = dlsym(v10, "kMTApplicationBundleIdentifier");
          *(void *)(v22[1] + 24) = v11;
          qword_15A60 = *(void *)(v22[1] + 24);
          id v9 = (void *)v24[3];
        }
        _Block_object_dispose(&v23, 8);
        if (!v9) {
          sub_AF14();
        }
        unsigned int v12 = [v8 isEqualToString:*v9];

        if (v12)
        {
          __int16 v13 = sub_4FB4();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id buf = 0;
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Podcasts app was uninstalled.", buf, 2u);
          }

          [(MTSyncClient *)self _cancelPodcastsDownloadsWithError:0 excludeActiveDownloads:0];
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v14 objects:v27 count:16];
    }
    while (v5);
  }
}

- (void)assetLinkController:(id)a3 didEnqueueAsset:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 assetType];
  unsigned int v7 = [v6 isEqualToString:@"Podcast"];

  if (v7)
  {
    id v8 = sub_4FB4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(MTSyncClient *)self _stringForAsset:v5];
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Did enqueue asset %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)assetLinkController:(id)a3 didFinishAsset:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 assetType];
  unsigned int v7 = [v6 isEqualToString:@"Podcast"];

  if (v7)
  {
    if ([(MTSyncClient *)self _shouldRunPodcastsSyncClient])
    {
      id v8 = [sub_50C0() sharedInstance];
      unsigned __int8 v9 = [v8 isReady];

      if (v9)
      {
        queue = self->_queue;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_60B8;
        v15[3] = &unk_103A0;
        id v16 = v5;
        long long v17 = self;
        dispatch_async(queue, v15);

        goto LABEL_10;
      }
      unsigned int v12 = sub_4FB4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "MTSyncClient cannot open Podcasts DB. Will not handle completed asset.", buf, 2u);
      }

      __int16 v13 = [sub_50C0() sharedInstance];
      [v13 attemptToFix];

      uint64_t v11 = 27;
    }
    else
    {
      uint64_t v11 = 9;
    }
    long long v14 = +[NSError errorWithDomain:@"ATError" code:v11 userInfo:0];
    [(MTSyncClient *)self _cancelAsset:v5 withError:v14];
  }
LABEL_10:
}

- (void)assetLinkController:(id)a3 didProcessAllTrackAssetsWithAssetType:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6FD8;
  block[3] = &unk_10418;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)extensionAccessDidChange
{
  v3 = [sub_50C0() sharedInstance];
  unsigned int v4 = [v3 isReady];

  if (v4)
  {
    id v5 = sub_4FB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "MTSyncClient can open Podcasts DB again.", buf, 2u);
    }

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_720C;
    block[3] = &unk_103C8;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_handleDownloadInfoDidInvalidateNotification:(id)a3
{
  unsigned int v4 = [sub_50C0() sharedInstance];
  unsigned __int8 v5 = [v4 isReady];

  if (v5)
  {
    objc_initWeak(location, self);
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_7348;
    v9[3] = &unk_10418;
    objc_copyWeak(&v10, location);
    void v9[4] = self;
    dispatch_async(queue, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(location);
  }
  else
  {
    id v7 = sub_4FB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "MTSyncClient cannot open Podcasts DB. Will not handle download info invalidation.", (uint8_t *)location, 2u);
    }

    id v8 = [sub_50C0() sharedInstance];
    [v8 attemptToFix];
  }
}

- (void)_NRPairedDeviceRegistryWatchDidBecomeActiveDarwinNotification
{
  v3 = sub_4FB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Received watch did become active darwin notification", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8340;
  block[3] = &unk_103C8;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_shouldRunPodcastsSyncClient
{
  id v2 = +[NSBundle mainBundle];
  v3 = [v2 bundleIdentifier];
  unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.atc"];

  if (v4)
  {
    unsigned __int8 v5 = +[NRPairedDeviceRegistry sharedInstance];
    uint64_t v6 = [v5 getActivePairedDevice];
    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B743795D-BA43-40D7-BA73-D1415B0895D4"];
    unsigned __int8 v8 = [v6 supportsCapability:v7];

    return v8;
  }
  else
  {
    id v10 = sub_4FB4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "MTSyncClient was loaded outside of atc. Will not run Podcasts sync client.", v11, 2u);
    }

    return 0;
  }
}

- (BOOL)_canEnqueueAssetsUnderBatteryAndThermalLevels
{
  id v2 = +[ICEnvironmentMonitor sharedMonitor];
  [v2 currentBatteryLevel];
  if (v3 <= 0.8) {
    unint64_t v4 = 20;
  }
  else {
    unint64_t v4 = 30;
  }
  BOOL v5 = (unint64_t)[v2 currentThermalLevel] < v4;

  return v5;
}

- (void)_handleNewBatteryAndThermalLevelsWithMonitor:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MTSyncClient *)self _canEnqueueAssetsUnderBatteryAndThermalLevels];
  BOOL v6 = v5;
  if (self->_cachedCanEnqueueAssetsUnderBatteryAndThermalLevels || v5 == 0)
  {
    if (self->_cachedCanEnqueueAssetsUnderBatteryAndThermalLevels) {
      char v8 = v5;
    }
    else {
      char v8 = 1;
    }
    if ((v8 & 1) == 0)
    {
      id v9 = sub_4FB4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        [v4 currentBatteryLevel];
        *(_DWORD *)id buf = 134218240;
        uint64_t v19 = v10;
        __int16 v20 = 2048;
        id v21 = [v4 currentThermalLevel];
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "New battery and thermal levels DO NOT allow sync battery %.2f thermal %llu", buf, 0x16u);
      }

      uint64_t v11 = +[NSError errorWithDomain:@"ATError" code:33 userInfo:0];
      [(MTSyncClient *)self _cancelPodcastsDownloadsWithError:v11 excludeActiveDownloads:1];
    }
  }
  else
  {
    unsigned int v12 = sub_4FB4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      [v4 currentBatteryLevel];
      *(_DWORD *)id buf = 134218240;
      uint64_t v19 = v14;
      __int16 v20 = 2048;
      id v21 = [v4 currentThermalLevel];
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "New battery and thermal levels allow sync battery %.2f thermal %llu", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_86FC;
    block[3] = &unk_10350;
    objc_copyWeak(&v17, (id *)buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  self->_cachedCanEnqueueAssetsUnderBatteryAndThermalLevels = v6;
}

- (BOOL)_canEnqueueAssetsWithNetworkType:(int64_t)a3
{
  return a3 != 100;
}

- (BOOL)_canEnqueueAssetsToSync
{
  if (ICSystemApplicationIsInstalled())
  {
    double v3 = [sub_50C0() sharedInstance];
    unsigned __int8 v4 = [v3 isReady];

    if (v4)
    {
      unsigned int v5 = +[ICEnvironmentMonitor sharedMonitor];
      if ([v5 isCharging])
      {
        if ([(MTSyncClient *)self _canEnqueueAssetsUnderBatteryAndThermalLevels])
        {
          if ([(MTSyncClient *)self _canEnqueueAssetsWithNetworkType:[v5 networkType]])
          {
            BOOL v6 = +[ICStorageManager sharedManager];
            if ([v6 storageSpaceAvailable])
            {
              if ([v6 cachingEnabled])
              {
                BOOL v7 = 1;
LABEL_24:

                goto LABEL_25;
              }
              long long v15 = sub_4FB4();
              if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
                goto LABEL_31;
              }
              LOWORD(v17) = 0;
              id v16 = "System caching is not enabled. Will not enqueue assets to sync.";
            }
            else
            {
              long long v15 = sub_4FB4();
              if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
LABEL_31:

                goto LABEL_23;
              }
              LOWORD(v17) = 0;
              id v16 = "No storage space remaining. Will not enqueue assets to sync.";
            }
            _os_log_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v17, 2u);
            goto LABEL_31;
          }
          BOOL v6 = sub_4FB4();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v17) = 0;
            id v9 = "Podcasts downloads are not allowed on cellular. Will not enqueue assets to sync.";
            goto LABEL_21;
          }
        }
        else
        {
          BOOL v6 = sub_4FB4();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            id v10 = [v5 currentThermalLevel];
            [v5 currentBatteryLevel];
            int v17 = 134218240;
            id v18 = v10;
            __int16 v19 = 2048;
            uint64_t v20 = v11;
            id v9 = "Thermal level too high %llu for battery level %f. Will not enqueue assets to sync.";
            unsigned int v12 = v6;
            uint32_t v13 = 22;
LABEL_22:
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v17, v13);
          }
        }
      }
      else
      {
        BOOL v6 = sub_4FB4();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v17) = 0;
          id v9 = "Watch is not charging. Will not enqueue assets to sync.";
LABEL_21:
          unsigned int v12 = v6;
          uint32_t v13 = 2;
          goto LABEL_22;
        }
      }
LABEL_23:
      BOOL v7 = 0;
      goto LABEL_24;
    }
    char v8 = sub_4FB4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Cannot open Podcasts DB. Will not enqueue assets to sync.", (uint8_t *)&v17, 2u);
    }

    unsigned int v5 = [sub_50C0() sharedInstance];
    [v5 attemptToFix];
  }
  else
  {
    unsigned int v5 = sub_4FB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Podcasts app not installed. Will not enqueue assets to sync.", (uint8_t *)&v17, 2u);
    }
  }
  BOOL v7 = 0;
LABEL_25:

  return v7;
}

- (BOOL)_isPodcastsSyncSessionCurrentlyRunning
{
  +[ATSession sessionsWithSessionTypeIdentifier:ATSessionTypeDeviceSync dataClass:@"Podcasts"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v7 isCancelled] & 1) == 0
          && ([v7 isFinished] & 1) == 0)
        {
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          char v8 = objc_msgSend(v7, "sessionTasksWithGroupingKey:", @"ATDeviceSyncSessionAssetTaskGroupingKey", 0);
          id v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v17;
            while (2)
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v17 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint32_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * (void)j);
                if (([v13 isCancelled] & 1) == 0
                  && ![v13 isFinished])
                {

                  BOOL v14 = 1;
                  goto LABEL_23;
                }
              }
              id v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
      BOOL v14 = 0;
    }
    while (v4);
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_23:

  return v14;
}

- (void)_syncPodcastsChangesIfCanEnqueueAssets
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(MTSyncClient *)self _canEnqueueAssetsToSync])
  {
    unsigned int v3 = [(MTSyncClient *)self _isPodcastsSyncSessionCurrentlyRunning];
    id v4 = sub_4FB4();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Podcasts sync session is currently running. Will set isPendingSync flag", (uint8_t *)buf, 2u);
      }

      self->_isPendingSync = 1;
    }
    else
    {
      if (v5)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Can enqueue assets and no sync session is running. Syncing Podcasts.", (uint8_t *)buf, 2u);
      }

      self->_isPendingSync = 0;
      objc_initWeak(buf, self);
      BOOL v6 = +[ATDeviceService sharedInstance];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_8DD8;
      v7[3] = &unk_10490;
      objc_copyWeak(&v8, buf);
      [v6 initiateAssetDownloadSessionsWithCompletion:v7];

      objc_destroyWeak(&v8);
      objc_destroyWeak(buf);
    }
  }
}

- (void)_cancelAsset:(id)a3 withError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = +[ATAssetLinkController sharedInstance];
  id v12 = v6;
  id v8 = +[NSArray arrayWithObjects:&v12 count:1];
  [v7 cancelAssets:v8 withError:v5 completion:0];

  id v9 = +[ATAssetLinkController sharedInstance];
  id v11 = v6;
  id v10 = +[NSArray arrayWithObjects:&v11 count:1];

  [v9 installCompleteForAssets:v10];
}

- (void)_cancelPodcastsDownloadsWithError:(id)a3 excludeActiveDownloads:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (!v5)
  {
    id v5 = +[NSError errorWithDomain:@"ATError" code:2 userInfo:0];
  }
  id v6 = sub_4FB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Cancelling Podcasts downloads with error %@", buf, 0xCu);
  }

  BOOL v7 = +[ATAssetLinkController sharedInstance];
  id v8 = +[NSPredicate predicateWithFormat:@"dataclass=%@", @"Podcasts"];
  [v7 cancelAllAssetsMatchingPredicate:v8 excludeActiveDownloads:v4 withError:v5 completion:0];
}

- (id)_episodePropertiesToFetch
{
  id v2 = sub_7C70();
  v20[0] = v2;
  unsigned int v3 = sub_7D78();
  v20[1] = v3;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  BOOL v4 = (id *)qword_15A88;
  uint64_t v19 = qword_15A88;
  if (!qword_15A88)
  {
    id v5 = (void *)sub_A844();
    v17[3] = (uint64_t)dlsym(v5, "kEpisodeEnclosureUrl");
    qword_15A88 = v17[3];
    BOOL v4 = (id *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v4) {
    sub_AF14();
  }
  id v6 = *v4;
  v20[2] = v6;
  BOOL v7 = sub_7E80();
  v20[3] = v7;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  id v8 = (id *)qword_15A90;
  uint64_t v19 = qword_15A90;
  if (!qword_15A90)
  {
    id v9 = (void *)sub_A844();
    v17[3] = (uint64_t)dlsym(v9, "kEpisodeGuid");
    qword_15A90 = v17[3];
    id v8 = (id *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v8) {
    sub_AF14();
  }
  id v10 = *v8;
  v20[4] = v10;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  id v11 = (id *)qword_15A98;
  uint64_t v19 = qword_15A98;
  if (!qword_15A98)
  {
    id v12 = (void *)sub_A844();
    v17[3] = (uint64_t)dlsym(v12, "kEpisodeAssetURL");
    qword_15A98 = v17[3];
    id v11 = (id *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v11) {
    sub_AF14();
  }
  id v21 = *v11;
  id v13 = v21;
  BOOL v14 = +[NSArray arrayWithObjects:v20 count:6];

  return v14;
}

- (id)_assetWithItemInfo:(id)a3 forEpisode:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)ATAsset);
  id v8 = [v5 uuid];
  id v9 = [v5 uuid];
  id v10 = [v5 title];
  id v11 = +[NSString stringWithFormat:@"(%@ - %@)", v9, v10];
  id v12 = [v7 initWithIdentifier:v8 dataclass:@"Podcasts" prettyName:v11];

  [v12 setMediaItemDownloadInfo:v6];
  [v12 setAssetType:@"Podcast"];
  [v12 setVariantOptions:&off_107A0];
  id v13 = [v6 size];

  [v12 setTotalBytes:v13];
  [v12 setAllowDownloadOnConstrainedNetwork:0];
  [v12 setCanUseCellularData:0];
  [v12 setPowerRequired:1];
  id v14 = objc_alloc_init((Class)ATStoreInfo);
  long long v15 = [v5 enclosureURL];
  [v14 setRedownloadParams:v15];

  uint64_t v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v5 storeTrackId]);
  [v14 setAdamID:v16];

  long long v17 = [v5 guid];

  [v14 setPodcastEpisodeGUID:v17];
  [v12 setStoreInfo:v14];

  return v12;
}

- (id)_stringForAsset:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 prettyName];
  id v5 = +[NSString stringWithFormat:@"<%p> %@", v3, v4];

  return v5;
}

- (void)_performCleanupTask
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v2 = +[ICEnvironmentMonitor sharedMonitor];
  unsigned __int8 v3 = [v2 isCharging];

  if (v3)
  {
    BOOL v4 = [sub_50C0() sharedInstance];
    unsigned __int8 v5 = [v4 isReady];

    id v6 = sub_4FB4();
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Cleanup task beggining", buf, 2u);
      }

      *(void *)id buf = 0;
      v88 = buf;
      uint64_t v89 = 0x3032000000;
      v90 = sub_A27C;
      v91 = sub_A28C;
      id v92 = 0;
      id v8 = +[NSFileManager defaultManager];
      id v9 = [sub_4C7C() managedAssetsDirectoryURL];
      id v10 = [v9 path];
      id v11 = (id *)(v88 + 40);
      id obj = (id)*((void *)v88 + 5);
      v62 = [v8 contentsOfDirectoryAtPath:v10 error:&obj];
      objc_storeStrong(v11, obj);

      if (*((void *)v88 + 5))
      {
        id v12 = sub_4FB4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = (void *)*((void *)v88 + 5);
          *(_DWORD *)v95 = 138412290;
          id v96 = v13;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Cleanup task unable to fetch episode asset paths - %@", v95, 0xCu);
        }
      }
      else
      {
        v61 = +[NSMutableSet setWithArray:v62];
        uint64_t v16 = sub_5634();
        long long v17 = +[NSFetchRequest fetchRequestWithEntityName:v16];

        uint64_t v18 = [sub_7B8C() predicateForDownloaded:1 excludeHidden:1];
        [v17 setPredicate:v18];

        uint64_t v19 = [sub_7B8C() propertiesToFetchAssetURL];
        [v17 setPropertiesToFetch:v19];

        long long v20 = [sub_54D4() sharedInstance];
        id v21 = [v20 privateQueueContext];

        long long v22 = +[NSMutableDictionary dictionary];
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472;
        v81[2] = sub_A294;
        v81[3] = &unk_104B8;
        id v82 = v21;
        id v23 = v17;
        id v83 = v23;
        v85 = buf;
        id v64 = v22;
        id v84 = v64;
        id v60 = v82;
        [v82 performBlockAndWait:v81];
        v59 = v23;
        if (*((void *)v88 + 5))
        {
          v24 = sub_4FB4();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            uint64_t v25 = (void *)*((void *)v88 + 5);
            *(_DWORD *)v95 = 138412290;
            id v96 = v25;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, "Cleanup task unable to fetch downloaded episodes - %@", v95, 0xCu);
          }
        }
        else
        {
          uint64_t v26 = +[NSMutableArray array];
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          v27 = v61;
          id v28 = [v27 countByEnumeratingWithState:&v77 objects:v99 count:16];
          if (v28)
          {
            uint64_t v29 = *(void *)v78;
            do
            {
              for (i = 0; i != v28; i = (char *)i + 1)
              {
                if (*(void *)v78 != v29) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v31 = *(void *)(*((void *)&v77 + 1) + 8 * i);
                v32 = [v64 objectForKey:v31];
                BOOL v33 = v32 == 0;

                if (v33) {
                  [v26 addObject:v31];
                }
              }
              id v28 = [v27 countByEnumeratingWithState:&v77 objects:v99 count:16];
            }
            while (v28);
          }

          v34 = sub_4FB4();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            id v35 = [v26 count];
            *(_DWORD *)v95 = 134218242;
            id v96 = v35;
            __int16 v97 = 2112;
            v98 = v26;
            _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "Cleanup task found %lu files to delete %@", v95, 0x16u);
          }

          v36 = +[NSMutableArray array];
          long long v75 = 0u;
          long long v76 = 0u;
          long long v74 = 0u;
          long long v73 = 0u;
          v37 = [v64 allKeys];
          id v38 = [v37 countByEnumeratingWithState:&v73 objects:v94 count:16];
          if (v38)
          {
            uint64_t v39 = *(void *)v74;
            do
            {
              for (j = 0; j != v38; j = (char *)j + 1)
              {
                if (*(void *)v74 != v39) {
                  objc_enumerationMutation(v37);
                }
                uint64_t v41 = *(void *)(*((void *)&v73 + 1) + 8 * (void)j);
                if (([v27 containsObject:v41] & 1) == 0) {
                  [v36 addObject:v41];
                }
              }
              id v38 = [v37 countByEnumeratingWithState:&v73 objects:v94 count:16];
            }
            while (v38);
          }

          v42 = v36;
          v43 = sub_4FB4();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            id v44 = [v36 count];
            *(_DWORD *)v95 = 134218242;
            id v96 = v44;
            __int16 v97 = 2112;
            v98 = v36;
            _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "Cleanup task found %lu assetURLs to clear %@", v95, 0x16u);
          }

          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          v24 = v26;
          id v45 = [v24 countByEnumeratingWithState:&v69 objects:v93 count:16];
          if (v45)
          {
            uint64_t v46 = *(void *)v70;
            do
            {
              for (k = 0; k != v45; k = (char *)k + 1)
              {
                if (*(void *)v70 != v46) {
                  objc_enumerationMutation(v24);
                }
                v48 = *(void **)(*((void *)&v69 + 1) + 8 * (void)k);
                v49 = +[NSFileManager defaultManager];
                v50 = [sub_4C7C() managedAssetsDirectoryURL];
                v51 = [v50 URLByAppendingPathComponent:v48];
                v52 = (id *)(v88 + 40);
                id v68 = (id)*((void *)v88 + 5);
                [v49 removeItemAtURL:v51 error:&v68];
                objc_storeStrong(v52, v68);
                v42 = v36;

                if (*((void *)v88 + 5))
                {
                  v53 = sub_4FB4();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                  {
                    v54 = (void *)*((void *)v88 + 5);
                    *(_DWORD *)v95 = 138412546;
                    id v96 = v48;
                    __int16 v97 = 2112;
                    v98 = v54;
                    _os_log_impl(&dword_0, v53, OS_LOG_TYPE_ERROR, "Cleanup task unable to delete asset at path %@ - %@", v95, 0x16u);
                  }

                  v55 = *((void *)v88 + 5);
                  *((void *)v88 + 5) = 0;
                }
                else
                {
                  v55 = sub_4FB4();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v95 = 138412290;
                    id v96 = v48;
                    _os_log_impl(&dword_0, v55, OS_LOG_TYPE_DEFAULT, "Cleanup task deleted asset at path %@", v95, 0xCu);
                  }
                }
              }
              id v45 = [v24 countByEnumeratingWithState:&v69 objects:v93 count:16];
            }
            while (v45);
          }

          if ([v42 count])
          {
            v65[0] = _NSConcreteStackBlock;
            v65[1] = 3221225472;
            v65[2] = sub_A3FC;
            v65[3] = &unk_103A0;
            id v66 = v42;
            id v67 = v64;
            [v60 performBlockAndWaitWithSave:v65];
          }
          v56 = sub_4FB4();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v95 = 0;
            _os_log_impl(&dword_0, v56, OS_LOG_TYPE_DEFAULT, "Cleanup task will delete orphaned keys", v95, 2u);
          }

          v57 = [(MTSyncClient *)self secureDownloadRenewalManager];
          [v57 requestSecureDeletionOfOrphanedKeys];

          v58 = sub_4FB4();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v95 = 0;
            _os_log_impl(&dword_0, v58, OS_LOG_TYPE_DEFAULT, "Cleanup task finished", v95, 2u);
          }
        }
        id v12 = v61;
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Cleanup task will not begin because DB is not ready", buf, 2u);
      }

      long long v15 = [sub_50C0() sharedInstance];
      [v15 attemptToFix];
    }
  }
  else
  {
    id v14 = sub_4FB4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Cleanup task will not begin off charger", buf, 2u);
    }
  }
}

- (id)syncDataClass
{
  return @"Podcasts";
}

- (BOOL)isEnabled
{
  if (![(MTSyncClient *)self _shouldRunPodcastsSyncClient])
  {
    unsigned __int8 v5 = sub_4FB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = 0;
      id v7 = "Podcasts sync client is disabled.";
      id v8 = (uint8_t *)&v12;
LABEL_10:
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, v7, v8, 2u);
    }
LABEL_11:
    BOOL v6 = 0;
    goto LABEL_12;
  }
  id v2 = +[ICStorageManager sharedManager];
  unsigned int v3 = [v2 cachingEnabled];

  BOOL v4 = sub_4FB4();
  unsigned __int8 v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = 0;
      id v7 = "Disabling Podcasts sync client since caching is disabled.";
      id v8 = (uint8_t *)&v10;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Enabling Podcasts sync client since caching is enabled.", buf, 2u);
  }
  BOOL v6 = 1;
LABEL_12:

  return v6;
}

- (unint64_t)currentRevision
{
  return 0;
}

- (id)revisionVersionToken
{
  return @"PodcastRevisionToken";
}

- (void)getChangesForSyncType:(unsigned int)a3 endpointType:(int)a4 afterRevision:(unint64_t)a5 upToRevision:(unint64_t)a6 withSyncParams:(id)a7 intoOutputStream:(id)a8 withStartHandler:(id)a9 withProgressHandler:(id)a10 withCompletionHandler:(id)a11
{
  if (a9) {
    BOOL v11 = a11 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    __int16 v12 = (void (*)(id, void))*((void *)a9 + 2);
    id v13 = (void (**)(id, void))a11;
    v12(a9, 0);
    v13[2](v13, 0);
  }
}

- (void)applyChangesForSyncType:(unsigned int)a3 endpointType:(int)a4 fromStream:(id)a5 withSyncParams:(id)a6 withProgressHandler:(id)a7 withCompletionHandler:(id)a8
{
  if (a8) {
    (*((void (**)(id, void, uint64_t, uint64_t))a8 + 2))(a8, 0, 1, 1);
  }
}

- (void)resetSyncDataWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)setSecureDownloadRenewalManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureDownloadRenewalManager, 0);
  objc_storeStrong((id *)&self->_callBackQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end