@interface MTSyncController
+ (BOOL)hasAccountChangedSinceLastSync;
+ (BOOL)isUserLoggedIn;
+ (id)accountIdentifierForLastSync;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)playlistSyncVersion;
+ (id)sharedInstance;
+ (int64_t)syncFlagsForSyncType:(int64_t)a3;
+ (void)didUpdateSubscriptionsSyncVersionForSyncType:(int64_t)a3;
+ (void)resetAccountIdentifierForLastSync;
+ (void)resetAllSubscriptionSyncVersion;
+ (void)resetMetadataToInitialState;
+ (void)resetPlaylistSyncVersion;
+ (void)setAccountIdentifierForLastSync:(id)a3;
+ (void)setPlaylistSyncVersion:(id)a3;
- (AMSPromise)UPPEnabled;
- (BOOL)canScheduleSyncRequest;
- (BOOL)checkViabilityOfSyncLibraryAndUPP;
- (BOOL)hasAccountChangedSinceLastSync;
- (BOOL)hasInterestSyncVersion;
- (BOOL)hasPlaylistSyncVersion;
- (BOOL)hasPodcastSyncV3Version;
- (BOOL)hasPodcastSyncVersion;
- (BOOL)isRunning;
- (BOOL)isSyncing;
- (BOOL)isUserLoggedIn;
- (BOOL)keyValueStoreController:(id)a3 transaction:(id)a4 didFailWithError:(id)a5;
- (BOOL)resetToInitialStateForced:(BOOL)a3;
- (BOOL)resetToInitialStateForced:(BOOL)a3 completion:(id)a4;
- (BOOL)resetToInitialStateIfIncomplete;
- (BOOL)resetToInitialStateIfNeeded;
- (BOOL)resettingToInitialState;
- (BOOL)resyncWhenDone;
- (BOOL)uppSyncDirtyFlag;
- (MTEpisodeSyncStorage)episodeSyncStorage;
- (MTKeyProcessorPairProvider)keyProcessorPairProvider;
- (MTSyncController)init;
- (MTUniversalPlaybackPositionDataSource)uppDataSource;
- (MZKeyValueStoreController)cloudSyncController;
- (MZUniversalPlaybackPositionStore)UPPStore;
- (NSMutableArray)episodeObservers;
- (NSOperationQueue)queue;
- (NSString)playlistSyncVersion;
- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter;
- (id)addEpisodeObserverUsingBlock:(id)a3;
- (id)expandFeedUrls:(id)a3;
- (id)operationInQueueWithType:(int64_t)a3;
- (int64_t)syncVersionFlags;
- (int64_t)timedOperationTypeForBookmarksSyncType:(int64_t)a3;
- (int64_t)timedOperationTypeForSyncType:(int64_t)a3;
- (unint64_t)backgroundTask;
- (void)_finaliseResetToInitial:(id)a3;
- (void)_setupUPP;
- (void)_synchronousResetToInitialStateDatabase;
- (void)_synchronousResetToInitialStateMetadata;
- (void)addOperation:(id)a3;
- (void)applicationDidEnterBackground;
- (void)dealloc;
- (void)enableAssetDeletionIfPossible;
- (void)enableAssetDeletionIfPossible:(unint64_t)a3;
- (void)endBackgroundTask;
- (void)keyValueStoreController:(id)a3 transaction:(id)a4 didCancelWithError:(id)a5;
- (void)keyValueStoreController:(id)a3 transactionDidFinish:(id)a4;
- (void)operationFinished:(id)a3;
- (void)performUniversalPlaybackPositionSync;
- (void)reachabilityChangedFrom:(BOOL)a3 to:(BOOL)a4;
- (void)removeEpisodeObserver:(id)a3;
- (void)scheduleEpisodeStateGetWithFeedUrls:(id)a3;
- (void)scheduleEpisodeStateGetWithFeedUrls:(id)a3 priority:(int64_t)a4;
- (void)scheduleEpisodeStatePutWithFeedUrls:(id)a3;
- (void)scheduleVeryHighPriorityEpisodeStateGetWithFeedUrls:(id)a3;
- (void)setBackgroundTask:(unint64_t)a3;
- (void)setCloudSyncBugReporter:(id)a3;
- (void)setCloudSyncController:(id)a3;
- (void)setEpisodeObservers:(id)a3;
- (void)setEpisodeSyncStorage:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setKeyProcessorPairProvider:(id)a3;
- (void)setPlaylistSyncVersion:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResettingToInitialState:(BOOL)a3;
- (void)setResyncWhenDone:(BOOL)a3;
- (void)setSyncVersionFlags:(int64_t)a3;
- (void)setUPPStore:(id)a3;
- (void)setUppDataSource:(id)a3;
- (void)setUppSyncDirtyFlag:(BOOL)a3;
- (void)start;
- (void)startBackgroundTask;
- (void)startUPPSyncTimerAfterPrivacy;
- (void)syncAllBookkeeperKeys;
- (void)syncCoreKeysIfDirty;
- (void)syncCriticalBookkeeperKeysShouldSyncCleanKeys:(BOOL)a3;
- (void)syncEverything;
- (void)syncMultipleKeysAndProcessors:(id)a3 shouldSyncCleanKeys:(BOOL)a4;
- (void)syncNonFollowedShows;
- (void)syncNonFollowedShowsIfSyncDirty;
- (void)syncSubscriptions;
- (void)syncTermsVersion;
- (void)updateAccountForLastSync;
@end

@implementation MTSyncController

- (void)setIsRunning:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_isRunning = a3;
  objc_sync_exit(obj);
}

- (id)addEpisodeObserverUsingBlock:(id)a3
{
  v4 = +[MTSyncedEpisodeObserver observerWithBlock:a3];
  [(NSMutableArray *)self->_episodeObservers addObject:v4];
  v5 = [(MTSyncController *)self uppDataSource];
  [v5 addEpisodeObserver:v4];

  return v4;
}

- (BOOL)resetToInitialStateIfIncomplete
{
  v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v4 = [v3 objectForKey:@"kMTSyncControllerResettingToInitialState"];
  v5 = (void *)v4;
  v6 = &__kCFBooleanFalse;
  if (v4) {
    v6 = (void *)v4;
  }
  id v7 = v6;

  unsigned int v8 = [v7 BOOLValue];
  if (!v8) {
    return 0;
  }
  v9 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Reset to initial state was incomplete. Will retry.", v11, 2u);
  }

  return [(MTSyncController *)self resetToInitialStateForced:1];
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009974;
  block[3] = &unk_10054D910;
  block[4] = a1;
  if (qword_10060A858 != -1) {
    dispatch_once(&qword_10060A858, block);
  }
  v2 = (void *)qword_10060A850;

  return v2;
}

- (void)performUniversalPlaybackPositionSync
{
  if (![(MTSyncController *)self checkViabilityOfSyncLibraryAndUPP])
  {
    v3 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v4 = "Cannot sync library and UPP. Skipping UPP sync.";
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  if (+[PFClientUtil isRunningOnHomepod])
  {
    v3 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v4 = "Not doing UPP Sync on HomePod.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  *(void *)buf = 0;
  v13 = buf;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v5 = +[UIApplication sharedApplication];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FA7A4;
  v11[3] = &unk_10054D8A0;
  v11[4] = buf;
  id v6 = [v5 beginBackgroundTaskWithName:@"MTSyncController.UPPEnabled" expirationHandler:v11];

  *((void *)v13 + 3) = v6;
  objc_initWeak(&location, self);
  id v7 = [(MTSyncController *)self UPPEnabled];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FA804;
  v8[3] = &unk_100551570;
  objc_copyWeak(&v9, &location);
  v8[4] = buf;
  [v7 addFinishBlock:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

- (void)_setupUPP
{
  v3 = [(MTSyncController *)self UPPStore];
  [v3 setDataSource:0];

  uint64_t v4 = objc_alloc_init(MZUniversalPlaybackPositionStore);
  [(MTSyncController *)self setUPPStore:v4];

  v5 = objc_alloc_init(MTUniversalPlaybackPositionDataSource);
  [(MTSyncController *)self setUppDataSource:v5];

  id v6 = [(MTSyncController *)self UPPStore];
  id v7 = [(MTSyncController *)self uppDataSource];
  [v6 setDataSource:v7];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned int v8 = [(MTSyncController *)self episodeObservers];
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v12);
        uint64_t v14 = [(MTSyncController *)self uppDataSource];
        [v14 addEpisodeObserver:v13];

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (MTUniversalPlaybackPositionDataSource)uppDataSource
{
  return self->_uppDataSource;
}

- (MZUniversalPlaybackPositionStore)UPPStore
{
  return self->_UPPStore;
}

- (MZKeyValueStoreController)cloudSyncController
{
  return self->_cloudSyncController;
}

- (void)start
{
  if (!sub_1000594C8())
  {
    v3 = +[IMURLBag sharedInstance];
    uint64_t v4 = self->_syncQueue;
    if ([(MTSyncController *)self isRunning])
    {
      v5 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v6 = "MTSyncController start called, but the controller is already running.";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      }
    }
    else
    {
      id v7 = +[MTReachability sharedInstance];
      [v7 addObserver:self];

      unsigned int v8 = +[MTReachability sharedInstance];
      unsigned __int8 v9 = [v8 isReachable];

      v5 = _MTLogCategoryCloudSync();
      BOOL v10 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v10)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MTSyncController start is requesting bag keys", buf, 2u);
        }

        uint64_t v11 = [v3 URLForKey:kMTSyncGetAll];
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100018440;
        v12[3] = &unk_100551528;
        uint64_t v13 = v3;
        uint64_t v14 = v4;
        long long v15 = self;
        [v11 asyncValueOnQueue:v14 withCompletion:v12];

        v5 = v13;
        goto LABEL_12;
      }
      if (v10)
      {
        *(_WORD *)buf = 0;
        id v6 = "Cannot start sync controller - Network is not reachable";
        goto LABEL_11;
      }
    }
LABEL_12:
  }
}

- (MTSyncController)init
{
  v21.receiver = self;
  v21.super_class = (Class)MTSyncController;
  v2 = [(MTSyncController *)&v21 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MTSyncController.syncQueue", 0);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_opt_new();
    queue = v2->_queue;
    v2->_queue = (NSOperationQueue *)v5;

    uint64_t v7 = +[NSMutableArray array];
    episodeObservers = v2->_episodeObservers;
    v2->_episodeObservers = (NSMutableArray *)v7;

    unsigned __int8 v9 = objc_alloc_init(_TtC8Podcasts20CloudSyncBugReporter);
    cloudSyncBugReporter = v2->_cloudSyncBugReporter;
    v2->_cloudSyncBugReporter = (_TtP8Podcasts21CloudSyncBugReporting_ *)v9;

    uint64_t v11 = [[MTKeyProcessorPairProvider alloc] initWithCloudSyncBugReporter:v2->_cloudSyncBugReporter];
    keyProcessorPairProvider = v2->_keyProcessorPairProvider;
    v2->_keyProcessorPairProvider = v11;

    [(NSOperationQueue *)v2->_queue setMaxConcurrentOperationCount:1];
    v2->_lastOperation = 0.0;
    uint64_t v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"operationFinished:" name:@"MTTimedOperationFinished" object:0];

    uint64_t v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"syncCoreKeysIfDirty" name:@"MTFeedUpdateDidEndUpdatingAllFeeds" object:0];

    uint64_t v15 = objc_opt_new();
    episodeSyncStorage = v2->_episodeSyncStorage;
    v2->_episodeSyncStorage = (MTEpisodeSyncStorage *)v15;

    unint64_t v17 = (unint64_t)[(id)objc_opt_class() syncFlagsForSyncType:0];
    v2->_syncVersionFlags = (unint64_t)[(id)objc_opt_class() syncFlagsForSyncType:1] | v17;
    id v18 = +[MTAppShortcutManager sharedInstance];
    [(MTSyncController *)v2 resetToInitialStateIfIncomplete];
    v19 = v2;
  }

  return v2;
}

+ (int64_t)syncFlagsForSyncType:(int64_t)a3
{
  uint64_t v4 = +[SyncKeysRepository shared];
  uint64_t v5 = [v4 subscriptionsSyncVersionFor:a3];

  if (v5) {
    int64_t v6 = 1 << a3;
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)syncEverything
{
  [(MTSyncController *)self syncAllBookkeeperKeys];

  [(MTSyncController *)self performUniversalPlaybackPositionSync];
}

- (void)syncAllBookkeeperKeys
{
  if ([(MTSyncController *)self canScheduleSyncRequest])
  {
    dispatch_queue_t v3 = [(MTSyncController *)self keyProcessorPairProvider];
    id v4 = [v3 keysAndProcessorsForAllBookkeeperKeys];

    [(MTSyncController *)self syncMultipleKeysAndProcessors:v4 shouldSyncCleanKeys:1];
  }
  else
  {
    [(MTSyncController *)self resetToInitialStateForced:0];
  }
}

- (BOOL)checkViabilityOfSyncLibraryAndUPP
{
  if ([(MTSyncController *)self canScheduleSyncRequest])
  {
    dispatch_queue_t v3 = +[SyncKeysRepository shared];
    unsigned __int8 v4 = [v3 isLibrarySyncEnabled];

    return v4;
  }
  else
  {
    [(MTSyncController *)self resetToInitialStateIfNeeded];
    return 0;
  }
}

- (BOOL)resetToInitialStateIfNeeded
{
  return [(MTSyncController *)self resetToInitialStateForced:0];
}

- (BOOL)resetToInitialStateForced:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!+[MTApplication localLibraryUpdatesDisabled])
  {
    unsigned __int8 v9 = self;
    objc_sync_enter(v9);
    if ([(MTSyncController *)v9 resettingToInitialState])
    {
      BOOL v10 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v11 = "Reset to initial state in progress";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      }
    }
    else if ([(MTSyncController *)v9 isRunning] || v4)
    {
      v12 = +[MTAccountController sharedInstance];
      char v13 = [v12 hasFetchedInitialAccount] | v4;

      if (v13)
      {
        if (![(MTSyncController *)v9 hasPodcastSyncVersion]
          && ![(MTSyncController *)v9 hasPodcastSyncV3Version])
        {
          uint64_t v14 = +[MTPrivacyUtil cloudSyncVersion];
          if (v14 || [(MTSyncController *)v9 hasPlaylistSyncVersion])
          {
          }
          else if (!+[MTBookmarksSyncStorage hasBookmarksSync])
          {
            v19 = +[MTSyncController accountIdentifierForLastSync];

            if (!v19)
            {
              BOOL v10 = _MTLogCategoryCloudSync();
              if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_27;
              }
              *(_WORD *)buf = 0;
              uint64_t v11 = "Already in Initial State";
              goto LABEL_26;
            }
          }
        }
        if ([(MTSyncController *)v9 isUserLoggedIn]
          && ![(MTSyncController *)v9 hasAccountChangedSinceLastSync]
          && !v4)
        {
          BOOL v10 = _MTLogCategoryCloudSync();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          *(_WORD *)buf = 0;
          uint64_t v11 = "Already in Initial State, account didn't change";
          goto LABEL_26;
        }
        if (!+[MTPrivacyUtil privacyAcknowledgementNeeded])
        {
          [(MTSyncController *)v9 setResettingToInitialState:1];
          long long v16 = _MTLogCategoryCloudSync();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Reset to Initial State - Started", buf, 2u);
          }

          unint64_t v17 = [(MTSyncController *)v9 cloudSyncController];
          [v17 cancelAllTransactions];

          [(NSOperationQueue *)v9->_queue cancelAllOperations];
          id v18 = objc_opt_new();
          [v18 setOperationType:10];
          [v18 setStartDelay:0.0];
          v20 = _NSConcreteStackBlock;
          uint64_t v21 = 3221225472;
          v22 = sub_1000FC544;
          v23 = &unk_10054D738;
          v24 = v9;
          id v25 = v6;
          [v18 setMainBlock:&v20];
          -[MTSyncController addOperation:](v9, "addOperation:", v18, v20, v21, v22, v23, v24);

          BOOL v8 = 1;
          goto LABEL_31;
        }
        BOOL v10 = _MTLogCategoryCloudSync();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v11 = "No reset - missing privacy ACK";
          goto LABEL_26;
        }
      }
      else
      {
        BOOL v10 = _MTLogCategoryCloudSync();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v11 = "Can't reset because the account isn't available yet";
          goto LABEL_26;
        }
      }
    }
    else
    {
      BOOL v10 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v11 = "Shouldn't reset because the sync controller didn't complete starting yet.";
        goto LABEL_26;
      }
    }
LABEL_27:

    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
    BOOL v8 = 0;
LABEL_31:
    objc_sync_exit(v9);

    goto LABEL_32;
  }
  uint64_t v7 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DEMO MODE Trying to reset to initial state. We say no", buf, 2u);
  }

  if (v6) {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
  BOOL v8 = 0;
LABEL_32:

  return v8;
}

- (BOOL)resettingToInitialState
{
  return self->_resettingToInitialState;
}

- (BOOL)hasPodcastSyncVersion
{
  v2 = +[SyncKeysRepository shared];
  dispatch_queue_t v3 = [v2 subscriptionsSyncVersionFor:0];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasPodcastSyncV3Version
{
  v2 = +[SyncKeysRepository shared];
  dispatch_queue_t v3 = [v2 subscriptionsSyncVersionFor:1];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasPlaylistSyncVersion
{
  v2 = [(MTSyncController *)self playlistSyncVersion];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)playlistSyncVersion
{
  v2 = objc_opt_class();

  return (NSString *)[v2 playlistSyncVersion];
}

+ (id)playlistSyncVersion
{
  v2 = +[NSUserDefaults standardUserDefaults];
  BOOL v3 = [v2 stringForKey:kMTPlaylistsKey];

  return v3;
}

+ (id)accountIdentifierForLastSync
{
  v2 = +[NSUserDefaults standardUserDefaults];
  BOOL v3 = [v2 stringForKey:@"SSAccountIdentifier"];

  return v3;
}

- (BOOL)canScheduleSyncRequest
{
  if ([(MTSyncController *)self isRunning])
  {
    BOOL v3 = +[MTReachability sharedInstance];
    unsigned __int8 v4 = [v3 isReachable];

    if (v4)
    {
      if ([(MTSyncController *)self isUserLoggedIn])
      {
        if (+[MTPrivacyUtil privacyAcknowledgementNeeded])
        {
          uint64_t v5 = _MTLogCategoryCloudSync();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v11 = 0;
            id v6 = "Cannot schedule sync request - Need privacy acknoweldgement";
            uint64_t v7 = (uint8_t *)&v11;
LABEL_13:
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
          }
        }
        else
        {
          if ([(MTSyncController *)self hasAccountChangedSinceLastSync])
          {
            uint64_t v5 = _MTLogCategoryCloudSync();
            if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_14;
            }
            __int16 v10 = 0;
            id v6 = "Cannot schedule sync request - Account has changed since last sync";
            uint64_t v7 = (uint8_t *)&v10;
            goto LABEL_13;
          }
          if (![(MTSyncController *)self resettingToInitialState]) {
            return !sub_1000594C8();
          }
          uint64_t v5 = _MTLogCategoryCloudSync();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v9 = 0;
            id v6 = "Cannot schedule sync request - We are in the process of resetting to initial state";
            uint64_t v7 = (uint8_t *)&v9;
            goto LABEL_13;
          }
        }
      }
      else
      {
        uint64_t v5 = _MTLogCategoryCloudSync();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v6 = "Cannot schedule sync request - User is not logged in";
          uint64_t v7 = buf;
          goto LABEL_13;
        }
      }
    }
    else
    {
      uint64_t v5 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        id v6 = "Cannot schedule sync request - Network is not reachable";
        uint64_t v7 = (uint8_t *)&v13;
        goto LABEL_13;
      }
    }
  }
  else
  {
    uint64_t v5 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      id v6 = "Cannot schedule sync request - Sync controller should be started before syncing.";
      uint64_t v7 = (uint8_t *)&v14;
      goto LABEL_13;
    }
  }
LABEL_14:

  return 0;
}

- (BOOL)isRunning
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isRunning = v2->_isRunning;
  objc_sync_exit(v2);

  return isRunning;
}

- (BOOL)isUserLoggedIn
{
  v2 = objc_opt_class();

  return [v2 isUserLoggedIn];
}

+ (BOOL)isUserLoggedIn
{
  v2 = +[MTAccountController sharedInstance];
  BOOL v3 = [v2 activeAccount];

  unsigned __int8 v4 = +[MTAccountController sharedInstance];
  unsigned __int8 v5 = [v4 isUserLoggedIn];

  return v5;
}

- (BOOL)resetToInitialStateForced:(BOOL)a3
{
  return [(MTSyncController *)self resetToInitialStateForced:a3 completion:0];
}

- (void)setUppDataSource:(id)a3
{
}

- (void)setUPPStore:(id)a3
{
}

- (void)setCloudSyncController:(id)a3
{
}

- (void)reachabilityChangedFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a4 && !a3)
  {
    if ([(MTSyncController *)self isRunning])
    {
      [(MTSyncController *)self syncCriticalBookkeeperKeysShouldSyncCleanKeys:1];
    }
    else
    {
      [(MTSyncController *)self start];
    }
  }
}

- (NSMutableArray)episodeObservers
{
  return self->_episodeObservers;
}

- (void)endBackgroundTask
{
  if ([(MTSyncController *)self backgroundTask] != UIBackgroundTaskInvalid)
  {
    BOOL v3 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned __int8 v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "*** Ending background task", v5, 2u);
    }

    unsigned __int8 v4 = +[UIApplication sharedApplication];
    [v4 endBackgroundTask:[self backgroundTask]];

    [(MTSyncController *)self setBackgroundTask:UIBackgroundTaskInvalid];
  }
}

- (unint64_t)backgroundTask
{
  return self->_backgroundTask;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)removeEpisodeObserver:(id)a3
{
  episodeObservers = self->_episodeObservers;
  id v5 = a3;
  [(NSMutableArray *)episodeObservers removeObject:v5];
  id v6 = [(MTSyncController *)self uppDataSource];
  [v6 removeEpisodeObserver:v5];
}

- (void)startUPPSyncTimerAfterPrivacy
{
  id v2 = [(MTSyncController *)self UPPStore];
  [v2 startUPPSyncTimer];
}

- (void)operationFinished:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSOperationQueue *)self->_queue operationCount];
  id v6 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134217984;
    v20[0] = v5 - 1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "MTSyncController operation completed: Count is %lld", (uint8_t *)&v19, 0xCu);
  }

  if ([(id)objc_opt_class() isUserLoggedIn])
  {
    uint64_t v7 = +[MTPushNotificationController sharedInstance];
    [v7 registerPushNotifications];
  }
  BOOL v8 = self;
  objc_sync_enter(v8);
  unsigned int v9 = [(MTSyncController *)v8 resettingToInitialState];
  objc_sync_exit(v8);

  __int16 v10 = [v4 userInfo];
  __int16 v11 = [v10 objectForKey:@"MTTimedOperationIsCancelledKey"];
  unsigned int v12 = [v11 BOOLValue];

  if ((v9 | v12))
  {
    __int16 v13 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 67109376;
      LODWORD(v20[0]) = v9;
      WORD2(v20[0]) = 1024;
      *(_DWORD *)((char *)v20 + 6) = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Didn't updateAccountForLastSync because resettingToInitialState = %d or operationIsCancelled = %d", (uint8_t *)&v19, 0xEu);
    }
  }
  else
  {
    [(MTSyncController *)v8 updateAccountForLastSync];
  }
  if ((id)[(NSOperationQueue *)self->_queue operationCount] == (id)1)
  {
    __int16 v14 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sync Operations Completed", (uint8_t *)&v19, 2u);
    }

    [(MTSyncController *)v8 enableAssetDeletionIfPossible:1];
    [(MTSyncController *)v8 endBackgroundTask];
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100551548);
    uint64_t v15 = v8;
    objc_sync_enter(v15);
    if ([(MTSyncController *)v15 resyncWhenDone])
    {
      long long v16 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Syncing Content for New Account (previous sync completed)", (uint8_t *)&v19, 2u);
      }

      [(MTSyncController *)v15 syncEverything];
      [(MTSyncController *)v15 setResyncWhenDone:0];
    }
    objc_sync_exit(v15);
  }
  unint64_t v17 = +[NSDate date];
  [v17 timeIntervalSince1970];
  v8->_lastOperation = v18;
}

- (void)applicationDidEnterBackground
{
  if ([(NSOperationQueue *)self->_queue operationCount])
  {
    BOOL v3 = +[PodcastsApplicationStateMonitor shared];
    unsigned int v4 = [v3 isActive];

    if (v4)
    {
      [(MTSyncController *)self startBackgroundTask];
    }
  }
}

- (void)startBackgroundTask
{
  id v2 = self;
  objc_sync_enter(v2);
  [(MTSyncController *)v2 endBackgroundTask];
  objc_initWeak(&location, v2);
  BOOL v3 = +[UIApplication sharedApplication];
  unsigned int v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  __int16 v11 = sub_1000FA044;
  unsigned int v12 = &unk_10054E8E0;
  objc_copyWeak(&v13, &location);
  id v4 = [v3 beginBackgroundTaskWithName:@"MTSyncController" expirationHandler:&v9];
  -[MTSyncController setBackgroundTask:](v2, "setBackgroundTask:", v4, v9, v10, v11, v12);

  unint64_t v5 = [(MTSyncController *)v2 backgroundTask];
  +[PodcastsApplicationStateMonitor remainingBackgroundTime];
  uint64_t v7 = v6;
  BOOL v8 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v16 = v5;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "*** Start background task with id=%lu timeout=%f", buf, 0x16u);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  objc_sync_exit(v2);
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = -[MTSyncController operationInQueueWithType:](v5, "operationInQueueWithType:", [v4 operationType]);
  if (!v6
    || [v4 operationType] == (id)6
    || [v4 operationType] == (id)7
    || [v4 operationType] == (id)12)
  {
    uint64_t v7 = +[PodcastsApplicationStateMonitor shared];
    if ([v7 isActive])
    {
      id v8 = [(MTSyncController *)v5 backgroundTask];

      if (v8 == (id)UIBackgroundTaskInvalid) {
        [(MTSyncController *)v5 startBackgroundTask];
      }
    }
    else
    {
    }
    if ([v4 requiresStartDelayToAvoidClampErrors])
    {
      unsigned int v9 = +[NSDate date];
      [v9 timeIntervalSince1970];
      double v11 = v10;

      double lastOperation = v5->_lastOperation;
      if (lastOperation != 0.0)
      {
        id v13 = _MTLogCategoryCloudSync();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          double v14 = v11 - v5->_lastOperation;
          int v25 = 134217984;
          double v26 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Time since last operation %f", (uint8_t *)&v25, 0xCu);
        }

        double lastOperation = v5->_lastOperation;
      }
      if ((lastOperation == 0.0 || v11 - lastOperation >= 6.0)
        && ![(NSOperationQueue *)v5->_queue operationCount])
      {
        double v15 = 0.5;
      }
      else
      {
        double v15 = 6.0;
      }
      [v4 setStartDelay:v15];
    }
    [(NSOperationQueue *)v5->_queue addOperation:v4];
    unint64_t v16 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v4 operationType];
      [v4 startDelay];
      uint64_t v19 = v18;
      NSUInteger v20 = [(NSOperationQueue *)v5->_queue operationCount];
      int v25 = 134218754;
      double v26 = *(double *)&v17;
      __int16 v27 = 2048;
      *(void *)v28 = v19;
      *(_WORD *)&v28[8] = 2048;
      NSUInteger v29 = v20;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Add operation with type: %ld with a timeout of %f. Total operation count is %li op=%@", (uint8_t *)&v25, 0x2Au);
    }
  }
  else
  {
    uint64_t v21 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 134218496;
      double v26 = COERCE_DOUBLE([v6 operationType]);
      __int16 v27 = 1024;
      *(_DWORD *)v28 = [v6 isExecuting];
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = [v6 isFinished];
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Dropping operation with type %ld as it's in the queue. isExecuting = %d, isFinished = %d", (uint8_t *)&v25, 0x18u);
    }

    v22 = [(MTSyncController *)v5 queue];
    v23 = [v22 operations];
    unint64_t v16 = [v23 firstObject];

    if (([v16 isFinished] & 1) == 0
      && [v16 isCancelled]
      && ([v16 isExecuting] & 1) == 0)
    {
      v24 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Sync is probably stalled :(", (uint8_t *)&v25, 2u);
      }
    }
  }

  objc_sync_exit(v5);
}

- (void)setResettingToInitialState:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  obj->_resettingToInitialState = v3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  unint64_t v5 = +[NSNumber numberWithBool:v3];
  [v4 setObject:v5 forKey:@"kMTSyncControllerResettingToInitialState"];

  objc_sync_exit(obj);
}

- (BOOL)isSyncing
{
  return [(NSOperationQueue *)self->_queue operationCount] != 0;
}

- (id)operationInQueueWithType:(int64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSOperationQueue *)self->_queue operations];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 operationType] == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)dealloc
{
  BOOL v3 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "<%p>", buf, 0xCu);
  }

  id v4 = [(MTSyncController *)self UPPStore];
  [v4 setDataSource:0];

  id v5 = +[MTReachability sharedInstance];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)MTSyncController;
  [(MTSyncController *)&v6 dealloc];
}

- (int64_t)timedOperationTypeForSyncType:(int64_t)a3
{
  if (a3 == 1) {
    return 13;
  }
  else {
    return 1;
  }
}

- (int64_t)timedOperationTypeForBookmarksSyncType:(int64_t)a3
{
  if (a3 == 1) {
    return 14;
  }
  else {
    return 11;
  }
}

- (AMSPromise)UPPEnabled
{
  UPPEnabled = self->_UPPEnabled;
  if (!UPPEnabled)
  {
    id v4 = +[IMURLBag sharedInstance];
    id v5 = [v4 stringForKey:kMTUPPDisabled];
    dispatch_queue_t v6 = dispatch_queue_create("UPPEnabled", 0);
    uint64_t v7 = [v5 asyncValuePromiseOnQueue:v6];
    id v8 = [v7 thenWithBlock:&stru_1005515B0];
    unsigned int v9 = self->_UPPEnabled;
    self->_UPPEnabled = v8;

    UPPEnabled = self->_UPPEnabled;
  }
  id v10 = UPPEnabled;

  return v10;
}

- (void)syncCoreKeysIfDirty
{
  if ([(MTSyncController *)self checkViabilityOfSyncLibraryAndUPP])
  {
    BOOL v3 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FACA4;
    block[3] = &unk_10054D570;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

- (void)syncSubscriptions
{
  if ([(MTSyncController *)self checkViabilityOfSyncLibraryAndUPP])
  {
    BOOL v3 = [(MTSyncController *)self keyProcessorPairProvider];
    id v4 = [v3 keysAndProcessorsForSubscriptionsAndStationsSync];

    [(MTSyncController *)self syncMultipleKeysAndProcessors:v4 shouldSyncCleanKeys:1];
  }
}

- (void)syncTermsVersion
{
  if ([(MTSyncController *)self canScheduleSyncRequest])
  {
    BOOL v3 = objc_alloc_init(MTTimedOperation);
    [(MTTimedOperation *)v3 setOperationType:8];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000FAE50;
    v4[3] = &unk_10054D570;
    v4[4] = self;
    [(MTTimedOperation *)v3 setMainBlock:v4];
    [(MTSyncController *)self addOperation:v3];
  }
  else
  {
    [(MTSyncController *)self resetToInitialStateIfNeeded];
  }
}

- (void)syncNonFollowedShowsIfSyncDirty
{
  if ([(MTSyncController *)self checkViabilityOfSyncLibraryAndUPP])
  {
    BOOL v3 = objc_alloc_init(_TtC8Podcasts29NonFollowedShowsSyncProcessor);
    if ([(NonFollowedShowsSyncProcessor *)v3 hasLocalChanges]) {
      [(MTSyncController *)self syncNonFollowedShows];
    }
  }
}

- (void)syncNonFollowedShows
{
  if ([(MTSyncController *)self checkViabilityOfSyncLibraryAndUPP])
  {
    objc_initWeak(&location, self);
    BOOL v3 = objc_opt_new();
    [v3 setOperationType:15];
    id v4 = _NSConcreteStackBlock;
    uint64_t v5 = 3221225472;
    dispatch_queue_t v6 = sub_1000FB12C;
    uint64_t v7 = &unk_10054E8E0;
    objc_copyWeak(&v8, &location);
    [v3 setMainBlock:&v4];
    -[MTSyncController addOperation:](self, "addOperation:", v3, v4, v5, v6, v7);
    objc_destroyWeak(&v8);

    objc_destroyWeak(&location);
  }
}

- (BOOL)keyValueStoreController:(id)a3 transaction:(id)a4 didFailWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v8 code] != (id)-1001)
  {
    unsigned int v9 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "transaction did fail with error: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  if ([v8 isAccountsChangedError])
  {
    [(MTSyncController *)self resetToInitialStateIfNeeded];
    [(MTSyncController *)self syncEverything];
LABEL_8:
    [(MTSyncController *)self enableAssetDeletionIfPossible];
    BOOL v10 = 0;
    goto LABEL_12;
  }
  if ([v8 isRecoverableError]) {
    goto LABEL_8;
  }
  double v11 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ Did fail with unrecoverable error. Cancelling all transactions", (uint8_t *)&v14, 0xCu);
  }

  long long v12 = [(MTSyncController *)self cloudSyncController];
  [v12 cancelAllTransactions];

  BOOL v10 = 1;
LABEL_12:

  return v10;
}

- (void)keyValueStoreController:(id)a3 transaction:(id)a4 didCancelWithError:(id)a5
{
  id v6 = a5;
  id v7 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = [v6 description];
    int v9 = 138412290;
    BOOL v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
  }
  [(MTSyncController *)self enableAssetDeletionIfPossible];
}

- (void)keyValueStoreController:(id)a3 transactionDidFinish:(id)a4
{
  uint64_t v5 = [a4 processor];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = +[MTLibrary sharedInstance];
    [v7 cleanUpOldHiddenPodcasts];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"MTSyncControllerSubscriptionSyncCompleted" object:0];
  }

  [(MTSyncController *)self enableAssetDeletionIfPossible];
}

- (void)enableAssetDeletionIfPossible
{
}

- (void)enableAssetDeletionIfPossible:(unint64_t)a3
{
  id v6 = [(MTSyncController *)self cloudSyncController];
  if ([v6 isIdle])
  {
    NSUInteger v5 = [(NSOperationQueue *)self->_queue operationCount];

    if (v5 != a3) {
      return;
    }
    id v6 = +[MTBaseProcessor sharedInstance];
    [v6 enable];
  }
}

- (void)scheduleEpisodeStatePutWithFeedUrls:(id)a3
{
  id v4 = a3;
  if (+[PFClientUtil isRunningOnHomepod])
  {
    NSUInteger v5 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not scheduling episode sync PUT on HomePod.", buf, 2u);
    }
    goto LABEL_7;
  }
  if ([(MTSyncController *)self checkViabilityOfSyncLibraryAndUPP]
    && [v4 count])
  {
    NSUInteger v5 = objc_opt_new();
    [v5 setOperationType:7];
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    id v8 = sub_1000FB7D8;
    int v9 = &unk_10054D9B0;
    BOOL v10 = self;
    id v11 = v4;
    [v5 setMainBlock:&v6];
    -[MTSyncController addOperation:](self, "addOperation:", v5, v6, v7, v8, v9, v10);

LABEL_7:
  }
}

- (void)scheduleEpisodeStateGetWithFeedUrls:(id)a3
{
}

- (void)scheduleVeryHighPriorityEpisodeStateGetWithFeedUrls:(id)a3
{
}

- (void)scheduleEpisodeStateGetWithFeedUrls:(id)a3 priority:(int64_t)a4
{
  id v6 = a3;
  if (+[PFClientUtil isRunningOnHomepod])
  {
    uint64_t v7 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not scheduling episode sync GET on HomePod.", buf, 2u);
    }
    goto LABEL_7;
  }
  if ([(MTSyncController *)self checkViabilityOfSyncLibraryAndUPP]
    && [v6 count])
  {
    uint64_t v7 = objc_opt_new();
    [v7 setOperationType:6];
    [v7 setQueuePriority:a4];
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    BOOL v10 = sub_1000FBA28;
    id v11 = &unk_10054D9B0;
    id v12 = v6;
    long long v13 = self;
    [v7 setMainBlock:&v8];
    -[MTSyncController addOperation:](self, "addOperation:", v7, v8, v9, v10, v11);

LABEL_7:
  }
}

- (id)expandFeedUrls:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [(MTSyncController *)self episodeSyncStorage];
        long long v13 = [v12 modernKeyFromFeedUrl:v11];
        [v5 addObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)syncCriticalBookkeeperKeysShouldSyncCleanKeys:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MTSyncController *)self checkViabilityOfSyncLibraryAndUPP])
  {
    id v5 = [(MTSyncController *)self keyProcessorPairProvider];
    id v6 = [v5 keysAndProcessorsForCriticalBookkeeperKeys];

    [(MTSyncController *)self syncMultipleKeysAndProcessors:v6 shouldSyncCleanKeys:v3];
  }
}

- (void)syncMultipleKeysAndProcessors:(id)a3 shouldSyncCleanKeys:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [[MTMultiKeySyncProcessor alloc] initWithKeysAndProcessors:v6];
  objc_initWeak(&location, self);
  if (v4)
  {
    id v8 = objc_alloc_init(MTTimedOperation);
    [(MTTimedOperation *)v8 setOperationType:16];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000FBF44;
    v15[3] = &unk_100550DB8;
    long long v16 = v7;
    objc_copyWeak(&v17, &location);
    [(MTTimedOperation *)v8 setMainBlock:v15];
    [(MTSyncController *)self addOperation:v8];
    objc_destroyWeak(&v17);
  }
  uint64_t v9 = dispatch_get_global_queue(0, 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FC088;
  v11[3] = &unk_1005515D8;
  id v12 = v7;
  BOOL v10 = v7;
  objc_copyWeak(&v14, &location);
  long long v13 = self;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

+ (void)resetMetadataToInitialState
{
  BOOL v3 = objc_opt_new();
  [v3 resetVersionForAllFeedUrls];

  [a1 resetAllSubscriptionSyncVersion];
  [a1 resetPlaylistSyncVersion];
  +[MTBookmarksSyncStorage resetBookmarksSync];
  +[MTUniversalPlaybackPositionDataSource resetUppLastSyncTimeAndDomainVersion];
  +[NonFollowedShowsSyncStorage resetNonFollowedShowsSync];
  +[InterestSyncStorage resetInterestSync];
  BOOL v4 = +[MTPrivacyUtil cloudSyncVersion];

  if (v4) {
    +[MTPrivacyUtil resetToInitialState];
  }
  id v5 = +[SyncKeysRepository shared];
  id v6 = [v5 podcastsDomainVersion];

  if (v6)
  {
    id v7 = +[SyncKeysRepository shared];
    [v7 setPodcastsDomainVersion:0];
  }
  id v8 = +[MTPushNotificationController sharedInstance];
  [v8 unregisterPushNotifications];

  uint64_t v9 = +[MTIntentDonationUtil sharedInstance];
  [v9 removeAllDonations];

  BOOL v10 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Clearing account identifier for last sync", v11, 2u);
  }

  [a1 resetAccountIdentifierForLastSync];
}

- (void)_synchronousResetToInitialStateDatabase
{
  BOOL v3 = +[MTDB sharedInstance];
  BOOL v4 = [v3 importContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000FC640;
  v6[3] = &unk_10054D9B0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

- (void)_synchronousResetToInitialStateMetadata
{
  +[MTUniversalPlaybackPositionDataSource resetUppLastSyncTimeAndDomainVersion];
  id v2 = +[MTPrivacyUtil cloudSyncVersion];

  if (v2) {
    +[MTPrivacyUtil resetToInitialState];
  }
  BOOL v3 = +[SyncKeysRepository shared];
  BOOL v4 = [v3 podcastsDomainVersion];

  if (v4)
  {
    id v5 = +[SyncKeysRepository shared];
    [v5 setPodcastsDomainVersion:0];
  }
  id v6 = +[MTPushNotificationController sharedInstance];
  [v6 unregisterPushNotifications];

  id v7 = +[MTIntentDonationUtil sharedInstance];
  [v7 removeAllDonations];

  id v8 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Clearing account identifier for last sync", v9, 2u);
  }

  [(id)objc_opt_class() resetAccountIdentifierForLastSync];
}

- (void)_finaliseResetToInitial:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(MTSyncController *)v5 setResettingToInitialState:0];
  id v6 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reset to Initial State - Completed", buf, 2u);
  }

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"MTSyncControllerResetToInitialStateCompleted" object:0];

  objc_sync_exit(v5);
  id v8 = dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000FCDAC;
  v10[3] = &unk_10054E398;
  v10[4] = v5;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

+ (void)didUpdateSubscriptionsSyncVersionForSyncType:(int64_t)a3
{
  char v3 = a3;
  id v5 = [a1 sharedInstance];
  unint64_t v6 = (unint64_t)[v5 syncVersionFlags];

  if (v6 != 3)
  {
    unint64_t v7 = v6 | (1 << v3);
    id v8 = [a1 sharedInstance];
    [v8 setSyncVersionFlags:v7];

    id v9 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      unint64_t v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting MTSyncController syncVersionFlags to %lld", (uint8_t *)&v10, 0xCu);
    }
  }
}

+ (void)resetAllSubscriptionSyncVersion
{
  id v2 = +[SyncKeysRepository shared];
  [v2 resetSubscriptionsSyncVersionFor:0];

  id v3 = +[SyncKeysRepository shared];
  [v3 resetSubscriptionsSyncVersionFor:1];
}

- (BOOL)hasInterestSyncVersion
{
  id v2 = +[SyncKeysRepository shared];
  id v3 = [v2 interestSyncVersion];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setPlaylistSyncVersion:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() setPlaylistSyncVersion:v3];
}

+ (void)setPlaylistSyncVersion:(id)a3
{
  id v6 = a3;
  id v3 = [v6 length];
  BOOL v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = v4;
  if (v3) {
    [v4 setObject:v6 forKey:kMTPlaylistsKey];
  }
  else {
    [v4 removeObjectForKey:kMTPlaylistsKey];
  }
}

+ (void)resetPlaylistSyncVersion
{
  [a1 setPlaylistSyncVersion:0];
  id v2 = +[SyncKeysRepository shared];
  [v2 setIsPlaylistSyncDirty:1];
}

+ (void)setAccountIdentifierForLastSync:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  id v6 = [v5 accountIdentifierForLastSync];
  unint64_t v7 = v6;
  if (v6 != v4 && ([v6 isEqualToString:v4] & 1) == 0)
  {
    id v8 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      long long v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Changing account identifier to %@ from %@", (uint8_t *)&v10, 0x16u);
    }

    if ([v4 length])
    {
      id v9 = +[NSUserDefaults standardUserDefaults];
      [v9 setObject:v4 forKey:@"SSAccountIdentifier"];
    }
    else
    {
      id v9 = +[NSUserDefaults standardUserDefaults];
      [v9 removeObjectForKey:@"SSAccountIdentifier"];
    }
  }
  objc_sync_exit(v5);
}

+ (void)resetAccountIdentifierForLastSync
{
}

+ (BOOL)hasAccountChangedSinceLastSync
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = [v2 accountIdentifierForLastSync];
  if (![v3 length])
  {
    id v6 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "hasAccountChangedSinceLastSync = NO since there was previously no account", buf, 2u);
    }
    goto LABEL_10;
  }
  id v4 = +[MTAccountController sharedInstance];
  id v5 = [v4 activeDsid];
  id v6 = [v5 stringValue];

  if (![v6 length])
  {
    id v8 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "hasAccountChangedSinceLastSync = NO since there is currently no account", v10, 2u);
    }

    goto LABEL_10;
  }
  if (v3 == v6)
  {
LABEL_10:
    LOBYTE(v7) = 0;
    goto LABEL_11;
  }
  unsigned int v7 = [v3 isEqualToString:v6] ^ 1;
LABEL_11:

  objc_sync_exit(v2);
  return v7;
}

- (BOOL)hasAccountChangedSinceLastSync
{
  id v2 = objc_opt_class();

  return [v2 hasAccountChangedSinceLastSync];
}

- (void)updateAccountForLastSync
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating account for last sync", v7, 2u);
  }

  id v4 = +[MTAccountController sharedInstance];
  id v5 = [v4 activeDsid];
  id v6 = [v5 stringValue];

  [(id)objc_opt_class() setAccountIdentifierForLastSync:v6];
  objc_sync_exit(v2);
}

- (BOOL)uppSyncDirtyFlag
{
  return self->_uppSyncDirtyFlag;
}

- (void)setUppSyncDirtyFlag:(BOOL)a3
{
  self->_uppSyncDirtyFlag = a3;
}

- (int64_t)syncVersionFlags
{
  return self->_syncVersionFlags;
}

- (void)setSyncVersionFlags:(int64_t)a3
{
  self->_syncVersionFlags = a3;
}

- (void)setBackgroundTask:(unint64_t)a3
{
  self->_backgroundTask = a3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MTEpisodeSyncStorage)episodeSyncStorage
{
  return self->_episodeSyncStorage;
}

- (void)setEpisodeSyncStorage:(id)a3
{
}

- (MTKeyProcessorPairProvider)keyProcessorPairProvider
{
  return self->_keyProcessorPairProvider;
}

- (void)setKeyProcessorPairProvider:(id)a3
{
}

- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter
{
  return self->_cloudSyncBugReporter;
}

- (void)setCloudSyncBugReporter:(id)a3
{
}

- (BOOL)resyncWhenDone
{
  return self->_resyncWhenDone;
}

- (void)setResyncWhenDone:(BOOL)a3
{
  self->_resyncWhenDone = a3;
}

- (void)setEpisodeObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeObservers, 0);
  objc_storeStrong((id *)&self->_uppDataSource, 0);
  objc_storeStrong((id *)&self->_cloudSyncBugReporter, 0);
  objc_storeStrong((id *)&self->_keyProcessorPairProvider, 0);
  objc_storeStrong((id *)&self->_episodeSyncStorage, 0);
  objc_storeStrong((id *)&self->_cloudSyncController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_UPPStore, 0);
  objc_storeStrong((id *)&self->_UPPEnabled, 0);

  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end