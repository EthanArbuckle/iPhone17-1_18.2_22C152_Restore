@interface VUIMediaController
- (AVPlayerViewController)avPlayerViewController;
- (BOOL)_canPause;
- (BOOL)_hasSecondaryView;
- (BOOL)_shouldIgnorePlaybackStop;
- (BOOL)_shouldPausePlaybackDueToDeactivationReasons;
- (BOOL)_shouldShowSecondaryView;
- (BOOL)allowsSkipping;
- (BOOL)clearPreviousImageBeforeLoading;
- (BOOL)didWeCreatePlayer;
- (BOOL)doesDelegateRespondToShowStill;
- (BOOL)doesDelegateRespondToStateChange;
- (BOOL)isAutomaticPlaybackStart;
- (BOOL)isAutomaticPlaybackStop;
- (BOOL)isBackgrounded;
- (BOOL)isFullscreenPlaybackIntent;
- (BOOL)isPlaybackEnabled;
- (BOOL)isPlayerReadyToBePlayed;
- (BOOL)isPostPlayPiPActive;
- (BOOL)isRestoringAVPlayerController;
- (BOOL)observingPictureInPictureActive;
- (BOOL)popWhenPlayerStops;
- (BOOL)shouldAnimateOverlayView;
- (BOOL)shouldPlayAfterAppBecomesActive;
- (BOOL)shouldStopPlayerWhenViewDisappears;
- (BOOL)shouldStopWhenAnotherMediaControllerStarts;
- (BOOL)shouldZoomWhenTransitioningToBackground;
- (BOOL)showsVideoControls;
- (CGRect)_playbackContainerViewFrame:(BOOL)a3 hasSecondaryVideoView:(BOOL)a4;
- (CGRect)_secondaryVideoViewFrame:(BOOL)a3;
- (NSDate)playbackLoadingStartDate;
- (NSString)name;
- (NSString)titleForLogging;
- (NSTimer)pauseStateTimeoutTimer;
- (NSTimer)playbackLoadingTimer;
- (TVPAVFPlayback)player;
- (TVPPlaylist)pendingPlaylist;
- (TVPStateMachine)stateMachine;
- (TVPVideoView)secondaryVideoView;
- (UIViewController)playbackContainerController;
- (VUIImageProxy)currentImageProxy;
- (VUIImageProxy)pendingImageProxy;
- (VUIImageView)proxyImageView;
- (VUIMediaController)init;
- (VUIMediaController)initWithCoder:(id)a3;
- (VUIMediaController)initWithName:(id)a3;
- (VUIMediaController)initWithNibName:(id)a3 bundle:(id)a4;
- (VUIMediaControllerDelegate)delegate;
- (VUIMediaInfo)mediaInfo;
- (double)imageAnimationDuration;
- (double)imageTransitionInterval;
- (double)overlayViewDisplayDuration;
- (id)coverImage;
- (id)preferredFocusEnvironments;
- (int64_t)playbackStopReason;
- (int64_t)state;
- (unint64_t)deactivationReasons;
- (unint64_t)imageAnimationOptions;
- (unint64_t)vpafPlaybackStartReason;
- (unint64_t)vpafPlaybackStopReason;
- (void)_addContentViewIfNeeded;
- (void)_addOverlayViewAnimatedIfNeeded:(BOOL)a3 dismissAfter:(double)a4;
- (void)_addPlaybackViewControllerForPlayback:(BOOL)a3;
- (void)_addProxyImageView;
- (void)_applicationDidRemoveDeactivationReason:(id)a3;
- (void)_applicationWillAddDeactivationReason:(id)a3;
- (void)_cleanUpEverything;
- (void)_cleanUpEverythingPlaybackRelated;
- (void)_delayLoadImage:(id)a3;
- (void)_handleApplicationDidBecomeActiveNotification:(id)a3;
- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3;
- (void)_handleApplicationWillResignActiveNotification:(id)a3;
- (void)_handlePlaybackErrorNotification:(id)a3;
- (void)_mediaControllerStartedPlayback:(id)a3;
- (void)_playbackStateChanged:(id)a3;
- (void)_registerForApplicationStateNotifications;
- (void)_registerPlayerNotifications;
- (void)_registerStateMachineHandlers;
- (void)_removeOverlayView:(id)a3 animated:(BOOL)a4;
- (void)_removePlaybackViewController;
- (void)_removeProxyImageView;
- (void)_setImageProxies:(id)a3;
- (void)_setPlaylist:(id)a3;
- (void)_stateDidChangeFromState:(id)a3 toState:(id)a4 onEvent:(id)a5 context:(id)a6 userInfo:(id)a7;
- (void)_swapActiveMedia:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_unregisterPlayerNotifications;
- (void)_updateAVPlayerViewControllerWithAVPlayerForPlayer:(id)a3;
- (void)_updateCurrentPlaybackViewFrameForPlaybackInBackground:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateMediaInfo;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)setAllowsSkipping:(BOOL)a3;
- (void)setAutomaticPlaybackStart:(BOOL)a3;
- (void)setAutomaticPlaybackStop:(BOOL)a3;
- (void)setAvPlayerViewController:(id)a3;
- (void)setClearPreviousImageBeforeLoading:(BOOL)a3;
- (void)setCurrentImageProxy:(id)a3;
- (void)setDeactivationReasons:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDidWeCreatePlayer:(BOOL)a3;
- (void)setDoesDelegateRespondToShowStill:(BOOL)a3;
- (void)setDoesDelegateRespondToStateChange:(BOOL)a3;
- (void)setImageAnimationDuration:(double)a3;
- (void)setImageAnimationOptions:(unint64_t)a3;
- (void)setImageTransitionInterval:(double)a3;
- (void)setMediaInfo:(id)a3;
- (void)setObservingPictureInPictureActive:(BOOL)a3;
- (void)setOverlayViewDisplayDuration:(double)a3;
- (void)setPauseStateTimeoutTimer:(id)a3;
- (void)setPendingImageProxy:(id)a3;
- (void)setPendingPlaylist:(id)a3;
- (void)setPlaybackContainerController:(id)a3;
- (void)setPlaybackEnabled:(BOOL)a3;
- (void)setPlaybackLoadingStartDate:(id)a3;
- (void)setPlaybackLoadingTimer:(id)a3;
- (void)setPlaybackStopReason:(int64_t)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerReadyToBePlayed:(BOOL)a3;
- (void)setPopWhenPlayerStops:(BOOL)a3;
- (void)setProxyImageView:(id)a3;
- (void)setRestoringAVPlayerController:(BOOL)a3;
- (void)setSecondaryVideoView:(id)a3;
- (void)setShouldAnimateOverlayView:(BOOL)a3;
- (void)setShouldPlayAfterAppBecomesActive:(BOOL)a3;
- (void)setShouldZoomWhenTransitioningToBackground:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setStateMachine:(id)a3;
- (void)setStopPlayerWhenViewDisappears:(BOOL)a3;
- (void)setStopWhenAnotherMediaControllerStarts:(BOOL)a3;
- (void)setTitleForLogging:(id)a3;
- (void)setVpafPlaybackStartReason:(unint64_t)a3;
- (void)setVpafPlaybackStopReason:(unint64_t)a3;
- (void)stop;
- (void)transitionToForeground:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VUIMediaController

- (VUIMediaController)init
{
  return [(VUIMediaController *)self initWithName:@"generic media controller"];
}

- (VUIMediaController)initWithCoder:(id)a3
{
  return [(VUIMediaController *)self initWithName:@"generic media controller"];
}

- (VUIMediaController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(VUIMediaController *)self initWithName:@"generic media controller", a4];
}

- (VUIMediaController)initWithName:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)VUIMediaController;
  v5 = [(VUIMediaController *)&v24 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    v5->_playerReadyToBePlayed = 0;
    v5->_shouldAnimateOverlayView = 1;
    v5->_shouldZoomWhenTransitioningToBackground = 1;
    v5->_automaticPlaybackStart = 0;
    v5->_automaticPlaybackStop = 0;
    v5->_playbackEnabled = 1;
    v5->_stopPlayerWhenViewDisappears = 1;
    v5->_shouldPlayAfterAppBecomesActive = 0;
    v5->_clearPreviousImageBeforeLoading = 1;
    v5->_popWhenPlayerStops = 0;
    v5->_restoringAVPlayerController = 0;
    v5->_stopWhenAnotherMediaControllerStarts = 1;
    v5->_imageTransitionInterval = 5.0;
    v5->_imageAnimationDuration = 0.5;
    v5->_overlayViewDisplayDuration = 10.0;
    v5->_imageAnimationOptions = 5243008;
    v5->_playbackStopReason = 2;
    v5->_state = 0;
    v7 = (VUIImageView *)objc_alloc_init(MEMORY[0x1E4FB3CE0]);
    proxyImageView = v6->_proxyImageView;
    v6->_proxyImageView = v7;

    [(VUIMediaController *)v6 _registerForApplicationStateNotifications];
    objc_initWeak(&location, v6);
    uint64_t v9 = initWithName__instanceNumber++;
    uint64_t v10 = [NSString stringWithFormat:@"%@(%ld)", v4, v9];
    name = v6->_name;
    v6->_name = (NSString *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4FA9DA8]);
    v13 = v6->_name;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __35__VUIMediaController_initWithName___block_invoke;
    v21[3] = &unk_1E6DF6220;
    objc_copyWeak(&v22, &location);
    uint64_t v14 = [v12 initWithName:v13 initialState:@"Not doing anything" mode:0 stateChangeHandler:v21];
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = (TVPStateMachine *)v14;

    v16 = v6->_stateMachine;
    v17 = VUIDefaultLogObject();
    [(TVPStateMachine *)v16 setLogObject:v17];

    [(TVPStateMachine *)v6->_stateMachine setCallsStateChangeHandlerSynchronously:1];
    [(VUIMediaController *)v6 _registerStateMachineHandlers];
    [(TVPStateMachine *)v6->_stateMachine setShouldAcceptEvents:1];
    v18 = VUIDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v6->_name;
      *(_DWORD *)buf = 138412546;
      v26 = v6;
      __int16 v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "VUIMediaController::finished creating media controller %@ (%@)", buf, 0x16u);
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __35__VUIMediaController_initWithName___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  v11 = (id *)(a1 + 32);
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id WeakRetained = objc_loadWeakRetained(v11);
  [WeakRetained _stateDidChangeFromState:v16 toState:v15 onEvent:v14 context:v13 userInfo:v12];
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(VUIMediaController *)self _cleanUpEverything];
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(VUIMediaController *)self name];
    *(_DWORD *)buf = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIMediaController::finished cleaning up %@ (%@)", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)VUIMediaController;
  [(VUIMediaController *)&v6 dealloc];
}

- (BOOL)isPostPlayPiPActive
{
  return 0;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)VUIMediaController;
  [(VUIMediaController *)&v3 viewDidLoad];
  [(VUIMediaController *)self _addProxyImageView];
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VUIMediaController;
  [(VUIMediaController *)&v11 viewWillDisappear:a3];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  if ([(VUIMediaController *)self shouldStopPlayerWhenViewDisappears])
  {
    uint64_t v4 = [(VUIMediaController *)self player];
    if (!v4) {
      goto LABEL_7;
    }
    v5 = (void *)v4;
    objc_super v6 = [(VUIMediaController *)self player];
    v7 = [v6 state];
    v8 = [MEMORY[0x1E4FA9D88] stopped];

    if (v7 == v8)
    {
LABEL_7:
      [(VUIMediaController *)self setPlaybackEnabled:0];
    }
    else
    {
      __int16 v9 = VUIDefaultLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [(VUIMediaController *)self name];
        *(_DWORD *)buf = 136315650;
        id v13 = "-[VUIMediaController viewWillDisappear:]";
        __int16 v14 = 2048;
        id v15 = self;
        __int16 v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIMediaController::%s will stop media controller (%p: %@)", buf, 0x20u);
      }
      [(VUIMediaController *)self stop];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)__PlayerAVPlayerKVOContext == a6)
  {
    [(VUIMediaController *)self _updateAVPlayerViewControllerWithAVPlayerForPlayer:a4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VUIMediaController;
    -[VUIMediaController observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setMediaInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    -[VUIMediaController setAutomaticPlaybackStart:](self, "setAutomaticPlaybackStart:", [v4 isAutomaticPlaybackStart]);
    -[VUIMediaController setVpafPlaybackStartReason:](self, "setVpafPlaybackStartReason:", [v10 playbackStartReason]);
    if ([v10 playbackStartReason] == 3)
    {
      -[VUIMediaController setAutomaticPlaybackStop:](self, "setAutomaticPlaybackStop:", [v10 isAutomaticPlaybackStop]);
      -[VUIMediaController setVpafPlaybackStopReason:](self, "setVpafPlaybackStopReason:", [v10 playbackStopReason]);
    }
    if (-[VUIMediaInfo intent](self->_mediaInfo, "intent") == 1 && ![v10 intent])
    {
      mediaInfo = self->_mediaInfo;
      v8 = [v10 imageProxies];
      [(VUIMediaInfo *)mediaInfo setImageProxies:v8];

      __int16 v9 = [v10 imageProxies];
      [(VUIMediaController *)self _setImageProxies:v9];
    }
    else
    {
      v5 = (VUIMediaInfo *)[v10 copy];
      objc_super v6 = self->_mediaInfo;
      self->_mediaInfo = v5;

      [(VUIMediaController *)self _updateMediaInfo];
    }
    id v4 = v10;
  }
}

- (void)play
{
  id v2 = [(VUIMediaController *)self stateMachine];
  [v2 postEvent:@"Play"];
}

- (void)pause
{
  id v2 = [(VUIMediaController *)self stateMachine];
  [v2 postEvent:@"Pause"];
}

- (void)stop
{
  id v2 = [(VUIMediaController *)self stateMachine];
  [v2 postEvent:@"Stop"];
}

- (id)preferredFocusEnvironments
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUIMediaController *)self avPlayerViewController];
  id v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VUIMediaController;
    uint64_t v5 = [(VUIMediaController *)&v8 preferredFocusEnvironments];
  }
  objc_super v6 = (void *)v5;

  return v6;
}

- (id)coverImage
{
  return 0;
}

- (BOOL)showsVideoControls
{
  return 1;
}

- (void)transitionToForeground:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  objc_super v6 = [(VUIMediaController *)self stateMachine];
  if (v5) {
    v7 = @"Transition to foreground";
  }
  else {
    v7 = @"Transition background";
  }
  id v10 = @"AnimatedKey";
  objc_super v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  v11[0] = v8;
  __int16 v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v6 postEvent:v7 withContext:0 userInfo:v9];
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    id v4 = [(VUIMediaController *)self delegate];
    if ([(VUIMediaController *)self doesDelegateRespondToStateChange]) {
      [v4 stateDidChangeForMediaController:self];
    }
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(VUIMediaController *)self setDoesDelegateRespondToStateChange:objc_opt_respondsToSelector() & 1];
    [(VUIMediaController *)self setDoesDelegateRespondToShowStill:objc_opt_respondsToSelector() & 1];
  }
}

- (void)setPlaybackEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  self->_playbackEnabled = a3;
  BOOL v5 = [(VUIMediaController *)self player];

  if (!v5)
  {
    if (!v3)
    {
      objc_super v6 = [(VUIMediaController *)self playbackLoadingTimer];
      if (v6)
      {
        id v14 = v6;
        [v6 invalidate];
        [(VUIMediaController *)self setPlaybackLoadingTimer:0];
        [(VUIMediaController *)self setPlaybackLoadingStartDate:0];
        objc_super v6 = v14;
      }
      goto LABEL_15;
    }
    v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIMediaController::playback is enabled but we don't have a player, start reloading.", buf, 2u);
    }

    objc_super v8 = [(VUIMediaController *)self stateMachine];
    [v8 postEvent:@"Replay"];
LABEL_20:

    return;
  }
  if (v3)
  {
    if ([(VUIMediaController *)self isPlayerReadyToBePlayed])
    {
      id v13 = [(VUIMediaController *)self stateMachine];
      [v13 postEvent:@"Show playback" withContext:0 userInfo:0];
      objc_super v6 = v13;
LABEL_15:

      return;
    }
    objc_super v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIMediaController::player is not ready to play; will start playback when it's ready.",
        buf,
        2u);
    }
    goto LABEL_20;
  }
  __int16 v9 = [(VUIMediaController *)self player];
  id v10 = [v9 state];
  objc_super v11 = [MEMORY[0x1E4FA9D88] stopped];

  if (v10 != v11)
  {
    id v12 = VUIDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v16 = self;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "VUIMediaController::stopping player for media controller: [%@]", buf, 0xCu);
    }

    [(VUIMediaController *)self stop];
  }
}

- (void)setShouldZoomWhenTransitioningToBackground:(BOOL)a3
{
  self->_shouldZoomWhenTransitioningToBackground = a3;
  if (a3)
  {
    id v4 = [(VUIMediaController *)self avPlayerViewController];

    if (v4)
    {
      BOOL v5 = [(VUIMediaController *)self isBackgrounded];
      [(VUIMediaController *)self _updateCurrentPlaybackViewFrameForPlaybackInBackground:v5 animated:1];
    }
  }
}

- (void)_registerForApplicationStateNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleApplicationWillResignActiveNotification_ name:*MEMORY[0x1E4FB2738] object:0];
  [v3 addObserver:self selector:sel__handleApplicationDidEnterBackgroundNotification_ name:*MEMORY[0x1E4FB2640] object:0];
  [v3 addObserver:self selector:sel__handleApplicationDidBecomeActiveNotification_ name:*MEMORY[0x1E4FB2628] object:0];
  [v3 addObserver:self selector:sel__applicationWillAddDeactivationReason_ name:*MEMORY[0x1E4FB31A0] object:0];
  [v3 addObserver:self selector:sel__applicationDidRemoveDeactivationReason_ name:*MEMORY[0x1E4FB3160] object:0];
}

- (void)_handleApplicationWillResignActiveNotification:(id)a3
{
  uint64_t v4 = [(VUIMediaController *)self player];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    objc_super v6 = [(VUIMediaController *)self player];
    v7 = [v6 state];
    uint64_t v8 = [MEMORY[0x1E4FA9D88] playing];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      __int16 v9 = (void *)v8;
      id v10 = [(VUIMediaController *)self player];
      objc_super v11 = [v10 state];
      id v12 = [MEMORY[0x1E4FA9D88] loading];

      if (v11 != v12) {
        return;
      }
    }
    if ([(VUIMediaController *)self _shouldPausePlaybackDueToDeactivationReasons])
    {
      [(VUIMediaController *)self setShouldPlayAfterAppBecomesActive:1];
      [(VUIMediaController *)self pause];
    }
  }
}

- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3
{
  uint64_t v4 = [(VUIMediaController *)self player];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    objc_super v6 = [(VUIMediaController *)self mediaInfo];
    uint64_t v7 = [v6 intent];

    if (!v7)
    {
      [(VUIMediaController *)self setShouldPlayAfterAppBecomesActive:0];
      [(VUIMediaController *)self stop];
    }
  }
}

- (void)_handleApplicationDidBecomeActiveNotification:(id)a3
{
  uint64_t v4 = [(VUIMediaController *)self player];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    BOOL v6 = [(VUIMediaController *)self shouldPlayAfterAppBecomesActive];

    if (v6)
    {
      [(VUIMediaController *)self setShouldPlayAfterAppBecomesActive:0];
      [(VUIMediaController *)self play];
    }
  }
}

- (BOOL)_shouldPausePlaybackDueToDeactivationReasons
{
  return ([(VUIMediaController *)self deactivationReasons] & 0xFFFFEDEB) != 0;
}

- (void)_applicationWillAddDeactivationReason:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB3158]];
  char v6 = [v5 integerValue];

  self->_deactivationReasons |= (1 << v6);
}

- (void)_applicationDidRemoveDeactivationReason:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB3158]];
  char v6 = [v5 integerValue];

  self->_deactivationReasons &= ~(1 << v6);
}

- (void)_registerPlayerNotifications
{
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4FAA3C0];
  uint64_t v4 = [(VUIMediaController *)self player];
  [v7 addObserver:self selector:sel__playbackStateChanged_ name:v3 object:v4];

  uint64_t v5 = *MEMORY[0x1E4FAA268];
  char v6 = [(VUIMediaController *)self player];
  [v7 addObserver:self selector:sel__handlePlaybackErrorNotification_ name:v5 object:v6];

  [v7 addObserver:self selector:sel__mediaControllerStartedPlayback_ name:@"VUIMediaControllerWillStartPlaybackNotification" object:0];
  [v7 addObserver:self selector:sel__mediaControllerStartedPlayback_ name:@"VUIMediaControllerDidStartPlaybackNotification" object:0];
}

- (void)_unregisterPlayerNotifications
{
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4FAA3C0];
  uint64_t v4 = [(VUIMediaController *)self player];
  [v9 removeObserver:self name:v3 object:v4];

  uint64_t v5 = *MEMORY[0x1E4FAA268];
  char v6 = [(VUIMediaController *)self player];
  [v9 removeObserver:self name:v5 object:v6];

  [v9 removeObserver:self name:@"VUIMediaControllerWillStartPlaybackNotification" object:0];
  [v9 removeObserver:self name:@"VUIMediaControllerDidStartPlaybackNotification" object:0];
  uint64_t v7 = *MEMORY[0x1E4FAA258];
  uint64_t v8 = [(VUIMediaController *)self player];
  [v9 removeObserver:self name:v7 object:v8];
}

- (BOOL)_canPause
{
  id v2 = [(VUIMediaController *)self player];
  [v2 duration];
  BOOL v4 = v3 != *MEMORY[0x1E4FA9DC0];

  return v4;
}

- (void)_updateMediaInfo
{
  double v3 = [(VUIMediaController *)self mediaInfo];

  if (!v3) {
    return;
  }
  [(VUIMediaController *)self overlayViewDisplayDuration];
  -[VUIMediaController _addOverlayViewAnimatedIfNeeded:dismissAfter:](self, "_addOverlayViewAnimatedIfNeeded:dismissAfter:", 0);
  [(VUIMediaController *)self _addContentViewIfNeeded];
  BOOL v4 = [(VUIMediaController *)self mediaInfo];
  id v25 = [v4 tvpPlaylist];

  uint64_t v5 = [v25 currentMediaItem];
  char v6 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];

  if ([v6 length])
  {
    uint64_t v7 = [NSString stringWithFormat:@"(%@)", v6];
    uint64_t v8 = [(VUIMediaController *)self titleForLogging];
    if ([v8 length])
    {
      id v9 = [(VUIMediaController *)self name];
      uint64_t v10 = [v9 rangeOfString:v8];
      uint64_t v12 = v11;

      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v13 = [(VUIMediaController *)self name];
        objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", v10, v12, &stru_1F3E921E0);
        id v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        name = self->_name;
        self->_name = v14;
      }
    }
    [(VUIMediaController *)self setTitleForLogging:v7];
    __int16 v16 = [(NSString *)self->_name stringByAppendingString:v7];
    uint64_t v17 = self->_name;
    self->_name = v16;
  }
  if (![(VUIMediaController *)self isRestoringAVPlayerController])
  {
    v19 = [(VUIMediaController *)self player];
    uint64_t v18 = [v19 playlist];

    int v20 = 0;
    if (v18 && v25) {
      int v20 = [v18 isEqualToPlaylist:v25];
    }
    v21 = [(VUIMediaController *)self mediaInfo];
    id v22 = [v21 imageProxies];

    if (!v20)
    {
      [(VUIMediaController *)self setPlayerReadyToBePlayed:0];
      v23 = [(VUIMediaController *)self mediaInfo];
      uint64_t v24 = [v23 intent];

      if (v24 != 1)
      {
        [(VUIMediaController *)self _setImageProxies:v22];
        [(VUIMediaController *)self _setPlaylist:v25];
        goto LABEL_18;
      }
      [(VUIMediaController *)self _setPlaylist:v25];
    }
    [(VUIMediaController *)self _setImageProxies:v22];
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v18 = [(VUIMediaController *)self stateMachine];
  [v18 postEvent:@"Restore avPlayerViewController"];
LABEL_19:
}

- (void)_setImageProxies:(id)a3
{
  id v20 = [a3 firstObject];
  if (v20)
  {
    BOOL v4 = [(VUIMediaController *)self currentImageProxy];
    char v5 = [v4 isEqual:v20];

    if ((v5 & 1) == 0)
    {
      char v6 = [MEMORY[0x1E4F1CA60] dictionary];
      int v7 = [v20 loadSynchronouslyIfCached];
      if ([(VUIMediaController *)self clearPreviousImageBeforeLoading]
        && ([(VUIMediaController *)self mediaInfo],
            uint64_t v8 = objc_claimAutoreleasedReturnValue(),
            char v9 = [v8 shouldDelayLoadingImage],
            v8,
            (v9 & 1) == 0))
      {
        uint64_t v10 = v7 ^ 1u;
        id v13 = [(VUIMediaController *)self proxyImageView];
        [v13 setImage:0];

        id v14 = [(VUIMediaController *)self proxyImageView];
        [v14 setImageProxy:0];
      }
      else
      {
        uint64_t v10 = 1;
      }
      [v6 setObject:v20 forKeyedSubscript:@"ImageProxyKey"];
      id v15 = [MEMORY[0x1E4F28ED0] numberWithBool:v10];
      [v6 setObject:v15 forKeyedSubscript:@"AnimatedKey"];

      __int16 v16 = [(VUIMediaController *)self view];
      uint64_t v17 = [(VUIMediaController *)self mediaInfo];
      uint64_t v18 = [v17 backgroundColor];
      [v16 setBackgroundColor:v18];

      v19 = [(VUIMediaController *)self stateMachine];
      [v19 postEvent:@"Set image" withContext:0 userInfo:v6];
    }
  }
  else
  {
    uint64_t v11 = [(VUIMediaController *)self proxyImageView];
    [v11 setImage:0];

    uint64_t v12 = [(VUIMediaController *)self proxyImageView];
    [v12 setImageProxy:0];

    [(VUIMediaController *)self setCurrentImageProxy:0];
  }
}

- (void)_setPlaylist:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(VUIMediaController *)self setPlayerReadyToBePlayed:0];
    [(VUIMediaController *)self setPendingPlaylist:0];
    char v5 = [(VUIMediaController *)self stateMachine];
    int v7 = @"PlaylistKey";
    v8[0] = v4;
    char v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v5 postEvent:@"Set playlist" withContext:0 userInfo:v6];
  }
  else
  {
    char v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[VUIMediaController _setPlaylist:](v5);
    }
  }
}

- (void)_cleanUpEverything
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(VUIMediaController *)self name];
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIMediaController::cleaning up everything for %@", (uint8_t *)&v7, 0xCu);
  }
  char v5 = [(VUIMediaController *)self proxyImageView];
  [v5 setImage:0];

  char v6 = [(VUIMediaController *)self proxyImageView];
  [v6 setImageProxy:0];

  [(VUIMediaController *)self setCurrentImageProxy:0];
  [(VUIMediaController *)self _cleanUpEverythingPlaybackRelated];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
}

- (void)_cleanUpEverythingPlaybackRelated
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(VUIMediaController *)self name];
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIMediaController::cleaning up player and playback view controller for %@", (uint8_t *)&v13, 0xCu);
  }
  char v5 = [(VUIMediaController *)self playbackLoadingTimer];
  [v5 invalidate];

  [(VUIMediaController *)self setPlaybackLoadingTimer:0];
  [(VUIMediaController *)self setPendingPlaylist:0];
  [(VUIMediaController *)self _unregisterPlayerNotifications];
  [(VUIMediaController *)self _removePlaybackViewController];
  uint64_t v6 = [(VUIMediaController *)self secondaryVideoView];
  if (v6)
  {
    int v7 = (void *)v6;
    uint64_t v8 = [(VUIMediaController *)self secondaryVideoView];
    uint64_t v9 = [v8 superview];

    if (v9)
    {
      uint64_t v10 = [(VUIMediaController *)self secondaryVideoView];
      [v10 removeFromSuperview];
    }
  }
  [(VUIMediaController *)self setSecondaryVideoView:0];
  [(VUIMediaController *)self setAvPlayerViewController:0];
  [(VUIMediaController *)self setPlaybackContainerController:0];
  if ([(VUIMediaController *)self didWeCreatePlayer])
  {
    uint64_t v11 = [(VUIMediaController *)self player];
    [v11 removeObserver:self forKeyPath:@"avPlayer"];

    uint64_t v12 = [(VUIMediaController *)self player];
    [v12 invalidate];
  }
  [(VUIMediaController *)self setPlayer:0];
}

- (void)_addOverlayViewAnimatedIfNeeded:(BOOL)a3 dismissAfter:(double)a4
{
  BOOL v5 = a3;
  int v7 = [(VUIMediaController *)self mediaInfo];
  uint64_t v8 = [v7 overlayView];

  if (v8)
  {
    uint64_t v9 = [v8 superview];

    if (!v9)
    {
      [v8 alpha];
      double v11 = v10;
      [v8 setAlpha:0.0];
      uint64_t v12 = [(VUIMediaController *)self view];
      [v12 addSubview:v8];

      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke;
      aBlock[3] = &unk_1E6DF6248;
      v23[1] = *(id *)&a4;
      objc_copyWeak(v23, &location);
      id v13 = v8;
      id v22 = v13;
      BOOL v24 = v5;
      id v14 = (void (**)(void))_Block_copy(aBlock);
      if (v5)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4FB1EB0];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_3;
        v18[3] = &unk_1E6DF6270;
        id v19 = v13;
        double v20 = v11;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_4;
        v16[3] = &unk_1E6DF3D80;
        uint64_t v17 = v14;
        [v15 animateWithDuration:5243008 delay:v18 options:v16 animations:0.75 completion:0.0];
      }
      else
      {
        [v13 setAlpha:v11];
        v14[2](v14);
      }

      objc_destroyWeak(v23);
      objc_destroyWeak(&location);
    }
  }
}

void __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 48);
  if (v1 != 0.0)
  {
    double v3 = (void *)MEMORY[0x1E4F1CB00];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_2;
    v5[3] = &unk_1E6DF5C70;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    id v6 = *(id *)(a1 + 32);
    char v8 = *(unsigned char *)(a1 + 56);
    id v4 = (id)[v3 scheduledTimerWithTimeInterval:0 repeats:v5 block:v1];

    objc_destroyWeak(&v7);
  }
}

void __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeOverlayView:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_removeOverlayView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    [v5 setAlpha:1.0];
    if (v4)
    {
      id v7 = (void *)MEMORY[0x1E4FB1EB0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __50__VUIMediaController__removeOverlayView_animated___block_invoke;
      v10[3] = &unk_1E6DF3D58;
      id v11 = v6;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = __50__VUIMediaController__removeOverlayView_animated___block_invoke_2;
      v8[3] = &unk_1E6DF5B20;
      id v9 = v11;
      [v7 animateWithDuration:5243008 delay:v10 options:v8 animations:0.75 completion:0.0];
    }
    else
    {
      [v6 setAlpha:0.0];
      [v6 removeFromSuperview];
    }
  }
}

uint64_t __50__VUIMediaController__removeOverlayView_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __50__VUIMediaController__removeOverlayView_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_swapActiveMedia:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke;
  aBlock[3] = &unk_1E6DF5330;
  objc_copyWeak(&v23, &location);
  BOOL v24 = a3;
  id v9 = _Block_copy(aBlock);
  double v10 = v9;
  id v11 = (void *)MEMORY[0x1E4FB1EB0];
  if (v5)
  {
    uint64_t v12 = [(VUIMediaController *)self view];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke_178;
    v20[3] = &unk_1E6DF3DD0;
    id v21 = v10;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke_2;
    v18[3] = &unk_1E6DF3D80;
    id v19 = v8;
    [v11 transitionWithView:v12 duration:5242880 options:v20 animations:v18 completion:0.5];
    id v13 = &v21;
    id v14 = &v19;
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke_3;
    v15[3] = &unk_1E6DF6298;
    id v16 = v9;
    id v17 = v8;
    [v11 performWithoutAnimation:v15];
    id v13 = &v16;
    id v14 = &v17;
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = *(unsigned __int8 *)(a1 + 40);
  BOOL v4 = VUIDefaultLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = [WeakRetained name];
      int v19 = 134218242;
      id v20 = WeakRetained;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIMediaController::(%p: %@) showing background image now.", (uint8_t *)&v19, 0x16u);
    }
    id v7 = [WeakRetained proxyImageView];
    [v7 setHidden:0];

    id v8 = [WeakRetained playbackContainerController];
    id v9 = [v8 view];
    [v9 setHidden:1];

    double v10 = [WeakRetained mediaInfo];
    LODWORD(v9) = [v10 showsSecondaryVideoView];

    if (v9)
    {
      id v11 = [WeakRetained secondaryVideoView];
      uint64_t v12 = v11;
      uint64_t v13 = 1;
LABEL_10:
      [v11 setHidden:v13];
    }
  }
  else
  {
    if (v5)
    {
      id v14 = [WeakRetained name];
      int v19 = 134218242;
      id v20 = WeakRetained;
      __int16 v21 = 2112;
      id v22 = v14;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIMediaController::(%p: %@) showing playback view now.", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v15 = [WeakRetained proxyImageView];
    [v15 setHidden:1];

    id v16 = [WeakRetained playbackContainerController];
    id v17 = [v16 view];
    [v17 setHidden:0];

    uint64_t v18 = [WeakRetained mediaInfo];
    LODWORD(v17) = [v18 showsSecondaryVideoView];

    if (v17)
    {
      id v11 = [WeakRetained secondaryVideoView];
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      goto LABEL_10;
    }
  }
}

uint64_t __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke_178(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_addContentViewIfNeeded
{
  int v3 = [(VUIMediaController *)self mediaInfo];
  id v21 = [v3 contentView];

  if (v21)
  {
    BOOL v4 = [(VUIMediaController *)self view];
    [v4 insertSubview:v21 atIndex:0];

    BOOL v5 = [v21 leadingAnchor];
    id v6 = [(VUIMediaController *)self view];
    id v7 = [v6 leadingAnchor];
    id v8 = [v5 constraintEqualToAnchor:v7];
    [v8 setActive:1];

    id v9 = [v21 trailingAnchor];
    double v10 = [(VUIMediaController *)self view];
    id v11 = [v10 trailingAnchor];
    uint64_t v12 = [v9 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    uint64_t v13 = [v21 topAnchor];
    id v14 = [(VUIMediaController *)self view];
    uint64_t v15 = [v14 topAnchor];
    id v16 = [v13 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    id v17 = [v21 bottomAnchor];
    uint64_t v18 = [(VUIMediaController *)self view];
    int v19 = [v18 bottomAnchor];
    id v20 = [v17 constraintEqualToAnchor:v19];
    [v20 setActive:1];
  }
}

- (void)_addProxyImageView
{
  id v24 = [(VUIMediaController *)self proxyImageView];
  if (v24)
  {
    int v3 = [(VUIMediaController *)self view];
    [v3 bounds];
    objc_msgSend(v24, "setFrame:");

    BOOL v4 = [(VUIMediaController *)self mediaInfo];
    BOOL v5 = [v4 overlayView];

    id v6 = [(VUIMediaController *)self view];
    id v7 = v6;
    if (v5) {
      [v6 insertSubview:v24 belowSubview:v5];
    }
    else {
      [v6 addSubview:v24];
    }

    [v24 setHidden:1];
    id v8 = [v24 leadingAnchor];
    id v9 = [(VUIMediaController *)self view];
    double v10 = [v9 leadingAnchor];
    id v11 = [v8 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    uint64_t v12 = [v24 trailingAnchor];
    uint64_t v13 = [(VUIMediaController *)self view];
    id v14 = [v13 trailingAnchor];
    uint64_t v15 = [v12 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    id v16 = [v24 topAnchor];
    id v17 = [(VUIMediaController *)self view];
    uint64_t v18 = [v17 topAnchor];
    int v19 = [v16 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    id v20 = [v24 bottomAnchor];
    id v21 = [(VUIMediaController *)self view];
    id v22 = [v21 bottomAnchor];
    uint64_t v23 = [v20 constraintEqualToAnchor:v22];
    [v23 setActive:1];
  }
}

- (void)_removeProxyImageView
{
  uint64_t v3 = [(VUIMediaController *)self proxyImageView];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    BOOL v5 = [(VUIMediaController *)self proxyImageView];
    id v6 = [v5 superview];

    if (v6)
    {
      id v7 = [(VUIMediaController *)self proxyImageView];
      [v7 removeFromSuperview];
    }
  }
}

- (void)_delayLoadImage:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIMediaController::delay load image with object %@", (uint8_t *)&v5, 0xCu);
  }

  if (v3) {
    [v3 load];
  }
}

- (void)_playbackStateChanged:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a3 userInfo];
  int v5 = [v4 objectForKey:*MEMORY[0x1E4FAA3C8]];

  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(VUIMediaController *)self name];
    *(_DWORD *)buf = 138412546;
    id v21 = v7;
    __int16 v22 = 2112;
    uint64_t v23 = v5;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIMediaController::playback state changed for %@, new state %@", buf, 0x16u);
  }
  id v8 = [MEMORY[0x1E4FA9D88] playing];

  if (v5 == v8)
  {
    v18[0] = @"VUIMediaControllerIsPlayingFullscreenKey";
    id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUIMediaController isFullscreenPlaybackIntent](self, "isFullscreenPlaybackIntent"));
    v19[0] = v9;
    v18[1] = @"VUIMediaControllerIsAutomaticPlaybackStartKey";
    double v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUIMediaController isAutomaticPlaybackStart](self, "isAutomaticPlaybackStart"));
    v19[1] = v10;
    v18[2] = @"VUIMediaControllerPlaybackStartReasonKey";
    id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIMediaController vpafPlaybackStartReason](self, "vpafPlaybackStartReason"));
    v19[2] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

    uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"VUIMediaControllerDidStartPlaybackNotification" object:self userInfo:v12];

    [(VUIMediaController *)self _updateCurrentPlaybackViewFrameForPlaybackInBackground:[(VUIMediaController *)self isBackgrounded] animated:0];
  }
  id v14 = [(VUIMediaController *)self stateMachine];
  id v16 = @"PlaybackStateKey";
  id v17 = v5;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [v14 postEvent:@"Player state changed" withContext:0 userInfo:v15];
}

- (void)_handlePlaybackErrorNotification:(id)a3
{
}

- (void)_mediaControllerStartedPlayback:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a3 object];
  if (v4 != self)
  {
    int v5 = [(VUIMediaController *)self player];
    id v6 = [v5 state];
    uint64_t v7 = [MEMORY[0x1E4FA9D88] stopped];

    if (v6 != v7)
    {
      if ([(VUIMediaController *)self shouldStopWhenAnotherMediaControllerStarts])
      {
        id v8 = VUIDefaultLogObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [(VUIMediaController *)self name];
          double v10 = [(VUIMediaController *)v4 name];
          int v11 = 138412546;
          uint64_t v12 = v9;
          __int16 v13 = 2112;
          id v14 = v10;
          _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIMediaController::%@ received stop event because %@ will start playback.", (uint8_t *)&v11, 0x16u);
        }
        [(VUIMediaController *)self setPlaybackStopReason:1];
        [(VUIMediaController *)self setAutomaticPlaybackStop:1];
        [(VUIMediaController *)self setVpafPlaybackStopReason:1];
        [(VUIMediaController *)self stop];
      }
    }
  }
}

- (BOOL)isFullscreenPlaybackIntent
{
  id v2 = [(VUIMediaController *)self mediaInfo];
  BOOL v3 = [v2 intent] == 1;

  return v3;
}

- (BOOL)isBackgrounded
{
  return 0;
}

- (BOOL)_shouldIgnorePlaybackStop
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VUIMediaController *)self delegate];
  if (![(VUIMediaController *)self doesDelegateRespondToShowStill]) {
    goto LABEL_5;
  }
  int64_t v4 = [(VUIMediaController *)self playbackStopReason];
  if (v4 == 3)
  {
    int v5 = 1;
    goto LABEL_9;
  }
  if (v4 != 1
    || (int v5 = 1,
        LOBYTE(v11) = 1,
        [v3 mediaController:self shouldShowStill:&v11 afterStoppingForReason:1],
        (_BYTE)v11))
  {
LABEL_5:
    if (objc_opt_respondsToSelector()) {
      int v5 = [v3 mediaControllerShouldIgnorePlaybackStop:self];
    }
    else {
      int v5 = 0;
    }
  }
LABEL_9:
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(VUIMediaController *)self name];
    id v8 = (void *)v7;
    id v9 = @"NO";
    if (v5) {
      id v9 = @"YES";
    }
    int v11 = 138412546;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIMediaController::%@ shouldIgnorePlaybackStop = %@", (uint8_t *)&v11, 0x16u);
  }
  return v5;
}

- (CGRect)_playbackContainerViewFrame:(BOOL)a3 hasSecondaryVideoView:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(VUIMediaController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  if (v5 && v4) {
    double v15 = v14 + -300.0;
  }
  else {
    double v15 = v14;
  }
  double v16 = v8;
  double v17 = v10;
  double v18 = v12;
  result.size.height = v15;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)_hasSecondaryView
{
  id v2 = [(VUIMediaController *)self secondaryVideoView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_shouldShowSecondaryView
{
  id v2 = [(VUIMediaController *)self mediaInfo];
  char v3 = [v2 showsSecondaryVideoView];

  return v3;
}

- (CGRect)_secondaryVideoViewFrame:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(VUIMediaController *)self view];
  [v5 bounds];
  double v7 = v6;

  double v8 = [(VUIMediaController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  double v13 = v12 + -300.0;
  if (!v3) {
    double v13 = v12;
  }
  double v14 = v7 + -300.0;
  double v15 = 0.0;
  double v16 = v10;
  result.size.height = v14;
  result.size.width = v16;
  result.origin.y = v13;
  result.origin.x = v15;
  return result;
}

- (void)_updateCurrentPlaybackViewFrameForPlaybackInBackground:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = [(VUIMediaController *)self avPlayerViewController];
  if (v7)
  {
    double v8 = (void *)v7;
    BOOL v9 = [(VUIMediaController *)self shouldZoomWhenTransitioningToBackground];

    if (v9)
    {
      double v10 = [(VUIMediaController *)self player];
      [v10 currentMediaItemPresentationSize];
      double v12 = v11;
      double v14 = v13;

      long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v43.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v43.c = v15;
      *(_OWORD *)&v43.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(VUIMediaController *)self _playbackContainerViewFrame:v5 hasSecondaryVideoView:[(VUIMediaController *)self _hasSecondaryView]];
      id v20 = v16;
      id v21 = v17;
      double v22 = v18;
      double v23 = v19;
      BOOL v25 = v12 == *MEMORY[0x1E4F1DB30] && v14 == *(double *)(MEMORY[0x1E4F1DB30] + 8) || !v5;
      double v36 = v18;
      double v37 = v19;
      double v26 = *(double *)&v17;
      double v27 = *(double *)&v16;
      if (!v25)
      {
        double v28 = v12 / v14;
        if (v12 / v14 >= v18 / v19)
        {
          double v30 = round(v19);
          double v29 = round(v28 * v30);
          double v31 = v29 / v18;
        }
        else
        {
          double v29 = round(v18);
          double v30 = round(v29 / v28);
          double v31 = v30 / v19;
        }
        CGAffineTransformMakeScale(&v43, v31, v31);
        double v36 = v29;
        double v37 = v30;
        double v26 = (v23 - v30) * 0.5;
        double v27 = (v22 - v29) * 0.5;
      }
      v32 = [(VUIMediaController *)self view];
      [v32 layoutIfNeeded];

      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __86__VUIMediaController__updateCurrentPlaybackViewFrameForPlaybackInBackground_animated___block_invoke;
      aBlock[3] = &unk_1E6DF62C0;
      objc_copyWeak(v39, &location);
      v39[1] = v20;
      v39[2] = v21;
      v39[3] = *(id *)&v22;
      v39[4] = *(id *)&v23;
      BOOL v41 = v5;
      v39[5] = *(id *)&v27;
      v39[6] = *(id *)&v26;
      v39[7] = *(id *)&v36;
      v39[8] = *(id *)&v37;
      CGAffineTransform v40 = v43;
      v33 = _Block_copy(aBlock);
      v34 = v33;
      if (v4)
      {
        if (v5) {
          uint64_t v35 = 0x10000;
        }
        else {
          uint64_t v35 = 0x20000;
        }
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v35 delay:v33 options:0 animations:0.25 completion:0.0];
      }
      else
      {
        (*((void (**)(void *))v33 + 2))(v33);
      }

      objc_destroyWeak(v39);
      objc_destroyWeak(&location);
    }
  }
}

void __86__VUIMediaController__updateCurrentPlaybackViewFrameForPlaybackInBackground_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained playbackContainerController];
  BOOL v4 = [v3 view];
  objc_msgSend(v4, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  BOOL v5 = [WeakRetained secondaryVideoView];

  if (v5)
  {
    [WeakRetained _secondaryVideoViewFrame:*(unsigned __int8 *)(a1 + 152)];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [WeakRetained secondaryVideoView];
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    long long v15 = [WeakRetained avPlayerViewController];
    double v16 = [v15 view];
    objc_msgSend(v16, "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  }
  else
  {
    long long v15 = [WeakRetained avPlayerViewController];
    double v16 = [v15 view];
    long long v17 = *(_OWORD *)(a1 + 120);
    v19[0] = *(_OWORD *)(a1 + 104);
    v19[1] = v17;
    v19[2] = *(_OWORD *)(a1 + 136);
    [v16 setTransform:v19];
  }

  double v18 = [WeakRetained view];
  [v18 layoutIfNeeded];
}

- (void)_addPlaybackViewControllerForPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(VUIMediaController *)self playbackContainerController];
  double v6 = v5;
  if (v5)
  {
    double v7 = [v5 view];
    double v8 = [MEMORY[0x1E4FB1618] blackColor];
    [v7 setBackgroundColor:v8];

    [(VUIMediaController *)self addChildViewController:v6];
    double v9 = [(VUIMediaController *)self view];
    double v10 = [v6 view];
    [v9 addSubview:v10];

    if ([(VUIMediaController *)self _shouldShowSecondaryView])
    {
      [(VUIMediaController *)self _playbackContainerViewFrame:v3 hasSecondaryVideoView:1];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v19 = [v6 view];
      objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

      id v20 = [v6 view];
      [v20 setClipsToBounds:1];

      [(VUIMediaController *)self _secondaryVideoViewFrame:1];
      BOOL v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA9DB8]), "initWithFrame:", v21, v22, v23, v24);
      CGAffineTransformMakeScale(&v44, 1.0, -1.0);
      [v25 setTransform:&v44];
      double v26 = [(VUIMediaController *)self player];
      [v25 setPlayer:v26];

      [v25 setHidden:1];
      [v25 setVideoGravity:1];
      double v27 = [(VUIMediaController *)self view];
      double v28 = [v6 view];
      [v27 insertSubview:v25 aboveSubview:v28];

      [(VUIMediaController *)self setSecondaryVideoView:v25];
    }
    else
    {
      [(VUIMediaController *)self _playbackContainerViewFrame:v3 hasSecondaryVideoView:0];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      BOOL v25 = [v6 view];
      objc_msgSend(v25, "setFrame:", v30, v32, v34, v36);
    }

    double v37 = [v6 view];
    [v37 setHidden:v3];

    [v6 didMoveToParentViewController:self];
    v38 = [(VUIMediaController *)self avPlayerViewController];
    v39 = v38;
    if (v38)
    {
      CGAffineTransform v40 = [v38 view];
      BOOL v41 = [v6 view];
      [v6 addChildViewController:v39];
      v42 = [(VUIMediaController *)self mediaInfo];
      CGAffineTransform v43 = [v42 overlayView];

      if (v43) {
        [v41 insertSubview:v40 belowSubview:v43];
      }
      else {
        [v41 addSubview:v40];
      }
      [v41 bounds];
      objc_msgSend(v40, "setFrame:");
      [v39 didMoveToParentViewController:v6];
    }
  }
}

- (void)_removePlaybackViewController
{
  id v9 = [(VUIMediaController *)self avPlayerViewController];
  BOOL v3 = [v9 parentViewController];
  BOOL v4 = [(VUIMediaController *)self playbackContainerController];

  if (v3 == v4)
  {
    [v9 willMoveToParentViewController:0];
    BOOL v5 = [v9 view];
    [v5 removeFromSuperview];

    [v9 removeFromParentViewController];
  }
  double v6 = [(VUIMediaController *)self playbackContainerController];
  double v7 = [v6 parentViewController];

  if (v7 == self)
  {
    [v6 willMoveToParentViewController:0];
    double v8 = [v6 view];
    [v8 removeFromSuperview];

    [v6 removeFromParentViewController];
  }
}

- (void)_updateAVPlayerViewControllerWithAVPlayerForPlayer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VUIMediaController *)self avPlayerViewController];
  double v6 = v5;
  if (v5)
  {
    double v7 = [v5 player];

    if (v7)
    {
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __73__VUIMediaController__updateAVPlayerViewControllerWithAVPlayerForPlayer___block_invoke;
      v9[3] = &unk_1E6DF3F90;
      objc_copyWeak(&v12, &location);
      id v10 = v6;
      id v11 = v4;
      dispatch_async(MEMORY[0x1E4F14428], v9);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else
    {
      double v8 = [v4 avPlayer];
      [v6 setPlayer:v8];
    }
  }
}

void __73__VUIMediaController__updateAVPlayerViewControllerWithAVPlayerForPlayer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    BOOL v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v5 = WeakRetained;
      id v4 = [*(id *)(a1 + 40) avPlayer];
      [v3 setPlayer:v4];

      id WeakRetained = v5;
    }
  }
}

- (void)_stateDidChangeFromState:(id)a3 toState:(id)a4 onEvent:(id)a5 context:(id)a6 userInfo:(id)a7
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9 && v10)
  {
    if ([v9 isEqualToString:@"Media controller waiting for timeout while paused"])
    {
      id v12 = VUIDefaultLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        double v13 = [(VUIMediaController *)self name];
        int v18 = 138412290;
        double v19 = v13;
        _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "VUIMediaController::%@ invalidating waiting for timeout timer in paused state.", (uint8_t *)&v18, 0xCu);
      }
      double v14 = [(VUIMediaController *)self pauseStateTimeoutTimer];
      [v14 invalidate];

      [(VUIMediaController *)self setPauseStateTimeoutTimer:0];
    }
    else if ([v9 isEqualToString:@"Loading image"])
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
    }
    else if ([v9 isEqualToString:@"Showing image"])
    {
      double v15 = [(VUIMediaController *)self playbackLoadingTimer];
      if (v15)
      {
        double v16 = VUIDefaultLogObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          double v17 = [(VUIMediaController *)self name];
          int v18 = 138412546;
          double v19 = v17;
          __int16 v20 = 2112;
          double v21 = v11;
          _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "VUIMediaController::%@ invalidating playlist loading timer. Going to new state: %@", (uint8_t *)&v18, 0x16u);
        }
        [v15 invalidate];
        [(VUIMediaController *)self setPlaybackLoadingTimer:0];
      }
    }
  }
}

- (void)_registerStateMachineHandlers
{
  v166[5] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke;
  aBlock[3] = &unk_1E6DF59E8;
  objc_copyWeak(&v158, &location);
  BOOL v3 = _Block_copy(aBlock);
  v155[0] = MEMORY[0x1E4F143A8];
  v155[1] = 3221225472;
  v155[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2;
  v155[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v156, &location);
  id v4 = _Block_copy(v155);
  v153[0] = MEMORY[0x1E4F143A8];
  v153[1] = 3221225472;
  v153[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3;
  v153[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v154, &location);
  v64 = (id *)_Block_copy(v153);
  v150[0] = MEMORY[0x1E4F143A8];
  v150[1] = 3221225472;
  v150[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4;
  v150[3] = &unk_1E6DF62E8;
  objc_copyWeak(&v152, &location);
  v66 = v3;
  v151 = v66;
  id v5 = _Block_copy(v150);
  v146[0] = MEMORY[0x1E4F143A8];
  v146[1] = 3221225472;
  v146[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_193;
  v146[3] = &unk_1E6DF6310;
  objc_copyWeak(&v149, &location);
  id v67 = v4;
  id v147 = v67;
  id v6 = v5;
  id v148 = v6;
  v63 = _Block_copy(v146);
  v144[0] = MEMORY[0x1E4F143A8];
  v144[1] = 3221225472;
  v144[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_195;
  v144[3] = &unk_1E6DF6388;
  objc_copyWeak(&v145, &location);
  double v7 = _Block_copy(v144);
  v142[0] = MEMORY[0x1E4F143A8];
  v142[1] = 3221225472;
  v142[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_204;
  v142[3] = &unk_1E6DF63D8;
  objc_copyWeak(&v143, &location);
  double v8 = _Block_copy(v142);
  v140[0] = MEMORY[0x1E4F143A8];
  v140[1] = 3221225472;
  v140[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_211;
  v140[3] = &unk_1E6DF63D8;
  objc_copyWeak(&v141, &location);
  v65 = (id *)_Block_copy(v140);
  id v9 = [(VUIMediaController *)self stateMachine];
  v166[0] = @"Not doing anything";
  v166[1] = @"Loading image";
  v166[2] = @"Showing image";
  v166[3] = @"Showing playback in foreground";
  v166[4] = @"Showing playback in background";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v166 count:5];
  [v9 registerHandlerForEvent:@"Set image" onStates:v10 withBlock:&__block_literal_global_40];

  id v11 = [(VUIMediaController *)self stateMachine];
  v165[0] = @"Loading playlist";
  v165[1] = @"Waiting for player to start loading";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v165 count:2];
  v138[0] = MEMORY[0x1E4F143A8];
  v138[1] = 3221225472;
  v138[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_216;
  v138[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v139, &location);
  [v11 registerHandlerForEvent:@"Set image" onStates:v12 withBlock:v138];

  double v13 = [(VUIMediaController *)self stateMachine];
  v164[0] = @"Not doing anything";
  v164[1] = @"Loading image";
  v164[2] = @"Showing image";
  v164[3] = @"Finished playback";
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v164 count:4];
  v135[0] = MEMORY[0x1E4F143A8];
  v135[1] = 3221225472;
  v135[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_5;
  v135[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v137, &location);
  id v15 = v7;
  id v136 = v15;
  [v13 registerHandlerForEvent:@"Load image" onStates:v14 withBlock:v135];

  double v16 = [(VUIMediaController *)self stateMachine];
  v133[0] = MEMORY[0x1E4F143A8];
  v133[1] = 3221225472;
  v133[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_218;
  v133[3] = &unk_1E6DF6470;
  id v17 = v15;
  id v134 = v17;
  [v16 registerHandlerForEvent:@"Load image" onState:@"Showing playback in foreground" withBlock:v133];

  int v18 = [(VUIMediaController *)self stateMachine];
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_219;
  v130[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v132, &location);
  id v61 = v17;
  id v131 = v61;
  [v18 registerHandlerForEvent:@"Load image" onState:@"Showing playback in background" withBlock:v130];

  double v19 = [(VUIMediaController *)self stateMachine];
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_220;
  v127[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v129, &location);
  id v20 = v8;
  id v128 = v20;
  [v19 registerHandlerForEvent:@"Show image" onState:@"Loading image" withBlock:v127];

  double v21 = [(VUIMediaController *)self stateMachine];
  v125[0] = MEMORY[0x1E4F143A8];
  v125[1] = 3221225472;
  v125[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_223;
  v125[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v126, &location);
  [v21 registerHandlerForEvent:@"Show image" onState:@"Finished playback" withBlock:v125];

  uint64_t v22 = [(VUIMediaController *)self stateMachine];
  v163[0] = @"Not doing anything";
  v163[1] = @"Loading playlist";
  v163[2] = @"Showing playback in foreground";
  v163[3] = @"Showing playback in background";
  double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v163 count:4];
  [v22 registerHandlerForEvent:@"Set playlist" onStates:v23 withBlock:&__block_literal_global_227];

  double v24 = [(VUIMediaController *)self stateMachine];
  v123[0] = MEMORY[0x1E4F143A8];
  v123[1] = 3221225472;
  v123[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_228;
  v123[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v124, &location);
  [v24 registerHandlerForEvent:@"Set playlist" onState:@"Loading image" withBlock:v123];

  BOOL v25 = [(VUIMediaController *)self stateMachine];
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_229;
  v120[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v122, &location);
  id v62 = v20;
  id v121 = v62;
  [v25 registerHandlerForEvent:@"Set playlist" onState:@"Showing image" withBlock:v120];

  double v26 = [(VUIMediaController *)self stateMachine];
  v162[0] = @"Not doing anything";
  v162[1] = @"Showing image";
  v162[2] = @"Loading image";
  v162[3] = @"Loading playlist";
  double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v162 count:4];
  v118[0] = MEMORY[0x1E4F143A8];
  v118[1] = 3221225472;
  v118[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_230;
  v118[3] = &unk_1E6DF6470;
  id v28 = v6;
  id v119 = v28;
  [v26 registerHandlerForEvent:@"Load playlist" onStates:v27 withBlock:v118];

  double v29 = [(VUIMediaController *)self stateMachine];
  v161[0] = @"Showing playback in foreground";
  v161[1] = @"Showing playback in background";
  double v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v161 count:2];
  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_8;
  v115[3] = &unk_1E6DF64C0;
  id v31 = v67;
  id v116 = v31;
  v60 = v65;
  v117 = v60;
  [v29 registerHandlerForEvent:@"Load playlist" onStates:v30 withBlock:v115];

  double v32 = [(VUIMediaController *)self stateMachine];
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_9;
  v112[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v114, &location);
  double v33 = v66;
  v113 = v33;
  [v32 registerHandlerForEvent:@"Show playback" onState:@"Loading playlist" withBlock:v112];

  double v34 = [(VUIMediaController *)self stateMachine];
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_12;
  v109[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v111, &location);
  double v35 = v33;
  v110 = v35;
  [v34 registerHandlerForEvent:@"Show playback" onState:@"Showing image" withBlock:v109];

  double v36 = [(VUIMediaController *)self stateMachine];
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_15;
  v106[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v108, &location);
  id v68 = v28;
  id v107 = v68;
  [v36 registerHandlerForEvent:@"Player state changed" onState:@"Waiting for player to start loading" withBlock:v106];

  double v37 = [(VUIMediaController *)self stateMachine];
  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_16;
  v104[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v105, &location);
  [v37 registerHandlerForEvent:@"Player state changed" onState:@"Loading playlist" withBlock:v104];

  v38 = [(VUIMediaController *)self stateMachine];
  v160[0] = @"Media controller waiting for timeout while paused";
  v160[1] = @"Showing playback in background";
  v160[2] = @"Showing playback in foreground";
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v160 count:3];
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_233;
  v102[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v103, &location);
  [v38 registerHandlerForEvent:@"Player state changed" onStates:v39 withBlock:v102];

  CGAffineTransform v40 = [(VUIMediaController *)self stateMachine];
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_234;
  v99[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v101, &location);
  v59 = v64;
  v100 = v59;
  [v40 registerDefaultHandlerForEvent:@"Finished playback" withBlock:v99];

  BOOL v41 = [(VUIMediaController *)self stateMachine];
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_237;
  v97[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v98, &location);
  [v41 registerDefaultHandlerForEvent:@"Playback error occurred" withBlock:v97];

  v42 = [(VUIMediaController *)self stateMachine];
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_7_239;
  v95[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v96, &location);
  [v42 registerHandlerForEvent:@"Transition to foreground" onState:@"Loading image" withBlock:v95];

  CGAffineTransform v43 = [(VUIMediaController *)self stateMachine];
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_8_240;
  v93[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v94, &location);
  [v43 registerHandlerForEvent:@"Transition to foreground" onState:@"Showing playback in background" withBlock:v93];

  CGAffineTransform v44 = [(VUIMediaController *)self stateMachine];
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_10_242;
  v91[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v92, &location);
  [v44 registerHandlerForEvent:@"Transition background" onState:@"Loading image" withBlock:v91];

  v45 = [(VUIMediaController *)self stateMachine];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_11_243;
  v89[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v90, &location);
  [v45 registerHandlerForEvent:@"Transition background" onState:@"Showing playback in foreground" withBlock:v89];

  v46 = [(VUIMediaController *)self stateMachine];
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_13_245;
  v86[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v88, &location);
  v58 = v35;
  v87 = v58;
  [v46 registerHandlerForEvent:@"Play" onState:@"Showing playback in background" withBlock:v86];

  v47 = [(VUIMediaController *)self stateMachine];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_14_246;
  v84[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v85, &location);
  [v47 registerHandlerForEvent:@"Play" onState:@"Showing playback in foreground" withBlock:v84];

  v48 = [(VUIMediaController *)self stateMachine];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_15_247;
  v82[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v83, &location);
  [v48 registerHandlerForEvent:@"Play" onState:@"Media controller waiting for timeout while paused" withBlock:v82];

  v49 = [(VUIMediaController *)self stateMachine];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_17_249;
  v80[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v81, &location);
  [v49 registerHandlerForEvent:@"Pause" onState:@"Showing playback in background" withBlock:v80];

  v50 = [(VUIMediaController *)self stateMachine];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_250;
  v78[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v79, &location);
  [v50 registerHandlerForEvent:@"Pause" onState:@"Showing playback in foreground" withBlock:v78];

  v51 = [(VUIMediaController *)self stateMachine];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_251;
  v75[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v77, &location);
  id v57 = v31;
  id v76 = v57;
  [v51 registerDefaultHandlerForEvent:@"Stop" withBlock:v75];

  v52 = [(VUIMediaController *)self stateMachine];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_252;
  v71[3] = &unk_1E6DF6560;
  objc_copyWeak(&v74, &location);
  id v53 = v62;
  id v72 = v53;
  id v54 = v63;
  id v73 = v54;
  [v52 registerHandlerForEvent:@"Replay" onState:@"Showing image" withBlock:v71];

  v55 = [(VUIMediaController *)self stateMachine];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_254;
  v69[3] = &unk_1E6DF6470;
  id v56 = v68;
  id v70 = v56;
  [v55 registerHandlerForEvent:@"Restore avPlayerViewController" onState:@"Not doing anything" withBlock:v69];

  objc_destroyWeak(&v74);
  objc_destroyWeak(&v77);
  objc_destroyWeak(&v79);
  objc_destroyWeak(&v81);
  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);

  objc_destroyWeak(&v88);
  objc_destroyWeak(&v90);
  objc_destroyWeak(&v92);
  objc_destroyWeak(&v94);
  objc_destroyWeak(&v96);
  objc_destroyWeak(&v98);

  objc_destroyWeak(&v101);
  objc_destroyWeak(&v103);
  objc_destroyWeak(&v105);

  objc_destroyWeak(&v108);
  objc_destroyWeak(&v111);

  objc_destroyWeak(&v114);
  objc_destroyWeak(&v122);
  objc_destroyWeak(&v124);
  objc_destroyWeak(&v126);

  objc_destroyWeak(&v129);
  objc_destroyWeak(&v132);

  objc_destroyWeak(&v137);
  objc_destroyWeak(&v139);

  objc_destroyWeak(&v141);
  objc_destroyWeak(&v143);

  objc_destroyWeak(&v145);
  objc_destroyWeak(&v149);

  objc_destroyWeak(&v152);
  objc_destroyWeak(&v154);

  objc_destroyWeak(&v156);
  objc_destroyWeak(&v158);
  objc_destroyWeak(&location);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAutomaticPlaybackStop:0];
  v7[0] = @"VUIMediaControllerIsPlayingFullscreenKey";
  id v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(WeakRetained, "isFullscreenPlaybackIntent"));
  v8[0] = v2;
  v7[1] = @"VUIMediaControllerIsAutomaticPlaybackStartKey";
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(WeakRetained, "isAutomaticPlaybackStart"));
  v8[1] = v3;
  v7[2] = @"VUIMediaControllerPlaybackStartReasonKey";
  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(WeakRetained, "vpafPlaybackStartReason"));
  void v8[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"VUIMediaControllerWillStartPlaybackNotification" object:WeakRetained userInfo:v5];
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = @"VUIMediaControllerIsAutomaticPlaybackStopKey";
  id v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(WeakRetained, "isAutomaticPlaybackStop"));
  v6[1] = @"VUIMediaControllerPlaybackStopReasonKey";
  v7[0] = v2;
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(WeakRetained, "vpafPlaybackStopReason"));
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"VUIMediaControllerWillStopPlaybackNotification" object:WeakRetained userInfo:v4];
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = @"VUIMediaControllerIsAutomaticPlaybackStopKey";
  id v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(WeakRetained, "isAutomaticPlaybackStop"));
  v6[1] = @"VUIMediaControllerPlaybackStopReasonKey";
  v7[0] = v2;
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(WeakRetained, "vpafPlaybackStopReason"));
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"VUIMediaControllerDidStopPlaybackNotification" object:WeakRetained userInfo:v4];
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4(uint64_t a1, void *a2, char a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 138412290;
    id v33 = v5;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIMediaController::will create a new playback view controller with playlist:<%@>", (uint8_t *)&v32, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v8 = [WeakRetained player];

  if (!v8)
  {
    id v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIMediaController::creating player because no player was supplied.", (uint8_t *)&v32, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4FA9D98]);
    id v11 = [WeakRetained name];
    id v12 = (void *)[v10 initWithName:v11];

    double v13 = [WeakRetained mediaInfo];
    uint64_t v14 = [v13 intent];
    id v15 = VUIRTCPlaybackBackground;
    if (v14) {
      id v15 = VUIRTCPlaybackFullscreen;
    }
    double v16 = *v15;

    [v12 setReportingValueWithString:v16 forKey:@"initiator"];
    [v12 setUpdatesMediaRemoteInfoAutomatically:0];
    [WeakRetained setPlayer:v12];
    [WeakRetained setDidWeCreatePlayer:1];
    id v17 = [WeakRetained player];
    [v17 addObserver:WeakRetained forKeyPath:@"avPlayer" options:0 context:__PlayerAVPlayerKVOContext];
  }
  if (v5)
  {
    int v18 = [WeakRetained player];
    [v18 setPlaylist:v5];
  }
  [WeakRetained setPlaybackStopReason:2];
  [WeakRetained _registerPlayerNotifications];
  double v19 = objc_opt_new();
  [WeakRetained setPlaybackContainerController:v19];

  id v20 = [WeakRetained mediaInfo];
  if (v20)
  {
    double v21 = [WeakRetained mediaInfo];
    BOOL v22 = [v21 intent] == 0;
  }
  else
  {
    BOOL v22 = 0;
  }

  double v23 = [WeakRetained avPlayerViewController];

  if (!v23)
  {
    double v24 = VUIDefaultLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "VUIMediaController::creating avPlayerViewController because none was supplied.", (uint8_t *)&v32, 2u);
    }

    BOOL v25 = (void *)[objc_alloc(MEMORY[0x1E4F16750]) initWithNibName:0 bundle:0];
    double v26 = [v25 view];
    double v27 = [WeakRetained view];
    [v27 bounds];
    objc_msgSend(v26, "setFrame:");

    id v28 = [v5 currentMediaItem];
    double v29 = [v28 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
    objc_msgSend(v25, "setAllowsPictureInPicturePlayback:", objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E4FAA1F0]) ^ 1);
    [WeakRetained setAvPlayerViewController:v25];
    if ([WeakRetained didWeCreatePlayer])
    {
      double v30 = [WeakRetained player];
      [WeakRetained _updateAVPlayerViewControllerWithAVPlayerForPlayer:v30];
    }
  }
  [WeakRetained _addPlaybackViewControllerForPlayback:v22];
  if ((a3 & 1) == 0 && v22)
  {
    id v31 = [WeakRetained player];
    [v31 pause];
  }
  if (!v22)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    [WeakRetained setState:3];
  }
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_193(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIMediaController::starting to load the playlist:<%@>", (uint8_t *)&v12, 0xCu);
  }

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v6 = [WeakRetained player];
    if (!v6) {
      goto LABEL_6;
    }
    double v7 = (void *)v6;
    double v8 = [WeakRetained player];
    id v9 = [v8 playlist];
    char v10 = [v9 isEqual:v3];

    if ((v10 & 1) == 0)
    {
      [WeakRetained setPendingPlaylist:v3];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v11 = [WeakRetained player];
      [v11 stop];
    }
    else
    {
LABEL_6:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_195(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, v5);
  double v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_196;
  int v18 = &unk_1E6DF6360;
  objc_copyWeak(&v20, &location);
  id v9 = v6;
  id v19 = v9;
  objc_copyWeak(&v21, v7);
  [v5 setCompletionHandler:&v15];
  objc_msgSend(WeakRetained, "setCurrentImageProxy:", v5, v15, v16, v17, v18);
  char v10 = [WeakRetained mediaInfo];
  int v11 = [v10 shouldDelayLoadingImage];

  int v12 = [WeakRetained proxyImageView];
  id v13 = [v12 image];

  if (v13) {
    int v14 = v11;
  }
  else {
    int v14 = 0;
  }
  if (v14 == 1) {
    [WeakRetained performSelector:sel__delayLoadImage_ withObject:v5 afterDelay:5.0];
  }
  else {
    [v5 load];
  }
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_196(id *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  char v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_196_cold_1((uint64_t)WeakRetained, a4, v10);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_197;
  aBlock[3] = &unk_1E6DF3D80;
  id v22 = a1[4];
  int v11 = _Block_copy(aBlock);
  int v12 = v11;
  if (a4)
  {
    [WeakRetained setCompletionHandler:0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    uint64_t v15 = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_199;
    uint64_t v16 = &unk_1E6DF4588;
    objc_copyWeak(&v20, a1 + 6);
    id v17 = v8;
    id v18 = v7;
    id v19 = v12;
    id v13 = v14;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v15((uint64_t)v13);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v13);
    }

    objc_destroyWeak(&v20);
  }
  else
  {
    (*((void (**)(void *, void))v11 + 2))(v11, 0);
  }
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_197(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  id v4 = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_198;
  id v5 = &unk_1E6DF6338;
  id v6 = *(id *)(a1 + 32);
  char v7 = a2;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v3[0], 3221225472)) {
    v4((uint64_t)v3);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v3);
  }
}

uint64_t __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_198(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_199(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    id v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_199_cold_1((uint64_t *)(a1 + 32), v4);
    }

    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v6 = [WeakRetained proxyImageView];
    char v7 = [*(id *)(a1 + 40) uiImage];
    [v6 setImage:v7];

    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v5();
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_204(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_205;
  aBlock[3] = &unk_1E6DF3F90;
  objc_copyWeak(&v33, (id *)(a1 + 32));
  id v5 = v3;
  id v31 = v5;
  id v32 = WeakRetained;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  if ([WeakRetained isBackgrounded])
  {
    if ([WeakRetained isPlaybackEnabled])
    {
      char v7 = [WeakRetained playbackLoadingTimer];
      id v8 = v7;
      if (v7)
      {
        [v7 invalidate];
        [WeakRetained setPlaybackLoadingTimer:0];
      }
      if (PlaybackDelayTimeIntervalOverride_onceToken != -1) {
        dispatch_once(&PlaybackDelayTimeIntervalOverride_onceToken, &__block_literal_global_552);
      }
      double v9 = *(double *)&PlaybackDelayTimeIntervalOverride_playbackDelayInterval;
      char v10 = +[VUIFeaturesConfiguration sharedInstance];
      int v11 = [v10 autoPlayConfig];
      [v11 autoPlayDelayInterval];
      double v13 = v12;

      int v14 = [WeakRetained mediaInfo];
      [v14 playbackDelayInterval];
      double v16 = v15;

      if (v13 <= 0.0) {
        double v17 = v16;
      }
      else {
        double v17 = v13;
      }
      if (v9 > 0.0) {
        double v17 = v9;
      }
      if (v17 > 0.0) {
        double v18 = v17 + -1.0;
      }
      else {
        double v18 = 0.0;
      }
      if (v18 == 0.0)
      {
        double v24 = VUIDefaultLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v25 = [WeakRetained name];
          *(_DWORD *)buf = 134218242;
          id v35 = WeakRetained;
          __int16 v36 = 2112;
          double v37 = v25;
          _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "VUIMediaController::(%p: %@) since playback delay interval is 0.0, loading playlist now.", buf, 0x16u);
        }
        double v26 = [MEMORY[0x1E4F1C9C8] date];
        [WeakRetained setPlaybackLoadingStartDate:v26];

        v6[2](v6);
      }
      else
      {
        id v19 = VUIDefaultLogObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [WeakRetained name];
          *(_DWORD *)buf = 134218498;
          id v35 = WeakRetained;
          __int16 v36 = 2112;
          double v37 = v20;
          __int16 v38 = 2048;
          double v39 = v18;
          _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "VUIMediaController::(%p: %@) scheduling a playlist loading timer with interval: (%f)", buf, 0x20u);
        }
        id v21 = (void *)MEMORY[0x1E4F1CB00];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_209;
        v27[3] = &unk_1E6DF63B0;
        objc_copyWeak(&v29, (id *)(a1 + 32));
        id v28 = v6;
        uint64_t v22 = [v21 scheduledTimerWithTimeInterval:0 repeats:v27 block:v18];

        [WeakRetained setPlaybackLoadingTimer:v22];
        objc_destroyWeak(&v29);
        id v8 = v22;
      }
    }
    else
    {
      id v8 = VUIDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        double v23 = [WeakRetained name];
        *(_DWORD *)buf = 134218242;
        id v35 = WeakRetained;
        __int16 v36 = 2112;
        double v37 = v23;
        _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIMediaController::(%p: %@) playback is not enabled, not setting loading timer.", buf, 0x16u);
      }
    }
  }
  else
  {
    v6[2](v6);
  }

  objc_destroyWeak(&v33);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_205(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v4 = [v3 applicationState];

  id v5 = +[VUIPlaybackManager sharedInstance];
  char v6 = [v5 isFullscreenPlaybackUIBeingShown];

  if (v4 || (v6 & 1) != 0)
  {
    char v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = *(void **)(a1 + 40);
      int v11 = [v10 name];
      double v12 = VUIBoolLogString();
      int v13 = 134218754;
      int v14 = v10;
      __int16 v15 = 2112;
      double v16 = v11;
      __int16 v17 = 2048;
      uint64_t v18 = v4;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIMediaController::(%p: %@) not loading playlist applicationState:<%ld> isFullscreenPlaybackUIBeingShown:<%@>.", (uint8_t *)&v13, 0x2Au);
    }
    goto LABEL_7;
  }
  if (*(void *)(a1 + 32))
  {
    char v7 = [WeakRetained stateMachine];
    uint64_t v8 = *(void *)(a1 + 32);
    id v21 = @"PlaylistKey";
    v22[0] = v8;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    [v7 postEvent:@"Load playlist" withContext:0 userInfo:v9];

LABEL_7:
  }
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_209(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [WeakRetained name];
    [WeakRetained isPlaybackEnabled];
    id v5 = VUIBoolLogString();
    int v7 = 134218498;
    id v8 = WeakRetained;
    __int16 v9 = 2112;
    char v10 = v4;
    __int16 v11 = 2112;
    double v12 = v5;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIMediaController::(%p: %@) loading timer fired, isPlaybackEnabled: (%@)", (uint8_t *)&v7, 0x20u);
  }
  if ([WeakRetained isPlaybackEnabled])
  {
    char v6 = [MEMORY[0x1E4F1C9C8] date];
    [WeakRetained setPlaybackLoadingStartDate:v6];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_211(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v26 = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = [WeakRetained player];
    char v6 = [v5 playlist];

    if (([v26 isEqualToPlaylist:v6] & 1) == 0)
    {
      int v7 = [WeakRetained player];
      id v8 = [v7 playlist];
      uint64_t v9 = [v8 activeListIndex];

      id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      __int16 v11 = [WeakRetained player];
      double v12 = [v11 playlist];
      uint64_t v13 = [v12 count];

      if (v13)
      {
        unint64_t v14 = 0;
        do
        {
          if (v9 != v14) {
            [v10 addIndex:v14];
          }
          ++v14;
          __int16 v15 = [WeakRetained player];
          double v16 = [v15 playlist];
          unint64_t v17 = [v16 count];
        }
        while (v14 < v17);
      }
      uint64_t v18 = [WeakRetained player];
      __int16 v19 = [v18 playlist];
      [v19 removeItemsAtIndexes:v10];

      id v20 = [WeakRetained player];
      id v21 = [v20 playlist];
      uint64_t v22 = [v26 trackList];
      [v21 addItems:v22];

      double v23 = [WeakRetained player];
      [v23 changeMediaInDirection:0];

      double v24 = [WeakRetained player];
      BOOL v25 = [v24 playlist];
      [v25 removeItemAtIndex:0];
    }
    id v3 = v26;
  }
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_213(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a2;
  id v7 = a5;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  unint64_t v14 = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_215;
  __int16 v15 = &unk_1E6DF3F68;
  id v16 = v6;
  id v17 = v7;
  id v8 = v7;
  id v9 = v6;
  [v9 executeBlockAfterCurrentStateTransition:&v12];
  id v10 = objc_msgSend(v9, "currentState", v12, v13, v14, v15);

  return v10;
}

uint64_t __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_215(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Load image" withContext:0 userInfo:*(void *)(a1 + 40)];
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_216(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = [v8 objectForKeyedSubscript:@"ImageProxyKey"];

  if (v10) {
    [WeakRetained setPendingImageProxy:v10];
  }
  __int16 v11 = [v7 currentState];

  return v11;
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v12 objectForKeyedSubscript:@"ImageProxyKey"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6;
  void v18[3] = &unk_1E6DF6448;
  objc_copyWeak(&v23, (id *)(a1 + 40));
  id v14 = v13;
  id v19 = v14;
  id v22 = *(id *)(a1 + 32);
  id v15 = v9;
  id v20 = v15;
  id v16 = v12;
  id v21 = v16;
  [v15 executeBlockAfterCurrentStateTransition:v18];

  objc_destroyWeak(&v23);
  return @"Loading image";
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v4 = [WeakRetained currentImageProxy];
  if (!v4
    || ([WeakRetained currentImageProxy],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqual:*(void *)(a1 + 32)],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    id v7 = [WeakRetained currentImageProxy];

    if (v7)
    {
      id v8 = VUIDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [WeakRetained currentImageProxy];
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        id v19 = v9;
        __int16 v20 = 2112;
        uint64_t v21 = v10;
        _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIMediaController::cancelling loading of current image proxy: [%@], new image proxy to load: [%@]", buf, 0x16u);
      }
      id v11 = [WeakRetained currentImageProxy];
      [v11 cancel];

      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:WeakRetained];
      [WeakRetained setCurrentImageProxy:0];
    }
  }
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_217;
  v14[3] = &unk_1E6DF6420;
  objc_copyWeak(&v17, v2);
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v13, v14);

  objc_destroyWeak(&v17);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_217(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained mediaInfo];
  id v5 = [v4 imageProxies];
  char v6 = [v5 firstObject];
  id v7 = [WeakRetained currentImageProxy];
  int v8 = [v6 isEqual:v7];

  if (a2 && v8) {
    [*(id *)(a1 + 32) postEvent:@"Show image" withContext:0 userInfo:*(void *)(a1 + 40)];
  }
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_218(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  int v8 = [a5 objectForKeyedSubscript:@"ImageProxyKey"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v9 = [v7 currentState];

  return v9;
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_219(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v10 = [WeakRetained mediaInfo];
  uint64_t v11 = [v10 intent];

  if (v11 == 1)
  {
    uint64_t v12 = [v8 objectForKeyedSubscript:@"ImageProxyKey"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v13 = [v7 currentState];

  return v13;
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_220(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
  if (v13)
  {
    id v14 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
    char v15 = [v14 BOOLValue];
  }
  else
  {
    char v15 = 1;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setState:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_221;
  void v18[3] = &unk_1E6DF6498;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  char v21 = v15;
  id v19 = *(id *)(a1 + 32);
  [v9 executeBlockAfterCurrentStateTransition:v18];

  objc_destroyWeak(&v20);
  return @"Showing image";
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_221(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_222;
  v5[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v7, v2);
  id v6 = *(id *)(a1 + 32);
  [WeakRetained _swapActiveMedia:1 animated:v4 completion:v5];

  objc_destroyWeak(&v7);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_222(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_7;
  v2[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained pendingPlaylist];
  if (v3)
  {
    id v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIMediaController::we have a pending playlist, starting loading timer.", v5, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    [WeakRetained setPendingPlaylist:0];
  }
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_223(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
  if (v13)
  {
    id v14 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
    char v15 = [v14 BOOLValue];
  }
  else
  {
    char v15 = 1;
  }

  id v16 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setState:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_224;
  _OWORD v19[3] = &unk_1E6DF5330;
  objc_copyWeak(&v20, v16);
  char v21 = v15;
  [v9 executeBlockAfterCurrentStateTransition:v19];
  objc_destroyWeak(&v20);

  return @"Showing image";
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_224(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _swapActiveMedia:1 animated:*(unsigned __int8 *)(a1 + 40) completion:0];
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_225(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = a2;
  [v6 postEvent:@"Load playlist" withContext:0 userInfo:a5];
  id v7 = [v6 currentState];

  return v7;
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_228(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKeyedSubscript:@"PlaylistKey"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPendingPlaylist:v8];

  id v10 = [v7 currentState];

  return v10;
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_229(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = [v7 objectForKeyedSubscript:@"PlaylistKey"];
  id v11 = [WeakRetained mediaInfo];
  uint64_t v12 = [v11 intent];

  if (v12) {
    [v8 postEvent:@"Load playlist" withContext:0 userInfo:v7];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v13 = [v8 currentState];

  return v13;
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_230(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKeyedSubscript:@"PlaylistKey"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_7_231;
  v12[3] = &unk_1E6DF41E8;
  id v9 = *(id *)(a1 + 32);
  id v13 = v8;
  id v14 = v9;
  id v10 = v8;
  [v7 executeBlockAfterCurrentStateTransition:v12];

  return @"Waiting for player to start loading";
}

uint64_t __51__VUIMediaController__registerStateMachineHandlers__block_invoke_7_231(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKeyedSubscript:@"PlaylistKey"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v9 = [v7 currentState];

  return v9;
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
  if (v13)
  {
    id v14 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
    uint64_t v15 = [v14 BOOLValue];
  }
  else
  {
    uint64_t v15 = 1;
  }

  id v16 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isBackgrounded])
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v18 = [WeakRetained player];
    [v18 play];

    id v19 = [WeakRetained player];
    [v19 setMuted:1];

    [WeakRetained setState:2];
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_10;
  v24[3] = &unk_1E6DF64E8;
  id v20 = v9;
  id v25 = v20;
  objc_copyWeak(&v27, v16);
  id v26 = WeakRetained;
  [WeakRetained _swapActiveMedia:0 animated:v15 completion:v24];
  if ([WeakRetained isBackgrounded]) {
    char v21 = @"Showing playback in background";
  }
  else {
    char v21 = @"Showing playback in foreground";
  }
  uint64_t v22 = v21;
  objc_destroyWeak(&v27);

  return v22;
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_10(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_11;
  v5[3] = &unk_1E6DF3F90;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 executeBlockAfterCurrentStateTransition:v5];

  objc_destroyWeak(&v8);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_11(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained pendingImageProxy];

  if (v3)
  {
    uint64_t v7 = @"ImageProxyKey";
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) pendingImageProxy];
    v8[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v4 postEvent:@"Load image" withContext:0 userInfo:v6];

    [WeakRetained setPendingImageProxy:0];
  }
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
  if (v13)
  {
    id v14 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
    uint64_t v15 = [v14 BOOLValue];
  }
  else
  {
    uint64_t v15 = 1;
  }

  id v16 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isBackgrounded])
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v18 = [WeakRetained player];
    [v18 play];

    id v19 = [WeakRetained player];
    [v19 setMuted:1];

    [WeakRetained setState:2];
  }
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  id v26 = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_13;
  id v27 = &unk_1E6DF6510;
  id v20 = v9;
  id v28 = v20;
  objc_copyWeak(&v29, v16);
  [WeakRetained _swapActiveMedia:0 animated:v15 completion:&v24];
  if (objc_msgSend(WeakRetained, "isBackgrounded", v24, v25, v26, v27)) {
    char v21 = @"Showing playback in background";
  }
  else {
    char v21 = @"Showing playback in foreground";
  }
  uint64_t v22 = v21;
  objc_destroyWeak(&v29);

  return v22;
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_13(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_14;
  v3[3] = &unk_1E6DF5490;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  [v2 executeBlockAfterCurrentStateTransition:v3];

  objc_destroyWeak(&v5);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_14(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained pendingImageProxy];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v7 = @"ImageProxyKey";
    id v5 = [WeakRetained pendingImageProxy];
    v8[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v4 postEvent:@"Load image" withContext:0 userInfo:v6];

    [WeakRetained setPendingImageProxy:0];
  }
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_15(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKeyedSubscript:@"PlaybackStateKey"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = [v7 currentState];

  id v11 = [MEMORY[0x1E4FA9D88] loading];

  if (v8 == v11)
  {
    [WeakRetained setPlayerReadyToBePlayed:0];

    id v10 = @"Loading playlist";
  }
  else if (([WeakRetained _shouldIgnorePlaybackStop] & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4FA9D88] stopped];

    if (v8 == v12)
    {
      id v13 = [WeakRetained pendingPlaylist];

      if (v13)
      {
        [WeakRetained _cleanUpEverythingPlaybackRelated];
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = [WeakRetained pendingPlaylist];
        (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);

        [WeakRetained setPendingPlaylist:0];
      }
    }
  }

  return v10;
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 objectForKeyedSubscript:@"PlaybackStateKey"];
  uint64_t v14 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v16 = [v9 currentState];
  id v17 = [MEMORY[0x1E4FA9D88] paused];

  if (v13 != v17)
  {
    uint64_t v18 = [MEMORY[0x1E4FA9D88] playing];

    if (v13 == v18)
    {

      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_232;
      v28[3] = &unk_1E6DF5490;
      objc_copyWeak(&v30, v14);
      id v29 = v9;
      [v29 executeBlockAfterCurrentStateTransition:v28];

      objc_destroyWeak(&v30);
      id v16 = @"Showing playback in foreground";
    }
    else if (([WeakRetained _shouldIgnorePlaybackStop] & 1) == 0)
    {
      id v19 = [MEMORY[0x1E4FA9D88] stopped];

      if (v13 == v19)
      {
        id v35 = @"AnimatedKey";
        v36[0] = MEMORY[0x1E4F1CC38];
        id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
        [v9 postEvent:@"Finished playback" withContext:0 userInfo:v20];
      }
    }
    goto LABEL_18;
  }
  if ([WeakRetained isPlaybackEnabled])
  {
    char v21 = [WeakRetained playbackLoadingStartDate];
    if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
      [v22 timeIntervalSinceDate:v21];
      double v24 = v23;

      [WeakRetained setPlaybackLoadingStartDate:0];
      if ([WeakRetained isBackgrounded] && v24 < 1.0)
      {
        dispatch_time_t when = dispatch_time(0, (uint64_t)((1.0 - v24) * 1000000000.0));
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_17;
        block[3] = &unk_1E6DF5490;
        objc_copyWeak(&v34, v14);
        id v33 = v9;
        dispatch_after(when, MEMORY[0x1E4F14428], block);

        objc_destroyWeak(&v34);
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      [WeakRetained isBackgrounded];
    }
    [v9 postEvent:@"Show playback" withContext:0 userInfo:0];
    goto LABEL_17;
  }
  uint64_t v25 = VUIDefaultLogObject();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "VUIMediaController::playback is not enabled yet. Will show playback when it gets enabled.", buf, 2u);
  }

LABEL_18:
  return v16;
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_17(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [WeakRetained isPlaybackEnabled];
    id v4 = VUIBoolLogString();
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIMediaController::dispatch_after fired in StateLoadingPlaylist, isPlaybackEnabled: (%@)", (uint8_t *)&v5, 0xCu);
  }
  if ([WeakRetained isPlaybackEnabled]) {
    [*(id *)(a1 + 32) postEvent:@"Show playback" withContext:0 userInfo:0];
  }
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_232(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained pendingImageProxy];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v7 = @"ImageProxyKey";
    int v5 = [WeakRetained pendingImageProxy];
    v8[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v4 postEvent:@"Load image" withContext:0 userInfo:v6];

    [WeakRetained setPendingImageProxy:0];
  }
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_233(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = [a5 objectForKeyedSubscript:@"PlaybackStateKey"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = [v7 currentState];
  id v11 = [MEMORY[0x1E4FA9D88] stopped];
  if (v8 == v11)
  {
    char v12 = [WeakRetained _shouldIgnorePlaybackStop];

    if ((v12 & 1) == 0)
    {
      id v19 = @"AnimatedKey";
      v20[0] = MEMORY[0x1E4F1CC38];
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      [v7 postEvent:@"Finished playback" withContext:0 userInfo:v17];

      goto LABEL_9;
    }
  }
  else
  {
  }
  id v13 = [MEMORY[0x1E4FA9D88] paused];

  if (v8 != v13)
  {
    int v14 = [WeakRetained isBackgrounded];
    uint64_t v15 = @"Showing playback in foreground";
    if (v14) {
      uint64_t v15 = @"Showing playback in background";
    }
    id v16 = v15;

    id v10 = v16;
  }
LABEL_9:

  return v10;
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_234(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_235;
  v16[3] = &unk_1E6DF6538;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  id v19 = *(id *)(a1 + 32);
  id v13 = v9;
  id v17 = v13;
  id v14 = v12;
  id v18 = v14;
  [v13 executeBlockAfterCurrentStateTransition:v16];

  objc_destroyWeak(&v20);
  return @"Finished playback";
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_235(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [WeakRetained _cleanUpEverythingPlaybackRelated];
  [WeakRetained setPlaybackEnabled:0];
  if ([WeakRetained popWhenPlayerStops])
  {
    id v2 = [WeakRetained navigationController];
    id v3 = [v2 topViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [WeakRetained navigationController];
      id v5 = (id)[v4 popViewControllerAnimated:1];
    }
    else
    {
      id v6 = [WeakRetained mediaInfo];
      uint64_t v7 = [v6 intent];

      if (!v7) {
        [*(id *)(a1 + 32) postEvent:@"Show image" withContext:0 userInfo:*(void *)(a1 + 40)];
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) postEvent:@"Show image" withContext:0 userInfo:*(void *)(a1 + 40)];
  }
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_237(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setState:1];
  [WeakRetained _cleanUpEverythingPlaybackRelated];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_238;
  v17[3] = &unk_1E6DF3F90;
  objc_copyWeak(&v20, (id *)(a1 + 32));
  id v14 = v9;
  id v18 = v14;
  id v15 = v12;
  id v19 = v15;
  [v14 executeBlockAfterCurrentStateTransition:v17];

  objc_destroyWeak(&v20);
  return @"Finished playback";
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_238(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained pendingImageProxy];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v7 = @"ImageProxyKey";
    id v5 = [WeakRetained pendingImageProxy];
    v8[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v4 postEvent:@"Load image" withContext:0 userInfo:v6];

    [WeakRetained setPendingImageProxy:0];
  }
  else
  {
    [*(id *)(a1 + 32) postEvent:@"Show image" withContext:0 userInfo:*(void *)(a1 + 40)];
  }
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_7_239(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained pendingPlaylist];
  id v6 = (void *)v5;
  if (v5)
  {
    id v10 = @"PlaylistKey";
    v11[0] = v5;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v3 postEvent:@"Load playlist" withContext:0 userInfo:v7];

    [WeakRetained setPendingPlaylist:0];
    id v8 = [v3 currentState];
  }
  else
  {
    id v8 = @"Showing playback in foreground";
  }

  return v8;
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_8_240(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
  if (v13)
  {
    id v14 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
    uint64_t v15 = [v14 BOOLValue];
  }
  else
  {
    uint64_t v15 = 1;
  }

  id v16 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShowsVideoControls:1];
  [WeakRetained _updateCurrentPlaybackViewFrameForPlaybackInBackground:0 animated:v15];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_9_241;
  _OWORD v19[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v20, v16);
  [v9 executeBlockAfterCurrentStateTransition:v19];
  objc_destroyWeak(&v20);

  return @"Showing playback in foreground";
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_9_241(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = @"VUIMediaControllerIsPlayingFullscreenKey";
  id v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(WeakRetained, "isFullscreenPlaybackIntent"));
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"VUIMediaControllerForegroundStateDidChangeNotification" object:WeakRetained userInfo:v3];
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_10_242(uint64_t a1, void *a2)
{
  id v3 = [a2 currentState];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained player];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [WeakRetained avPlayerViewController];

    if (v7)
    {

      id v3 = @"Showing playback in background";
    }
  }

  return v3;
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_11_243(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
  if (v13)
  {
    id v14 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
    uint64_t v15 = [v14 BOOLValue];
  }
  else
  {
    uint64_t v15 = 1;
  }

  id v16 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShowsVideoControls:0];
  [WeakRetained _updateCurrentPlaybackViewFrameForPlaybackInBackground:1 animated:v15];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_12_244;
  _OWORD v19[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v20, v16);
  [v9 executeBlockAfterCurrentStateTransition:v19];
  objc_destroyWeak(&v20);

  return @"Showing playback in background";
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_12_244(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = @"VUIMediaControllerIsPlayingFullscreenKey";
  id v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(WeakRetained, "isFullscreenPlaybackIntent"));
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"VUIMediaControllerForegroundStateDidChangeNotification" object:WeakRetained userInfo:v3];
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_13_245(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained player];
  id v6 = [v5 state];
  uint64_t v7 = [MEMORY[0x1E4FA9D88] playing];

  if (v6 != v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v8 = [WeakRetained player];
    [v8 play];
  }
  id v9 = [v3 currentState];

  return v9;
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_14_246(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained player];
  id v6 = [v5 state];
  uint64_t v7 = [MEMORY[0x1E4FA9D88] playing];

  if (v6 != v7)
  {
    id v8 = [WeakRetained player];
    [v8 play];
  }
  id v9 = [v3 currentState];

  return v9;
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_15_247(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_16_248;
  v14[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  [v9 executeBlockAfterCurrentStateTransition:v14];
  objc_destroyWeak(&v15);

  return @"Showing playback in background";
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_16_248(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v1 = [WeakRetained player];
  id v2 = [v1 state];
  id v3 = [MEMORY[0x1E4FA9D88] playing];

  if (v2 != v3)
  {
    id v4 = [WeakRetained player];
    [v4 play];
  }
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_17_249(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_18;
  v15[3] = &unk_1E6DF5490;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  id v13 = v9;
  id v16 = v13;
  [v13 executeBlockAfterCurrentStateTransition:v15];

  objc_destroyWeak(&v17);
  return @"Media controller waiting for timeout while paused";
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_18(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained player];
  uint64_t v5 = [v4 state];
  id v6 = [MEMORY[0x1E4FA9D88] paused];

  if (v5 != v6)
  {
    uint64_t v7 = [WeakRetained player];
    [v7 pause];

    id v8 = [WeakRetained pauseStateTimeoutTimer];
    [v8 invalidate];

    [WeakRetained setPauseStateTimeoutTimer:0];
    id v9 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_19;
    id v14 = &unk_1E6DF5CE8;
    objc_copyWeak(&v16, v2);
    id v15 = *(id *)(a1 + 32);
    id v10 = [v9 scheduledTimerWithTimeInterval:0 repeats:&v11 block:480.0];
    objc_msgSend(WeakRetained, "setPauseStateTimeoutTimer:", v10, v11, v12, v13, v14);

    objc_destroyWeak(&v16);
  }
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_19(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [WeakRetained name];
    uint64_t v5 = [*(id *)(a1 + 32) currentState];
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIMediaController::%@ timedout while waiting in pause state, current state %@", (uint8_t *)&v8, 0x16u);
  }
  id v6 = [*(id *)(a1 + 32) currentState];
  int v7 = [v6 isEqualToString:@"Media controller waiting for timeout while paused"];

  if (v7)
  {
    [WeakRetained setPlaybackStopReason:1];
    [WeakRetained setAutomaticPlaybackStop:1];
    [WeakRetained setVpafPlaybackStopReason:4];
    [*(id *)(a1 + 32) postEvent:@"Stop"];
  }
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_250(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained player];
  id v6 = [v5 state];
  int v7 = [MEMORY[0x1E4FA9D88] paused];

  if (v6 != v7)
  {
    int v8 = [WeakRetained player];
    [v8 pause];
  }
  id v9 = [v3 currentState];

  return v9;
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_251(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setPendingPlaylist:0];
  id v6 = [WeakRetained player];

  if (v6)
  {
    int v7 = [WeakRetained player];
    int v8 = [v7 state];
    id v9 = [MEMORY[0x1E4FA9D88] stopped];

    if (v8 != v9)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      __int16 v10 = [WeakRetained player];
      [v10 stop];
      goto LABEL_7;
    }
    id v18 = @"AnimatedKey";
    v19[0] = MEMORY[0x1E4F1CC38];
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v12 = v19;
    id v13 = &v18;
  }
  else
  {
    id v16 = @"AnimatedKey";
    uint64_t v17 = MEMORY[0x1E4F1CC38];
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v12 = &v17;
    id v13 = &v16;
  }
  __int16 v10 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
  [v4 postEvent:@"Finished playback" withContext:0 userInfo:v10];
LABEL_7:

  id v14 = [v4 currentState];

  return v14;
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_252(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = [v3 currentState];
  id v6 = [WeakRetained mediaInfo];
  int v7 = [v6 tvpPlaylist];

  if (v7)
  {
    if ([WeakRetained isBackgrounded])
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {

      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_253;
      v9[3] = &unk_1E6DF41E8;
      id v11 = *(id *)(a1 + 40);
      id v10 = v7;
      [v3 executeBlockAfterCurrentStateTransition:v9];

      uint64_t v5 = @"Waiting for player to start loading";
    }
  }

  return v5;
}

uint64_t __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_253(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_254(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_255;
  v4[3] = &unk_1E6DF3DD0;
  id v5 = *(id *)(a1 + 32);
  [a2 executeBlockAfterCurrentStateTransition:v4];

  return @"Showing playback in foreground";
}

uint64_t __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_255(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (TVPAVFPlayback)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (AVPlayerViewController)avPlayerViewController
{
  return self->_avPlayerViewController;
}

- (void)setAvPlayerViewController:(id)a3
{
}

- (VUIMediaInfo)mediaInfo
{
  return self->_mediaInfo;
}

- (VUIMediaControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIMediaControllerDelegate *)WeakRetained;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)allowsSkipping
{
  return self->_allowsSkipping;
}

- (void)setAllowsSkipping:(BOOL)a3
{
  self->_allowsSkipping = a3;
}

- (BOOL)shouldZoomWhenTransitioningToBackground
{
  return self->_shouldZoomWhenTransitioningToBackground;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isPlaybackEnabled
{
  return self->_playbackEnabled;
}

- (BOOL)shouldStopPlayerWhenViewDisappears
{
  return self->_stopPlayerWhenViewDisappears;
}

- (void)setStopPlayerWhenViewDisappears:(BOOL)a3
{
  self->_stopPlayerWhenViewDisappears = a3;
}

- (BOOL)clearPreviousImageBeforeLoading
{
  return self->_clearPreviousImageBeforeLoading;
}

- (void)setClearPreviousImageBeforeLoading:(BOOL)a3
{
  self->_clearPreviousImageBeforeLoading = a3;
}

- (BOOL)popWhenPlayerStops
{
  return self->_popWhenPlayerStops;
}

- (void)setPopWhenPlayerStops:(BOOL)a3
{
  self->_popWhenPlayerStops = a3;
}

- (BOOL)isRestoringAVPlayerController
{
  return self->_restoringAVPlayerController;
}

- (void)setRestoringAVPlayerController:(BOOL)a3
{
  self->_restoringAVPlayerController = a3;
}

- (BOOL)shouldStopWhenAnotherMediaControllerStarts
{
  return self->_stopWhenAnotherMediaControllerStarts;
}

- (void)setStopWhenAnotherMediaControllerStarts:(BOOL)a3
{
  self->_stopWhenAnotherMediaControllerStarts = a3;
}

- (BOOL)isAutomaticPlaybackStop
{
  return self->_automaticPlaybackStop;
}

- (void)setAutomaticPlaybackStop:(BOOL)a3
{
  self->_automaticPlaybackStop = a3;
}

- (unint64_t)vpafPlaybackStopReason
{
  return self->_vpafPlaybackStopReason;
}

- (void)setVpafPlaybackStopReason:(unint64_t)a3
{
  self->_vpafPlaybackStopReason = a3;
}

- (VUIImageView)proxyImageView
{
  return self->_proxyImageView;
}

- (void)setProxyImageView:(id)a3
{
}

- (VUIImageProxy)currentImageProxy
{
  return self->_currentImageProxy;
}

- (void)setCurrentImageProxy:(id)a3
{
}

- (UIViewController)playbackContainerController
{
  return self->_playbackContainerController;
}

- (void)setPlaybackContainerController:(id)a3
{
}

- (NSDate)playbackLoadingStartDate
{
  return self->_playbackLoadingStartDate;
}

- (void)setPlaybackLoadingStartDate:(id)a3
{
}

- (NSTimer)playbackLoadingTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackLoadingTimer);
  return (NSTimer *)WeakRetained;
}

- (void)setPlaybackLoadingTimer:(id)a3
{
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (TVPPlaylist)pendingPlaylist
{
  return self->_pendingPlaylist;
}

- (void)setPendingPlaylist:(id)a3
{
}

- (VUIImageProxy)pendingImageProxy
{
  return self->_pendingImageProxy;
}

- (void)setPendingImageProxy:(id)a3
{
}

- (BOOL)isPlayerReadyToBePlayed
{
  return self->_playerReadyToBePlayed;
}

- (void)setPlayerReadyToBePlayed:(BOOL)a3
{
  self->_playerReadyToBePlayed = a3;
}

- (unint64_t)imageAnimationOptions
{
  return self->_imageAnimationOptions;
}

- (void)setImageAnimationOptions:(unint64_t)a3
{
  self->_imageAnimationOptions = a3;
}

- (double)imageAnimationDuration
{
  return self->_imageAnimationDuration;
}

- (void)setImageAnimationDuration:(double)a3
{
  self->_imageAnimationDuration = a3;
}

- (double)imageTransitionInterval
{
  return self->_imageTransitionInterval;
}

- (void)setImageTransitionInterval:(double)a3
{
  self->_imageTransitionInterval = a3;
}

- (BOOL)shouldAnimateOverlayView
{
  return self->_shouldAnimateOverlayView;
}

- (void)setShouldAnimateOverlayView:(BOOL)a3
{
  self->_shouldAnimateOverlayView = a3;
}

- (double)overlayViewDisplayDuration
{
  return self->_overlayViewDisplayDuration;
}

- (void)setOverlayViewDisplayDuration:(double)a3
{
  self->_overlayViewDisplayDuration = a3;
}

- (BOOL)doesDelegateRespondToShowStill
{
  return self->_doesDelegateRespondToShowStill;
}

- (void)setDoesDelegateRespondToShowStill:(BOOL)a3
{
  self->_doesDelegateRespondToShowStill = a3;
}

- (BOOL)doesDelegateRespondToStateChange
{
  return self->_doesDelegateRespondToStateChange;
}

- (void)setDoesDelegateRespondToStateChange:(BOOL)a3
{
  self->_doesDelegateRespondToStateChange = a3;
}

- (int64_t)playbackStopReason
{
  return self->_playbackStopReason;
}

- (void)setPlaybackStopReason:(int64_t)a3
{
  self->_playbackStopReason = a3;
}

- (TVPVideoView)secondaryVideoView
{
  return self->_secondaryVideoView;
}

- (void)setSecondaryVideoView:(id)a3
{
}

- (NSTimer)pauseStateTimeoutTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pauseStateTimeoutTimer);
  return (NSTimer *)WeakRetained;
}

- (void)setPauseStateTimeoutTimer:(id)a3
{
}

- (BOOL)isAutomaticPlaybackStart
{
  return self->_automaticPlaybackStart;
}

- (void)setAutomaticPlaybackStart:(BOOL)a3
{
  self->_automaticPlaybackStart = a3;
}

- (unint64_t)vpafPlaybackStartReason
{
  return self->_vpafPlaybackStartReason;
}

- (void)setVpafPlaybackStartReason:(unint64_t)a3
{
  self->_vpafPlaybackStartReason = a3;
}

- (BOOL)shouldPlayAfterAppBecomesActive
{
  return self->_shouldPlayAfterAppBecomesActive;
}

- (void)setShouldPlayAfterAppBecomesActive:(BOOL)a3
{
  self->_shouldPlayAfterAppBecomesActive = a3;
}

- (BOOL)didWeCreatePlayer
{
  return self->_didWeCreatePlayer;
}

- (void)setDidWeCreatePlayer:(BOOL)a3
{
  self->_didWeCreatePlayer = a3;
}

- (BOOL)observingPictureInPictureActive
{
  return self->_observingPictureInPictureActive;
}

- (void)setObservingPictureInPictureActive:(BOOL)a3
{
  self->_observingPictureInPictureActive = a3;
}

- (NSString)titleForLogging
{
  return self->_titleForLogging;
}

- (void)setTitleForLogging:(id)a3
{
}

- (unint64_t)deactivationReasons
{
  return self->_deactivationReasons;
}

- (void)setDeactivationReasons:(unint64_t)a3
{
  self->_deactivationReasons = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleForLogging, 0);
  objc_destroyWeak((id *)&self->_pauseStateTimeoutTimer);
  objc_storeStrong((id *)&self->_secondaryVideoView, 0);
  objc_storeStrong((id *)&self->_pendingImageProxy, 0);
  objc_storeStrong((id *)&self->_pendingPlaylist, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_destroyWeak((id *)&self->_playbackLoadingTimer);
  objc_storeStrong((id *)&self->_playbackLoadingStartDate, 0);
  objc_storeStrong((id *)&self->_playbackContainerController, 0);
  objc_storeStrong((id *)&self->_currentImageProxy, 0);
  objc_storeStrong((id *)&self->_proxyImageView, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaInfo, 0);
  objc_storeStrong((id *)&self->_avPlayerViewController, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

- (void)_setPlaylist:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIMediaController::no playlist specified.", v1, 2u);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_196_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = VUIBoolLogString();
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1E2BD7000, a3, OS_LOG_TYPE_ERROR, "VUIMediaController::completed loading image proxy: [%@], finished: [%@]", (uint8_t *)&v6, 0x16u);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_199_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUIMediaController::failed to load image proxy with error: [%@]", (uint8_t *)&v3, 0xCu);
}

@end