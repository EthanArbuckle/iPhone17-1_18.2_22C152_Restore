@interface TUIVideoPlayer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastPlaybackTime;
- (AVAsset)playerAsset;
- (AVPlayerItem)playerItem;
- (BOOL)captionsEnabled;
- (BOOL)isPlaying;
- (BOOL)shouldBePlaying;
- (BOOL)shouldLoop;
- (NSLock)lastPlaybackTimeLock;
- (NSString)videoId;
- (NSURL)videoUrl;
- (TUIVideoPlayer)initWithUrl:(id)a3 videoId:(id)a4;
- (TUIVideoPlayerDelegate)delegate;
- (_TUIVideoPlaybackChecks)playbackChecks;
- (double)currentTimePlayed;
- (id)_failureAsString;
- (id)_stateAsString;
- (id)_timeControlStatusAsString;
- (id)description;
- (id)timeObserver;
- (int64_t)failureCount;
- (unint64_t)failureReason;
- (unint64_t)state;
- (void)_addPlaybackCheckObservers;
- (void)_addPlayerItemObservers;
- (void)_addPlayerObservers;
- (void)_loadPlayerWithAsset:(id)a3;
- (void)_removePlaybackCheckObservers;
- (void)_removePlayerItemObservers;
- (void)_removePlayerObservers;
- (void)beginLoadingResources;
- (void)dealloc;
- (void)handlePlaybackChecksChange:(id)a3 keyPath:(id)a4 playbackChecks:(id)a5;
- (void)handlePlayerChange:(id)a3 keyPath:(id)a4 player:(id)a5;
- (void)handlePlayerItemChange:(id)a3 keyPath:(id)a4 playerItem:(id)a5;
- (void)logPlayerStatus;
- (void)mediaSelectionDidChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)playbackErrorOccured:(id)a3;
- (void)releaseResources;
- (void)reload;
- (void)reloadWithNewURL:(id)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setFailureCount:(int64_t)a3;
- (void)setFailureReason:(unint64_t)a3;
- (void)setLastPlaybackTime:(id *)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPlayerItem:(id)a3;
- (void)setShouldBePlaying:(BOOL)a3;
- (void)setShouldLoop:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setTimeObserver:(id)a3;
- (void)setVideoId:(id)a3;
- (void)setVideoUrl:(id)a3;
- (void)videoDidPlayToEnd;
- (void)videoPlaybackDidStall;
@end

@implementation TUIVideoPlayer

- (TUIVideoPlayer)initWithUrl:(id)a3 videoId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIVideoPlayer;
  v9 = [(TUIVideoPlayer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_videoUrl, a3);
    objc_storeStrong((id *)&v10->_videoId, a4);
    *(_OWORD *)&v10->_lastPlaybackTime.value = *(_OWORD *)&kCMTimeZero.value;
    v10->_lastPlaybackTime.epoch = kCMTimeZero.epoch;
    v11 = objc_alloc_init(_TUIVideoPlaybackChecks);
    playbackChecks = v10->_playbackChecks;
    v10->_playbackChecks = v11;

    [(TUIVideoPlayer *)v10 _addPlayerObservers];
    [(TUIVideoPlayer *)v10 _addPlaybackCheckObservers];
  }

  return v10;
}

- (void)dealloc
{
  [(TUIVideoPlayer *)self _removePlayerObservers];
  [(TUIVideoPlayer *)self _removePlayerItemObservers];
  [(TUIVideoPlayer *)self _removePlaybackCheckObservers];
  if (self->_timeObserver) {
    -[TUIVideoPlayer removeTimeObserver:](self, "removeTimeObserver:");
  }
  v3.receiver = self;
  v3.super_class = (Class)TUIVideoPlayer;
  [(TUIVideoPlayer *)&v3 dealloc];
}

- (void)setPlayerItem:(id)a3
{
  v4 = (AVPlayerItem *)a3;
  v5 = [(TUIVideoPlayer *)self playerItem];

  if (v5) {
    [(TUIVideoPlayer *)self _removePlayerItemObservers];
  }
  playerItem = self->_playerItem;
  self->_playerItem = v4;

  [(TUIVideoPlayer *)self replaceCurrentItemWithPlayerItem:0];

  [(TUIVideoPlayer *)self _addPlayerItemObservers];
}

- (void)setShouldLoop:(BOOL)a3
{
  if (self->_shouldLoop != a3) {
    self->_shouldLoop = a3;
  }
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    if (a3 == 6) {
      self->_shouldBePlaying = 1;
    }
    if (*(_WORD *)&self->_delegateFlags)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained player:self didChangeState:self->_state];
    }
    v5 = TUIVideoLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(TUIVideoPlayer *)self _stateAsString];
      int v7 = 138412546;
      id v8 = self;
      __int16 v9 = 2112;
      v10 = v6;
      _os_log_impl(&def_141F14, v5, OS_LOG_TYPE_DEFAULT, "%@ : Did change state: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)setTimeObserver:(id)a3
{
  id v4 = a3;
  if (self->_timeObserver) {
    -[TUIVideoPlayer removeTimeObserver:](self, "removeTimeObserver:");
  }
  id timeObserver = self->_timeObserver;
  self->_id timeObserver = v4;
}

- (void)setLastPlaybackTime:(id *)a3
{
  [(NSLock *)self->_lastPlaybackTimeLock lock];
  long long v5 = *(_OWORD *)&a3->var0;
  self->_lastPlaybackTime.epoch = a3->var3;
  *(_OWORD *)&self->_lastPlaybackTime.value = v5;
  lastPlaybackTimeLock = self->_lastPlaybackTimeLock;

  [(NSLock *)lastPlaybackTimeLock unlock];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
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
  }
}

- (void)setFailureCount:(int64_t)a3
{
  self->_failureCount = a3;
  unint64_t v5 = a3 - 1;
  __int16 v6 = TUIVideoLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 > 1)
  {
    if (v7)
    {
      int v8 = 138412546;
      __int16 v9 = self;
      __int16 v10 = 2048;
      int64_t v11 = 2;
      _os_log_impl(&def_141F14, v6, OS_LOG_TYPE_DEFAULT, "%@ : Did reach reload limit of %lu", (uint8_t *)&v8, 0x16u);
    }

    [(TUIVideoPlayer *)self setState:10];
  }
  else
  {
    if (v7)
    {
      int v8 = 138412802;
      __int16 v9 = self;
      __int16 v10 = 2048;
      int64_t v11 = a3;
      __int16 v12 = 2048;
      uint64_t v13 = 2;
      _os_log_impl(&def_141F14, v6, OS_LOG_TYPE_DEFAULT, "%@ : Attempting to reload, attempt %lu of %lu", (uint8_t *)&v8, 0x20u);
    }

    [(TUIVideoPlayer *)self reload];
  }
}

- (void)setFailureReason:(unint64_t)a3
{
  self->_unint64_t failureReason = a3;
  if (a3)
  {
    id v4 = TUIVideoLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = [(TUIVideoPlayer *)self _failureAsString];
      int v8 = 138412546;
      __int16 v9 = self;
      __int16 v10 = 2112;
      int64_t v11 = v5;
      _os_log_impl(&def_141F14, v4, OS_LOG_TYPE_DEFAULT, "%@ : Playback did fail, reason: %@", (uint8_t *)&v8, 0x16u);
    }
    if ((*(_WORD *)&self->_delegateFlags & 0x100) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      unint64_t failureReason = self->_failureReason;
      [(TUIVideoPlayer *)self currentTimePlayed];
      [WeakRetained player:self didSetFailureReason:failureReason];
    }
    [(TUIVideoPlayer *)self setFailureCount:(char *)[(TUIVideoPlayer *)self failureCount] + 1];
  }
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([(TUIVideoPlayer *)self isMuted] != v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)TUIVideoPlayer;
    [(TUIVideoPlayer *)&v6 setMuted:v3];
    if ((*(_WORD *)&self->_delegateFlags & 0x80) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [(TUIVideoPlayer *)self currentTimePlayed];
      [WeakRetained player:didSetMuted:mediaTimePlayed:self, v3];
    }
  }
}

- (AVAsset)playerAsset
{
  playerItem = self->_playerItem;
  if (playerItem)
  {
    playerItem = [playerItem asset];
  }

  return (AVAsset *)playerItem;
}

- (BOOL)isPlaying
{
  if (self->_state == 7 || [(TUIVideoPlayer *)self timeControlStatus] != (char *)&def_141F14 + 2) {
    return 0;
  }
  BOOL v3 = [(TUIVideoPlayer *)self error];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)captionsEnabled
{
  BOOL v3 = [(TUIVideoPlayer *)self playerItem];
  BOOL v4 = [(TUIVideoPlayer *)self playerItem];
  unint64_t v5 = [v4 asset];
  objc_super v6 = [v5 mediaSelectionGroupForMediaCharacteristic:AVMediaCharacteristicLegible];

  if (v6) {
    BOOL v7 = v3 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    BOOL v10 = 0;
  }
  else
  {
    int v8 = [v3 currentMediaSelection];
    __int16 v9 = [v8 selectedMediaOptionInMediaSelectionGroup:v6];

    BOOL v10 = v9 != 0;
  }

  return v10;
}

- (double)currentTimePlayed
{
  [(TUIVideoPlayer *)self currentTime];
  return CMTimeGetSeconds(&time);
}

- (void)beginLoadingResources
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_videoUrl)
  {
    BOOL v3 = [(TUIVideoPlayer *)self playerAsset];

    if (v3)
    {
      BOOL v4 = [(TUIVideoPlayer *)self playerAsset];
      [v4 cancelLoading];
    }
    [(TUIVideoPlayer *)self setState:1];
    objc_initWeak(&location, self);
    videoUrl = self->_videoUrl;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_159A2C;
    v6[3] = &unk_2566C0;
    objc_copyWeak(&v7, &location);
    +[AVAsset tui_createAssetFromURL:videoUrl completion:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)releaseResources
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([(TUIVideoPlayer *)self isPlaying]) {
    [(TUIVideoPlayer *)self pause];
  }
  [(TUIVideoPlayer *)self currentTime];
  long long v5 = v7;
  uint64_t v6 = v8;
  [(TUIVideoPlayer *)self setLastPlaybackTime:&v5];
  BOOL v3 = [(TUIVideoPlayer *)self playerAsset];
  [v3 cancelLoading];

  BOOL v4 = [(TUIVideoPlayer *)self playbackChecks];
  [v4 reset];

  [(TUIVideoPlayer *)self setPlayerItem:0];
  [(TUIVideoPlayer *)self setState:0];
}

- (void)reset
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(TUIVideoPlayer *)self releaseResources];
  long long v3 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [(TUIVideoPlayer *)self setLastPlaybackTime:&v3];
  [(TUIVideoPlayer *)self setFailureReason:0];
  self->_shouldBePlaying = 0;
  self->_failureCount = 0;
}

- (void)reloadWithNewURL:(id)a3
{
  BOOL v4 = (NSURL *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  BOOL v5 = [(TUIVideoPlayer *)self isPlaying];
  [(TUIVideoPlayer *)self releaseResources];
  self->_shouldBePlaying = v5;
  videoUrl = self->_videoUrl;
  self->_videoUrl = v4;

  [(TUIVideoPlayer *)self reload];
}

- (void)reload
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(TUIVideoPlayer *)self setState:0];
  [(TUIVideoPlayer *)self setFailureReason:0];
  long long v3 = [(TUIVideoPlayer *)self playerAsset];

  if (v3)
  {
    BOOL v4 = [(TUIVideoPlayer *)self playerAsset];
    [v4 cancelLoading];
  }
  [(TUIVideoPlayer *)self setPlayerItem:0];
  BOOL v5 = [(TUIVideoPlayer *)self playbackChecks];
  [v5 reset];

  [(TUIVideoPlayer *)self beginLoadingResources];
}

- (void)play
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (![(TUIVideoPlayer *)self isPlaying])
  {
    self->_shouldBePlaying = 1;
    if (self->_state)
    {
      long long v3 = [(TUIVideoPlayer *)self playbackChecks];
      unsigned int v4 = [v3 complete];

      if (v4)
      {
        v5.receiver = self;
        v5.super_class = (Class)TUIVideoPlayer;
        [(TUIVideoPlayer *)&v5 play];
      }
    }
    else
    {
      [(TUIVideoPlayer *)self beginLoadingResources];
    }
  }
}

- (void)pause
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  self->_shouldBePlaying = 0;
  v3.receiver = self;
  v3.super_class = (Class)TUIVideoPlayer;
  [(TUIVideoPlayer *)&v3 pause];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<TUIVideoPlayer %p: url: %@, videoId: %@>", self, self->_videoUrl, self->_videoId];
}

- (void)_loadPlayerWithAsset:(id)a3
{
  id v4 = a3;
  v14[0] = @"duration";
  v14[1] = @"playable";
  objc_super v5 = +[NSArray arrayWithObjects:v14 count:2];
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_159FD4;
  v8[3] = &unk_256760;
  objc_copyWeak(&v12, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  int64_t v11 = self;
  [v7 loadValuesAsynchronouslyForKeys:v6 completionHandler:v8];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_addPlaybackCheckObservers
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(_TUIVideoPlaybackChecks *)self->_playbackChecks addObserver:self forKeyPath:@"assetKeysLoaded" options:1 context:&off_256780];
  [(_TUIVideoPlaybackChecks *)self->_playbackChecks addObserver:self forKeyPath:@"itemIsReadyToPlay" options:1 context:&off_256780];
  playbackChecks = self->_playbackChecks;

  [(_TUIVideoPlaybackChecks *)playbackChecks addObserver:self forKeyPath:@"playbackLikelyToKeepUp" options:1 context:&off_256780];
}

- (void)_removePlaybackCheckObservers
{
  [(_TUIVideoPlaybackChecks *)self->_playbackChecks removeObserver:self forKeyPath:@"assetKeysLoaded"];
  [(_TUIVideoPlaybackChecks *)self->_playbackChecks removeObserver:self forKeyPath:@"itemIsReadyToPlay"];
  playbackChecks = self->_playbackChecks;

  [(_TUIVideoPlaybackChecks *)playbackChecks removeObserver:self forKeyPath:@"playbackLikelyToKeepUp"];
}

- (void)_addPlayerObservers
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(TUIVideoPlayer *)self addObserver:self forKeyPath:@"rate" options:1 context:&off_256780];
  [(TUIVideoPlayer *)self addObserver:self forKeyPath:@"timeControlStatus" options:1 context:&off_256780];

  [(TUIVideoPlayer *)self addObserver:self forKeyPath:@"reasonForWaitingToPlay" options:1 context:&off_256780];
}

- (void)_removePlayerObservers
{
  [(TUIVideoPlayer *)self removeObserver:self forKeyPath:@"rate" context:&off_256780];
  [(TUIVideoPlayer *)self removeObserver:self forKeyPath:@"timeControlStatus" context:&off_256780];

  [(TUIVideoPlayer *)self removeObserver:self forKeyPath:@"reasonForWaitingToPlay" context:&off_256780];
}

- (void)_addPlayerItemObservers
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  playerItem = self->_playerItem;
  if (playerItem)
  {
    [(AVPlayerItem *)playerItem addObserver:self forKeyPath:@"status" options:1 context:&off_256780];
    [(AVPlayerItem *)self->_playerItem addObserver:self forKeyPath:@"playbackLikelyToKeepUp" options:1 context:&off_256780];
    [(AVPlayerItem *)self->_playerItem addObserver:self forKeyPath:@"playbackBufferFull" options:1 context:&off_256780];
    [(AVPlayerItem *)self->_playerItem addObserver:self forKeyPath:@"playbackBufferEmpty" options:1 context:&off_256780];
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"videoDidPlayToEnd" name:AVPlayerItemDidPlayToEndTimeNotification object:self->_playerItem];

    objc_super v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"videoPlaybackDidStall" name:AVPlayerItemPlaybackStalledNotification object:self->_playerItem];

    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"playbackErrorOccured:" name:AVPlayerItemFailedToPlayToEndTimeErrorKey object:self->_playerItem];

    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"playbackErrorOccured:" name:AVPlayerItemNewErrorLogEntryNotification object:self->_playerItem];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"mediaSelectionDidChange:" name:AVPlayerItemMediaSelectionDidChangeNotification object:self->_playerItem];
  }
}

- (void)_removePlayerItemObservers
{
  playerItem = self->_playerItem;
  if (playerItem)
  {
    [(AVPlayerItem *)playerItem removeObserver:self forKeyPath:@"status" context:&off_256780];
    [(AVPlayerItem *)self->_playerItem removeObserver:self forKeyPath:@"playbackLikelyToKeepUp" context:&off_256780];
    [(AVPlayerItem *)self->_playerItem removeObserver:self forKeyPath:@"playbackBufferFull" context:&off_256780];
    [(AVPlayerItem *)self->_playerItem removeObserver:self forKeyPath:@"playbackBufferEmpty" context:&off_256780];
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:self->_playerItem];

    objc_super v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:AVPlayerItemPlaybackStalledNotification object:self->_playerItem];

    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:AVPlayerItemFailedToPlayToEndTimeErrorKey object:self->_playerItem];

    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:AVPlayerItemNewErrorLogEntryNotification object:self->_playerItem];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self name:AVPlayerItemMediaSelectionDidChangeNotification object:self->_playerItem];
  }
}

- (void)videoDidPlayToEnd
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15AE74;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)videoPlaybackDidStall
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15AFD8;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)playbackErrorOccured:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_15B10C;
  v5[3] = &unk_251828;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)mediaSelectionDidChange:(id)a3
{
  id v4 = a3;
  if ((*(_WORD *)&self->_delegateFlags & 0x200) != 0)
  {
    id v7 = v4;
    BOOL v5 = [(TUIVideoPlayer *)self captionsEnabled];
    id v4 = v7;
    if (self->_lastCaptionsEnabled != v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained player:self didSetCaptionsEnabled:[self captionsEnabled]];

      id v4 = v7;
      self->_lastCaptionsEnabled = v5;
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (a6 == &off_256780)
  {
    if (v10 && v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = objc_opt_class();
        v15 = TUIDynamicCast(v14, v11);
        [(TUIVideoPlayer *)self handlePlayerItemChange:v13 keyPath:v10 playerItem:v15];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = objc_opt_class();
          v15 = TUIDynamicCast(v16, v11);
          [(TUIVideoPlayer *)self handlePlayerChange:v13 keyPath:v10 player:v15];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_12;
          }
          uint64_t v17 = objc_opt_class();
          v15 = TUIDynamicCast(v17, v11);
          [(TUIVideoPlayer *)self handlePlaybackChecksChange:v13 keyPath:v10 playbackChecks:v15];
        }
      }
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)TUIVideoPlayer;
    [(TUIVideoPlayer *)&v18 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
LABEL_12:
}

- (void)handlePlayerItemChange:(id)a3 keyPath:(id)a4 playerItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (a5)
  {
    if ([v9 isEqualToString:@"status"])
    {
      uint64_t v10 = objc_opt_class();
      id v11 = [v8 objectForKey:NSKeyValueChangeNewKey];
      id v12 = TUIDynamicCast(v10, v11);
      uint64_t v13 = (char *)[v12 integerValue];

      if (v13 == (unsigned char *)&def_141F14 + 1)
      {
        uint64_t v14 = [(TUIVideoPlayer *)self playbackChecks];
        [v14 setItemIsReadyToPlay:1];
LABEL_8:
      }
    }
    else
    {
      if (([v9 isEqualToString:@"playbackBufferFull"] & 1) != 0
        || [v9 isEqualToString:@"playbackLikelyToKeepUp"])
      {
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = [v8 objectForKey:NSKeyValueChangeNewKey];
        uint64_t v17 = TUIDynamicCast(v15, v16);
        id v18 = [v17 BOOLValue];

        uint64_t v14 = [(TUIVideoPlayer *)self playbackChecks];
        [v14 setPlaybackLikelyToKeepUp:v18];
        goto LABEL_8;
      }
      if ([v9 isEqualToString:@"playbackBufferEmpty"])
      {
        uint64_t v19 = objc_opt_class();
        v20 = [v8 objectForKey:NSKeyValueChangeNewKey];
        v21 = TUIDynamicCast(v19, v20);
        unsigned int v22 = [v21 BOOLValue];

        v23 = TUIVideoLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412546;
          v25 = self;
          __int16 v26 = 1024;
          unsigned int v27 = v22;
          _os_log_impl(&def_141F14, v23, OS_LOG_TYPE_DEFAULT, "%@ : Playback buffer is empty: %i", (uint8_t *)&v24, 0x12u);
        }
      }
    }
  }
}

- (void)handlePlayerChange:(id)a3 keyPath:(id)a4 player:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (TUIVideoPlayer *)a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v10 == self)
  {
    if ([v9 isEqualToString:@"rate"])
    {
      uint64_t v11 = objc_opt_class();
      id v12 = [v8 objectForKey:NSKeyValueChangeNewKey];
      uint64_t v13 = TUIDynamicCast(v11, v12);
      [v13 floatValue];
      float v15 = v14;

      TUIVideoLog();
      *(double *)&uint64_t v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v10;
        __int16 v32 = 2048;
        double v33 = v15;
        _os_log_impl(&def_141F14, v16, OS_LOG_TYPE_DEFAULT, "%@ : Did change rate to %f", buf, 0x16u);
      }
      goto LABEL_24;
    }
    if ([v9 isEqualToString:@"timeControlStatus"])
    {
      uint64_t v17 = objc_opt_class();
      id v18 = [v8 objectForKey:NSKeyValueChangeNewKey];
      uint64_t v19 = TUIDynamicCast(v17, v18);
      uint64_t v20 = (int)[v19 intValue];

      [(TUIVideoPlayer *)v10 currentTime];
      v21 = [(TUIVideoPlayer *)v10 currentItem];
      unsigned int v22 = v21;
      if (v21) {
        [v21 duration];
      }
      else {
        memset(&v28, 0, sizeof(v28));
      }
      int32_t v27 = CMTimeCompare(&time1, &v28);

      if (v20 == 2)
      {
        [(TUIVideoPlayer *)v10 setState:4];
        if ((*(_WORD *)&v10->_delegateFlags & 0x20) != 0)
        {
          *(double *)&uint64_t v16 = COERCE_DOUBLE(objc_loadWeakRetained((id *)&v10->_delegate));
          [(TUIVideoPlayer *)v10 currentTimePlayed];
          -[NSObject playerDidPlay:mediaTimePlayed:](v16, "playerDidPlay:mediaTimePlayed:", v10);
          goto LABEL_24;
        }
      }
      else if (!v20 && v10->_state == 4 && v27 < 0)
      {
        [(TUIVideoPlayer *)v10 setState:5];
        v10->_shouldBePlaying = 0;
        if ((*(_WORD *)&v10->_delegateFlags & 0x40) != 0)
        {
          *(double *)&uint64_t v16 = COERCE_DOUBLE(objc_loadWeakRetained((id *)&v10->_delegate));
          [(TUIVideoPlayer *)v10 currentTimePlayed];
          -[NSObject playerDidPause:mediaTimePlayed:](v16, "playerDidPause:mediaTimePlayed:", v10);
LABEL_24:
        }
      }
    }
    else if ([v9 isEqualToString:@"reasonForWaitingToPlay"])
    {
      uint64_t v23 = objc_opt_class();
      int v24 = [v8 objectForKey:NSKeyValueChangeNewKey];
      TUIDynamicCast(v23, v24);
      *(double *)&uint64_t v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

      v25 = [(TUIVideoPlayer *)v10 playbackChecks];
      [v25 setPlayerHasNoWaitingReason:v16 == 0];

      if (*(double *)&v16 != 0.0)
      {
        if ([v16 isEqualToString:AVPlayerWaitingToMinimizeStallsReason]) {
          [(TUIVideoPlayer *)v10 setState:9];
        }
        __int16 v26 = TUIVideoLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v31 = v10;
          __int16 v32 = 2112;
          double v33 = *(double *)&v16;
          _os_log_impl(&def_141F14, v26, OS_LOG_TYPE_DEFAULT, "%@ : Waiting on playback: %@", buf, 0x16u);
        }
      }
      goto LABEL_24;
    }
  }
}

- (void)handlePlaybackChecksChange:(id)a3 keyPath:(id)a4 playbackChecks:(id)a5
{
  id v6 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  unsigned int v7 = [v6 complete];

  if (v7)
  {
    if (self->_state == 1) {
      [(TUIVideoPlayer *)self setState:2];
    }
    if (self->_shouldBePlaying)
    {
      [(TUIVideoPlayer *)self play];
    }
    else
    {
      [(TUIVideoPlayer *)self setState:3];
    }
  }
}

- (id)_stateAsString
{
  if (qword_2DF888 != -1) {
    dispatch_once(&qword_2DF888, &stru_256788);
  }
  objc_super v3 = (void *)qword_2DF880;
  unint64_t state = self->_state;

  return [v3 objectAtIndexedSubscript:state];
}

- (id)_failureAsString
{
  if (qword_2DF898 != -1) {
    dispatch_once(&qword_2DF898, &stru_2567A8);
  }
  objc_super v3 = (void *)qword_2DF890;
  unint64_t failureReason = self->_failureReason;

  return [v3 objectAtIndexedSubscript:failureReason];
}

- (id)_timeControlStatusAsString
{
  if (qword_2DF8A8 != -1) {
    dispatch_once(&qword_2DF8A8, &stru_2567C8);
  }
  objc_super v3 = (void *)qword_2DF8A0;
  id v4 = [(TUIVideoPlayer *)self timeControlStatus];

  return [v3 objectAtIndexedSubscript:v4];
}

- (void)logPlayerStatus
{
  objc_super v3 = [(TUIVideoPlayer *)self _timeControlStatusAsString];
  v21 = +[NSString stringWithFormat:@"timeControlStatus: %@", v3];

  id v4 = [(TUIVideoPlayer *)self reasonForWaitingToPlay];
  BOOL v5 = +[NSString stringWithFormat:@"reasonForWaitingToPlay: %@", v4];

  [(TUIVideoPlayer *)self rate];
  unsigned int v7 = +[NSString stringWithFormat:@"playerRate: %f", v6];
  [(TUIVideoPlayer *)self currentTime];
  id v8 = +[NSString stringWithFormat:@"currentTime: %f", CMTimeGetSeconds(&time)];
  id v9 = [(TUIVideoPlayer *)self playerItem];
  uint64_t v10 = [v9 loadedTimeRanges];
  uint64_t v11 = [v10 description];
  id v12 = +[NSString stringWithFormat:@"loadedTimeRanges: %@", v11];

  uint64_t v13 = [(TUIVideoPlayer *)self playerItem];
  float v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"isPlaybackLikelyToKeepUp: %i", [v13 isPlaybackLikelyToKeepUp]);

  float v15 = [(TUIVideoPlayer *)self playerItem];
  uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"isPlaybackBufferFull: %i", [v15 isPlaybackBufferFull]);

  uint64_t v17 = [(TUIVideoPlayer *)self playerItem];
  id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"isPlaybackBufferEmpty: %i", [v17 isPlaybackBufferEmpty]);

  uint64_t v19 = +[NSString stringWithFormat:@"\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n", v21, v5, v7, v8, v12, v14, v16, v18];
  uint64_t v20 = TUIVideoLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v24 = v19;
    _os_log_impl(&def_141F14, v20, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
}

- (TUIVideoPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUIVideoPlayerDelegate *)WeakRetained;
}

- (BOOL)shouldLoop
{
  return self->_shouldLoop;
}

- (unint64_t)failureReason
{
  return self->_failureReason;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)videoId
{
  return self->_videoId;
}

- (void)setVideoId:(id)a3
{
}

- (NSURL)videoUrl
{
  return self->_videoUrl;
}

- (void)setVideoUrl:(id)a3
{
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (id)timeObserver
{
  return self->_timeObserver;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastPlaybackTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- (NSLock)lastPlaybackTimeLock
{
  return self->_lastPlaybackTimeLock;
}

- (_TUIVideoPlaybackChecks)playbackChecks
{
  return self->_playbackChecks;
}

- (BOOL)shouldBePlaying
{
  return self->_shouldBePlaying;
}

- (void)setShouldBePlaying:(BOOL)a3
{
  self->_shouldBePlaying = a3;
}

- (int64_t)failureCount
{
  return self->_failureCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackChecks, 0);
  objc_storeStrong((id *)&self->_lastPlaybackTimeLock, 0);
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_videoUrl, 0);
  objc_storeStrong((id *)&self->_videoId, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end