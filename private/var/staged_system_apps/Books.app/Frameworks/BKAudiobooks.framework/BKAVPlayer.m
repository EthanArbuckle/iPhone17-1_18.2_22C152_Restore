@interface BKAVPlayer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTolerance;
- (AVAsset)asset;
- (AVAssetResourceLoaderDelegate)resourceLoader;
- (AVContentKeySession)contentKeySession;
- (AVPlayer)player;
- (AVPlayerItem)currentItem;
- (BKAVPlayer)initWithResourceLoader:(id)a3;
- (BKAVPlayerDelegate)delegate;
- (BKPendingAssetAuthorization)pendingAssetAuth;
- (BOOL)_isStreamingAssetURL;
- (BOOL)isAudibleDRMGroupAuthorized;
- (BOOL)isCurrentTimeValid;
- (BOOL)isLoadingResources;
- (BOOL)isPlaybackPending;
- (BOOL)isPlaying;
- (BOOL)isPlayingPreview;
- (BOOL)isScrubPausable;
- (BOOL)isScrubbing;
- (BOOL)isStalling;
- (BOOL)isStopping;
- (BOOL)isStreaming;
- (BOOL)needsToUpdateTimeObservers;
- (BOOL)wasInterrupted;
- (BOOL)wasInterruptedEarly;
- (BOOL)wasPlayingBeforeScrubbing;
- (BUCoalescingCallBlock)coalescedLoadedTimeRanges;
- (NSArray)currentLoadedTimeRanges;
- (NSDate)currentDate;
- (NSError)lastError;
- (NSMutableArray)observedTimes;
- (NSMutableDictionary)timeObservers;
- (NSString)outputContextID;
- (NSURL)assetURL;
- (OS_dispatch_queue)accessLogQueue;
- (OS_dispatch_queue)hlsQueue;
- (OS_dispatch_queue)outputContextQueue;
- (double)currentTime;
- (double)lastPosition;
- (double)lastSeekPosition;
- (double)pendingCurrentTime;
- (float)_actualRate;
- (float)lastBitrate;
- (float)playFadeInTime;
- (float)playbackRate;
- (float)volume;
- (id)assetNetworkError;
- (id)periodicTimeObserver;
- (int)audibleDRMGroupID;
- (int64_t)state;
- (unint64_t)scrubDispatchAfterGeneration;
- (unint64_t)scrubPausableDispatchAfterGeneration;
- (void)_activateSessionWithCompletion:(id)a3;
- (void)_addPeriodicTimeObserver;
- (void)_handleScrubPlayPreviewAtTime:(double)a3 completion:(id)a4;
- (void)_pause;
- (void)_playWithSeekTime:(double)a3 fadeIn:(float)a4;
- (void)_playWithSeekTime:(double)a3 fadeIn:(float)a4 completion:(id)a5;
- (void)_playbackFailedWithError:(id)a3;
- (void)_playbackStalledWithError:(id)a3;
- (void)_processOutputContextVolumeNotification:(id)a3;
- (void)_recreateCurrentAssetWithCompletion:(id)a3;
- (void)_recreateCurrentAssetWithRestoreTime:(id)a3 completion:(id)a4;
- (void)_reevaluateInternalVolumeWithContextCanSetVolume:(BOOL)a3 volume:(float)a4;
- (void)_reevaluateVolumeFromPlayer;
- (void)_registerAssetForDRMGroupIDDelegation:(id)a3 completion:(id)a4;
- (void)_removeAllTimeObserversWithClearObservedTimes:(BOOL)a3;
- (void)_removePeriodicTimeObserver;
- (void)_revalidatePlayerItem;
- (void)_seekToTime:(double)a3 completionHandler:(id)a4;
- (void)_setInternalVolumeAndNotify:(float)a3;
- (void)_unregisterAssetForDRMGroupIDDelegation:(id)a3;
- (void)_updateAudioParameters;
- (void)_updatePlayer;
- (void)addTimeObserver:(double)a3;
- (void)audioSessionInterrupted:(id)a3;
- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4;
- (void)dealloc;
- (void)fadeIn:(double)a3;
- (void)fadeOut:(double)a3;
- (void)handleNewAccessLogEntry:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)outputContextDestinationChange:(id)a3;
- (void)outputContextVolumeDidChange:(id)a3;
- (void)pause;
- (void)play;
- (void)playerItemDidReachEnd:(id)a3;
- (void)playerItemDidStallPlayback:(id)a3;
- (void)playerItemFailedToReachEnd:(id)a3;
- (void)playerPlaybackWasInterrupted:(id)a3;
- (void)removeAllTimeObservers;
- (void)removeTimeObserver:(double)a3;
- (void)reset;
- (void)routeChanged:(id)a3;
- (void)setAccessLogQueue:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAssetURL:(id)a3 audibleDRMGroupID:(int)a4 completion:(id)a5;
- (void)setAudibleDRMGroupID:(int)a3;
- (void)setCoalescedLoadedTimeRanges:(id)a3;
- (void)setContentKeySession:(id)a3;
- (void)setCurrentLoadedTimeRanges:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setCurrentTime:(double)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHlsQueue:(id)a3;
- (void)setIsAudibleDRMGroupAuthorized:(BOOL)a3;
- (void)setIsLoadingResources:(BOOL)a3;
- (void)setIsStalling:(BOOL)a3;
- (void)setIsStopping:(BOOL)a3;
- (void)setLastBitrate:(float)a3;
- (void)setLastPosition:(double)a3;
- (void)setLastSeekPosition:(double)a3;
- (void)setNeedsToUpdateTimeObservers:(BOOL)a3;
- (void)setObservedTimes:(id)a3;
- (void)setOutputContextID:(id)a3;
- (void)setOutputContextQueue:(id)a3;
- (void)setPendingAssetAuth:(id)a3;
- (void)setPendingCurrentTime:(double)a3;
- (void)setPeriodicTimeObserver:(id)a3;
- (void)setPlayFadeInTime:(float)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayingPreview:(BOOL)a3;
- (void)setResourceLoader:(id)a3;
- (void)setScrubDispatchAfterGeneration:(unint64_t)a3;
- (void)setScrubPausable:(BOOL)a3;
- (void)setScrubPausableDispatchAfterGeneration:(unint64_t)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setTimeObservers:(id)a3;
- (void)setVolume:(float)a3;
- (void)setWasInterrupted:(BOOL)a3;
- (void)setWasInterruptedEarly:(BOOL)a3;
- (void)setWasPlayingBeforeScrubbing:(BOOL)a3;
- (void)stop;
- (void)togglePlayPause;
- (void)updateTimeObservers;
@end

@implementation BKAVPlayer

- (BKAVPlayer)initWithResourceLoader:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BKAVPlayer;
  v6 = [(BKAVPlayer *)&v38 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resourceLoader, a3);
    v8 = +[NSUserDefaults standardUserDefaults];
    v9 = [v8 objectForKey:@"BKAVPlayerRateUserDefaultsKey"];
    v10 = v9;
    float v11 = 1.0;
    LODWORD(v12) = 1.0;
    if (v9) {
      [v9 floatValue];
    }
    v7->_playbackRate = *(float *)&v12;
    v13 = [v8 objectForKey:@"BKAVPlayerVolumeUserDefaultsKey"];
    v14 = v13;
    if (v13)
    {
      [v13 floatValue];
      float v11 = v15;
    }
    v7->_volume = v11;
    v7->_state = 4;
    *(int64x2_t *)&v7->_lastPosition = vdupq_n_s64(0x43E0000000000000uLL);
    v7->_pendingCurrentTime = 1.79769313e308;
    v7->_audibleDRMGroupID = -1;
    CMTimeMakeWithSeconds(&v37, 0.5, 1);
    v7->_seekTolerance = ($95D729B680665BEAEFA1D6FCA8238556)v37;
    v7->_needsToUpdateTimeObservers = 0;
    uint64_t v16 = objc_opt_new();
    timeObservers = v7->_timeObservers;
    v7->_timeObservers = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    observedTimes = v7->_observedTimes;
    v7->_observedTimes = (NSMutableArray *)v18;

    v7->_isAudibleDRMGroupAuthorized = 0;
    *(_WORD *)&v7->_wasInterrupted = 0;
    *(_WORD *)&v7->_isStalling = 0;
    v7->_lastBitrate = 0.0;
    lastError = v7->_lastError;
    v7->_lastError = 0;

    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.BKAudiobooks.outputContextQueue", v21);
    outputContextQueue = v7->_outputContextQueue;
    v7->_outputContextQueue = (OS_dispatch_queue *)v22;

    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.BKAudiobooks.accessLogQueue", v24);
    accessLogQueue = v7->_accessLogQueue;
    v7->_accessLogQueue = (OS_dispatch_queue *)v25;

    objc_initWeak((id *)&v37, v7);
    id v27 = objc_alloc((Class)BUCoalescingCallBlock);
    v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    v34 = sub_5630;
    v35 = &unk_3C6E8;
    objc_copyWeak(&v36, (id *)&v37);
    v28 = (BUCoalescingCallBlock *)[v27 initWithNotifyBlock:&v32 blockDescription:@"_coalescedLoadedTimeRanges in BKAVPlayer"];
    coalescedLoadedTimeRanges = v7->_coalescedLoadedTimeRanges;
    v7->_coalescedLoadedTimeRanges = v28;

    -[BUCoalescingCallBlock setCoalescingDelay:](v7->_coalescedLoadedTimeRanges, "setCoalescingDelay:", 1.0, v32, v33, v34, v35);
    v30 = +[NSNotificationCenter defaultCenter];
    [v30 addObserver:v7 selector:"playerItemDidReachEnd:" name:AVPlayerItemDidPlayToEndTimeNotification object:0];
    [v30 addObserver:v7 selector:"playerItemDidStallPlayback:" name:AVPlayerItemPlaybackStalledNotification object:0];
    [v30 addObserver:v7 selector:"playerItemFailedToReachEnd:" name:AVPlayerItemFailedToPlayToEndTimeNotification object:0];
    [v30 addObserver:v7 selector:"playerPlaybackWasInterrupted:" name:AVPlayerPlaybackWasInterruptedNotification object:0];
    [v30 addObserver:v7 selector:"routeChanged:" name:AVAudioSessionRouteChangeNotification object:0];
    [v30 addObserver:v7 selector:"audioSessionInterrupted:" name:AVAudioSessionInterruptionNotification object:0];
    [v30 addObserver:v7 selector:"handleNewAccessLogEntry:" name:AVPlayerItemNewAccessLogEntryNotification object:0];
    [v30 addObserver:v7 selector:"outputContextVolumeDidChange:" name:AVOutputContextVolumeDidChangeNotification object:0];
    [v30 addObserver:v7 selector:"outputContextDestinationChange:" name:AVOutputContextOutputDeviceDidChangeNotification object:0];

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)&v37);
  }
  return v7;
}

- (void)dealloc
{
  [(BKAVPlayer *)self _unregisterAssetForDRMGroupIDDelegation:self->_asset];
  [(BKAVPlayer *)self stop];
  [(BKAVPlayer *)self setPlayer:0];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BKAVPlayer;
  [(BKAVPlayer *)&v4 dealloc];
}

- (BOOL)isStreaming
{
  return [(NSURL *)self->_assetURL bk_isStreamingAssetURL];
}

- (void)setAsset:(id)a3
{
  id v5 = a3;
  v6 = BKAudiobooksBKAVLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "setAsset: asset=%@", buf, 0xCu);
  }

  if (([(AVAsset *)self->_asset isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_asset, a3);
    [(BKAVPlayer *)self setLastPosition:9.22337204e18];
    [(BKAVPlayer *)self setLastSeekPosition:9.22337204e18];
    [(BKAVPlayer *)self _updatePlayer];
    unsigned __int8 v7 = [(BKAVPlayer *)self _isStreamingAssetURL];
    if (v5)
    {
      if ((v7 & 1) == 0)
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_5CFC;
        v8[3] = &unk_3C710;
        id v9 = v5;
        [v9 loadValuesAsynchronouslyForKeys:&off_3E0A0 completionHandler:v8];
      }
    }
  }
}

- (void)setAssetURL:(id)a3 audibleDRMGroupID:(int)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = BKAudiobooksBKAVLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "setAssetURL:audibleDRMGroupID: assetURL=%@", buf, 0xCu);
  }

  double v12 = [(BKAVPlayer *)self assetURL];
  if ([v9 isEqual:v12])
  {
    int audibleDRMGroupID = self->_audibleDRMGroupID;

    if (audibleDRMGroupID == a4)
    {
      id v14 = objc_retainBlock(v10);
      float v15 = v14;
      if (v14) {
        (*((void (**)(id))v14 + 2))(v14);
      }
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
  }
  if (v9)
  {
    objc_storeStrong((id *)&self->_assetURL, a3);
    self->_lastSeekPosition = 9.22337204e18;
    if (self->_audibleDRMGroupID != a4)
    {
      self->_isAudibleDRMGroupAuthorized = 0;
      self->_int audibleDRMGroupID = a4;
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_5F18;
    v16[3] = &unk_3C738;
    id v17 = v10;
    [(BKAVPlayer *)self _recreateCurrentAssetWithCompletion:v16];
    float v15 = v17;
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_recreateCurrentAssetWithCompletion:(id)a3
{
}

- (void)_recreateCurrentAssetWithRestoreTime:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_6338;
  v27[3] = &unk_3C788;
  objc_copyWeak(&v30, &location);
  id v8 = v6;
  id v28 = v8;
  id v9 = v7;
  id v29 = v9;
  id v10 = objc_retainBlock(v27);
  unsigned int v11 = [(BKAVPlayer *)self isStreaming];
  double v12 = BKAudiobooksBKAVLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "_recreateCurrentAssetWithCompletion:", buf, 2u);
  }

  if ([(AVAsset *)self->_asset bk_isAudible]) {
    [(BKAVPlayer *)self _unregisterAssetForDRMGroupIDDelegation:self->_asset];
  }
  v13 = +[AVURLAsset URLAssetWithURL:self->_assetURL options:0];
  if (v11)
  {
    id v14 = BKAudiobooksStreamingLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      assetURL = self->_assetURL;
      *(_DWORD *)buf = 138412546;
      uint64_t v33 = assetURL;
      __int16 v34 = 2112;
      uint64_t v35 = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Setting up streaming asset %@ with options %@", buf, 0x16u);
    }

    if (!self->_hlsQueue)
    {
      uint64_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v17 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BKAudiobooks.hlsQueue", v16);
      hlsQueue = self->_hlsQueue;
      self->_hlsQueue = v17;
    }
    id v19 = [v13 resourceLoader];
    [v19 setPreloadsEligibleContentKeys:1];

    v20 = [v13 resourceLoader];
    v21 = [(BKAVPlayer *)self resourceLoader];
    [v20 setDelegate:v21 queue:self->_hlsQueue];

    [(BKAVPlayer *)self setLastBitrate:0.0];
    [(BKAVPlayer *)self setIsLoadingResources:1];
  }
  if (objc_msgSend(v13, "bk_isAudible"))
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_65C0;
    v24[3] = &unk_3C7B0;
    objc_copyWeak(&v26, &location);
    dispatch_queue_t v25 = v10;
    [(BKAVPlayer *)self _registerAssetForDRMGroupIDDelegation:v13 completion:v24];

    objc_destroyWeak(&v26);
  }
  else
  {
    [(BKAVPlayer *)self setAsset:v13];
    dispatch_queue_t v22 = objc_retainBlock(v10);
    v23 = v22;
    if (v22) {
      ((void (*)(void *))v22[2])(v22);
    }
  }
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (AVPlayerItem)currentItem
{
  v2 = [(BKAVPlayer *)self player];
  v3 = [v2 currentItem];

  return (AVPlayerItem *)v3;
}

- (NSDate)currentDate
{
  v2 = [(BKAVPlayer *)self currentItem];
  v3 = [v2 currentDate];

  return (NSDate *)v3;
}

- (NSString)outputContextID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_67D4;
  id v10 = sub_67E4;
  id v11 = 0;
  outputContextQueue = self->_outputContextQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_67EC;
  v5[3] = &unk_3C7D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputContextQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)play
{
  if (![(BKAVPlayer *)self isPlaying])
  {
    [(BKAVPlayer *)self pendingCurrentTime];
    -[BKAVPlayer _playWithSeekTime:fadeIn:](self, "_playWithSeekTime:fadeIn:");
  }
}

- (void)pause
{
  [(BKAVPlayer *)self setWasInterruptedEarly:0];
  [(BKAVPlayer *)self setWasInterrupted:0];
  if ([(BKAVPlayer *)self isPlaying] || [(BKAVPlayer *)self isPlaybackPending])
  {
    [(BKAVPlayer *)self _pause];
  }
}

- (void)_pause
{
  id v2 = [(BKAVPlayer *)self player];
  [v2 setRate:0.0];
}

- (void)stop
{
  id v3 = [(BKAVPlayer *)self player];
  [v3 setRate:0.0];

  [(BKAVPlayer *)self setPendingCurrentTime:0.0];
  BOOL v4 = [(BKAVPlayer *)self isStopping];
  [(BKAVPlayer *)self setIsStopping:1];
  [(BKAVPlayer *)self setState:4];

  [(BKAVPlayer *)self setIsStopping:v4];
}

- (void)togglePlayPause
{
  if ([(BKAVPlayer *)self isPlaying] || [(BKAVPlayer *)self isPlaybackPending])
  {
    [(BKAVPlayer *)self pause];
  }
  else
  {
    [(BKAVPlayer *)self play];
  }
}

- (void)fadeIn:(double)a3
{
  if (![(BKAVPlayer *)self isPlaying])
  {
    *(float *)&double v5 = a3;
    [(BKAVPlayer *)self _playWithSeekTime:1.79769313e308 fadeIn:v5];
  }
}

- (void)fadeOut:(double)a3
{
  BOOL v4 = [(BKAVPlayer *)self player];
  CMTimeMakeWithSeconds(&v5, a3, 1000000000);
  [v4 setRate:&v5 withVolumeRampDuration:0.0];
}

- (void)reset
{
  id v3 = BKAudiobooksBKAVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "player reset", (uint8_t *)&v13, 2u);
  }

  [(BKAVPlayer *)self lastPosition];
  double v5 = v4;
  [(BKAVPlayer *)self lastSeekPosition];
  double v7 = v6;
  if (v5 == 9.22337204e18)
  {
    if (v6 == 9.22337204e18) {
      goto LABEL_15;
    }
    id v10 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      double v14 = v7;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "lastSeekPosition is %lf, using that position to reset", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      double v14 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "lastPosition is %lf, using that position to reset", (uint8_t *)&v13, 0xCu);
    }

    [(BKAVPlayer *)self lastPosition];
    double v7 = v9;
  }
  if (v7 != 9.22337204e18)
  {
    id v11 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "resetting player", (uint8_t *)&v13, 2u);
    }

    [(BKAVPlayer *)self setPlayer:0];
    [(BKAVPlayer *)self setContentKeySession:0];
    double v12 = +[NSNumber numberWithDouble:v7];
    [(BKAVPlayer *)self _recreateCurrentAssetWithRestoreTime:v12 completion:0];
    goto LABEL_17;
  }
LABEL_15:
  double v12 = BKAudiobooksBKAVLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_24DE0();
  }
LABEL_17:
}

- (BOOL)isPlaying
{
  return self->_state == 2;
}

- (BOOL)isPlaybackPending
{
  return self->_state == 1;
}

- (void)setScrubbing:(BOOL)a3
{
  if (self->_scrubbing != a3)
  {
    self->_scrubbing = a3;
    if (a3)
    {
      self->_wasPlayingBeforeScrubbing = [(BKAVPlayer *)self isPlaying];
      [(AVPlayer *)self->_player setActionAtItemEnd:2];
      double v4 = (void *)(self->_scrubPausableDispatchAfterGeneration + 1);
      self->_scrubPausableDispatchAfterGeneration = (unint64_t)v4;
      objc_initWeak(&location, self);
      dispatch_time_t v5 = dispatch_time(0, 400000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_6EA0;
      block[3] = &unk_3C800;
      objc_copyWeak(v7, &location);
      v7[1] = v4;
      dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(v7);
      objc_destroyWeak(&location);
    }
    else
    {
      [(AVPlayer *)self->_player setActionAtItemEnd:1];
      ++self->_scrubDispatchAfterGeneration;
      if (self->_wasPlayingBeforeScrubbing && self->_state == 3) {
        [(BKAVPlayer *)self play];
      }
      self->_wasPlayingBeforeScrubbing = 0;
      ++self->_scrubPausableDispatchAfterGeneration;
      self->_scrubPausable = 0;
    }
  }
}

- (void)setIsStalling:(BOOL)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_700C;
  v6[3] = &unk_3C828;
  BOOL v7 = a3;
  v6[4] = self;
  id v3 = objc_retainBlock(v6);
  if (v3)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v3[2])(v3);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_7108;
      block[3] = &unk_3C6C0;
      dispatch_time_t v5 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)setIsLoadingResources:(BOOL)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_7224;
  v6[3] = &unk_3C828;
  BOOL v7 = a3;
  v6[4] = self;
  id v3 = objc_retainBlock(v6);
  if (v3)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v3[2])(v3);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_7320;
      block[3] = &unk_3C6C0;
      dispatch_time_t v5 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)setPlaybackRate:(float)a3
{
  self->_float playbackRate = a3;
  dispatch_time_t v5 = +[NSUserDefaults standardUserDefaults];
  *(float *)&double v6 = a3;
  BOOL v7 = +[NSNumber numberWithFloat:v6];
  [v5 setObject:v7 forKey:@"BKAVPlayerRateUserDefaultsKey"];

  if ([(BKAVPlayer *)self wasInterrupted])
  {
    [(BKAVPlayer *)self play];
  }
  else if ([(BKAVPlayer *)self isPlaying])
  {
    float playbackRate = self->_playbackRate;
    id v10 = [(BKAVPlayer *)self player];
    *(float *)&double v9 = playbackRate;
    [v10 setRate:v9];
  }
}

- (float)_actualRate
{
  id v3 = [(BKAVPlayer *)self player];
  float v4 = 0.0;
  if ([v3 timeControlStatus] == (char *)&dword_0 + 2)
  {
    dispatch_time_t v5 = [(BKAVPlayer *)self player];
    [v5 rate];
    float v4 = v6;
  }
  return v4;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  if (self->_volume != a3)
  {
    id v13 = [(BKAVPlayer *)self player];
    dispatch_time_t v5 = [v13 outputContext];
    BOOL v6 = [v5 canSetVolume] == 0;
    uint64_t v8 = v13;
    if (!v6) {
      uint64_t v8 = v5;
    }
    *(float *)&double v7 = a3;
    [v8 setVolume:v7];
    *(float *)&double v9 = a3;
    [(BKAVPlayer *)self _setInternalVolumeAndNotify:v9];
    id v10 = +[NSUserDefaults standardUserDefaults];
    *(float *)&double v11 = a3;
    double v12 = +[NSNumber numberWithFloat:v11];
    [v10 setObject:v12 forKey:@"BKAVPlayerVolumeUserDefaultsKey"];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_486F0 == a6)
  {
    if ([v10 isEqualToString:@"currentItem"])
    {
      id v13 = [v12 objectForKey:NSKeyValueChangeOldKey];
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [v13 removeObserver:self forKeyPath:@"status" context:off_486F0];
          [v13 removeObserver:self forKeyPath:@"loadedTimeRanges" context:off_486F0];
        }
      }
      double v14 = [(BKAVPlayer *)self currentItem];

      if (v14)
      {
        float v15 = [(BKAVPlayer *)self currentItem];
        [v15 addObserver:self forKeyPath:@"status" options:4 context:off_486F0];

        uint64_t v16 = [(BKAVPlayer *)self currentItem];
        [v16 addObserver:self forKeyPath:@"loadedTimeRanges" options:4 context:off_486F0];

        objc_initWeak(location, self);
        id v17 = [(BKAVPlayer *)self currentItem];
        uint64_t v18 = [v17 asset];
        id v19 = +[NSArray arrayWithObjects:@"tracks", @"duration", 0];
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_7DC0;
        v52[3] = &unk_3C850;
        objc_copyWeak(&v53, location);
        [v18 loadValuesAsynchronouslyForKeys:v19 completionHandler:v52];

        objc_destroyWeak(&v53);
        objc_destroyWeak(location);
      }
    }
    else if ([v10 isEqualToString:@"status"])
    {
      v20 = [(BKAVPlayer *)self currentItem];

      if (v20)
      {
        v21 = [(BKAVPlayer *)self currentItem];
        dispatch_queue_t v22 = (char *)[v21 status];

        if (v22 == (unsigned char *)&dword_0 + 2)
        {
          v39 = [(BKAVPlayer *)self currentItem];
          v40 = [v39 error];
          lastError = self->_lastError;
          self->_lastError = v40;

          v42 = BKAudiobooksBKAVLog();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            sub_24E14((uint64_t *)&self->_lastError, self, v42);
          }

          [(BKAVPlayer *)self pause];
          [(BKAVPlayer *)self _playbackFailedWithError:self->_lastError];
          [(BKAVPlayer *)self setIsLoadingResources:0];
        }
        else if (v22 == (unsigned char *)&dword_0 + 1)
        {
          if ([(BKAVPlayer *)self isPlaybackPending])
          {
            objc_initWeak(location, self);
            [(BKAVPlayer *)self pendingCurrentTime];
            double v24 = v23;
            [(BKAVPlayer *)self playFadeInTime];
            int v26 = v25;
            v50[0] = _NSConcreteStackBlock;
            v50[1] = 3221225472;
            v50[2] = sub_7EAC;
            v50[3] = &unk_3C850;
            objc_copyWeak(&v51, location);
            LODWORD(v27) = v26;
            [(BKAVPlayer *)self _playWithSeekTime:v50 fadeIn:v24 completion:v27];
            objc_destroyWeak(&v51);
            objc_destroyWeak(location);
          }
          else
          {
            [(BKAVPlayer *)self setIsLoadingResources:0];
            if ([(BKAVPlayer *)self needsToUpdateTimeObservers]) {
              [(BKAVPlayer *)self updateTimeObservers];
            }
          }
        }
      }
    }
    else if ([v10 isEqualToString:@"loadedTimeRanges"])
    {
      id v28 = [(BKAVPlayer *)self currentItem];

      if (v28 == v11)
      {
        id v29 = [(BKAVPlayer *)self currentItem];
        id v30 = [v29 loadedTimeRanges];
        [(BKAVPlayer *)self setCurrentLoadedTimeRanges:v30];

        v31 = [(BKAVPlayer *)self coalescedLoadedTimeRanges];
        [v31 signalWithCompletion:&stru_3C890];
      }
    }
    else if (([v10 isEqualToString:@"rate"] & 1) == 0 {
           && [v10 isEqualToString:@"timeControlStatus"])
    }
    {
      v32 = [(BKAVPlayer *)self player];
      uint64_t v33 = (char *)[v32 timeControlStatus];

      if (v33)
      {
        if (v33 == (unsigned char *)&dword_0 + 1)
        {
          v46 = BKAudiobooksBKAVLog();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(location[0]) = 0;
            _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, "AVPlayerState -> AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate", (uint8_t *)location, 2u);
          }

          [(BKAVPlayer *)self setIsStalling:1];
        }
        else if (v33 == (unsigned char *)&dword_0 + 2)
        {
          __int16 v34 = BKAudiobooksBKAVLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(location[0]) = 0;
            _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "AVPlayerState -> AVPlayerTimeControlStatusPlaying", (uint8_t *)location, 2u);
          }

          [(BKAVPlayer *)self setIsStalling:0];
          [(BKAVPlayer *)self setState:2];
          [(BKAVPlayer *)self pendingCurrentTime];
          if (v35 != 1.79769313e308)
          {
            id v36 = BKAudiobooksBKAVLog();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              [(BKAVPlayer *)self pendingCurrentTime];
              LODWORD(location[0]) = 134217984;
              *(id *)((char *)location + 4) = v37;
              _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "handing remaining pendingCurrentTime %f", (uint8_t *)location, 0xCu);
            }

            [(BKAVPlayer *)self pendingCurrentTime];
            -[BKAVPlayer _seekToTime:completionHandler:](self, "_seekToTime:completionHandler:", 0);
          }
          objc_initWeak(location, self);
          objc_super v38 = [(BKAVPlayer *)self outputContextQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_7EF4;
          block[3] = &unk_3C850;
          objc_copyWeak(&v49, location);
          dispatch_async(v38, block);

          objc_destroyWeak(&v49);
          objc_destroyWeak(location);
        }
      }
      else
      {
        v43 = BKAudiobooksBKAVLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v44 = [(BKAVPlayer *)self isStopping];
          CFStringRef v45 = &stru_3D468;
          if (v44) {
            CFStringRef v45 = @" (Ignoring because BKAVPlayer is in the process of stopping)";
          }
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = (id)v45;
          _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "AVPlayerState -> AVPlayerTimeControlStatusPaused%{public}@", (uint8_t *)location, 0xCu);
        }

        [(BKAVPlayer *)self setIsStalling:0];
        if (![(BKAVPlayer *)self isStopping]) {
          [(BKAVPlayer *)self setState:3];
        }
      }
    }
  }
  else
  {
    v47.receiver = self;
    v47.super_class = (Class)BKAVPlayer;
    [(BKAVPlayer *)&v47 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_playbackFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAVPlayer *)self delegate];
  [v5 player:self failedWithError:v4];
}

- (void)_playbackStalledWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAVPlayer *)self delegate];
  [v5 player:self playbackStalledWithError:v4];
}

- (void)playerItemDidReachEnd:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAVPlayer *)self player];
  BOOL v6 = [v5 currentItem];
  double v7 = [v4 object];

  if (v6 == v7)
  {
    [(BKAVPlayer *)self pause];
    if (![(BKAVPlayer *)self isScrubbing])
    {
      id v8 = [(BKAVPlayer *)self delegate];
      [v8 playerCurrentItemEnded:self];
    }
  }
}

- (void)playerItemDidStallPlayback:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAVPlayer *)self player];
  BOOL v6 = [v5 currentItem];
  double v7 = [v4 object];

  if (v6 == v7)
  {
    id v8 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_24EDC();
    }

    double v9 = [(BKAVPlayer *)self currentItem];
    id v10 = [v9 error];
    lastError = self->_lastError;
    self->_lastError = v10;

    [(BKAVPlayer *)self pause];
    [(BKAVPlayer *)self _playbackStalledWithError:self->_lastError];
  }
}

- (void)playerItemFailedToReachEnd:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAVPlayer *)self player];
  BOOL v6 = [v5 currentItem];
  double v7 = [v4 object];

  if (v6 == v7)
  {
    id v8 = [v4 userInfo];
    double v9 = [v8 objectForKey:AVPlayerItemFailedToPlayToEndTimeErrorKey];
    lastError = self->_lastError;
    self->_lastError = v9;

    id v11 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_24F10((uint64_t)&self->_lastError, v11, v12, v13, v14, v15, v16, v17);
    }

    [(BKAVPlayer *)self _playbackFailedWithError:self->_lastError];
  }
}

- (void)playerPlaybackWasInterrupted:(id)a3
{
  [(BKAVPlayer *)self setWasInterruptedEarly:[(BKAVPlayer *)self isPlaying]];
  id v4 = BKAudiobooksBKAVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = [(BKAVPlayer *)self wasInterruptedEarly];
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "player playback was interrupted (was interrupted early? %d)", (uint8_t *)v5, 8u);
  }
}

- (void)routeChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:AVAudioSessionRouteChangeReasonKey];

  if ([v5 integerValue] == (char *)&dword_0 + 2)
  {
    if ([(BKAVPlayer *)self wasInterrupted])
    {
      uint64_t v6 = BKAudiobooksBKAVLog();
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "onRouteChange: already interrupted", buf, 2u);
      }
    }
    else
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_8558;
      v9[3] = &unk_3C710;
      v9[4] = self;
      uint64_t v6 = objc_retainBlock(v9);
      if (v6)
      {
        if (+[NSThread isMainThread])
        {
          (*(void (**)(uint64_t))(v6 + 16))(v6);
        }
        else
        {
          v7[0] = _NSConcreteStackBlock;
          v7[1] = 3221225472;
          id v7[2] = sub_85CC;
          v7[3] = &unk_3C6C0;
          id v8 = (id)v6;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
        }
      }
    }
  }
}

- (void)audioSessionInterrupted:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:AVAudioSessionInterruptionTypeKey];
  uint64_t v6 = (char *)[v5 unsignedIntegerValue];

  double v7 = [v4 objectForKey:AVAudioSessionInterruptionOptionKey];
  id v8 = [v7 unsignedIntegerValue];

  double v9 = [v4 objectForKey:AVAudioSessionInterruptionReasonKey];
  id v10 = (char *)[v9 unsignedIntegerValue];

  unsigned int v11 = [(BKAVPlayer *)self isPlaying];
  if (v10 == (unsigned char *)&dword_0 + 1)
  {
    uint64_t v12 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 67109632;
      *(_DWORD *)uint64_t v18 = v11;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = [(BKAVPlayer *)self wasInterrupted];
      *(_WORD *)id v19 = 1024;
      *(_DWORD *)&v19[2] = [(BKAVPlayer *)self wasInterruptedEarly];
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "ignoring wasSuspended interruption, wasPlaying: %d, wasInterrupted: %d, wasInterruptedEarly: %d", (uint8_t *)&v17, 0x14u);
    }
  }
  else if (v6)
  {
    if (v6 == (unsigned char *)&dword_0 + 1)
    {
      uint64_t v13 = BKAudiobooksBKAVLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 67109376;
        *(_DWORD *)uint64_t v18 = v11;
        *(_WORD *)&v18[4] = 1024;
        *(_DWORD *)&v18[6] = [(BKAVPlayer *)self wasInterruptedEarly];
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "handleInterruption began, wasPlaying %d, wasInterruptedEarly %d", (uint8_t *)&v17, 0xEu);
      }

      [(BKAVPlayer *)self _pause];
      BOOL v14 = (v11 & 1) != 0 || [(BKAVPlayer *)self wasInterruptedEarly];
      [(BKAVPlayer *)self setWasInterrupted:v14];
      if ([(BKAVPlayer *)self wasInterrupted])
      {
        uint64_t v16 = [(BKAVPlayer *)self delegate];
        [v16 playerWasInterrupted:self];
      }
      [(BKAVPlayer *)self setWasInterruptedEarly:0];
    }
  }
  else
  {
    uint64_t v15 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218496;
      *(void *)uint64_t v18 = v8;
      *(_WORD *)&v18[8] = 1024;
      *(_DWORD *)id v19 = [(BKAVPlayer *)self wasInterrupted];
      *(_WORD *)&v19[4] = 1024;
      int v20 = v8 & 1;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "handleInterruption ended: %lu wasInterrupted: %d resumable: %d", (uint8_t *)&v17, 0x18u);
    }

    if ((v8 & 1) != 0 && [(BKAVPlayer *)self wasInterrupted]) {
      [(BKAVPlayer *)self play];
    }
    [(BKAVPlayer *)self setWasInterrupted:0];
  }
}

- (void)handleNewAccessLogEntry:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];

  uint64_t v6 = BUDynamicCast();

  objc_initWeak(&location, self);
  accessLogQueue = self->_accessLogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_89CC;
  block[3] = &unk_3C8E0;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  id v8 = v6;
  dispatch_async(accessLogQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)outputContextVolumeDidChange:(id)a3
{
}

- (void)outputContextDestinationChange:(id)a3
{
}

- (void)_seekToTime:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  double v7 = [(BKAVPlayer *)self player];
  id v8 = [v7 currentItem];
  [v8 cancelPendingSeeks];

  [(BKAVPlayer *)self setLastPosition:9.22337204e18];
  [(BKAVPlayer *)self setPendingCurrentTime:a3];
  [(BKAVPlayer *)self setLastSeekPosition:a3];
  double v9 = [(BKAVPlayer *)self player];
  CMTimeMakeWithSeconds(&v16, a3, 1000000000);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_8D00;
  v13[3] = &unk_3C908;
  double v15 = a3;
  v13[4] = self;
  id v14 = v6;
  $95D729B680665BEAEFA1D6FCA8238556 seekTolerance = self->_seekTolerance;
  $95D729B680665BEAEFA1D6FCA8238556 v11 = self->_seekTolerance;
  id v10 = v6;
  [v9 seekToTime:&v16 toleranceBefore:&seekTolerance toleranceAfter:&v11 completionHandler:v13];
}

- (double)currentTime
{
  id v3 = [(BKAVPlayer *)self player];
  id v4 = [v3 currentItem];

  [(BKAVPlayer *)self pendingCurrentTime];
  if (v5 == 1.79769313e308)
  {
    double Seconds = 0.0;
    if (v4)
    {
      id v8 = [(BKAVPlayer *)self player];
      double v9 = v8;
      if (v8) {
        [v8 currentTime];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      double Seconds = CMTimeGetSeconds(&time);
    }
  }
  else
  {
    [(BKAVPlayer *)self pendingCurrentTime];
    double Seconds = v6;
  }

  return Seconds;
}

- (void)setCurrentTime:(double)a3
{
}

- (void)setCurrentTime:(double)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (a3 >= 0.0)
  {
    if (self->_scrubbing && self->_wasPlayingBeforeScrubbing)
    {
      [(BKAVPlayer *)self _handleScrubPlayPreviewAtTime:v6 completion:a3];
    }
    else
    {
      $95D729B680665BEAEFA1D6FCA8238556 v11 = BKAudiobooksBKAVLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v16 = a3;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "_seekToTime: %lf (setCurrentTime)", buf, 0xCu);
      }

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_9084;
      v12[3] = &unk_3C930;
      double v14 = a3;
      id v13 = v7;
      [(BKAVPlayer *)self _seekToTime:v12 completionHandler:a3];
    }
  }
  else
  {
    id v8 = objc_retainBlock(v6);
    double v9 = v8;
    if (v8) {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }

    id v10 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_24FB4();
    }
  }
}

- (BOOL)isCurrentTimeValid
{
  [(BKAVPlayer *)self pendingCurrentTime];
  if (v3 != 1.79769313e308) {
    return 1;
  }
  double v5 = [(BKAVPlayer *)self player];
  id v6 = [v5 currentItem];

  if (v6) {
    BOOL v4 = [v6 status] == (char *)&dword_0 + 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_handleScrubPlayPreviewAtTime:(double)a3 completion:(id)a4
{
  id v6 = a4;
  if (self->_state == 2 && self->_scrubPausable)
  {
    [(BKAVPlayer *)self _pause];
    *(_WORD *)&self->_playingPreview = 0;
    double v7 = (void *)(self->_scrubDispatchAfterGeneration + 1);
    self->_scrubDispatchAfterGeneration = (unint64_t)v7;
    objc_initWeak(location, self);
    dispatch_time_t v8 = dispatch_time(0, 400000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_942C;
    block[3] = &unk_3C800;
    objc_copyWeak(v16, location);
    v16[1] = v7;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
    id v9 = objc_retainBlock(v6);
    id v10 = v9;
    if (v9) {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    }

    objc_destroyWeak(v16);
    objc_destroyWeak(location);
  }
  else
  {
    $95D729B680665BEAEFA1D6FCA8238556 v11 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = *(id *)&a3;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "_seekToTime: %lf (_handleScrubPlayPreviewAtTime:completion:)", (uint8_t *)location, 0xCu);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_9588;
    v12[3] = &unk_3C930;
    double v14 = a3;
    id v13 = v6;
    [(BKAVPlayer *)self _seekToTime:v12 completionHandler:a3];
  }
}

- (void)setPlayer:(id)a3
{
  p_player = &self->_player;
  dispatch_time_t v8 = (AVPlayer *)a3;
  if (*p_player != v8)
  {
    [(BKAVPlayer *)self _removePeriodicTimeObserver];
    [(BKAVPlayer *)self _removeAllTimeObserversWithClearObservedTimes:0];
    [(BKAVPlayer *)self setCurrentLoadedTimeRanges:0];
    [(AVPlayer *)self->_player removeObserver:self forKeyPath:@"currentItem" context:off_486F0];
    [(AVPlayer *)self->_player removeObserver:self forKeyPath:@"rate" context:off_486F0];
    [(AVPlayer *)self->_player removeObserver:self forKeyPath:@"timeControlStatus" context:off_486F0];
    if (!v8)
    {
      id v6 = [(AVPlayer *)self->_player currentItem];
      [v6 removeObserver:self forKeyPath:@"status" context:off_486F0];

      double v7 = [(AVPlayer *)self->_player currentItem];
      [v7 removeObserver:self forKeyPath:@"loadedTimeRanges" context:off_486F0];
    }
    objc_storeStrong((id *)&self->_player, a3);
    if (*p_player)
    {
      [(AVPlayer *)*p_player addObserver:self forKeyPath:@"currentItem" options:6 context:off_486F0];
      [(AVPlayer *)self->_player addObserver:self forKeyPath:@"rate" options:0 context:off_486F0];
      [(AVPlayer *)self->_player addObserver:self forKeyPath:@"timeControlStatus" options:0 context:off_486F0];
    }
  }
}

- (void)_updatePlayer
{
  [(BKAVPlayer *)self _removePeriodicTimeObserver];
  [(BKAVPlayer *)self _removeAllTimeObserversWithClearObservedTimes:0];
  [(BKAVPlayer *)self setCurrentLoadedTimeRanges:0];
  double v3 = [(BKAVPlayer *)self asset];

  BOOL v4 = BKAudiobooksBKAVLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "_updatePlayer, we have asset, about to create playerItem", buf, 2u);
    }

    [(BKAVPlayer *)self _revalidatePlayerItem];
    [(BKAVPlayer *)self _addPeriodicTimeObserver];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "_updatePlayer, no asset, about to call replaceCurrentItemWithPlayerItem nil", v7, 2u);
    }

    id v6 = [(BKAVPlayer *)self player];
    [v6 replaceCurrentItemWithPlayerItem:0];
  }
}

- (void)_revalidatePlayerItem
{
  double v3 = [(BKAVPlayer *)self asset];
  BOOL v4 = +[AVPlayerItem playerItemWithAsset:v3];

  unsigned int v5 = [(BKAVPlayer *)self _isStreamingAssetURL];
  if (v5)
  {
    [v4 setPreferredForwardBufferDuration:3600.0];
    [v4 setCanUseNetworkResourcesForLiveStreamingWhilePaused:1];
  }
  id v6 = [(BKAVPlayer *)self player];

  double v7 = BKAudiobooksBKAVLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "_updatePlayer, we have asset and player, about to call replaceCurrentItemWithPlayerItem", v13, 2u);
    }

    id v9 = [(BKAVPlayer *)self player];
    [v9 replaceCurrentItemWithPlayerItem:v4];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "_updatePlayer, we have asset, no existing player, we created a player with playerItem", buf, 2u);
    }

    id v10 = +[AVPlayer playerWithPlayerItem:v4];
    [(BKAVPlayer *)self setPlayer:v10];

    $95D729B680665BEAEFA1D6FCA8238556 v11 = [(BKAVPlayer *)self player];
    [v11 setActionAtItemEnd:1];

    id v9 = [(BKAVPlayer *)self player];
    [v9 setAllowsExternalPlayback:0];
  }

  if (v5)
  {
    uint64_t v12 = [(BKAVPlayer *)self player];
    [v12 setAutomaticallyWaitsToMinimizeStalling:1];
  }
}

- (void)_updateAudioParameters
{
  id v3 = [(BKAVPlayer *)self player];
  id v2 = [v3 currentItem];
  [v2 setAudioTimePitchAlgorithm:AVAudioTimePitchAlgorithmTimeDomain];
}

- (void)_playWithSeekTime:(double)a3 fadeIn:(float)a4
{
}

- (void)_playWithSeekTime:(double)a3 fadeIn:(float)a4 completion:(id)a5
{
  id v8 = a5;
  float playbackRate = self->_playbackRate;
  if (playbackRate < 0.0 || fabsf(playbackRate) < 0.01)
  {
    id v10 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_24FE8((uint64_t)&self->_playbackRate, v10, v11, v12, v13, v14, v15, v16);
    }

    self->_float playbackRate = 1.0;
  }
  int v17 = BKAudiobooksBKAVLog();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (a3 == 1.79769313e308)
  {
    if (!v18) {
      goto LABEL_12;
    }
    [(BKAVPlayer *)self playbackRate];
    double v20 = v19;
    v21 = [(BKAVPlayer *)self player];
    [v21 rate];
    *(_DWORD *)buf = 134218496;
    double v58 = a4;
    __int16 v59 = 2048;
    double v60 = v20;
    __int16 v61 = 2048;
    double v62 = v22;
    double v23 = "_playWithSeekTime: BKNoPendingCurrentTime fadeInTime:%.1f playbackRate:%.1f rateBeforeCall:%.2f";
    double v24 = v17;
    uint32_t v25 = 32;
  }
  else
  {
    if (!v18) {
      goto LABEL_12;
    }
    [(BKAVPlayer *)self playbackRate];
    double v27 = v26;
    v21 = [(BKAVPlayer *)self player];
    [v21 rate];
    *(_DWORD *)buf = 134218752;
    double v58 = a3;
    __int16 v59 = 2048;
    double v60 = a4;
    __int16 v61 = 2048;
    double v62 = v27;
    __int16 v63 = 2048;
    double v64 = v28;
    double v23 = "_playWithSeekTime: %.1f fadeInTime:%.1f playbackRate:%.1f rateBeforeCall:%.2f";
    double v24 = v17;
    uint32_t v25 = 42;
  }
  _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);

LABEL_12:
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_A088;
  v56[3] = &unk_3C9A8;
  v56[4] = self;
  id v29 = objc_retainBlock(v56);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_A394;
  v55[3] = &unk_3C9A8;
  v55[4] = self;
  id v30 = objc_retainBlock(v55);
  lastError = self->_lastError;
  self->_lastError = 0;

  v32 = [(BKAVPlayer *)self currentItem];
  uint64_t v33 = (char *)[v32 status];

  if (v33)
  {
    if (v33 == (unsigned char *)&dword_0 + 2)
    {
      objc_super v38 = BKAudiobooksBKAVLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v39 = "recover player (AVPlayerItemStatusFailed)";
LABEL_25:
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
      }
    }
    else
    {
      if (v33 != (unsigned char *)&dword_0 + 1) {
        goto LABEL_36;
      }
      __int16 v34 = [(BKAVPlayer *)self currentItem];
      if ([v34 isPlaybackLikelyToKeepUp])
      {

LABEL_27:
        [(BKAVPlayer *)self pendingCurrentTime];
        if (v41 == 1.79769313e308) {
          goto LABEL_35;
        }
        [(BKAVPlayer *)self pendingCurrentTime];
        double v43 = v42;
        unsigned int v44 = [(BKAVPlayer *)self player];
        CFStringRef v45 = v44;
        if (v44) {
          [v44 currentTime];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        double v46 = vabdd_f64(v43, CMTimeGetSeconds(&time));

        if (v46 < 0.00999999978)
        {
LABEL_35:
          [(BKAVPlayer *)self setPendingCurrentTime:1.79769313e308];
          ((void (*)(void *, id))v30[2])(v30, v8);
        }
        else
        {
          objc_super v47 = BKAudiobooksBKAVLog();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            [(BKAVPlayer *)self pendingCurrentTime];
            *(_DWORD *)buf = 134217984;
            double v58 = v48;
            _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "_seekToTime: %lf (_playWithSeekTime)", buf, 0xCu);
          }

          [(BKAVPlayer *)self pendingCurrentTime];
          double v50 = v49;
          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472;
          v51[2] = sub_A68C;
          v51[3] = &unk_3C9F8;
          v51[4] = self;
          v52 = v30;
          id v53 = v8;
          [(BKAVPlayer *)self _seekToTime:v51 completionHandler:v50];
        }
        goto LABEL_36;
      }
      v40 = [(BKAVPlayer *)self assetNetworkError];

      if (!v40) {
        goto LABEL_27;
      }
      objc_super v38 = BKAudiobooksBKAVLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v39 = "recover player (hasUnderlyingError)";
        goto LABEL_25;
      }
    }

    ((void (*)(void *, id))v29[2])(v29, v8);
    goto LABEL_36;
  }
  [(BKAVPlayer *)self setPendingCurrentTime:a3];
  *(float *)&double v35 = a4;
  [(BKAVPlayer *)self setPlayFadeInTime:v35];
  [(BKAVPlayer *)self setState:1];
  id v36 = objc_retainBlock(v8);
  CMTime v37 = v36;
  if (v36) {
    (*((void (**)(id))v36 + 2))(v36);
  }

LABEL_36:
}

- (void)_activateSessionWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[AVAudioSession sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_A7FC;
  v6[3] = &unk_3CA48;
  id v7 = v3;
  id v5 = v3;
  [v4 activateWithOptions:0 completionHandler:v6];
}

- (void)setState:(int64_t)a3
{
  int64_t state = self->_state;
  if (state != a3)
  {
    self->_int64_t state = a3;
    id v6 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromBKAudiobookPlayerState(self->_state);
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "int64_t state = %{public}@", (uint8_t *)&v9, 0xCu);
    }
    id v8 = [(BKAVPlayer *)self delegate];
    [v8 player:self stateChangedFrom:state to:self->_state];
  }
  if (a3 == 2) {
    [(BKAVPlayer *)self setWasInterrupted:0];
  }
}

- (void)_registerAssetForDRMGroupIDDelegation:(id)a3 completion:(id)a4
{
  id v19 = a4;
  id v6 = a3;
  objc_opt_class();
  id v7 = BUDynamicCast();

  id v8 = [(AVContentKeySession *)self->_contentKeySession contentKeyRecipients];
  unsigned int v9 = [v8 containsObject:v7];

  id v10 = [(BKAVPlayer *)self pendingAssetAuth];
  uint64_t v11 = [v10 asset];
  unsigned int v12 = [v11 isEqual:v7];

  if (v7)
  {
    int v13 = self->_audibleDRMGroupID == -1 ? 1 : v9;
    if (((v13 | v12) & 1) == 0)
    {
      if (!self->_contentKeySession)
      {
        self->_isAudibleDRMGroupAuthorized = 0;
        uint64_t v14 = +[AVContentKeySession contentKeySessionWithKeySystem:AVContentKeySystemAuthorizationToken];
        contentKeySession = self->_contentKeySession;
        self->_contentKeySession = v14;

        [(AVContentKeySession *)self->_contentKeySession setDelegate:self queue:&_dispatch_main_q];
      }
      uint64_t v16 = self->_contentKeySession;
      if (!self->_isAudibleDRMGroupAuthorized)
      {
        [(AVContentKeySession *)v16 processContentKeyRequestWithIdentifier:@"AudibleGroupID" initializationData:0 options:0];
        BOOL v18 = [[BKPendingAssetAuthorization alloc] initWithAsset:v7 completion:v19];
        [(BKAVPlayer *)self setPendingAssetAuth:v18];
        goto LABEL_12;
      }
      [(AVContentKeySession *)v16 addContentKeyRecipient:v7];
    }
  }
  int v17 = (BKPendingAssetAuthorization *)objc_retainBlock(v19);
  BOOL v18 = v17;
  if (v17) {
    ((void (*)(BKPendingAssetAuthorization *, void *))v17->_completion)(v17, v7);
  }
LABEL_12:
}

- (void)_unregisterAssetForDRMGroupIDDelegation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BUDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6) {
    [(AVContentKeySession *)self->_contentKeySession removeContentKeyRecipient:v6];
  }
  contentKeySession = self->_contentKeySession;
  self->_contentKeySession = 0;
}

- (BOOL)_isStreamingAssetURL
{
  id v2 = [(BKAVPlayer *)self assetURL];
  unsigned __int8 v3 = [v2 bk_isStreamingAssetURL];

  return v3;
}

- (id)assetNetworkError
{
  id v2 = [(BKAVPlayer *)self currentItem];
  unsigned __int8 v3 = [v2 errorLog];
  id v4 = [v3 events];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v11 = [v10 errorDomain:v27];
        unsigned __int8 v12 = [v11 isEqualToString:@"CoreMediaErrorDomain"];

        int v13 = [v10 errorDomain];
        unsigned int v14 = [v13 isEqualToString:NSURLErrorDomain];

        if (!v14
          || ((id v15 = [v10 errorStatusCode], (unint64_t)v15 + 1009 <= 6)
            ? (BOOL v16 = ((1 << (v15 - 15)) & 0x71) == 0)
            : (BOOL v16 = 1),
              v16))
        {
          if ((v12 & 1) == 0)
          {
            int v17 = [v10 errorDomain];
            unsigned int v18 = [v17 isEqualToString:kCFErrorDomainCFNetwork];

            if (!v18) {
              continue;
            }
          }
        }
        double v20 = [v10 errorComment];
        id v21 = [v20 length];

        if (v21)
        {
          NSErrorUserInfoKey v31 = NSDebugDescriptionErrorKey;
          float v22 = [v10 errorComment];
          v32 = v22;
          double v23 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        }
        else
        {
          double v23 = 0;
        }
        double v24 = [v10 errorDomain];
        id v19 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v24, [v10 errorStatusCode], v23);

        uint32_t v25 = BKAudiobooksBKAVLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_250CC(v10, v25);
        }

        goto LABEL_24;
      }
      id v7 = [v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
      id v19 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v19 = 0;
  }
LABEL_24:

  return v19;
}

- (void)_setInternalVolumeAndNotify:(float)a3
{
  if (vabdd_f64(self->_volume, a3) >= 0.00999999978)
  {
    self->_volume = a3;
    id v6 = [(BKAVPlayer *)self delegate];
    *(float *)&double v5 = a3;
    [v6 player:self volumeDidChange:v5];
  }
}

- (void)_reevaluateVolumeFromPlayer
{
  id v6 = [(BKAVPlayer *)self player];
  unsigned __int8 v3 = [v6 outputContext];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 canSetVolume];
    [v4 volume];
    -[BKAVPlayer _reevaluateInternalVolumeWithContextCanSetVolume:volume:](self, "_reevaluateInternalVolumeWithContextCanSetVolume:volume:", v5);
  }
}

- (void)_reevaluateInternalVolumeWithContextCanSetVolume:(BOOL)a3 volume:(float)a4
{
  if (a3)
  {
    -[BKAVPlayer _setInternalVolumeAndNotify:](self, "_setInternalVolumeAndNotify:");
  }
  else
  {
    id v5 = [(BKAVPlayer *)self player];
    [v5 volume];
    -[BKAVPlayer _setInternalVolumeAndNotify:](self, "_setInternalVolumeAndNotify:");
  }
}

- (void)_processOutputContextVolumeNotification:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];
  id v6 = BUDynamicCast();

  if (v6)
  {
    id v7 = [v6 contextID];
    id v8 = [v7 copy];

    objc_initWeak(&location, self);
    unsigned __int8 v9 = [v6 canSetVolume];
    [v6 volume];
    int v11 = v10;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    id v16[2] = sub_B34C;
    v16[3] = &unk_3CA70;
    objc_copyWeak(&v19, &location);
    id v12 = v8;
    id v17 = v12;
    unsigned int v18 = self;
    unsigned __int8 v21 = v9;
    int v20 = v11;
    int v13 = objc_retainBlock(v16);
    if (v13)
    {
      if (+[NSThread isMainThread])
      {
        ((void (*)(void *))v13[2])(v13);
      }
      else
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_B3DC;
        v14[3] = &unk_3C6C0;
        id v15 = v13;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
      }
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  p_int audibleDRMGroupID = &self->_audibleDRMGroupID;
  id v6 = a4;
  id v15 = +[NSData dataWithBytes:p_audibleDRMGroupID length:4];
  id v7 = +[AVContentKeyResponse contentKeyResponseWithAuthorizationTokenData:](AVContentKeyResponse, "contentKeyResponseWithAuthorizationTokenData:");
  [v6 processContentKeyResponse:v7];

  self->_isAudibleDRMGroupAuthorized = 1;
  id v8 = [(BKAVPlayer *)self pendingAssetAuth];

  if (v8)
  {
    unsigned __int8 v9 = [(BKAVPlayer *)self pendingAssetAuth];
    int v10 = [v9 asset];

    int v11 = [(AVContentKeySession *)self->_contentKeySession contentKeyRecipients];
    unsigned __int8 v12 = [v11 containsObject:v10];

    if ((v12 & 1) == 0) {
      [(AVContentKeySession *)self->_contentKeySession addContentKeyRecipient:v10];
    }
    int v13 = [(BKAVPlayer *)self pendingAssetAuth];
    unsigned int v14 = [v13 completion];

    if (v14) {
      ((void (**)(void, void *))v14)[2](v14, v10);
    }

    [(BKAVPlayer *)self setPendingAssetAuth:0];
  }
}

- (void)updateTimeObservers
{
  if ([(BKAVPlayer *)self needsToUpdateTimeObservers])
  {
    [(BKAVPlayer *)self _removeAllTimeObserversWithClearObservedTimes:0];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [(BKAVPlayer *)self observedTimes];
    id v3 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v3)
    {
      char v4 = 0;
      uint64_t v19 = *(void *)v24;
      double v5 = 9.22337204e18;
      do
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if (v7) {
            [*(id *)(*((void *)&v23 + 1) + 8 * i) CMTimeValue];
          }
          else {
            memset(&time, 0, sizeof(time));
          }
          double Seconds = CMTimeGetSeconds(&time);
          unsigned __int8 v9 = BKAudiobooksBKAVLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            double v28 = Seconds;
            _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "adding time observer: %.1f", buf, 0xCu);
          }

          objc_initWeak((id *)buf, self);
          int v10 = [(BKAVPlayer *)self player];
          int v11 = +[NSArray arrayWithObject:v7];
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_B934;
          v20[3] = &unk_3C800;
          v21[1] = *(id *)&Seconds;
          objc_copyWeak(v21, (id *)buf);
          unsigned __int8 v12 = [v10 addBoundaryTimeObserverForTimes:v11 queue:0 usingBlock:v20];

          int v13 = [(BKAVPlayer *)self timeObservers];
          [v13 setObject:v12 forKeyedSubscript:v7];

          if ((v4 & 1) != 0 || ![(BKAVPlayer *)self isCurrentTimeValid])
          {
            char v4 = 1;
          }
          else
          {
            [(BKAVPlayer *)self currentTime];
            char v4 = 0;
            if (Seconds <= v14) {
              double v5 = Seconds;
            }
          }

          objc_destroyWeak(v21);
          objc_destroyWeak((id *)buf);
        }
        id v3 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v3);

      [(BKAVPlayer *)self setNeedsToUpdateTimeObservers:0];
      if (v4)
      {
        id v15 = BKAudiobooksBKAVLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_25184();
        }
      }
      else if (v5 != 9.22337204e18)
      {
        BOOL v16 = BKAudiobooksBKAVLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v28 = v5;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "recently passed time: %.1f", buf, 0xCu);
        }

        id v17 = [(BKAVPlayer *)self delegate];
        [v17 player:self didReachPosition:v5];
      }
    }
    else
    {

      [(BKAVPlayer *)self setNeedsToUpdateTimeObservers:0];
    }
  }
}

- (void)addTimeObserver:(double)a3
{
  if (a3 >= 0.0)
  {
    CMTimeMakeWithSeconds(&v6, a3, 1000000000);
    id v3 = +[NSValue valueWithCMTime:&v6];
    double v5 = [(BKAVPlayer *)self observedTimes];
    [v5 addObject:v3];

    [(BKAVPlayer *)self setNeedsToUpdateTimeObservers:1];
  }
  else
  {
    id v3 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_251B8(v3);
    }
  }
}

- (void)removeTimeObserver:(double)a3
{
  CMTimeMakeWithSeconds(&v6, a3, 1000000000);
  char v4 = +[NSValue valueWithCMTime:&v6];
  double v5 = [(BKAVPlayer *)self observedTimes];
  [v5 removeObject:v4];

  [(BKAVPlayer *)self setNeedsToUpdateTimeObservers:1];
}

- (void)removeAllTimeObservers
{
}

- (void)_removeAllTimeObserversWithClearObservedTimes:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = BKAudiobooksBKAVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "remove time observers on player", buf, 2u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  CMTime v6 = [(BKAVPlayer *)self timeObservers];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      int v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v10);
        unsigned __int8 v12 = [(BKAVPlayer *)self timeObservers];
        int v13 = [v12 objectForKeyedSubscript:v11];

        if (v13)
        {
          double v14 = [(BKAVPlayer *)self player];
          [v14 removeTimeObserver:v13];
        }
        int v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }

  id v15 = [(BKAVPlayer *)self timeObservers];
  [v15 removeAllObjects];

  if (v3)
  {
    BOOL v16 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "clear observed times", buf, 2u);
    }

    id v17 = [(BKAVPlayer *)self observedTimes];
    [v17 removeAllObjects];
  }
}

- (void)_addPeriodicTimeObserver
{
  BOOL v3 = [(BKAVPlayer *)self periodicTimeObserver];

  if (!v3)
  {
    objc_initWeak(&location, self);
    char v4 = [(BKAVPlayer *)self player];
    CMTimeMakeWithSeconds(&v8, 1.0, 1000000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_BEB8;
    v6[3] = &unk_3CA98;
    objc_copyWeak(&v7, &location);
    double v5 = [v4 addPeriodicTimeObserverForInterval:&v8 queue:0 usingBlock:v6];

    [(BKAVPlayer *)self setPeriodicTimeObserver:v5];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_removePeriodicTimeObserver
{
  BOOL v3 = [(BKAVPlayer *)self periodicTimeObserver];

  if (v3)
  {
    char v4 = [(BKAVPlayer *)self player];
    double v5 = [(BKAVPlayer *)self periodicTimeObserver];
    [v4 removeTimeObserver:v5];

    [(BKAVPlayer *)self setPeriodicTimeObserver:0];
  }
}

- (int)audibleDRMGroupID
{
  return self->_audibleDRMGroupID;
}

- (void)setAudibleDRMGroupID:(int)a3
{
  self->_int audibleDRMGroupID = a3;
}

- (BKAVPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKAVPlayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (BOOL)isStalling
{
  return self->_isStalling;
}

- (BOOL)isLoadingResources
{
  return self->_isLoadingResources;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (AVPlayer)player
{
  return self->_player;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (AVContentKeySession)contentKeySession
{
  return self->_contentKeySession;
}

- (void)setContentKeySession:(id)a3
{
}

- (AVAssetResourceLoaderDelegate)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
}

- (double)pendingCurrentTime
{
  return self->_pendingCurrentTime;
}

- (void)setPendingCurrentTime:(double)a3
{
  self->_pendingCurrentTime = a3;
}

- (float)playFadeInTime
{
  return self->_playFadeInTime;
}

- (void)setPlayFadeInTime:(float)a3
{
  self->_playFadeInTime = a3;
}

- (NSMutableDictionary)timeObservers
{
  return self->_timeObservers;
}

- (void)setTimeObservers:(id)a3
{
}

- (NSMutableArray)observedTimes
{
  return self->_observedTimes;
}

- (void)setObservedTimes:(id)a3
{
}

- (id)periodicTimeObserver
{
  return self->_periodicTimeObserver;
}

- (void)setPeriodicTimeObserver:(id)a3
{
}

- (BOOL)needsToUpdateTimeObservers
{
  return self->_needsToUpdateTimeObservers;
}

- (void)setNeedsToUpdateTimeObservers:(BOOL)a3
{
  self->_needsToUpdateTimeObservers = a3;
}

- (double)lastPosition
{
  return self->_lastPosition;
}

- (void)setLastPosition:(double)a3
{
  self->_lastPosition = a3;
}

- (double)lastSeekPosition
{
  return self->_lastSeekPosition;
}

- (void)setLastSeekPosition:(double)a3
{
  self->_lastSeekPosition = a3;
}

- (BOOL)wasPlayingBeforeScrubbing
{
  return self->_wasPlayingBeforeScrubbing;
}

- (void)setWasPlayingBeforeScrubbing:(BOOL)a3
{
  self->_wasPlayingBeforeScrubbing = a3;
}

- (unint64_t)scrubDispatchAfterGeneration
{
  return self->_scrubDispatchAfterGeneration;
}

- (void)setScrubDispatchAfterGeneration:(unint64_t)a3
{
  self->_scrubDispatchAfterGeneration = a3;
}

- (BOOL)isPlayingPreview
{
  return self->_playingPreview;
}

- (void)setPlayingPreview:(BOOL)a3
{
  self->_playingPreview = a3;
}

- (BOOL)isScrubPausable
{
  return self->_scrubPausable;
}

- (void)setScrubPausable:(BOOL)a3
{
  self->_scrubPausable = a3;
}

- (unint64_t)scrubPausableDispatchAfterGeneration
{
  return self->_scrubPausableDispatchAfterGeneration;
}

- (void)setScrubPausableDispatchAfterGeneration:(unint64_t)a3
{
  self->_scrubPausableDispatchAfterGeneration = a3;
}

- (BOOL)wasInterrupted
{
  return self->_wasInterrupted;
}

- (void)setWasInterrupted:(BOOL)a3
{
  self->_wasInterrupted = a3;
}

- (BOOL)wasInterruptedEarly
{
  return self->_wasInterruptedEarly;
}

- (void)setWasInterruptedEarly:(BOOL)a3
{
  self->_wasInterruptedEarly = a3;
}

- (OS_dispatch_queue)hlsQueue
{
  return self->_hlsQueue;
}

- (void)setHlsQueue:(id)a3
{
}

- (OS_dispatch_queue)outputContextQueue
{
  return self->_outputContextQueue;
}

- (void)setOutputContextQueue:(id)a3
{
}

- (OS_dispatch_queue)accessLogQueue
{
  return self->_accessLogQueue;
}

- (void)setAccessLogQueue:(id)a3
{
}

- (BKPendingAssetAuthorization)pendingAssetAuth
{
  return self->_pendingAssetAuth;
}

- (void)setPendingAssetAuth:(id)a3
{
}

- (BOOL)isAudibleDRMGroupAuthorized
{
  return self->_isAudibleDRMGroupAuthorized;
}

- (void)setIsAudibleDRMGroupAuthorized:(BOOL)a3
{
  self->_isAudibleDRMGroupAuthorized = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTolerance
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- (NSArray)currentLoadedTimeRanges
{
  return self->_currentLoadedTimeRanges;
}

- (void)setCurrentLoadedTimeRanges:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedLoadedTimeRanges
{
  return self->_coalescedLoadedTimeRanges;
}

- (void)setCoalescedLoadedTimeRanges:(id)a3
{
}

- (BOOL)isStopping
{
  return self->_isStopping;
}

- (void)setIsStopping:(BOOL)a3
{
  self->_isStopping = a3;
}

- (float)lastBitrate
{
  return self->_lastBitrate;
}

- (void)setLastBitrate:(float)a3
{
  self->_lastBitrate = a3;
}

- (void)setOutputContextID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContextID, 0);
  objc_storeStrong((id *)&self->_coalescedLoadedTimeRanges, 0);
  objc_storeStrong((id *)&self->_currentLoadedTimeRanges, 0);
  objc_storeStrong((id *)&self->_pendingAssetAuth, 0);
  objc_storeStrong((id *)&self->_accessLogQueue, 0);
  objc_storeStrong((id *)&self->_outputContextQueue, 0);
  objc_storeStrong((id *)&self->_hlsQueue, 0);
  objc_storeStrong(&self->_periodicTimeObserver, 0);
  objc_storeStrong((id *)&self->_observedTimes, 0);
  objc_storeStrong((id *)&self->_timeObservers, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end