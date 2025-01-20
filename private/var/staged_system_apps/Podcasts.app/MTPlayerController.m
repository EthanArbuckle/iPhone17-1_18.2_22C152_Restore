@interface MTPlayerController
+ (BOOL)hasDefaultInstance;
+ (MTPlayerController)defaultInstance;
+ (id)_activityRestorationPath;
+ (id)_loadActivityForRestoration;
+ (void)setDefaultInstance:(id)a3;
- (BOOL)_openExternalItemIfNeededForManifest:(id)a3;
- (BOOL)_promptToClearUpNextIfNeededForRequest:(id)a3;
- (BOOL)_shouldOpenExternalItemForEpisode:(id)a3;
- (BOOL)hasReportedThisEpisode;
- (BOOL)isLicenseKeyExpiredError:(id)a3;
- (BOOL)isLicenseKeyIntegrityError:(id)a3;
- (BOOL)isManifestRestorationOngoing;
- (BOOL)isPlayerManifestRestored;
- (BOOL)isPlayerTargetLocal;
- (BOOL)isPlayingEpisodeUuid:(id)a3;
- (BOOL)isPlayingFullScreenVideo;
- (BOOL)isPlayingLocally;
- (BOOL)isSeekingOrScrubbing;
- (BOOL)pauseLocalPlayerWithInitiator:(unint64_t)a3;
- (BOOL)playWithContext:(id)a3;
- (BOOL)playWithReason:(unint64_t)a3;
- (BOOL)playWithReason:(unint64_t)a3 interruptEvent:(BOOL)a4;
- (BOOL)shouldFindSomethingToPlay;
- (BOOL)shouldPresentNowPlayingForItem:(id)a3 presentationType:(unint64_t)a4;
- (BOOL)updateEpisode:(id)a3 andPlayerItem:(id)a4 withElapsedTime:(double)a5 andDuration:(double)a6 onMediaItemWillChange:(BOOL)a7;
- (BOOL)volumeControlAvailable;
- (HighlightsProviderObjCProtocol)highlightsProvider;
- (IMAVPlayer)player;
- (MPCPlayerPath)playerPath;
- (MTCompositeManifest)compositeManifest;
- (MTCoreDataKeyRequestStorage)keyStorage;
- (MTMediaRemoteController)mediaRemoteController;
- (MTNowPlayingArtworkProvider)artworkProvider;
- (MTPlaybackPositionController)playbackPositionController;
- (MTPlaybackQueueController)playbackQueueController;
- (MTPlayerController)init;
- (MTPlayerController)initWithPlayer:(id)a3;
- (MTPlayerFailureDialogProxy)dialogProxy;
- (MTPlayerManifest)userManifest;
- (MTPropertyChangeQueryObserver)transcriptIdentifierObserver;
- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager;
- (MTUpNextController)upNextController;
- (MTUpNextManifest)upNextManifest;
- (NSMutableArray)restorationCompletions;
- (NSMutableSet)recordedPlayEventsForCurrentItem;
- (NSString)previousPlayingEpisodeUuid;
- (NSTimer)setPlaybackQueueRequestTimeoutTimer;
- (NSURL)lastRecordedItemURL;
- (NSUserActivity)currentActivity;
- (OS_dispatch_queue)dataAccessQueue;
- (OS_dispatch_queue)loadQueue;
- (OS_dispatch_queue)restorationQueue;
- (PFFairPlayInvalidationManager)invalidationManager;
- (PFFairPlayValidationManager)validationManager;
- (double)currentTime;
- (double)lastPlaybackPositionSaveTime;
- (double)lastPlaybackSaveTime;
- (double)metricsPlayStartPosition;
- (id)_alertControllerForClearingOrKeepingUpNextWithRequest:(id)a3;
- (id)_currentEpisodeForManifest:(id)a3;
- (id)copy;
- (id)currentItem;
- (id)platformSyncPlayheadChangeObserverBlock;
- (id)playingEpisodeUuid;
- (int64_t)_validatePlaybackRequest:(id)a3;
- (int64_t)metricsPlayStartTime;
- (void)_currentActivityBecomeCurrent;
- (void)_invokeRestorationCompletions;
- (void)_localPlayerPath;
- (void)_onQueueRestorePlayerManifestWithCompletion:(id)a3;
- (void)_performAfterPlay:(id)a3 playbackStarted:(BOOL)a4;
- (void)_performMediaRemoteCommand:(unsigned int)a3;
- (void)_performMediaRemoteCommand:(unsigned int)a3 options:(id)a4;
- (void)_recordMetricsForItemDidChange;
- (void)_restoreDefaultManifestIfNeededWithCompletion:(id)a3;
- (void)_restoreEmptyManifestIfNeededWithCompletion:(id)a3;
- (void)_restoreManifestIfNeededWithCompletion:(id)a3 useEmptyManifest:(BOOL)a4;
- (void)_saveActivityForRestoration;
- (void)_sendMediaRemoteCommand:(unsigned int)a3 toPlayer:(void *)a4;
- (void)_sendMediaRemoteCommand:(unsigned int)a3 toPlayer:(void *)a4 options:(id)a5;
- (void)_setLocalPlaybackQueue:(id)a3;
- (void)_setPlaybackQueue:(id)a3;
- (void)_showGenericPromptToClearUpNextWithRequest:(id)a3;
- (void)_updateCurrentActivityForPlayState;
- (void)attemptToRecoverFromKeyError:(id)a3;
- (void)beginObservingTranscriptIdentifierChangesForCurrentItem:(id)a3;
- (void)clearPlayerManifestWithCompletion:(id)a3;
- (void)currentItemDidChange;
- (void)currentItemWillChange:(id)a3;
- (void)dealloc;
- (void)dismissNowPlayingAnimated:(BOOL)a3;
- (void)openExternalEpisode:(id)a3;
- (void)pauseLocalPlayer;
- (void)pausePlayerTarget;
- (void)pausePlayerTargetWithInitiator:(unint64_t)a3;
- (void)playItemAtIndex:(unint64_t)a3;
- (void)playLocalPlayer;
- (void)playManifest:(id)a3 context:(id)a4 completion:(id)a5;
- (void)playManifest:(id)a3 reason:(unint64_t)a4;
- (void)playManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 completion:(id)a6;
- (void)playManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 presentationType:(unint64_t)a6 completion:(id)a7;
- (void)playPlayerTarget;
- (void)playWithContext:(id)a3 completion:(id)a4;
- (void)playbackStateDidChange:(id)a3;
- (void)player:(id)a3 didStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5;
- (void)player:(id)a3 failedToStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5;
- (void)player:(id)a3 willStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5;
- (void)playerErrorDidOccur:(id)a3;
- (void)playerFailedToPlayToEndTime:(id)a3;
- (void)playerFailure:(id)a3 shouldShowDialog:(BOOL)a4;
- (void)playerHeadWillChange:(id)a3;
- (void)playerPeriodicUpdate;
- (void)presentNowPlayingAnimated:(BOOL)a3;
- (void)recordMTPlayerMetricsForCurrentItemWithCurrentTime:(double)a3;
- (void)recordMetricsEventForAccessLog:(id)a3 playerItem:(id)a4;
- (void)recordMetricsEventForErrorLog:(id)a3 withEpisode:(id)a4;
- (void)recordMetricsForCurrentItem;
- (void)reportStopReason:(unint64_t)a3 withInitiator:(unint64_t)a4;
- (void)resolveActivePlayerPathWithCompletion:(id)a3;
- (void)restoreFromUserActivity:(id)a3 startPlayback:(BOOL)a4 reason:(unint64_t)a5 interactive:(BOOL)a6 completion:(id)a7;
- (void)restoreFromUserActivity:(id)a3 withManifest:(id)a4 startPlayback:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8;
- (void)restorePlayerManifestWithCompletion:(id)a3;
- (void)seekToTime:(double)a3;
- (void)setArtworkProvider:(id)a3;
- (void)setCompositeManifest:(id)a3;
- (void)setCurrentActivity:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setDataAccessQueue:(id)a3;
- (void)setDialogProxy:(id)a3;
- (void)setHasReportedThisEpisode:(BOOL)a3;
- (void)setHighlightsProvider:(id)a3;
- (void)setInvalidationManager:(id)a3;
- (void)setIsManifestRestorationOngoing:(BOOL)a3;
- (void)setIsPlayingFullScreenVideo:(BOOL)a3;
- (void)setKeyStorage:(id)a3;
- (void)setLastPlaybackPositionSaveTime:(double)a3;
- (void)setLastPlaybackSaveTime:(double)a3;
- (void)setLastRecordedItemURL:(id)a3;
- (void)setLoadQueue:(id)a3;
- (void)setManifest:(id)a3 context:(id)a4 completion:(id)a5;
- (void)setManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 completion:(id)a6;
- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 context:(id)a5 completion:(id)a6;
- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 destination:(unint64_t)a5 context:(id)a6 completion:(id)a7;
- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 forceLocal:(BOOL)a5 context:(id)a6 completion:(id)a7;
- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 forceLocal:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8;
- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 reason:(unint64_t)a5 interactive:(BOOL)a6 completion:(id)a7;
- (void)setManifestAsDryRun:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)setMediaRemoteController:(id)a3;
- (void)setMetricsPlayStartPosition:(double)a3;
- (void)setMetricsPlayStartTime:(int64_t)a3;
- (void)setPlatformSyncPlayheadChangeObserverBlock:(id)a3;
- (void)setPlaybackPositionController:(id)a3;
- (void)setPlaybackQueue:(id)a3;
- (void)setPlaybackQueueController:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerManifestRestored:(BOOL)a3;
- (void)setPlayerPath:(id)a3;
- (void)setPreviousPlayingEpisodeUuid:(id)a3;
- (void)setRecordedPlayEventsForCurrentItem:(id)a3;
- (void)setRestorationCompletions:(id)a3;
- (void)setRestorationQueue:(id)a3;
- (void)setSecureDownloadRenewalManager:(id)a3;
- (void)setSetPlaybackQueueRequestTimeoutTimer:(id)a3;
- (void)setShouldFindSomethingToPlay:(BOOL)a3;
- (void)setTranscriptIdentifierObserver:(id)a3;
- (void)setUpNextController:(id)a3;
- (void)setUpNextManifest:(id)a3;
- (void)setUserManifest:(id)a3;
- (void)setValidationManager:(id)a3;
- (void)setupPlayerNotifications;
- (void)stopLocalPlayer;
- (void)stopLocalPlayerWithReason:(unint64_t)a3 initiator:(unint64_t)a4;
- (void)stopPlayerTarget;
- (void)stopPlayerTargetWithReason:(unint64_t)a3 initiator:(unint64_t)a4;
- (void)stopWithReason:(unint64_t)a3 initiator:(unint64_t)a4;
- (void)tearDownPlayerNotifications;
- (void)updateEpisodeForPlayerUpdateForceSave:(BOOL)a3;
- (void)updateUPPEpisodeUuid:(id)a3 bookmarkTime:(double)a4;
- (void)userActivity:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5;
@end

@implementation MTPlayerController

+ (BOOL)hasDefaultInstance
{
  return qword_10060A900 != 0;
}

+ (MTPlayerController)defaultInstance
{
  if (+[PFClientUtil isRunningOnHomepod])
  {
    v2 = +[MRSharedSettings currentSettings];
    unsigned int v3 = [v2 isMultiplayerHost];

    if (v3)
    {
      v4 = +[IMLogCategory player];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "HomePod attempted to access the shared player controller", v7, 2u);
      }
    }
  }
  v5 = (void *)qword_10060A900;

  return (MTPlayerController *)v5;
}

+ (void)setDefaultInstance:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&qword_10060A900, a3);
  id v4 = +[MTHandoffController sharedInstance];
  id v5 = +[MTProcessorManager sharedInstance];
}

- (id)copy
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MTPlayerController)init
{
  return [(MTPlayerController *)self initWithPlayer:0];
}

- (MTPlayerController)initWithPlayer:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MTPlayerController;
  id v5 = [(MTPlayerController *)&v28 init];
  if (v5)
  {
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"_updateCurrentActivityForPlayState" name:MTApplicationDidEnterBackgroundNotification object:0];
    [v6 addObserver:v5 selector:"_updateCurrentActivityForPlayState" name:MTApplicationDidBecomeActiveNotification object:0];
    v7 = +[NSMutableSet set];
    [(MTPlayerController *)v5 setRecordedPlayEventsForCurrentItem:v7];

    +[IMPlayerManifest registerManifestForRestoration:objc_opt_class()];
    +[IMPlayerManifest registerManifestForRestoration:objc_opt_class()];
    +[IMPlayerManifest registerManifestForRestoration:objc_opt_class()];
    +[IMPlayerManifest registerManifestForRestoration:objc_opt_class()];
    +[IMPlayerManifest registerManifestForRestoration:objc_opt_class()];
    +[IMPlayerManifest registerManifestForRestoration:objc_opt_class()];
    +[IMPlayerManifest registerManifestForRestoration:objc_opt_class()];
    +[IMPlayerManifest registerManifestForRestoration:objc_opt_class()];
    if (v4)
    {
      [(MTPlayerController *)v5 setPlayer:v4];
    }
    else
    {
      v8 = +[IMAVPlayer sharedPlayer];
      [(MTPlayerController *)v5 setPlayer:v8];
    }
    v9 = [(MTPlayerController *)v5 player];
    [v9 setCausalityObserver:v5];

    v10 = [[MTUpNextController alloc] initWithPlayerController:v5];
    [(MTPlayerController *)v5 setUpNextController:v10];

    v11 = [[MTUpNextManifest alloc] initWithPlayerController:v5];
    [(MTPlayerController *)v5 setUpNextManifest:v11];

    v12 = [[MTPlaybackQueueController alloc] initWithPlayerController:v5];
    [(MTPlayerController *)v5 setPlaybackQueueController:v12];

    if ((os_feature_enabled_bluemoon() & 1) == 0)
    {
      v13 = [[MTMediaRemoteController alloc] initWithPlayerController:v5];
      [(MTPlayerController *)v5 setMediaRemoteController:v13];
    }
    if (+[PFClientUtil isRunningOnHomepod])
    {
      id v14 = objc_alloc_init((Class)MTPlaybackPositionController);
      [(MTPlayerController *)v5 setPlaybackPositionController:v14];
    }
    [(MTPlayerController *)v5 setLastPlaybackSaveTime:CFAbsoluteTimeGetCurrent()];
    [(MTPlayerController *)v5 setupPlayerNotifications];
    v15 = +[NSMutableArray array];
    [(MTPlayerController *)v5 setRestorationCompletions:v15];

    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v17 = dispatch_queue_create("MTPlayerController-RestorePlayerManifest", v16);
    [(MTPlayerController *)v5 setRestorationQueue:v17];

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.podcasts.MTPlayerController.dataAccessQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    [(MTPlayerController *)v5 setDataAccessQueue:v18];

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.podcasts.compositeManifest.loadingQueue", 0);
    [(MTPlayerController *)v5 setLoadQueue:v19];

    [(MTPlayerController *)v5 setIsManifestRestorationOngoing:0];
    v20 = objc_opt_new();
    [(MTPlayerController *)v5 setKeyStorage:v20];

    v21 = +[MTLibrary sharedInstance];
    v22 = [v21 secureDownloadRenewalManager];
    [(MTPlayerController *)v5 setSecureDownloadRenewalManager:v22];

    id v23 = objc_alloc((Class)PFFairPlayValidationManager);
    v24 = +[MTLibrary sharedInstance];
    id v25 = [v23 initWithEpisodeRemovalManager:v24];
    [(MTPlayerController *)v5 setValidationManager:v25];

    v26 = objc_opt_new();
    [(MTPlayerController *)v5 setInvalidationManager:v26];

    v5->_shouldFindSomethingToPlay = 1;
  }

  return v5;
}

- (void)dealloc
{
  unsigned int v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(MTPlayerController *)self tearDownPlayerNotifications];
  [(MTPropertyChangeQueryObserver *)self->_transcriptIdentifierObserver stop];
  v4.receiver = self;
  v4.super_class = (Class)MTPlayerController;
  [(MTPlayerController *)&v4 dealloc];
}

- (void)setupPlayerNotifications
{
  id v17 = +[NSNotificationCenter defaultCenter];
  uint64_t v3 = IMAVPlayerNotification_MediaItemWillChange;
  objc_super v4 = [(MTPlayerController *)self player];
  [v17 addObserver:self selector:"currentItemWillChange:" name:v3 object:v4];

  uint64_t v5 = IMAVPlayerNotification_MediaItemDidChange;
  id v6 = [(MTPlayerController *)self player];
  [v17 addObserver:self selector:"currentItemDidChange" name:v5 object:v6];

  uint64_t v7 = IMAVPlayerNotification_StateDidChange;
  v8 = [(MTPlayerController *)self player];
  [v17 addObserver:self selector:"playbackStateDidChange:" name:v7 object:v8];

  uint64_t v9 = IMAVPlayerNotification_PeriodicUpdate;
  v10 = [(MTPlayerController *)self player];
  [v17 addObserver:self selector:"playerPeriodicUpdate" name:v9 object:v10];

  uint64_t v11 = IMAVPlayerNotification_ErrorDidOccur;
  v12 = [(MTPlayerController *)self player];
  [v17 addObserver:self selector:"playerErrorDidOccur:" name:v11 object:v12];

  uint64_t v13 = IMAVPlayerNotification_FailedToPlayToEndTime;
  id v14 = [(MTPlayerController *)self player];
  [v17 addObserver:self selector:"playerFailedToPlayToEndTime:" name:v13 object:v14];

  uint64_t v15 = IMAVPlayerNotification_PlayerHeadWillChange;
  v16 = [(MTPlayerController *)self player];
  [v17 addObserver:self selector:"playerHeadWillChange:" name:v15 object:v16];
}

- (void)tearDownPlayerNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)playerErrorDidOccur:(id)a3
{
  id v4 = a3;
  [(MTPlayerController *)self playerFailure:v4 shouldShowDialog:1];
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:IMAVPlayerNotificationKey_Error];

  uint64_t v7 = [(MTPlayerController *)self player];
  v8 = [v7 currentItem];

  if ([(MTPlayerController *)self isLicenseKeyIntegrityError:v6]) {
    [(MTPlayerController *)self attemptToRecoverFromKeyError:v4];
  }
  if ([(MTPlayerController *)self isLicenseKeyExpiredError:v6]
    && [v8 isLocal])
  {
    uint64_t v9 = [v8 episodeUuid];
    if ([v9 length])
    {
      uint64_t v10 = (uint64_t)[v8 episodeStoreId];

      if (v10 >= 1)
      {
        objc_initWeak(&location, self);
        uint64_t v11 = [(MTPlayerController *)self dataAccessQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10013AEF0;
        block[3] = &unk_100550DB8;
        id v13 = v8;
        objc_copyWeak(&v14, &location);
        dispatch_async(v11, block);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
    else
    {
    }
  }
}

- (void)attemptToRecoverFromKeyError:(id)a3
{
  id v4 = a3;
  +[PFBugReporterBridge reportKeyIntegrityError];
  uint64_t v5 = [(MTPlayerController *)self player];
  id v6 = [v5 currentItem];

  uint64_t v7 = +[PFFairPlayRolloutController sharedInstance];
  unsigned int v8 = [v7 isEnabled];

  if (v8)
  {
    id v9 = objc_alloc((Class)PFFairPlayAsset);
    id v10 = [v6 episodeStoreId];
    uint64_t v11 = [v6 asset];
    id v12 = [v9 initWithAdamID:v10 avAsset:v11];

    id v13 = [(MTPlayerController *)self invalidationManager];
    id v14 = [v13 removeKeyFor:v12];

    objc_initWeak(&location, self);
    uint64_t v15 = [(MTPlayerController *)self invalidationManager];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10013B558;
    v20[3] = &unk_100552B40;
    objc_copyWeak(&v21, &location);
    [v15 removalAllFairPlayKeysWithCompletion:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v16 = [(MTPlayerController *)self keyStorage];
    objc_msgSend(v16, "removeKeyDataForStoreTrackID:", objc_msgSend(v6, "episodeStoreId"));

    objc_initWeak(&location, self);
    id v17 = [(MTPlayerController *)self keyStorage];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10013B654;
    v18[3] = &unk_1005523E8;
    objc_copyWeak(&v19, &location);
    [v17 removeAllKeyDataWithCompletion:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)playerFailedToPlayToEndTime:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:IMAVPlayerNotificationKey_Error];

  -[MTPlayerController playerFailure:shouldShowDialog:](self, "playerFailure:shouldShowDialog:", v4, [v6 code] == (id)-11870);
}

- (BOOL)isLicenseKeyExpiredError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)-42800)
  {
    id v4 = [v3 domain];
    unsigned __int8 v5 = [v4 isEqualToString:@"CoreMediaErrorDomain"];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isLicenseKeyIntegrityError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)-42803)
  {
    id v4 = [v3 domain];
    unsigned __int8 v5 = [v4 isEqualToString:@"CoreMediaErrorDomain"];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)playerFailure:(id)a3 shouldShowDialog:(BOOL)a4
{
  BOOL v4 = a4;
  id v40 = a3;
  unsigned __int8 v5 = [v40 userInfo];
  v41 = [v5 objectForKeyedSubscript:IMAVPlayerNotificationKey_Error];

  [v41 recordMetrics];
  id v6 = [(MTPlayerController *)self player];
  [(MTPlayerController *)self player:v6 willStopWithReason:10 initiator:2];

  uint64_t v7 = [(MTPlayerController *)self player];
  [(MTPlayerController *)self player:v7 didStopWithReason:10 initiator:2];

  unsigned int v8 = v41;
  if ([v41 code] != (id)-11819)
  {
    id v9 = [(MTPlayerController *)self player];
    v39 = [v9 currentItem];

    id v10 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [v39 episode];
      id v12 = [v11 uuid];
      *(_DWORD *)buf = 138412546;
      uint64_t v51 = (uint64_t)v12;
      __int16 v52 = 2112;
      v53 = v41;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Player failure for episode with uuid %@ with error %@", buf, 0x16u);
    }
    id v13 = [v40 userInfo];
    id v14 = [v13 objectForKeyedSubscript:IMAVPlayerNotificationKey_PlaybackInterrupted];
    unsigned int v15 = [v14 BOOLValue];

    if ((v4 & v15) == 1)
    {
      v16 = [v39 episode];
      uint64_t v17 = (uint64_t)[v16 reasonForNotPlayable];

      dispatch_queue_t v18 = _MTLogCategoryPlayback();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v39 episode];
        v20 = [v19 uuid];
        *(_DWORD *)buf = 134218242;
        uint64_t v51 = v17;
        __int16 v52 = 2112;
        v53 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Reason for player failure: %lu for episode with uuid %@", buf, 0x16u);
      }
      id v21 = [(MTPlayerController *)self player];
      v38 = [v21 playerItem];

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v22 = [v38 errorLog];
      id v23 = [v22 events];

      id v24 = [v23 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v46;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v46 != v25) {
              objc_enumerationMutation(v23);
            }
            v27 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            objc_super v28 = [v27 errorDomain];
            v29 = +[MTStandardKeyRequestHandler keyRequestLicenseErrorDomain];
            unsigned int v30 = [v28 isEqualToString:v29];

            if (v30)
            {
              if ([v27 errorStatusCode] == (id)-1002)
              {
                uint64_t v17 = 8;
              }
              else if ([v27 errorStatusCode] == (id)-1004)
              {
                uint64_t v17 = 9;
              }
              else if ([v27 errorStatusCode] == (id)-1014)
              {
                uint64_t v17 = 10;
              }
            }
          }
          id v24 = [v23 countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v24);
      }

      if ([(MTPlayerController *)self isLicenseKeyIntegrityError:v41]) {
        uint64_t v17 = 13;
      }
      if (!v17)
      {
        if ([v41 code] == (id)-11870)
        {
          uint64_t v17 = 6;
        }
        else if ([(MTPlayerController *)self isLicenseKeyExpiredError:v41])
        {
          uint64_t v17 = 8;
        }
        else if ([v41 code] == (id)-1009 || objc_msgSend(v41, "code") == (id)-1005)
        {
          uint64_t v17 = 2;
        }
        else
        {
          v31 = [v41 domain];
          if (v31 == NSURLErrorDomain) {
            uint64_t v17 = 4;
          }
          else {
            uint64_t v17 = 5;
          }
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dialogProxy);
      BOOL v33 = WeakRetained == 0;

      if (v33)
      {
        objc_initWeak((id *)buf, self);
        v36 = +[MTEpisodeUnavailableUtil sharedInstance];
        v37 = [v39 author];
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_10013BE4C;
        v43[3] = &unk_100552B68;
        v43[4] = self;
        objc_copyWeak(&v44, (id *)buf);
        [v36 showDialogForReason:v17 podcastTitle:v37 completion:v43];

        objc_destroyWeak(&v44);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        id v34 = objc_loadWeakRetained((id *)&self->_dialogProxy);
        v35 = [v39 author];
        [v34 proxyShouldShowDialogForReason:v17 podcastTitle:v35];
      }
    }

    unsigned int v8 = v41;
  }
}

- (void)currentItemWillChange:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "currentItemWillChange", buf, 2u);
  }

  id v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:IMAVPlayerNotificationKey_OldMediaItem];

  unsigned int v8 = [(MTPlayerController *)self userManifest];
  id v9 = [v4 userInfo];
  id v10 = [v9 objectForKeyedSubscript:IMAVPlayerNotificationKey_NewMediaItem];

  if (v7)
  {
    [v7 playhead];
    uint64_t v12 = v11;
    [v7 duration];
    uint64_t v14 = v13;
    unsigned int v15 = +[MTDB sharedInstance];
    v16 = [v15 mainQueueContext];

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10013C374;
    v48[3] = &unk_100552B90;
    id v49 = v16;
    id v17 = v7;
    id v50 = v17;
    uint64_t v51 = self;
    uint64_t v52 = v12;
    uint64_t v53 = v14;
    id v18 = v16;
    [v18 performBlockAndWaitWithSave:v48];
    id v19 = +[MTDB sharedInstance];
    v20 = [v19 privateQueueContext];

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10013C524;
    v45[3] = &unk_10054D9B0;
    id v46 = v20;
    id v47 = v17;
    id v21 = v20;
    [v21 performBlock:v45];
  }
  v22 = [v7 url];
  id v23 = [v10 url];
  if ([v22 isEqual:v23])
  {
    unsigned __int8 v24 = [v10 enqueuedByAnotherUser];

    if ((v24 & 1) == 0)
    {
      [v7 playhead];
      [v10 setPlayhead:];
    }
  }
  else
  {
  }
  uint64_t v25 = [(MTPlayerController *)self player];
  unsigned int v26 = [v25 isPlaybackRequested];

  if (v26)
  {
    [(MTPlayerController *)self recordMetricsForCurrentItem];
    v27 = [v4 userInfo];
    objc_super v28 = [v27 objectForKeyedSubscript:IMAVPlayerNotificationKey_CurrentPlayheadTime];
    [v28 floatValue];
    double v30 = v29;

    [(MTPlayerController *)self recordMTPlayerMetricsForCurrentItemWithCurrentTime:v30];
  }
  v31 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  unsigned int v32 = [v31 BOOLForKey:kMTContinuousPlaybackEnabledKey];

  BOOL v33 = [v4 userInfo];
  id v34 = [v33 objectForKey:IMAVPlayerNotificationKey_DidSleepAtAssetEnd];
  unsigned __int8 v35 = [v34 BOOLValue];

  unsigned __int8 v36 = 0;
  if (v32 && (v35 & 1) == 0)
  {
    v37 = [(MTPlayerController *)self player];
    unsigned __int8 v36 = [v37 isPlaybackRequested];
  }
  if (v10)
  {
    if ([v10 upgradeToAlternatePaidVersionIfNeeded])
    {
      v38 = _MTLogCategoryPlayback();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "We are upgrading the next item going into the player", buf, 2u);
      }

      [v10 invalidateAsset];
    }
  }
  else
  {
    unsigned __int8 v39 = [(MTPlayerController *)self shouldFindSomethingToPlay];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10013C5A4;
    v40[3] = &unk_100552BE0;
    id v41 = v8;
    v42 = self;
    unsigned __int8 v43 = v36;
    unsigned __int8 v44 = v39;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v40);
  }
}

- (BOOL)updateEpisode:(id)a3 andPlayerItem:(id)a4 withElapsedTime:(double)a5 andDuration:(double)a6 onMediaItemWillChange:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  if (([v12 isPlaceholder] & 1) == 0
    && (!+[MTApplication localLibraryUpdatesDisabled]
     || +[PFClientUtil isRunningOnHomepod]))
  {
    [v11 endOfTrack];
    double v14 = v13;
    unsigned int v15 = +[MTAccountController sharedInstance];
    v16 = [v15 activeAccount];

    if (v14 > a5 || !v7)
    {
      if ([v12 enqueuedByAnotherUser])
      {
        LOBYTE(v26) = 0;
LABEL_47:

        goto LABEL_48;
      }
      double v27 = kMTEpisodePlayheadCutoffForPartiallyPlayed;
      if (kMTEpisodePlayheadCutoffForPartiallyPlayed >= a5)
      {
        BOOL v26 = 0;
      }
      else
      {
        if (([v11 isUnplayed] & 1) != 0 || objc_msgSend(v11, "backCatalog"))
        {
          objc_super v28 = +[PodcastsStateCoordinator shared];
          [v28 unsafeEpisodePlayedBeyondThresholdForFirstTime:v11 from:3];

          BOOL v26 = 1;
          [v11 setPlayState:1 manually:[v11 playStateManuallySet] source:9];
          +[NSDate timeIntervalSinceReferenceDate];
          double v30 = v29;
          v31 = [v11 podcast];
          [v31 lastRemovedFromUpNextDate];
          double v33 = v30 - v32;

          if (v33 > v27)
          {
            id v34 = [v11 podcast];
            [v34 setLastRemovedFromUpNextDate:0.0];

            BOOL v26 = 1;
          }
        }
        else
        {
          BOOL v26 = 0;
        }
        if (!v11
          && (+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:", [v12 episodeStoreId]) & 1) == 0&& (+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:", objc_msgSend(v12, "podcastStoreId")) & 1) == 0&& (+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod") & 1) == 0)
        {
          unsigned __int8 v35 = +[PodcastsStateCoordinator shared];
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_10013CE40;
          v57[3] = &unk_100552C50;
          id v58 = v12;
          v59 = self;
          [v35 insertNewImplicitFollowIfNeededForPlayerItem:v58 from:3 completion:v57];
        }
      }
      [v11 playhead];
      if (vabdd_f64(a5, v36) > 0.2)
      {
        v37 = _MTLogCategoryPlayback();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          uint64_t v38 = [v11 uuid];
          unsigned __int8 v39 = (void *)v38;
          CFStringRef v40 = @"unknown";
          if (v38) {
            CFStringRef v40 = (const __CFString *)v38;
          }
          *(_DWORD *)buf = 138412290;
          CFStringRef v61 = v40;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Episode %@: Updating episode playhead and last date played", buf, 0xCu);
        }
        *(float *)&double v41 = a5;
        [v11 setPlayhead:v41];
        +[NSDate timeIntervalSinceReferenceDate];
        [v11 setLastDatePlayed:];
      }
      if (+[PFClientUtil isRunningOnHomepod])
      {
        v42 = [(MTPlayerController *)self compositeManifest];
        unsigned int v43 = [v42 networkUPPEnabled];

        if (v43)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          [(MTPlayerController *)self lastPlaybackPositionSaveTime];
          double v46 = Current - v45;
          id v47 = +[IMURLBag sharedInstance];
          long long v48 = [v47 syncValueForKey:kBagKeyUPPSyncInterval];
          [v48 doubleValue];
          BOOL v50 = v46 <= v49;

          if (!v50 || !~v26)
          {
            uint64_t v51 = [(MTPlayerController *)self playbackPositionController];
            id v52 = [v12 episodeStoreId];
            v55[0] = _NSConcreteStackBlock;
            v55[1] = 3221225472;
            v55[2] = sub_10013D114;
            v55[3] = &unk_10054DE48;
            id v56 = v12;
            [v51 updatePlaybackPositionWithEpisodeStoreId:v52 completed:0 position:v16 account:v55 completion:a5];

            [(MTPlayerController *)self setLastPlaybackPositionSaveTime:CFAbsoluteTimeGetCurrent()];
          }
        }
      }
      platformSyncPlayheadChangeObserverBlock = (void (**)(id, void *, BOOL))self->_platformSyncPlayheadChangeObserverBlock;
      if (!platformSyncPlayheadChangeObserverBlock) {
        goto LABEL_47;
      }
      v20 = [v11 uuid];
      platformSyncPlayheadChangeObserverBlock[2](platformSyncPlayheadChangeObserverBlock, v20, v26);
LABEL_46:

      goto LABEL_47;
    }
    id v17 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v11 title];
      *(_DWORD *)buf = 138412802;
      CFStringRef v61 = v18;
      __int16 v62 = 2048;
      double v63 = a5;
      __int16 v64 = 2048;
      double v65 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Marking episode %@ as played with elapsed time %f and endOfTrack time %f", buf, 0x20u);
    }
    id v19 = +[NSMutableDictionary dictionaryWithCapacity:1];
    v20 = v19;
    if (v12) {
      [v19 setObject:v12 forKey:@"MTPlayerControllerEpisodeKey"];
    }
    id v21 = +[NSNotificationCenter defaultCenter];
    [v21 postNotificationName:@"MTPlayerControllerNotification_EpisodeMarkedAsPlayed" object:self userInfo:v20];

    [v11 setPlayhead:0.0];
    [v12 setPlayhead:0.0];
    v22 = [v12 contentItem];
    [v22 setElapsedTime:0.0 playbackRate:0.0];

    if (([v12 enqueuedByAnotherUser] & 1) == 0)
    {
      if (v11
        && (+[PFClientUtil isRunningOnHomepod] & 1) == 0)
      {
        [v11 setPlayed:1 manually:0 source:9];
        uint64_t v25 = [v11 podcast];
        [v25 updateCursorPosition:0];
      }
      else
      {
        if (!+[PFClientUtil isRunningOnHomepod]) {
          goto LABEL_27;
        }
        id v23 = [(MTPlayerController *)self compositeManifest];
        unsigned int v24 = [v23 networkUPPEnabled];

        if (!v24) {
          goto LABEL_27;
        }
        uint64_t v25 = [(MTPlayerController *)self playbackPositionController];
        [v25 updatePlaybackPositionWithEpisodeStoreId:[v12 episodeStoreId] completed:1 position:v16 account:&stru_100552C00 completion:0.0];
      }
    }
LABEL_27:
    LOBYTE(v26) = 1;
    goto LABEL_46;
  }
  LOBYTE(v26) = 0;
LABEL_48:

  return v26;
}

- (void)beginObservingTranscriptIdentifierChangesForCurrentItem:(id)a3
{
  id v4 = a3;
  [(MTPropertyChangeQueryObserver *)self->_transcriptIdentifierObserver stop];
  unsigned __int8 v5 = [v4 episodeUuid];
  if ([v5 length])
  {
    unsigned __int8 v6 = [v4 isPlaceholder];

    if ((v6 & 1) == 0)
    {
      id v7 = objc_alloc((Class)MTPropertyChangeQueryObserver);
      uint64_t v8 = kMTEpisodeEntityName;
      id v9 = [v4 episodeUuid];
      id v10 = +[MTEpisode predicateForEpisodeUuid:v9];
      id v11 = (MTPropertyChangeQueryObserver *)[v7 initWithEntityName:v8 predicate:v10];
      transcriptIdentifierObserver = self->_transcriptIdentifierObserver;
      self->_transcriptIdentifierObserver = v11;

      uint64_t v18 = kEpisodeTranscriptIdentifier;
      double v13 = +[NSArray arrayWithObjects:&v18 count:1];
      [(MTPropertyChangeQueryObserver *)self->_transcriptIdentifierObserver setPropertyKeys:v13];

      double v14 = self->_transcriptIdentifierObserver;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10013D3DC;
      v16[3] = &unk_100550320;
      id v17 = v4;
      id v15 = [(MTPropertyChangeQueryObserver *)v14 addResultsChangedHandler:v16];
      [(MTPropertyChangeQueryObserver *)self->_transcriptIdentifierObserver startObserving];
    }
  }
  else
  {
  }
}

- (void)player:(id)a3 willStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5
{
  uint64_t v8 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSPersistentStringFromMTStopReason();
    id v10 = NSPersistentStringFromMTPlaybackAdjustmentInitiator();
    int v14 = 138412546;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will stop player (reason: %@, initiator: %@)", (uint8_t *)&v14, 0x16u);
  }
  id v11 = +[MetricsActivity shared];
  id v12 = [v11 stopType];

  if (v12)
  {
    double v13 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Notification is _during_ an existing stop cause. Assuming first-receiver was the trigger and ignoring this event.", (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    [(MTPlayerController *)self reportStopReason:a4 withInitiator:a5];
  }
}

- (void)player:(id)a3 didStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5
{
  unsigned __int8 v6 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSPersistentStringFromMTStopReason();
    uint64_t v8 = NSPersistentStringFromMTPlaybackAdjustmentInitiator();
    int v12 = 138412546;
    double v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Did stop player (reason: %@, initiator: %@)", (uint8_t *)&v12, 0x16u);
  }
  id v9 = +[MetricsActivity shared];
  id v10 = [v9 stopType];

  if (v10)
  {
    id v11 = [(MTPlayerController *)self player];
    [v11 currentTime];
    -[MTPlayerController recordMTPlayerMetricsForCurrentItemWithCurrentTime:](self, "recordMTPlayerMetricsForCurrentItemWithCurrentTime:");
  }
  else
  {
    id v11 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Playback stop was already recorded, skipping reporting", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)player:(id)a3 failedToStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5
{
  unsigned __int8 v5 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v6 = NSPersistentStringFromMTStopReason();
    id v7 = NSPersistentStringFromMTPlaybackAdjustmentInitiator();
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Failed to stop player (reason: %@, initiator: %@)", (uint8_t *)&v8, 0x16u);
  }
}

- (void)currentItemDidChange
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013DA48;
  v7[3] = &unk_10054D570;
  v7[4] = self;
  +[IMAVPlayer performOnMainQueue:v7];
  id v3 = +[NSDate date];
  [v3 timeIntervalSince1970];
  [(MTPlayerController *)self setMetricsPlayStartTime:(uint64_t)(v4 * 1000.0)];

  unsigned __int8 v5 = [(MTPlayerController *)self player];
  [v5 currentTime];
  -[MTPlayerController setMetricsPlayStartPosition:](self, "setMetricsPlayStartPosition:");

  [(MTPlayerController *)self _recordMetricsForItemDidChange];
  unsigned __int8 v6 = [(MTPlayerController *)self currentItem];
  [(MTPlayerController *)self beginObservingTranscriptIdentifierChangesForCurrentItem:v6];

  [(MTPlayerController *)self setHasReportedThisEpisode:0];
}

- (void)playerHeadWillChange:(id)a3
{
  id v18 = a3;
  double v4 = [v18 userInfo];
  unsigned __int8 v5 = [v4 objectForKey:IMAVPlayerNotificationKey_FromMediaRemote];
  unsigned int v6 = [v5 BOOLValue];

  id v7 = [(MTPlayerController *)self player];
  LODWORD(v5) = [v7 isPlaybackActive];

  if (v5 && v6)
  {
    int v8 = [v18 userInfo];
    id v9 = [v8 objectForKeyedSubscript:IMAVPlayerNotificationKey_NewPlayheadTime];
    [v9 floatValue];
    double v11 = v10;

    int v12 = [v18 userInfo];
    double v13 = [v12 objectForKeyedSubscript:IMAVPlayerNotificationKey_OldPlayheadTime];
    [v13 floatValue];
    double v15 = v14;

    [(MTPlayerController *)self recordMTPlayerMetricsForCurrentItemWithCurrentTime:v15];
    [(MTPlayerController *)self setMetricsPlayStartPosition:v11];
    __int16 v16 = +[NSDate date];
    [v16 timeIntervalSince1970];
    [(MTPlayerController *)self setMetricsPlayStartTime:(uint64_t)(v17 * 1000.0)];
  }
}

- (void)playerPeriodicUpdate
{
  id v3 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "playerPeriodicUpdate", v4, 2u);
  }

  [(MTPlayerController *)self updateEpisodeForPlayerUpdateForceSave:[(MTPlayerController *)self isPlayingLocally] ^ 1];
}

- (void)updateEpisodeForPlayerUpdateForceSave:(BOOL)a3
{
  unsigned __int8 v5 = [(MTPlayerController *)self currentItem];
  if (([v5 isPlaceholder] & 1) == 0)
  {
    unsigned int v6 = [(MTPlayerController *)self isPlayingLocally];
    unsigned __int8 v7 = [(MTPlayerController *)self isSeekingOrScrubbing];
    [(MTPlayerController *)self currentTime];
    double v9 = v8;
    [v5 duration];
    if (v5)
    {
      if ((v7 & 1) == 0)
      {
        double v11 = v10;
        if (v6)
        {
          if (![(MTPlayerController *)self hasReportedThisEpisode])
          {
            int v12 = [v5 storeReportingParams];

            if (v12)
            {
              [(MTPlayerController *)self setHasReportedThisEpisode:1];
              double v13 = +[MTStoreReportingController sharedInstance];
              float v14 = [v5 storeReportingParams];
              double v15 = [(MTPlayerController *)self userManifest];
              [v13 reportPlaybackFromStore:v14 reason:[v15 playReason]];
            }
          }
        }
        __int16 v16 = [v5 episodeUuid];
        if ([v16 length])
        {
          double v17 = +[MTDB sharedInstance];
          id v18 = [v17 mainOrPrivateContext];

          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_10013DEC4;
          v20[3] = &unk_100551C30;
          BOOL v27 = a3;
          id v21 = v18;
          id v22 = v5;
          char v28 = v6;
          id v23 = v16;
          unsigned int v24 = self;
          double v25 = v9;
          double v26 = v11;
          id v19 = v18;
          [v19 performBlockAndWait:v20];
        }
        else
        {
          [(MTPlayerController *)self updateEpisode:0 andPlayerItem:v5 withElapsedTime:0 andDuration:v9 onMediaItemWillChange:v11];
        }
      }
    }
  }
}

- (void)playbackStateDidChange:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "playbackStateDidChange", buf, 2u);
  }

  if (![(MTPlayerController *)self isPlayingLocally])
  {
    unsigned int v6 = [(MTPlayerController *)self userManifest];
    unsigned int v7 = [v6 userActivityContainsPlayhead];

    if (v7) {
      [(MTPlayerController *)self _saveActivityForRestoration];
    }
    double v8 = +[MTBaseProcessor sharedInstance];
    [v8 playerPaused];

    double v9 = [(MTPlayerController *)self currentItem];

    if (v9)
    {
      double v10 = [v4 userInfo];
      double v11 = [v10 objectForKeyedSubscript:IMAVPlayerNotificationKey_OldPlayheadTime];
      [v11 floatValue];
      float v13 = v12;

      float v14 = [v4 userInfo];
      double v15 = [v14 objectForKeyedSubscript:IMAVPlayerNotificationKey_CurrentPlayheadTime];
      [v15 floatValue];
      float v17 = v16;

      id v18 = [(MTPlayerController *)self player];
      if ([v18 state] == (id)2) {
        float v19 = v13;
      }
      else {
        float v19 = v17;
      }
      double v20 = v19;

      [(MTPlayerController *)self recordMTPlayerMetricsForCurrentItemWithCurrentTime:v20];
      [(MTPlayerController *)self recordMetricsForCurrentItem];
    }
  }
  [(MTPlayerController *)self _updateCurrentActivityForPlayState];
  id v21 = +[MTDB sharedInstance];
  id v22 = [v21 mainOrPrivateContext];

  id v23 = [(MTPlayerController *)self currentItem];
  [(MTPlayerController *)self updateEpisodeForPlayerUpdateForceSave:1];
  unsigned __int8 v24 = [(MTPlayerController *)self isPlayingLocally];
  if (v23)
  {
    if (v24)
    {
      double v25 = [(MTPlayerController *)self player];
      [v25 currentTime];
      -[MTPlayerController setMetricsPlayStartPosition:](self, "setMetricsPlayStartPosition:");

      double v26 = +[NSDate date];
      [v26 timeIntervalSince1970];
      [(MTPlayerController *)self setMetricsPlayStartTime:(uint64_t)(v27 * 1000.0)];

      char v28 = v33;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      double v29 = sub_10013E4E8;
    }
    else
    {
      char v28 = v34;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      double v29 = sub_10013E46C;
    }
    v28[2] = v29;
    v28[3] = &unk_10054D9B0;
    id v30 = v22;
    v28[4] = v30;
    id v31 = v23;
    v28[5] = v31;
    [v30 performBlock:v28];

    if ([(MTPlayerController *)self isPlayingLocally])
    {
      if ([v31 upgradeToAlternatePaidVersionIfNeeded])
      {
        double v32 = _MTLogCategoryPlayback();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "We are upgrading the currently playing item after a pause/play", buf, 2u);
        }

        [(MTPlayerController *)self pauseLocalPlayer];
        [v31 invalidateAsset];
        [v31 setPlayhead:0.0];
        [(MTPlayerController *)self playLocalPlayer];
      }
    }
  }
}

- (BOOL)shouldPresentNowPlayingForItem:(id)a3 presentationType:(unint64_t)a4
{
  if (a4 == 2) {
    return 1;
  }
  if (a4 == 1) {
    return [a3 isVideo];
  }
  return 0;
}

- (void)openExternalEpisode:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MTPlayerController *)self player];
  unsigned int v6 = objc_opt_class();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10013E664;
  v8[3] = &unk_10054D570;
  id v9 = v4;
  id v7 = v4;
  [v6 performOnMainQueue:v8];
}

- (BOOL)playWithReason:(unint64_t)a3
{
  return [(MTPlayerController *)self playWithReason:a3 interruptEvent:0];
}

- (BOOL)playWithReason:(unint64_t)a3 interruptEvent:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v6 = +[MTPlaybackContext contextWithReason:a3];
  [v6 setPresentationType:0];
  [v6 setInterruptEvent:v4];
  LOBYTE(v4) = [(MTPlayerController *)self playWithContext:v6];

  return v4;
}

- (BOOL)playWithContext:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MTPlayerController *)self player];
  id v6 = [v5 play];

  [(MTPlayerController *)self _performAfterPlay:v4 playbackStarted:v6];
  return (char)v6;
}

- (void)stopWithReason:(unint64_t)a3 initiator:(unint64_t)a4
{
  id v6 = [(MTPlayerController *)self player];
  [v6 stopWithReason:a3 initiator:a4];
}

- (void)playWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(MTPlayerController *)self player];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10013E8F0;
  v11[3] = &unk_100552C78;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 play:v11 interruptionEvent:[v10 interruptEvent]];
}

- (void)_performAfterPlay:(id)a3 playbackStarted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 source];
  double v8 = [(MTPlayerController *)self userManifest];
  v17[0] = @"interactive";
  id v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isInteractive]);
  v17[1] = @"play_source";
  v18[0] = v9;
  id v10 = +[MTStoreReportingController reportingStringForPlayReason:v7];
  v18[1] = v10;
  double v11 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  +[IMMetrics recordUserAction:@"play" dataSource:v8 withData:v11];

  id v12 = +[MetricsActivity shared];
  [v12 setPlayReason:v7];

  if (v4)
  {
    id v13 = [(MTPlayerController *)self currentItem];
    unsigned int v14 = -[MTPlayerController shouldPresentNowPlayingForItem:presentationType:](self, "shouldPresentNowPlayingForItem:presentationType:", v13, [v6 presentationType]);

    if (v14)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10013EB60;
      v15[3] = &unk_10054D9B0;
      v15[4] = self;
      id v16 = v6;
      +[IMAVPlayer performOnMainQueue:v15];
    }
  }
}

- (void)playItemAtIndex:(unint64_t)a3
{
  id v4 = [(MTPlayerController *)self compositeManifest];
  [v4 setCurrentIndex:a3];
}

- (BOOL)pauseLocalPlayerWithInitiator:(unint64_t)a3
{
  id v4 = [(MTPlayerController *)self player];
  LOBYTE(a3) = [v4 pauseWithInitiator:a3];

  return a3;
}

- (void)pauseLocalPlayer
{
  id v2 = [(MTPlayerController *)self player];
  [v2 pause];
}

- (void)pausePlayerTarget
{
  if ([(MTPlayerController *)self isPlayerTargetLocal])
  {
    [(MTPlayerController *)self pauseLocalPlayer];
  }
  else
  {
    [(MTPlayerController *)self _performMediaRemoteCommand:1];
  }
}

- (void)seekToTime:(double)a3
{
  if ([(MTPlayerController *)self isPlayerTargetLocal])
  {
    id v7 = [(MTPlayerController *)self player];
    [v7 setCurrentTime:a3];
  }
  else
  {
    uint64_t v8 = kMRMediaRemoteOptionPlaybackPosition;
    unsigned __int8 v5 = +[NSNumber numberWithDouble:a3];
    id v9 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

    [(MTPlayerController *)self _performMediaRemoteCommand:24 options:v6];
  }
}

- (void)pausePlayerTargetWithInitiator:(unint64_t)a3
{
  if ([(MTPlayerController *)self isPlayerTargetLocal])
  {
    id v5 = [(MTPlayerController *)self player];
    [v5 pauseWithInitiator:a3];
  }
  else
  {
    [(MTPlayerController *)self _performMediaRemoteCommand:1];
  }
}

- (void)playLocalPlayer
{
  id v2 = [(MTPlayerController *)self player];
  [v2 play];
}

- (void)playPlayerTarget
{
  if ([(MTPlayerController *)self isPlayerTargetLocal])
  {
    [(MTPlayerController *)self playLocalPlayer];
  }
  else
  {
    [(MTPlayerController *)self _performMediaRemoteCommand:0];
  }
}

- (void)stopLocalPlayer
{
  id v2 = [(MTPlayerController *)self player];
  [v2 stop];
}

- (void)stopLocalPlayerWithReason:(unint64_t)a3 initiator:(unint64_t)a4
{
  id v6 = [(MTPlayerController *)self player];
  [v6 stopWithReason:a3 initiator:a4];
}

- (void)stopPlayerTarget
{
  if ([(MTPlayerController *)self isPlayerTargetLocal])
  {
    [(MTPlayerController *)self stopLocalPlayer];
  }
  else
  {
    [(MTPlayerController *)self _performMediaRemoteCommand:3];
  }
}

- (void)stopPlayerTargetWithReason:(unint64_t)a3 initiator:(unint64_t)a4
{
  [(MTPlayerController *)self reportStopReason:a3 withInitiator:a4];

  [(MTPlayerController *)self stopLocalPlayer];
}

- (BOOL)isPlayingLocally
{
  id v2 = [(MTPlayerController *)self player];
  unsigned __int8 v3 = [v2 isPlaybackRequested];

  return v3;
}

- (double)currentTime
{
  id v2 = [(MTPlayerController *)self player];
  [v2 currentTime];
  double v4 = v3;

  return v4;
}

- (void)setCurrentTime:(double)a3
{
  id v4 = [(MTPlayerController *)self player];
  [v4 setCurrentTime:a3];
}

- (BOOL)isSeekingOrScrubbing
{
  id v2 = [(MTPlayerController *)self player];
  unsigned __int8 v3 = [v2 scrubbing];

  return v3;
}

- (void)resolveActivePlayerPathWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPlayerController *)self playerPath];
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10013F2BC;
    v8[3] = &unk_100552CA0;
    id v9 = v4;
    [v5 resolveWithCompletion:v8];
    id v6 = v9;
LABEL_5:

    goto LABEL_6;
  }
  if (v4)
  {
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    CFStringRef v11 = @"No PlayerPath to resolve.";
    id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v6 = +[NSError errorWithDomain:@"MTPlayerControllerErrorDomain" code:-1 userInfo:v7];

    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    goto LABEL_5;
  }
LABEL_6:
}

- (BOOL)isPlayerTargetLocal
{
  id v2 = [(MTPlayerController *)self playerPath];
  unsigned __int8 v3 = v2;
  if (v2)
  {
    id v4 = [v2 route];
    unsigned __int8 v5 = [v4 isDeviceRoute];
  }
  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (id)currentItem
{
  id v2 = [(MTPlayerController *)self player];
  unsigned __int8 v3 = [v2 currentItem];

  return v3;
}

- (id)playingEpisodeUuid
{
  id v2 = [(MTPlayerController *)self currentItem];
  unsigned __int8 v3 = [v2 episodeUuid];

  return v3;
}

- (BOOL)isPlayingEpisodeUuid:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MTPlayerController *)self playingEpisodeUuid];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)volumeControlAvailable
{
  return 0;
}

- (void)presentNowPlayingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = +[MTApplication sharedApplication];
  id v4 = [v6 delegate];
  unsigned __int8 v5 = [v4 appController];
  [v5 presentNowPlayingAnimated:v3];
}

- (void)dismissNowPlayingAnimated:(BOOL)a3
{
}

- (void)playManifest:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)setManifest:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 context:(id)a5 completion:(id)a6
{
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 forceLocal:(BOOL)a5 context:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v15 = a3;
  id v12 = a7;
  id v13 = +[MTSetPlaybackQueueRequest requestWithContext:a6];
  [v13 setManifest:v15];
  if (v10) {
    uint64_t v14 = [v15 isPlaceholder] ^ 1;
  }
  else {
    uint64_t v14 = 0;
  }
  [v13 setStartPlayback:v14];
  [v13 setSuppressMetrics:[v15 isPlaceholder]];
  [v13 setPlaybackDestination:!v9];
  [v13 setCompletion:v12];

  [(MTPlayerController *)self setPlaybackQueue:v13];
}

- (void)setManifestAsDryRun:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = +[MTPlaybackContext contextWithReason:a4];
  BOOL v10 = +[MTSetPlaybackQueueRequest requestWithContext:v11];
  [v10 setManifest:v9];

  [v10 setDryRun:1];
  [v10 setStartPlayback:1];
  [v10 setCompletion:v8];

  [(MTPlayerController *)self setPlaybackQueue:v10];
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 destination:(unint64_t)a5 context:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a3;
  id v14 = +[MTSetPlaybackQueueRequest requestWithContext:a6];
  [v14 setManifest:v13];

  [v14 setStartPlayback:v9];
  [v14 setPlaybackDestination:a5];
  [v14 setCompletion:v12];

  [(MTPlayerController *)self setPlaybackQueue:v14];
}

- (void)setPlaybackQueue:(id)a3
{
  id v4 = a3;
  if ([v4 validate])
  {
    unsigned __int8 v5 = [v4 manifest];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10013F8B8;
    v6[3] = &unk_10054D9B0;
    id v7 = v4;
    id v8 = self;
    [v5 load:v6];
  }
  else
  {
    [v4 finishWithStatus:3];
  }
}

- (void)setManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 completion:(id)a6
{
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 reason:(unint64_t)a5 interactive:(BOOL)a6 completion:(id)a7
{
}

- (void)playManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 completion:(id)a6
{
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 forceLocal:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  BOOL v10 = a5;
  BOOL v11 = a4;
  id v14 = a8;
  id v15 = a3;
  id v16 = +[MTPlaybackContext contextWithReason:a6];
  [v16 setInteractive:v8];
  [(MTPlayerController *)self setManifest:v15 startPlayback:v11 forceLocal:v10 context:v16 completion:v14];
}

- (void)playManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 presentationType:(unint64_t)a6 completion:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a3;
  id v14 = +[MTPlaybackContext contextWithReason:a4];
  [v14 setPresentationType:a6];
  [v14 setInteractive:v8];
  [(MTPlayerController *)self setManifest:v13 startPlayback:1 context:v14 completion:v12];
}

- (void)playManifest:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[MTPlaybackContext contextWithReason:a4];
  [(MTPlayerController *)self setManifest:v6 startPlayback:1 context:v7 completion:0];
}

- (void)_setPlaybackQueue:(id)a3
{
  id v4 = a3;
  if ([v4 playbackDestination] == (id)1
    && ![(MTPlayerController *)self isPlayerTargetLocal])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10013FD78;
    v5[3] = &unk_10054FDE8;
    id v6 = v4;
    id v7 = self;
    +[MTRemoteSetPlaybackQueueUtil setRemotePlaybackQueue:v6 completion:v5];
  }
  else
  {
    [(MTPlayerController *)self _setLocalPlaybackQueue:v4];
  }
}

- (void)_setLocalPlaybackQueue:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  objc_initWeak(&location, self);
  unsigned __int8 v5 = [v4 manifest];
  id v6 = [v4 context];
  unsigned __int8 v7 = [v4 startPlayback];
  [(MTPlayerController *)self setUserManifest:v5];
  BOOL v8 = [[MTCompositeManifest alloc] initWithUpNextManifest:self->_upNextManifest userManifest:v5 loadQueue:self->_loadQueue];
  [(MTPlayerController *)self setCompositeManifest:v8];

  id v9 = [v6 source];
  BOOL v10 = [(MTPlayerController *)self compositeManifest];
  [v10 setPlayReason:v9];

  BOOL v11 = [(MTPlayerController *)self userManifest];
  [v11 setPlayReason:v9];

  id v12 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [v4 startPlayback];
    *(_DWORD *)buf = 67109376;
    unsigned int v28 = v13;
    __int16 v29 = 2048;
    id v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Performing local SetPlaybackQueue with startPlaying %d reason %lu", buf, 0x12u);
  }

  id v14 = [(MTPlayerController *)self player];
  id v15 = [(MTPlayerController *)self compositeManifest];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10014011C;
  v19[3] = &unk_100552CF0;
  id v16 = v4;
  id v20 = v16;
  id v17 = v5;
  id v21 = v17;
  id v18 = v6;
  unsigned __int8 v25 = v7;
  v24[1] = v9;
  id v22 = v18;
  id v23 = self;
  objc_copyWeak(v24, &location);
  [v14 setManifest:v15 completion:v19];

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
}

- (id)_currentEpisodeForManifest:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  float v19 = sub_10005713C;
  id v20 = sub_100057368;
  id v4 = [v3 currentItem];
  id v21 = [v4 episode];

  if (!v17[5])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v5 = [v3 initialEpisodeUuid];
      id v6 = +[MTDB sharedInstance];
      unsigned __int8 v7 = [v6 mainOrPrivateContext];

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100140744;
      v12[3] = &unk_10054E280;
      id v15 = &v16;
      id v8 = v7;
      id v13 = v8;
      id v9 = v5;
      id v14 = v9;
      [v8 performBlockAndWait:v12];
    }
  }
  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (int64_t)_validatePlaybackRequest:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 manifest];
  id v6 = [v4 context];
  unsigned int v7 = [v6 isInteractive];

  if ([v5 count])
  {
    int64_t v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v5 hasOnlyPaidEpisodesWithoutSubscription]) {
        int64_t v8 = 9;
      }
      else {
        int64_t v8 = 3;
      }
    }
    else
    {
      int64_t v8 = 3;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v5 loadStatus] == (id)2) {
      int64_t v8 = 4;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    id v12 = [v5 currentItem];
    if ([v12 isExplicit])
    {
      unsigned int v13 = +[PFRestrictionsController isExplicitContentAllowed];

      if (!v13) {
        int64_t v8 = 4;
      }
    }
    else
    {
    }
  }
  if (v8 == 4) {
    unsigned int v9 = v7;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v9 == 1)
  {
    id v10 = [(MTPlayerController *)self player];
    [(id)objc_opt_class() performOnMainQueue:&stru_100552D10];

    int v11 = 1;
    int64_t v8 = 4;
    goto LABEL_22;
  }
LABEL_21:
  int v11 = 0;
LABEL_22:
  id v14 = [(MTPlayerController *)self _currentEpisodeForManifest:v5];
  if (v14)
  {
    id v15 = [v5 currentItem];
    if (v15)
    {
    }
    else if (([v14 isExternalType] & 1) == 0)
    {
      if ([v14 isRestricted])
      {
        int64_t v8 = 4;
      }
      else
      {
        uint64_t v16 = _MTLogCategoryPlayback();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = [v14 reasonForNotPlayable];
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Playback request failed with status notPlayable, MTEpisodeUnavailableReason %lu", (uint8_t *)&buf, 0xCu);
        }

        int64_t v8 = 5;
      }
    }
  }
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v48 = 0x3032000000;
  double v49 = sub_10005713C;
  BOOL v50 = sub_100057368;
  id v51 = 0;
  if (v14
    || (+[MTReachability sharedInstance],
        id v17 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v18 = [v17 isReachable],
        v17,
        (v18 & 1) != 0))
  {
    float v19 = [v14 managedObjectContext];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100140E20;
    v37[3] = &unk_10054E438;
    unsigned __int8 v39 = &v41;
    id v38 = v14;
    p_long long buf = &buf;
    [v19 performBlockAndWait:v37];

    uint64_t v20 = v42[3];
    if (!v20)
    {
      if (v8 == 1)
      {
        id v21 = [v5 objectAtIndex:0];
        id v22 = [v21 priceType];
        if (MTEpisodePriceTypeFromPersistentString() == 2)
        {
          unsigned int v23 = [v21 paidSubscriptionActive];

          if (v23) {
            int64_t v8 = 1;
          }
          else {
            int64_t v8 = 9;
          }
        }
        else
        {

          int64_t v8 = 1;
        }
      }
      goto LABEL_57;
    }
  }
  else
  {
    uint64_t v20 = 2;
    v42[3] = 2;
  }
  if (v20 == 1) {
    int v24 = v11;
  }
  else {
    int v24 = 0;
  }
  if (((v24 | v7 ^ 1) & 1) == 0)
  {
    unsigned __int8 v25 = [(MTPlayerController *)self player];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100140E9C;
    v36[3] = &unk_100552D38;
    v36[4] = &v41;
    v36[5] = &buf;
    [(id)objc_opt_class() performOnMainQueue:v36];
  }
  if ([v14 isRestricted])
  {
    int64_t v8 = 4;
  }
  else
  {
    uint64_t v26 = v42[3];
    if (v26 == 7)
    {
      int64_t v8 = 9;
    }
    else if (v26 == 2)
    {
      int64_t v8 = 11;
    }
    else
    {
      double v27 = _MTLogCategoryPlayback();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v28 = [v14 reasonForNotPlayable];
        *(_DWORD *)double v45 = 134217984;
        id v46 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Playback request failed with status notPlayable, MTEpisodeUnavailableReason %lu", v45, 0xCu);
      }

      int64_t v8 = 5;
    }
  }
LABEL_57:
  __int16 v29 = +[MTAccountController sharedInstance];
  id v30 = [v29 activeDsid];

  id v31 = [v5 currentItem];
  double v32 = [v31 priceType];
  uint64_t v33 = MTEpisodePriceTypeFromPersistentString();

  if ((v33 & 0xFFFFFFFFFFFFFFFELL) == 2 && !v30)
  {
    id v34 = +[MTAccountController sharedInstance];
    [v34 promptAccountAuthenticationWithDebugReason:@"MTPlayerController authentication request" forced:1];

    int64_t v8 = 10;
  }
  if (v42[3] == 2 && ![v4 startPlayback]) {
    int64_t v8 = 1;
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v41, 8);

  return v8;
}

- (BOOL)_openExternalItemIfNeededForManifest:(id)a3
{
  id v4 = [(MTPlayerController *)self _currentEpisodeForManifest:a3];
  BOOL v5 = [(MTPlayerController *)self _shouldOpenExternalItemForEpisode:v4];
  if (v5) {
    [(MTPlayerController *)self openExternalEpisode:v4];
  }

  return v5;
}

- (BOOL)_shouldOpenExternalItemForEpisode:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v4 = [v3 managedObjectContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014105C;
  v7[3] = &unk_10054E2A8;
  unsigned int v9 = &v10;
  id v5 = v3;
  id v8 = v5;
  [v4 performBlockAndWait:v7];

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (BOOL)_promptToClearUpNextIfNeededForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPlayerController *)self upNextController];
  id v6 = [v5 count];

  unsigned int v7 = [(MTPlayerController *)self upNextController];
  id v8 = [v7 upNextOffset];

  if ([v4 playbackDestination]) {
    unsigned int v9 = [(MTPlayerController *)self isPlayerTargetLocal];
  }
  else {
    unsigned int v9 = 1;
  }
  if (v6 == v8) {
    goto LABEL_9;
  }
  uint64_t v10 = [v4 context];
  if (([v10 isInteractive] & 1) == 0) {
    goto LABEL_8;
  }
  int v11 = [v4 context];
  if ([v11 upNextQueueIntent])
  {

LABEL_8:
    goto LABEL_9;
  }
  if ([v4 playbackDestination] != (id)1) {
    unsigned int v9 = 0;
  }

  if (v9 == 1)
  {
    int64_t v14 = v6 - v8;
    id v15 = +[NSBundle mainBundle];
    uint64_t v16 = [v15 localizedStringForKey:@"CLEAR_QUEUE_PROMPT_TITLE" value:&stru_10056A8A0 table:0];

    id v17 = +[NSBundle mainBundle];
    unsigned __int8 v18 = [v17 localizedStringForKey:@"CLEAR_QUEUE_PROMPT_MESSAGE" value:&stru_10056A8A0 table:0];
    float v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v14);

    uint64_t v20 = [(MTPlayerController *)self player];
    id v21 = objc_opt_class();
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    id v24[2] = sub_1001412E4;
    v24[3] = &unk_10054DFE8;
    v24[4] = self;
    id v25 = v4;
    id v26 = v16;
    id v27 = v19;
    id v22 = v19;
    id v23 = v16;
    [v21 performOnMainQueue:v24];

    BOOL v12 = 1;
    goto LABEL_10;
  }
LABEL_9:
  BOOL v12 = 0;
LABEL_10:

  return v12;
}

- (void)_showGenericPromptToClearUpNextWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"CLEAR_QUEUE_PROMPT_TITLE" value:&stru_10056A8A0 table:0];

  unsigned int v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"CLEAR_QUEUE_PROMPT_MESSAGE" value:&stru_10056A8A0 table:0];
  unsigned int v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, 1);

  uint64_t v10 = [(MTPlayerController *)self player];
  int v11 = objc_opt_class();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001414F4;
  v15[3] = &unk_10054DFE8;
  v15[4] = self;
  id v16 = v4;
  id v17 = v6;
  id v18 = v9;
  id v12 = v9;
  id v13 = v6;
  id v14 = v4;
  [v11 performOnMainQueue:v15];
}

- (id)_alertControllerForClearingOrKeepingUpNextWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:1];
  id v6 = +[NSBundle mainBundle];
  unsigned int v7 = [v6 localizedStringForKey:@"QUEUE_KEEP_CONFIRM" value:&stru_10056A8A0 table:0];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  id v24[2] = sub_100141848;
  v24[3] = &unk_10054F290;
  id v8 = v4;
  id v25 = v8;
  id v26 = self;
  unsigned int v9 = +[UIAlertAction actionWithTitle:v7 style:0 handler:v24];

  [v5 addAction:v9];
  uint64_t v10 = +[NSBundle mainBundle];
  int v11 = [v10 localizedStringForKey:@"QUEUE_CLEAR_CONFIRM" value:&stru_10056A8A0 table:0];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100141914;
  v21[3] = &unk_10054F290;
  id v12 = v8;
  id v22 = v12;
  id v23 = self;
  id v13 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v21];

  [v5 addAction:v13];
  id v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"Cancel" value:&stru_10056A8A0 table:0];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001419E0;
  v19[3] = &unk_100550790;
  id v20 = v12;
  id v16 = v12;
  id v17 = +[UIAlertAction actionWithTitle:v15 style:1 handler:v19];

  [v5 addAction:v17];

  return v5;
}

- (void)clearPlayerManifestWithCompletion:(id)a3
{
  id v4 = a3;
  self->_shouldFindSomethingToPlay = 0;
  id v5 = [(MTPlayerController *)self player];
  [v5 setManifest:0 completion:0];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100141AB4;
  v7[3] = &unk_10054D738;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MTPlayerController *)self _restoreManifestIfNeededWithCompletion:v7 useEmptyManifest:1];
}

- (void)restorePlayerManifestWithCompletion:(id)a3
{
  unsigned int v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  unsigned int v9 = sub_100141BD4;
  uint64_t v10 = &unk_10054D738;
  int v11 = self;
  id v12 = a3;
  id v4 = v12;
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, &v7);
  id v6 = [(MTPlayerController *)self restorationQueue];
  dispatch_async(v6, v5);
}

- (void)_onQueueRestorePlayerManifestWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_block_t v5 = [(MTPlayerController *)self restorationCompletions];
    id v6 = [v4 copy];
    id v7 = objc_retainBlock(v6);
    [v5 addObject:v7];

    uint64_t v8 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unsigned int v9 = [(MTPlayerController *)self restorationCompletions];
      *(_DWORD *)long long buf = 134217984;
      id v14 = [v9 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Added manifest restoration completion. Count = %lu", buf, 0xCu);
    }
  }
  if (![(MTPlayerController *)self isManifestRestorationOngoing])
  {
    [(MTPlayerController *)self setIsManifestRestorationOngoing:1];
    if ([(MTPlayerController *)self isPlayerManifestRestored])
    {
      [(MTPlayerController *)self _invokeRestorationCompletions];
    }
    else
    {
      [(id)objc_opt_class() _loadActivityForRestoration];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100141DA8;
      v11[3] = &unk_10054D9B0;
      v11[4] = self;
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = v12;
      +[IMAVPlayer performOnMainQueue:v11];
    }
  }
}

- (void)_invokeRestorationCompletions
{
  id v3 = [(MTPlayerController *)self restorationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100142154;
  block[3] = &unk_10054D570;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_restoreEmptyManifestIfNeededWithCompletion:(id)a3
{
}

- (void)_restoreDefaultManifestIfNeededWithCompletion:(id)a3
{
}

- (void)_restoreManifestIfNeededWithCompletion:(id)a3 useEmptyManifest:(BOOL)a4
{
  id v6 = (void (**)(void))a3;
  id v7 = [(MTPlayerController *)self player];
  uint64_t v8 = [v7 manifest];

  if (v8)
  {
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    if (a4
      || (+[MTPlaybackQueueFactory playMyPodcastsWithOrder:0], (unsigned int v9 = (MTItemListManifest *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      unsigned int v9 = [[MTItemListManifest alloc] initWithItems:&__NSArray0__struct];
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100142538;
    v10[3] = &unk_10054ECB8;
    int v11 = v6;
    [(MTPlayerController *)self setManifest:v9 startPlayback:0 forceLocal:1 reason:1 interactive:0 completion:v10];
  }
}

- (void)restoreFromUserActivity:(id)a3 startPlayback:(BOOL)a4 reason:(unint64_t)a5 interactive:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001426DC;
  v16[3] = &unk_100552D88;
  objc_copyWeak(v19, &location);
  id v14 = v12;
  BOOL v20 = a4;
  id v17 = v14;
  v19[1] = (id)a5;
  BOOL v21 = a6;
  id v15 = v13;
  id v18 = v15;
  +[MTPlayerManifest restoreActivity:v14 completion:v16];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

- (void)restoreFromUserActivity:(id)a3 withManifest:(id)a4 startPlayback:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001428BC;
  v20[3] = &unk_100552E18;
  id v17 = v15;
  id v21 = v17;
  id v18 = v16;
  id v23 = v18;
  v24[1] = (id)a6;
  id v19 = v14;
  id v22 = v19;
  objc_copyWeak(v24, &location);
  BOOL v25 = a5;
  BOOL v26 = a7;
  +[IMAVPlayer performOnMainQueue:v20];
  objc_destroyWeak(v24);

  objc_destroyWeak(&location);
}

- (void)setCurrentActivity:(id)a3
{
  objc_storeStrong((id *)&self->_currentActivity, a3);
  [(MTPlayerController *)self _updateCurrentActivityForPlayState];

  [(MTPlayerController *)self _saveActivityForRestoration];
}

- (void)_updateCurrentActivityForPlayState
{
  id v3 = [(MTPlayerController *)self player];
  unsigned int v4 = [v3 isPlaybackRequested];

  if (v4)
  {
    [(MTPlayerController *)self _currentActivityBecomeCurrent];
  }
}

- (void)_currentActivityBecomeCurrent
{
  id v3 = [(MTPlayerController *)self currentActivity];

  if (v3)
  {
    unsigned int v4 = [(MTPlayerController *)self currentActivity];
    [v4 setDelegate:self];

    dispatch_block_t v5 = [(MTPlayerController *)self currentActivity];
    [v5 setSupportsContinuationStreams:1];

    id v6 = [(MTPlayerController *)self currentActivity];
    [v6 becomeCurrent];
  }
}

- (void)_saveActivityForRestoration
{
  id v3 = [(MTPlayerController *)self currentActivity];
  unsigned int v4 = +[NSMutableDictionary dictionaryWithCapacity:5];
  dispatch_block_t v5 = [v3 activityType];
  [v4 setObject:v5 forKeyedSubscript:@"type"];

  id v6 = [v3 title];
  [v4 setObject:v6 forKeyedSubscript:@"title"];

  id v7 = [v3 userInfo];
  [v4 setObject:v7 forKeyedSubscript:@"userInfo"];

  uint64_t v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 _suggestedActionType]);
  [v4 setObject:v8 forKeyedSubscript:@"suggestedActionType"];

  unsigned int v9 = [v3 _options];
  [v4 setObject:v9 forKeyedSubscript:@"options"];

  id v10 = [(MTPlayerController *)self restorationQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100142E18;
  v12[3] = &unk_10054D9B0;
  void v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async(v10, v12);
}

+ (id)_loadActivityForRestoration
{
  id v2 = [(id)objc_opt_class() _activityRestorationPath];
  id v3 = +[NSData dataWithContentsOfURL:v2];
  if (v3)
  {
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    v20[3] = objc_opt_class();
    void v20[4] = objc_opt_class();
    v20[5] = objc_opt_class();
    v20[6] = objc_opt_class();
    v20[7] = objc_opt_class();
    v20[8] = objc_opt_class();
    v20[9] = objc_opt_class();
    unsigned int v4 = +[NSArray arrayWithObjects:v20 count:10];
    uint64_t v5 = +[NSSet setWithArray:v4];

    id v16 = (void *)v5;
    id v17 = 0;
    id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v5 fromData:v3 error:&v17];
    id v7 = v17;
    if (v7)
    {
      uint64_t v8 = _MTLogCategoryPlayback();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to restore activity with error %@", buf, 0xCu);
      }
    }
    unsigned int v9 = [v6 objectForKey:@"type"];
    id v10 = [v6 objectForKey:@"title"];
    id v11 = [v6 objectForKey:@"userInfo"];
    id v12 = [v6 objectForKey:@"suggestedActionType"];
    id v13 = [v6 objectForKey:@"options"];
    if (v9)
    {
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        unsigned int v9 = 0;
      }
    }
    if (v10)
    {
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v10 = 0;
      }
    }
    if (v11)
    {
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v11 = 0;
      }
    }
    if (v12)
    {
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v12 = 0;
      }
    }
    if (v13)
    {
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v13 = 0;
      }
    }
    if (v9)
    {
      id v14 = objc_msgSend(objc_alloc((Class)NSUserActivity), "_initWithTypeIdentifier:suggestedActionType:options:", v9, objc_msgSend(v12, "integerValue"), v13);
      [v14 setTitle:v10];
      [v14 setUserInfo:v11];
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)_activityRestorationPath
{
  id v2 = +[MTConstants sharedDocumentsDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"play_queue_restoration.data"];

  return v3;
}

- (void)_localPlayerPath
{
  id v2 = (const void *)MRNowPlayingClientCreate();
  id v3 = (const void *)MRNowPlayingPlayerCreate();
  unsigned int v4 = (void *)MRNowPlayingPlayerPathCreate();
  if (v2) {
    CFRelease(v2);
  }
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (void)_performMediaRemoteCommand:(unsigned int)a3 options:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ([(MTPlayerController *)self isPlayerTargetLocal])
  {
    [(MTPlayerController *)self _sendMediaRemoteCommand:v4 toPlayer:[(MTPlayerController *)self _localPlayerPath]];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001434F8;
    v7[3] = &unk_100552E40;
    void v7[4] = self;
    int v9 = v4;
    id v8 = v6;
    [(MTPlayerController *)self resolveActivePlayerPathWithCompletion:v7];
  }
}

- (void)_performMediaRemoteCommand:(unsigned int)a3
{
}

- (void)_sendMediaRemoteCommand:(unsigned int)a3 toPlayer:(void *)a4
{
}

- (void)_sendMediaRemoteCommand:(unsigned int)a3 toPlayer:(void *)a4 options:(id)a5
{
  id v5 = a5;
  uint64_t v9 = kMRMediaRemoteOptionDirectUserInteraction;
  id v10 = &__kCFBooleanTrue;
  id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v7 = [v6 mutableCopy];

  if (v5) {
    [v7 addEntriesFromDictionary:v5];
  }
  id v8 = dispatch_get_global_queue(0, 0);
  MRMediaRemoteSendCommandToPlayer();
}

- (void)recordMTPlayerMetricsForCurrentItemWithCurrentTime:(double)a3
{
  if (+[MTPrivacyUtil allowReporting])
  {
    id v5 = [(MTPlayerController *)self currentItem];
    id v6 = v5;
    if (!v5
      || ![v5 podcastStoreId]
      || ([(MTPlayerController *)self metricsPlayStartPosition], double v8 = a3 - v7, v8 < 0.5))
    {
LABEL_40:

      return;
    }
    uint64_t v9 = +[MTReachability sharedInstance];
    uint64_t v10 = [v9 isReachable] ^ 1;

    id v11 = +[MTAccountController sharedInstance];
    id v12 = [v11 activeAccount];
    BOOL v13 = v12 != 0;

    v76[0] = @"com.apple.podcasts";
    v75[0] = @"app";
    v75[1] = @"playStartTime";
    v60 = +[NSNumber numberWithLongLong:[(MTPlayerController *)self metricsPlayStartTime]];
    v76[1] = v60;
    v75[2] = @"playStartPosition";
    [(MTPlayerController *)self metricsPlayStartPosition];
    v59 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v76[2] = v59;
    v75[3] = @"playDuration";
    id v14 = +[NSNumber numberWithDouble:v8];
    v76[3] = v14;
    v75[4] = @"playbackSpeed";
    id v15 = [(MTPlayerController *)self player];
    id v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 playbackSpeed]);
    v76[4] = v16;
    v75[5] = @"contentType";
    uint64_t v17 = [v6 priceType];
    id v18 = (void *)v17;
    CFStringRef v19 = &stru_10056A8A0;
    if (v17) {
      CFStringRef v19 = (const __CFString *)v17;
    }
    v76[5] = v19;
    v75[6] = @"isOffline";
    BOOL v20 = +[NSNumber numberWithBool:v10];
    v76[6] = v20;
    v75[7] = @"isSignedIn";
    id v21 = +[NSNumber numberWithBool:v13];
    v76[7] = v21;
    id v22 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:8];
    id v23 = [v22 mutableCopy];

    int v24 = +[MetricsActivity shared];
    uint64_t v25 = [v24 playContext];
    BOOL v26 = (void *)v25;
    if (v25) {
      CFStringRef v27 = (const __CFString *)v25;
    }
    else {
      CFStringRef v27 = &stru_10056A8A0;
    }
    [v23 setObject:v27 forKeyedSubscript:@"playContext"];

    id v28 = +[MetricsActivity shared];
    uint64_t v29 = [v28 stopContext];
    id v30 = (void *)v29;
    if (v29) {
      CFStringRef v31 = (const __CFString *)v29;
    }
    else {
      CFStringRef v31 = &stru_10056A8A0;
    }
    [v23 setObject:v31 forKeyedSubscript:@"stopReason"];

    double v32 = +[MetricsActivity shared];
    uint64_t v33 = [v32 stopType];
    id v34 = (void *)v33;
    if (v33) {
      CFStringRef v35 = (const __CFString *)v33;
    }
    else {
      CFStringRef v35 = &stru_10056A8A0;
    }
    [v23 setObject:v35 forKeyedSubscript:@"stopType"];

    NSLog(@"!!! Clearing stopInfo");
    float v36 = +[MetricsActivity shared];
    [v36 clearStopInfo];

    v37 = +[NSUserDefaults standardUserDefaults];
    id v38 = [v37 stringForKey:@"canary"];

    if ([v38 length]) {
      [v23 setObject:v38 forKeyedSubscript:@"canary"];
    }
    unsigned __int8 v39 = [(MTPlayerController *)self highlightsProvider];
    if ((objc_msgSend(v39, "isSharedContentWithContentAdamId:", objc_msgSend(v6, "episodeStoreId")) & 1) == 0)
    {
      CFStringRef v40 = [(MTPlayerController *)self highlightsProvider];
      if (!objc_msgSend(v40, "isSharedContentWithContentAdamId:", objc_msgSend(v6, "podcastStoreId")))
      {
        id v46 = [(MTPlayerController *)self highlightsProvider];
        unsigned __int8 v47 = [v46 isSharedContentWithContentAdamId:[v6 channelStoreId]];

        if ((v47 & 1) == 0) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
    }
LABEL_22:
    uint64_t v41 = +[NSNumber numberWithBool:1];
    [v23 setObject:v41 forKeyedSubscript:@"sharedContent"];

LABEL_23:
    if ([v6 isAppleMusicEpisode])
    {
      id v64 = 0;
      v42 = +[MTMusicSubscriptionInfoLoader loadIfNeededAndReturnError:&v64];
      id v43 = v64;
      if (v43)
      {
        uint64_t v44 = _MTLogCategoryMetrics();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v66 = v43;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Unable to get Music Subscription Info with error: %@", buf, 0xCu);
        }
      }
      else
      {
        [v23 setObject:v42 forKeyedSubscript:@"musicSubscriptionData"];
      }
    }
    else if ([v6 isAppleNewsEpisode])
    {
      if ([v6 paidSubscriptionActive]) {
        CFStringRef v45 = @"news+";
      }
      else {
        CFStringRef v45 = @"none";
      }
      [v23 setObject:v45 forKeyedSubscript:@"newsSubscriptionData"];
    }
    uint64_t v48 = +[NSDate dateWithTimeIntervalSince1970:(double)[(MTPlayerController *)self metricsPlayStartTime] / 1000.0];
    double v49 = _MTLogCategoryMetrics();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v50 = +[AMSDefaults metricsCanaryIdentifier];
      [(MTPlayerController *)self metricsPlayStartPosition];
      uint64_t v52 = v51;
      uint64_t v53 = [v6 title];
      *(_DWORD *)long long buf = 138413314;
      id v66 = v50;
      __int16 v67 = 2112;
      v68 = v48;
      __int16 v69 = 2048;
      uint64_t v70 = v52;
      __int16 v71 = 2048;
      double v72 = v8;
      __int16 v73 = 2112;
      v74 = v53;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "canary: %@, playStartTime: %@, playStartPosition: %f, playDuration: %f, item: %@", buf, 0x34u);
    }
    v54 = [[MTEpisodeMetricDataSource alloc] initWithPlayerItem:v6];
    v55 = +[AnalyticsIdentifierManager sharedInstance];
    id v56 = [v55 identifierPromise];
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_100143EC4;
    v61[3] = &unk_10054DBE8;
    id v62 = v23;
    double v63 = v54;
    v57 = v54;
    id v58 = v23;
    [v56 addFinishBlock:v61];

    goto LABEL_40;
  }
}

- (void)recordMetricsForCurrentItem
{
  id v3 = [(MTPlayerController *)self currentItem];
  uint64_t v4 = v3;
  if (v3 && ([v3 isPlaceholder] & 1) == 0)
  {
    id v5 = [(MTPlayerController *)self player];
    id v6 = [v5 playerItem];

    double v7 = [(MTPlayerController *)self recordedPlayEventsForCurrentItem];
    objc_sync_enter(v7);
    double v8 = [v4 url];
    uint64_t v9 = [(MTPlayerController *)self lastRecordedItemURL];
    unsigned __int8 v10 = [v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      id v11 = [(MTPlayerController *)self recordedPlayEventsForCurrentItem];
      [v11 removeAllObjects];

      [(MTPlayerController *)self setLastRecordedItemURL:v8];
    }

    objc_sync_exit(v7);
    if (v6)
    {
      id v12 = +[MTDB sharedInstance];
      BOOL v13 = [v12 privateQueueContext];

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1001441E8;
      v15[3] = &unk_10054DFE8;
      id v16 = v6;
      id v17 = v13;
      id v18 = v4;
      CFStringRef v19 = self;
      id v14 = v13;
      [v14 performBlock:v15];
    }
  }
}

- (void)recordMetricsEventForAccessLog:(id)a3 playerItem:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (([v6 isPlaceholder] & 1) == 0)
  {
    double v7 = [[MTEpisodeMetricDataSource alloc] initWithPlayerItem:v6];
    double v8 = +[MTPlayMetricsEvent eventWithAccessLog:v13 dataSource:v7];
    uint64_t v9 = [(MTPlayerController *)self recordedPlayEventsForCurrentItem];
    objc_sync_enter(v9);
    unsigned __int8 v10 = [(MTPlayerController *)self recordedPlayEventsForCurrentItem];
    unsigned __int8 v11 = [v10 containsObject:v8];

    if ((v11 & 1) == 0)
    {
      [v8 record];
      id v12 = [(MTPlayerController *)self recordedPlayEventsForCurrentItem];
      [v12 addObject:v8];
    }
    objc_sync_exit(v9);
  }
}

- (void)recordMetricsEventForErrorLog:(id)a3 withEpisode:(id)a4
{
  id v5 = a3;
  v30[0] = @"date";
  id v6 = a4;
  uint64_t v7 = [v5 date];
  objc_opt_class();
  objc_opt_class();
  uint64_t v29 = (void *)v7;
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    CFStringRef v27 = [v5 date];
    [v27 timeIntervalSinceReferenceDate];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    uint64_t v9 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = &off_1005799E0;
  }
  id v28 = v9;
  v31[0] = v9;
  v30[1] = @"uri";
  uint64_t v10 = [v5 URI];
  unsigned __int8 v11 = (void *)v10;
  if (v10) {
    CFStringRef v12 = (const __CFString *)v10;
  }
  else {
    CFStringRef v12 = &stru_10056A8A0;
  }
  v31[1] = v12;
  v30[2] = @"server_address";
  uint64_t v13 = [v5 serverAddress];
  id v14 = (void *)v13;
  if (v13) {
    CFStringRef v15 = (const __CFString *)v13;
  }
  else {
    CFStringRef v15 = &stru_10056A8A0;
  }
  v31[2] = v15;
  v30[3] = @"playback_session_id";
  uint64_t v16 = [v5 playbackSessionID];
  id v17 = (void *)v16;
  if (v16) {
    CFStringRef v18 = (const __CFString *)v16;
  }
  else {
    CFStringRef v18 = &stru_10056A8A0;
  }
  v31[3] = v18;
  v30[4] = @"error_status_code";
  CFStringRef v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 errorStatusCode]);
  v31[4] = v19;
  v30[5] = @"error_domain";
  uint64_t v20 = [v5 errorDomain];
  id v21 = (void *)v20;
  if (v20) {
    CFStringRef v22 = (const __CFString *)v20;
  }
  else {
    CFStringRef v22 = &stru_10056A8A0;
  }
  v31[5] = v22;
  v30[6] = @"error_comment";
  uint64_t v23 = [v5 errorComment];
  int v24 = (void *)v23;
  if (v23) {
    CFStringRef v25 = (const __CFString *)v23;
  }
  else {
    CFStringRef v25 = &stru_10056A8A0;
  }
  v31[6] = v25;
  BOOL v26 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:7];
  +[IMMetrics recordUserAction:@"play_error" dataSource:v6 withData:v26];

  if (isKindOfClass)
  {
  }
}

- (void)_recordMetricsForItemDidChange
{
  if (+[MTPrivacyUtil allowReporting])
  {
    id v3 = [(MTPlayerController *)self currentItem];
    uint64_t v4 = v3;
    if (v3 && ([v3 isPlaceholder] & 1) == 0)
    {
      id v5 = [(MTPlayerController *)self compositeManifest];
      id v6 = [v5 metricsContentIdentifier];

      if (v6)
      {
        uint64_t v7 = +[MTDB sharedInstance];
        double v8 = [v7 privateQueueContext];

        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_1001448CC;
        v10[3] = &unk_10054DFE8;
        id v11 = v8;
        id v12 = v4;
        uint64_t v13 = self;
        id v14 = v6;
        id v9 = v8;
        [v9 performBlock:v10];
      }
    }
  }
}

- (void)userActivity:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5
{
  id v7 = a5;
  [(MTPlayerController *)self reportStopReason:6 withInitiator:2];
  id v6 = [(MTPlayerController *)self player];
  [v6 pause];

  [v7 close];
}

- (void)reportStopReason:(unint64_t)a3 withInitiator:(unint64_t)a4
{
  id v6 = +[MetricsActivity shared];
  [v6 setStopReason:a3];

  id v7 = +[MetricsActivity shared];
  [v7 setInitiator:a4];
}

- (void)updateUPPEpisodeUuid:(id)a3 bookmarkTime:(double)a4
{
  id v9 = a3;
  id v6 = [(MTPlayerController *)self currentItem];
  if (v6)
  {
    if (![(MTPlayerController *)self isPlayingLocally])
    {
      id v7 = [v6 episodeUuid];
      unsigned int v8 = [v9 isEqualToString:v7];

      if (v8) {
        [(MTPlayerController *)self setCurrentTime:a4];
      }
    }
  }
}

- (void)setArtworkProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPlayerController *)self playbackQueueController];
  [v5 setArtworkProvider:v4];
}

- (MTPlayerFailureDialogProxy)dialogProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dialogProxy);

  return (MTPlayerFailureDialogProxy *)WeakRetained;
}

- (void)setDialogProxy:(id)a3
{
}

- (IMAVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (MTUpNextController)upNextController
{
  return self->_upNextController;
}

- (void)setUpNextController:(id)a3
{
}

- (MTPlaybackQueueController)playbackQueueController
{
  return self->_playbackQueueController;
}

- (void)setPlaybackQueueController:(id)a3
{
}

- (MTCompositeManifest)compositeManifest
{
  return self->_compositeManifest;
}

- (void)setCompositeManifest:(id)a3
{
}

- (MTUpNextManifest)upNextManifest
{
  return self->_upNextManifest;
}

- (void)setUpNextManifest:(id)a3
{
}

- (MTPlayerManifest)userManifest
{
  return self->_userManifest;
}

- (void)setUserManifest:(id)a3
{
}

- (BOOL)isPlayingFullScreenVideo
{
  return self->_isPlayingFullScreenVideo;
}

- (void)setIsPlayingFullScreenVideo:(BOOL)a3
{
  self->_isPlayingFullScreenVideo = a3;
}

- (HighlightsProviderObjCProtocol)highlightsProvider
{
  return self->_highlightsProvider;
}

- (void)setHighlightsProvider:(id)a3
{
}

- (MTNowPlayingArtworkProvider)artworkProvider
{
  return self->_artworkProvider;
}

- (id)platformSyncPlayheadChangeObserverBlock
{
  return self->_platformSyncPlayheadChangeObserverBlock;
}

- (void)setPlatformSyncPlayheadChangeObserverBlock:(id)a3
{
}

- (NSString)previousPlayingEpisodeUuid
{
  return self->_previousPlayingEpisodeUuid;
}

- (void)setPreviousPlayingEpisodeUuid:(id)a3
{
}

- (BOOL)hasReportedThisEpisode
{
  return self->_hasReportedThisEpisode;
}

- (void)setHasReportedThisEpisode:(BOOL)a3
{
  self->_hasReportedThisEpisode = a3;
}

- (double)lastPlaybackSaveTime
{
  return self->_lastPlaybackSaveTime;
}

- (void)setLastPlaybackSaveTime:(double)a3
{
  self->_lastPlaybackSaveTime = a3;
}

- (int64_t)metricsPlayStartTime
{
  return self->_metricsPlayStartTime;
}

- (void)setMetricsPlayStartTime:(int64_t)a3
{
  self->_metricsPlayStartTime = a3;
}

- (double)metricsPlayStartPosition
{
  return self->_metricsPlayStartPosition;
}

- (void)setMetricsPlayStartPosition:(double)a3
{
  self->_metricsPlayStartPosition = a3;
}

- (MTPlaybackPositionController)playbackPositionController
{
  return self->_playbackPositionController;
}

- (void)setPlaybackPositionController:(id)a3
{
}

- (double)lastPlaybackPositionSaveTime
{
  return self->_lastPlaybackPositionSaveTime;
}

- (void)setLastPlaybackPositionSaveTime:(double)a3
{
  self->_lastPlaybackPositionSaveTime = a3;
}

- (MTMediaRemoteController)mediaRemoteController
{
  return self->_mediaRemoteController;
}

- (void)setMediaRemoteController:(id)a3
{
}

- (NSUserActivity)currentActivity
{
  return self->_currentActivity;
}

- (BOOL)shouldFindSomethingToPlay
{
  return self->_shouldFindSomethingToPlay;
}

- (void)setShouldFindSomethingToPlay:(BOOL)a3
{
  self->_shouldFindSomethingToPlay = a3;
}

- (BOOL)isPlayerManifestRestored
{
  return self->_playerManifestRestored;
}

- (void)setPlayerManifestRestored:(BOOL)a3
{
  self->_playerManifestRestored = a3;
}

- (OS_dispatch_queue)restorationQueue
{
  return self->_restorationQueue;
}

- (void)setRestorationQueue:(id)a3
{
}

- (OS_dispatch_queue)dataAccessQueue
{
  return self->_dataAccessQueue;
}

- (void)setDataAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)loadQueue
{
  return self->_loadQueue;
}

- (void)setLoadQueue:(id)a3
{
}

- (NSMutableArray)restorationCompletions
{
  return self->_restorationCompletions;
}

- (void)setRestorationCompletions:(id)a3
{
}

- (BOOL)isManifestRestorationOngoing
{
  return self->_isManifestRestorationOngoing;
}

- (void)setIsManifestRestorationOngoing:(BOOL)a3
{
  self->_isManifestRestorationOngoing = a3;
}

- (NSTimer)setPlaybackQueueRequestTimeoutTimer
{
  return self->_setPlaybackQueueRequestTimeoutTimer;
}

- (void)setSetPlaybackQueueRequestTimeoutTimer:(id)a3
{
}

- (NSMutableSet)recordedPlayEventsForCurrentItem
{
  return self->_recordedPlayEventsForCurrentItem;
}

- (void)setRecordedPlayEventsForCurrentItem:(id)a3
{
}

- (NSURL)lastRecordedItemURL
{
  return self->_lastRecordedItemURL;
}

- (void)setLastRecordedItemURL:(id)a3
{
}

- (MTCoreDataKeyRequestStorage)keyStorage
{
  return self->_keyStorage;
}

- (void)setKeyStorage:(id)a3
{
}

- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager
{
  return self->_secureDownloadRenewalManager;
}

- (void)setSecureDownloadRenewalManager:(id)a3
{
}

- (PFFairPlayValidationManager)validationManager
{
  return self->_validationManager;
}

- (void)setValidationManager:(id)a3
{
}

- (PFFairPlayInvalidationManager)invalidationManager
{
  return self->_invalidationManager;
}

- (void)setInvalidationManager:(id)a3
{
}

- (MTPropertyChangeQueryObserver)transcriptIdentifierObserver
{
  return self->_transcriptIdentifierObserver;
}

- (void)setTranscriptIdentifierObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptIdentifierObserver, 0);
  objc_storeStrong((id *)&self->_invalidationManager, 0);
  objc_storeStrong((id *)&self->_validationManager, 0);
  objc_storeStrong((id *)&self->_secureDownloadRenewalManager, 0);
  objc_storeStrong((id *)&self->_keyStorage, 0);
  objc_storeStrong((id *)&self->_lastRecordedItemURL, 0);
  objc_storeStrong((id *)&self->_recordedPlayEventsForCurrentItem, 0);
  objc_storeStrong((id *)&self->_setPlaybackQueueRequestTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_restorationCompletions, 0);
  objc_storeStrong((id *)&self->_loadQueue, 0);
  objc_storeStrong((id *)&self->_dataAccessQueue, 0);
  objc_storeStrong((id *)&self->_restorationQueue, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_mediaRemoteController, 0);
  objc_storeStrong((id *)&self->_playbackPositionController, 0);
  objc_storeStrong((id *)&self->_previousPlayingEpisodeUuid, 0);
  objc_storeStrong(&self->_platformSyncPlayheadChangeObserverBlock, 0);
  objc_storeStrong((id *)&self->_artworkProvider, 0);
  objc_storeStrong((id *)&self->_highlightsProvider, 0);
  objc_storeStrong((id *)&self->_userManifest, 0);
  objc_storeStrong((id *)&self->_upNextManifest, 0);
  objc_storeStrong((id *)&self->_compositeManifest, 0);
  objc_storeStrong((id *)&self->_playbackQueueController, 0);
  objc_storeStrong((id *)&self->_upNextController, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_player, 0);

  objc_destroyWeak((id *)&self->_dialogProxy);
}

@end