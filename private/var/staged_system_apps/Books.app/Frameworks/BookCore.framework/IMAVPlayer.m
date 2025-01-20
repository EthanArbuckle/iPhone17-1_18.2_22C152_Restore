@interface IMAVPlayer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_contextDependentTolerance;
- (AVAsset)asset;
- (AVPlayer)player;
- (AVPlayerItem)currentItem;
- (BOOL)airplayVideoActive;
- (BOOL)externalDisplay;
- (BOOL)isPlaying;
- (BOOL)isVideo;
- (BOOL)optimizePerformanceOverAccuracy;
- (BOOL)playWhileSeeking;
- (BOOL)playbackPending;
- (BOOL)scrubbing;
- (BOOL)useFullExternalScreen;
- (BOOL)usesExternalPlaybackWhileExternalScreenIsActive;
- (BOOL)wasPlaying;
- (IMAVPlayer)init;
- (IMAVPlayerDelegate)delegate;
- (IMVideoView)videoView;
- (NSDictionary)metaData;
- (NSURL)assetURL;
- (double)cachedDuration;
- (double)currentTime;
- (double)duration;
- (double)endTime;
- (double)loadedDuration;
- (double)seekDelay;
- (double)seekStep;
- (float)playbackRate;
- (float)volume;
- (id)_stringFromState:(int)a3;
- (id)description;
- (id)periodicTimeObserver;
- (id)stillFrameAt:(double)a3 maxSize:(CGSize)a4 scale:(double)a5;
- (int)loadState;
- (int)loops;
- (int)scale;
- (int)state;
- (unint64_t)skipStepCount;
- (void)_playWithRate:(float)a3 fadeInTime:(double)a4;
- (void)_updateAllowsExternalPlayback;
- (void)_updateAudioParameters;
- (void)addPeriodicTimeObserver;
- (void)addTimeObserver:(double)a3;
- (void)clearEndTimeObserver;
- (void)clearExternalDisplay;
- (void)clearTimeObservers;
- (void)createExternalDisplayOnScreen:(id)a3;
- (void)dealloc;
- (void)endSeek;
- (void)fadeOut:(double)a3;
- (void)forceTriggerTimeObserverAt:(double)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)onInterruption:(id)a3;
- (void)onRouteChange:(id)a3;
- (void)onScreenConnection:(id)a3;
- (void)onScreenDisconnection:(id)a3;
- (void)onSeekTimer:(id)a3;
- (void)pause;
- (void)play;
- (void)playFrom:(double)a3;
- (void)playbackWasPaused:(id)a3;
- (void)playerItemDidReachEnd:(id)a3;
- (void)removeAllTimeObservers;
- (void)removePeriodicTimeObserver;
- (void)removeTimeObserver:(double)a3;
- (void)seekFinished:(double)a3;
- (void)sendItemEndedNotification;
- (void)sendItemStoppedNotification;
- (void)setAsset:(id)a3;
- (void)setAssetURL:(id)a3;
- (void)setAssetURL:(id)a3 withStartTime:(double)a4;
- (void)setCachedDuration:(double)a3;
- (void)setCurrentTime:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setLoadState:(int)a3;
- (void)setLoops:(int)a3;
- (void)setMetaData:(id)a3;
- (void)setOptimizePerformanceOverAccuracy:(BOOL)a3;
- (void)setPeriodicTimeObserver:(id)a3;
- (void)setPlayWhileSeeking:(BOOL)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setPlayer:(id)a3;
- (void)setScale:(int)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setSeekDelay:(double)a3;
- (void)setSeekStep:(double)a3;
- (void)setState:(int)a3;
- (void)setUseFullExternalScreen:(BOOL)a3;
- (void)setUsesExternalPlaybackWhileExternalScreenIsActive:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)setWasPlaying:(BOOL)a3;
- (void)setupEndTimeObserver;
- (void)setupTimeObserver:(id)a3;
- (void)singleSkip:(BOOL)a3;
- (void)startSeek:(BOOL)a3;
- (void)stop;
- (void)togglePlayPause;
- (void)triggerTimeObserverAt:(id)a3;
- (void)updateNowPlayingInfo;
- (void)updatePlayer;
- (void)updateScale;
- (void)updateSeekTime:(double)a3;
- (void)updateTimeObservers;
- (void)updateVideoLayer;
- (void)updateVolume;
@end

@implementation IMAVPlayer

- (IMAVPlayer)init
{
  v15.receiver = self;
  v15.super_class = (Class)IMAVPlayer;
  v2 = [(IMAVPlayer *)&v15 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_volume = 1065353216;
    v2->_playbackPending = 0;
    v2->_wasPlaying = 0;
    *(void *)&v2->_state = 0x3F80000000000000;
    v2->_scale = 0;
    v4 = -[IMVideoView initWithFrame:]([IMVideoView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    videoView = v3->_videoView;
    v3->_videoView = v4;

    v6 = +[UIColor blackColor];
    [(IMVideoView *)v3->_videoView setBackgroundColor:v6];

    [(IMVideoView *)v3->_videoView setPlayer:v3];
    *(_OWORD *)&v3->_seekStep = xmmword_2A24C0;
    *(_WORD *)&v3->_usesExternalPlaybackWhileExternalScreenIsActive = 257;
    v7 = +[NSNotificationCenter defaultCenter];
    v8 = kBKPlayerPlaybackWasInterruptedNotification[0];
    v9 = +[AVAudioSession sharedInstance];
    [v7 addObserver:v3 selector:"playbackWasPaused:" name:v8 object:v9];

    v10 = +[AVAudioSession sharedInstance];
    [v7 addObserver:v3 selector:"onInterruption:" name:AVAudioSessionInterruptionNotification object:v10];

    v11 = +[AVAudioSession sharedInstance];
    [v7 addObserver:v3 selector:"onRouteChange:" name:AVAudioSessionRouteChangeNotification object:v11];

    v12 = +[AVAudioSession sharedInstance];
    [v7 addObserver:v3 selector:"resetPlayer:" name:AVAudioSessionMediaServicesWereResetNotification object:v12];

    [v7 addObserver:v3 selector:"playerItemDidReachEnd:" name:AVPlayerItemDidPlayToEndTimeNotification object:0];
    [v7 addObserver:v3 selector:"onScreenConnection:" name:UIScreenDidConnectNotification object:0];
    [v7 addObserver:v3 selector:"onScreenDisconnection:" name:UIScreenDidDisconnectNotification object:0];
    v13 = +[NSUserDefaults standardUserDefaults];
    [v13 addObserver:v3 forKeyPath:IMAVPlayerDefaults_ClosedCaptioning options:1 context:off_341C60];
  }
  return v3;
}

- (void)dealloc
{
  [(IMAVPlayer *)self stop];
  [(IMAVPlayer *)self setPlayer:0];
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = kBKPlayerPlaybackWasInterruptedNotification[0];
  v5 = +[AVAudioSession sharedInstance];
  [v3 removeObserver:self name:v4 object:v5];

  v6 = +[AVAudioSession sharedInstance];
  [v3 removeObserver:self name:AVAudioSessionInterruptionNotification object:v6];

  v7 = +[AVAudioSession sharedInstance];
  [v3 removeObserver:self name:AVAudioSessionRouteChangeNotification object:v7];

  v8 = +[AVAudioSession sharedInstance];
  [v3 removeObserver:self name:AVAudioSessionMediaServicesWereResetNotification object:v8];

  [v3 removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:0];
  [v3 removeObserver:self name:UIScreenDidConnectNotification object:0];
  [v3 removeObserver:self name:UIScreenDidDisconnectNotification object:0];
  v9 = +[NSUserDefaults standardUserDefaults];
  [v9 removeObserver:self forKeyPath:IMAVPlayerDefaults_ClosedCaptioning context:off_341C60];

  [(IMAVPlayer *)self clearEndTimeObserver];
  [(IMAVPlayer *)self removeAllTimeObservers];
  [(IMAVPlayer *)self removePeriodicTimeObserver];
  [(IMAVPlayer *)self setAsset:0];
  [(IMVideoView *)self->_videoView setPlayer:0];
  [(IMAVPlayer *)self clearExternalDisplay];
  [(NSTimer *)self->_hdcpTimer invalidate];
  hdcpTimer = self->_hdcpTimer;
  self->_hdcpTimer = 0;

  [(NSTimer *)self->_seekTimer invalidate];
  seekTimer = self->_seekTimer;
  self->_seekTimer = 0;

  v12.receiver = self;
  v12.super_class = (Class)IMAVPlayer;
  [(IMAVPlayer *)&v12 dealloc];
}

- (id)_stringFromState:(int)a3
{
  if (qword_345CD0 != -1) {
    dispatch_once(&qword_345CD0, &stru_2C8BB0);
  }
  v4 = (void *)qword_345CC8;
  if (a3 >= 4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a3;
  }

  return [v4 objectAtIndexedSubscript:v5];
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(IMAVPlayer *)self currentTime];
  uint64_t v6 = v5;
  [(IMAVPlayer *)self duration];
  uint64_t v8 = v7;
  v9 = [(IMAVPlayer *)self _stringFromState:[(IMAVPlayer *)self state]];
  v10 = +[NSString stringWithFormat:@"<%@=%p t=%.1lf/%.1lf state=%@>", v4, self, v6, v8, v9];

  return v10;
}

- (void)setAsset:(id)a3
{
  id v5 = a3;
  if (([(AVAsset *)self->_asset isEqual:v5] & 1) == 0)
  {
    uint64_t v6 = BCAVPlayerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138477827;
      id v9 = v5;
      _os_log_impl(&def_7D91C, v6, OS_LOG_TYPE_INFO, "setAssetURL: asset=%{private}@", (uint8_t *)&v8, 0xCu);
    }

    objc_storeStrong((id *)&self->_asset, a3);
    uint64_t v7 = BCAVPlayerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "setAsset %@", (uint8_t *)&v8, 0xCu);
    }

    [(IMAVPlayer *)self updatePlayer];
  }
}

- (void)setAssetURL:(id)a3
{
  id v4 = a3;
  id v5 = [(IMAVPlayer *)self assetURL];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = BCAVPlayerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138477827;
      id v10 = v4;
      _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "setAssetURL: assetURL=%{private}@", (uint8_t *)&v9, 0xCu);
    }

    if (v4)
    {
      int v8 = +[AVURLAsset URLAssetWithURL:v4 options:0];
      [(IMAVPlayer *)self setAsset:v8];
    }
    else
    {
      [(IMAVPlayer *)self setAsset:0];
    }
  }
}

- (void)setAssetURL:(id)a3 withStartTime:(double)a4
{
  id v6 = a3;
  uint64_t v7 = BCAVPlayerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 138478083;
    id v11 = v6;
    __int16 v12 = 2048;
    double v13 = a4;
    _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "setAssetURL:withStateTime: assetURL=%{private}@ time=%.1lf", (uint8_t *)&v10, 0x16u);
  }

  int v8 = [(IMAVPlayer *)self assetURL];
  unsigned __int8 v9 = [v6 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    self->_preloadingTime = a4;
    [(IMAVPlayer *)self setAssetURL:v6];
  }
}

- (NSURL)assetURL
{
  v2 = [(IMAVPlayer *)self currentItem];
  v3 = [v2 asset];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 URL];
  }
  else
  {
    id v4 = 0;
  }

  return (NSURL *)v4;
}

- (AVPlayerItem)currentItem
{
  return [(AVPlayer *)self->_player currentItem];
}

- (void)_playWithRate:(float)a3 fadeInTime:(double)a4
{
  uint64_t v7 = BCAVPlayerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    double v16 = a3;
    __int16 v17 = 2048;
    double v18 = a4;
    _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "_playWithRate:fadeInTime: playbackRate=%.1f duration=%.1lf", buf, 0x16u);
  }

  int v8 = [(AVPlayer *)self->_player currentItem];
  unsigned __int8 v9 = (char *)[v8 status];

  if (v9 == (unsigned char *)&def_7D91C + 1)
  {
    [(IMAVPlayer *)self updateTimeObservers];
    double v10 = fabs(a4);
    if (v10 >= 0.00999999978)
    {
      player = self->_player;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_D5FB0;
      v13[3] = &unk_2C8BD8;
      v13[4] = self;
      float v14 = a3;
      *(double *)&v13[5] = a4;
      [(AVPlayer *)player prerollAtRate:v13 completionHandler:COERCE_DOUBLE((unint64_t)LODWORD(a3))];
    }
    else
    {
      *(float *)&double v10 = self->_playbackRate;
      [(AVPlayer *)self->_player setRate:v10];
    }
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = 1;
  }
  self->_playbackPending = v11;
}

- (void)play
{
  v3 = BCAVPlayerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&def_7D91C, v3, OS_LOG_TYPE_INFO, "play", v5, 2u);
  }

  *(float *)&double v4 = self->_playbackRate;
  [(IMAVPlayer *)self _playWithRate:v4 fadeInTime:0.0];
}

- (void)playFrom:(double)a3
{
  id v5 = BCAVPlayerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)&uint8_t buf[4] = a3;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "play from %f", buf, 0xCu);
  }

  id v6 = [(AVPlayer *)self->_player currentItem];
  if ([v6 status] == (char *)&def_7D91C + 1)
  {

LABEL_6:
    player = self->_player;
    CMTimeMakeWithSeconds(&v12, a3, 1000000000);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_D6224;
    v11[3] = &unk_2C3D18;
    v11[4] = self;
    *(double *)&v11[5] = a3;
    *(_OWORD *)buf = *(_OWORD *)&kCMTimePositiveInfinity.value;
    CMTimeEpoch epoch = kCMTimePositiveInfinity.epoch;
    long long v9 = *(_OWORD *)buf;
    CMTimeEpoch v10 = epoch;
    [(AVPlayer *)player seekToTime:&v12 toleranceBefore:buf toleranceAfter:&v9 completionHandler:v11];
    return;
  }
  unsigned __int8 v7 = [(AVPlayer *)self->_player isExternalPlaybackActive];

  if (v7) {
    goto LABEL_6;
  }
  self->_playbackPending = 1;
  self->_lastSeekingTime = a3;
}

- (void)pause
{
  v3 = BCAVPlayerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&def_7D91C, v3, OS_LOG_TYPE_INFO, "pause", v4, 2u);
  }

  [(AVPlayer *)self->_player setRate:0.0];
  self->_playbackPending = 0;
  self->_wasPlaying = 0;
}

- (void)stop
{
  v3 = BCAVPlayerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_7D91C, v3, OS_LOG_TYPE_INFO, "stop", buf, 2u);
  }

  if (self->_player)
  {
    if ([(IMAVPlayer *)self state] != 1)
    {
      double v4 = BCAVPlayerLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&def_7D91C, v4, OS_LOG_TYPE_INFO, "stop", buf, 2u);
      }

      unsigned int v5 = [(IMAVPlayer *)self state];
      [(IMAVPlayer *)self setState:1];
      [(IMAVPlayer *)self setLoadState:0];
      if (v5 == 3)
      {
        [(IMAVPlayer *)self sendItemStoppedNotification];
      }
      else
      {
        [(AVPlayer *)self->_player setRate:0.0];
        [(IMAVPlayer *)self sendItemStoppedNotification];
        player = self->_player;
        CMTimeMakeWithSeconds(&v12, 0.0, 1);
        [(AVPlayer *)player seekToTime:&v12];
      }
      [(IMAVPlayer *)self setAsset:0];
    }
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&self->_lastSeekingTime = _Q0;
    self->_seeking = 0;
  }
}

- (void)togglePlayPause
{
  v3 = BCAVPlayerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&def_7D91C, v3, OS_LOG_TYPE_INFO, "togglePlayPause", v4, 2u);
  }

  if ([(IMAVPlayer *)self isPlaying]) {
    [(IMAVPlayer *)self pause];
  }
  else {
    [(IMAVPlayer *)self play];
  }
}

- (void)fadeOut:(double)a3
{
  player = self->_player;
  CMTimeMakeWithSeconds(&v4, a3, 1000000000);
  [(AVPlayer *)player setRate:&v4 withVolumeRampDuration:0.0];
}

- (void)startSeek:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = BCAVPlayerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "startSeek: forward=%d", (uint8_t *)v9, 8u);
  }

  [(IMAVPlayer *)self endSeek];
  self->_skipStepCount = 0;
  self->_seekForward = v3;
  id v6 = +[NSTimer scheduledTimerWithTimeInterval:self target:"onSeekTimer:" selector:0 userInfo:1 repeats:self->_seekDelay];
  seekTimer = self->_seekTimer;
  self->_seekTimer = v6;

  if (self->_playWhileSeeking)
  {
    LODWORD(v8) = -2.0;
    if (v3) {
      *(float *)&double v8 = 2.0;
    }
    [(AVPlayer *)self->_player setRate:v8];
    [(IMAVPlayer *)self updateNowPlayingInfo];
  }
}

- (void)endSeek
{
  BOOL v3 = BCAVPlayerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl(&def_7D91C, v3, OS_LOG_TYPE_INFO, "endSeek", v5, 2u);
  }

  [(NSTimer *)self->_seekTimer invalidate];
  seekTimer = self->_seekTimer;
  self->_seekTimer = 0;

  if (self->_playWhileSeeking) {
    [(IMAVPlayer *)self play];
  }
  [(IMAVPlayer *)self updateNowPlayingInfo];
}

- (void)singleSkip:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = BCAVPlayerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "singleSkip: forward=%d", (uint8_t *)v6, 8u);
  }

  self->_seekForward = v3;
  [(IMAVPlayer *)self endSeek];
  [(IMAVPlayer *)self onSeekTimer:0];
}

- (void)onSeekTimer:(id)a3
{
  ++self->_skipStepCount;
  if (self->_seekForward)
  {
    [(IMAVPlayer *)self duration];
    double v5 = v4;
    [(IMAVPlayer *)self currentTime];
    if (v5 >= v6 + self->_seekStep)
    {
      [(IMAVPlayer *)self currentTime];
      double v7 = v11 + self->_seekStep;
    }
    else
    {
      [(IMAVPlayer *)self duration];
    }
  }
  else
  {
    [(IMAVPlayer *)self currentTime];
    double v9 = v8 - self->_seekStep;
    double v7 = 0.0;
    if (v9 >= 0.0)
    {
      [(IMAVPlayer *)self currentTime];
      double v7 = v10 - self->_seekStep;
    }
  }

  [(IMAVPlayer *)self setCurrentTime:v7];
}

- (void)setPlaybackRate:(float)a3
{
  double v5 = BCAVPlayerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    double v8 = a3;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "setPlaybackRate: rate=%.1f", (uint8_t *)&v7, 0xCu);
  }

  self->_playbackRate = a3;
  if ([(IMAVPlayer *)self state] == 2)
  {
    *(float *)&double v6 = self->_playbackRate;
    [(AVPlayer *)self->_player setRate:v6];
    [(IMAVPlayer *)self updateNowPlayingInfo];
  }
}

- (void)setState:(int)a3
{
  if (self->_state != a3)
  {
    uint64_t v3 = *(void *)&a3;
    self->_state = a3;
    double v5 = BCAVPlayerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double v6 = [(IMAVPlayer *)self _stringFromState:v3];
      int v9 = 138543362;
      double v10 = v6;
      _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "setState: state=%{public}@", (uint8_t *)&v9, 0xCu);
    }
    if (*(_WORD *)&self->_delegateFlags)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained playerStateChanged:self];
    }
    double v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:IMAVPlayerNotification_StateChanged[0] object:self];

    [(IMAVPlayer *)self updateNowPlayingInfo];
  }
}

- (void)setLoadState:(int)a3
{
  if (self->_loadState != a3)
  {
    self->_loadState = a3;
    double v5 = BCAVPlayerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = a3;
      _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "setLoadState: loadState=%d", (uint8_t *)v7, 8u);
    }

    if ((*(_WORD *)&self->_delegateFlags & 0x20) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained playerLoadStateChanged:self];
    }
  }
}

- (BOOL)isPlaying
{
  return self->_state == 2;
}

- (BOOL)playbackPending
{
  return self->_playbackPending;
}

- (void)setVolume:(float)a3
{
  double v5 = BCAVPlayerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    double v7 = a3;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "setVolume: volume=%.1f", (uint8_t *)&v6, 0xCu);
  }

  if (self->_volume != a3)
  {
    self->_volume = a3;
    [(IMAVPlayer *)self updateVolume];
  }
}

- (void)setScale:(int)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    [(IMAVPlayer *)self updateScale];
  }
}

- (BOOL)isVideo
{
  v2 = [(IMAVPlayer *)self currentItem];
  uint64_t v3 = [v2 asset];
  double v4 = [v3 tracksWithMediaCharacteristic:AVMediaCharacteristicVisual];

  LOBYTE(v2) = [v4 count] != 0;
  return (char)v2;
}

- (void)setUseFullExternalScreen:(BOOL)a3
{
  self->_useFullExternalScreen = a3;
  double v4 = [(IMVideoView *)self->_videoView window];

  if (v4)
  {
    [(IMAVPlayer *)self updateVideoLayer];
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_contextDependentTolerance
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(IMAVPlayer *)self optimizePerformanceOverAccuracy];
  if (result) {
    double v5 = &kCMTimePositiveInfinity;
  }
  else {
    double v5 = &kCMTimeZero;
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v5->value;
  retstr->var3 = v5->epoch;
  return result;
}

- (void)updatePlayer
{
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_lastSeekingTime = _Q0;
  self->_seeking = 0;
  [(IMVideoView *)self->_videoView setVideoLayer:0];
  [(IMAVPlayer *)self clearExternalDisplay];
  double v8 = [(IMAVPlayer *)self asset];

  if (v8)
  {
    [(IMAVPlayer *)self setState:0];
    int v9 = [(IMAVPlayer *)self asset];
    double v10 = +[AVPlayerItem playerItemWithAsset:v9];

    double preloadingTime = self->_preloadingTime;
    if (preloadingTime > 0.0)
    {
      CMTime v12 = BCAVPlayerLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        double v13 = self->_preloadingTime;
        *(_DWORD *)buf = 134217984;
        *(double *)&uint8_t buf[4] = v13;
        _os_log_impl(&def_7D91C, v12, OS_LOG_TYPE_INFO, "preloading asset to time: %f", buf, 0xCu);
      }

      memset(buf, 0, sizeof(buf));
      uint64_t v28 = 0;
      [(IMAVPlayer *)self _contextDependentTolerance];
      CMTimeMakeWithSeconds(&v26, self->_preloadingTime, 1000000000);
      long long v24 = *(_OWORD *)buf;
      uint64_t v25 = v28;
      long long v22 = *(_OWORD *)buf;
      uint64_t v23 = v28;
      [v10 seekToTime:&v26 toleranceBefore:&v24 toleranceAfter:&v22 completionHandler:&stru_2C8BF8];
      self->_double preloadingTime = 0.0;
    }
    if (self->_player)
    {
      float v14 = [(IMAVPlayer *)self player];
      [v14 replaceCurrentItemWithPlayerItem:0];

      objc_super v15 = [(IMAVPlayer *)self player];
      [v15 replaceCurrentItemWithPlayerItem:v10];

      [(IMAVPlayer *)self forceTriggerTimeObserverAt:preloadingTime];
    }
    else
    {
      double v16 = +[AVPlayer playerWithPlayerItem:v10];
      [(IMAVPlayer *)self setPlayer:v16];

      __int16 v17 = [(IMAVPlayer *)self player];
      [v17 setActionAtItemEnd:1];

      [(IMAVPlayer *)self _updateAllowsExternalPlayback];
      BOOL usesExternalPlaybackWhileExternalScreenIsActive = self->_usesExternalPlaybackWhileExternalScreenIsActive;
      v19 = [(IMAVPlayer *)self player];
      [v19 setUsesExternalPlaybackWhileExternalScreenIsActive:usesExternalPlaybackWhileExternalScreenIsActive];
    }
    v20 = [(IMVideoView *)self->_videoView window];

    if (v20) {
      [(IMAVPlayer *)self updateVideoLayer];
    }
  }
  else
  {
    id v21 = [(IMAVPlayer *)self player];
    [v21 replaceCurrentItemWithPlayerItem:0];
  }
}

- (void)updateVideoLayer
{
  if (!self->_player) {
    return;
  }
  uint64_t v3 = +[UIScreen screens];
  if ([v3 count] == (char *)&def_7D91C + 1) {
    goto LABEL_6;
  }
  double v4 = [(IMAVPlayer *)self asset];
  if (!v4 || [(IMAVPlayer *)self airplayVideoActive])
  {

LABEL_6:
    goto LABEL_7;
  }
  BOOL useFullExternalScreen = self->_useFullExternalScreen;

  if (useFullExternalScreen)
  {
    float v14 = +[UIScreen screens];
    objc_super v15 = [v14 objectAtIndex:1];

    [(IMAVPlayer *)self createExternalDisplayOnScreen:v15];
    goto LABEL_8;
  }
LABEL_7:
  [(IMAVPlayer *)self clearExternalDisplay];
LABEL_8:
  [(IMVideoView *)self->_videoView setExternalDisplay:self->_externalDisplay];
  [(IMVideoView *)self->_videoView updateAirplayNoContentView];
  if (self->_externalDisplay)
  {
    double v5 = [(IMExternalVideoView *)self->_externalVideoView videoLayer];

    if (!v5)
    {
      int v6 = +[AVPlayerLayer playerLayerWithPlayer:self->_player];
      [(IMExternalVideoView *)self->_externalVideoView setVideoLayer:v6];
    }
    double v7 = [(IMVideoView *)self->_videoView videoLayer];
    double v8 = v7;
    uint64_t v9 = 1;
  }
  else
  {
    double v10 = [(IMVideoView *)self->_videoView videoLayer];

    if (!v10)
    {
      double v11 = +[AVPlayerLayer playerLayerWithPlayer:self->_player];
      [(IMVideoView *)self->_videoView setVideoLayer:v11];
    }
    double v7 = [(IMVideoView *)self->_videoView videoLayer];
    double v8 = v7;
    uint64_t v9 = 0;
  }
  [v7 setHidden:v9];

  CMTime v12 = +[NSUserDefaults standardUserDefaults];
  id v16 = [v12 objectForKey:IMAVPlayerDefaults_ClosedCaptioning];

  -[AVPlayer setAppliesMediaSelectionCriteriaAutomatically:](self->_player, "setAppliesMediaSelectionCriteriaAutomatically:", [v16 BOOLValue]);
  [(IMAVPlayer *)self updateScale];
}

- (void)clearExternalDisplay
{
  uint64_t v3 = BCAVPlayerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&def_7D91C, v3, OS_LOG_TYPE_INFO, "clearExternalDisplay", v6, 2u);
  }

  [(IMExternalVideoView *)self->_externalVideoView removeFromSuperview];
  externalVideoView = self->_externalVideoView;
  self->_externalVideoView = 0;

  [(UIWindow *)self->_externalVideoWindow resignKeyWindow];
  externalVideoWindow = self->_externalVideoWindow;
  self->_externalVideoWindow = 0;

  self->_externalDisplay = 0;
}

- (void)createExternalDisplayOnScreen:(id)a3
{
  id v4 = a3;
  if (*(_OWORD *)&self->_externalVideoView == 0)
  {
    double v5 = BCAVPlayerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "createExternalDisplayOnScreen %@", (uint8_t *)&v13, 0xCu);
    }

    id v6 = objc_alloc((Class)UIWindow);
    [v4 bounds];
    double v7 = [v6 initWithFrame:];
    externalVideoWindow = self->_externalVideoWindow;
    self->_externalVideoWindow = v7;

    [(UIWindow *)self->_externalVideoWindow setScreen:v4];
    uint64_t v9 = [IMExternalVideoView alloc];
    [v4 bounds];
    double v10 = -[IMExternalVideoView initWithFrame:](v9, "initWithFrame:");
    externalVideoView = self->_externalVideoView;
    self->_externalVideoView = v10;

    CMTime v12 = +[UIColor blackColor];
    [(IMExternalVideoView *)self->_externalVideoView setBackgroundColor:v12];

    [(UIWindow *)self->_externalVideoWindow addSubview:self->_externalVideoView];
    [(UIWindow *)self->_externalVideoWindow makeKeyAndVisible];
  }
  self->_externalDisplay = 1;
}

- (void)updateScale
{
  unsigned int v3 = [(IMAVPlayer *)self scale];
  if (v3 == 2)
  {
    id v4 = &AVLayerVideoGravityResize;
  }
  else if (v3 == 1)
  {
    id v4 = &AVLayerVideoGravityResizeAspectFill;
  }
  else
  {
    if (v3) {
      return;
    }
    id v4 = &AVLayerVideoGravityResizeAspect;
  }
  AVLayerVideoGravity v5 = *v4;
  id v7 = [(IMVideoView *)self->_videoView videoLayer];
  [v7 setVideoGravity:v5];
  id v6 = [(IMExternalVideoView *)self->_externalVideoView videoLayer];
  [v6 setVideoGravity:v5];
}

- (void)_updateAllowsExternalPlayback
{
  unsigned int v3 = [(IMAVPlayer *)self delegate];
  id v8 = v3;
  if ((*(_WORD *)&self->_delegateFlags & 0x400) != 0)
  {
    id v7 = [v3 playerAllowsExternalPlayback:self];
    id v4 = [(IMAVPlayer *)self player];
    AVLayerVideoGravity v5 = v4;
    uint64_t v6 = (uint64_t)v7;
  }
  else
  {
    id v4 = [(IMAVPlayer *)self player];
    AVLayerVideoGravity v5 = v4;
    uint64_t v6 = 1;
  }
  [v4 setAllowsExternalPlayback:v6];
}

- (void)setPlayer:(id)a3
{
  AVLayerVideoGravity v5 = (AVPlayer *)a3;
  player = self->_player;
  if (player != v5)
  {
    id v7 = v5;
    [(AVPlayer *)player removeObserver:self forKeyPath:@"currentItem"];
    [(AVPlayer *)self->_player removeObserver:self forKeyPath:@"rate"];
    [(AVPlayer *)self->_player removeObserver:self forKeyPath:@"airPlayVideoActive"];
    [(AVPlayer *)self->_player removeObserver:self forKeyPath:@"timeControlStatus"];
    [(IMAVPlayer *)self removePeriodicTimeObserver];
    [(IMAVPlayer *)self clearTimeObservers];
    [(IMAVPlayer *)self clearEndTimeObserver];
    objc_storeStrong((id *)&self->_player, a3);
    if (self->_player)
    {
      [(IMAVPlayer *)self addPeriodicTimeObserver];
      [(AVPlayer *)self->_player addObserver:self forKeyPath:@"airPlayVideoActive" options:4 context:0];
      [(AVPlayer *)self->_player addObserver:self forKeyPath:@"currentItem" options:6 context:0];
      [(AVPlayer *)self->_player addObserver:self forKeyPath:@"rate" options:0 context:0];
      [(AVPlayer *)self->_player addObserver:self forKeyPath:@"timeControlStatus" options:1 context:0];
    }
    player = (AVPlayer *)[(IMAVPlayer *)self _updateAllowsExternalPlayback];
    AVLayerVideoGravity v5 = v7;
  }

  _objc_release_x1(player, v5);
}

- (void)updateVolume
{
  *(float *)&double v2 = self->_volume;
  [(AVPlayer *)self->_player setVolume:v2];
}

- (void)_updateAudioParameters
{
  unsigned int v3 = [(AVPlayer *)self->_player currentItem];
  id v4 = [v3 asset];
  AVLayerVideoGravity v5 = [v4 tracksWithMediaType:AVMediaTypeAudio];

  uint64_t v6 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        CMTime v12 = +[AVMutableAudioMixInputParameters audioMixInputParametersWithTrack:](AVMutableAudioMixInputParameters, "audioMixInputParametersWithTrack:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v11), (void)v15);
        [v12 setAudioTimePitchAlgorithm:AVAudioTimePitchAlgorithmTimeDomain];
        [v6 addObject:v12];

        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  int v13 = +[AVMutableAudioMix audioMix];
  [v13 setInputParameters:v6];
  id v14 = [(AVPlayer *)self->_player currentItem];
  [v14 setAudioMix:v13];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_341C60 == a6)
  {
    objc_initWeak((id *)buf, self);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_D82DC;
    v55[3] = &unk_2C8C20;
    id v56 = v12;
    objc_copyWeak(&v57, (id *)buf);
    long long v24 = objc_retainBlock(v55);
    uint64_t v25 = objc_retainBlock(v24);
    if (v25)
    {
      if (+[NSThread isMainThread])
      {
        v25[2](v25);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_D8398;
        block[3] = &unk_2C4280;
        v54 = v25;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }

    objc_destroyWeak(&v57);
    objc_destroyWeak((id *)buf);
  }
  else if ([v10 isEqualToString:@"currentItem"])
  {
    int v13 = [(IMAVPlayer *)self delegate];
    id v14 = BCAVPlayerLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      long long v15 = [(AVPlayer *)self->_player currentItem];
      *(_DWORD *)buf = 138477827;
      v59[0] = *(double *)&v15;
      _os_log_impl(&def_7D91C, v14, OS_LOG_TYPE_INFO, "currentItem changed: %{private}@", buf, 0xCu);
    }
    long long v16 = [v12 objectForKey:NSKeyValueChangeOldKey];
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [v16 removeObserver:self forKeyPath:@"status"];
        [v16 removeObserver:self forKeyPath:@"playbackLikelyToKeepUp"];
        [v16 removeObserver:self forKeyPath:@"playbackBufferEmpty"];
      }
    }
    if ((*(_WORD *)&self->_delegateFlags & 0x80) != 0) {
      [v13 playerCurrentItemChanged:self];
    }
    long long v17 = [(AVPlayer *)self->_player currentItem];

    if (v17)
    {
      [(IMAVPlayer *)self updateTimeObservers];
      long long v18 = [(AVPlayer *)self->_player currentItem];
      [v18 addObserver:self forKeyPath:@"status" options:4 context:0];

      v19 = [(AVPlayer *)self->_player currentItem];
      [v19 addObserver:self forKeyPath:@"playbackLikelyToKeepUp" options:4 context:0];

      v20 = [(AVPlayer *)self->_player currentItem];
      [v20 addObserver:self forKeyPath:@"playbackBufferEmpty" options:4 context:0];

      id v21 = [(AVPlayer *)self->_player currentItem];
      long long v22 = [v21 asset];
      uint64_t v23 = +[NSArray arrayWithObjects:@"tracks", @"duration", 0];
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_D83A8;
      v51[3] = &unk_2C3AF8;
      v51[4] = self;
      id v52 = v13;
      [v22 loadValuesAsynchronouslyForKeys:v23 completionHandler:v51];
    }
  }
  else if ([v10 isEqualToString:@"rate"])
  {
    CMTime v26 = BCAVPlayerLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      [(AVPlayer *)self->_player rate];
      *(_DWORD *)buf = 134217984;
      v59[0] = v27;
      _os_log_impl(&def_7D91C, v26, OS_LOG_TYPE_INFO, "rate changed: %f", buf, 0xCu);
    }

    [(AVPlayer *)self->_player rate];
    if (v28 == 0.0)
    {
      if ([(IMAVPlayer *)self state] != 1 && [(IMAVPlayer *)self state]) {
        [(IMAVPlayer *)self setState:3];
      }
    }
    else
    {
      [(IMAVPlayer *)self setState:2];
      [(IMAVPlayer *)self setLoadState:1];
      self->_wasPlaying = 1;
    }
  }
  else if ([v10 isEqualToString:@"status"])
  {
    v29 = [(AVPlayer *)self->_player currentItem];

    if (v29)
    {
      v30 = [(IMAVPlayer *)self delegate];
      v31 = BCAVPlayerLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = [(AVPlayer *)self->_player currentItem];
        *(_DWORD *)buf = 134217984;
        v59[0] = COERCE_DOUBLE([v32 status]);
        _os_log_impl(&def_7D91C, v31, OS_LOG_TYPE_INFO, "item status changed: %ld", buf, 0xCu);
      }
      v33 = [(AVPlayer *)self->_player currentItem];
      v34 = (char *)[v33 status];

      if (v34 == (unsigned char *)&def_7D91C + 2)
      {
        v46 = [(AVPlayer *)self->_player currentItem];
        v47 = [v46 error];

        [(IMAVPlayer *)self playbackFailedWithError:v47];
        v48 = BCAVPlayerLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_1ED6F4((uint64_t)v47, v48);
        }

        [(IMAVPlayer *)self stop];
        [(IMAVPlayer *)self setPlayer:0];
        if ((*(_WORD *)&self->_delegateFlags & 2) != 0) {
          [v30 playerErrorDidOccur:self error:v47];
        }
      }
      else if (v34 == (unsigned char *)&def_7D91C + 1)
      {
        [(IMAVPlayer *)self setLoadState:1];
        double lastSeekingTime = self->_lastSeekingTime;
        if (self->_playbackPending)
        {
          if (lastSeekingTime >= 0.0) {
            -[IMAVPlayer playFrom:](self, "playFrom:");
          }
          else {
            [(IMAVPlayer *)self play];
          }
        }
        else if (lastSeekingTime != self->_lastSeekedTime)
        {
          -[IMAVPlayer updateSeekTime:](self, "updateSeekTime:");
        }
      }
      else if (!v34)
      {
        [(IMAVPlayer *)self setLoadState:0];
      }
    }
  }
  else if ([v10 isEqualToString:@"airPlayVideoActive"])
  {
    v35 = BCAVPlayerLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v59[0]) = [(IMAVPlayer *)self airplayVideoActive];
      _os_log_impl(&def_7D91C, v35, OS_LOG_TYPE_INFO, "airPlayVideoActive new value = %d", buf, 8u);
    }

    [(IMAVPlayer *)self willChangeValueForKey:@"airplayVideoActive"];
    [(IMVideoView *)self->_videoView setAirplayActive:[(IMAVPlayer *)self airplayVideoActive]];
    v36 = [(IMVideoView *)self->_videoView window];

    if (v36) {
      [(IMAVPlayer *)self updateVideoLayer];
    }
    [(IMAVPlayer *)self didChangeValueForKey:@"airplayVideoActive"];
  }
  else if ([v10 isEqualToString:@"playbackBufferEmpty"])
  {
    v37 = BCAVPlayerLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = [(AVPlayer *)self->_player currentItem];
      *(_DWORD *)buf = 67109120;
      LODWORD(v59[0]) = [v38 isPlaybackBufferEmpty];
      _os_log_impl(&def_7D91C, v37, OS_LOG_TYPE_INFO, "playbackBufferEmpty new value = %d", buf, 8u);
    }
    v39 = [(AVPlayer *)self->_player currentItem];
    unsigned int v40 = [v39 isPlaybackBufferEmpty];

    if (v40)
    {
      v41 = BCAVPlayerLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&def_7D91C, v41, OS_LOG_TYPE_INFO, "playbackBufferEmpty", buf, 2u);
      }

      if (![(IMAVPlayer *)self isPlaying]) {
        [(IMAVPlayer *)self setLoadState:2];
      }
    }
  }
  else if ([v10 isEqualToString:@"playbackLikelyToKeepUp"])
  {
    v42 = BCAVPlayerLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = [(AVPlayer *)self->_player currentItem];
      *(_DWORD *)buf = 67109120;
      LODWORD(v59[0]) = [v43 isPlaybackLikelyToKeepUp];
      _os_log_impl(&def_7D91C, v42, OS_LOG_TYPE_INFO, "playbackLikelyToKeepUp new value = %d", buf, 8u);
    }
    v44 = [(AVPlayer *)self->_player currentItem];
    unsigned int v45 = [v44 isPlaybackLikelyToKeepUp];

    if (v45)
    {
      if ([(IMAVPlayer *)self loadState] == 2
        && self->_wasPlaying
        && ![(IMAVPlayer *)self isPlaying])
      {
        [(IMAVPlayer *)self play];
      }
      [(IMAVPlayer *)self setLoadState:1];
    }
  }
  else if ([v10 isEqualToString:@"timeControlStatus"])
  {
    if ((char *)[(AVPlayer *)self->_player timeControlStatus] == (char *)&def_7D91C + 2) {
      [(IMAVPlayer *)self updateNowPlayingInfo];
    }
  }
  else
  {
    v50.receiver = self;
    v50.super_class = (Class)IMAVPlayer;
    [(IMAVPlayer *)&v50 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)playerItemDidReachEnd:(id)a3
{
  id v4 = a3;
  AVLayerVideoGravity v5 = BCAVPlayerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v14 = 138477827;
    id v15 = v4;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "playerItemDidReachEnd: notification=%{private}@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v6 = [(AVPlayer *)self->_player currentItem];
  id v7 = [v4 object];

  if (v6 == v7)
  {
    if (self->_loops)
    {
      [(IMAVPlayer *)self playFrom:0.0];
      int loops = self->_loops;
      BOOL v9 = __OFSUB__(loops, 1);
      int v10 = loops - 1;
      if (v10 < 0 == v9) {
        self->_int loops = v10;
      }
    }
    else
    {
      [(IMAVPlayer *)self currentTime];
      double v12 = v11;
      [(IMAVPlayer *)self duration];
      if (vabdd_f64(v12, v13) < 2.0)
      {
        [(IMAVPlayer *)self stop];
        [(IMAVPlayer *)self sendItemEndedNotification];
      }
    }
  }
}

- (void)setScrubbing:(BOOL)a3
{
  BOOL v3 = a3;
  AVLayerVideoGravity v5 = BCAVPlayerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "setScrubbing: scrubbing=%d", (uint8_t *)v8, 8u);
  }

  if (self->_scrubbing != v3)
  {
    self->_scrubbing = v3;
    if (v3) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    id v7 = [(IMAVPlayer *)self player];
    [v7 setActionAtItemEnd:v6];
  }
}

- (void)sendItemStoppedNotification
{
  BOOL v3 = BCAVPlayerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&def_7D91C, v3, OS_LOG_TYPE_INFO, "sendItemStoppedNotification", v6, 2u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:IMAVPlayerNotification_PlaybackStopped[0] object:self];

  if ((*(_WORD *)&self->_delegateFlags & 0x100) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained playerCurrentItemStopped:self];
  }
}

- (void)sendItemEndedNotification
{
  BOOL v3 = BCAVPlayerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&def_7D91C, v3, OS_LOG_TYPE_INFO, "sendItemEndedNotification", v8, 2u);
  }

  id v4 = [(IMAVPlayer *)self delegate];
  if (v4 && (*(_WORD *)&self->_delegateFlags & 0x40) != 0)
  {
    [(IMAVPlayer *)self duration];
    double v6 = v5;
    [(IMAVPlayer *)self duration];
    [v4 playerPeriodicUpdate:self elapsed:1 duration:v6 isFinished:v7];
  }
  if ((*(_WORD *)&self->_delegateFlags & 0x200) != 0) {
    [v4 playerCurrentItemEnded:self];
  }
}

- (void)setCurrentTime:(double)a3
{
  double v5 = BCAVPlayerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    double v9 = a3;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "setCurrentTime %.1lf", (uint8_t *)&v8, 0xCu);
  }

  if (a3 >= 0.0)
  {
    self->_double lastSeekingTime = a3;
    double v6 = [(AVPlayer *)self->_player currentItem];
    double v7 = (char *)[v6 status];

    if (v7 == (unsigned char *)&def_7D91C + 1 && !self->_seeking)
    {
      self->_seeking = 1;
      [(IMAVPlayer *)self updateSeekTime:a3];
    }
  }
}

- (void)seekFinished:(double)a3
{
  self->_lastSeekedTime = a3;
  if (self->_lastSeekingTime == a3)
  {
    self->_seeking = 0;
    -[IMAVPlayer forceTriggerTimeObserverAt:](self, "forceTriggerTimeObserverAt:");
    [(IMAVPlayer *)self updateNowPlayingInfo];
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D8A34;
    block[3] = &unk_2C3C50;
    void block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)updateSeekTime:(double)a3
{
  if (a3 >= 0.0)
  {
    double v5 = BCAVPlayerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = a3;
      _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "updateSeekTime %.1lf", buf, 0xCu);
    }

    memset(buf, 0, sizeof(buf));
    uint64_t v14 = 0;
    [(IMAVPlayer *)self _contextDependentTolerance];
    player = self->_player;
    CMTimeMakeWithSeconds(&v12, a3, 1000000000);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_D8BA0;
    v11[3] = &unk_2C3D18;
    v11[4] = self;
    *(double *)&v11[5] = a3;
    long long v9 = *(_OWORD *)buf;
    uint64_t v10 = v14;
    long long v7 = *(_OWORD *)buf;
    uint64_t v8 = v14;
    [(AVPlayer *)player seekToTime:&v12 toleranceBefore:&v9 toleranceAfter:&v7 completionHandler:v11];
  }
}

- (double)currentTime
{
  if (self->_seeking) {
    return self->_lastSeekingTime;
  }
  BOOL v3 = [(AVPlayer *)self->_player currentItem];
  dispatch_time_t v4 = (char *)[v3 status];

  if (v4 != (unsigned char *)&def_7D91C + 1) {
    return self->_lastSeekingTime;
  }
  double v5 = [(AVPlayer *)self->_player currentItem];

  if (!v5) {
    return 0.0;
  }
  player = self->_player;
  if (player) {
    [(AVPlayer *)player currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  return CMTimeGetSeconds(&time);
}

- (double)duration
{
  BOOL v3 = [(IMAVPlayer *)self asset];
  dispatch_time_t v4 = (char *)[v3 statusOfValueForKey:@"duration" error:0];

  if (v4 == (unsigned char *)&def_7D91C + 2)
  {
    double v5 = [(IMAVPlayer *)self asset];
    double v6 = v5;
    if (v5) {
      [v5 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    [(IMAVPlayer *)self setCachedDuration:CMTimeGetSeconds(&time)];

    [(IMAVPlayer *)self cachedDuration];
  }
  else
  {
    [(IMAVPlayer *)self cachedDuration];
  }
  return result;
}

- (double)loadedDuration
{
  BOOL v3 = [(AVPlayer *)self->_player currentItem];

  if (!v3) {
    return 0.0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  dispatch_time_t v4 = [(AVPlayer *)self->_player currentItem];
  double v5 = [v4 loadedTimeRanges];

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    double v9 = 0.0;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v11) {
          [v11 CMTimeRangeValue];
        }
        else {
          memset(&v14, 0, sizeof(v14));
        }
        CMTimeRangeGetEnd(&time, &v14);
        double Seconds = CMTimeGetSeconds(&time);
        if (Seconds > v9) {
          double v9 = Seconds;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (void)setEndTime:(double)a3
{
  if (self->_endTime != a3)
  {
    if (a3 == 0.0) {
      [(IMAVPlayer *)self clearEndTimeObserver];
    }
    self->_endTime = a3;
    self->_timeObserverNeedsUpdate = 1;
  }
}

- (void)clearEndTimeObserver
{
  if (self->_endTimeObserver)
  {
    -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:");
    id endTimeObserver = self->_endTimeObserver;
    self->_id endTimeObserver = 0;
  }
}

- (void)addTimeObserver:(double)a3
{
  if (a3 >= 0.0)
  {
    uint64_t v13 = v6;
    uint64_t v14 = v5;
    uint64_t v15 = v3;
    uint64_t v16 = v4;
    if (!self->_observingTimes)
    {
      double v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      observingTimes = self->_observingTimes;
      self->_observingTimes = v9;
    }
    CMTimeMakeWithSeconds(&v12, a3, 1000000000);
    double v11 = +[NSValue valueWithCMTime:&v12];
    [(NSMutableArray *)self->_observingTimes addObject:v11];
    self->_timeObserverNeedsUpdate = 1;
  }
}

- (void)removeTimeObserver:(double)a3
{
  observingTimes = self->_observingTimes;
  CMTimeMakeWithSeconds(&v5, a3, 1000000000);
  uint64_t v4 = +[NSValue valueWithCMTime:&v5];
  [(NSMutableArray *)observingTimes removeObject:v4];
}

- (void)removeAllTimeObservers
{
  [(IMAVPlayer *)self clearTimeObservers];
  [(NSMutableArray *)self->_observingTimes removeAllObjects];
  observingTimes = self->_observingTimes;
  self->_observingTimes = 0;
}

- (void)clearTimeObservers
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_timeObservers;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v7), (void)v9);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_timeObservers removeAllObjects];
  timeObservers = self->_timeObservers;
  self->_timeObservers = 0;
}

- (void)addPeriodicTimeObserver
{
  uint64_t v3 = [(IMAVPlayer *)self periodicTimeObserver];

  if (!v3)
  {
    objc_initWeak(&location, self);
    player = self->_player;
    CMTimeMakeWithSeconds(&v8, 1.0, 1000000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_D9368;
    v6[3] = &unk_2C8C48;
    objc_copyWeak(&v7, &location);
    id v5 = [(AVPlayer *)player addPeriodicTimeObserverForInterval:&v8 queue:0 usingBlock:v6];
    [(IMAVPlayer *)self setPeriodicTimeObserver:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)removePeriodicTimeObserver
{
  uint64_t v3 = [(IMAVPlayer *)self periodicTimeObserver];

  if (v3)
  {
    player = self->_player;
    id v5 = [(IMAVPlayer *)self periodicTimeObserver];
    [(AVPlayer *)player removeTimeObserver:v5];

    [(IMAVPlayer *)self setPeriodicTimeObserver:0];
  }
}

- (void)updateTimeObservers
{
  if (self->_timeObserverNeedsUpdate)
  {
    [(IMAVPlayer *)self clearEndTimeObserver];
    [(IMAVPlayer *)self clearTimeObservers];
    [(IMAVPlayer *)self setupEndTimeObserver];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = self->_observingTimes;
    id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[IMAVPlayer setupTimeObserver:](self, "setupTimeObserver:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8);
        }
        id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    self->_timeObserverNeedsUpdate = 0;
    [(IMAVPlayer *)self currentTime];
    -[IMAVPlayer forceTriggerTimeObserverAt:](self, "forceTriggerTimeObserverAt:");
  }
}

- (void)setupTimeObserver:(id)a3
{
  id v4 = a3;
  id v5 = BCAVPlayerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "add BoundaryTimeObserver timeValue %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  player = self->_player;
  id v7 = +[NSArray arrayWithObject:v4];
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_D97A0;
  long long v17 = &unk_2C4070;
  objc_copyWeak(&v19, (id *)buf);
  id v8 = v4;
  id v18 = v8;
  long long v9 = [(AVPlayer *)player addBoundaryTimeObserverForTimes:v7 queue:0 usingBlock:&v14];

  timeObservers = self->_timeObservers;
  if (!timeObservers)
  {
    long long v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v13 = self->_timeObservers;
    p_timeObservers = &self->_timeObservers;
    *p_timeObservers = v11;

    timeObservers = *p_timeObservers;
  }
  -[NSMutableArray addObject:](timeObservers, "addObject:", v9, v14, v15, v16, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)setupEndTimeObserver
{
  [(IMAVPlayer *)self endTime];
  if (v3 > 0.0)
  {
    [(IMAVPlayer *)self endTime];
    CMTimeMakeWithSeconds(&v16, v4, 1000000000);
    id v5 = +[NSValue valueWithCMTime:&v16];
    objc_initWeak(&location, self);
    uint64_t v6 = BCAVPlayerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl(&def_7D91C, v6, OS_LOG_TYPE_INFO, "End TimeObserver timeValue %@", buf, 0xCu);
    }

    player = self->_player;
    id v8 = +[NSArray arrayWithObject:v5];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_D99E0;
    v12[3] = &unk_2C4070;
    objc_copyWeak(&v14, &location);
    id v9 = v5;
    id v13 = v9;
    long long v10 = [(AVPlayer *)player addBoundaryTimeObserverForTimes:v8 queue:0 usingBlock:v12];
    id endTimeObserver = self->_endTimeObserver;
    self->_id endTimeObserver = v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)triggerTimeObserverAt:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(_WORD *)&self->_delegateFlags & 0x10) != 0)
  {
    if (v4) {
      [v4 CMTimeValue];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
    id v7 = BCAVPlayerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v11 = Seconds;
      _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "triggerTimeObserver %f", buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained player:self callbackForTime:Seconds];
  }
}

- (void)forceTriggerTimeObserverAt:(double)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_observingTimes;
  uint64_t v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      long long v10 = 0;
      double v11 = &v7[(void)v8];
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v10);
        if (v12) {
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) CMTimeValue];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        double Seconds = CMTimeGetSeconds(&time);
        if (Seconds > a3)
        {
          double v11 = &v10[(void)v8];
          goto LABEL_16;
        }
        if (Seconds == a3) {
          goto LABEL_18;
        }
        ++v10;
      }
      while (v7 != v10);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      id v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v11 = 0;
  }
LABEL_16:

  if (v11)
  {
    uint64_t v12 = [(NSMutableArray *)self->_observingTimes objectAtIndex:v11 - 1];
    id v5 = (NSMutableArray *)v12;
LABEL_18:
    [(IMAVPlayer *)self triggerTimeObserverAt:v12];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id v4 = [(IMAVPlayer *)self delegate];
  if (v4 != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = 2;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFD | v5;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 4;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFB | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 8;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFF7 | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 16;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFEF | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 32;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFDF | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 64;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFBF | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 128;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFF7F | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 256;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFEFF | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 512;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFDFF | v13;
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 1024;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFBFF | v14;
  }
}

- (void)updateNowPlayingInfo
{
  double v3 = +[MPNowPlayingInfoCenter defaultCenter];
  if ([(IMAVPlayer *)self state] == 1)
  {
    [v3 setNowPlayingInfo:0];
  }
  else
  {
    id v4 = +[NSMutableDictionary dictionaryWithCapacity:7];
    __int16 v5 = [(IMAVPlayer *)self metaData];
    __int16 v6 = v5;
    if (v5)
    {
      __int16 v7 = [v5 objectForKey:IMAVPlayerMetaData_Title[0]];

      if (v7)
      {
        __int16 v8 = [v6 objectForKey:IMAVPlayerMetaData_Title[0]];
        [v4 setObject:v8 forKey:MPMediaItemPropertyTitle];
      }
      __int16 v9 = [v6 objectForKey:IMAVPlayerMetaData_Artist[0]];

      if (v9)
      {
        __int16 v10 = [v6 objectForKey:IMAVPlayerMetaData_Artist[0]];
        [v4 setObject:v10 forKey:MPMediaItemPropertyArtist];
      }
      __int16 v11 = [v6 objectForKey:IMAVPlayerMetaData_Album[0]];

      if (v11)
      {
        __int16 v12 = [v6 objectForKey:IMAVPlayerMetaData_Album[0]];
        [v4 setObject:v12 forKey:MPMediaItemPropertyAlbumTitle];
      }
      __int16 v13 = +[NSMutableDictionary dictionary];
      __int16 v14 = [v6 objectForKeyedSubscript:IMAVPlayerMetaData_PersistentID[0]];

      if (v14)
      {
        long long v15 = [v6 objectForKeyedSubscript:IMAVPlayerMetaData_PersistentID[0]];
        [v13 setObject:v15 forKeyedSubscript:MPMediaItemPropertyPersistentID];
      }
      long long v16 = [v6 objectForKey:IMAVPlayerMetaData_StoreIdentifier[0]];

      if (v16)
      {
        long long v17 = [v6 objectForKeyedSubscript:IMAVPlayerMetaData_StoreIdentifier[0]];
        [v13 setObject:v17 forKeyedSubscript:_MPNowPlayingInfoPropertyiTunesStoreIdentifier];
      }
      long long v18 = +[NSDictionary dictionaryWithDictionary:v13];
      [v4 setObject:v18 forKey:_MPNowPlayingCollectionInfoKeyIdentifiers];

      id v19 = [v6 objectForKey:IMAVPlayerMetaData_Artwork[0]];
      if (v19)
      {
        id v20 = objc_alloc((Class)MPMediaItemArtwork);
        [v19 size];
        double v22 = v21;
        double v24 = v23;
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_DA41C;
        v33[3] = &unk_2C8C70;
        id v34 = v19;
        id v25 = [v20 initWithBoundsSize:v33 requestHandler:v22];
        [v4 setObject:v25 forKey:MPMediaItemPropertyArtwork];
      }
    }
    [(IMAVPlayer *)self currentTime];
    CMTime v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v4 setObject:v26 forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];

    [(IMAVPlayer *)self duration];
    float v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v4 setObject:v27 forKey:MPMediaItemPropertyPlaybackDuration];

    unsigned int v28 = [(IMAVPlayer *)self isPlaying];
    double v29 = 0.0;
    if (v28)
    {
      [(AVPlayer *)self->_player rate];
      double v29 = v30;
    }
    v31 = +[NSNumber numberWithDouble:v29];
    [v4 setObject:v31 forKey:MPNowPlayingInfoPropertyPlaybackRate];

    v32 = BCAVPlayerLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v36 = v4;
      _os_log_impl(&def_7D91C, v32, OS_LOG_TYPE_INFO, "Setting nowPlayingInfo=%{private}@", buf, 0xCu);
    }

    [v3 setNowPlayingInfo:v4];
  }
}

- (id)stillFrameAt:(double)a3 maxSize:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  __int16 v9 = [(IMAVPlayer *)self asset];
  __int16 v10 = +[AVAssetImageGenerator assetImageGeneratorWithAsset:v9];

  if (a5 < 1.0)
  {
    __int16 v11 = +[UIScreen mainScreen];
    [v11 scale];
    a5 = v12;
  }
  [v10 setMaximumSize:width * a5, height * a5];
  long long v24 = *(_OWORD *)&kCMTimePositiveInfinity.value;
  long long v19 = v24;
  CMTimeEpoch epoch = kCMTimePositiveInfinity.epoch;
  CMTimeEpoch v13 = epoch;
  [v10 setRequestedTimeToleranceBefore:&v24];
  long long v22 = v19;
  CMTimeEpoch v23 = v13;
  [v10 setRequestedTimeToleranceAfter:&v22];
  CMTimeMakeWithSeconds(&v21, a3, 1000000000);
  id v20 = 0;
  __int16 v14 = (CGImage *)[v10 copyCGImageAtTime:&v21 actualTime:0 error:&v20];
  id v15 = v20;
  if (v15)
  {
    long long v16 = BCAVPlayerLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1ED76C(v15, v16);
    }
    long long v17 = 0;
  }
  else
  {
    long long v16 = +[UIScreen mainScreen];
    [v16 scale];
    long long v17 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v14, 0);
  }

  CGImageRelease(v14);

  return v17;
}

- (BOOL)airplayVideoActive
{
  return [(AVPlayer *)self->_player isExternalPlaybackActive];
}

- (void)onScreenConnection:(id)a3
{
  id v4 = a3;
  __int16 v5 = BCAVPlayerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    __int16 v6 = [v4 object];
    int v8 = 138412290;
    __int16 v9 = v6;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "onScreenConnection %@", (uint8_t *)&v8, 0xCu);
  }
  __int16 v7 = [(IMVideoView *)self->_videoView window];

  if (v7) {
    [(IMAVPlayer *)self updateVideoLayer];
  }
}

- (void)onScreenDisconnection:(id)a3
{
  id v4 = a3;
  __int16 v5 = BCAVPlayerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    __int16 v6 = [v4 object];
    int v8 = 138412290;
    __int16 v9 = v6;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "onScreenDisconnection %@", (uint8_t *)&v8, 0xCu);
  }
  __int16 v7 = [(IMVideoView *)self->_videoView window];

  if (v7) {
    [(IMAVPlayer *)self updateVideoLayer];
  }
}

- (void)playbackWasPaused:(id)a3
{
  self->_wasPlaying = [(IMAVPlayer *)self isPlaying];
  p_wasPlaying = &self->_wasPlaying;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1ED804((unsigned __int8 *)p_wasPlaying);
  }
}

- (void)onInterruption:(id)a3
{
  id v4 = a3;
  __int16 v5 = BCAVPlayerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    *(void *)long long v18 = v4;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "onInterruption: notification=%@", (uint8_t *)&v17, 0xCu);
  }

  __int16 v6 = [v4 userInfo];
  __int16 v7 = [v6 objectForKeyedSubscript:AVAudioSessionInterruptionTypeKey];
  int v8 = (char *)[v7 unsignedIntegerValue];

  if (v8)
  {
    if (v8 == (unsigned char *)&def_7D91C + 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1ED888((uint64_t)self);
      }
      __int16 v9 = BCAVPlayerLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        BOOL wasPlaying = self->_wasPlaying;
        int v17 = 67109120;
        *(_DWORD *)long long v18 = wasPlaying;
        _os_log_impl(&def_7D91C, v9, OS_LOG_TYPE_INFO, "begin interruption, wasPlaying: %d", (uint8_t *)&v17, 8u);
      }
    }
  }
  else
  {
    __int16 v11 = [v6 objectForKeyedSubscript:AVAudioSessionInterruptionOptionKey];
    id v12 = [v11 unsignedIntegerValue];

    CMTimeEpoch v13 = BCAVPlayerLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      BOOL v14 = self->_wasPlaying;
      int v17 = 134218240;
      *(void *)long long v18 = v12;
      *(_WORD *)&v18[8] = 1024;
      BOOL v19 = v14;
      _os_log_impl(&def_7D91C, v13, OS_LOG_TYPE_INFO, "end interruption AVAudioSessionInterruptionOptionKey: %lu wasPlaying: %d", (uint8_t *)&v17, 0x12u);
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      BOOL v15 = self->_wasPlaying;
      int v17 = 67109376;
      *(_DWORD *)long long v18 = v12 & 1;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = v15;
      _os_log_impl(&def_7D91C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "AVAudioSession: Interruption has ended. Should resume: %d. Was playing: %d.", (uint8_t *)&v17, 0xEu);
    }
    if (v12)
    {
      long long v16 = +[AVAudioSession sharedInstance];
      [v16 setActive:1 error:0];

      if (self->_wasPlaying)
      {
        [(IMAVPlayer *)self rewindFollowingInterruption];
        [(IMAVPlayer *)self play];
      }
    }
  }
}

- (void)onRouteChange:(id)a3
{
  id v4 = a3;
  __int16 v5 = BCAVPlayerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v4;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "onRouteChange: notification=%@", buf, 0xCu);
  }

  __int16 v6 = [v4 userInfo];
  __int16 v7 = [v6 objectForKey:AVAudioSessionRouteChangePreviousRouteKey];

  int v8 = [v4 userInfo];
  __int16 v9 = [v8 objectForKey:AVAudioSessionRouteChangeReasonKey];

  if ([v9 integerValue] == (char *)&def_7D91C + 2)
  {
    CMTimeEpoch v23 = self;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [v7 outputs];
    id v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v26;
      CMTime v21 = v7;
      id v22 = v4;
      id v20 = v9;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(obj);
          }
          BOOL v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          BOOL v15 = [v14 portType];
          if ([v15 isEqualToString:AVAudioSessionPortHeadphones]) {
            goto LABEL_16;
          }
          long long v16 = [v14 portType];
          if ([v16 isEqualToString:AVAudioSessionPortLineOut])
          {

LABEL_16:
LABEL_17:
            BOOL v19 = BCAVPlayerLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&def_7D91C, v19, OS_LOG_TYPE_INFO, "route change interruption.  Setting _wasPlaying=NO", buf, 2u);
            }

            id v4 = v22;
            v23->_BOOL wasPlaying = 0;
            __int16 v9 = v20;
            __int16 v7 = v21;
            goto LABEL_20;
          }
          int v17 = [v14 portType];
          unsigned __int8 v18 = [v17 isEqualToString:AVAudioSessionPortBluetoothA2DP];

          if (v18) {
            goto LABEL_17;
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        __int16 v7 = v21;
        id v4 = v22;
        __int16 v9 = v20;
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_20:
  }
}

- (AVPlayer)player
{
  return self->_player;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (int)state
{
  return self->_state;
}

- (int)loadState
{
  return self->_loadState;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (IMVideoView)videoView
{
  return self->_videoView;
}

- (IMAVPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMAVPlayerDelegate *)WeakRetained;
}

- (int)scale
{
  return self->_scale;
}

- (double)endTime
{
  return self->_endTime;
}

- (NSDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (float)volume
{
  return self->_volume;
}

- (int)loops
{
  return self->_loops;
}

- (void)setLoops:(int)a3
{
  self->_int loops = a3;
}

- (double)cachedDuration
{
  return self->_cachedDuration;
}

- (void)setCachedDuration:(double)a3
{
  self->_cachedDuration = a3;
}

- (id)periodicTimeObserver
{
  return self->_periodicTimeObserver;
}

- (void)setPeriodicTimeObserver:(id)a3
{
}

- (BOOL)scrubbing
{
  return self->_scrubbing;
}

- (BOOL)externalDisplay
{
  return self->_externalDisplay;
}

- (BOOL)useFullExternalScreen
{
  return self->_useFullExternalScreen;
}

- (BOOL)wasPlaying
{
  return self->_wasPlaying;
}

- (void)setWasPlaying:(BOOL)a3
{
  self->_BOOL wasPlaying = a3;
}

- (BOOL)usesExternalPlaybackWhileExternalScreenIsActive
{
  return self->_usesExternalPlaybackWhileExternalScreenIsActive;
}

- (void)setUsesExternalPlaybackWhileExternalScreenIsActive:(BOOL)a3
{
  self->_BOOL usesExternalPlaybackWhileExternalScreenIsActive = a3;
}

- (double)seekStep
{
  return self->_seekStep;
}

- (void)setSeekStep:(double)a3
{
  self->_seekStep = a3;
}

- (double)seekDelay
{
  return self->_seekDelay;
}

- (void)setSeekDelay:(double)a3
{
  self->_seekDelay = a3;
}

- (BOOL)playWhileSeeking
{
  return self->_playWhileSeeking;
}

- (void)setPlayWhileSeeking:(BOOL)a3
{
  self->_playWhileSeeking = a3;
}

- (unint64_t)skipStepCount
{
  return self->_skipStepCount;
}

- (BOOL)optimizePerformanceOverAccuracy
{
  return self->_optimizePerformanceOverAccuracy;
}

- (void)setOptimizePerformanceOverAccuracy:(BOOL)a3
{
  self->_optimizePerformanceOverAccuracy = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_seekTimer, 0);
  objc_storeStrong((id *)&self->_hdcpTimer, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_observingTimes, 0);
  objc_storeStrong((id *)&self->_timeObservers, 0);
  objc_storeStrong(&self->_periodicTimeObserver, 0);
  objc_storeStrong(&self->_endTimeObserver, 0);
  objc_storeStrong((id *)&self->_externalVideoWindow, 0);
  objc_storeStrong((id *)&self->_externalVideoView, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
  objc_storeStrong((id *)&self->_asset, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end