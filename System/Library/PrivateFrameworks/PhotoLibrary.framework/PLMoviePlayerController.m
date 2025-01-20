@interface PLMoviePlayerController
+ (BOOL)_isNetworkSupportedPath:(id)a3;
+ (BOOL)_isStreamableAsset:(id)a3;
+ (id)AVAssetURLWithPath:(id)a3;
- (AVPlayer)player;
- (BOOL)TVOutEnabled;
- (BOOL)_allowsExternalPlayback;
- (BOOL)forceDisableTVOut;
- (BOOL)isActiveController;
- (BOOL)isExternalPlayback;
- (BOOL)isPreparedForPlayback;
- (BOOL)videoOutActive;
- (PLMoviePlayerController)init;
- (PLMoviePlayerControllerDelegate)delegate;
- (PLMoviePlayerView)view;
- (double)currentTime;
- (double)duration;
- (float)playbackRate;
- (id)_asset;
- (id)_playerKeysToObserve;
- (int64_t)externalPlaybackType;
- (unint64_t)bufferingState;
- (unint64_t)playbackState;
- (void)_didEnterBackgroundNotification:(id)a3;
- (void)_didLoadValueOfKey:(id)a3 forAsset:(id)a4;
- (void)_dispatchOnMainThreadWithBlock:(id)a3;
- (void)_displayVideoView;
- (void)_exitPlayer:(int)a3;
- (void)_loadAsset:(id)a3;
- (void)_pausePlaybackForNotification;
- (void)_playbackFailedWithError:(id)a3;
- (void)_playerItemDidReachEndNotification:(id)a3;
- (void)_playerItemFailedToPlayToEnd:(id)a3;
- (void)_playerItemFailedToPlayToEndNotification:(id)a3;
- (void)_playerRateDidChange:(id)a3;
- (void)_registerForNotifications;
- (void)_restoreTVOutVideoIfNecessary;
- (void)_screenDidConnect:(id)a3;
- (void)_screenDidDisconnect:(id)a3;
- (void)_serverConnectionDidDie:(id)a3;
- (void)_setBufferingState:(unint64_t)a3;
- (void)_setForceDisableTVOut:(BOOL)a3;
- (void)_setPlaybackState:(unint64_t)a3;
- (void)_setPlayerItem:(id)a3;
- (void)_setupPlayer;
- (void)_setupTVOutWindow;
- (void)_simpleRemoteNotification:(id)a3;
- (void)_streamBufferFull;
- (void)_streamLikelyToKeepUp;
- (void)_streamRanDry;
- (void)_streamUnlikelyToKeepUp;
- (void)_tearDownPlayer;
- (void)_tearDownTVOutWindow;
- (void)_unregisterForNotifications;
- (void)_updateBackgroundViewInformation;
- (void)_updateDisableAirPlayMirroringDuringPlayback;
- (void)_updateFromPendingTime;
- (void)_updateTVOutEnabled;
- (void)_willEnterForegroundNotification:(id)a3;
- (void)_willSuspendNotification:(id)a3;
- (void)dealloc;
- (void)didBecomeActiveController;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)pauseDueToInsufficientData;
- (void)play;
- (void)playDueToEnoughData;
- (void)playFromBeginning;
- (void)requestToBecomeActiveController;
- (void)requestToResignAsActiveController;
- (void)resetPlayer;
- (void)setCurrentTime:(double)a3;
- (void)setCurrentTime:(double)a3 timeSnapOption:(unint64_t)a4;
- (void)setCurrentTime:(double)a3 timeSnapOption:(unint64_t)a4 forceUpdate:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setIsActiveController:(BOOL)a3;
- (void)setPlayerItem:(id)a3 startTime:(double)a4;
- (void)setTVOutEnabled:(BOOL)a3;
- (void)stop;
- (void)willResignAsActiveController;
@end

@implementation PLMoviePlayerController

- (void)setIsActiveController:(BOOL)a3
{
  self->_isActiveController = a3;
}

- (BOOL)isActiveController
{
  return self->_isActiveController;
}

- (BOOL)isPreparedForPlayback
{
  return self->_isPreparedForPlayback;
}

- (BOOL)forceDisableTVOut
{
  return self->_forceDisableTVOut;
}

- (void)setTVOutEnabled:(BOOL)a3
{
  self->_TVOutEnabled = a3;
}

- (BOOL)TVOutEnabled
{
  return self->_TVOutEnabled;
}

- (unint64_t)playbackState
{
  return self->_playbackState;
}

- (unint64_t)bufferingState
{
  return self->_bufferingState;
}

- (AVPlayer)player
{
  return self->_player;
}

- (PLMoviePlayerView)view
{
  return self->_view;
}

- (PLMoviePlayerControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)_serverConnectionDidDie:(id)a3
{
  v4 = [(AVPlayer *)self->_player error];
  player = self->_player;
  if (player) {
    [(AVPlayer *)self->_player currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  Float64 Seconds = CMTimeGetSeconds(&time);
  NSLog(&cfstr_Serverconnecti.isa, v4, player, *(void *)&Seconds);
  [(PLMoviePlayerController *)self _exitPlayer:3];
}

- (void)_exitPlayer:(int)a3
{
  if (!self->_exited) {
    self->_exited = [(PLMoviePlayerControllerDelegate *)self->_delegate moviePlayerExitRequest:self exitReason:*(void *)&a3];
  }
}

- (void)_playbackFailedWithError:(id)a3
{
  if (self->_playbackState) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = !self->_isPreparedForPlayback;
  }
  [(PLMoviePlayerController *)self _setPlaybackState:3];
  if ([a3 code] != -11819)
  {
    v6 = (void *)[a3 domain];
    if ([v6 isEqualToString:*MEMORY[0x1E4F289A0]] && objc_msgSend(a3, "code") == -1013)
    {
      delegate = self->_delegate;
      [(PLMoviePlayerControllerDelegate *)delegate moviePlayerEncounteredAuthenticationError:self];
    }
    else if (!v5 {
           || [(PLMoviePlayerControllerDelegate *)self->_delegate moviePlayerShouldNotifyOnPreparationError:self])
    }
    {
      v8 = (id *)MEMORY[0x1E4F43630];
      if ([(id)*MEMORY[0x1E4F43630] applicationState] || objc_msgSend(*v8, "applicationState") == 2)
      {
        if (!v5)
        {
          pl_dispatch_async();
          [(PLMoviePlayerController *)self _setPlaybackState:0];
        }
      }
      else
      {
        v9 = (void *)[a3 localizedDescription];
        if ([v9 length])
        {
          PLLocalizedFrameworkString();
          v13 = v9;
          uint64_t v10 = PFStringWithValidatedFormat();
        }
        else
        {
          uint64_t v10 = PLLocalizedFrameworkString();
        }
        v11 = objc_msgSend(MEMORY[0x1E4F42728], "alertControllerWithTitle:message:preferredStyle:", v10, 0, 1, v13);
        objc_msgSend(v11, "addAction:", objc_msgSend(MEMORY[0x1E4F42720], "actionWithTitle:style:handler:", PLLocalizedFrameworkString(), 0, 0));
        v12 = (void *)[(PLMoviePlayerView *)[(PLMoviePlayerController *)self view] window];
        objc_msgSend(v12, "pl_presentViewController:animated:", v11, 1);
      }
    }
  }
}

uint64_t __52__PLMoviePlayerController__playbackFailedWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exitPlayer:3];
}

- (void)_playerItemFailedToPlayToEnd:(id)a3
{
  v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F16028]), "userInfo");
  if (objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E4F28A50]), "code") == -12926)
  {
    [(PLMoviePlayerController *)self pause];
  }
  else
  {
    BOOL v5 = [(AVPlayerItem *)self->_playerItem error];
    [(PLMoviePlayerController *)self _playbackFailedWithError:v5];
  }
}

- (void)_playerItemFailedToPlayToEndNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  [(PLMoviePlayerController *)self _playerItemFailedToPlayToEnd:v4];
}

- (void)_playerItemDidReachEndNotification:(id)a3
{
}

- (void)willResignAsActiveController
{
  [(PLMoviePlayerController *)self setIsActiveController:0];
  [(PLMoviePlayerControllerDelegate *)self->_delegate moviePlayerControllerWillResignAsActiveController:self];
  [(PLMoviePlayerController *)self _tearDownTVOutWindow];
  [(PLMoviePlayerController *)self _updateTVOutEnabled];
  [(PLMoviePlayerController *)self _updateDisableAirPlayMirroringDuringPlayback];
}

- (void)didBecomeActiveController
{
  [(PLMoviePlayerController *)self setIsActiveController:1];
  [(PLMoviePlayerControllerDelegate *)self->_delegate moviePlayerControllerDidBecomeActiveController:self];
  [(PLMoviePlayerController *)self _updateTVOutEnabled];
  [(PLMoviePlayerController *)self _updateDisableAirPlayMirroringDuringPlayback];
}

- (void)requestToResignAsActiveController
{
  v3 = +[PLMoviePlayerControllerManager sharedInstance];
  [(PLMoviePlayerControllerManager *)v3 removeControllerFromStack:self];
}

- (void)requestToBecomeActiveController
{
  v3 = +[PLMoviePlayerControllerManager sharedInstance];
  [(PLMoviePlayerControllerManager *)v3 moveControllerToTopOfStack:self];
}

- (void)_updateBackgroundViewInformation
{
  BOOL v3 = [(PLMoviePlayerController *)self _allowsExternalPlayback];
  BOOL v4 = [(PLMoviePlayerController *)self isExternalPlayback] && v3;
  if (self->_isExternalPlayback != v4) {
    self->_isExternalPlayback = v4;
  }
  if (v3 && [(AVPlayer *)self->_player externalPlaybackType] == 1)
  {
    uint64_t v5 = 1;
  }
  else if ([(PLMoviePlayerController *)self videoOutActive])
  {
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ([(PLMoviePlayerView *)self->_view destinationPlaceholderStyle] != v5)
  {
    delegate = self->_delegate;
    [(PLMoviePlayerControllerDelegate *)delegate moviePlayerUpdatedDestinationPlaceholder:self];
  }
}

- (int64_t)externalPlaybackType
{
  return [(AVPlayer *)self->_player externalPlaybackType];
}

- (BOOL)isExternalPlayback
{
  if ([(AVPlayer *)self->_player externalPlaybackType]) {
    return 1;
  }
  return [(PLMoviePlayerController *)self videoOutActive];
}

- (void)_updateDisableAirPlayMirroringDuringPlayback
{
  [(AVPlayer *)self->_player setAllowsExternalPlayback:[(PLMoviePlayerController *)self _allowsExternalPlayback]];
  player = self->_player;
  [(AVPlayer *)player setUsesExternalPlaybackWhileExternalScreenIsActive:1];
}

- (BOOL)_allowsExternalPlayback
{
  int v3 = [(PLMoviePlayerController *)self isActiveController];
  if (v3)
  {
    if (objc_opt_respondsToSelector())
    {
      delegate = self->_delegate;
      LOBYTE(v3) = [(PLMoviePlayerControllerDelegate *)delegate moviePlayerControllerShouldAllowExternalPlayback:self];
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_tearDownTVOutWindow
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__setupTVOutWindow object:0];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  [(PLTVOutWindow *)self->_tvOutWindow setHidden:1];

  self->_tvOutWindow = 0;
  unint64_t v4 = *MEMORY[0x1E4F43740];
  if (self->_backgroundTaskId != *MEMORY[0x1E4F43740])
  {
    objc_msgSend((id)*MEMORY[0x1E4F43630], "endBackgroundTask:");
    self->_backgroundTaskId = v4;
  }
}

- (void)_setupTVOutWindow
{
  tvOutWindow = self->_tvOutWindow;
  if (!tvOutWindow)
  {
    tvOutWindow = objc_alloc_init(PLTVOutWindow);
    self->_tvOutWindow = tvOutWindow;
  }
  if ([(PLTVOutWindow *)tvOutWindow setVideoView:[(PLMoviePlayerView *)self->_view videoView]])
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__tearDownTVOutWindow object:0];
    unint64_t v4 = self->_tvOutWindow;
    [(PLTVOutWindow *)v4 setHidden:0];
  }
  else
  {
    NSLog(&cfstr_ErrorSettingUp.isa);
  }
}

- (void)_displayVideoView
{
  BOOL TVOutEnabled = self->_TVOutEnabled;
  player = self->_player;
  if (TVOutEnabled)
  {
    [(AVPlayer *)player _setCALayerDestinationIsTVOut:1];
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__setupTVOutWindow object:0];
    [(PLMoviePlayerController *)self performSelector:sel__setupTVOutWindow withObject:0 afterDelay:0.0];
  }
  else
  {
    [(AVPlayer *)player _setCALayerDestinationIsTVOut:0];
    [(PLMoviePlayerView *)self->_view reattachVideoView];
  }
  [(PLMoviePlayerController *)self _updateBackgroundViewInformation];
}

- (void)_restoreTVOutVideoIfNecessary
{
  int v3 = [(PLMoviePlayerView *)self->_view videoView];
  if (v3)
  {
    unint64_t v4 = v3;
    if (![(UIView *)v3 superview]
      || ![(UIView *)v4 window]
      || self->_TVOutEnabled && (PLTVOutWindow *)[(UIView *)v4 window] != self->_tvOutWindow)
    {
      [(PLMoviePlayerController *)self _displayVideoView];
    }
  }
}

- (void)_updateTVOutEnabled
{
  if (self->_forceDisableTVOut) {
    int v3 = 0;
  }
  else {
    int v3 = MPTVOutCapabledAndPreferred();
  }
  if (self->_TVOutEnabled != v3)
  {
    self->_BOOL TVOutEnabled = v3;
    -[AVPlayer _setCALayerDestinationIsTVOut:](self->_player, "_setCALayerDestinationIsTVOut:");
    [(PLMoviePlayerController *)self _updateBackgroundViewInformation];
  }
}

- (void)_setForceDisableTVOut:(BOOL)a3
{
  if (self->_forceDisableTVOut != a3)
  {
    self->_forceDisableTVOut = a3;
    [(PLMoviePlayerController *)self _updateTVOutEnabled];
  }
}

- (BOOL)videoOutActive
{
  return MPTVOutCapabledAndPreferred();
}

- (void)_screenDidDisconnect:(id)a3
{
  [(PLMoviePlayerController *)self _updateTVOutEnabled];
  [(PLMoviePlayerController *)self _displayVideoView];
  [(PLMoviePlayerController *)self _updateDisableAirPlayMirroringDuringPlayback];
  [(PLMoviePlayerController *)self _updateBackgroundViewInformation];
}

- (void)_screenDidConnect:(id)a3
{
  [(PLMoviePlayerController *)self _updateTVOutEnabled];
  [(PLMoviePlayerController *)self _displayVideoView];
  [(PLMoviePlayerController *)self _updateDisableAirPlayMirroringDuringPlayback];
  [(PLMoviePlayerController *)self _updateBackgroundViewInformation];
}

- (void)_willEnterForegroundNotification:(id)a3
{
  [(PLMoviePlayerController *)self _displayVideoView];
  [(PLMoviePlayerController *)self _setForceDisableTVOut:0];
}

- (void)_didEnterBackgroundNotification:(id)a3
{
  if ((objc_msgSend((id)*MEMORY[0x1E4F43630], "isSuspendedUnderLock", a3) & 1) == 0)
  {
    [(PLMoviePlayerController *)self _setForceDisableTVOut:1];
  }
}

- (void)_willSuspendNotification:(id)a3
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__tearDownTVOutWindow object:0];
  [(PLMoviePlayerController *)self performSelector:sel__tearDownTVOutWindow withObject:0 afterDelay:0.0];
  unint64_t v4 = [(id)*MEMORY[0x1E4F43630] beginBackgroundTaskWithExpirationHandler:0];
  self->_backgroundTaskId = v4;
  if (v4 == *MEMORY[0x1E4F43740]) {
    NSLog(&cfstr_UnableToStartB.isa);
  }
  [(PLMoviePlayerController *)self _pausePlaybackForNotification];
}

- (void)_pausePlaybackForNotification
{
  if ((!MPTVOutCapabledAndPreferred()
     || ([(id)*MEMORY[0x1E4F43630] isSuspendedUnderLock] & 1) == 0)
    && ![(AVPlayer *)self->_player isExternalPlaybackActive]
    && self->_playbackState == 1)
  {
    [(PLMoviePlayerController *)self pause];
    delegate = self->_delegate;
    [(PLMoviePlayerControllerDelegate *)delegate moviePlayerWasSuspendedDuringPlayback:self];
  }
}

- (void)_simpleRemoteNotification:(id)a3
{
  unint64_t v4 = (void *)[a3 userInfo];
  switch(objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E4F436C0]), "unsignedIntValue"))
  {
    case 0u:
      delegate = self->_delegate;
      [(PLMoviePlayerControllerDelegate *)delegate moviePlayerHeadsetPlayPausePressed:self];
      break;
    case 1u:
      v6 = self->_delegate;
      [(PLMoviePlayerControllerDelegate *)v6 moviePlayerHeadsetNextTrackPressed:self];
      break;
    case 2u:
      v7 = self->_delegate;
      [(PLMoviePlayerControllerDelegate *)v7 moviePlayerHeadsetPreviousTrackPressed:self];
      break;
    case 5u:
      [(PLMoviePlayerController *)self stop];
      break;
    case 6u:
      [(PLMoviePlayerController *)self play];
      break;
    case 7u:
      [(PLMoviePlayerController *)self pause];
      break;
    default:
      return;
  }
}

- (void)_setPlaybackState:(unint64_t)a3
{
  unint64_t playbackState = self->_playbackState;
  if (a3 == 1 || playbackState)
  {
    if (playbackState != a3)
    {
      self->_unint64_t playbackState = a3;
      if (a3 == 1) {
        [(PLMoviePlayerController *)self _setBufferingState:self->_bufferingState & 0xFFFFFFFFFFFFFFFBLL];
      }
      [(PLMoviePlayerControllerDelegate *)self->_delegate moviePlayerPlaybackStateDidChange:self fromPlaybackState:playbackState];
      a3 = self->_playbackState;
    }
    if (a3 == 1)
    {
      [(PLMoviePlayerController *)self _restoreTVOutVideoIfNecessary];
    }
  }
}

- (void)_setBufferingState:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    unint64_t v11 = a3;
    _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) setting buffering state to %lu", (uint8_t *)&v10, 0xCu);
  }
  if ((a3 & 4) != 0)
  {
    a3 &= 0xFFFFFFFFFFFFFFF5;
  }
  else if (a3)
  {
    int v6 = objc_msgSend((id)objc_opt_class(), "_isStreamableAsset:", -[PLMoviePlayerController _asset](self, "_asset"));
    unint64_t v7 = a3 | 0xA;
    if (v6) {
      unint64_t v7 = a3;
    }
    a3 = v7 & 0xFFFFFFFFFFFFFFFBLL;
  }
  if (self->_bufferingState != a3)
  {
    v8 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t bufferingState = self->_bufferingState;
      int v10 = 134218240;
      unint64_t v11 = bufferingState;
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      _os_log_impl(&dword_1BEE94000, v8, OS_LOG_TYPE_DEFAULT, "(video-playback) buffering state changed from %lu to %lu", (uint8_t *)&v10, 0x16u);
    }
    self->_unint64_t bufferingState = a3;
    [(PLMoviePlayerControllerDelegate *)self->_delegate moviePlayerBufferingStateDidChange:self];
  }
}

- (void)_streamUnlikelyToKeepUp
{
}

- (void)_streamRanDry
{
}

- (void)_streamLikelyToKeepUp
{
}

- (void)_streamBufferFull
{
}

- (double)currentTime
{
  playerItem = self->_playerItem;
  if (playerItem) {
    [(AVPlayerItem *)playerItem currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  return CMTimeGetSeconds(&time);
}

- (float)playbackRate
{
  [(AVPlayer *)self->_player rate];
  return result;
}

- (double)duration
{
  id v2 = [(PLMoviePlayerController *)self _asset];
  if (v2) {
    [v2 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  return CMTimeGetSeconds(&time);
}

- (void)_updateFromPendingTime
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedUpdateFromPendingTime object:0];
  if (self->_hasPendingTime && self->_isPreparedForPlayback)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    if (self->_forceUpdateCurrentTime || !self->_isSeeking || (double v5 = Current - self->_lastSetCurrentTimeTime, v5 >= 0.5))
    {
      self->_hasPendingTime = 0;
      self->_forceUpdateCurrentTime = 0;
      self->_lastSetCurrentTimeTime = Current;
      self->_isSeeking = 1;
      memset(&v14, 0, sizeof(v14));
      CMTimeMakeWithSeconds(&v14, 0.0, 1000);
      memset(&v13, 0, sizeof(v13));
      CMTimeMakeWithSeconds(&v13, 0.0, 1000);
      unint64_t pendingTimeSnapOption = self->_pendingTimeSnapOption;
      if (pendingTimeSnapOption == 1)
      {
        CMTimeMakeWithSeconds(&v12, 2.0, 1000);
        CMTime v14 = v12;
        CMTimeMakeWithSeconds(&v12, 2.0, 1000);
        CMTime v13 = v12;
      }
      else if (!pendingTimeSnapOption)
      {
        CMTimeMakeWithSeconds(&v12, 2.0, 1000);
        CMTime v14 = v12;
      }
      memset(&v12, 0, sizeof(v12));
      double pendingTime = self->_pendingTime;
      if (fabs(pendingTime) == INFINITY) {
        CMTime v12 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
      }
      else {
        CMTimeMakeWithSeconds(&v12, pendingTime, 600);
      }
      player = self->_player;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __49__PLMoviePlayerController__updateFromPendingTime__block_invoke;
      v11[3] = &unk_1E63D2688;
      v11[4] = self;
      CMTime v10 = v12;
      CMTime v9 = v14;
      CMTime v8 = v13;
      [(AVPlayer *)player seekToTime:&v10 toleranceBefore:&v9 toleranceAfter:&v8 completionHandler:v11];
    }
    else
    {
      [(PLMoviePlayerController *)self performSelector:sel__delayedUpdateFromPendingTime withObject:0 afterDelay:0.5 - v5];
    }
  }
}

uint64_t __49__PLMoviePlayerController__updateFromPendingTime__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(result + 32) + 80) = 0;
  }
  return result;
}

- (void)setCurrentTime:(double)a3 timeSnapOption:(unint64_t)a4 forceUpdate:(BOOL)a5
{
  self->_hasPendingTime = 1;
  self->_double pendingTime = a3;
  self->_unint64_t pendingTimeSnapOption = a4;
  if (a5) {
    self->_forceUpdateCurrentTime = 1;
  }
  [(PLMoviePlayerController *)self _updateFromPendingTime];
}

- (void)setCurrentTime:(double)a3 timeSnapOption:(unint64_t)a4
{
}

- (void)setCurrentTime:(double)a3
{
}

- (void)resetPlayer
{
  [(PLMoviePlayerController *)self _tearDownPlayer];
  [(PLMoviePlayerController *)self _setupPlayer];
}

- (void)stop
{
  [(PLMoviePlayerController *)self _setPlaybackState:0];
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) calling _player pause in stop", v4, 2u);
  }
  [(AVPlayer *)self->_player pause];
}

- (void)pauseDueToInsufficientData
{
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) calling _player pauseDueToInsufficientData", v4, 2u);
  }
  [(AVPlayer *)self->_player pause];
}

- (void)pause
{
  [(PLMoviePlayerController *)self _setPlaybackState:2];
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) calling _player pause in pause", v4, 2u);
  }
  [(AVPlayer *)self->_player pause];
}

- (void)playDueToEnoughData
{
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) calling _player playDueToEnoughData", v4, 2u);
  }
  [(AVPlayer *)self->_player play];
}

- (void)playFromBeginning
{
  [(PLMoviePlayerController *)self setCurrentTime:0 timeSnapOption:1 forceUpdate:0.0];
  if ((objc_msgSend((id)objc_opt_class(), "_isStreamableAsset:", -[PLMoviePlayerController _asset](self, "_asset")) & 1) == 0)
  {
    [(PLMoviePlayerController *)self _setPlaybackState:1];
    Log = PLPhotoSharingGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v4 = 0;
      _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) calling _player play in playFromBeginning", v4, 2u);
    }
    [(AVPlayer *)self->_player play];
  }
}

- (void)play
{
  self->_forceUpdateCurrentTime = 1;
  [(PLMoviePlayerController *)self _updateFromPendingTime];
  if ((objc_msgSend((id)objc_opt_class(), "_isStreamableAsset:", -[PLMoviePlayerController _asset](self, "_asset")) & 1) == 0)
  {
    [(PLMoviePlayerController *)self _setPlaybackState:1];
    Log = PLPhotoSharingGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v4 = 0;
      _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) calling _player play", v4, 2u);
    }
    [(AVPlayer *)self->_player play];
  }
}

- (void)_playerRateDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v5 = (void *)[a3 objectForKey:*MEMORY[0x1E4F284E0]];
  float v6 = 0.0;
  float v7 = 0.0;
  if (v5 != (void *)[MEMORY[0x1E4F1CA98] null])
  {
    [v5 floatValue];
    float v7 = v8;
  }
  CMTime v9 = (void *)[a3 objectForKey:*MEMORY[0x1E4F284C8]];
  if (v9 != (void *)[MEMORY[0x1E4F1CA98] null])
  {
    [v9 floatValue];
    float v6 = v10;
  }
  if (v7 != v6) {
    [(PLMoviePlayerControllerDelegate *)self->_delegate moviePlayerPlaybackRateDidChange:self];
  }
  float v11 = fabsf(v7);
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = a3;
    _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) _playerRateDidChange %@", (uint8_t *)&v13, 0xCu);
  }
  if (v11 <= 0.00000011921 && fabsf(v6) > 0.00000011921) {
    [(PLMoviePlayerController *)self _setPlaybackState:1];
  }
}

- (void)_dispatchOnMainThreadWithBlock:(id)a3
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (a3)
    {
      unint64_t v4 = (void (*)(id))*((void *)a3 + 2);
      v4(a3);
    }
  }
  else
  {
    pl_dispatch_async();
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v17 = objc_opt_class();
    __int16 v18 = 2112;
    id v19 = a3;
    __int16 v20 = 2112;
    id v21 = a5;
    _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) %@ observeValueForKeyPath %@ %@", buf, 0x20u);
  }
  if (a6 == &ItemKeyContext)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__PLMoviePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v15[3] = &unk_1E63D2078;
    v15[4] = self;
    v15[5] = a4;
    v15[6] = a3;
    v15[7] = a5;
    CMTime v12 = v15;
LABEL_9:
    [(PLMoviePlayerController *)self _dispatchOnMainThreadWithBlock:v12];
    return;
  }
  if (a6 == &PlayerKeyContext)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__PLMoviePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v14[3] = &unk_1E63D2078;
    v14[4] = self;
    v14[5] = a4;
    v14[6] = a3;
    v14[7] = a5;
    CMTime v12 = v14;
    goto LABEL_9;
  }
  if (a6 == &ViewerKeyContext)
  {
    if ([a3 isEqualToString:@"readyForDisplay"]) {
      [(PLMoviePlayerControllerDelegate *)self->_delegate moviePlayerReadyToDisplay:self];
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLMoviePlayerController;
    [(PLMoviePlayerController *)&v13 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
  }
}

uint64_t __74__PLMoviePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 8) == *(void *)(result + 40))
  {
    v1 = (id *)result;
    if ([*(id *)(result + 48) isEqualToString:@"status"])
    {
      uint64_t v2 = [*((id *)v1[4] + 1) status];
      int v3 = v1[4];
      if (v2 == 1)
      {
        v3[114] = 1;
        [v1[4] _updateFromPendingTime];
        [v1[4] _setBufferingState:*((void *)v1[4] + 16) | 1];
        unint64_t v4 = (void *)*((void *)v1[4] + 15);
        return objc_msgSend(v4, "moviePlayerReadyToPlay:");
      }
      else
      {
        id v6 = v1[7];
        return [v3 _playerItemFailedToPlayToEnd:v6];
      }
    }
    else if ([v1[6] isEqualToString:@"playbackBufferEmpty"])
    {
      float result = objc_msgSend((id)objc_msgSend(v1[7], "objectForKey:", *MEMORY[0x1E4F284C8]), "BOOLValue");
      if (result)
      {
        id v5 = v1[4];
        return [v5 _streamRanDry];
      }
    }
    else if ([v1[6] isEqualToString:@"playbackBufferFull"])
    {
      float result = objc_msgSend((id)objc_msgSend(v1[7], "objectForKey:", *MEMORY[0x1E4F284C8]), "BOOLValue");
      if (result)
      {
        id v7 = v1[4];
        return [v7 _streamBufferFull];
      }
    }
    else
    {
      float result = [v1[6] isEqualToString:@"playbackLikelyToKeepUp"];
      if (result)
      {
        int v8 = objc_msgSend((id)objc_msgSend(v1[7], "objectForKey:", *MEMORY[0x1E4F284C8]), "BOOLValue");
        id v9 = v1[4];
        if (v8)
        {
          return [v9 _streamLikelyToKeepUp];
        }
        else
        {
          return [v9 _streamUnlikelyToKeepUp];
        }
      }
    }
  }
  return result;
}

uint64_t __74__PLMoviePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 16) == *(void *)(result + 40))
  {
    v1 = (id *)result;
    if ([*(id *)(result + 48) isEqualToString:@"rate"])
    {
      id v2 = v1[4];
      id v3 = v1[7];
      return [v2 _playerRateDidChange:v3];
    }
    else if ([v1[6] isEqualToString:@"status"])
    {
      float result = objc_msgSend((id)objc_msgSend(v1[7], "objectForKey:", *MEMORY[0x1E4F284C8]), "intValue");
      if (result == 2)
      {
        id v4 = v1[4];
        id v5 = v1[7];
        return [v4 _serverConnectionDidDie:v5];
      }
    }
    else
    {
      float result = [v1[6] isEqualToString:@"externalPlaybackActive"];
      if (result)
      {
        [v1[4] _updateBackgroundViewInformation];
        id v6 = (void *)*((void *)v1[4] + 15);
        return objc_msgSend(v6, "moviePlayerDidChangeExternalPlaybackType:");
      }
    }
  }
  return result;
}

- (void)_didLoadValueOfKey:(id)a3 forAsset:(id)a4
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if ([(PLMoviePlayerController *)self _asset] == a4)
    {
      v7[0] = 0;
      if ([a4 statusOfValueForKey:a3 error:v7] == 2)
      {
        if ([a3 isEqualToString:@"duration"]) {
          [(PLMoviePlayerControllerDelegate *)self->_delegate moviePlayerDurationAvailable:self];
        }
      }
      else
      {
        NSLog(&cfstr_CouldNotLoadVa.isa, a3, [v7[0] localizedDescription]);
      }
    }
  }
  else
  {
    v7[1] = (id)MEMORY[0x1E4F143A8];
    v7[2] = (id)3221225472;
    v7[3] = __55__PLMoviePlayerController__didLoadValueOfKey_forAsset___block_invoke;
    v7[4] = &unk_1E63D2700;
    v7[5] = self;
    v7[6] = a3;
    v7[7] = a4;
    pl_dispatch_async();
  }
}

uint64_t __55__PLMoviePlayerController__didLoadValueOfKey_forAsset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didLoadValueOfKey:*(void *)(a1 + 40) forAsset:*(void *)(a1 + 48)];
}

- (void)_loadAsset:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [&unk_1F1A1C720 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(&unk_1F1A1C720);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        uint64_t v12 = 0;
        if ([a3 statusOfValueForKey:v9 error:&v12] == 2)
        {
          [(PLMoviePlayerController *)self _didLoadValueOfKey:v9 forAsset:a3];
        }
        else
        {
          uint64_t v17 = v9;
          uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __38__PLMoviePlayerController__loadAsset___block_invoke;
          v11[3] = &unk_1E63D2700;
          v11[4] = self;
          void v11[5] = v9;
          v11[6] = a3;
          [a3 loadValuesAsynchronouslyForKeys:v10 completionHandler:v11];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [&unk_1F1A1C720 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v6);
  }
}

uint64_t __38__PLMoviePlayerController__loadAsset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didLoadValueOfKey:*(void *)(a1 + 40) forAsset:*(void *)(a1 + 48)];
}

- (void)_setPlayerItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  playerItem = self->_playerItem;
  if (playerItem != a3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F16020];
    uint64_t v7 = (void *)MEMORY[0x1E4F16030];
    if (playerItem)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v8 = [&unk_1F1A1C708 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(&unk_1F1A1C708);
            }
            [(AVPlayerItem *)self->_playerItem removeObserver:self forKeyPath:*(void *)(*((void *)&v22 + 1) + 8 * v11++) context:&ItemKeyContext];
          }
          while (v9 != v11);
          uint64_t v9 = [&unk_1F1A1C708 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v9);
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, *v6, self->_playerItem);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, *v7, self->_playerItem);
      playerItem = self->_playerItem;
    }

    uint64_t v12 = (AVPlayerItem *)a3;
    self->_playerItem = v12;
    if (v12)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v13 = [&unk_1F1A1C708 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v19;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v19 != v15) {
              objc_enumerationMutation(&unk_1F1A1C708);
            }
            [(AVPlayerItem *)self->_playerItem addObserver:self forKeyPath:*(void *)(*((void *)&v18 + 1) + 8 * v16++) options:3 context:&ItemKeyContext];
          }
          while (v14 != v16);
          uint64_t v14 = [&unk_1F1A1C708 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v14);
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel__playerItemDidReachEndNotification_, *v6, self->_playerItem);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel__playerItemFailedToPlayToEndNotification_, *v7, self->_playerItem);
      uint64_t v17 = self->_playerItem;
    }
    else
    {
      uint64_t v17 = 0;
    }
    [(AVPlayer *)self->_player replaceCurrentItemWithPlayerItem:v17];
    [(PLMoviePlayerController *)self _updateFromPendingTime];
  }
}

- (void)setPlayerItem:(id)a3 startTime:(double)a4
{
  if (self->_playerItem != a3)
  {
    self->_isPreparedForPlayback = 0;
    if (self->_playbackState == 1)
    {
      [(PLMoviePlayerController *)self _setPlaybackState:2];
      [(AVPlayer *)self->_player pause];
    }
    [(PLMoviePlayerController *)self _setBufferingState:0];
    [(PLMoviePlayerController *)self _setPlayerItem:a3];
    if (a3)
    {
      [(PLMoviePlayerController *)self _loadAsset:[(PLMoviePlayerController *)self _asset]];
      if (a4 != 0.0)
      {
        memset(&v13, 0, sizeof(v13));
        CMTimeMakeWithSeconds(&v13, a4, 600);
        player = self->_player;
        CMTime v12 = v13;
        long long v10 = *MEMORY[0x1E4F1FA48];
        uint64_t v11 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        long long v8 = v10;
        uint64_t v9 = v11;
        [(AVPlayer *)player seekToTime:&v12 toleranceBefore:&v10 toleranceAfter:&v8];
      }
    }
  }
}

- (id)_asset
{
  return [(AVPlayerItem *)self->_playerItem asset];
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = (PLMoviePlayerControllerDelegate *)a3;
    [(PLMoviePlayerController *)self _updateDisableAirPlayMirroringDuringPlayback];
    [(PLMoviePlayerController *)self _updateTVOutEnabled];
  }
}

- (void)_tearDownPlayer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(CALayer *)[(UIView *)[(PLMoviePlayerView *)self->_view videoView] layer] removeObserver:self forKeyPath:@"readyForDisplay" context:&ViewerKeyContext];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(PLMoviePlayerController *)self _playerKeysToObserve];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(AVPlayer *)self->_player removeObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * v7++) context:&PlayerKeyContext];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(AVPlayer *)self->_player pause];

  self->_player = 0;
}

- (void)_setupPlayer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_player = (AVPlayer *)objc_alloc_init(MEMORY[0x1E4F16608]);
  id v3 = (void *)[MEMORY[0x1E4F153E0] auxiliarySession];
  [v3 setCategory:*MEMORY[0x1E4F14F98] error:0];
  [(AVPlayer *)self->_player setAudioSession:v3];
  [(AVPlayer *)self->_player setExternalPlaybackVideoGravity:*MEMORY[0x1E4F15AF0]];
  [(AVPlayer *)self->_player setActionAtItemEnd:1];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(PLMoviePlayerController *)self _playerKeysToObserve];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(AVPlayer *)self->_player addObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) options:3 context:&PlayerKeyContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  [(PLMoviePlayerView *)self->_view setPlayer:self->_player];
  [(CALayer *)[(UIView *)[(PLMoviePlayerView *)self->_view videoView] layer] addObserver:self forKeyPath:@"readyForDisplay" options:5 context:&ViewerKeyContext];
  [(PLMoviePlayerController *)self _updateTVOutEnabled];
  [(PLMoviePlayerController *)self _updateDisableAirPlayMirroringDuringPlayback];
  [(PLMoviePlayerController *)self _updateBackgroundViewInformation];
}

- (id)_playerKeysToObserve
{
  return &unk_1F1A1C6F0;
}

- (void)_unregisterForNotifications
{
  [(id)*MEMORY[0x1E4F43630] endReceivingRemoteControlEvents];
  id v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

- (void)_registerForNotifications
{
  id v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__simpleRemoteNotification_ name:*MEMORY[0x1E4F436B8] object:0];
  [v3 addObserver:self selector:sel__willSuspendNotification_ name:*MEMORY[0x1E4F436E8] object:0];
  [v3 addObserver:self selector:sel__willBeginSuspendAnimationNotification_ name:*MEMORY[0x1E4F43F88] object:0];
  [v3 addObserver:self selector:sel__willResignNotification_ name:*MEMORY[0x1E4F43710] object:0];
  [v3 addObserver:self selector:sel__screenDidConnect_ name:*MEMORY[0x1E4F43CC0] object:0];
  [v3 addObserver:self selector:sel__screenDidDisconnect_ name:*MEMORY[0x1E4F43CC8] object:0];
  [v3 addObserver:self selector:sel__willEnterForegroundNotification_ name:*MEMORY[0x1E4F43708] object:0];
  [v3 addObserver:self selector:sel__didEnterBackgroundNotification_ name:*MEMORY[0x1E4F43660] object:0];
  id v4 = (void *)*MEMORY[0x1E4F43630];
  [v4 beginReceivingRemoteControlEvents];
}

- (void)dealloc
{
  [(PLMoviePlayerController *)self requestToResignAsActiveController];
  [(PLMoviePlayerController *)self _unregisterForNotifications];
  [(PLMoviePlayerController *)self _setPlayerItem:0];
  [(PLMoviePlayerController *)self _tearDownPlayer];

  self->_view = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLMoviePlayerController;
  [(PLMoviePlayerController *)&v3 dealloc];
}

- (PLMoviePlayerController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLMoviePlayerController;
  id v2 = [(PLMoviePlayerController *)&v5 init];
  if (v2)
  {
    objc_super v3 = [PLMoviePlayerView alloc];
    v2->_view = -[PLMoviePlayerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v2->_unint64_t playbackState = 0;
    v2->_lastSetCurrentTimeTime = -1.79769313e308;
    [(PLMoviePlayerController *)v2 _registerForNotifications];
    [(PLMoviePlayerController *)v2 _setupPlayer];
    [(PLMoviePlayerController *)v2 _updateTVOutEnabled];
    [(PLMoviePlayerController *)v2 _updateDisableAirPlayMirroringDuringPlayback];
    [(PLMoviePlayerController *)v2 _updateBackgroundViewInformation];
    v2->_backgroundTaskId = *MEMORY[0x1E4F43740];
  }
  return v2;
}

+ (BOOL)_isNetworkSupportedPath:(id)a3
{
  BOOL v4 = 1;
  if ([a3 compare:@"https://", 1, 0, objc_msgSend(@"https://", "length") options range])
  {
    return ![a3 compare:@"http://", 1, 0, objc_msgSend(@"http://", "length") options range]|| objc_msgSend(a3, "compare:options:range:", @"home-sharing://", 1, 0, objc_msgSend(@"home-sharing://", "length")) == 0;
  }
  return v4;
}

+ (BOOL)_isStreamableAsset:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "URL"), "absoluteString");
  return [a1 _isNetworkSupportedPath:v5];
}

+ (id)AVAssetURLWithPath:(id)a3
{
  return (id)[MEMORY[0x1E4F31828] URLFromPath:a3];
}

@end