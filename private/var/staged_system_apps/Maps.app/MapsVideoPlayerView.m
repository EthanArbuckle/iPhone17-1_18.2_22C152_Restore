@interface MapsVideoPlayerView
- (AVPlayer)player;
- (AVPlayerItem)playerItem;
- (AVPlayerLayer)playerLayer;
- (BOOL)aspectFill;
- (BOOL)isObserving;
- (BOOL)resuming;
- (id)playbackDidEndBlock;
- (void)_createVideoPlayer;
- (void)_destroyVideoPlayer;
- (void)_replaceCurrentItemWithPlayerItem:(id)a3 preserveCurrentTimestamp:(BOOL)a4;
- (void)_startObserving;
- (void)_stopObserving;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)loadAssetNamed:(id)a3;
- (void)loadAssetNamed:(id)a3 preservingTimestamp:(BOOL)a4;
- (void)play;
- (void)playerItemDidPlayToEndTimeNotification:(id)a3;
- (void)playerItemFailedToPlayToEndTimeNotification:(id)a3;
- (void)reset;
- (void)sceneWillEnterForegroundNotification:(id)a3;
- (void)setAspectFill:(BOOL)a3;
- (void)setObserving:(BOOL)a3;
- (void)setPlaybackDidEndBlock:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerItem:(id)a3;
- (void)setPlayerLayer:(id)a3;
- (void)setResuming:(BOOL)a3;
@end

@implementation MapsVideoPlayerView

- (void)dealloc
{
  [(MapsVideoPlayerView *)self _stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)MapsVideoPlayerView;
  [(MapsVideoPlayerView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)MapsVideoPlayerView;
  [(MapsVideoPlayerView *)&v12 layoutSubviews];
  [(MapsVideoPlayerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MapsVideoPlayerView *)self playerLayer];
  [v11 setFrame:v4, v6, v8, v10];
}

- (void)didMoveToWindow
{
  v15.receiver = self;
  v15.super_class = (Class)MapsVideoPlayerView;
  [(MapsVideoPlayerView *)&v15 didMoveToWindow];
  double v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UISceneWillEnterForegroundNotification object:0];

  double v4 = [(MapsVideoPlayerView *)self window];
  double v5 = [v4 windowScene];

  if (v5)
  {
    double v6 = +[NSNotificationCenter defaultCenter];
    double v7 = [(MapsVideoPlayerView *)self window];
    double v8 = [v7 windowScene];
    [v6 addObserver:self selector:"sceneWillEnterForegroundNotification:" name:UISceneWillEnterForegroundNotification object:v8];

    double v9 = sub_10067D550();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Setting audio session category to ambient", buf, 0xCu);
    }

    double v10 = +[AVAudioSession sharedInstance];
    id v14 = 0;
    unsigned __int8 v11 = [v10 setCategory:AVAudioSessionCategoryAmbient error:&v14];
    id v12 = v14;

    if ((v11 & 1) == 0)
    {
      v13 = sub_10067D550();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349314;
        v17 = self;
        __int16 v18 = 2112;
        id v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%{public}p] Error setting audio session category to ambient: %@", buf, 0x16u);
      }
    }
    [(MapsVideoPlayerView *)self _createVideoPlayer];
  }
  else
  {
    [(MapsVideoPlayerView *)self _destroyVideoPlayer];
  }
}

- (void)loadAssetNamed:(id)a3
{
}

- (void)loadAssetNamed:(id)a3 preservingTimestamp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSDataAsset) initWithName:v6];

  double v8 = [v7 data];
  v12[0] = AVAssetPreferPreciseDurationAndTimingKey;
  v12[1] = AVAssetReferenceRestrictionsKey;
  v13[0] = &__kCFBooleanFalse;
  v13[1] = &off_1013A8140;
  double v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  double v10 = +[AVAsset assetWithData:v8 contentType:AVFileTypeMPEG4 options:v9];

  unsigned __int8 v11 = +[AVPlayerItem playerItemWithAsset:v10];
  [(MapsVideoPlayerView *)self _replaceCurrentItemWithPlayerItem:v11 preserveCurrentTimestamp:v4];
}

- (void)play
{
  id v2 = [(MapsVideoPlayerView *)self player];
  [v2 play];
}

- (void)reset
{
  double v3 = [(MapsVideoPlayerView *)self player];
  [v3 pause];

  BOOL v4 = [(MapsVideoPlayerView *)self player];
  long long v5 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [v4 seekToTime:&v5];
}

- (void)_replaceCurrentItemWithPlayerItem:(id)a3 preserveCurrentTimestamp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_10067D550();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = [(MapsVideoPlayerView *)self playerItem];
    double v9 = @"NO";
    if (v4) {
      double v9 = @"YES";
    }
    double v10 = v9;
    LODWORD(buf.value) = 134349826;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
    LOWORD(buf.flags) = 2112;
    *(void *)((char *)&buf.flags + 2) = v8;
    HIWORD(buf.epoch) = 2112;
    id v25 = v6;
    __int16 v26 = 2112;
    v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Swapping video; old player item: %@, new player item: %@; preserving timestamp: %@",
      (uint8_t *)&buf,
      0x2Au);
  }
  unsigned __int8 v11 = [(MapsVideoPlayerView *)self playerItem];

  if (!v11)
  {
    objc_super v15 = sub_10067D550();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf.value) = 134349056;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[%{public}p] There was no previously playing item; disabling timestamp preservation",
        (uint8_t *)&buf,
        0xCu);
    }

    [(MapsVideoPlayerView *)self setPlayerItem:v6];
    [(MapsVideoPlayerView *)self _stopObserving];
    goto LABEL_12;
  }
  [(MapsVideoPlayerView *)self setPlayerItem:v6];
  [(MapsVideoPlayerView *)self _stopObserving];
  if (!v4)
  {
LABEL_12:
    v16 = [(MapsVideoPlayerView *)self player];
    v17 = [(MapsVideoPlayerView *)self playerItem];
    [v16 replaceCurrentItemWithPlayerItem:v17];

    goto LABEL_13;
  }
  id v12 = [(MapsVideoPlayerView *)self player];
  [v12 pause];

  v13 = [(MapsVideoPlayerView *)self player];
  id v14 = v13;
  if (v13) {
    [v13 currentTime];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  CMTime buf = time1;

  __int16 v18 = [(MapsVideoPlayerView *)self player];
  id v19 = [(MapsVideoPlayerView *)self playerItem];
  [v18 replaceCurrentItemWithPlayerItem:v19];

  if (v6) {
    [v6 duration];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  CMTime time1 = buf;
  int32_t v20 = CMTimeCompare(&time1, &time2);
  v16 = sub_10067D550();
  BOOL v21 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v20 <= 0)
  {
    if (v21)
    {
      LODWORD(time1.value) = 134349056;
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Preserving timestamp of last video", (uint8_t *)&time1, 0xCu);
    }

    v16 = [(MapsVideoPlayerView *)self player];
    CMTime time1 = buf;
    [v16 seekToTime:&time1];
  }
  else if (v21)
  {
    LODWORD(time1.value) = 134349056;
    *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Could not preserve the timestamp of the last video because the new video is shorter than the timestamp of the last one", (uint8_t *)&time1, 0xCu);
  }
LABEL_13:

  [(MapsVideoPlayerView *)self _startObserving];
}

- (void)_createVideoPlayer
{
  double v3 = sub_10067D550();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134349056;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Creating video player", (uint8_t *)&v15, 0xCu);
  }

  [(MapsVideoPlayerView *)self _stopObserving];
  BOOL v4 = +[AVPlayer playerWithPlayerItem:0];
  player = self->_player;
  self->_player = v4;

  [(AVPlayer *)self->_player setMuted:1];
  [(AVPlayerLayer *)self->_playerLayer removeFromSuperlayer];
  id v6 = +[AVPlayerLayer playerLayerWithPlayer:self->_player];
  playerLayer = self->_playerLayer;
  self->_playerLayer = v6;

  [(MapsVideoPlayerView *)self bounds];
  -[AVPlayerLayer setFrame:](self->_playerLayer, "setFrame:");
  unsigned int v8 = [(MapsVideoPlayerView *)self aspectFill];
  double v9 = &kCAGravityResizeAspectFill;
  if (!v8) {
    double v9 = &kCAGravityResizeAspect;
  }
  [(AVPlayerLayer *)self->_playerLayer setContentsGravity:*v9];
  unsigned int v10 = [(MapsVideoPlayerView *)self aspectFill];
  unsigned __int8 v11 = &AVLayerVideoGravityResizeAspectFill;
  if (!v10) {
    unsigned __int8 v11 = &AVLayerVideoGravityResizeAspect;
  }
  [(AVPlayerLayer *)self->_playerLayer setVideoGravity:*v11];
  id v12 = [(MapsVideoPlayerView *)self layer];
  [v12 addSublayer:self->_playerLayer];

  v13 = [(MapsVideoPlayerView *)self playerItem];

  if (v13)
  {
    id v14 = [(MapsVideoPlayerView *)self playerItem];
    [(MapsVideoPlayerView *)self _replaceCurrentItemWithPlayerItem:v14 preserveCurrentTimestamp:0];
  }
}

- (void)_destroyVideoPlayer
{
  double v3 = sub_10067D550();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134349056;
    unsigned int v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Destroying video player", (uint8_t *)&v7, 0xCu);
  }

  [(MapsVideoPlayerView *)self _stopObserving];
  BOOL v4 = [(MapsVideoPlayerView *)self player];
  [v4 replaceCurrentItemWithPlayerItem:0];

  playerItem = self->_playerItem;
  self->_playerItem = 0;

  id v6 = [(MapsVideoPlayerView *)self player];
  [v6 pause];

  [(MapsVideoPlayerView *)self setPlayer:0];
}

- (void)_startObserving
{
  if (![(MapsVideoPlayerView *)self isObserving])
  {
    double v3 = sub_10067D550();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 134349056;
      unsigned __int8 v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Start observing notifications", (uint8_t *)&v10, 0xCu);
    }

    BOOL v4 = +[NSNotificationCenter defaultCenter];
    long long v5 = [(MapsVideoPlayerView *)self player];
    id v6 = [v5 currentItem];
    [v4 addObserver:self selector:"playerItemDidPlayToEndTimeNotification:" name:AVPlayerItemDidPlayToEndTimeNotification object:v6];

    int v7 = +[NSNotificationCenter defaultCenter];
    unsigned int v8 = [(MapsVideoPlayerView *)self player];
    double v9 = [v8 currentItem];
    [v7 addObserver:self selector:"playerItemFailedToPlayToEndTimeNotification:" name:AVPlayerItemFailedToPlayToEndTimeNotification object:v9];

    [(MapsVideoPlayerView *)self setObserving:1];
  }
}

- (void)_stopObserving
{
  if ([(MapsVideoPlayerView *)self isObserving])
  {
    double v3 = sub_10067D550();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 134349056;
      int v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Stop observing notifications", (uint8_t *)&v6, 0xCu);
    }

    BOOL v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:0];

    long long v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:AVPlayerItemFailedToPlayToEndTimeNotification object:0];

    [(MapsVideoPlayerView *)self setObserving:0];
  }
}

- (void)playerItemDidPlayToEndTimeNotification:(id)a3
{
  BOOL v4 = sub_10067D550();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134349056;
    unsigned int v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Video finished playing; looping",
      (uint8_t *)&v7,
      0xCu);
  }

  long long v5 = [(MapsVideoPlayerView *)self playbackDidEndBlock];

  if (v5)
  {
    int v6 = [(MapsVideoPlayerView *)self playbackDidEndBlock];
    v6[2]();
  }
}

- (void)playerItemFailedToPlayToEndTimeNotification:(id)a3
{
  BOOL v4 = sub_10067D550();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    long long v5 = [(MapsVideoPlayerView *)self player];
    int v6 = [v5 currentItem];
    int v7 = [v6 error];
    int v9 = 134349314;
    int v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[%{public}p] Player item failed to play to end time notification: %@; re-starting video",
      (uint8_t *)&v9,
      0x16u);
  }
  unsigned int v8 = [(MapsVideoPlayerView *)self playerItem];
  [(MapsVideoPlayerView *)self _replaceCurrentItemWithPlayerItem:v8 preserveCurrentTimestamp:0];
}

- (void)sceneWillEnterForegroundNotification:(id)a3
{
  BOOL v4 = sub_10067D550();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 134349056;
    int v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Application will enter foreground; re-starting video",
      (uint8_t *)&v6,
      0xCu);
  }

  long long v5 = [(MapsVideoPlayerView *)self playerItem];
  [(MapsVideoPlayerView *)self _replaceCurrentItemWithPlayerItem:v5 preserveCurrentTimestamp:1];
}

- (id)playbackDidEndBlock
{
  return self->_playbackDidEndBlock;
}

- (void)setPlaybackDidEndBlock:(id)a3
{
}

- (BOOL)aspectFill
{
  return self->_aspectFill;
}

- (void)setAspectFill:(BOOL)a3
{
  self->_aspectFill = a3;
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (BOOL)resuming
{
  return self->_resuming;
}

- (void)setResuming:(BOOL)a3
{
  self->_resuming = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);

  objc_storeStrong(&self->_playbackDidEndBlock, 0);
}

@end