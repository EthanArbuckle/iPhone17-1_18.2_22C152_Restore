@interface MapsLoopingVideoPlayerView
- (AVPlayer)player;
- (AVPlayerItem)playerItem;
- (AVPlayerLayer)playerLayer;
- (BOOL)isObserving;
- (BOOL)resuming;
- (void)_createVideoPlayer;
- (void)_destroyVideoPlayer;
- (void)_startObserving;
- (void)_stopObserving;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playerItemDidPlayToEndTimeNotification:(id)a3;
- (void)playerItemFailedToPlayToEndTimeNotification:(id)a3;
- (void)playerPlaybackWasInterruptedNotification:(id)a3;
- (void)replaceCurrentItemWithPlayerItem:(id)a3 preserveCurrentTimestamp:(BOOL)a4;
- (void)sceneWillEnterForegroundNotification:(id)a3;
- (void)setObserving:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerItem:(id)a3;
- (void)setPlayerLayer:(id)a3;
- (void)setResuming:(BOOL)a3;
@end

@implementation MapsLoopingVideoPlayerView

- (void)dealloc
{
  [(MapsLoopingVideoPlayerView *)self _stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)MapsLoopingVideoPlayerView;
  [(MapsLoopingVideoPlayerView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)MapsLoopingVideoPlayerView;
  [(MapsLoopingVideoPlayerView *)&v12 layoutSubviews];
  [(MapsLoopingVideoPlayerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MapsLoopingVideoPlayerView *)self playerLayer];
  [v11 setFrame:v4, v6, v8, v10];
}

- (void)didMoveToWindow
{
  v15.receiver = self;
  v15.super_class = (Class)MapsLoopingVideoPlayerView;
  [(MapsLoopingVideoPlayerView *)&v15 didMoveToWindow];
  double v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UISceneWillEnterForegroundNotification object:0];

  double v4 = [(MapsLoopingVideoPlayerView *)self window];
  double v5 = [v4 windowScene];

  if (v5)
  {
    double v6 = +[NSNotificationCenter defaultCenter];
    double v7 = [(MapsLoopingVideoPlayerView *)self window];
    double v8 = [v7 windowScene];
    [v6 addObserver:self selector:"sceneWillEnterForegroundNotification:" name:UISceneWillEnterForegroundNotification object:v8];

    double v9 = sub_100370C60();
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
      v13 = sub_100370C60();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349314;
        v17 = self;
        __int16 v18 = 2112;
        id v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%{public}p] Error setting audio session category to ambient: %@", buf, 0x16u);
      }
    }
    [(MapsLoopingVideoPlayerView *)self _createVideoPlayer];
  }
  else
  {
    [(MapsLoopingVideoPlayerView *)self _destroyVideoPlayer];
  }
}

- (void)replaceCurrentItemWithPlayerItem:(id)a3 preserveCurrentTimestamp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = sub_100370C60();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = [(MapsLoopingVideoPlayerView *)self playerItem];
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
    id v26 = v6;
    __int16 v27 = 2112;
    v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Swapping video; old player item: %@, new player item: %@; preserving timestamp: %@",
      (uint8_t *)&buf,
      0x2Au);
  }
  unsigned __int8 v11 = [(MapsLoopingVideoPlayerView *)self playerItem];

  if (!v11)
  {
    objc_super v15 = sub_100370C60();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf.value) = 134349056;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[%{public}p] There was no previously playing item; disabling timestamp preservation",
        (uint8_t *)&buf,
        0xCu);
    }

    [(MapsLoopingVideoPlayerView *)self setPlayerItem:v6];
    [(MapsLoopingVideoPlayerView *)self _stopObserving];
    goto LABEL_12;
  }
  [(MapsLoopingVideoPlayerView *)self setPlayerItem:v6];
  [(MapsLoopingVideoPlayerView *)self _stopObserving];
  if (!v4)
  {
LABEL_12:
    v16 = [(MapsLoopingVideoPlayerView *)self player];
    v17 = [(MapsLoopingVideoPlayerView *)self playerItem];
    [v16 replaceCurrentItemWithPlayerItem:v17];

    goto LABEL_13;
  }
  id v12 = [(MapsLoopingVideoPlayerView *)self player];
  [v12 pause];

  v13 = [(MapsLoopingVideoPlayerView *)self player];
  id v14 = v13;
  if (v13) {
    [v13 currentTime];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  CMTime buf = time1;

  id v19 = [(MapsLoopingVideoPlayerView *)self player];
  v20 = [(MapsLoopingVideoPlayerView *)self playerItem];
  [v19 replaceCurrentItemWithPlayerItem:v20];

  if (v6) {
    [v6 duration];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  CMTime time1 = buf;
  int32_t v21 = CMTimeCompare(&time1, &time2);
  v16 = sub_100370C60();
  BOOL v22 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v21 <= 0)
  {
    if (v22)
    {
      LODWORD(time1.value) = 134349056;
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Preserving timestamp of last video", (uint8_t *)&time1, 0xCu);
    }

    v16 = [(MapsLoopingVideoPlayerView *)self player];
    CMTime time1 = buf;
    [v16 seekToTime:&time1];
  }
  else if (v22)
  {
    LODWORD(time1.value) = 134349056;
    *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Could not preserve the timestamp of the last video because the new video is shorter than the timestamp of the last one", (uint8_t *)&time1, 0xCu);
  }
LABEL_13:

  [(MapsLoopingVideoPlayerView *)self _startObserving];
  __int16 v18 = [(MapsLoopingVideoPlayerView *)self player];
  [v18 play];
}

- (void)_createVideoPlayer
{
  double v3 = sub_100370C60();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134349056;
    id v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Creating video player", (uint8_t *)&v11, 0xCu);
  }

  [(MapsLoopingVideoPlayerView *)self _stopObserving];
  BOOL v4 = +[AVPlayer playerWithPlayerItem:0];
  player = self->_player;
  self->_player = v4;

  [(AVPlayer *)self->_player setMuted:1];
  [(AVPlayerLayer *)self->_playerLayer removeFromSuperlayer];
  id v6 = +[AVPlayerLayer playerLayerWithPlayer:self->_player];
  playerLayer = self->_playerLayer;
  self->_playerLayer = v6;

  [(MapsLoopingVideoPlayerView *)self bounds];
  -[AVPlayerLayer setFrame:](self->_playerLayer, "setFrame:");
  [(AVPlayerLayer *)self->_playerLayer setContentsGravity:kCAGravityResizeAspect];
  [(AVPlayerLayer *)self->_playerLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
  double v8 = [(MapsLoopingVideoPlayerView *)self layer];
  [v8 addSublayer:self->_playerLayer];

  double v9 = [(MapsLoopingVideoPlayerView *)self playerItem];

  if (v9)
  {
    double v10 = [(MapsLoopingVideoPlayerView *)self playerItem];
    [(MapsLoopingVideoPlayerView *)self replaceCurrentItemWithPlayerItem:v10 preserveCurrentTimestamp:0];
  }
}

- (void)_destroyVideoPlayer
{
  double v3 = sub_100370C60();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134349056;
    double v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Destroying video player", (uint8_t *)&v7, 0xCu);
  }

  [(MapsLoopingVideoPlayerView *)self _stopObserving];
  BOOL v4 = [(MapsLoopingVideoPlayerView *)self player];
  [v4 replaceCurrentItemWithPlayerItem:0];

  playerItem = self->_playerItem;
  self->_playerItem = 0;

  id v6 = [(MapsLoopingVideoPlayerView *)self player];
  [v6 pause];

  [(MapsLoopingVideoPlayerView *)self setPlayer:0];
}

- (void)_startObserving
{
  if (![(MapsLoopingVideoPlayerView *)self isObserving])
  {
    double v3 = sub_100370C60();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134349056;
      objc_super v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Start observing notifications", (uint8_t *)&v14, 0xCu);
    }

    BOOL v4 = [(MapsLoopingVideoPlayerView *)self player];
    [v4 addObserver:self forKeyPath:@"rate" options:1 context:0];

    double v5 = +[NSNotificationCenter defaultCenter];
    id v6 = [(MapsLoopingVideoPlayerView *)self player];
    int v7 = [v6 currentItem];
    [v5 addObserver:self selector:"playerItemDidPlayToEndTimeNotification:" name:AVPlayerItemDidPlayToEndTimeNotification object:v7];

    double v8 = +[NSNotificationCenter defaultCenter];
    double v9 = [(MapsLoopingVideoPlayerView *)self player];
    double v10 = [v9 currentItem];
    [v8 addObserver:self selector:"playerItemFailedToPlayToEndTimeNotification:" name:AVPlayerItemFailedToPlayToEndTimeNotification object:v10];

    int v11 = +[NSNotificationCenter defaultCenter];
    uint64_t v12 = AVPlayerPlaybackWasInterruptedNotification;
    v13 = [(MapsLoopingVideoPlayerView *)self player];
    [v11 addObserver:self selector:"playerPlaybackWasInterruptedNotification:" name:v12 object:v13];

    [(MapsLoopingVideoPlayerView *)self setObserving:1];
  }
}

- (void)_stopObserving
{
  if ([(MapsLoopingVideoPlayerView *)self isObserving])
  {
    double v3 = sub_100370C60();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134349056;
      double v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Stop observing notifications", (uint8_t *)&v8, 0xCu);
    }

    BOOL v4 = [(MapsLoopingVideoPlayerView *)self player];
    [v4 removeObserver:self forKeyPath:@"rate"];

    double v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:0];

    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:AVPlayerItemFailedToPlayToEndTimeNotification object:0];

    int v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:AVPlayerPlaybackWasInterruptedNotification object:0];

    [(MapsLoopingVideoPlayerView *)self setObserving:0];
  }
}

- (void)playerItemDidPlayToEndTimeNotification:(id)a3
{
  BOOL v4 = sub_100370C60();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v7) = 134349056;
    *(void *)((char *)&v7 + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Video finished playing; looping",
      (uint8_t *)&v7,
      0xCu);
  }

  double v5 = [(MapsLoopingVideoPlayerView *)self player];
  long long v7 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [v5 seekToTime:&v7];

  id v6 = [(MapsLoopingVideoPlayerView *)self player];
  [v6 play];
}

- (void)playerItemFailedToPlayToEndTimeNotification:(id)a3
{
  BOOL v4 = sub_100370C60();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    double v5 = [(MapsLoopingVideoPlayerView *)self player];
    id v6 = [v5 currentItem];
    long long v7 = [v6 error];
    int v9 = 134349314;
    double v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[%{public}p] Player item failed to play to end time notification: %@; re-starting video",
      (uint8_t *)&v9,
      0x16u);
  }
  int v8 = [(MapsLoopingVideoPlayerView *)self playerItem];
  [(MapsLoopingVideoPlayerView *)self replaceCurrentItemWithPlayerItem:v8 preserveCurrentTimestamp:0];
}

- (void)sceneWillEnterForegroundNotification:(id)a3
{
  BOOL v4 = sub_100370C60();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 134349056;
    long long v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Application will enter foreground; re-starting video",
      (uint8_t *)&v6,
      0xCu);
  }

  double v5 = [(MapsLoopingVideoPlayerView *)self playerItem];
  [(MapsLoopingVideoPlayerView *)self replaceCurrentItemWithPlayerItem:v5 preserveCurrentTimestamp:1];
}

- (void)playerPlaybackWasInterruptedNotification:(id)a3
{
  BOOL v4 = sub_100370C60();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 134349056;
    long long v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Player playback was interrupted; re-starting video",
      (uint8_t *)&v6,
      0xCu);
  }

  double v5 = [(MapsLoopingVideoPlayerView *)self player];
  [v5 play];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(MapsLoopingVideoPlayerView *)self player];
  if (v13 != v11)
  {

LABEL_9:
    v23.receiver = self;
    v23.super_class = (Class)MapsLoopingVideoPlayerView;
    [(MapsLoopingVideoPlayerView *)&v23 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_10;
  }
  unsigned int v14 = [v10 isEqualToString:@"rate"];

  if (!v14) {
    goto LABEL_9;
  }
  objc_super v15 = [(MapsLoopingVideoPlayerView *)self player];
  [v15 rate];
  float v17 = v16;

  if (v17 == 0.0)
  {
    unsigned int v18 = [(MapsLoopingVideoPlayerView *)self resuming];
    id v19 = sub_100370C60();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int32_t v21 = [(MapsLoopingVideoPlayerView *)self playerItem];
        *(_DWORD *)CMTime buf = 134349314;
        v25 = self;
        __int16 v26 = 2112;
        __int16 v27 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%{public}p] AVPlayer was paused, resumed, and immediately paused again. Will not try resuming again. playerItem: %@", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CMTime buf = 134349056;
        v25 = self;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] AVPlayer was paused; re-starting video",
          buf,
          0xCu);
      }

      [(MapsLoopingVideoPlayerView *)self setResuming:1];
      BOOL v22 = [(MapsLoopingVideoPlayerView *)self player];
      [v22 play];

      [(MapsLoopingVideoPlayerView *)self setResuming:0];
    }
  }
LABEL_10:
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
}

@end