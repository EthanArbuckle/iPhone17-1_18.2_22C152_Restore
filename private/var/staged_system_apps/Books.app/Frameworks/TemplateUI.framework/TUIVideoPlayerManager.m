@interface TUIVideoPlayerManager
- (BOOL)activePlayerWasPlayingWhenEnteringBackground;
- (BOOL)captionsEnabledForActivePlayer;
- (BOOL)isInForeground;
- (BOOL)playerWithVideoIdIsPlaying:(id)a3;
- (BOOL)systemAutoPlayEnabled;
- (BOOL)waitingOnPlaybackToBegin;
- (NSMutableDictionary)players;
- (NSMutableSet)observers;
- (TUIVideoPlayerManager)init;
- (_TUISharableVideoPlayer)activeVideoPlayer;
- (unint64_t)stateForPlayerWithVideoId:(id)a3;
- (void)_addAudioSessionObservers;
- (void)_addNotificationObservers;
- (void)_determineSystemAutoPlay;
- (void)_handleDidEnterBackgroundNotification:(id)a3;
- (void)_handlePowerStateDidChange:(id)a3;
- (void)_handleWillEnterForegroundNotification:(id)a3;
- (void)_removeAudioSessionObservers;
- (void)addObserver:(id)a3;
- (void)configureHostWithPlayerForURL:(id)a3 videoId:(id)a4 host:(id)a5 options:(unint64_t)a6;
- (void)dealloc;
- (void)endHostingForVideoId:(id)a3 forHost:(id)a4;
- (void)hostWantsToPausePlayerWithVideoId:(id)a3 requestingHost:(id)a4 isTriggerInitiated:(BOOL)a5;
- (void)hostWantsToPlayVideoWithVideoId:(id)a3 requestingHost:(id)a4 isTriggerInitiated:(BOOL)a5;
- (void)hostWantsToSetPlayerIsWithinVisibleBoundsForPlayerWithVideoId:(id)a3 requestingHost:(id)a4 isWithinVisibleBounds:(BOOL)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)player:(id)a3 didChangeState:(unint64_t)a4;
- (void)player:(id)a3 didPlayToTime:(double)a4;
- (void)player:(id)a3 didSetCaptionsEnabled:(BOOL)a4;
- (void)player:(id)a3 didSetFailureReason:(unint64_t)a4 mediaTimePlayed:(double)a5;
- (void)player:(id)a3 didSetMuted:(BOOL)a4 mediaTimePlayed:(double)a5;
- (void)player:(id)a3 didStallPlaybackAtTime:(double)a4;
- (void)playerDidLoadPlayerItem:(id)a3;
- (void)playerDidPause:(id)a3 mediaTimePlayed:(double)a4;
- (void)playerDidPlay:(id)a3 mediaTimePlayed:(double)a4;
- (void)playerDidPlayToEnd:(id)a3 mediaTimePlayed:(double)a4;
- (void)removeObserver:(id)a3;
- (void)setActiveHostOfPlayerForVideoId:(id)a3 videoUrl:(id)a4 host:(id)a5;
- (void)setActivePlayerWasPlayingWhenEnteringBackground:(BOOL)a3;
- (void)setActiveVideoPlayer:(id)a3;
- (void)setIsInForeground:(BOOL)a3;
- (void)setLoopingStateForPlayerWithVideoId:(id)a3 loop:(BOOL)a4 requestingHost:(id)a5;
- (void)setMuteStateForPlayerWithVideoId:(id)a3 muted:(BOOL)a4 requestingHost:(id)a5 isTriggerInitiated:(BOOL)a6;
- (void)setObservers:(id)a3;
- (void)setPlayers:(id)a3;
- (void)setSystemAutoPlayEnabled:(BOOL)a3;
- (void)setWaitingOnPlaybackToBegin:(BOOL)a3;
@end

@implementation TUIVideoPlayerManager

- (TUIVideoPlayerManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUIVideoPlayerManager;
  v2 = [(TUIVideoPlayerManager *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    players = v2->_players;
    v2->_players = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    observers = v2->_observers;
    v2->_observers = v5;

    v2->_isInForeground = 1;
    v2->_observerAccessLock._os_unfair_lock_opaque = 0;
    [(TUIVideoPlayerManager *)v2 _determineSystemAutoPlay];
    [(TUIVideoPlayerManager *)v2 _addAudioSessionObservers];
    [(TUIVideoPlayerManager *)v2 _addNotificationObservers];
  }
  return v2;
}

- (void)dealloc
{
  [(TUIVideoPlayerManager *)self _removeAudioSessionObservers];
  v3.receiver = self;
  v3.super_class = (Class)TUIVideoPlayerManager;
  [(TUIVideoPlayerManager *)&v3 dealloc];
}

- (void)setSystemAutoPlayEnabled:(BOOL)a3
{
  if (self->_systemAutoPlayEnabled != a3)
  {
    BOOL v3 = a3;
    v5 = TUIVideoLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
      int v18 = 67109378;
      LODWORD(v19[0]) = v3;
      WORD2(v19[0]) = 2112;
      *(void *)((char *)v19 + 6) = WeakRetained;
      _os_log_impl(&def_141F14, v5, OS_LOG_TYPE_DEFAULT, "Setting systemAutoPlayEnabled: %i, activeVideoPlayer: %@", (uint8_t *)&v18, 0x12u);
    }
    self->_systemAutoPlayEnabled = v3;
    p_activeVideoPlayer = &self->_activeVideoPlayer;
    id v8 = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
    v9 = v8;
    if (v8 && self->_systemAutoPlayEnabled)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
      unsigned int v11 = [v10 isWithinVisibleBounds];

      if (v11)
      {
        v12 = TUIVideoLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
          int v18 = 138412290;
          v19[0] = v13;
          _os_log_impl(&def_141F14, v12, OS_LOG_TYPE_DEFAULT, "Playing video from system auto play settings changed: %@", (uint8_t *)&v18, 0xCu);
        }
        id v14 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
        v15 = [v14 player];
        [v15 play];
LABEL_14:

        return;
      }
    }
    else
    {
    }
    v16 = TUIVideoLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
      int v18 = 138412290;
      v19[0] = v17;
      _os_log_impl(&def_141F14, v16, OS_LOG_TYPE_DEFAULT, "Pausing video from system auto play settings changed: %@", (uint8_t *)&v18, 0xCu);
    }
    id v14 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
    v15 = [v14 player];
    [v15 pause];
    goto LABEL_14;
  }
}

- (void)setActiveVideoPlayer:(id)a3
{
  id v4 = a3;
  p_activeVideoPlayer = &self->_activeVideoPlayer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)p_activeVideoPlayer, v4);
    v7 = TUIVideoLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&def_141F14, v7, OS_LOG_TYPE_DEFAULT, "Set active video player: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (BOOL)captionsEnabledForActivePlayer
{
  BOOL v3 = [(TUIVideoPlayerManager *)self activeVideoPlayer];

  if (!v3) {
    return 0;
  }
  id v4 = [(TUIVideoPlayerManager *)self activeVideoPlayer];
  v5 = [v4 player];
  unsigned __int8 v6 = [v5 captionsEnabled];

  return v6;
}

- (void)configureHostWithPlayerForURL:(id)a3 videoId:(id)a4 host:(id)a5 options:(unint64_t)a6
{
  id v28 = a3;
  id v10 = a4;
  id v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v12 = [(NSMutableDictionary *)self->_players objectForKey:v10];
  if (v12)
  {
    id v13 = v12;
    [(_TUISharableVideoPlayer *)v12 incrementHostCount];
  }
  else
  {
    id v13 = [[_TUISharableVideoPlayer alloc] initWithURL:v28 videoId:v10];
    id v14 = [(_TUISharableVideoPlayer *)v13 player];
    [v14 beginLoadingResources];

    [(_TUISharableVideoPlayer *)v13 setTriggerPlaybackEnabled:(a6 >> 1) & 1];
    v15 = [(_TUISharableVideoPlayer *)v13 player];
    [v15 setShouldLoop:a6 & 1];

    v16 = [(_TUISharableVideoPlayer *)v13 player];
    [v16 setMuted:(a6 >> 2) & 1];

    [(NSMutableDictionary *)self->_players setObject:v13 forKey:v10];
  }
  id v17 = [(_TUISharableVideoPlayer *)v13 player];
  int v18 = [v17 videoUrl];
  unsigned __int8 v19 = [v18 isEqual:v28];

  if ((v19 & 1) == 0)
  {
    v20 = [(_TUISharableVideoPlayer *)v13 player];
    [v20 reloadWithNewURL:v28];
  }
  id v21 = [(_TUISharableVideoPlayer *)v13 activeHost];

  if (v21 != v11)
  {
    v22 = [(_TUISharableVideoPlayer *)v13 activeHost];

    if (v22)
    {
      v23 = [(_TUISharableVideoPlayer *)v13 activeHost];
      [v23 willBecomeInactiveHost];
    }
    v24 = [(_TUISharableVideoPlayer *)v13 player];
    [v24 setDelegate:self];

    [(_TUISharableVideoPlayer *)v13 setActiveHost:v11];
    [v11 didBecomeActiveHost];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);

  if (!WeakRetained) {
    [(TUIVideoPlayerManager *)self setActiveVideoPlayer:v13];
  }
  v26 = [(_TUISharableVideoPlayer *)v13 player];
  v27 = [v11 videoViewController];
  [v27 setPlayer:v26];
}

- (void)endHostingForVideoId:(id)a3 forHost:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v7 = [(NSMutableDictionary *)self->_players objectForKey:v11];
  id v8 = v7;
  if (v7)
  {
    [v7 decrementHostCount];
    id v9 = [v8 activeHost];

    if (v9 == v6) {
      [v8 setActiveHost:0];
    }
    if ([v8 shouldRelease])
    {
      id v10 = [v8 player];
      [v10 releaseResources];

      [(NSMutableDictionary *)self->_players removeObjectForKey:v11];
    }
  }
}

- (void)setActiveHostOfPlayerForVideoId:(id)a3 videoUrl:(id)a4 host:(id)a5
{
  id v18 = a4;
  id v8 = a5;
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v10 = [(NSMutableDictionary *)self->_players objectForKey:v9];

  if (v10)
  {
    id v11 = [v10 activeHost];

    if (v11 != v8)
    {
      v12 = [v10 activeHost];

      if (v12)
      {
        id v13 = [v10 activeHost];
        [v13 willBecomeInactiveHost];
      }
      [v10 setActiveHost:v8];
      [v8 didBecomeActiveHost];
      id v14 = [v10 player];
      v15 = [v14 videoUrl];
      unsigned __int8 v16 = [v15 isEqual:v18];

      if ((v16 & 1) == 0)
      {
        id v17 = [v10 player];
        [v17 reloadWithNewURL:v18];
      }
    }
  }
}

- (void)hostWantsToPlayVideoWithVideoId:(id)a3 requestingHost:(id)a4 isTriggerInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v25 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v9 = [(NSMutableDictionary *)self->_players objectForKey:v8];

  BOOL waitingOnPlaybackToBegin = self->_waitingOnPlaybackToBegin;
  if ([v9 triggerPlaybackEnabled]) {
    BOOL v12 = !waitingOnPlaybackToBegin && self->_systemAutoPlayEnabled && v5;
  }
  else {
    BOOL v12 = 0;
  }
  int v13 = !v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
  v15 = [WeakRetained player];
  if ([v15 isPlaying])
  {
    id v16 = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
    unsigned int v17 = v13 | [v16 isWithinVisibleBounds] ^ 1;
  }
  else
  {
    unsigned int v17 = 1;
  }

  if ((v12 | v13) == 1 && v9 && v17)
  {
    id v18 = [v9 activeHost];
    if (v18 != v25)
    {
LABEL_18:

      goto LABEL_24;
    }
    unsigned __int8 v19 = [v9 player];
    if ([v19 isPlaying])
    {

      id v18 = v25;
      goto LABEL_18;
    }
    id v21 = [v9 player];
    v22 = (char *)[v21 state];

    if (v22 != (unsigned char *)&dword_8 + 1)
    {
      v23 = [v9 activeHost];
      [v23 managerAttemptingActionWithOrigin:v5 actionCase:0];

      v24 = [v9 player];
      [v24 play];

      self->_BOOL waitingOnPlaybackToBegin = 1;
    }
  }
  else
  {
    if (v9) {
      char v20 = v17;
    }
    else {
      char v20 = 1;
    }
    if ((v20 & 1) == 0) {
      [v9 setTriggerPlaybackEnabled:0];
    }
  }
LABEL_24:
}

- (void)hostWantsToPausePlayerWithVideoId:(id)a3 requestingHost:(id)a4 isTriggerInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v9 = [(NSMutableDictionary *)self->_players objectForKey:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
  if (v9 == WeakRetained)
  {
    id v11 = [v9 activeHost];
    if (v11 == v16)
    {
      BOOL v12 = [v9 player];
      unsigned int v13 = [v12 isPlaying];

      if (v13)
      {
        id v14 = [v9 activeHost];
        [v14 managerAttemptingActionWithOrigin:v5 actionCase:1];

        v15 = [v9 player];
        [v15 pause];

        [v9 setTriggerPlaybackEnabled:v5];
      }
    }
    else
    {
    }
  }
}

- (void)hostWantsToSetPlayerIsWithinVisibleBoundsForPlayerWithVideoId:(id)a3 requestingHost:(id)a4 isWithinVisibleBounds:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v8 = [(NSMutableDictionary *)self->_players objectForKey:v7];

  if (v8 && [v8 isWithinVisibleBounds] != v5)
  {
    id v9 = TUIVideoLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = [v8 isWithinVisibleBounds];
      id v11 = [v8 player];
      v12[0] = 67109634;
      v12[1] = v10;
      __int16 v13 = 1024;
      BOOL v14 = v5;
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl(&def_141F14, v9, OS_LOG_TYPE_DEFAULT, "Updating isWithinVisibleBounds from %i to %i for %@", (uint8_t *)v12, 0x18u);
    }
    [v8 setIsWithinVisibleBounds:v5];
  }
}

- (void)setLoopingStateForPlayerWithVideoId:(id)a3 loop:(BOOL)a4 requestingHost:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v12 = [(NSMutableDictionary *)self->_players objectForKey:v9];

  id v10 = [v12 activeHost];

  if (v10 == v8)
  {
    id v11 = [v12 player];
    [v11 setShouldLoop:v5];
  }
}

- (void)setMuteStateForPlayerWithVideoId:(id)a3 muted:(BOOL)a4 requestingHost:(id)a5 isTriggerInitiated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v16 = [(NSMutableDictionary *)self->_players objectForKey:v11];

  id v12 = [v16 activeHost];

  if (v12 == v10)
  {
    if (v7) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 3;
    }
    BOOL v14 = [v16 activeHost];
    [v14 managerAttemptingActionWithOrigin:v6 actionCase:v13];

    __int16 v15 = [v16 player];
    [v15 setMuted:v7];
  }
}

- (unint64_t)stateForPlayerWithVideoId:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  BOOL v5 = [(NSMutableDictionary *)self->_players objectForKey:v4];

  if (v5)
  {
    BOOL v6 = [v5 player];
    id v7 = [v6 state];
  }
  else
  {
    id v7 = 0;
  }

  return (unint64_t)v7;
}

- (BOOL)playerWithVideoIdIsPlaying:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  BOOL v5 = [(NSMutableDictionary *)self->_players objectForKey:v4];

  if (v5)
  {
    BOOL v6 = [v5 player];
    unsigned __int8 v7 = [v6 isPlaying];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)addObserver:(id)a3
{
  p_observerAccessLock = &self->_observerAccessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  BOOL v6 = [(TUIVideoPlayerManager *)self observers];
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_observerAccessLock);
}

- (void)removeObserver:(id)a3
{
  p_observerAccessLock = &self->_observerAccessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  BOOL v6 = [(TUIVideoPlayerManager *)self observers];
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_observerAccessLock);
}

- (void)_addAudioSessionObservers
{
  BOOL v3 = +[AVAudioSession sharedInstance];
  if (v3)
  {
    id v4 = v3;
    [v3 addObserver:self forKeyPath:@"outputVolume" options:1 context:&off_255500];
    BOOL v3 = v4;
  }
}

- (void)_removeAudioSessionObservers
{
  BOOL v3 = +[AVAudioSession sharedInstance];
  if (v3)
  {
    id v4 = v3;
    [v3 removeObserver:self forKeyPath:@"outputVolume"];
    BOOL v3 = v4;
  }
}

- (void)_addNotificationObservers
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_handleWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_handleVideoAutoplayStatusDidChange:" name:UIAccessibilityVideoAutoplayStatusDidChangeNotification object:0];

  BOOL v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_handleReduceMotionStatusDidChange:" name:UIAccessibilityReduceMotionStatusDidChangeNotification object:0];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_handlePowerStateDidChange:" name:NSProcessInfoPowerStateDidChangeNotification object:0];
}

- (void)_handleWillEnterForegroundNotification:(id)a3
{
  p_activeVideoPlayer = &self->_activeVideoPlayer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
  if (WeakRetained) {
    BOOL activePlayerWasPlayingWhenEnteringBackground = self->_activePlayerWasPlayingWhenEnteringBackground;
  }
  else {
    BOOL activePlayerWasPlayingWhenEnteringBackground = 0;
  }

  id v7 = TUIVideoLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
    v12[0] = 67109378;
    v12[1] = activePlayerWasPlayingWhenEnteringBackground;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&def_141F14, v7, OS_LOG_TYPE_DEFAULT, "Video did enter foreground, should resume: %i, for player: %@", (uint8_t *)v12, 0x12u);
  }
  if (activePlayerWasPlayingWhenEnteringBackground)
  {
    id v9 = TUIVideoLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&def_141F14, v9, OS_LOG_TYPE_DEFAULT, "Resuming video on foreground", (uint8_t *)v12, 2u);
    }

    id v10 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
    id v11 = [v10 player];
    [v11 play];
  }
  self->_isInForeground = 1;
  [(TUIVideoPlayerManager *)self _determineSystemAutoPlay];
}

- (void)_handleDidEnterBackgroundNotification:(id)a3
{
  p_activeVideoPlayer = &self->_activeVideoPlayer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
    id v7 = [v6 player];
    unsigned int v8 = [v7 isPlaying];
  }
  else
  {
    unsigned int v8 = 0;
  }

  id v9 = TUIVideoLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v8;
    _os_log_impl(&def_141F14, v9, OS_LOG_TYPE_DEFAULT, "Video did enter background, isPlaying: %i", (uint8_t *)v13, 8u);
  }

  self->_BOOL activePlayerWasPlayingWhenEnteringBackground = v8;
  if (v8)
  {
    id v10 = TUIVideoLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&def_141F14, v10, OS_LOG_TYPE_DEFAULT, "Pausing video on background", (uint8_t *)v13, 2u);
    }

    id v11 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
    id v12 = [v11 player];
    [v12 pause];
  }
  self->_isInForeground = 0;
}

- (void)_handlePowerStateDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E9970;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_determineSystemAutoPlay
{
  if (self->_isInForeground)
  {
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    BOOL IsVideoAutoplayEnabled = UIAccessibilityIsVideoAutoplayEnabled();
    id v5 = +[NSProcessInfo processInfo];
    unsigned int v6 = [v5 isLowPowerModeEnabled];

    id v7 = TUIVideoLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109632;
      v9[1] = IsReduceMotionEnabled;
      __int16 v10 = 1024;
      BOOL v11 = IsVideoAutoplayEnabled;
      __int16 v12 = 1024;
      unsigned int v13 = v6;
      _os_log_impl(&def_141F14, v7, OS_LOG_TYPE_DEFAULT, "Setting systemAutoPlay: reducedMotion: %i, videoAutoPlayEnabled: %i, lowPowerModeEnabled: %i", (uint8_t *)v9, 0x14u);
    }

    if (IsReduceMotionEnabled) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = IsVideoAutoplayEnabled & (v6 ^ 1);
    }
    [(TUIVideoPlayerManager *)self setSystemAutoPlayEnabled:v8];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned int v13 = v12;
  if (a6 == &off_255500)
  {
    if (v10 && v12 && [v10 isEqualToString:@"outputVolume"])
    {
      p_activeVideoPlayer = &self->_activeVideoPlayer;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
      id v16 = [WeakRetained player];

      if (v16 && [v16 isPlaying] && objc_msgSend(v16, "isMuted"))
      {
        id v17 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
        id v18 = [v17 activeHost];
        [v18 managerAttemptingActionWithOrigin:0 actionCase:3];

        id v19 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
        char v20 = [v19 player];
        [v20 setMuted:0];
      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)TUIVideoPlayerManager;
    [(TUIVideoPlayerManager *)&v21 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)player:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  players = self->_players;
  id v12 = v6;
  uint64_t v8 = [v6 videoId];
  id v9 = [(NSMutableDictionary *)players objectForKey:v8];

  if (v9)
  {
    id v10 = [v9 activeHost];
    id v11 = [v12 videoId];
    [v10 playerWithVideoId:v11 didChangeState:a4];
  }
}

- (void)playerDidPlayToEnd:(id)a3 mediaTimePlayed:(double)a4
{
  id v6 = a3;
  players = self->_players;
  id v12 = v6;
  uint64_t v8 = [v6 videoId];
  id v9 = [(NSMutableDictionary *)players objectForKey:v8];

  if (v9)
  {
    id v10 = [v9 activeHost];
    id v11 = [v12 videoId];
    [v10 playerWithVideoIdDidPlayToEnd:v11 mediaTimePlayed:a4];
  }
}

- (void)player:(id)a3 didPlayToTime:(double)a4
{
  id v6 = a3;
  players = self->_players;
  id v12 = v6;
  uint64_t v8 = [v6 videoId];
  id v9 = [(NSMutableDictionary *)players objectForKey:v8];

  if (v9)
  {
    id v10 = [v9 activeHost];
    id v11 = [v12 videoId];
    [v10 playerWithVideoId:v11 didPlayToTime:a4];
  }
}

- (void)player:(id)a3 didStallPlaybackAtTime:(double)a4
{
  id v6 = a3;
  players = self->_players;
  id v12 = v6;
  uint64_t v8 = [v6 videoId];
  id v9 = [(NSMutableDictionary *)players objectForKey:v8];

  if (v9)
  {
    id v10 = [v9 activeHost];
    id v11 = [v12 videoId];
    [v10 playerWithVideoId:v11 didStallPlaybackAtTime:a4];
  }
}

- (void)playerDidLoadPlayerItem:(id)a3
{
  id v4 = a3;
  players = self->_players;
  id v10 = v4;
  id v6 = [v4 videoId];
  id v7 = [(NSMutableDictionary *)players objectForKey:v6];

  if (v7)
  {
    uint64_t v8 = [v7 activeHost];
    id v9 = [v10 videoId];
    [v8 playerWithVideoIdDidLoadPlayerItem:v9];
  }
}

- (void)playerDidPlay:(id)a3 mediaTimePlayed:(double)a4
{
  id v6 = a3;
  players = self->_players;
  id v15 = v6;
  uint64_t v8 = [v6 videoId];
  id v9 = [(NSMutableDictionary *)players objectForKey:v8];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);

    if (WeakRetained != v9)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
      id v12 = [v11 player];
      [v12 pause];

      [(TUIVideoPlayerManager *)self setActiveVideoPlayer:v9];
    }
    unsigned int v13 = [v9 activeHost];
    id v14 = [v15 videoId];
    [v13 playerWithVideoIdDidPlay:v14 mediaTimePlayed:a4];
  }
  self->_BOOL waitingOnPlaybackToBegin = 0;
}

- (void)playerDidPause:(id)a3 mediaTimePlayed:(double)a4
{
  id v6 = a3;
  players = self->_players;
  id v12 = v6;
  uint64_t v8 = [v6 videoId];
  id v9 = [(NSMutableDictionary *)players objectForKey:v8];

  if (v9)
  {
    [v9 setTriggerPlaybackEnabled:0];
    id v10 = [v9 activeHost];
    id v11 = [v12 videoId];
    [v10 playerWithVideoIdDidPause:v11 mediaTimePlayed:a4];
  }
}

- (void)player:(id)a3 didSetMuted:(BOOL)a4 mediaTimePlayed:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  players = self->_players;
  id v14 = v8;
  id v10 = [v8 videoId];
  id v11 = [(NSMutableDictionary *)players objectForKey:v10];

  if (v11)
  {
    id v12 = [v11 activeHost];
    unsigned int v13 = [v14 videoId];
    [v12 playerWithVideoId:v13 didSetMuted:v6 mediaTimePlayed:a5];
  }
}

- (void)player:(id)a3 didSetFailureReason:(unint64_t)a4 mediaTimePlayed:(double)a5
{
  id v8 = a3;
  players = self->_players;
  id v14 = v8;
  id v10 = [v8 videoId];
  id v11 = [(NSMutableDictionary *)players objectForKey:v10];

  if (v11)
  {
    id v12 = [v11 activeHost];
    unsigned int v13 = [v14 videoId];
    [v12 playerWithVideoId:v13 didSetFailureReason:a4 mediaTimePlayed:a5];
  }
}

- (void)player:(id)a3 didSetCaptionsEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  p_observerAccessLock = &self->_observerAccessLock;
  os_unfair_lock_lock(&self->_observerAccessLock);
  id v7 = [(TUIVideoPlayerManager *)self observers];
  id v8 = [v7 copy];

  os_unfair_lock_unlock(p_observerAccessLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      unsigned int v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) manager:didSetCaptions:self v4];
        unsigned int v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)isInForeground
{
  return self->_isInForeground;
}

- (void)setIsInForeground:(BOOL)a3
{
  self->_isInForeground = a3;
}

- (NSMutableDictionary)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (_TUISharableVideoPlayer)activeVideoPlayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);

  return (_TUISharableVideoPlayer *)WeakRetained;
}

- (BOOL)systemAutoPlayEnabled
{
  return self->_systemAutoPlayEnabled;
}

- (BOOL)activePlayerWasPlayingWhenEnteringBackground
{
  return self->_activePlayerWasPlayingWhenEnteringBackground;
}

- (void)setActivePlayerWasPlayingWhenEnteringBackground:(BOOL)a3
{
  self->_BOOL activePlayerWasPlayingWhenEnteringBackground = a3;
}

- (BOOL)waitingOnPlaybackToBegin
{
  return self->_waitingOnPlaybackToBegin;
}

- (void)setWaitingOnPlaybackToBegin:(BOOL)a3
{
  self->_BOOL waitingOnPlaybackToBegin = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeVideoPlayer);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_players, 0);
}

@end