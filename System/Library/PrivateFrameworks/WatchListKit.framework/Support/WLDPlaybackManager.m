@interface WLDPlaybackManager
+ (id)sharedManager;
- (BOOL)_getIsPrompting;
- (BOOL)_isDirectPlaybackReportingDisabled;
- (BOOL)_isDirectoryPresentAndNonEmpty:(id)a3;
- (BOOL)_offlineValidation:(id)a3;
- (BOOL)_serialize:(id)a3;
- (BOOL)_shouldPromptForBundleID:(id)a3 outAccessStatus:(unint64_t *)a4;
- (NSMutableDictionary)lastSummaryDictionary;
- (WLDPlaybackManager)init;
- (id)_getLastSummaryBySessionID:(id)a3;
- (id)_getReporterBySessionID:(id)a3 isLive:(BOOL)a4;
- (id)_getSessionReporterBySessionID:(id)a3;
- (id)_queueDir;
- (id)_queuePathForSummary:(id)a3;
- (id)nowPlayingObserver;
- (id)queue;
- (id)reporter;
- (void)_catalogSummary:(id)a3;
- (void)_cleanupSummary:(id)a3;
- (void)_endSession:(id)a3;
- (void)_enqueuePendingReports;
- (void)_enqueuePlaybackSummary:(id)a3 sessionID:(id)a4 serialize:(BOOL)a5;
- (void)_handleDirectPlaybackAppTermination:(id)a3;
- (void)_handleReporting:(id)a3 summary:(id)a4 sessionIDKey:(id)a5 isFirstParty:(BOOL)a6;
- (void)_handleReportingError:(id)a3 forSummary:(id)a4;
- (void)_networkReachabilityChanged:(id)a3;
- (void)_onlineValidation:(id)a3 completion:(id)a4;
- (void)_promptForBundleID:(id)a3 completionHandler:(id)a4;
- (void)_removeLastSummaryBySessionID:(id)a3;
- (void)_removeReporterBySessionID:(id)a3;
- (void)_scanForPendingReports;
- (void)_setIsPrompting:(BOOL)a3;
- (void)_setLastSummaryBySessionID:(id)a3 sessionID:(id)a4;
- (void)_setSessionReporter:(id)a3 sessionID:(id)a4;
- (void)checkPendingReports;
- (void)dealloc;
- (void)fetchDecoratedNowPlayingSummaries:(id)a3;
- (void)fetchNowPlayingSummaries:(id)a3;
- (void)handleDirectPlaybackSummary:(id)a3 sessionID:(id)a4;
- (void)handlePlaybackSummary:(id)a3 sessionID:(id)a4;
- (void)handleSubscriptionRegistration;
- (void)requestToPromptForBundleID:(id)a3 completionHandler:(id)a4;
- (void)setLastSummaryDictionary:(id)a3;
@end

@implementation WLDPlaybackManager

- (void)checkPendingReports
{
  NSLog(@"WLDPlaybackManager: asked to check pending reports", a2);

  [(WLDPlaybackManager *)self _enqueuePendingReports];
}

- (void)_enqueuePendingReports
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __44__WLDPlaybackManager__enqueuePendingReports__block_invoke;
  v5[3] = &unk_100045508;
  v5[4] = self;
  v3 = +[WLDTransactionBlockOperation blockOperationWithBlock:v5];
  v4 = [(WLDPlaybackManager *)self queue];
  [v4 addOperation:v3];
}

- (id)queue
{
  v2 = self;
  objc_sync_enter(v2);
  queue = v2->_queue;
  if (!queue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v5 = v2->_queue;
    v2->_queue = v4;

    [(NSOperationQueue *)v2->_queue setName:@"com.apple.watchlistd.PlaybackManagerQueue"];
    [(NSOperationQueue *)v2->_queue setMaxConcurrentOperationCount:1];
    queue = v2->_queue;
  }
  v6 = queue;
  objc_sync_exit(v2);

  return v6;
}

+ (id)sharedManager
{
  if (sharedManager___once != -1) {
    dispatch_once(&sharedManager___once, &__block_literal_global_5);
  }
  v2 = (void *)sharedManager___sharedManager;

  return v2;
}

- (BOOL)_isDirectoryPresentAndNonEmpty:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    v5 = +[NSFileManager defaultManager];
    v6 = +[NSURL fileURLWithPath:v3];
    v16[0] = NSURLNameKey;
    v16[1] = NSURLIsDirectoryKey;
    v7 = +[NSArray arrayWithObjects:v16 count:2];
    v8 = [v5 enumeratorAtURL:v6 includingPropertiesForKeys:v7 options:4 errorHandler:&__block_literal_global_316];

    v9 = [v8 allObjects];
    id v10 = [v9 count];
    BOOL v11 = v10 != 0;

    if (v10)
    {
      NSLog(@"WLDPlaybackManager: _checkIfUserDirectoryIsEmpty old path is not empty.");
    }
    else
    {
      NSLog(@"WLDPlaybackManager: _checkIfUserDirectoryIsEmpty found empty directory. Will delete it to use group container one.");
      id v15 = 0;
      [v4 removeItemAtPath:v3 error:&v15];
      id v12 = v15;
      v13 = v12;
      if (v12) {
        NSLog(@"WLDPlaybackManager: [Error] failed to remove user directory with error: %@.", v12);
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_scanForPendingReports
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_isReportScanningHappening)
  {
    NSLog(@"WLDPlaybackManager: _scanForPendingReports currently happening. Will skip.");
    objc_sync_exit(obj);

    return;
  }
  obj->_isReportScanningHappening = 1;
  objc_sync_exit(obj);

  NSLog(@"WLDPlaybackManager: scanning for pending reports");
  v47 = [(WLDPlaybackManager *)obj _queueDir];
  v2 = +[NSFileManager defaultManager];
  unsigned __int8 v3 = [v2 fileExistsAtPath:v47];

  if ((v3 & 1) == 0)
  {
    v45 = obj;
    objc_sync_enter(v45);
    obj->_isReportScanningHappening = 0;
    objc_sync_exit(v45);

    goto LABEL_50;
  }
  v4 = +[NSFileManager defaultManager];
  v5 = +[NSURL fileURLWithPath:v47];
  v78[0] = NSURLNameKey;
  v78[1] = NSURLIsDirectoryKey;
  v6 = +[NSArray arrayWithObjects:v78 count:2];
  v7 = [v4 enumeratorAtURL:v5 includingPropertiesForKeys:v6 options:4 errorHandler:&__block_literal_global_278];

  v46 = +[NSMutableArray array];
  v52 = +[NSMutableArray array];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v55 = v7;
  id v8 = [v55 countByEnumeratingWithState:&v71 objects:v77 count:16];
  if (!v8) {
    goto LABEL_32;
  }
  uint64_t v9 = *(void *)v72;
  do
  {
    id v10 = 0;
    do
    {
      if (*(void *)v72 != v9) {
        objc_enumerationMutation(v55);
      }
      BOOL v11 = *(void **)(*((void *)&v71 + 1) + 8 * (void)v10);
      id v70 = 0;
      [v11 getResourceValue:&v70 forKey:NSURLIsDirectoryKey error:0];
      id v12 = v70;
      if (([v12 BOOLValue] & 1) == 0)
      {
        v13 = +[NSFileManager defaultManager];
        v14 = [v11 path];
        id v69 = 0;
        id v15 = [v13 attributesOfItemAtPath:v14 error:&v69];
        id v16 = v69;

        if (v16)
        {
          NSLog(@"WLDPlaybackManager: _scanForPendingReports attributesOfItemAtPath error: %@", v16);

LABEL_14:
          goto LABEL_15;
        }
        if (!v15)
        {
          NSLog(@"WLDPlaybackManager: _scanForPendingReports attributesOfItemAtPath error: %@", 0);
          goto LABEL_14;
        }
        v17 = +[NSDate date];
        v18 = [v15 objectForKey:NSFileModificationDate];
        [v17 timeIntervalSinceDate:v18];
        double v20 = v19;

        if (obj->_maximumAgeForReport < (uint64_t)v20)
        {
          NSLog(@"WLDPlaybackManager: The last modified time (%f) is greater than max age (%lu). Will delete report.", *(void *)&v20, obj->_maximumAgeForReport);
          v21 = +[NSFileManager defaultManager];
          v22 = [v11 path];
          [v21 removeItemAtPath:v22 error:0];

          goto LABEL_14;
        }
        v23 = [v11 path];
        v24 = +[NSData dataWithContentsOfFile:v23];

        id v25 = objc_alloc((Class)NSKeyedUnarchiver);
        id v68 = 0;
        id v26 = [v25 initForReadingFromData:v24 error:&v68];
        id v27 = v68;
        v54 = v27;
        if (v27)
        {
          NSLog(@"WLDPlaybackManager: _scanForPendingReports secure unarchiver error: %@", v27);
          goto LABEL_29;
        }
        v53 = [v26 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
        if (v53)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v50 = +[ACAccountStore ams_sharedAccountStore];
            v49 = [v53 accountIDAsNumber];
            v48 = objc_msgSend(v50, "ams_iTunesAccountWithDSID:", v49);

            if (v48)
            {
              [v46 addObject:v53];

              goto LABEL_30;
            }
            v51 = [v53 accountIDAsNumber];
            NSLog(@"WLDPlaybackManager: _scanForPendingReports no iTunes account for ID: %@", v51);
          }
        }

LABEL_29:
        [v52 addObject:v11];
LABEL_30:

        goto LABEL_14;
      }
LABEL_15:

      id v10 = (char *)v10 + 1;
    }
    while (v8 != v10);
    id v28 = [v55 countByEnumeratingWithState:&v71 objects:v77 count:16];
    id v8 = v28;
  }
  while (v28);
LABEL_32:

  long long v66 = 0u;
  long long v67 = 0u;
  long long v65 = 0u;
  long long v64 = 0u;
  id v29 = v52;
  id v30 = [v29 countByEnumeratingWithState:&v64 objects:v76 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v65;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v65 != v31) {
          objc_enumerationMutation(v29);
        }
        uint64_t v33 = *(void *)(*((void *)&v64 + 1) + 8 * i);
        NSLog(@"WLDPlaybackManager: Deleting invalid item: %@", v33);
        v34 = +[NSFileManager defaultManager];
        [v34 removeItemAtURL:v33 error:0];
      }
      id v30 = [v29 countByEnumeratingWithState:&v64 objects:v76 count:16];
    }
    while (v30);
  }

  v35 = +[WLKReachabilityMonitor sharedInstance];
  unsigned int v36 = [v35 isNetworkReachable];

  if (v36)
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v37 = v46;
    id v38 = [v37 countByEnumeratingWithState:&v60 objects:v75 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v61;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(void *)v61 != v39) {
            objc_enumerationMutation(v37);
          }
          uint64_t v41 = *(void *)(*((void *)&v60 + 1) + 8 * (void)j);
          NSLog(@"WLDPlaybackManager: Found pending playback report. Enqueuing.");
          [(WLDPlaybackManager *)obj _enqueuePlaybackSummary:v41 sessionID:@"DefaultPlaybackSessionID" serialize:0];
        }
        id v38 = [v37 countByEnumeratingWithState:&v60 objects:v75 count:16];
      }
      while (v38);
    }
  }
  v42 = obj;
  objc_sync_enter(v42);
  obj->_isReportScanningHappening = 0;
  objc_sync_exit(v42);

  objc_initWeak(&location, v42);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = __44__WLDPlaybackManager__scanForPendingReports__block_invoke_2;
  v57[3] = &unk_1000456B0;
  objc_copyWeak(&v58, &location);
  v57[4] = v42;
  v43 = +[NSBlockOperation blockOperationWithBlock:v57];
  v44 = [(WLDPlaybackManager *)v42 queue];
  [v44 addOperation:v43];

  objc_destroyWeak(&v58);
  objc_destroyWeak(&location);

LABEL_50:
}

- (id)_queueDir
{
  unsigned __int8 v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v4 = [v3 firstObject];

  v5 = [v4 stringByAppendingPathComponent:@"com.apple.watchlistd"];

  v6 = [v5 stringByAppendingPathComponent:@"pending"];

  if ([(WLDPlaybackManager *)self _isDirectoryPresentAndNonEmpty:v6])
  {
    id v7 = v6;
  }
  else
  {
    id v8 = WLKDefaultSupportPath();
    uint64_t v9 = [v8 stringByAppendingPathComponent:@"com.apple.watchlistd"];

    id v7 = [v9 stringByAppendingPathComponent:@"pending"];

    NSLog(@"WLDPlaybackManager: _queueDir using path %@ for pending reports.", v7);
  }

  return v7;
}

id __44__WLDPlaybackManager__enqueuePendingReports__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scanForPendingReports];
}

void __35__WLDPlaybackManager_sharedManager__block_invoke(id a1)
{
  sharedManager___sharedManager = objc_alloc_init(WLDPlaybackManager);

  _objc_release_x1();
}

- (WLDPlaybackManager)init
{
  v30.receiver = self;
  v30.super_class = (Class)WLDPlaybackManager;
  v2 = [(WLDPlaybackManager *)&v30 init];
  if (v2)
  {
    unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
    uint64_t v4 = WLKReachabilityMonitorReachabilityDidChange;
    v5 = +[WLKReachabilityMonitor sharedInstance];
    [v3 addObserver:v2 selector:"_networkReachabilityChanged:" name:v4 object:v5];

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    reporterDictionary = v2->_reporterDictionary;
    v2->_reporterDictionary = v6;

    id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lastSummaryDictionary = v2->_lastSummaryDictionary;
    v2->_lastSummaryDictionary = v8;

    id v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    directPlayClientList = v2->_directPlayClientList;
    v2->_directPlayClientList = v10;

    id v12 = objc_alloc((Class)NSUserDefaults);
    id v13 = [v12 initWithSuiteName:WLKDefaultsDomain];
    v2->_disableDirectPlaybackReporting = [v13 BOOLForKey:@"DisableDirectPlaybackReporting"];
    id v14 = objc_alloc((Class)NSUserDefaults);
    id v15 = WLKTVAppBundleID();
    id v16 = [v14 initWithSuiteName:v15];

    id v17 = [v16 integerForKey:@"PlaybackManagerUserDefaultsKeyMaximumAgeForReport"];
    uint64_t v18 = 1209600;
    if (v17) {
      uint64_t v18 = (uint64_t)v17;
    }
    v2->_maximumAgeForReport = v18;
    v2->_isReportScanningHappening = 0;
    [(WLDPlaybackManager *)v2 _enqueuePendingReports];
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__1;
    v28[4] = __Block_byref_object_dispose__1;
    double v19 = v2;
    id v29 = v19;
    double v20 = [WLDPlaybackNowPlayingObserver alloc];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __26__WLDPlaybackManager_init__block_invoke;
    v25[3] = &unk_100045398;
    id v27 = v28;
    v21 = v19;
    id v26 = v21;
    v22 = [(WLDPlaybackNowPlayingObserver *)v20 initWithUpdateHandler:v25];
    nowPlayingObserver = v21->_nowPlayingObserver;
    v21->_nowPlayingObserver = v22;

    _Block_object_dispose(v28, 8);
  }
  return v2;
}

void __26__WLDPlaybackManager_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v6)
  {
    id v7 = [v10 bundleID];
    if ([*(id *)(*(void *)(a1 + 32) + 64) containsObject:v7]) {
      int HasBoolValueForEntitlement = 1;
    }
    else {
      int HasBoolValueForEntitlement = WLDBundleHasBoolValueForEntitlement(v7, WLKEntitlementPlaybackReport);
    }
    if ([*(id *)(a1 + 32) _isDirectPlaybackReportingDisabled]) {
      NSLog(@"WLDPlaybackManager:UpdateHandler Direct-reporting is disabled by user defaults");
    }
    if (HasBoolValueForEntitlement
      && ([*(id *)(a1 + 32) _isDirectPlaybackReportingDisabled] & 1) == 0)
    {
      if (([*(id *)(*(void *)(a1 + 32) + 64) containsObject:v7] & 1) == 0)
      {
        if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 64) count] <= 0xA) {
          [*(id *)(*(void *)(a1 + 32) + 64) addObject:v7];
        }
        NSLog(@"WLDPlaybackManager: Ignoring MediaRemote NPI updates for %@; application supports direct-reporting!",
          v7);
      }
    }
    else
    {
      id v9 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDPlaybackNowPlayingObserver.updateHandler"];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) handlePlaybackSummary:v10 sessionID:v5];
    }
  }
}

- (void)dealloc
{
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WLDPlaybackManager;
  [(WLDPlaybackManager *)&v4 dealloc];
}

- (id)nowPlayingObserver
{
  return self->_nowPlayingObserver;
}

- (void)handleDirectPlaybackSummary:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WLDPlaybackManager *)self _isDirectPlaybackReportingDisabled])
  {
    NSLog(@"WLDPlaybackManager: Direct playback reporting is disabled by user default");
  }
  else
  {
    id v8 = [v6 bundleID];
    if (v8)
    {
      id v9 = [(WLDPlaybackDirectPlayObserver *)self->_directPlayObserver bundleID];
      unsigned __int8 v10 = [v9 isEqualToString:v8];

      if ((v10 & 1) == 0)
      {
        NSLog(@"WLDPlaybackManager: Creating directPlay observer for %@", v8);
        BOOL v11 = [[WLDPlaybackDirectPlayObserver alloc] initWithBundleID:v8];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = __60__WLDPlaybackManager_handleDirectPlaybackSummary_sessionID___block_invoke;
        v15[3] = &unk_1000453C0;
        v15[4] = self;
        id v16 = v8;
        [(WLDPlaybackDirectPlayObserver *)v11 setUpdateHandler:v15];
        directPlayObserver = self->_directPlayObserver;
        self->_directPlayObserver = v11;
        id v13 = v11;
      }
      [(WLDPlaybackManager *)self _enqueuePlaybackSummary:v6 sessionID:v7 serialize:1];
      id v14 = +[WLDFederatedPunchoutReporter sharedFederatedPunchoutReporter];
      [v14 recordPlaybackSummary:v6];
    }
  }
}

id *__60__WLDPlaybackManager_handleDirectPlaybackSummary_sessionID___block_invoke(id *result, char a2)
{
  if ((a2 & 1) == 0) {
    return (id *)[result[4] _handleDirectPlaybackAppTermination:result[5]];
  }
  return result;
}

- (void)handlePlaybackSummary:(id)a3 sessionID:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id v7 = +[WLDFederatedPunchoutReporter sharedFederatedPunchoutReporter];
  [v7 recordPlaybackSummary:v23];

  id v8 = +[WLKChannelUtilities sharedInstanceFiltered];
  id v9 = [v23 bundleID];
  unsigned __int8 v10 = [v8 channelForBundleID:v9];

  BOOL v11 = [v10 rateLimit];
  id v12 = [v11 objectForKey:WLKChannelDetailsKeyRateLimitRateKey];
  id v13 = [v12 unsignedIntegerValue];

  id v14 = [v10 rateLimit];
  id v15 = [v14 objectForKey:WLKChannelDetailsKeyRateLimitBurstKey];
  id v16 = [v15 unsignedIntegerValue];

  if (!v13) {
    goto LABEL_8;
  }
  if (!v16) {
    goto LABEL_8;
  }
  id v17 = [(WLDPlaybackManager *)self _getLastSummaryBySessionID:v6];
  unsigned int v18 = [v17 isEquivalentToSummaryExcludingCursor:v23];

  if (!v18) {
    goto LABEL_8;
  }
  rateLimiter = self->_rateLimiter;
  if (rateLimiter)
  {
    [(WLDRateLimiter *)rateLimiter setRate:v13];
    [(WLDRateLimiter *)self->_rateLimiter setBurst:v16];
  }
  else
  {
    double v20 = [[WLDRateLimiter alloc] initWithRate:v13 burst:v16];
    v21 = self->_rateLimiter;
    self->_rateLimiter = v20;
  }
  if (![(WLDRateLimiter *)self->_rateLimiter doOperation])
  {
    v22 = [v10 rateLimit];
    NSLog(@"WLDPlaybackManager: dropping report. Exceeded rate limit %@ %@", v22, v23);
  }
  else
  {
LABEL_8:
    [(WLDPlaybackManager *)self _enqueuePlaybackSummary:v23 sessionID:v6 serialize:1];
  }
}

- (void)fetchNowPlayingSummaries:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __47__WLDPlaybackManager_fetchNowPlayingSummaries___block_invoke;
  v7[3] = &unk_100044FB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__WLDPlaybackManager_fetchNowPlayingSummaries___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) nowPlayingObserver];
  id v4 = [v2 nowPlayingSummaries];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)fetchDecoratedNowPlayingSummaries:(id)a3
{
  id v18 = a3;
  id v4 = self->_lastSummaryDictionary;
  objc_sync_enter(v4);
  id v21 = [(NSMutableDictionary *)self->_lastSummaryDictionary mutableCopy];
  objc_sync_exit(v4);

  id v17 = self;
  id v5 = [(WLDPlaybackManager *)self nowPlayingObserver];
  double v19 = [v5 nowPlayingSummaries];

  uint64_t v35 = 0;
  unsigned int v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__1;
  uint64_t v39 = __Block_byref_object_dispose__1;
  id v40 = 0;
  if (v19 && [v19 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v19;
    id v6 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v32;
      uint64_t v8 = 1;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v32 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v9);
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke;
          v30[3] = &unk_1000453E8;
          v30[4] = v10;
          v30[5] = &v35;
          [v21 enumerateKeysAndObjectsUsingBlock:v30];
          if (!v36[5])
          {
            NSLog(@"WLDPlaybackManager: Found untracked NPI. Will fetch canonical");
            BOOL v11 = +[NSString stringWithFormat:@"<Untracked NPI %ld>", v8];
            [v21 setObject:v10 forKeyedSubscript:v11];

            ++v8;
          }
          id v9 = (char *)v9 + 1;
        }
        while (v6 != v9);
        id v6 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v6);
    }
  }
  id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v21 count]);
  NSLog(@"WLDPlaybackManager: begin decorating (%@) summaries", v12);

  id v13 = dispatch_get_global_queue(0, 0);
  dispatch_group_t v14 = dispatch_group_create();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__1;
  v28[4] = __Block_byref_object_dispose__1;
  id v29 = +[NSMutableDictionary dictionary];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke_2;
  v25[3] = &unk_100045438;
  void v25[4] = v17;
  id v15 = v14;
  id v26 = v15;
  id v27 = v28;
  [v21 enumerateKeysAndObjectsUsingBlock:v25];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke_4;
  block[3] = &unk_1000454A0;
  id v23 = v18;
  v24 = v28;
  id v16 = v18;
  dispatch_group_notify(v15, v13, block);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v35, 8);
}

void __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isEquivalentToSummaryExcludingCursor:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 playbackState])
  {
    uint64_t v7 = [*(id *)(a1 + 32) _getSessionReporterBySessionID:v5];
    if (v7)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      NSLog(@"WLDPlaybackManager: Found cached reporter");
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke_3;
      v10[3] = &unk_100045410;
      id v8 = v6;
      uint64_t v9 = *(void *)(a1 + 48);
      id v11 = v8;
      uint64_t v14 = v9;
      id v12 = v5;
      id v13 = *(id *)(a1 + 40);
      [v7 getCachedCanonicalIDForSummary:v8 completionHandler:v10];
    }
    else
    {
      NSLog(@"WLDPlaybackManager: Found untracked NPI");
    }
  }
  else
  {
    NSLog(@"WLDPlaybackManager: Skipping stopped summary.");
  }
}

void __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    NSLog(@"WLDPlaybackManager: Found cached canonical id using cached reporter");
    id v6 = [objc_alloc((Class)WLKDecoratedPlaybackSummary) initWithSummary:*(void *)(a1 + 32) canonicalID:v8];
    id v7 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    objc_sync_enter(v7);
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v6 forKey:*(void *)(a1 + 40)];
    objc_sync_exit(v7);
  }
  else
  {
    NSLog(@"WLDPlaybackManager: Canonical id is not cached");
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke_4(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    [*(id *)(*(void *)(*(void *)(result + 40) + 8) + 40) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_80];
    NSLog(@"WLDPlaybackManager: done decorating summaries");
    uint64_t v2 = *(void *)(v1 + 32);
    if ([*(id *)(*(void *)(*(void *)(v1 + 40) + 8) + 40) count]) {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 40);
    }
    else {
      uint64_t v3 = 0;
    }
    id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

void __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke_5(id a1, NSString *a2, WLKDecoratedPlaybackSummary *a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = [(WLKDecoratedPlaybackSummary *)a3 canonicalID];
  NSLog(@"WLDPlaybackManager: Decorated [%@] : %@", v5, v6);
}

- (void)handleSubscriptionRegistration
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __52__WLDPlaybackManager_handleSubscriptionRegistration__block_invoke;
  v5[3] = &unk_100045508;
  v5[4] = self;
  uint64_t v3 = +[WLDTransactionBlockOperation blockOperationWithBlock:v5];
  id v4 = [(WLDPlaybackManager *)self queue];
  [v4 addOperation:v3];
}

void __52__WLDPlaybackManager_handleSubscriptionRegistration__block_invoke(uint64_t a1)
{
  NSLog(@"WLDPlaybackManager: handleSubscriptionRegistration");
  uint64_t v2 = +[WLKAppLibrary defaultAppLibrary];
  uint64_t v3 = [v2 refresh];
  id v4 = [v3 objectForKeyedSubscript:WLKAppLibraryDidChangeNotificationSubscribedChangesKey];
  id v8 = [v4 objectForKeyedSubscript:WLKArrayAdditionsKey];

  if (!v8)
  {
    NSLog(@"WLDPlaybackManager: handleSubscriptionRegistration: No sbid diff, considering all sbids");
    id v5 = +[WLKAppLibrary defaultAppLibrary];
    id v8 = [v5 subscribedAppBundleIdentifiers];
  }
  unsigned int v6 = [*(id *)(a1 + 32) _offlineValidation:0];
  if ([v8 count] && (v6 & 1) != 0)
  {
    NSLog(&CFSTR("WLDPlaybackManager: handleSubscriptionRegistration: done refreshing library. Will request init/config with de"
                 "fault cache policy").isa);
    id v7 = +[WLKConfigurationManager sharedInstance];
    [v7 fetchConfigurationWithCompletionHandler:&__block_literal_global_104];
  }
  else
  {
    NSLog(@"WLDPlaybackManager: handleSubscriptionRegistration: Not continuing. sbids:%@ validation:%d", v8, v6);
  }
}

void __52__WLDPlaybackManager_handleSubscriptionRegistration__block_invoke_2(id a1, WLKServerConfigurationResponse *a2, NSError *a3)
{
}

- (void)requestToPromptForBundleID:(id)a3 completionHandler:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __67__WLDPlaybackManager_requestToPromptForBundleID_completionHandler___block_invoke;
  v10[3] = &unk_100044EC8;
  void v10[4] = self;
  id v11 = a3;
  id v12 = a4;
  id v6 = v12;
  id v7 = v11;
  id v8 = +[WLDTransactionBlockOperation blockOperationWithBlock:v10];
  uint64_t v9 = [(WLDPlaybackManager *)self queue];
  [v9 addOperation:v8];
}

id __67__WLDPlaybackManager_requestToPromptForBundleID_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptForBundleID:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (id)reporter
{
  NSLog(@"WLDPlaybackManager: invoked default session reporter", a2);

  return [(WLDPlaybackManager *)self _getReporterBySessionID:@"DefaultPlaybackSessionID" isLive:0];
}

- (id)_getLastSummaryBySessionID:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = self->_lastSummaryDictionary;
  objc_sync_enter(v5);
  if (v4) {
    CFStringRef v6 = v4;
  }
  else {
    CFStringRef v6 = @"DefaultPlaybackSessionID";
  }
  id v7 = [(NSMutableDictionary *)self->_lastSummaryDictionary objectForKey:v6];
  objc_sync_exit(v5);

  return v7;
}

- (void)_removeLastSummaryBySessionID:(id)a3
{
  CFStringRef v6 = (__CFString *)a3;
  id v4 = self->_lastSummaryDictionary;
  objc_sync_enter(v4);
  if (v6) {
    CFStringRef v5 = v6;
  }
  else {
    CFStringRef v5 = @"DefaultPlaybackSessionID";
  }
  [(NSMutableDictionary *)self->_lastSummaryDictionary removeObjectForKey:v5];
  objc_sync_exit(v4);
}

- (void)_setSessionReporter:(id)a3 sessionID:(id)a4
{
  id v9 = a3;
  CFStringRef v6 = (__CFString *)a4;
  if (v9)
  {
    id v7 = self->_reporterDictionary;
    objc_sync_enter(v7);
    if (v6) {
      CFStringRef v8 = v6;
    }
    else {
      CFStringRef v8 = @"DefaultPlaybackSessionID";
    }
    [(NSMutableDictionary *)self->_reporterDictionary setObject:v9 forKey:v8];
    objc_sync_exit(v7);
  }
}

- (void)_setLastSummaryBySessionID:(id)a3 sessionID:(id)a4
{
  id v9 = a3;
  CFStringRef v6 = (__CFString *)a4;
  id v7 = self->_lastSummaryDictionary;
  objc_sync_enter(v7);
  if (v6) {
    CFStringRef v8 = v6;
  }
  else {
    CFStringRef v8 = @"DefaultPlaybackSessionID";
  }
  [(NSMutableDictionary *)self->_lastSummaryDictionary setObject:v9 forKey:v8];
  objc_sync_exit(v7);
}

- (id)_getSessionReporterBySessionID:(id)a3
{
  id v4 = (__CFString *)a3;
  CFStringRef v5 = self->_reporterDictionary;
  objc_sync_enter(v5);
  if (v4) {
    CFStringRef v6 = v4;
  }
  else {
    CFStringRef v6 = @"DefaultPlaybackSessionID";
  }
  id v7 = [(NSMutableDictionary *)self->_reporterDictionary objectForKey:v6];
  objc_sync_exit(v5);

  return v7;
}

- (id)_getReporterBySessionID:(id)a3 isLive:(BOOL)a4
{
  BOOL v4 = a4;
  CFStringRef v6 = (__CFString *)a3;
  id v7 = v6;
  CFStringRef v8 = @"DefaultPlaybackSessionID";
  if (v6) {
    CFStringRef v8 = v6;
  }
  id v9 = v8;
  uint64_t v10 = [(WLDPlaybackManager *)self _getSessionReporterBySessionID:v9];
  id v11 = [(WLDPlaybackManager *)self _getLastSummaryBySessionID:v9];
  if (![v11 playbackType] && !v4)
  {
    id v12 = off_1000446E0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSLog(@"WLDPlaybackManager: Returning a previously created WLDPlaybackReporter");
      goto LABEL_16;
    }
    NSLog(@"WLDPlaybackManager: Creating a WLDPlaybackReporter");
LABEL_15:
    [v10 invalidate];
    id v13 = [objc_alloc(*v12) initWithSessionID:v9];

    [(WLDPlaybackManager *)self _setSessionReporter:v13 sessionID:v9];
    uint64_t v10 = v13;
    goto LABEL_16;
  }
  if ([v11 playbackType] == (id)2 || objc_msgSend(v11, "playbackType") == (id)1 || v4)
  {
    id v12 = off_1000446D8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSLog(@"WLDPlaybackManager: Returning a previously created WLDLivePlaybackReporter");
      goto LABEL_16;
    }
    NSLog(@"WLDPlaybackManager: Creating a WLDLivePlaybackReporter");
    goto LABEL_15;
  }
LABEL_16:
  id v14 = v10;

  return v14;
}

- (void)_removeReporterBySessionID:(id)a3
{
  CFStringRef v8 = (__CFString *)a3;
  BOOL v4 = self->_reporterDictionary;
  objc_sync_enter(v4);
  CFStringRef v5 = @"DefaultPlaybackSessionID";
  if (v8) {
    CFStringRef v5 = v8;
  }
  CFStringRef v6 = v5;
  id v7 = [(NSMutableDictionary *)self->_reporterDictionary objectForKey:v6];
  [v7 invalidate];
  [(NSMutableDictionary *)self->_reporterDictionary removeObjectForKey:v6];

  objc_sync_exit(v4);
}

- (void)_endSession:(id)a3
{
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = __34__WLDPlaybackManager__endSession___block_invoke;
  uint64_t v10 = &unk_100044E28;
  id v11 = a3;
  id v12 = self;
  id v4 = v11;
  CFStringRef v5 = +[NSBlockOperation blockOperationWithBlock:&v7];
  CFStringRef v6 = [(WLDPlaybackManager *)self queue];
  [v6 addOperation:v5];
}

id __34__WLDPlaybackManager__endSession___block_invoke(uint64_t a1)
{
  NSLog(@"WLDPlaybackManager: End session: %@", *(void *)(a1 + 32));
  [*(id *)(a1 + 40) _removeReporterBySessionID:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _removeLastSummaryBySessionID:*(void *)(a1 + 32)];

  return +[WLKUpNextWidgetCacheManager requestReload];
}

- (void)_handleDirectPlaybackAppTermination:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = self->_lastSummaryDictionary;
  objc_sync_enter(v5);
  lastSummaryDictionary = self->_lastSummaryDictionary;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __58__WLDPlaybackManager__handleDirectPlaybackAppTermination___block_invoke;
  v8[3] = &unk_100045530;
  id v7 = v4;
  id v9 = v7;
  uint64_t v10 = self;
  [(NSMutableDictionary *)lastSummaryDictionary enumerateKeysAndObjectsUsingBlock:v8];

  objc_sync_exit(v5);
}

uint64_t __58__WLDPlaybackManager__handleDirectPlaybackAppTermination___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  CFStringRef v5 = [a3 bundleID];
  unsigned int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) _getLastSummaryBySessionID:v10];
    if ([v7 playbackState] == (id)1)
    {
      NSLog(@"WLDPlaybackManager: Generating stopped playback event due to app termination.");
      uint64_t v8 = [v7 elapsedTimeSummaryWithPlaybackState:0 timerDerived:0];
      [*(id *)(a1 + 40) _enqueuePlaybackSummary:v8 sessionID:v10 serialize:1];
    }
    else if (v7)
    {
      [*(id *)(a1 + 40) endDirectPlaybackSession:v10];
    }
  }

  return _objc_release_x2();
}

- (BOOL)_getIsPrompting
{
  return self->_isPrompting;
}

- (void)_setIsPrompting:(BOOL)a3
{
  self->_isPrompting = a3;
}

- (void)_enqueuePlaybackSummary:(id)a3 sessionID:(id)a4 serialize:(BOOL)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  if (+[WLKNetworkRequestUtilities isGDPRAccepted])
  {
    id v10 = @"DefaultPlaybackSessionID";
    if (v9) {
      id v10 = v9;
    }
    id v11 = v10;
    [(WLDPlaybackManager *)self _setLastSummaryBySessionID:v8 sessionID:v11];
    id v12 = -[WLDPlaybackManager _getReporterBySessionID:isLive:](self, "_getReporterBySessionID:isLive:", v11, [v8 isLiveType]);
    id v13 = [v8 shortDescription];
    NSLog(@"WLDPlaybackManager: enqueue: %@ for sessionID %@", v13, v11);

    objc_initWeak(&location, self);
    id v14 = objc_alloc_init(WLDTransactionBlockOperation);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __66__WLDPlaybackManager__enqueuePlaybackSummary_sessionID_serialize___block_invoke;
    v18[3] = &unk_1000455A8;
    objc_copyWeak(&v22, &location);
    id v19 = v8;
    BOOL v23 = a5;
    id v15 = v12;
    id v20 = v15;
    id v16 = v11;
    id v21 = v16;
    [(WLDTransactionBlockOperation *)v14 addExecutionBlock:v18];
    id v17 = [(WLDPlaybackManager *)self queue];
    [v17 addOperation:v14];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    NSLog(@"WLDPlaybackManager: GDPR not yet accepted, returning early");
  }
}

void __66__WLDPlaybackManager__enqueuePlaybackSummary_sessionID_serialize___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained _offlineValidation:*(void *)(a1 + 32)])
  {
    if (*(unsigned char *)(a1 + 64) && ![*(id *)(a1 + 32) playbackType]) {
      [WeakRetained _serialize:*(void *)(a1 + 32)];
    }
    uint64_t v4 = *(void *)(a1 + 32);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __66__WLDPlaybackManager__enqueuePlaybackSummary_sessionID_serialize___block_invoke_2;
    v5[3] = &unk_100045580;
    objc_copyWeak(&v10, v2);
    id v6 = *(id *)(a1 + 32);
    id v7 = WeakRetained;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    [WeakRetained _onlineValidation:v4 completion:v5];

    objc_destroyWeak(&v10);
  }
}

void __66__WLDPlaybackManager__enqueuePlaybackSummary_sessionID_serialize___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v7 = WeakRetained;
  if (a2)
  {
    id v8 = [*(id *)(a1 + 32) bundleID];
    id v9 = +[WLKChannelUtilities sharedInstanceFiltered];
    unsigned __int8 v10 = [v9 isItunesOrFirstPartyBundleID:v8];

    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      id v14 = v7;
      uint64_t v15 = 1;
    }
    else
    {
      uint64_t v24 = 0;
      if ([v7 _shouldPromptForBundleID:v8 outAccessStatus:&v24])
      {
        id v16 = *(void **)(a1 + 40);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = __66__WLDPlaybackManager__enqueuePlaybackSummary_sessionID_serialize___block_invoke_3;
        v17[3] = &unk_100045558;
        id v18 = v8;
        id v19 = v7;
        id v20 = *(id *)(a1 + 32);
        id v21 = *(id *)(a1 + 48);
        id v22 = *(id *)(a1 + 56);
        unsigned __int8 v23 = v10;
        [v16 _promptForBundleID:v18 completionHandler:v17];

LABEL_10:
        goto LABEL_11;
      }
      if ((v24 & 0xFFFFFFFFFFFFFFFDLL) == 0)
      {
        NSLog(@"WLDPlaybackManager: User has not granted access (2) for: %@", v8);
        [v7 _cleanupSummary:*(void *)(a1 + 32)];
        goto LABEL_10;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      id v14 = v7;
      uint64_t v15 = 0;
    }
    [v14 _handleReporting:v12 summary:v11 sessionIDKey:v13 isFirstParty:v15];
    goto LABEL_10;
  }
  [WeakRetained _handleReportingError:v5 forSummary:*(void *)(a1 + 32)];
LABEL_11:
}

id __66__WLDPlaybackManager__enqueuePlaybackSummary_sessionID_serialize___block_invoke_3(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    return [v3 _handleReporting:v5 summary:v4 sessionIDKey:v6 isFirstParty:v7];
  }
  else
  {
    NSLog(@"WLDPlaybackManager: User has not granted access (1) for: %@", *(void *)(a1 + 32));
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    return [v9 _cleanupSummary:v10];
  }
}

- (void)_handleReporting:(id)a3 summary:(id)a4 sessionIDKey:(id)a5 isFirstParty:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, self);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = __73__WLDPlaybackManager__handleReporting_summary_sessionIDKey_isFirstParty___block_invoke;
  id v19 = &unk_1000455D0;
  objc_copyWeak(&v22, &location);
  id v13 = v11;
  id v20 = v13;
  id v14 = v12;
  id v21 = v14;
  [v10 reportPlayback:v13 completion:&v16];
  if (!a6 && (objc_msgSend(v13, "isFromActivePlayerPath", v16, v17, v18, v19, v20) & 1) == 0)
  {
    uint64_t v15 = [v13 bundleID];
    +[VSMetricsManagerObjC recordNowPlayingBrokenEventWithBundleID:v15];
  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __73__WLDPlaybackManager__handleReporting_summary_sessionIDKey_isFirstParty___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v6 = WeakRetained;
  if (a2)
  {
    uint64_t v7 = [*(id *)(a1 + 32) shortDescription];
    NSLog(@"WLDPlaybackManager: Successful playback report %@", v7);

    [v6 _catalogSummary:*(void *)(a1 + 32)];
    [v6 _cleanupSummary:*(void *)(a1 + 32)];
    if (![*(id *)(a1 + 32) playbackState])
    {
      NSLog(@"WLDPlaybackManager: Session %@ has PlaybackStateStopped", *(void *)(a1 + 40));
      [v6 _endSession:*(void *)(a1 + 40)];
    }
  }
  else
  {
    [WeakRetained _handleReportingError:v8 forSummary:*(void *)(a1 + 32)];
  }
}

- (void)_handleReportingError:(id)a3 forSummary:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = [v14 domain];
  unsigned __int8 v8 = [v7 isEqualToString:WLKErrorDomain];

  if ((v8 & 1) != 0
    || ([v14 domain],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 isEqualToString:AMSErrorDomain],
        v9,
        v10)
    && (unint64_t)(WLKHTTPStatusCodeForAMSError() - 400) <= 0xC7)
  {
    NSLog(@"WLDPlaybackManager: ErrorHandler: Fatal error. Cleaning up summary: %@", v14);
    [(WLDPlaybackManager *)self _cleanupSummary:v6];
  }
  else
  {
    NSLog(@"WLDPlaybackManager: ErrorHandler: Non-fatal error. Will attempt report again on reachability change and/or app launch. %@", v14);
    id v11 = self;
    objc_sync_enter(v11);
    if (!v11->_pendingReportsTransaction)
    {
      id v12 = (WLKTransactionScope *)[objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDPlaybackManager._handleReportingError"];
      pendingReportsTransaction = v11->_pendingReportsTransaction;
      v11->_pendingReportsTransaction = v12;
    }
    objc_sync_exit(v11);
  }
}

- (BOOL)_offlineValidation:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)LSApplicationRecord);
  uint64_t v5 = WLKTVAppBundleID();
  id v6 = [v4 initWithBundleIdentifier:v5 allowPlaceholder:0 error:0];

  uint64_t v7 = [v6 applicationState];
  unsigned __int8 v8 = [v7 isInstalled];

  if ((v8 & 1) == 0)
  {
    NSLog(@"WLDPlaybackManager: Feature disabled because TV app is not installed.");
    goto LABEL_5;
  }
  id v9 = +[UMUserManager sharedManager];
  unsigned int v10 = [v9 isMultiUser];

  if (!v10)
  {
    id v12 = +[WLKSystemPreferencesStore sharedPreferences];
    if ([v12 privateModeEnabled])
    {
      NSLog(@"WLDPlaybackManager: User has private mode enabled");
      BOOL v11 = 0;
LABEL_21:

      goto LABEL_22;
    }
    id v13 = +[ACAccountStore ams_sharedAccountStore];
    id v14 = objc_msgSend(v13, "ams_activeiTunesAccount");

    if (v3)
    {
      uint64_t v15 = [v3 accountID];
      id v16 = [v15 length];

      if (!v16)
      {
        NSLog(@"WLDPlaybackManager: Error: DSID missing.");
        goto LABEL_19;
      }
      uint64_t v17 = [v3 bundleID];

      if (!v17)
      {
        NSLog(@"WLDPlaybackManager: Error: bundleIdentifier is required.");
        goto LABEL_19;
      }
      id v18 = +[ACAccountStore ams_sharedAccountStore];
      id v19 = [v3 accountIDAsNumber];
      uint64_t v20 = objc_msgSend(v18, "ams_iTunesAccountWithDSID:", v19);

      id v14 = (void *)v20;
    }
    if (v14)
    {
      if (!objc_msgSend(v14, "ams_isManagedAppleID"))
      {
        BOOL v11 = 1;
LABEL_20:

        goto LABEL_21;
      }
      NSLog(@"WLDPlaybackManager: Feature disabled for Managed Apple IDs.");
    }
    else
    {
      NSLog(@"WLDPlaybackManager: An active iTunes account is required to report play activity events.");
    }
LABEL_19:
    BOOL v11 = 0;
    goto LABEL_20;
  }
  NSLog(@"WLDPlaybackManager: Feature disabled in EDU mode.");
LABEL_5:
  BOOL v11 = 0;
LABEL_22:

  return v11;
}

- (void)_onlineValidation:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __51__WLDPlaybackManager__onlineValidation_completion___block_invoke;
  v10[3] = &unk_100045620;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  id v9 = v6;
  [v7 isFullTVAppEnabledWithCompletion:v10];
}

void __51__WLDPlaybackManager__onlineValidation_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    NSLog(@"WLDPlaybackManager: Error fetching Now playing from URL bag.");
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (a2)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __51__WLDPlaybackManager__onlineValidation_completion___block_invoke_2;
    v8[3] = &unk_100045620;
    id v10 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    +[WLKSettingsCloudUtilities synchronizeSettingsFromCloudIfNeededWithCompletion:v8];
  }
  else
  {
    NSLog(@"WLDPlaybackManager: Error: Now playing not enabled in URL bag.");
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = WLKError();
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

void __51__WLDPlaybackManager__onlineValidation_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = +[WLKSettingsStore sharedSettings];
    unsigned __int8 v7 = [v6 optedIn];

    if (v7)
    {
      id v8 = +[WLKChannelUtilities sharedInstanceFiltered];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = __51__WLDPlaybackManager__onlineValidation_completion___block_invoke_3;
      v12[3] = &unk_1000455F8;
      id v15 = *(id *)(a1 + 40);
      id v13 = *(id *)(a1 + 32);
      id v14 = v8;
      id v9 = v8;
      [v9 loadIfNeededWithCompletion:v12];
    }
    else
    {
      NSLog(@"WLDPlaybackManager: User has not opted into feature");
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = WLKError();
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
    }
  }
  else
  {
    NSLog(@"WLDPlaybackManager: Settings sync failed");
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __51__WLDPlaybackManager__onlineValidation_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v12 = a3;
  if ((a2 & 1) == 0)
  {
    NSLog(@"WLDPlaybackManager: Failed to load channel utils");
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_16;
  }
  id v5 = [*(id *)(a1 + 32) bundleID];
  if (![*(id *)(a1 + 40) isItunesOrFirstPartyBundleID:v5])
  {
    uint64_t v6 = [*(id *)(a1 + 32) channelID];
    if (!v6)
    {
      uint64_t v6 = [*(id *)(a1 + 40) channelIDForBundleID:v5];
      if (!v6)
      {
        NSLog(@"WLDPlaybackManager: No channel associated with channel ID: %@. Ignoring report", 0);
        uint64_t v11 = *(void *)(a1 + 48);
        uint64_t v6 = WLKError();
        (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v6);
        goto LABEL_14;
      }
    }
    unsigned __int8 v7 = [*(id *)(a1 + 40) channelForID:v6];
    if ([v7 isWatchListEnabled])
    {
      if ([v7 shouldTrackPlayActivity])
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
      NSLog(@"WLDPlaybackManager: Channel with ID %@ does not have playback tracking enabled. Ignoring report.", v6);
      uint64_t v8 = *(void *)(a1 + 48);
      +[NSString stringWithFormat:@"Channel %@ does not have playback tracking enabled", v6];
    }
    else
    {
      NSLog(@"WLDPlaybackManager: Channel with ID %@ is not watchlist enabled. Ignoring report.", v6);
      uint64_t v8 = *(void *)(a1 + 48);
      +[NSString stringWithFormat:@"Channel %@ is not watchlist enabled", v6];
    id v9 = };
    uint64_t v10 = WLKError();
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v10);

    goto LABEL_13;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_15:

LABEL_16:
}

- (BOOL)_shouldPromptForBundleID:(id)a3 outAccessStatus:(unint64_t *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = +[WLKChannelUtilities sharedInstanceFiltered];
  uint64_t v8 = [v7 channelForBundleID:v6];

  id v9 = [v8 channelID];
  uint64_t v10 = WLKSubscriptionIdentifierForBundleID();
  uint64_t v11 = +[WLKSettingsStore sharedSettings];
  id v12 = [v11 settingsForChannelID:v9 externalID:v10];

  if (a4) {
    *a4 = (unint64_t)[v12 accessStatus];
  }
  if (self->_isPrompting)
  {
    NSLog(@"WLDPlaybackManager: should not prompt because we are already prompting");
LABEL_5:
    BOOL v13 = 0;
    goto LABEL_6;
  }
  if (!v8)
  {
    NSLog(@"WLDPlaybackManager: No channel found for: %@", v6);
    goto LABEL_5;
  }
  if ([v12 accessStatus] == (id)2)
  {
    NSLog(@"WLDPlaybackManager: User has denied access for: %@ %@", v6, v9);
    goto LABEL_5;
  }
  if ([v12 accessStatus] == (id)1)
  {
    NSLog(@"WLDPlaybackManager: User has allowed access for: %@ %@", v6, v9);
    goto LABEL_5;
  }
  id v15 = +[WLKReachabilityMonitor sharedInstance];
  unsigned __int8 v16 = [v15 isNetworkReachable];

  if ((v16 & 1) == 0)
  {
    NSLog(@"WLDPlaybackManager: Will not prompt due to network being unavailable");
    goto LABEL_5;
  }
  uint64_t v17 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v6];
  id v22 = 0;
  id v18 = +[RBSProcessHandle handleForPredicate:v17 error:&v22];
  id v19 = v22;

  if (v18)
  {
    uint64_t v20 = [v18 currentState];
    unsigned int v21 = [v20 taskState];
    BOOL v13 = v21 == 4;
    if (v21 != 4) {
      NSLog(@"WLDPlaybackManager: Will not prompt because application is not foregrounded");
    }
  }
  else
  {
    NSLog(@"WLDPlaybackManager: Could not get process handle %@", v19);
    BOOL v13 = 0;
  }

LABEL_6:
  return v13;
}

- (void)_promptForBundleID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSLog(@"WLDPlaybackManager: promptForBundleID: %@", v6);
  self->_isPrompting = 1;
  uint64_t v8 = objc_alloc_init(WLDRemoteAlertPresenter);
  if ([(WLDRemoteAlertPresenter *)v8 promptForBundleID:v6])
  {
    id v9 = +[WLKSettingsStore sharedSettings];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __59__WLDPlaybackManager__promptForBundleID_completionHandler___block_invoke;
    v11[3] = &unk_100045648;
    id v12 = v6;
    id v13 = v9;
    id v14 = self;
    id v15 = v7;
    id v10 = v9;
    [v10 refreshWithCompletion:v11];
  }
  else
  {
    self->_isPrompting = 0;
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __59__WLDPlaybackManager__promptForBundleID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[WLKChannelUtilities sharedInstanceFiltered];
  id v5 = [v2 channelIDForBundleID:*(void *)(a1 + 32)];

  id v3 = WLKSubscriptionIdentifierForBundleID();
  id v4 = [*(id *)(a1 + 40) settingsForChannelID:v5 externalID:v3];
  NSLog(@"WLDPlaybackManager: Settings recall after prompting for bundle:%@ externalID:%@, settings%@, channelID:%@", *(void *)(a1 + 32), v3, v4, v5);
  *(unsigned char *)(*(void *)(a1 + 48) + 48) = 0;
  (*(void (**)(void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), [v4 accessStatus] == (id)1);
}

BOOL __44__WLDPlaybackManager__scanForPendingReports__block_invoke(id a1, NSURL *a2, NSError *a3)
{
  if (a3) {
    NSLog(@"WLDPlaybackManager: [Error] scanning for pending reports %@ (%@)", a3, a2);
  }
  return a3 == 0;
}

void __44__WLDPlaybackManager__scanForPendingReports__block_invoke_2(uint64_t a1)
{
  id obj = objc_loadWeakRetained((id *)(a1 + 40));
  objc_sync_enter(obj);
  NSLog(@"WLDPlaybackManager: Releasing pending reports transaction.");
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  if (v3)
  {
    *(void *)(v2 + 40) = 0;
  }
  objc_sync_exit(obj);
}

- (void)_networkReachabilityChanged:(id)a3
{
  id v4 = +[WLKReachabilityMonitor sharedInstance];
  unsigned int v5 = [v4 isNetworkReachable];

  NSLog(@"WLDPlaybackManager: Network reachability changed. Network is reachable:%d", v5);
  if (v5)
  {
    [(WLDPlaybackManager *)self _enqueuePendingReports];
    +[WLKUpNextWidgetCacheManager requestInvalidation];
    +[WLKUpNextWidgetCacheManager requestReload];
  }
}

- (BOOL)_serialize:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(WLDPlaybackManager *)self _queuePathForSummary:v4];
  id v6 = [v5 stringByDeletingLastPathComponent];
  id v7 = +[NSFileManager defaultManager];
  unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {
    id v9 = 0;
    goto LABEL_4;
  }
  id v10 = +[NSFileManager defaultManager];
  id v25 = 0;
  unsigned int v11 = [v10 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v25];
  id v9 = v25;

  if (v11)
  {
LABEL_4:
    id v12 = +[NSFileManager defaultManager];
    unsigned int v13 = [v12 fileExistsAtPath:v5];

    if (v13)
    {
      id v14 = +[NSData dataWithContentsOfFile:v5];
      id v24 = 0;
      id v15 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v14 error:&v24];
      id v16 = v24;
      uint64_t v17 = v16;
      if (v16)
      {
        NSLog(@"WLDPlaybackManager: _serialize: secure unarchiver error: %@", v16);
      }
      else
      {
        id v19 = [v15 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
        unsigned __int8 v20 = [v4 isEqualToSummary:v19];

        if (v20)
        {
          unsigned __int8 v18 = 1;
          id v21 = v9;
          goto LABEL_13;
        }
      }
    }
    id v23 = v9;
    id v14 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v23];
    id v21 = v23;

    if (!v14)
    {
      unsigned __int8 v18 = 0;
      goto LABEL_15;
    }
    id v15 = [(WLDPlaybackManager *)self _queuePathForSummary:v4];
    unsigned __int8 v18 = [v14 writeToFile:v15 atomically:1];
LABEL_13:

LABEL_15:
    id v9 = v21;
    goto LABEL_16;
  }
  unsigned __int8 v18 = 0;
LABEL_16:

  return v18;
}

- (void)_cleanupSummary:(id)a3
{
  id v4 = [(WLDPlaybackManager *)self _queuePathForSummary:a3];
  id v3 = +[NSFileManager defaultManager];
  [v3 removeItemAtPath:v4 error:0];
}

BOOL __53__WLDPlaybackManager__isDirectoryPresentAndNonEmpty___block_invoke(id a1, NSURL *a2, NSError *a3)
{
  if (a3) {
    NSLog(@"WLDPlaybackManager: [Error] enumerating for pending reports %@ (%@)", a3, a2);
  }
  return a3 == 0;
}

- (id)_queuePathForSummary:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(WLDPlaybackManager *)self _queueDir];
  id v6 = [v4 accountID];
  id v7 = [v5 stringByAppendingPathComponent:v6];

  unsigned __int8 v8 = [v4 bundleID];
  id v9 = [v4 contentID];

  id v10 = +[NSString stringWithFormat:@"%@-%@", v8, v9];

  unsigned int v11 = +[NSMutableString stringWithString:v10];
  id v12 = [v11 length];
  objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", @"/", @"_", 0, 0, v12);
  objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", @":", @"_", 0, 0, v12);
  id v13 = [v11 copy];
  if ((unint64_t)v12 >= 0x100)
  {
    uint64_t v14 = objc_msgSend(v11, "substringWithRange:", 0, 255);

    id v13 = (id)v14;
  }
  id v15 = [v7 stringByAppendingPathComponent:v13];

  return v15;
}

- (void)_catalogSummary:(id)a3
{
  id v3 = [a3 sanitizedCopy];
  id v9 = 0;
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v9];
  id v5 = v9;

  if (v4)
  {
    uint64_t v10 = WLKDidReportPlaybackDistributedNotificationUserInfoDataKey;
    id v6 = [v4 base64EncodedStringWithOptions:0];
    unsigned int v11 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

    unsigned __int8 v8 = +[NSDistributedNotificationCenter defaultCenter];
    [v8 postNotificationName:WLKDidReportPlaybackDistributedNotification object:0 userInfo:v7];
  }
  else
  {
    NSLog(@"WLDPlaybackManager: Error serializing summary for notification: %@", v5);
  }
  +[WLKUpNextWidgetCacheManager requestInvalidation];
}

- (BOOL)_isDirectPlaybackReportingDisabled
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL disableDirectPlaybackReporting = v2->_disableDirectPlaybackReporting;
  objc_sync_exit(v2);

  return disableDirectPlaybackReporting;
}

- (NSMutableDictionary)lastSummaryDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastSummaryDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSummaryDictionary, 0);
  objc_storeStrong((id *)&self->_directPlayClientList, 0);
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_pendingReportsTransaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_directPlayObserver, 0);
  objc_storeStrong((id *)&self->_nowPlayingObserver, 0);

  objc_storeStrong((id *)&self->_reporterDictionary, 0);
}

@end