@interface CRLAVPlayerController
+ (BOOL)automaticallyNotifiesObserversOfRate;
+ (BOOL)p_canApplyVolumeRampAtRate:(float)a3;
+ (id)keyPathsForValuesAffectingAbsoluteDuration;
+ (id)keyPathsForValuesAffectingCanFastForward;
+ (id)keyPathsForValuesAffectingCanFastReverse;
+ (id)keyPathsForValuesAffectingCurrentAsset;
+ (id)keyPathsForValuesAffectingDuration;
+ (id)keyPathsForValuesAffectingEndTime;
+ (id)keyPathsForValuesAffectingExternalPlaybackActive;
+ (id)keyPathsForValuesAffectingHasCurrentTime;
+ (id)keyPathsForValuesAffectingRate;
+ (id)keyPathsForValuesAffectingStartTime;
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)p_endCMTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)p_startCMTime;
- (AVAsset)currentAsset;
- (AVPlayerPlaybackCoordinator)playbackCoordinator;
- (AVQueuePlayer)player;
- (BOOL)canFastForward;
- (BOOL)canFastReverse;
- (BOOL)canPlay;
- (BOOL)hasCurrentTime;
- (BOOL)isExternalPlaybackActive;
- (BOOL)isFastForwarding;
- (BOOL)isFastReversing;
- (BOOL)isPlaying;
- (BOOL)isScrubbing;
- (BOOL)p_canFastForwardAtCurrentTime;
- (BOOL)p_canFastReverseAtCurrentTime;
- (BOOL)p_notifyDelegateOfPlaybackErrorIfNeeded;
- (BOOL)p_shouldUsePlayerLooperAtRate:(float)a3 timeRange:(id *)a4;
- (CRLAVPlayerController)initWithAssets:(id)a3 initialAssetIndex:(unint64_t)a4 delegate:(id)a5;
- (CRLAVPlayerController)initWithInitialPlayerItem:(id)a3 enqueuedAssets:(id)a4 initialEnqueuedAssetIndex:(unint64_t)a5 delegate:(id)a6;
- (CRLAVPlayerController)initWithPlayerItem:(id)a3 delegate:(id)a4;
- (CRLAVPlayerControllerPlayerItemMediating)playerItemMediator;
- (double)absoluteCurrentTime;
- (double)absoluteDuration;
- (double)currentTime;
- (double)duration;
- (double)endTime;
- (double)remainingTime;
- (double)startTime;
- (float)rate;
- (float)volume;
- (id)addPeriodicTimeObserverForInterval:(double)a3 block:(id)a4;
- (id)delegate;
- (id)newLayer;
- (id)newRenderable;
- (id)p_addTimeObserverForTime:(id *)a3 handler:(id)a4;
- (id)p_workingPlayerItems;
- (int64_t)remotePause;
- (int64_t)remotePlay;
- (int64_t)repeatMode;
- (void)addObservationToken:(id)a3;
- (void)attachAVPlayerViewController:(id)a3;
- (void)beginScrubbing;
- (void)cancelPendingSeeks;
- (void)dealloc;
- (void)endScrubbing;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_applicationDidResignActive;
- (void)p_applyConstantVolumeToPlayerItem:(id)a3;
- (void)p_applyPendingRateIfNeeded;
- (void)p_applyRate:(float)a3;
- (void)p_clearVolumeRampFromPlayerItem;
- (void)p_enqueueAssetsFromIndex:(unint64_t)a3;
- (void)p_notifyPlayerItemMediatorWithRate:(float)a3;
- (void)p_playerItemDidJumpTime:(id)a3;
- (void)p_playerItemDidPlayToEndTime:(id)a3;
- (void)p_playerItemDidPlayToEndTimeAtRate:(float)a3;
- (void)p_updateAutomaticallyWaitsToMinimizeStalling;
- (void)p_updatePlayerItemsAndApplyRate:(float)a3;
- (void)removeObservationToken:(id)a3;
- (void)removePeriodicTimeObserver:(id)a3;
- (void)scrubToTime:(double)a3 withTolerance:(double)a4;
- (void)scrubToTime:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5;
- (void)seekBackwardByOneFrame;
- (void)seekForwardByOneFrame;
- (void)seekToBeginning;
- (void)seekToEnd;
- (void)setEndTime:(double)a3;
- (void)setFastForwarding:(BOOL)a3;
- (void)setFastReversing:(BOOL)a3;
- (void)setPlayerItemMediator:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setRate:(float)a3;
- (void)setRepeatMode:(int64_t)a3;
- (void)setStartTime:(double)a3;
- (void)setVolume:(float)a3;
- (void)setVolume:(float)a3 rampDuration:(double)a4;
- (void)setupRemoteTransportControls;
- (void)skipToAssetAtIndex:(unint64_t)a3;
- (void)stopSynchronously;
- (void)teardown;
- (void)updateNowPlaying;
- (void)updatePlayingToMatchPlayer;
@end

@implementation CRLAVPlayerController

- (id)newRenderable
{
  id v2 = [(CRLAVPlayerController *)self newLayer];
  v3 = +[CRLCanvasRenderable renderableFromLayer:v2];

  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
    CFStringRef v4 = @"CRLAVPlayerControllerDisableGaplessLooping";
    v5 = &__kCFBooleanFalse;
    v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
    [v2 registerDefaults:v3];
  }
}

- (CRLAVPlayerController)initWithPlayerItem:(id)a3 delegate:(id)a4
{
  return [(CRLAVPlayerController *)self initWithInitialPlayerItem:a3 enqueuedAssets:&__NSArray0__struct initialEnqueuedAssetIndex:0x7FFFFFFFFFFFFFFFLL delegate:a4];
}

- (CRLAVPlayerController)initWithAssets:(id)a3 initialAssetIndex:(unint64_t)a4 delegate:(id)a5
{
  return [(CRLAVPlayerController *)self initWithInitialPlayerItem:0 enqueuedAssets:a3 initialEnqueuedAssetIndex:a4 delegate:a5];
}

- (CRLAVPlayerController)initWithInitialPlayerItem:(id)a3 enqueuedAssets:(id)a4 initialEnqueuedAssetIndex:(unint64_t)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CRLAVPlayerController;
  v13 = [(CRLAVPlayerController *)&v22 init];
  if (v13)
  {
    v14 = (NSArray *)[v11 copy];
    mEnqueuedAssets = v13->mEnqueuedAssets;
    v13->mEnqueuedAssets = v14;

    v13->mRepeatMode = 0;
    v13->mVolume = 1.0;
    v13->mPendingRate = NAN;
    objc_storeStrong((id *)&v13->mDelegate, a6);
    v16 = (AVQueuePlayer *)objc_alloc_init((Class)AVQueuePlayer);
    mPlayer = v13->mPlayer;
    v13->mPlayer = v16;

    [(AVQueuePlayer *)v13->mPlayer setActionAtItemEnd:2 * ([(NSArray *)v13->mEnqueuedAssets count] == 0)];
    [(AVQueuePlayer *)v13->mPlayer addObserver:v13 forKeyPath:@"currentItem" options:7 context:off_10166D880];
    [(AVQueuePlayer *)v13->mPlayer addObserver:v13 forKeyPath:@"rate" options:7 context:off_10166D888];
    [(AVQueuePlayer *)v13->mPlayer addObserver:v13 forKeyPath:@"status" options:4 context:off_10166D890];
    [(AVQueuePlayer *)v13->mPlayer addObserver:v13 forKeyPath:@"currentItem.status" options:4 context:off_10166D898];
    v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mObservationTokens = v13->mObservationTokens;
    v13->mObservationTokens = v18;

    LODWORD(v20) = 1.0;
    [(AVQueuePlayer *)v13->mPlayer setVolume:v20];
    if (v10) {
      [(AVQueuePlayer *)v13->mPlayer replaceCurrentItemWithPlayerItem:v10];
    }
    if (a5 != 0x7FFFFFFFFFFFFFFFLL) {
      [(CRLAVPlayerController *)v13 p_enqueueAssetsFromIndex:a5];
    }
  }

  return v13;
}

- (void)dealloc
{
  if (self->mDelegate || self->mPlayerItemMediator)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE538);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109F3E8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE558);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    CFStringRef v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:172 isFatal:0 description:"-teardown must be called before dealloc"];
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLAVPlayerController;
  [(CRLAVPlayerController *)&v6 dealloc];
}

- (void)teardown
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE578);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109F4F8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE598);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    CFStringRef v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController teardown]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:176 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if ([(CRLAVPlayerController *)self isPlaying]
    || [(CRLAVPlayerController *)self isFastReversing]
    || [(CRLAVPlayerController *)self isFastForwarding])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE5B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109F470();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE5D8);
    }
    objc_super v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController teardown]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:178 isFatal:0 description:"player controller should not be playing when it is told to teardown"];
  }
  if (qword_101719CD0 != -1) {
    dispatch_once(&qword_101719CD0, &stru_1014EE5F8);
  }
  v9 = off_10166D878;
  if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v31 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: teardown", buf, 0xCu);
  }
  long long v10 = *(_OWORD *)&kCMTimeRangeInvalid.start.epoch;
  *(_OWORD *)&self->mPlayerItemTimeRange.start.value = *(_OWORD *)&kCMTimeRangeInvalid.start.value;
  *(_OWORD *)&self->mPlayerItemTimeRange.start.epoch = v10;
  *(_OWORD *)&self->mPlayerItemTimeRange.duration.timescale = *(_OWORD *)&kCMTimeRangeInvalid.duration.timescale;
  self->mIsPlayerItemTimeRangeForScrubbing = 0;
  [(AVPlayerLooper *)self->mPlayerLooper disableLooping];
  mPlayerLooper = self->mPlayerLooper;
  self->mPlayerLooper = 0;

  id v12 = [(CRLAVPlayerController *)self player];
  [v12 setRate:0.0];
  v13 = [v12 currentItem];
  if (v13)
  {
    v14 = +[NSNotificationCenter defaultCenter];
    [v14 removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:v13];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 removeObserver:self name:AVPlayerItemTimeJumpedNotification object:v13];
  }
  [v12 removeObserver:self forKeyPath:@"currentItem" context:off_10166D880];
  [v12 removeObserver:self forKeyPath:@"rate" context:off_10166D888];
  [v12 removeObserver:self forKeyPath:@"currentItem.status" context:off_10166D898];
  [v12 removeObserver:self forKeyPath:@"status" context:off_10166D890];
  [v12 replaceCurrentItemWithPlayerItem:0];
  mDelegate = self->mDelegate;
  self->mDelegate = 0;

  mPlayerItemMediator = self->mPlayerItemMediator;
  self->mPlayerItemMediator = 0;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v18 = self->mObservationTokens;
  id v19 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        -[CRLAVPlayerController crl_removeObserverForToken:](self, "crl_removeObserverForToken:", *(void *)(*((void *)&v25 + 1) + 8 * i), (void)v25);
      }
      id v20 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v20);
  }

  mVolumeRampPlayerItem = self->mVolumeRampPlayerItem;
  self->mVolumeRampPlayerItem = 0;

  if (self->mVolumeRampBoundaryTimeObserver)
  {
    [v12 removeTimeObserver];
    id mVolumeRampBoundaryTimeObserver = self->mVolumeRampBoundaryTimeObserver;
    self->id mVolumeRampBoundaryTimeObserver = 0;
  }
}

- (void)attachAVPlayerViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLAVPlayerController *)self player];
  [v4 setPlayer:v5];
}

- (AVAsset)currentAsset
{
  id v2 = [(CRLAVPlayerController *)self player];
  v3 = [v2 currentItem];
  id v4 = [v3 asset];

  return (AVAsset *)v4;
}

- (AVPlayerPlaybackCoordinator)playbackCoordinator
{
  id v2 = [(CRLAVPlayerController *)self player];
  v3 = [v2 playbackCoordinator];

  return (AVPlayerPlaybackCoordinator *)v3;
}

+ (id)keyPathsForValuesAffectingCurrentAsset
{
  return +[NSSet setWithObject:@"player.currentItem.asset"];
}

- (BOOL)isExternalPlaybackActive
{
  id v2 = [(CRLAVPlayerController *)self player];
  unsigned __int8 v3 = [v2 isExternalPlaybackActive];

  return v3;
}

+ (id)keyPathsForValuesAffectingExternalPlaybackActive
{
  return +[NSSet setWithObject:@"player.externalPlaybackActive"];
}

- (id)newLayer
{
  id v3 = objc_alloc_init((Class)AVPlayerLayer);
  id v4 = [(CRLAVPlayerController *)self player];
  [v3 setPlayer:v4];

  [v3 setVideoGravity:AVLayerVideoGravityResize];
  return v3;
}

- (BOOL)p_shouldUsePlayerLooperAtRate:(float)a3 timeRange:(id *)a4
{
  v7 = [(CRLAVPlayerController *)self player];
  v8 = [v7 currentItem];

  v9 = [v8 asset];
  int64_t v10 = [(CRLAVPlayerController *)self repeatMode];
  LOBYTE(v11) = 0;
  if (a3 >= 0.0 && v10 == 1 && v8)
  {
    if ((a4->var0.var2 & 1) != 0 && (a4->var1.var2 & 1) != 0 && !a4->var1.var3)
    {
      p_var1 = &a4->var1;
      if ((a4->var1.var0 & 0x8000000000000000) == 0)
      {
        *(_OWORD *)&time1.value = *(_OWORD *)&p_var1->var0;
        time1.CMTimeEpoch epoch = a4->var1.var3;
        long long v21 = *(_OWORD *)&kCMTimeZero.value;
        *(_OWORD *)&time2.value = *(_OWORD *)&kCMTimeZero.value;
        CMTimeEpoch epoch = kCMTimeZero.epoch;
        time2.CMTimeEpoch epoch = epoch;
        if (CMTimeCompare(&time1, &time2))
        {
          unsigned int var2 = a4->var0.var2;
          if ((var2 & 1) == 0
            || (unsigned int v16 = a4->var1.var2, (v16 & 1) == 0)
            || a4->var1.var3
            || p_var1->var0 < 0
            || ((v16 | var2) & 0x10) == 0)
          {
            CMTime time1 = (CMTime)a4->var0;
            *(_OWORD *)&time2.value = v21;
            time2.CMTimeEpoch epoch = epoch;
            if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0
              && ![(CRLAVPlayerController *)self isScrubbing]
              && ![(NSArray *)self->mEnqueuedAssets count])
            {
              uint64_t v17 = objc_opt_class();
              v18 = sub_1002469D0(v17, v9);
              id v19 = [v18 URL];
              if (!v19)
              {
                LOBYTE(v11) = 0;
LABEL_28:

                goto LABEL_8;
              }
              id v20 = v19;
              if ([v19 isFileURL])
              {
              }
              else
              {
                unsigned int v11 = [v20 isFileReferenceURL];

                if (!v11) {
                  goto LABEL_8;
                }
              }
              if (objc_msgSend(v9, "providesPreciseDurationAndTiming", v21)
                && [v9 statusOfValueForKey:@"duration" error:0] == (id)2)
              {
                v18 = +[NSUserDefaults standardUserDefaults];
                unsigned int v11 = [v18 BOOLForKey:@"CRLAVPlayerControllerDisableGaplessLooping"] ^ 1;
                goto LABEL_28;
              }
            }
          }
        }
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_8:

  return v11;
}

- (void)p_updatePlayerItemsAndApplyRate:(float)a3
{
  id v5 = [(CRLAVPlayerController *)self player];
  objc_super v6 = [v5 currentItem];
  long long v53 = 0uLL;
  CMTimeEpoch v54 = 0;
  [(CRLAVPlayerController *)self p_startCMTime];
  long long v51 = 0uLL;
  CMTimeEpoch v52 = 0;
  [(CRLAVPlayerController *)self p_endCMTime];
  memset(&v50, 0, sizeof(v50));
  *(_OWORD *)&start.start.value = v53;
  start.start.CMTimeEpoch epoch = v54;
  *(_OWORD *)&end.start.value = v51;
  end.start.CMTimeEpoch epoch = v52;
  CMTimeRangeFromTimeToTime(&v50, &start.start, &end.start);
  BOOL v7 = [(CRLAVPlayerController *)self isScrubbing];
  p_mPlayerLooper = &self->mPlayerLooper;
  mPlayerLooper = self->mPlayerLooper;
  CMTimeRange start = v50;
  unsigned int v10 = [(CRLAVPlayerController *)self p_shouldUsePlayerLooperAtRate:&start timeRange:COERCE_DOUBLE(__PAIR64__(v50.duration.flags, LODWORD(a3)))];
  long long v11 = *(_OWORD *)&self->mPlayerItemTimeRange.start.epoch;
  *(_OWORD *)&start.start.value = *(_OWORD *)&self->mPlayerItemTimeRange.start.value;
  *(_OWORD *)&start.start.CMTimeEpoch epoch = v11;
  *(_OWORD *)&start.duration.timescale = *(_OWORD *)&self->mPlayerItemTimeRange.duration.timescale;
  CMTimeRange end = v50;
  if (CMTimeRangeEqual(&start, &end) && self->mIsPlayerItemTimeRangeForScrubbing == v7 && (mPlayerLooper != 0) == v10) {
    goto LABEL_43;
  }
  p_mPlayerItemTimeRange = &self->mPlayerItemTimeRange;
  self->mIsUpdatingPlayerItems = 1;
  long long v14 = *(_OWORD *)&v50.start.epoch;
  *(_OWORD *)&self->mPlayerItemTimeRange.start.value = *(_OWORD *)&v50.start.value;
  *(_OWORD *)&self->mPlayerItemTimeRange.start.CMTimeEpoch epoch = v14;
  *(_OWORD *)&self->mPlayerItemTimeRange.duration.timescale = *(_OWORD *)&v50.duration.timescale;
  self->mIsPlayerItemTimeRangeForScrubbing = v7;
  [(CRLAVPlayerController *)self p_notifyPlayerItemMediatorWithRate:0.0];
  [v5 setRate:0.0];
  memset(&end, 0, 24);
  if (v6) {
    [v6 currentTime];
  }
  if (mPlayerLooper)
  {
    [(AVPlayerLooper *)*p_mPlayerLooper disableLooping];
    v15 = *p_mPlayerLooper;
    *p_mPlayerLooper = 0;
  }
  if (v10)
  {
    id v16 = objc_alloc((Class)AVPlayerLooper);
    long long v17 = *(_OWORD *)&self->mPlayerItemTimeRange.start.epoch;
    *(_OWORD *)&start.start.value = *(_OWORD *)&p_mPlayerItemTimeRange->start.value;
    *(_OWORD *)&start.start.CMTimeEpoch epoch = v17;
    *(_OWORD *)&start.duration.timescale = *(_OWORD *)&self->mPlayerItemTimeRange.duration.timescale;
    v18 = (AVPlayerLooper *)[v16 initWithPlayer:v5 templateItem:v6 timeRange:&start];
    id v19 = *p_mPlayerLooper;
    *p_mPlayerLooper = v18;

    if ((id)[(AVPlayerLooper *)*p_mPlayerLooper status] == (id)2)
    {
      if (qword_101719CD0 != -1) {
        dispatch_once(&qword_101719CD0, &stru_1014EE618);
      }
      id v20 = off_10166D878;
      if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_ERROR)) {
        sub_10109F580((uint64_t)self, (id *)&self->mPlayerLooper, v20);
      }
      [(AVPlayerLooper *)*p_mPlayerLooper disableLooping];
      long long v21 = *p_mPlayerLooper;
      *p_mPlayerLooper = 0;
    }
  }
  objc_super v22 = [v5 currentItem];
  if (v22)
  {
    memset(&v48, 0, sizeof(v48));
    CMTime time = end.start;
    long long v23 = *(_OWORD *)&self->mPlayerItemTimeRange.start.epoch;
    *(_OWORD *)&start.start.value = *(_OWORD *)&p_mPlayerItemTimeRange->start.value;
    *(_OWORD *)&start.start.CMTimeEpoch epoch = v23;
    *(_OWORD *)&start.duration.timescale = *(_OWORD *)&self->mPlayerItemTimeRange.duration.timescale;
    CMTimeClampToRange(&v48, &time, &start);
    if ((v48.flags & 0x1D) == 1)
    {
      start.CMTimeRange start = v48;
      CMTime time = kCMTimeZero;
      CMTime v46 = time;
      [v22 seekToTime:&start toleranceBefore:&time toleranceAfter:&v46 completionHandler:0];
    }
    if (!*p_mPlayerLooper)
    {
      v24 = (const CMTime *)&v53;
      if (self->mIsPlayerItemTimeRangeForScrubbing) {
        v24 = &kCMTimeInvalid;
      }
      long long v44 = *(_OWORD *)&v24->value;
      CMTimeEpoch epoch = v24->epoch;
      long long v42 = v44;
      CMTimeEpoch v43 = epoch;
      [v22 setReversePlaybackEndTime:&v42];
      long long v25 = (const CMTime *)&v51;
      if (self->mIsPlayerItemTimeRangeForScrubbing) {
        long long v25 = &kCMTimeInvalid;
      }
      long long v40 = *(_OWORD *)&v25->value;
      CMTimeEpoch v41 = v25->epoch;
      long long v38 = v40;
      CMTimeEpoch v39 = v41;
      [v22 setForwardPlaybackEndTime:&v38];
    }
  }
  self->mIsUpdatingPlayerItems = 0;
  if (self->mPlayerLooper)
  {
    if (qword_101719CD0 != -1) {
      dispatch_once(&qword_101719CD0, &stru_1014EE638);
    }
    long long v26 = off_10166D878;
    if (!os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    LODWORD(start.start.value) = 134217984;
    *(CMTimeValue *)((char *)&start.start.value + 4) = (CMTimeValue)self;
    long long v27 = "CRLAVPlayerController %p: Did set up new player looper.";
  }
  else
  {
    if (!mPlayerLooper) {
      goto LABEL_35;
    }
    if (qword_101719CD0 != -1) {
      dispatch_once(&qword_101719CD0, &stru_1014EE658);
    }
    long long v26 = off_10166D878;
    if (!os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    LODWORD(start.start.value) = 134217984;
    *(CMTimeValue *)((char *)&start.start.value + 4) = (CMTimeValue)self;
    long long v27 = "CRLAVPlayerController %p: Did tear down player looper.";
  }
  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&start, 0xCu);
LABEL_35:
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v28 = [(CRLAVPlayerController *)self p_workingPlayerItems];
  id v29 = [v28 countByEnumeratingWithState:&v34 objects:v55 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v35;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(v28);
        }
        [(CRLAVPlayerController *)self p_applyConstantVolumeToPlayerItem:*(void *)(*((void *)&v34 + 1) + 8 * i)];
      }
      id v30 = [v28 countByEnumeratingWithState:&v34 objects:v55 count:16];
    }
    while (v30);
  }

LABEL_43:
  *(float *)&double v12 = a3;
  [(CRLAVPlayerController *)self p_notifyPlayerItemMediatorWithRate:v12];
  *(float *)&double v33 = a3;
  [(CRLAVPlayerController *)self p_applyRate:v33];
}

- (id)p_workingPlayerItems
{
  mPlayerLooper = self->mPlayerLooper;
  if (mPlayerLooper)
  {
    id v4 = [(AVPlayerLooper *)mPlayerLooper loopingPlayerItems];
  }
  else
  {
    id v5 = [(CRLAVPlayerController *)self player];
    id v4 = [v5 items];
  }

  return v4;
}

- (double)duration
{
  id v3 = [(CRLAVPlayerController *)self player];
  id v4 = [v3 currentItem];

  if (v4 && (memset(&v10[1], 0, sizeof(CMTime)), [v4 duration], (unsigned __int128)0 >> 96 == 1))
  {
    [(CRLAVPlayerController *)self endTime];
    v10[0] = v10[1];
    double v6 = fmin(v5, CMTimeGetSeconds(v10));
    [(CRLAVPlayerController *)self startTime];
    double v8 = fmax(v6 - v7, 0.0);
  }
  else
  {
    double v8 = NAN;
  }

  return v8;
}

+ (id)keyPathsForValuesAffectingDuration
{
  return +[NSSet setWithObjects:@"player.currentItem.duration", @"startTime", @"endTime", 0];
}

- (double)absoluteDuration
{
  id v2 = [(CRLAVPlayerController *)self player];
  id v3 = [v2 currentItem];

  if (v3 && (memset(&v6[1], 0, sizeof(CMTime)), [v3 duration], (unsigned __int128)0 >> 96 == 1))
  {
    v6[0] = v6[1];
    double Seconds = CMTimeGetSeconds(v6);
  }
  else
  {
    double Seconds = NAN;
  }

  return Seconds;
}

+ (id)keyPathsForValuesAffectingAbsoluteDuration
{
  return +[NSSet setWithObjects:@"player.currentItem.duration", 0];
}

- (double)startTime
{
  memset(&v3[1], 0, sizeof(CMTime));
  [(CRLAVPlayerController *)self p_startCMTime];
  if ((unsigned __int128)0 >> 96 != 1) {
    return NAN;
  }
  v3[0] = v3[1];
  return CMTimeGetSeconds(v3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)p_startCMTime
{
  *retstr = ($3CC8671D27C23BF42ADDB32F2B5E48AE)kCMTimeInvalid;
  double v5 = [(CRLAVPlayerController *)self player];
  id v8 = [v5 currentItem];

  if (v8)
  {
    if ((self->mStartCMTime.flags & 0x1D) == 1) {
      p_value = &self->mStartCMTime.value;
    }
    else {
      p_value = &kCMTimeZero;
    }
    *(_OWORD *)&retstr->var0 = *(_OWORD *)p_value;
    retstr->var3 = p_value[2];
  }

  return result;
}

- (void)setStartTime:(double)a3
{
  memset(&v6, 0, sizeof(v6));
  CMTimeMakeWithSeconds(&v6, a3, +[CRLCommonConstants timeScale]);
  CMTime time1 = (CMTime)self->mStartCMTime;
  CMTime v4 = v6;
  if (CMTimeCompare(&time1, &v4))
  {
    self->mStartCMTime = ($95D729B680665BEAEFA1D6FCA8238556)v6;
    [(CRLAVPlayerController *)self rate];
    -[CRLAVPlayerController p_updatePlayerItemsAndApplyRate:](self, "p_updatePlayerItemsAndApplyRate:");
  }
}

+ (id)keyPathsForValuesAffectingStartTime
{
  return +[NSSet setWithObject:@"player.currentItem"];
}

- (double)endTime
{
  memset(&v3[1], 0, sizeof(CMTime));
  [(CRLAVPlayerController *)self p_endCMTime];
  if ((unsigned __int128)0 >> 96 != 1) {
    return NAN;
  }
  v3[0] = v3[1];
  return CMTimeGetSeconds(v3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)p_endCMTime
{
  *retstr = ($3CC8671D27C23BF42ADDB32F2B5E48AE)kCMTimeInvalid;
  double v5 = [(CRLAVPlayerController *)self player];
  CMTime v6 = [v5 currentItem];

  if (v6)
  {
    if ((self->mEndCMTime.flags & 0x1D) == 1)
    {
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->mEndCMTime.value;
      retstr->var3 = self->mEndCMTime.epoch;
    }
    else
    {
      double v7 = [v6 asset];
      id v8 = v7;
      if (v7)
      {
        [v7 duration];
      }
      else
      {
        long long v10 = 0uLL;
        int64_t v11 = 0;
      }
      *(_OWORD *)&retstr->var0 = v10;
      retstr->var3 = v11;
    }
  }

  return result;
}

- (void)setEndTime:(double)a3
{
  memset(&v6, 0, sizeof(v6));
  CMTimeMakeWithSeconds(&v6, a3, +[CRLCommonConstants timeScale]);
  CMTime time1 = (CMTime)self->mEndCMTime;
  CMTime v4 = v6;
  if (CMTimeCompare(&time1, &v4))
  {
    self->mEndCMTime = ($95D729B680665BEAEFA1D6FCA8238556)v6;
    [(CRLAVPlayerController *)self rate];
    -[CRLAVPlayerController p_updatePlayerItemsAndApplyRate:](self, "p_updatePlayerItemsAndApplyRate:");
  }
}

+ (id)keyPathsForValuesAffectingEndTime
{
  return +[NSSet setWithObject:@"player.currentItem.asset.duration"];
}

- (void)setRepeatMode:(int64_t)a3
{
  if (self->mRepeatMode != a3)
  {
    self->int64_t mRepeatMode = a3;
    [(CRLAVPlayerController *)self rate];
    int64_t mRepeatMode = self->mRepeatMode;
    if (v4 >= 0.0 || mRepeatMode == 2) {
      float v7 = v4;
    }
    else {
      float v7 = 1.0;
    }
    if (mRepeatMode != 1)
    {
      mPlayerLooper = self->mPlayerLooper;
      if (mPlayerLooper)
      {
        [(AVPlayerLooper *)mPlayerLooper disableLooping];
        v9 = self->mPlayerLooper;
        self->mPlayerLooper = 0;
      }
    }
    [(CRLAVPlayerController *)self p_updateAutomaticallyWaitsToMinimizeStalling];
    [(CRLAVPlayerController *)self rate];
    if (*(float *)&v10 != v7)
    {
      *(float *)&double v10 = v7;
      [(CRLAVPlayerController *)self p_updatePlayerItemsAndApplyRate:v10];
    }
  }
}

- (void)setVolume:(float)a3
{
  if (self->mVolume != a3)
  {
    self->mVolume = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    float v4 = [(CRLAVPlayerController *)self p_workingPlayerItems];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [(CRLAVPlayerController *)self p_applyConstantVolumeToPlayerItem:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)setVolume:(float)a3 rampDuration:(double)a4
{
  if (self->mVolume != a3)
  {
    p_mVolumeRampPlayerItem = &self->mVolumeRampPlayerItem;
    mVolumeRampPlayerItem = self->mVolumeRampPlayerItem;
    self->mVolumeRampPlayerItem = 0;

    if (p_mVolumeRampPlayerItem[1])
    {
      long long v9 = [(CRLAVPlayerController *)self player];
      [v9 removeTimeObserver:self->mVolumeRampBoundaryTimeObserver];
      id mVolumeRampBoundaryTimeObserver = self->mVolumeRampBoundaryTimeObserver;
      self->id mVolumeRampBoundaryTimeObserver = 0;
    }
    [(CRLAVPlayerController *)self volume];
    unsigned int v12 = v11;
    self->mVolume = a3;
    v13 = objc_opt_class();
    [(CRLAVPlayerController *)self rate];
    if (objc_msgSend(v13, "p_canApplyVolumeRampAtRate:"))
    {
      memset(&v47, 0, sizeof(v47));
      CMTimeMakeWithSeconds(&v47, a4, +[CRLCommonConstants timeScale]);
      memset(&v46, 0, sizeof(v46));
      mPlayer = self->mPlayer;
      if (mPlayer) {
        [(AVQueuePlayer *)mPlayer currentTime];
      }
      memset(&v45, 0, sizeof(v45));
      CMTime lhs = v46;
      CMTime rhs = v47;
      CMTimeAdd(&v45, &lhs, &rhs);
      v15 = [(AVQueuePlayer *)self->mPlayer currentItem];
      if (v15)
      {
        id v33 = objc_alloc_init((Class)AVMutableAudioMix);
        id v16 = [v15 asset];
        long long v17 = [v16 tracksWithMediaType:AVMediaTypeAudio];

        id v18 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v17 count]];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v19 = v17;
        id v20 = [v19 countByEnumeratingWithState:&v39 objects:v49 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v40;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v40 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              id v25 = objc_alloc_init((Class)AVMutableAudioMixInputParameters);
              [v25 setTrackID:[v24 trackID]];
              CMTime lhs = v46;
              [v25 setVolume:&lhs atTime:COERCE_DOUBLE(__PAIR64__(HIDWORD(v46.value), v12)));
              CMTime lhs = v45;
              [v25 setVolume:&lhs atTime:COERCE_DOUBLE(__PAIR64__(HIDWORD(v45.value), LODWORD(a3)))]
              [v18 addObject:v25];
            }
            id v21 = [v19 countByEnumeratingWithState:&v39 objects:v49 count:16];
          }
          while (v21);
        }

        [v33 setInputParameters:v18];
        [v15 setAudioMix:v33];
        objc_storeStrong((id *)p_mVolumeRampPlayerItem, v15);
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100327B4C;
        v38[3] = &unk_1014CBBB0;
        v38[4] = self;
        CMTime lhs = v45;
        long long v26 = [(CRLAVPlayerController *)self p_addTimeObserverForTime:&lhs handler:v38];
        id v27 = self->mVolumeRampBoundaryTimeObserver;
        self->id mVolumeRampBoundaryTimeObserver = v26;
      }
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v28 = [(CRLAVPlayerController *)self p_workingPlayerItems];
    id v29 = [v28 countByEnumeratingWithState:&v34 objects:v48 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v35;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v35 != v31) {
            objc_enumerationMutation(v28);
          }
          if (*(AVPlayerItem **)(*((void *)&v34 + 1) + 8 * (void)j) != *p_mVolumeRampPlayerItem) {
            -[CRLAVPlayerController p_applyConstantVolumeToPlayerItem:](self, "p_applyConstantVolumeToPlayerItem:");
          }
        }
        id v30 = [v28 countByEnumeratingWithState:&v34 objects:v48 count:16];
      }
      while (v30);
    }
  }
}

+ (BOOL)p_canApplyVolumeRampAtRate:(float)a3
{
  return a3 >= 0.0;
}

- (void)p_clearVolumeRampFromPlayerItem
{
  if (self->mVolumeRampPlayerItem) {
    -[CRLAVPlayerController p_applyConstantVolumeToPlayerItem:](self, "p_applyConstantVolumeToPlayerItem:");
  }
}

- (void)p_applyConstantVolumeToPlayerItem:(id)a3
{
  float v4 = (AVPlayerItem *)a3;
  [(CRLAVPlayerController *)self volume];
  float v6 = v5;
  if (self->mVolumeRampPlayerItem == v4)
  {
    self->mVolumeRampPlayerItem = 0;

    if (self->mVolumeRampBoundaryTimeObserver)
    {
      uint64_t v7 = [(CRLAVPlayerController *)self player];
      [v7 removeTimeObserver:self->mVolumeRampBoundaryTimeObserver];
      id mVolumeRampBoundaryTimeObserver = self->mVolumeRampBoundaryTimeObserver;
      self->id mVolumeRampBoundaryTimeObserver = 0;
    }
  }
  if (v6 == 1.0)
  {
    id v20 = 0;
  }
  else
  {
    id v21 = objc_alloc_init((Class)AVMutableAudioMix);
    long long v9 = [(AVPlayerItem *)v4 asset];
    long long v10 = [v9 tracksWithMediaType:AVMediaTypeAudio];

    id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v26;
      long long v22 = *(_OWORD *)&kCMTimeZero.value;
      CMTimeEpoch epoch = kCMTimeZero.epoch;
      do
      {
        long long v17 = 0;
        do
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          id v18 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v17);
          id v19 = objc_alloc_init((Class)AVMutableAudioMixInputParameters);
          [v19 setTrackID:[v18 trackID]];
          long long v23 = v22;
          CMTimeEpoch v24 = epoch;
          [v19 setVolume:&v23 atTime:COERCE_DOUBLE(__PAIR64__(DWORD1(v22), LODWORD(v6)))]
          [v11 addObject:v19];

          long long v17 = (char *)v17 + 1;
        }
        while (v14 != v17);
        id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }

    id v20 = v21;
    [v21 setInputParameters:v11];
  }
  [(AVPlayerItem *)v4 setAudioMix:v20];
}

- (BOOL)hasCurrentTime
{
  id v2 = [(CRLAVPlayerController *)self player];
  id v3 = [v2 currentItem];

  if (v3) {
    BOOL v4 = [v3 status] == (id)1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)keyPathsForValuesAffectingHasCurrentTime
{
  return +[NSSet setWithObject:@"player.currentItem.status"];
}

- (double)absoluteCurrentTime
{
  double v3 = 0.0;
  if ([(CRLAVPlayerController *)self hasCurrentTime])
  {
    BOOL v4 = [(CRLAVPlayerController *)self player];
    float v5 = [v4 currentItem];

    if (v5) {
      [v5 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double v3 = fmax(CMTimeGetSeconds(&time), 0.0);
  }
  return v3;
}

- (double)currentTime
{
  double v3 = 0.0;
  if ([(CRLAVPlayerController *)self hasCurrentTime])
  {
    BOOL v4 = [(CRLAVPlayerController *)self player];
    float v5 = [v4 currentItem];

    if (v5) {
      [v5 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
    [(CRLAVPlayerController *)self startTime];
    double v8 = Seconds - v7;
    [(CRLAVPlayerController *)self endTime];
    double v3 = sub_100407E48(v8, 0.0, v9);
  }
  return v3;
}

- (double)remainingTime
{
  double v3 = 0.0;
  if ([(CRLAVPlayerController *)self hasCurrentTime])
  {
    BOOL v4 = [(CRLAVPlayerController *)self player];
    float v5 = [v4 currentItem];

    [(CRLAVPlayerController *)self endTime];
    double v7 = v6;
    if (v5) {
      [v5 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double v3 = fmax(v7 - fmax(CMTimeGetSeconds(&time), 0.0), 0.0);
  }
  return v3;
}

- (BOOL)isScrubbing
{
  return self->mScrubbingCount != 0;
}

- (void)beginScrubbing
{
  unint64_t mScrubbingCount = self->mScrubbingCount;
  if (!mScrubbingCount)
  {
    BOOL v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"CRLAVPlayerControllerWillBeginScrubbingNotification" object:self];

    unint64_t mScrubbingCount = self->mScrubbingCount;
  }
  self->unint64_t mScrubbingCount = mScrubbingCount + 1;
  if (qword_101719CD0 != -1) {
    dispatch_once(&qword_101719CD0, &stru_1014EE678);
  }
  float v5 = off_10166D878;
  if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = self->mScrubbingCount;
    int v8 = 134218240;
    double v9 = self;
    __int16 v10 = 2048;
    unint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: beginScrubbing count %tu", (uint8_t *)&v8, 0x16u);
  }
  if (self->mScrubbingCount == 1)
  {
    [(CRLAVPlayerController *)self rate];
    self->mRateBeforeScrubbing = v7;
    [(CRLAVPlayerController *)self setRate:0.0];
  }
}

- (void)scrubToTime:(double)a3 withTolerance:(double)a4
{
}

- (void)scrubToTime:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  if (![(CRLAVPlayerController *)self isScrubbing])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE698);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109F6D4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE6B8);
    }
    double v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    __int16 v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController scrubToTime:withTolerance:completionHandler:]");
    unint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:768 isFatal:0 description:"scrubbed to time when not in a scrubbing operation"];
  }
  memset(&v19, 0, sizeof(v19));
  CMTimeMakeWithSeconds(&v19, a3, +[CRLCommonConstants timeScale]);
  memset(&v18, 0, sizeof(v18));
  CMTimeMakeWithSeconds(&v18, a4, +[CRLCommonConstants timeScale]);
  memset(&v17, 0, sizeof(v17));
  CMTimeMakeWithSeconds(&v17, a4, +[CRLCommonConstants timeScale]);
  id v12 = [(CRLAVPlayerController *)self player];
  id v13 = v12;
  CMTime v16 = v19;
  CMTime v15 = v18;
  CMTime v14 = v17;
  if (v8) {
    [v12 seekToTime:&v16 toleranceBefore:&v15 toleranceAfter:&v14 completionHandler:v8];
  }
  else {
    [v12 seekToTime:&v16 toleranceBefore:&v15 toleranceAfter:&v14];
  }
}

- (void)cancelPendingSeeks
{
  id v3 = [(CRLAVPlayerController *)self player];
  id v2 = [v3 currentItem];
  [v2 cancelPendingSeeks];
}

- (void)endScrubbing
{
  unint64_t mScrubbingCount = self->mScrubbingCount;
  if (mScrubbingCount) {
    goto LABEL_11;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EE6D8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10109F75C();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EE6F8);
  }
  BOOL v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v4);
  }
  float v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController endScrubbing]");
  unint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:786 isFatal:0 description:"Uneven begin/end scrubbing calls!"];

  unint64_t mScrubbingCount = self->mScrubbingCount;
  if (mScrubbingCount)
  {
LABEL_11:
    unint64_t v7 = mScrubbingCount - 1;
    self->unint64_t mScrubbingCount = v7;
    if (!v7)
    {
      memset(&buf, 0, sizeof(buf));
      id v8 = [(CRLAVPlayerController *)self player];
      double v9 = v8;
      if (v8) {
        [v8 currentTime];
      }
      else {
        memset(&buf, 0, sizeof(buf));
      }

      memset(&v24, 0, sizeof(v24));
      [(CRLAVPlayerController *)self p_endCMTime];
      if ((unsigned __int128)0 >> 96 == 1)
      {
        CMTime time1 = buf;
        CMTime time2 = v24;
        unsigned int v10 = CMTimeCompare(&time1, &time2) >> 31;
      }
      else
      {
        unsigned int v10 = 1;
      }
      memset(&time1, 0, sizeof(time1));
      [(CRLAVPlayerController *)self p_startCMTime];
      if ((time1.flags & 0x1D) == 1)
      {
        CMTime time2 = buf;
        CMTime v21 = time1;
        BOOL v11 = CMTimeCompare(&time2, &v21) < 1;
      }
      else
      {
        BOOL v11 = 0;
      }
      float mRateBeforeScrubbing = self->mRateBeforeScrubbing;
      if (mRateBeforeScrubbing <= 0.0) {
        int v13 = 1;
      }
      else {
        int v13 = v10;
      }
      if (mRateBeforeScrubbing >= 0.0) {
        BOOL v11 = 0;
      }
      if (v13 == 1 && !v11)
      {
        -[CRLAVPlayerController setRate:](self, "setRate:");
        CMTime v18 = +[NSNotificationCenter defaultCenter];
        [v18 postNotificationName:@"CRLAVPlayerControllerDidEndScrubbingNotification" object:self];
      }
      else
      {
        if ([(CRLAVPlayerController *)self repeatMode])
        {
          *(float *)&double v15 = self->mRateBeforeScrubbing;
          [(CRLAVPlayerController *)self setRate:v15];
        }
        CMTime v16 = +[NSNotificationCenter defaultCenter];
        [v16 postNotificationName:@"CRLAVPlayerControllerDidEndScrubbingNotification" object:self];

        *(float *)&double v17 = self->mRateBeforeScrubbing;
        [(CRLAVPlayerController *)self p_playerItemDidPlayToEndTimeAtRate:v17];
      }
    }
    if (qword_101719CD0 != -1) {
      dispatch_once(&qword_101719CD0, &stru_1014EE718);
    }
    CMTime v19 = off_10166D878;
    if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v20 = self->mScrubbingCount;
      LODWORD(buf.value) = 134218240;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      LOWORD(buf.flags) = 2048;
      *(void *)((char *)&buf.flags + 2) = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: endScrubbing count %tu", (uint8_t *)&buf, 0x16u);
    }
  }
}

- (void)seekForwardByOneFrame
{
  id v3 = [(CRLAVPlayerController *)self player];
  BOOL v4 = [v3 currentItem];

  if (v4
    && (memset(&v10, 0, sizeof(v10)),
        [(CRLAVPlayerController *)self p_endCMTime],
        (unsigned __int128)0 >> 96 == 1))
  {
    float v5 = [(CRLAVPlayerController *)self player];
    unint64_t v6 = v5;
    if (v5) {
      [v5 currentTime];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    CMTime v8 = v10;
    BOOL v7 = CMTimeCompare(&time1, &v8) >= 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  if ([v4 canStepForward] && !v7) {
    [v4 stepByCount:1];
  }
}

- (void)seekBackwardByOneFrame
{
  id v3 = [(CRLAVPlayerController *)self player];
  BOOL v4 = [v3 currentItem];

  if (v4
    && (memset(&v10, 0, sizeof(v10)),
        [(CRLAVPlayerController *)self p_startCMTime],
        (unsigned __int128)0 >> 96 == 1))
  {
    float v5 = [(CRLAVPlayerController *)self player];
    unint64_t v6 = v5;
    if (v5) {
      [v5 currentTime];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    CMTime v8 = v10;
    BOOL v7 = CMTimeCompare(&time1, &v8) < 1;
  }
  else
  {
    BOOL v7 = 0;
  }
  if ([v4 canStepBackward] && !v7) {
    [v4 stepByCount:-1];
  }
}

- (void)seekToBeginning
{
  id v3 = [(CRLAVPlayerController *)self player];
  [(CRLAVPlayerController *)self p_startCMTime];
  [v3 seekToTime:v4];
}

- (void)seekToEnd
{
  id v3 = [(CRLAVPlayerController *)self player];
  [(CRLAVPlayerController *)self p_endCMTime];
  [v3 seekToTime:v4];
}

- (void)updatePlayingToMatchPlayer
{
  id v3 = [(CRLAVPlayerController *)self player];
  id v8 = v3;
  if (self->mPlaying)
  {
    [v3 rate];
    if (v4 == 0.0)
    {
      BOOL v5 = 0;
      unint64_t v6 = v8;
      goto LABEL_7;
    }
    unint64_t v6 = v8;
    if (self->mPlaying) {
      goto LABEL_8;
    }
  }
  [v8 rate];
  unint64_t v6 = v8;
  if (v7 <= 0.0) {
    goto LABEL_8;
  }
  BOOL v5 = 1;
LABEL_7:
  self->mPlaying = v5;
LABEL_8:
}

- (void)setPlaying:(BOOL)a3
{
  CMTimeFlags v3 = a3;
  if (a3
    && [(CRLAVPlayerController *)self p_notifyDelegateOfPlaybackErrorIfNeeded])
  {
    if (qword_101719CD0 != -1) {
      dispatch_once(&qword_101719CD0, &stru_1014EE738);
    }
    BOOL v5 = off_10166D878;
    if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 134217984;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Not playing because a playback error occurred.", (uint8_t *)&buf, 0xCu);
    }
  }
  else if (self->mPlaying != v3)
  {
    if (qword_101719CD0 != -1) {
      dispatch_once(&qword_101719CD0, &stru_1014EE758);
    }
    unint64_t v6 = off_10166D878;
    if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 134218240;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      LOWORD(buf.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.flags + 2) = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: setPlaying %i", (uint8_t *)&buf, 0x12u);
    }
    self->mPlaying = v3;
    if (v3)
    {
      float v7 = [(CRLAVPlayerController *)self player];
      [v7 rate];
      if (*(float *)&v8 == 0.0)
      {
        double v9 = [v7 currentItem];
        CMTime v10 = v9;
        memset(&buf, 0, sizeof(buf));
        if (v9) {
          [v9 currentTime];
        }
        memset(&v18, 0, sizeof(v18));
        [(CRLAVPlayerController *)self p_startCMTime];
        memset(&v17, 0, sizeof(v17));
        [(CRLAVPlayerController *)self p_endCMTime];
        CMTimeMake(&rhs, 1, 100);
        CMTimeSubtract(&v17, &lhs, &rhs);
        CMTime time1 = buf;
        CMTime time2 = v18;
        if (CMTimeCompare(&time1, &time2) < 0 || (time1 = buf, CMTime time2 = v17, CMTimeCompare(&time1, &time2) >= 1))
        {
          CMTime time1 = v18;
          CMTime time2 = kCMTimeZero;
          CMTime v12 = time2;
          [v10 seekToTime:&time1 toleranceBefore:&time2 toleranceAfter:&v12 completionHandler:0];
          BOOL v11 = +[NSNotificationCenter defaultCenter];
          [v11 postNotificationName:@"CRLAVPlayerControllerWillPlayFromStartNotification" object:self];
        }
      }
      LODWORD(v8) = 1.0;
      [(CRLAVPlayerController *)self p_applyRate:v8];
    }
    else
    {
      [(CRLAVPlayerController *)self p_applyRate:0.0];
    }
    [(CRLAVPlayerController *)self setFastReversing:0];
    [(CRLAVPlayerController *)self setFastForwarding:0];
  }
}

+ (BOOL)automaticallyNotifiesObserversOfRate
{
  return 0;
}

+ (id)keyPathsForValuesAffectingRate
{
  return +[NSSet setWithObject:@"player.rate"];
}

- (float)rate
{
  CMTimeFlags v3 = [(CRLAVPlayerController *)self player];
  float v4 = v3;
  if (fabsf(self->mPendingRate) == INFINITY
    || ([v3 currentItem],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 status],
        v5,
        v6 == (id)1))
  {
    [v4 rate];
    float mPendingRate = v7;
  }
  else
  {
    float mPendingRate = self->mPendingRate;
  }

  return mPendingRate;
}

- (void)setRate:(float)a3
{
  float v3 = a3;
  if (a3 == 0.0
    || ![(CRLAVPlayerController *)self p_notifyDelegateOfPlaybackErrorIfNeeded])
  {
    a3 = v3;
    [(CRLAVPlayerController *)self p_updatePlayerItemsAndApplyRate:*(double *)&a3];
  }
  else
  {
    if (qword_101719CD0 != -1) {
      dispatch_once(&qword_101719CD0, &stru_1014EE778);
    }
    BOOL v5 = off_10166D878;
    if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218240;
      float v7 = self;
      __int16 v8 = 2048;
      double v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Not setting rate to %f because a playback error occurred.", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)p_applyRate:(float)a3
{
  BOOL v5 = [(CRLAVPlayerController *)self player];
  [(CRLAVPlayerController *)self rate];
  if (v6 != a3)
  {
    float v7 = [v5 currentItem];
    id v8 = [v7 status];

    if (v8)
    {
      if (qword_101719CD0 != -1) {
        dispatch_once(&qword_101719CD0, &stru_1014EE7B8);
      }
      double v9 = off_10166D878;
      if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134218240;
        int v13 = self;
        __int16 v14 = 2048;
        double v15 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Applying rate %f.", (uint8_t *)&v12, 0x16u);
      }
      *(float *)&double v10 = a3;
      [v5 setRate:v10];
      [(CRLAVPlayerController *)self updateNowPlaying];
    }
    else
    {
      if (qword_101719CD0 != -1) {
        dispatch_once(&qword_101719CD0, &stru_1014EE798);
      }
      BOOL v11 = off_10166D878;
      if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134218240;
        int v13 = self;
        __int16 v14 = 2048;
        double v15 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Saving pending rate %f because the current player item is not yet ready.", (uint8_t *)&v12, 0x16u);
      }
      [(CRLAVPlayerController *)self willChangeValueForKey:@"rate"];
      self->float mPendingRate = a3;
      [(CRLAVPlayerController *)self didChangeValueForKey:@"rate"];
    }
  }
}

- (void)p_applyPendingRateIfNeeded
{
  if (fabsf(self->mPendingRate) != INFINITY)
  {
    if (qword_101719CD0 != -1) {
      dispatch_once(&qword_101719CD0, &stru_1014EE7D8);
    }
    float v3 = off_10166D878;
    if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
    {
      double mPendingRate = self->mPendingRate;
      int v8 = 134218240;
      double v9 = self;
      __int16 v10 = 2048;
      double v11 = mPendingRate;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Applying pending rate %f.", (uint8_t *)&v8, 0x16u);
    }
    float v5 = self->mPendingRate;
    self->double mPendingRate = NAN;
    float v6 = [(CRLAVPlayerController *)self player];
    *(float *)&double v7 = v5;
    [v6 setRate:v7];
  }
}

- (void)stopSynchronously
{
  [(CRLAVPlayerController *)self p_clearVolumeRampFromPlayerItem];
  [(CRLAVPlayerController *)self setPlaying:0];
  [(CRLAVPlayerController *)self setRate:0.0];
  float v3 = [CRLAVPlayerControllerVideoDisplayBarrier alloc];
  float v4 = [(CRLAVPlayerController *)self player];
  float v5 = [(CRLAVPlayerControllerVideoDisplayBarrier *)v3 initWithPlayer:v4];

  [(CRLAVPlayerControllerVideoDisplayBarrier *)v5 waitUntilAllVideoFramesAreDisplayed];
}

+ (id)keyPathsForValuesAffectingCanFastReverse
{
  if (qword_1016A9688 != -1) {
    dispatch_once(&qword_1016A9688, &stru_1014EE7F8);
  }
  id v2 = (void *)qword_1016A9680;

  return v2;
}

- (BOOL)canFastReverse
{
  id v2 = [(CRLAVPlayerController *)self player];
  float v3 = [v2 currentItem];
  unsigned __int8 v4 = [v3 canPlayFastReverse];

  return v4;
}

- (BOOL)p_canFastReverseAtCurrentTime
{
  float v3 = [(CRLAVPlayerController *)self player];
  unsigned __int8 v4 = [v3 currentItem];
  if ([v4 canPlayFastReverse])
  {
    [v3 rate];
    if (v5 == 0.0)
    {
      memset(&v10[1], 0, sizeof(CMTime));
      if (v4) {
        [v4 currentTime];
      }
      memset(v10, 0, 24);
      [(CRLAVPlayerController *)self p_startCMTime];
      CMTime time1 = v10[1];
      CMTime v8 = v10[0];
      BOOL v6 = CMTimeCompare(&time1, &v8) > 0;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setFastReversing:(BOOL)a3
{
  if (a3)
  {
    if ([(CRLAVPlayerController *)self p_notifyDelegateOfPlaybackErrorIfNeeded])
    {
      if (qword_101719CD0 != -1) {
        dispatch_once(&qword_101719CD0, &stru_1014EE818);
      }
      unsigned __int8 v4 = off_10166D878;
      if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        CMTime v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Not fast reversing because a playback error occurred.", (uint8_t *)&v7, 0xCu);
      }
    }
    else if (!self->mFastReversing {
           && [(CRLAVPlayerController *)self p_canFastReverseAtCurrentTime])
    }
    {
      self->mFastReversing = 1;
      LODWORD(v6) = -2.0;
      [(CRLAVPlayerController *)self setRate:v6];
      [(CRLAVPlayerController *)self setFastForwarding:0];
    }
  }
  else if (self->mFastReversing)
  {
    self->mFastReversing = 0;
    if (![(CRLAVPlayerController *)self isFastForwarding])
    {
      if ([(CRLAVPlayerController *)self isPlaying]) {
        LODWORD(v5) = 1.0;
      }
      else {
        double v5 = 0.0;
      }
      [(CRLAVPlayerController *)self setRate:v5];
    }
  }
}

+ (id)keyPathsForValuesAffectingCanFastForward
{
  if (qword_1016A9698 != -1) {
    dispatch_once(&qword_1016A9698, &stru_1014EE838);
  }
  id v2 = (void *)qword_1016A9690;

  return v2;
}

- (BOOL)canFastForward
{
  id v2 = [(CRLAVPlayerController *)self player];
  float v3 = [v2 currentItem];
  unsigned __int8 v4 = [v3 canPlayFastForward];

  return v4;
}

- (BOOL)p_canFastForwardAtCurrentTime
{
  float v3 = [(CRLAVPlayerController *)self player];
  unsigned __int8 v4 = [v3 currentItem];
  if ([v4 canPlayFastForward])
  {
    [v3 rate];
    if (v5 == 0.0)
    {
      memset(&v10[1], 0, sizeof(CMTime));
      if (v4) {
        [v4 currentTime];
      }
      memset(v10, 0, 24);
      [(CRLAVPlayerController *)self p_endCMTime];
      CMTime time1 = v10[1];
      CMTime v8 = v10[0];
      unsigned int v6 = CMTimeCompare(&time1, &v8) >> 31;
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)setFastForwarding:(BOOL)a3
{
  if (a3)
  {
    if ([(CRLAVPlayerController *)self p_notifyDelegateOfPlaybackErrorIfNeeded])
    {
      if (qword_101719CD0 != -1) {
        dispatch_once(&qword_101719CD0, &stru_1014EE858);
      }
      unsigned __int8 v4 = off_10166D878;
      if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        CMTime v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Not fast forwarding because a playback error occurred.", (uint8_t *)&v7, 0xCu);
      }
    }
    else if (!self->mFastForwarding {
           && [(CRLAVPlayerController *)self p_canFastForwardAtCurrentTime])
    }
    {
      self->mFastForwarding = 1;
      LODWORD(v6) = 2.0;
      [(CRLAVPlayerController *)self setRate:v6];
      [(CRLAVPlayerController *)self setFastReversing:0];
    }
  }
  else if (self->mFastForwarding)
  {
    self->mFastForwarding = 0;
    if (![(CRLAVPlayerController *)self isFastReversing])
    {
      if ([(CRLAVPlayerController *)self isPlaying]) {
        LODWORD(v5) = 1.0;
      }
      else {
        double v5 = 0.0;
      }
      [(CRLAVPlayerController *)self setRate:v5];
    }
  }
}

- (void)skipToAssetAtIndex:(unint64_t)a3
{
  [(CRLAVPlayerController *)self setPlaying:0];
  id v5 = [(CRLAVPlayerController *)self player];
  [v5 removeAllItems];
  [(CRLAVPlayerController *)self p_enqueueAssetsFromIndex:a3];
}

- (void)p_enqueueAssetsFromIndex:(unint64_t)a3
{
  id v5 = [(CRLAVPlayerController *)self player];
  NSUInteger v6 = [(NSArray *)self->mEnqueuedAssets count];
  if (v6 > a3)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    int v7 = -[NSArray subarrayWithRange:](self->mEnqueuedAssets, "subarrayWithRange:", a3, v6 - a3);
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = +[AVPlayerItem playerItemWithAsset:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          [v5 insertItem:v12 afterItem:0];
        }
        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v13 = [(CRLAVPlayerController *)self p_workingPlayerItems];
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [(CRLAVPlayerController *)self p_applyConstantVolumeToPlayerItem:*(void *)(*((void *)&v18 + 1) + 8 * (void)j)];
      }
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }

  [(CRLAVPlayerController *)self rate];
  -[CRLAVPlayerController p_notifyPlayerItemMediatorWithRate:](self, "p_notifyPlayerItemMediatorWithRate:");
}

- (id)p_addTimeObserverForTime:(id *)a3 handler:(id)a4
{
  id v6 = a4;
  int v7 = [(CRLAVPlayerController *)self player];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
  id v8 = +[NSValue valueWithCMTime:&v12];
  int v13 = v8;
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  uint64_t v10 = [v7 addBoundaryTimeObserverForTimes:v9 queue:&_dispatch_main_q usingBlock:v6];

  return v10;
}

- (id)addPeriodicTimeObserverForInterval:(double)a3 block:(id)a4
{
  id v6 = a4;
  int v7 = [(CRLAVPlayerController *)self player];
  CMTimeMakeWithSeconds(&v13, a3, +[CRLCommonConstants timeScale]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10032A2F0;
  v11[3] = &unk_1014EE880;
  id v12 = v6;
  id v8 = v6;
  id v9 = [v7 addPeriodicTimeObserverForInterval:&v13 queue:&_dispatch_main_q usingBlock:v11];

  return v9;
}

- (void)removePeriodicTimeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLAVPlayerController *)self player];
  [v5 removeTimeObserver:v4];
}

- (void)addObservationToken:(id)a3
{
}

- (void)removeObservationToken:(id)a3
{
}

- (void)setPlayerItemMediator:(id)a3
{
  id v5 = (CRLAVPlayerControllerPlayerItemMediating *)a3;
  if (self->mPlayerItemMediator != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->mPlayerItemMediator, a3);
    [(CRLAVPlayerController *)self rate];
    -[CRLAVPlayerController p_notifyPlayerItemMediatorWithRate:](self, "p_notifyPlayerItemMediatorWithRate:");
    id v5 = v6;
  }
}

- (void)p_notifyPlayerItemMediatorWithRate:(float)a3
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE8A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109F7E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE8C0);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController p_notifyPlayerItemMediatorWithRate:]");
    int v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:1203 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  id v8 = [(CRLAVPlayerController *)self playerItemMediator];
  id v9 = [(CRLAVPlayerController *)self p_workingPlayerItems];
  long long v10 = *(_OWORD *)&self->mPlayerItemTimeRange.start.epoch;
  v11[0] = *(_OWORD *)&self->mPlayerItemTimeRange.start.value;
  v11[1] = v10;
  long long v12 = *(_OWORD *)&self->mPlayerItemTimeRange.duration.timescale;
  [v8 playerController:self willUsePlayerItems:v9 atRate:v11 timeRangeForEachPlayerItem:COERCE_DOUBLE(__PAIR64__(DWORD1(v12), LODWORD(a3)))]
}

- (void)p_playerItemDidPlayToEndTimeAtRate:(float)a3
{
  if (qword_101719CD0 != -1) {
    dispatch_once(&qword_101719CD0, &stru_1014EE8E0);
  }
  id v5 = off_10166D878;
  if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 134218240;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: playerItemDidPlayToEndTimeAtRate: %f", buf, 0x16u);
  }
  if ([(NSArray *)self->mEnqueuedAssets count])
  {
    id v6 = [(CRLAVPlayerController *)self player];
    int v7 = [v6 items];
    id v8 = [v7 count];

    if (v8 == (id)1)
    {
      id v9 = +[NSNotificationCenter defaultCenter];
      [v9 postNotificationName:@"CRLAVPlayerControllerDidPlayToEndNotification" object:self];

      int64_t v10 = [(CRLAVPlayerController *)self repeatMode];
      if (!v10 || v10 == 2)
      {
        [(CRLAVPlayerController *)self setRate:0.0];
        id v14 = [(CRLAVPlayerController *)self delegate];
        [v14 playbackDidStopForPlayerController:self];
      }
      else if (v10 == 1)
      {
        [(CRLAVPlayerController *)self p_enqueueAssetsFromIndex:0];
        *(float *)&double v11 = a3;
        [(CRLAVPlayerController *)self setRate:v11];
      }
    }
    goto LABEL_30;
  }
  long long v12 = +[NSNotificationCenter defaultCenter];
  [v12 postNotificationName:@"CRLAVPlayerControllerDidPlayToEndNotification" object:self];

  int64_t v13 = [(CRLAVPlayerController *)self repeatMode];
  if (v13)
  {
    if (v13 == 2)
    {
      if (self->mPlayerLooper)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EE900);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10109F86C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EE920);
        }
        long long v18 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v18);
        }
        long long v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController p_playerItemDidPlayToEndTimeAtRate:]");
        long long v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 1234, 0, "expected nil value for '%{public}s'", "mPlayerLooper");
      }
      memset(buf, 0, sizeof(buf));
      if (a3 >= 0.0) {
        [(CRLAVPlayerController *)self p_endCMTime];
      }
      else {
        [(CRLAVPlayerController *)self p_startCMTime];
      }
      long long v21 = [(CRLAVPlayerController *)self player];
      *(float *)&double v22 = -a3;
      long long v28 = *(_OWORD *)buf;
      uint64_t v29 = *(void *)&buf[16];
      long long v26 = *(_OWORD *)&kCMTimeInvalid.value;
      CMTimeEpoch epoch = kCMTimeInvalid.epoch;
      [v21 setRate:&v28 time:&v26 atHostTime:v22];
      goto LABEL_48;
    }
    if (v13 == 1 && !self->mPlayerLooper)
    {
      memset(buf, 0, sizeof(buf));
      if (a3 >= 0.0) {
        [(CRLAVPlayerController *)self p_startCMTime];
      }
      else {
        [(CRLAVPlayerController *)self p_endCMTime];
      }
      long long v21 = [(CRLAVPlayerController *)self player];
      long long v23 = [v21 currentItem];
      long long v28 = *(_OWORD *)buf;
      uint64_t v29 = *(void *)&buf[16];
      long long v26 = *(_OWORD *)&kCMTimeZero.value;
      CMTimeEpoch epoch = kCMTimeZero.epoch;
      long long v24 = v26;
      CMTimeEpoch v25 = epoch;
      [v23 seekToTime:&v28 toleranceBefore:&v26 toleranceAfter:&v24 completionHandler:0];

LABEL_48:
    }
  }
  else
  {
    if (self->mPlayerLooper)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EE940);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109F900();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EE960);
      }
      id v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v15);
      }
      uint64_t v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController p_playerItemDidPlayToEndTimeAtRate:]");
      CMTime v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 1242, 0, "expected nil value for '%{public}s'", "mPlayerLooper");
    }
    [(CRLAVPlayerController *)self setPlaying:0];
    [(CRLAVPlayerController *)self setFastReversing:0];
    [(CRLAVPlayerController *)self setFastForwarding:0];
    if (a3 > 0.0)
    {
      id v6 = [(CRLAVPlayerController *)self delegate];
      [v6 playbackDidStopForPlayerController:self];
LABEL_30:
    }
  }
}

- (void)p_playerItemDidPlayToEndTime:(id)a3
{
  id v7 = [(CRLAVPlayerController *)self player];
  [v7 rate];
  int v5 = v4;
  [(CRLAVPlayerController *)self p_clearVolumeRampFromPlayerItem];
  LODWORD(v6) = v5;
  [(CRLAVPlayerController *)self p_playerItemDidPlayToEndTimeAtRate:v6];
}

- (BOOL)p_notifyDelegateOfPlaybackErrorIfNeeded
{
  if (!self->mDidNotifyDelegateOfPlaybackError)
  {
    int v4 = [(CRLAVPlayerController *)self player];
    if ([v4 status] == (id)2)
    {
      int v5 = [v4 error];
      if (v5) {
        goto LABEL_17;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EE980);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109FB20();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EE9A0);
      }
      double v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v6);
      }
      id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController p_notifyDelegateOfPlaybackErrorIfNeeded]");
      id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1303, 0, "invalid nil value for '%{public}s'", "error");
    }
    int v5 = [v4 currentItem];
    if ([v5 status] != (id)2)
    {
LABEL_30:

      BOOL mDidNotifyDelegateOfPlaybackError = self->mDidNotifyDelegateOfPlaybackError;
      return mDidNotifyDelegateOfPlaybackError;
    }
    uint64_t v9 = [v5 error];
    if (!v9)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EE9C0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109F994();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EE9E0);
      }
      int64_t v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v13);
      }
      id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerController p_notifyDelegateOfPlaybackErrorIfNeeded]");
      id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 1310, 0, "invalid nil value for '%{public}s'", "error");

      goto LABEL_30;
    }
    int64_t v10 = (void *)v9;

    int v5 = v10;
LABEL_17:
    self->BOOL mDidNotifyDelegateOfPlaybackError = 1;
    double v11 = [(CRLAVPlayerController *)self delegate];
    [v11 playerController:self playbackDidFailWithError:v5];

    if (qword_101719CD0 != -1) {
      dispatch_once(&qword_101719CD0, &stru_1014EEA00);
    }
    long long v12 = off_10166D878;
    if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_ERROR)) {
      sub_10109FA28((uint64_t)self, v12, v5);
    }
    goto LABEL_30;
  }
  return 1;
}

- (void)p_playerItemDidJumpTime:(id)a3
{
  [(CRLAVPlayerController *)self p_clearVolumeRampFromPlayerItem];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"CRLAVPlayerControllerTimeJumpedNotification" object:self userInfo:0];
}

- (void)p_applicationDidResignActive
{
  [(CRLAVPlayerController *)self setupRemoteTransportControls];

  [(CRLAVPlayerController *)self updateNowPlaying];
}

- (void)p_updateAutomaticallyWaitsToMinimizeStalling
{
  id v10 = [(CRLAVPlayerController *)self player];
  uint64_t v3 = objc_opt_class();
  id v4 = [v10 currentItem];
  int v5 = [v4 asset];
  double v6 = sub_1002469D0(v3, v5);

  if (v6)
  {
    id v7 = [v6 URL];
    id v8 = [v7 scheme];

    if ([v8 isEqual:@"http"]) {
      unsigned int v9 = 0;
    }
    else {
      unsigned int v9 = [v8 isEqual:@"https"] ^ 1;
    }
  }
  else
  {
    unsigned int v9 = 1;
  }
  [v10 setAutomaticallyWaitsToMinimizeStalling:(self->mRepeatMode != 2) & ~v9];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int64_t v13 = +[NSNotificationCenter defaultCenter];
  if (off_10166D880 == a6)
  {
    id v14 = [v12 objectForKey:NSKeyValueChangeOldKey];
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:v14];
        [v13 removeObserver:self name:AVPlayerItemTimeJumpedNotification object:v14];
      }
    }
    id v15 = [v12 objectForKey:NSKeyValueChangeNewKey];
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (![(CRLAVPlayerController *)self canPlay])
        {
          uint64_t v16 = [v15 asset];
          CMTime v17 = +[AVAsset crl_playableKeysWithKeys:&off_10155CE90];
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_10032BBDC;
          v46[3] = &unk_1014CBE78;
          id v47 = v16;
          CMTime v48 = self;
          id v18 = v16;
          [v18 loadValuesAsynchronouslyForKeys:v17 completionHandler:v46];
        }
        [v13 addObserver:self selector:"p_playerItemDidPlayToEndTime:" name:AVPlayerItemDidPlayToEndTimeNotification object:v15];
        [v13 addObserver:self selector:"p_playerItemDidJumpTime:" name:AVPlayerItemTimeJumpedNotification object:v15];
        [(CRLAVPlayerController *)self p_updateAutomaticallyWaitsToMinimizeStalling];
        if (!self->mPlayerLooper) {
          [(CRLAVPlayerController *)self p_applyConstantVolumeToPlayerItem:v15];
        }
      }
    }
    goto LABEL_58;
  }
  if (off_10166D890 != a6)
  {
    if (off_10166D898 == a6)
    {
      double v22 = [(CRLAVPlayerController *)self player];
      id v14 = [v22 currentItem];

      id v23 = [v14 status];
      if (v23 == (id)2)
      {
        [(CRLAVPlayerController *)self rate];
        if (v39 != 1.0) {
          [(CRLAVPlayerController *)self p_notifyDelegateOfPlaybackErrorIfNeeded];
        }
      }
      else if (v23 == (id)1)
      {
        [(CRLAVPlayerController *)self p_applyPendingRateIfNeeded];
      }
      goto LABEL_59;
    }
    if (off_10166D888 != a6)
    {
      v43.receiver = self;
      v43.super_class = (Class)CRLAVPlayerController;
      [(CRLAVPlayerController *)&v43 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
      goto LABEL_60;
    }
    uint64_t v24 = objc_opt_class();
    CMTimeEpoch v25 = [v12 objectForKeyedSubscript:NSKeyValueChangeOldKey];
    id v14 = sub_1002469D0(v24, v25);

    float v26 = 0.0;
    float v27 = 0.0;
    if (v14)
    {
      [v14 floatValue];
      float v27 = v28;
    }
    uint64_t v29 = objc_opt_class();
    id v30 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    id v15 = sub_1002469D0(v29, v30);

    if (v15)
    {
      [v15 floatValue];
      float v26 = v31;
    }
    if (v27 != v26)
    {
      v32 = objc_opt_class();
      *(float *)&double v33 = v26;
      if ((objc_msgSend(v32, "p_canApplyVolumeRampAtRate:", v33) & 1) == 0) {
        [(CRLAVPlayerController *)self p_clearVolumeRampFromPlayerItem];
      }
      if (fabsf(self->mPendingRate) != INFINITY)
      {
        if (qword_101719CD0 != -1) {
          dispatch_once(&qword_101719CD0, &stru_1014EEA20);
        }
        long long v34 = off_10166D878;
        if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
        {
          double mPendingRate = self->mPendingRate;
          *(_DWORD *)CMTime buf = 134218496;
          CMTimeRange v50 = self;
          __int16 v51 = 2048;
          double v52 = mPendingRate;
          __int16 v53 = 2048;
          double v54 = v26;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Clearing pending rate %f because the player rate changed to %f.", buf, 0x20u);
        }
        self->double mPendingRate = NAN;
      }
    }
    if (v27 != 0.0 || v26 == 0.0)
    {
      if (v27 != 0.0 && v26 == 0.0)
      {
        [v13 removeObserver:self name:UIApplicationWillResignActiveNotification object:0];
        long long v40 = +[CRLMoviePlaybackRegistry sharedMoviePlaybackRegistry];
        [v40 objectDidEndMoviePlayback:self];

        if (([(CRLAVPlayerController *)self isPlaying]
           || [(CRLAVPlayerController *)self isFastReversing]
           || [(CRLAVPlayerController *)self isFastForwarding])
          && ![(CRLAVPlayerController *)self isScrubbing]
          && !self->mIsUpdatingPlayerItems)
        {
          if (qword_101719CD0 != -1) {
            dispatch_once(&qword_101719CD0, &stru_1014EEB00);
          }
          long long v41 = off_10166D878;
          if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CMTime buf = 134217984;
            CMTimeRange v50 = self;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Player rate changed to 0 while playing, fast reversing, or fast forwarding.", buf, 0xCu);
          }
          Main = CFRunLoopGetMain();
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_10032C380;
          v44[3] = &unk_1014CBBB0;
          v44[4] = self;
          CFRunLoopPerformBlock(Main, kCFRunLoopCommonModes, v44);
          CFRunLoopWakeUp(Main);
        }
      }
    }
    else
    {
      long long v36 = +[CRLMoviePlaybackRegistry sharedMoviePlaybackRegistry];
      [v36 objectWillBeginMoviePlayback:self];

      [v13 addObserver:self selector:"p_applicationDidResignActive" name:UIApplicationWillResignActiveNotification object:0];
      if (self->mWasPlayingBeforeChangeToZeroRate
        || self->mWasFastReversingBeforeChangeToZeroRate
        || self->mWasFastForwardingBeforeChangeToZeroRate)
      {
        if (qword_101719CD0 != -1) {
          dispatch_once(&qword_101719CD0, &stru_1014EEA40);
        }
        long long v37 = off_10166D878;
        if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTime buf = 134218240;
          CMTimeRange v50 = self;
          __int16 v51 = 2048;
          double v52 = v26;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "CRLAVPlayerController %p: Player rate changed to %f after changing to 0 while playing, fast reversing, or fast forwarding.", buf, 0x16u);
        }
        long long v38 = CFRunLoopGetMain();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10032BE08;
        block[3] = &unk_1014CBBB0;
        block[4] = self;
        CFRunLoopPerformBlock(v38, kCFRunLoopCommonModes, block);
      }
    }
LABEL_58:

LABEL_59:
    goto LABEL_60;
  }
  long long v19 = [(CRLAVPlayerController *)self player];
  id v20 = [v19 status];

  if (v20 == (id)2)
  {
    [(CRLAVPlayerController *)self rate];
    if (v21 != 1.0) {
      [(CRLAVPlayerController *)self p_notifyDelegateOfPlaybackErrorIfNeeded];
    }
  }
LABEL_60:
}

- (void)updateNowPlaying
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  id v4 = [(CRLAVPlayerController *)self delegate];
  int v5 = [v4 nowPlayingTitleWithPlaybackController:self];

  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:MPMediaItemPropertyTitle];
  }
  uint64_t v20 = 0;
  float v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_10032C9D8;
  uint64_t v24 = sub_10032C9E8;
  double v6 = [(CRLAVPlayerController *)self delegate];
  id v25 = [v6 nowPlayingImageProviderWithPlaybackController:self];

  if (v21[5])
  {
    id v7 = objc_alloc((Class)MPMediaItemArtwork);
    [(id)v21[5] naturalSize];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10032C9F0;
    v19[3] = &unk_1014EEB88;
    v19[4] = &v20;
    id v8 = [v7 initWithBoundsSize:v19];
    [v3 setObject:v8 forKeyedSubscript:MPMediaItemPropertyArtwork];
  }
  unsigned int v9 = [(CRLAVPlayerController *)self player];
  id v10 = [v9 currentItem];

  if (v10) {
    [v10 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  id v11 = +[NSNumber numberWithDouble:CMTimeGetSeconds(&time)];
  [v3 setObject:v11 forKeyedSubscript:MPNowPlayingInfoPropertyElapsedPlaybackTime];

  id v12 = [v10 asset];
  int64_t v13 = v12;
  if (v12) {
    [v12 duration];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  id v14 = +[NSNumber numberWithDouble:CMTimeGetSeconds(&v17)];
  [v3 setObject:v14 forKeyedSubscript:MPMediaItemPropertyPlaybackDuration];

  [(CRLAVPlayerController *)self rate];
  id v15 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v3 setObject:v15 forKeyedSubscript:MPNowPlayingInfoPropertyPlaybackRate];

  uint64_t v16 = +[MPNowPlayingInfoCenter defaultCenter];
  [v16 setNowPlayingInfo:v3];

  _Block_object_dispose(&v20, 8);
}

- (int64_t)remotePlay
{
  if ([(CRLAVPlayerController *)self isPlaying]) {
    return 200;
  }
  [(CRLAVPlayerController *)self setPlaying:1];
  return 0;
}

- (int64_t)remotePause
{
  if (![(CRLAVPlayerController *)self isPlaying]) {
    return 200;
  }
  [(CRLAVPlayerController *)self setPlaying:0];
  return 0;
}

- (void)setupRemoteTransportControls
{
  id v5 = +[MPRemoteCommandCenter sharedCommandCenter];
  uint64_t v3 = [v5 playCommand];
  [v3 addTarget:self action:"remotePlay"];
  id v4 = [v5 pauseCommand];
  [v4 addTarget:self action:"remotePause"];
}

- (id)delegate
{
  return self->mDelegate;
}

- (AVQueuePlayer)player
{
  return self->mPlayer;
}

- (CRLAVPlayerControllerPlayerItemMediating)playerItemMediator
{
  return self->mPlayerItemMediator;
}

- (int64_t)repeatMode
{
  return self->mRepeatMode;
}

- (float)volume
{
  return self->mVolume;
}

- (BOOL)canPlay
{
  return self->mCanPlay;
}

- (BOOL)isPlaying
{
  return self->mPlaying;
}

- (BOOL)isFastReversing
{
  return self->mFastReversing;
}

- (BOOL)isFastForwarding
{
  return self->mFastForwarding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPlayerItemMediator, 0);
  objc_storeStrong((id *)&self->mObservationTokens, 0);
  objc_storeStrong(&self->mVolumeRampBoundaryTimeObserver, 0);
  objc_storeStrong((id *)&self->mVolumeRampPlayerItem, 0);
  objc_storeStrong((id *)&self->mPlayerLooper, 0);
  objc_storeStrong((id *)&self->mEnqueuedAssets, 0);
  objc_storeStrong((id *)&self->mDelegate, 0);

  objc_storeStrong((id *)&self->mPlayer, 0);
}

@end