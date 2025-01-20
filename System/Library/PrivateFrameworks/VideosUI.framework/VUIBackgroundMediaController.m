@interface VUIBackgroundMediaController
- (AVPlayerViewController)avPlayerViewController;
- (AVPlayerViewController)prefetchPlayerViewController;
- (BOOL)_autoPlayEnabled;
- (BOOL)_canPause;
- (BOOL)_currentMediaInfoContentMatchesMediaInfo:(id)a3;
- (BOOL)_currentMediaInfoImagesMatchesNewMediaInfoImage:(id)a3;
- (BOOL)_hasSecondaryView;
- (BOOL)_isViewInTopMostVisibleView;
- (BOOL)_mediaInfo:(id)a3 contentMatchesMediaInfo:(id)a4;
- (BOOL)_playlist:(id)a3 contentMatchesPlaylist:(id)a4;
- (BOOL)_shouldApplyLegibleContentInsetForState:(id)a3;
- (BOOL)_shouldPausePlaybackDueToDeactivationReasons;
- (BOOL)_shouldShowSecondaryView;
- (BOOL)allowsExternalPlayback;
- (BOOL)allowsPictureInPicturePlayback;
- (BOOL)animateImageChange;
- (BOOL)animateVideoChange;
- (BOOL)autoPlayInSharePlay;
- (BOOL)clearPreviousImageBeforeLoading;
- (BOOL)didAVPlayerControllerEnterFullscreen;
- (BOOL)didWeCreatePlayer;
- (BOOL)disableSupplementalSubtitle;
- (BOOL)exitsFullscreenWhenPlaybackEnds;
- (BOOL)forceAutoPlay;
- (BOOL)hasViewAppeared;
- (BOOL)isAutomaticPlaybackStart;
- (BOOL)isAutomaticPlaybackStop;
- (BOOL)isBackgrounded;
- (BOOL)isForeground;
- (BOOL)isMuted;
- (BOOL)isPlaybackEnabled;
- (BOOL)isPreloadPlaybackEnabled;
- (BOOL)isVideoFrameFallbackEnabled;
- (BOOL)keepVideoGravityUnchangedByVideoControlsVisibility;
- (BOOL)loadsPlayerWithFullscreenPlayback;
- (BOOL)mutePlaybackInBackground;
- (BOOL)observingInitialMediaItemHasCompletedInitialLoading;
- (BOOL)observingPictureInPictureActive;
- (BOOL)popWhenPlayerStops;
- (BOOL)prefersAudioOverPictureInPicture;
- (BOOL)prefetchesVideoFrame;
- (BOOL)recordPausedMediaEventAsStop;
- (BOOL)shouldAnimateOverlayView;
- (BOOL)shouldDisableSubtitle;
- (BOOL)shouldPauseAtEnd;
- (BOOL)shouldPlayAfterAppBecomesActive;
- (BOOL)shouldPlayAfterFullplaybackUIDidEnd;
- (BOOL)shouldShowFullScreenButton;
- (BOOL)shouldShowImageAndStopAfterPausingAtEnd;
- (BOOL)shouldStopPlayerWhenExitingFullScreen;
- (BOOL)shouldStopPlayerWhenViewDisappears;
- (BOOL)shouldStopWhenAnotherMediaControllerStarts;
- (BOOL)shouldUseForegroundAudioSessionInBackgroundMode;
- (BOOL)showsPlaybackControlsInForeground;
- (BOOL)showsVideoControls;
- (BOOL)stopsPlaybackWhenInactive;
- (BOOL)supportsMediaSharing;
- (BOOL)updatesNowPlayingInfoCenter;
- (CGRect)_playbackContainerViewFrame:(BOOL)a3 hasSecondaryVideoView:(BOOL)a4;
- (CGRect)_secondaryVideoViewFrame:(BOOL)a3;
- (NSArray)mediaInfos;
- (NSDate)playbackLoadingStartDate;
- (NSDate)playbackStartDate;
- (NSLayoutConstraint)proxyImageCenterXConstraint;
- (NSLayoutConstraint)proxyImageCenterYConstraint;
- (NSLayoutConstraint)proxyImageHeightConstraint;
- (NSLayoutConstraint)proxyImageWidthConstraint;
- (NSNumber)elapsedTimeWhenStopped;
- (NSNumber)pendingAnimated;
- (NSNumber)prefersAudioDescriptions;
- (NSString)lastMediaEventActionType;
- (NSString)name;
- (NSString)playbackInitiatorForRTCReporting;
- (NSString)preferredAudioLanguageCode;
- (NSString)titleForLogging;
- (NSString)videoGravity;
- (NSTimer)imageDelayTimer;
- (NSTimer)pauseStateTimeoutTimer;
- (NSTimer)playbackDelayTimer;
- (NSTimer)playbackLoadingTimer;
- (TVPPlayer)player;
- (TVPPlayer)prefetchPlayer;
- (TVPPlayer)rampDownPlayer;
- (TVPStateMachine)stateMachine;
- (TVPVideoView)secondaryVideoView;
- (UIEdgeInsets)legibleContentInsets;
- (UIViewController)playbackContainerController;
- (VUIBackgroundMediaController)init;
- (VUIBackgroundMediaController)initWithCoder:(id)a3;
- (VUIBackgroundMediaController)initWithName:(id)a3;
- (VUIBackgroundMediaController)initWithName:(id)a3 mediaInfoFetchController:(id)a4;
- (VUIBackgroundMediaController)initWithNibName:(id)a3 bundle:(id)a4;
- (VUIImageProxy)alphaImageProxy;
- (VUIImageView)alphaProxyImageView;
- (VUIImageView)proxyImageView;
- (VUIMediaInfo)currentMediaInfo;
- (VUIMediaInfo)pendingMediaInfo;
- (VUIMediaInfoFetchController)mediaInfoFetchController;
- (VUIPlayer)activePIPingPlayer;
- (double)_computedPlaybackDelayInterval;
- (double)_secondaryVideoViewHeight;
- (double)imageAnimationDuration;
- (double)imageTransitionAnimationDuration;
- (double)imageTransitionInterval;
- (double)imageVideoTransitionAnimationDuration;
- (double)playbackStartDelay;
- (double)playbackStopDelay;
- (double)videoAudioRampDuration;
- (double)volumeTransitionAnimationDuration;
- (float)backgroundVolume;
- (float)foregroundVolume;
- (float)fullscreenTransitionVolumeAnimationChanges;
- (id)_activePIPPlayer;
- (id)_createPlayerViewController;
- (id)createTransitionViewAtIndex:(unint64_t)a3 oldView:(id)a4;
- (id)surrenderCurrentPlayer;
- (unint64_t)_flippedDirection:(unint64_t)a3 isRTL:(BOOL)a4;
- (unint64_t)deactivationReasons;
- (unint64_t)imageAnimationOptions;
- (unint64_t)imageContentMode;
- (unint64_t)imageSwappingAnimationType;
- (unint64_t)lastMediaInfoIndex;
- (unint64_t)mediaInfoIndex;
- (unint64_t)numberOfVolumeIncrements;
- (unint64_t)pendingMediaInfoDirection;
- (unint64_t)playbackStopDelayReasons;
- (unint64_t)state;
- (unint64_t)videoSwappingAnimationType;
- (unint64_t)vpafPlaybackStartReason;
- (unint64_t)vpafPlaybackStopReason;
- (void)_addAlphaProxyImageViewIfNeeded;
- (void)_addContentViewIfNeeded;
- (void)_addOverlayViewAnimatedIfNeeded:(BOOL)a3 dismissAfter:(double)a4;
- (void)_addPlaybackViewControllerForPlayback:(BOOL)a3 restoringAVPlayerViewController:(BOOL)a4;
- (void)_addProxyImageView:(id)a3;
- (void)_animateTransitionFromView:(id)a3 toView:(id)a4 duration:(double)a5 direction:(unint64_t)a6 completion:(id)a7;
- (void)_applicationDidRemoveDeactivationReason:(id)a3;
- (void)_applicationWillAddDeactivationReason:(id)a3;
- (void)_cleanUpEverything;
- (void)_cleanUpEverythingPlaybackRelated;
- (void)_cleanUpPlaybackTimers;
- (void)_cleanUpRampDownPlayer;
- (void)_cleanupPIPPlayback;
- (void)_cleanupPrefetchPlayback;
- (void)_clearPreloadPlayback;
- (void)_configureAudioSession;
- (void)_configureAudioSessionForState:(id)a3;
- (void)_configureLegibleContentInsetFromState:(id)a3 toState:(id)a4;
- (void)_configurePlayerViewController:(id)a3;
- (void)_constrainToView:(id)a3;
- (void)_didPlayMediaItemToEnd:(id)a3;
- (void)_disablePlaybackWhenShowingFullScreenUIIfNeeded;
- (void)_disableSubtitleIfNeeded;
- (void)_enablePlaybackWhenFullScreenPlaybackEnd;
- (void)_externalPlaybackStateChanged:(id)a3;
- (void)_handleApplicationDidBecomeActiveNotification:(id)a3;
- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3;
- (void)_handleApplicationWillResignActiveNotification:(id)a3;
- (void)_handleNavigationControllerDidShow;
- (void)_handlePlaybackManagerUIDidChange;
- (void)_handleViewDisappear;
- (void)_loadImage:(id)a3;
- (void)_mediaControllerStartedPlayback:(id)a3;
- (void)_notifyAVPlayerViewControllerDisplaySize;
- (void)_observeModalNavigationControllerNotifications;
- (void)_performPlayerVolumeAnimatedUpdate:(BOOL)a3;
- (void)_pipPlaybackDidChangeMutedState;
- (void)_pipPlaybackStateChanged:(id)a3;
- (void)_playbackErrorDidOccur:(id)a3;
- (void)_playbackStateChanged:(id)a3;
- (void)_playbackStateWillChange:(id)a3;
- (void)_populatePlayerWithMediaItemsIfNeeded:(id)a3;
- (void)_postDidStopPlaybackNotification;
- (void)_postWillStartPlaybackNotification:(BOOL)a3;
- (void)_postWillStopPlaybackNotification;
- (void)_prefetchNextVideo;
- (void)_recordBgAutoPlayMediaEventForPlaybackState:(id)a3;
- (void)_registerAudioSessionNotification;
- (void)_registerForApplicationStateNotifications;
- (void)_registerPlaybackManagerNotification;
- (void)_registerPlayerNotifications;
- (void)_registerStateMachineHandlers;
- (void)_removeOverlayView:(id)a3 animated:(BOOL)a4;
- (void)_removePlaybackViewController;
- (void)_removeProxyImageView;
- (void)_setAlphaImageProxy:(id)a3;
- (void)_showPlaybackIfPossible;
- (void)_startPreloadPlaybackIfNeeded;
- (void)_stateDidChangeFromState:(id)a3 toState:(id)a4 onEvent:(id)a5 context:(id)a6 userInfo:(id)a7;
- (void)_swapActiveMedia:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_transitionToNewImage:(id)a3 animated:(BOOL)a4 direction:(unint64_t)a5 completion:(id)a6;
- (void)_unregisterPlayerNotifications;
- (void)_updateAVPlayerViewControllerWithAVPlayerForPlayer:(id)a3;
- (void)_updateCurrentPlaybackViewFrameForPlaybackInBackground:(BOOL)a3 animated:(BOOL)a4;
- (void)_updatePlayerMuteStateForBackgroundPlaybackWithReason:(id)a3;
- (void)_updatePlayerVolume:(id)a3;
- (void)_updateVideoPlayerLegibleContentInsets:(BOOL)a3;
- (void)_updateWithMediaInfo:(id)a3 withDirection:(unint64_t)a4 imageVideoSwapBehavior:(unint64_t)a5 animated:(BOOL)a6;
- (void)adoptAVPlayerViewController:(id)a3 player:(id)a4;
- (void)appendMediaInfos:(id)a3;
- (void)dealloc;
- (void)loadAlphaImageProxy;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)playBackManagerFullscreenPlaybackUIDidChangeNotification:(id)a3;
- (void)playbackManagerShowingExtrasDidChangeNotification:(id)a3;
- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4;
- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4;
- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)playerViewControllerDidStartPictureInPicture:(id)a3;
- (void)playerViewControllerDidStopPictureInPicture:(id)a3;
- (void)removeMediaInfoAtIndex:(unint64_t)a3;
- (void)replay;
- (void)setActivePIPingPlayer:(id)a3;
- (void)setAllowsExternalPlayback:(BOOL)a3;
- (void)setAllowsPictureInPicturePlayback:(BOOL)a3;
- (void)setAlphaImageProxy:(id)a3;
- (void)setAlphaProxyImageView:(id)a3;
- (void)setAnimateImageChange:(BOOL)a3;
- (void)setAnimateVideoChange:(BOOL)a3;
- (void)setAutoPlayInSharePlay:(BOOL)a3;
- (void)setAutomaticPlaybackStart:(BOOL)a3;
- (void)setAutomaticPlaybackStop:(BOOL)a3;
- (void)setAvPlayerViewController:(id)a3;
- (void)setBackgroundVolume:(float)a3;
- (void)setClearPreviousImageBeforeLoading:(BOOL)a3;
- (void)setControlsVisible:(BOOL)a3;
- (void)setDeactivationReasons:(unint64_t)a3;
- (void)setDidAVPlayerControllerEnterFullscreen:(BOOL)a3;
- (void)setDidWeCreatePlayer:(BOOL)a3;
- (void)setDisableSupplementalSubtitle:(BOOL)a3;
- (void)setElapsedTimeWhenStopped:(id)a3;
- (void)setExitsFullscreenWhenPlaybackEnds:(BOOL)a3;
- (void)setForceAutoPlay:(BOOL)a3;
- (void)setForegroundVolume:(float)a3;
- (void)setFullscreenTransitionVolumeAnimationChanges:(float)a3;
- (void)setHasViewAppeared:(BOOL)a3;
- (void)setImageAnimationDuration:(double)a3;
- (void)setImageAnimationOptions:(unint64_t)a3;
- (void)setImageContentMode:(unint64_t)a3;
- (void)setImageDelayTimer:(id)a3;
- (void)setImageSwappingAnimationType:(unint64_t)a3;
- (void)setImageTransitionAnimationDuration:(double)a3;
- (void)setImageTransitionInterval:(double)a3;
- (void)setImageVideoTransitionAnimationDuration:(double)a3;
- (void)setKeepVideoGravityUnchangedByVideoControlsVisibility:(BOOL)a3;
- (void)setLastMediaEventActionType:(id)a3;
- (void)setLastMediaInfoIndex:(unint64_t)a3;
- (void)setLegibleContentInsets:(UIEdgeInsets)a3;
- (void)setLoadsPlayerWithFullscreenPlayback:(BOOL)a3;
- (void)setMediaInfo:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)setMediaInfoFetchController:(id)a3;
- (void)setMediaInfoIndex:(unint64_t)a3;
- (void)setMediaInfoIndex:(unint64_t)a3 forwardAnimation:(BOOL)a4;
- (void)setMediaInfoIndex:(unint64_t)a3 imageVideoSwapBehavior:(unint64_t)a4 animated:(BOOL)a5;
- (void)setMediaInfoIndex:(unint64_t)a3 imageVideoSwapBehavior:(unint64_t)a4 animated:(BOOL)a5 forwardAnimation:(BOOL)a6;
- (void)setMediaInfos:(id)a3;
- (void)setMediaInfos:(id)a3 animated:(BOOL)a4;
- (void)setMediaInfos:(id)a3 selectedIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)setMutePlaybackInBackground:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setNumberOfVolumeIncrements:(unint64_t)a3;
- (void)setObservingInitialMediaItemHasCompletedInitialLoading:(BOOL)a3;
- (void)setObservingPictureInPictureActive:(BOOL)a3;
- (void)setPauseStateTimeoutTimer:(id)a3;
- (void)setPendingAnimated:(id)a3;
- (void)setPendingMediaInfo:(id)a3;
- (void)setPendingMediaInfoDirection:(unint64_t)a3;
- (void)setPlaybackContainerController:(id)a3;
- (void)setPlaybackDelayTimer:(id)a3;
- (void)setPlaybackEnabled:(BOOL)a3;
- (void)setPlaybackEnabled:(BOOL)a3 imageVideoSwapBehavior:(unint64_t)a4;
- (void)setPlaybackInitiatorForRTCReporting:(id)a3;
- (void)setPlaybackLoadingStartDate:(id)a3;
- (void)setPlaybackLoadingTimer:(id)a3;
- (void)setPlaybackStartDate:(id)a3;
- (void)setPlaybackStartDelay:(double)a3;
- (void)setPlaybackStopDelay:(double)a3;
- (void)setPlaybackStopDelayReasons:(unint64_t)a3;
- (void)setPlayer:(id)a3;
- (void)setPopWhenPlayerStops:(BOOL)a3;
- (void)setPreferredAudioLanguageCode:(id)a3;
- (void)setPrefersAudioDescriptions:(id)a3;
- (void)setPrefersAudioOverPictureInPicture:(BOOL)a3;
- (void)setPrefetchPlayer:(id)a3;
- (void)setPrefetchPlayerViewController:(id)a3;
- (void)setPrefetchesVideoFrame:(BOOL)a3;
- (void)setPreloadPlaybackEnabled:(BOOL)a3;
- (void)setProxyImageCenterXConstraint:(id)a3;
- (void)setProxyImageCenterYConstraint:(id)a3;
- (void)setProxyImageHeightConstraint:(id)a3;
- (void)setProxyImageView:(id)a3;
- (void)setProxyImageWidthConstraint:(id)a3;
- (void)setRampDownPlayer:(id)a3;
- (void)setRecordPausedMediaEventAsStop:(BOOL)a3;
- (void)setSecondaryVideoView:(id)a3;
- (void)setShouldAnimateOverlayView:(BOOL)a3;
- (void)setShouldDisableSubtitle:(BOOL)a3;
- (void)setShouldPauseAtEnd:(BOOL)a3;
- (void)setShouldPlayAfterAppBecomesActive:(BOOL)a3;
- (void)setShouldPlayAfterFullplaybackUIDidEnd:(BOOL)a3;
- (void)setShouldShowFullScreenButton:(BOOL)a3;
- (void)setShouldShowImageAndStopAfterPausingAtEnd:(BOOL)a3;
- (void)setShowsPlaybackControlsInForeground:(BOOL)a3;
- (void)setShowsVideoControls:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateMachine:(id)a3;
- (void)setStopPlayerWhenExitingFullScreen:(BOOL)a3;
- (void)setStopPlayerWhenViewDisappears:(BOOL)a3;
- (void)setStopWhenAnotherMediaControllerStarts:(BOOL)a3;
- (void)setStopsPlaybackWhenInactive:(BOOL)a3;
- (void)setSupportsMediaSharing:(BOOL)a3;
- (void)setTitleForLogging:(id)a3;
- (void)setUpdatesNowPlayingInfoCenter:(BOOL)a3;
- (void)setUseForegroundAudioSessionInBackgroundMode:(BOOL)a3;
- (void)setVideoAudioRampDuration:(double)a3;
- (void)setVideoFrameFallbackEnabled:(BOOL)a3;
- (void)setVideoGravity:(id)a3;
- (void)setVideoSwappingAnimationType:(unint64_t)a3;
- (void)setVolumeTransitionAnimationDuration:(double)a3;
- (void)setVpafPlaybackStartReason:(unint64_t)a3;
- (void)setVpafPlaybackStopReason:(unint64_t)a3;
- (void)showAlphaImage:(BOOL)a3 animated:(BOOL)a4;
- (void)stop;
- (void)transitionToForeground:(BOOL)a3 animated:(BOOL)a4;
- (void)transitionToForeground:(BOOL)a3 withPlaybackControls:(BOOL)a4 animated:(BOOL)a5;
- (void)transitionToForeground:(BOOL)a3 withPlaybackControls:(BOOL)a4 fullScreenPlayer:(BOOL)a5 animated:(BOOL)a6;
- (void)transitionToFullScreenAnimated:(BOOL)a3;
- (void)updateAudioMuteWithPIPingPlayback;
- (void)updateFrames;
- (void)vui_viewDidLoad;
- (void)vui_viewWillAppear:(BOOL)a3;
- (void)vui_viewWillDisappear:(BOOL)a3;
@end

@implementation VUIBackgroundMediaController

- (VUIBackgroundMediaController)init
{
  return [(VUIBackgroundMediaController *)self initWithName:@"background media controller"];
}

- (VUIBackgroundMediaController)initWithCoder:(id)a3
{
  return [(VUIBackgroundMediaController *)self initWithName:@"background media controller"];
}

- (VUIBackgroundMediaController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(VUIBackgroundMediaController *)self initWithName:@"background media controller", a4];
}

- (VUIBackgroundMediaController)initWithName:(id)a3 mediaInfoFetchController:(id)a4
{
  id v7 = a4;
  v8 = [(VUIBackgroundMediaController *)self initWithName:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_mediaInfoFetchController, a4);
  }

  return v9;
}

- (VUIBackgroundMediaController)initWithName:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)VUIBackgroundMediaController;
  v5 = [(VUIBackgroundMediaController *)&v28 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    v5->_shouldAnimateOverlayView = 1;
    v5->_stopPlayerWhenViewDisappears = 1;
    v5->_stopPlayerWhenExitingFullScreen = 1;
    v5->_exitsFullscreenWhenPlaybackEnds = 1;
    v5->_clearPreviousImageBeforeLoading = 1;
    v5->_stopWhenAnotherMediaControllerStarts = 1;
    v5->_loadsPlayerWithFullscreenPlayback = 0;
    v5->_muted = 0;
    v5->_mutePlaybackInBackground = 1;
    v5->_useForegroundAudioSessionInBackgroundMode = 0;
    v5->_didAVPlayerControllerEnterFullscreen = 0;
    v5->_animateImageChange = 1;
    v5->_animateVideoChange = 1;
    v5->_shouldPauseAtEnd = 0;
    v5->_shouldShowImageAndStopAfterPausingAtEnd = 0;
    v5->_imageSwappingAnimationType = 1;
    v5->_videoSwappingAnimationType = 1;
    v5->_playbackStopDelayReasons = 0;
    v5->_playbackStopDelay = 0.5;
    v5->_prefetchesVideoFrame = 0;
    v5->_videoAudioRampDuration = 0.0;
    v5->_allowsExternalPlayback = 0;
    v5->_playbackStartDelay = 5.0;
    v5->_imageAnimationDuration = 0.75;
    v5->_imageTransitionAnimationDuration = 0.5;
    v5->_imageVideoTransitionAnimationDuration = 0.5;
    v5->_backgroundVolume = -1.0;
    v5->_foregroundVolume = -1.0;
    v5->_volumeTransitionAnimationDuration = 2.0;
    v5->_numberOfVolumeIncrements = 5;
    v5->_fullscreenTransitionVolumeAnimationChanges = -1.0;
    v5->_imageAnimationOptions = 5243008;
    v5->_state = 0;
    id v7 = (VUIImageView *)objc_alloc_init(MEMORY[0x1E4FB3CE0]);
    proxyImageView = v6->_proxyImageView;
    v6->_proxyImageView = v7;

    v6->_preloadPlaybackEnabled = 0;
    v9 = objc_alloc_init(VUIMediaInfoFetchController);
    mediaInfoFetchController = v6->_mediaInfoFetchController;
    v6->_mediaInfoFetchController = v9;

    v6->_mediaInfoIndex = 0;
    v6->_lastMediaInfoIndex = 0;
    v6->_imageContentMode = 2;
    v6->_shouldShowFullScreenButton = 1;
    v6->_hasViewAppeared = 0;
    v6->_forceAutoPlay = 0;
    v6->_autoPlayInSharePlay = 0;
    v6->_stopsPlaybackWhenInactive = 1;
    v6->_allowsPictureInPicturePlayback = 0;
    v6->_prefersAudioOverPictureInPicture = 0;
    objc_storeStrong((id *)&v6->_playbackInitiatorForRTCReporting, @"background");
    v6->_recordPausedMediaEventAsStop = 1;
    v6->_supportsMediaSharing = 0;
    long long v11 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&v6->_legibleContentInsets.top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&v6->_legibleContentInsets.bottom = v11;
    v6->_shouldDisableSubtitle = 0;
    v6->_disableSupplementalSubtitle = 0;
    v6->_showsPlaybackControlsInForeground = 0;
    objc_storeStrong((id *)&v6->_videoGravity, (id)*MEMORY[0x1E4F15AF8]);
    v6->_updatesNowPlayingInfoCenter = 0;
    [(VUIBackgroundMediaController *)v6 _registerForApplicationStateNotifications];
    [(VUIBackgroundMediaController *)v6 _registerPlaybackManagerNotification];
    [(VUIBackgroundMediaController *)v6 _registerAudioSessionNotification];
    objc_initWeak(&location, v6);
    uint64_t v12 = initWithName__instanceNumber_0++;
    uint64_t v13 = [NSString stringWithFormat:@"%@(%ld)", v4, v12];
    name = v6->_name;
    v6->_name = (NSString *)v13;

    id v15 = objc_alloc(MEMORY[0x1E4FA9DA8]);
    v16 = v6->_name;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __45__VUIBackgroundMediaController_initWithName___block_invoke;
    v25[3] = &unk_1E6DF6220;
    objc_copyWeak(&v26, &location);
    uint64_t v17 = [v15 initWithName:v16 initialState:@"Not doing anything" mode:0 stateChangeHandler:v25];
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = (TVPStateMachine *)v17;

    v19 = v6->_stateMachine;
    v20 = VUIDefaultLogObject();
    [(TVPStateMachine *)v19 setLogObject:v20];

    [(TVPStateMachine *)v6->_stateMachine setCallsStateChangeHandlerSynchronously:1];
    [(VUIBackgroundMediaController *)v6 _registerStateMachineHandlers];
    [(TVPStateMachine *)v6->_stateMachine setShouldAcceptEvents:1];
    v21 = +[VUIPlaybackManager sharedInstance];
    LODWORD(v19) = [v21 isPIPing];

    if (v19) {
      [(VUIBackgroundMediaController *)v6 updateAudioMuteWithPIPingPlayback];
    }
    v22 = VUIDefaultLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v6->_name;
      *(_DWORD *)buf = 134218242;
      v30 = v6;
      __int16 v31 = 2112;
      v32 = v23;
      _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) finished creating media controller.", buf, 0x16u);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __45__VUIBackgroundMediaController_initWithName___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  long long v11 = (id *)(a1 + 32);
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
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(VUIBackgroundMediaController *)self setActivePIPingPlayer:0];
  v3 = [(VUIBackgroundMediaController *)self prefetchPlayer];

  if (v3)
  {
    id v4 = [(VUIBackgroundMediaController *)self prefetchPlayer];
    [v4 removeObserver:self forKeyPath:@"avPlayer" context:__PlayerAVPlayerKVOContext_1];

    [(VUIBackgroundMediaController *)self _cleanupPrefetchPlayback];
  }
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  [(VUIBackgroundMediaController *)self setVideoAudioRampDuration:0.0];
  [(VUIBackgroundMediaController *)self _cleanUpEverything];
  v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(VUIBackgroundMediaController *)self name];
    *(_DWORD *)buf = 134218498;
    v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 1024;
    int v14 = [MEMORY[0x1E4F29060] isMainThread];
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) dealloc cleaning up, isMainThread=%d", buf, 0x1Cu);
  }
  v8.receiver = self;
  v8.super_class = (Class)VUIBackgroundMediaController;
  [(VUIBackgroundMediaController *)&v8 dealloc];
}

- (void)vui_viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)VUIBackgroundMediaController;
  [(VUIBackgroundMediaController *)&v5 vui_viewDidLoad];
  v3 = [(VUIBackgroundMediaController *)self vuiView];
  [v3 setVuiClipsToBounds:1];

  id v4 = [(VUIBackgroundMediaController *)self proxyImageView];
  [(VUIBackgroundMediaController *)self _addProxyImageView:v4];

  [(VUIBackgroundMediaController *)self _observeModalNavigationControllerNotifications];
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(VUIBackgroundMediaController *)self name];
    *(_DWORD *)buf = 136315650;
    v9 = "-[VUIBackgroundMediaController vui_viewWillDisappear:]";
    __int16 v10 = 2048;
    __int16 v11 = self;
    __int16 v12 = 2112;
    __int16 v13 = v6;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::%s (%p: %@)", buf, 0x20u);
  }
  v7.receiver = self;
  v7.super_class = (Class)VUIBackgroundMediaController;
  [(VUIBackgroundMediaController *)&v7 vui_viewWillDisappear:v3];
  [(VUIBackgroundMediaController *)self setHasViewAppeared:0];
  [(VUIBackgroundMediaController *)self _handleViewDisappear];
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(VUIBackgroundMediaController *)self name];
    *(_DWORD *)buf = 136315650;
    v9 = "-[VUIBackgroundMediaController vui_viewWillAppear:]";
    __int16 v10 = 2048;
    __int16 v11 = self;
    __int16 v12 = 2112;
    __int16 v13 = v6;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::%s (%p: %@)", buf, 0x20u);
  }
  v7.receiver = self;
  v7.super_class = (Class)VUIBackgroundMediaController;
  [(VUIBackgroundMediaController *)&v7 vui_viewWillAppear:v3];
  [(VUIBackgroundMediaController *)self setHasViewAppeared:1];
}

- (void)_handleViewDisappear
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(VUIBackgroundMediaController *)self name];
    int v5 = 136315650;
    v6 = "-[VUIBackgroundMediaController _handleViewDisappear]";
    __int16 v7 = 2048;
    objc_super v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::%s (%p: %@)", (uint8_t *)&v5, 0x20u);
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  if ([(VUIBackgroundMediaController *)self shouldStopPlayerWhenViewDisappears])
  {
    if ([(VUIBackgroundMediaController *)self isPlaybackEnabled]) {
      [(VUIBackgroundMediaController *)self setPlaybackEnabled:0];
    }
  }
}

- (void)_observeModalNavigationControllerNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleNavigationControllerDidShow name:*MEMORY[0x1E4FB3E00] object:0];
}

- (void)_handleNavigationControllerDidShow
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(VUIBackgroundMediaController *)self name];
    int v5 = 136315650;
    v6 = "-[VUIBackgroundMediaController _handleNavigationControllerDidShow]";
    __int16 v7 = 2048;
    objc_super v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::%s (%p: %@)", (uint8_t *)&v5, 0x20u);
  }
  if (![(VUIBackgroundMediaController *)self _isViewInTopMostVisibleView]) {
    [(VUIBackgroundMediaController *)self _handleViewDisappear];
  }
}

- (BOOL)_isViewInTopMostVisibleView
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = +[VUIApplicationRouter topMostVisibleViewController];
  id v4 = [v3 vuiView];
  int v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(VUIBackgroundMediaController *)self name];
    int v10 = 134218498;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    __int16 v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v3;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) topMostVisibleViewController: %@", (uint8_t *)&v10, 0x20u);
  }
  if (v4)
  {
    __int16 v7 = [(VUIBackgroundMediaController *)self vuiView];
    char v8 = [v7 isDescendantOfView:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)_constrainToView:(id)a3
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 widthAnchor];
  v6 = [(VUIBackgroundMediaController *)self view];
  __int16 v7 = [v6 widthAnchor];
  char v8 = [v5 constraintEqualToAnchor:v7];

  __int16 v9 = [v4 heightAnchor];
  int v10 = [(VUIBackgroundMediaController *)self view];
  uint64_t v11 = [v10 heightAnchor];
  __int16 v12 = [v9 constraintEqualToAnchor:v11];

  __int16 v13 = [v4 centerXAnchor];
  __int16 v14 = [(VUIBackgroundMediaController *)self view];
  uint64_t v15 = [v14 centerXAnchor];
  uint64_t v16 = [v13 constraintEqualToAnchor:v15];

  uint64_t v17 = [v4 centerYAnchor];

  v18 = [(VUIBackgroundMediaController *)self view];
  v19 = [v18 centerYAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];

  v21 = (void *)MEMORY[0x1E4F28DC8];
  v23[0] = v8;
  v23[1] = v12;
  v23[2] = v16;
  v23[3] = v20;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  [v21 activateConstraints:v22];
}

- (void)updateFrames
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(VUIBackgroundMediaController *)self view];
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;

  char v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134218240;
    uint64_t v21 = v5;
    __int16 v22 = 2048;
    uint64_t v23 = v7;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController: updateFrames for bounds %f x %f", (uint8_t *)&v20, 0x16u);
  }

  [(VUIBackgroundMediaController *)self _playbackContainerViewFrame:[(VUIBackgroundMediaController *)self isBackgrounded] hasSecondaryVideoView:[(VUIBackgroundMediaController *)self _hasSecondaryView]];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [(VUIBackgroundMediaController *)self playbackContainerController];
  v18 = [v17 view];
  objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

  if ([(VUIBackgroundMediaController *)self _shouldShowSecondaryView])
  {
    if ([(VUIBackgroundMediaController *)self _hasSecondaryView])
    {
      v19 = [(VUIBackgroundMediaController *)self secondaryVideoView];
      [(VUIBackgroundMediaController *)self _secondaryVideoViewFrame:1];
      objc_msgSend(v19, "setFrame:");
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)__PlayerAVPlayerKVOContext_1 == a6)
  {
    [(VUIBackgroundMediaController *)self _updateAVPlayerViewControllerWithAVPlayerForPlayer:v11];
    goto LABEL_12;
  }
  if ((void *)__PlayerPreferredAudioLanguageCode == a6)
  {
    double v13 = [v11 preferredAudioLanguageCode];
    [(VUIBackgroundMediaController *)self setPreferredAudioLanguageCode:v13];
LABEL_11:

    goto LABEL_12;
  }
  if ((void *)__PlayerPrefersAudioDescriptions == a6)
  {
    double v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v11, "prefersAudioDescriptions"));
    [(VUIBackgroundMediaController *)self setPrefersAudioDescriptions:v13];
    goto LABEL_11;
  }
  if ((void *)__PlayerInitialMediaItemHasCompletedInitialLoadingKVOContext_0 == a6)
  {
    if ([v11 initialMediaItemHasCompletedInitialLoading])
    {
      double v14 = [v11 currentMediaItem];
      double v15 = [v14 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];

      if (v15 && ([v15 complete] & 1) == 0)
      {
        [v15 addEndEventWithName:*MEMORY[0x1E4FAA370]];
        [v15 addSingleShotEventWithName:*MEMORY[0x1E4FAA350] value:*MEMORY[0x1E4FAA3A0]];
      }
    }
  }
  else if ((void *)__PlayerAVPlayerViewControllerDisplaySizeKVOContext_0 == a6)
  {
    [(VUIBackgroundMediaController *)self _notifyAVPlayerViewControllerDisplaySize];
  }
  else if ((void *)__PIPingPlayerMutedKVOContext == a6)
  {
    [(VUIBackgroundMediaController *)self _pipPlaybackDidChangeMutedState];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)VUIBackgroundMediaController;
    [(VUIBackgroundMediaController *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
LABEL_12:
}

- (VUIMediaInfo)currentMediaInfo
{
  unint64_t v3 = [(VUIBackgroundMediaController *)self mediaInfoIndex];
  uint64_t v4 = [(VUIBackgroundMediaController *)self mediaInfos];
  unint64_t v5 = [v4 count];

  if (v3 >= v5)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v6 = [(VUIBackgroundMediaController *)self mediaInfos];
    uint64_t v7 = objc_msgSend(v6, "objectAtIndex:", -[VUIBackgroundMediaController mediaInfoIndex](self, "mediaInfoIndex"));
  }
  return (VUIMediaInfo *)v7;
}

- (void)setMediaInfos:(id)a3
{
}

- (void)setMediaInfos:(id)a3 animated:(BOOL)a4
{
}

- (void)setMediaInfos:(id)a3 selectedIndex:(unint64_t)a4 animated:(BOOL)a5
{
  uint64_t v5 = a5;
  id v18 = a3;
  if ([v18 count] > a4)
  {
    if ([v18 count] > a4)
    {
      char v8 = [(VUIBackgroundMediaController *)self currentMediaInfo];

      if (v8)
      {
        double v9 = [v18 objectAtIndex:a4];
        id v10 = [v9 imageProxies];
        id v11 = [v10 firstObject];
        id v12 = [(VUIBackgroundMediaController *)self currentMediaInfo];
        double v13 = [v12 imageProxies];
        double v14 = [v13 firstObject];
        uint64_t v5 = [v11 isEqual:v14] ^ 1;
      }
    }
    self->_mediaInfoIndex = a4;
    self->_lastMediaInfoIndex = a4;
    double v15 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
    if (v18) {
      id v16 = v18;
    }
    else {
      id v16 = (id)MEMORY[0x1E4F1CBF0];
    }
    [v15 setMediaInfos:v16];

    uint64_t v17 = [(VUIBackgroundMediaController *)self currentMediaInfo];
    [(VUIBackgroundMediaController *)self _updateWithMediaInfo:v17 withDirection:0 imageVideoSwapBehavior:0 animated:v5];
  }
}

- (void)setMediaInfo:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  char v8 = [(VUIBackgroundMediaController *)self mediaInfos];
  unint64_t v9 = [v8 count];

  if (v9 > a4)
  {
    id v10 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
    [v10 setMediaInfo:v12 atIndex:a4];

    id v11 = [(VUIBackgroundMediaController *)self currentMediaInfo];
    [(VUIBackgroundMediaController *)self _updateWithMediaInfo:v11 withDirection:0 imageVideoSwapBehavior:0 animated:v5];
  }
}

- (NSArray)mediaInfos
{
  v2 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
  unint64_t v3 = [v2 mediaInfos];

  return (NSArray *)v3;
}

- (void)setMediaInfoIndex:(unint64_t)a3
{
}

- (void)setMediaInfoIndex:(unint64_t)a3 forwardAnimation:(BOOL)a4
{
}

- (void)setMediaInfoIndex:(unint64_t)a3 imageVideoSwapBehavior:(unint64_t)a4 animated:(BOOL)a5
{
}

- (void)setMediaInfoIndex:(unint64_t)a3 imageVideoSwapBehavior:(unint64_t)a4 animated:(BOOL)a5 forwardAnimation:(BOOL)a6
{
  BOOL v7 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = [(VUIBackgroundMediaController *)self currentMediaInfo];
  if (a6)
  {
    uint64_t v12 = 2;
    goto LABEL_12;
  }
  unint64_t lastMediaInfoIndex = self->_lastMediaInfoIndex;
  if (lastMediaInfoIndex == a3)
  {
    uint64_t v12 = 0;
    goto LABEL_12;
  }
  if (lastMediaInfoIndex >= a3) {
    goto LABEL_8;
  }
  double v14 = [(VUIBackgroundMediaController *)self mediaInfos];
  if ([v14 count] - 1 == a3)
  {

LABEL_8:
    uint64_t v12 = 1;
    goto LABEL_12;
  }
  unint64_t v15 = self->_lastMediaInfoIndex;

  if (v15) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
LABEL_12:
  unint64_t v16 = [(VUIBackgroundMediaController *)self _flippedDirection:v12 isRTL:[(VUIBackgroundMediaController *)self vuiIsRTL]];
  uint64_t v17 = VUIDefaultLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [(VUIBackgroundMediaController *)self name];
    unint64_t mediaInfoIndex = self->_mediaInfoIndex;
    int v25 = 134218754;
    id v26 = self;
    __int16 v27 = 2112;
    objc_super v28 = v18;
    __int16 v29 = 2048;
    unint64_t v30 = mediaInfoIndex;
    __int16 v31 = 2048;
    unint64_t v32 = a3;
    _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) mediaInfo oldIndex:[%lu] newIndex:[%lu]", (uint8_t *)&v25, 0x2Au);
  }
  self->_unint64_t mediaInfoIndex = a3;
  self->_unint64_t lastMediaInfoIndex = a3;
  int v20 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
  [v20 setIndex:a3];

  uint64_t v21 = [(VUIBackgroundMediaController *)self mediaInfos];
  if (![v21 count]) {
    goto LABEL_20;
  }
  __int16 v22 = [(VUIBackgroundMediaController *)self mediaInfos];
  unint64_t v23 = [v22 count];

  if (v23 > a3)
  {
    uint64_t v24 = [(VUIBackgroundMediaController *)self mediaInfos];
    uint64_t v21 = [v24 objectAtIndex:a3];

    if (![(VUIBackgroundMediaController *)self _mediaInfo:v11 contentMatchesMediaInfo:v21])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(VUIBackgroundMediaController *)self setAutomaticPlaybackStart:1];
        -[VUIBackgroundMediaController setVpafPlaybackStartReason:](self, "setVpafPlaybackStartReason:", [v21 playbackStartReason]);
        -[VUIBackgroundMediaController setVpafPlaybackStopReason:](self, "setVpafPlaybackStopReason:", [v21 playbackStopReason]);
      }
      [(VUIBackgroundMediaController *)self _updateWithMediaInfo:v21 withDirection:v16 imageVideoSwapBehavior:a4 animated:v7];
    }
LABEL_20:
  }
}

- (unint64_t)_flippedDirection:(unint64_t)a3 isRTL:(BOOL)a4
{
  unint64_t v4 = 1;
  unint64_t v5 = 2;
  if (a3 != 1) {
    unint64_t v5 = a3;
  }
  if (a3 != 2) {
    unint64_t v4 = v5;
  }
  if (a4) {
    return v4;
  }
  else {
    return a3;
  }
}

- (id)createTransitionViewAtIndex:(unint64_t)a3 oldView:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(VUIBackgroundMediaController *)self mediaInfos];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    id v14 = 0;
  }
  else
  {
    unint64_t v9 = [(VUIBackgroundMediaController *)self mediaInfoIndex] + 1;
    if ([(VUIBackgroundMediaController *)self isVideoFrameFallbackEnabled])
    {
      id v10 = [(VUIBackgroundMediaController *)self prefetchPlayer];
      id v11 = [v10 state];
      uint64_t v12 = [MEMORY[0x1E4FA9D88] paused];
      BOOL v13 = v11 == v12;
    }
    else
    {
      BOOL v13 = 1;
    }
    if (v9 == a3
      && [(VUIBackgroundMediaController *)self prefetchesVideoFrame]
      && ([(VUIBackgroundMediaController *)self mediaInfoFetchController],
          unint64_t v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v15 mediaInfoContainsPlayerAtIndex:a3] & v13,
          v15,
          v16 == 1))
    {
      uint64_t v17 = [(VUIBackgroundMediaController *)self mediaInfos];
      id v18 = [v17 objectAtIndex:a3];

      v19 = [v18 tvpPlaylist];
      int v20 = [(VUIBackgroundMediaController *)self prefetchPlayer];
      uint64_t v21 = [v20 playlist];
      BOOL v22 = [(VUIBackgroundMediaController *)self _playlist:v19 contentMatchesPlaylist:v21];

      if (v22)
      {
        unint64_t v23 = [(VUIBackgroundMediaController *)self prefetchPlayerViewController];
        id v14 = [v23 view];
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (v6 && (isKindOfClass & 1) != 0)
      {
        id v25 = v6;
        [v25 setImage:0];
      }
      else
      {
        id v26 = objc_alloc(MEMORY[0x1E4FB3CE0]);
        __int16 v27 = [(VUIBackgroundMediaController *)self view];
        [v27 bounds];
        id v25 = (id)objc_msgSend(v26, "initWithFrame:");
      }
      objc_msgSend(v25, "setVuiContentMode:", -[VUIBackgroundMediaController imageContentMode](self, "imageContentMode"));
      [(VUIBackgroundMediaController *)self _configMirroredImageForBackgroundImage:v25];
      objc_super v28 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __68__VUIBackgroundMediaController_createTransitionViewAtIndex_oldView___block_invoke;
      v32[3] = &unk_1E6DFD848;
      v32[4] = self;
      id v29 = v25;
      id v33 = v29;
      [v28 loadImageAtIndex:a3 completion:v32];

      unint64_t v30 = v33;
      id v14 = v29;
    }
  }

  return v14;
}

void __68__VUIBackgroundMediaController_createTransitionViewAtIndex_oldView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v5 name];
    BOOL v7 = VUIBoolLogString();
    *(_DWORD *)buf = 134218754;
    int v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v3;
    __int16 v21 = 2112;
    BOOL v22 = v7;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) completed loading transition image: [%@], finished: [%@]", buf, 0x2Au);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v11 = __68__VUIBackgroundMediaController_createTransitionViewAtIndex_oldView___block_invoke_240;
  uint64_t v12 = &unk_1E6DF3F68;
  id v13 = v3;
  id v14 = *(id *)(a1 + 40);
  unint64_t v8 = (void *)MEMORY[0x1E4F29060];
  id v9 = v3;
  if (objc_msgSend(v8, "isMainThread", v10[0], 3221225472)) {
    v11((uint64_t)v10);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

void __68__VUIBackgroundMediaController_createTransitionViewAtIndex_oldView___block_invoke_240(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [v2 uiImage];
    [v3 setImage:v4];
  }
}

- (void)appendMediaInfos:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
  [v5 appendMediaInfos:v4];
}

- (void)removeMediaInfoAtIndex:(unint64_t)a3
{
  if ([(VUIBackgroundMediaController *)self mediaInfoIndex] > a3)
  {
    unint64_t v5 = self->_mediaInfoIndex - 1;
    self->_unint64_t mediaInfoIndex = v5;
    self->_unint64_t lastMediaInfoIndex = v5;
  }
  id v6 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
  [v6 removeMediaInfoAtIndex:a3];
}

- (void)play
{
  id v2 = [(VUIBackgroundMediaController *)self stateMachine];
  [v2 postEvent:@"Play"];
}

- (void)replay
{
  id v2 = [(VUIBackgroundMediaController *)self stateMachine];
  [v2 postEvent:@"Replay"];
}

- (void)pause
{
  id v2 = [(VUIBackgroundMediaController *)self stateMachine];
  [v2 postEvent:@"Pause"];
}

- (void)stop
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_stop object:0];
  id v3 = [(VUIBackgroundMediaController *)self stateMachine];
  unint64_t v5 = @"PlaybackStopReasonKey";
  v6[0] = &unk_1F3F3E0D8;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v3 postEvent:@"Stop" withContext:0 userInfo:v4];
}

- (void)setExitsFullscreenWhenPlaybackEnds:(BOOL)a3
{
  BOOL v3 = a3;
  self->_exitsFullscreenWhenPlaybackEnds = a3;
  unint64_t v5 = [(VUIBackgroundMediaController *)self avPlayerViewController];

  if (v5)
  {
    id v6 = [(VUIBackgroundMediaController *)self avPlayerViewController];
    [v6 setExitsFullScreenWhenPlaybackEnds:v3];
  }
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  [(VUIBackgroundMediaController *)self willChangeValueForKey:@"muted"];
  self->_muted = v3;
  unint64_t v5 = [(VUIBackgroundMediaController *)self player];
  [v5 setMuted:v3];

  id v6 = [(VUIBackgroundMediaController *)self prefetchPlayer];
  [v6 setMuted:v3];

  [(VUIBackgroundMediaController *)self didChangeValueForKey:@"muted"];
}

- (void)setMutePlaybackInBackground:(BOOL)a3
{
  if (self->_mutePlaybackInBackground != a3)
  {
    [(VUIBackgroundMediaController *)self willChangeValueForKey:@"mutePlaybackInBackground"];
    self->_mutePlaybackInBackground = a3;
    [(VUIBackgroundMediaController *)self _updatePlayerMuteStateForBackgroundPlaybackWithReason:@"VUIBackgroundMediaControllerPlaybackMuteReasonAssigned"];
    [(VUIBackgroundMediaController *)self didChangeValueForKey:@"mutePlaybackInBackground"];
  }
}

- (void)setUseForegroundAudioSessionInBackgroundMode:(BOOL)a3
{
  self->_useForegroundAudioSessionInBackgroundMode = a3;
  [(VUIBackgroundMediaController *)self _configureAudioSession];
}

- (void)setLegibleContentInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  self->_legibleContentInsets = a3;
  unint64_t v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(VUIBackgroundMediaController *)self name];
    v21.CGFloat top = top;
    v21.CGFloat left = left;
    v21.CGFloat bottom = bottom;
    v21.CGFloat right = right;
    id v10 = NSStringFromPlatformEdgeInsets(v21);
    int v14 = 134218498;
    unint64_t v15 = self;
    __int16 v16 = 2112;
    __int16 v17 = v9;
    __int16 v18 = 2112;
    __int16 v19 = v10;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) set legibleContentInsets: %@", (uint8_t *)&v14, 0x20u);
  }
  id v11 = [(VUIBackgroundMediaController *)self avPlayerViewController];

  if (v11)
  {
    uint64_t v12 = [(VUIBackgroundMediaController *)self stateMachine];
    id v13 = [v12 currentState];
    [(VUIBackgroundMediaController *)self _updateVideoPlayerLegibleContentInsets:[(VUIBackgroundMediaController *)self _shouldApplyLegibleContentInsetForState:v13]];
  }
}

- (void)setShouldShowFullScreenButton:(BOOL)a3
{
  self->_shouldShowFullScreenButton = a3;
}

- (void)_disableSubtitleIfNeeded
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(VUIBackgroundMediaController *)self shouldDisableSubtitle])
  {
    BOOL v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(VUIBackgroundMediaController *)self name];
      int v6 = 134218242;
      BOOL v7 = self;
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) disable subtitle", (uint8_t *)&v6, 0x16u);
    }
    unint64_t v5 = [(VUIBackgroundMediaController *)self player];
    [v5 setSelectedSubtitleOption:0 setGlobalPreference:0];
  }
}

- (void)_updateVideoPlayerLegibleContentInsets:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(VUIBackgroundMediaController *)self legibleContentInsets];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    if ([(VUIBackgroundMediaController *)self _shouldShowSecondaryView])
    {
      [(VUIBackgroundMediaController *)self _secondaryVideoViewHeight];
      double v10 = v10 - v13;
    }
    if (([MEMORY[0x1E4FB3C90] isTV] & 1) != 0
      || [MEMORY[0x1E4FB3C90] isMac])
    {
      int v14 = [(VUIBackgroundMediaController *)self avPlayerViewController];
      int v15 = [v14 vuiIsViewLoaded];

      if (v15)
      {
        __int16 v16 = [(VUIBackgroundMediaController *)self avPlayerViewController];
        __int16 v17 = [v16 vuiView];
        [v17 frame];
        double v19 = v18;
        double v21 = v20;

        double v22 = 0.0;
        if ([(VUIBackgroundMediaController *)self _shouldShowSecondaryView])
        {
          [(VUIBackgroundMediaController *)self _secondaryVideoViewHeight];
          double v22 = v23;
        }
        double v6 = v6 - v19;
        uint64_t v24 = [(VUIBackgroundMediaController *)self vuiView];
        [v24 bounds];
        double v26 = v25 - v22;

        double v10 = v10 + v19 + v21 - v26;
      }
    }
    if (v6 < 0.0) {
      double v6 = 0.0;
    }
    if (v10 < 0.0) {
      double v10 = 0.0;
    }
  }
  else
  {
    double v6 = *MEMORY[0x1E4FB2848];
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  __int16 v27 = VUIDefaultLogObject();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v28 = [(VUIBackgroundMediaController *)self name];
    v40.CGFloat top = v6;
    v40.CGFloat left = v8;
    v40.CGFloat bottom = v10;
    v40.CGFloat right = v12;
    id v29 = NSStringFromPlatformEdgeInsets(v40);
    int v31 = 134218754;
    unint64_t v32 = self;
    __int16 v33 = 2112;
    v34 = v28;
    __int16 v35 = 2112;
    v36 = v29;
    __int16 v37 = 1024;
    BOOL v38 = v3;
    _os_log_impl(&dword_1E2BD7000, v27, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) update video's legibleContentInsets: %@, shouldApplyLegibleContentInset=%d", (uint8_t *)&v31, 0x26u);
  }
  unint64_t v30 = [(VUIBackgroundMediaController *)self avPlayerViewController];
  objc_msgSend(v30, "setLegibleContentInsets:", v6, v8, v10, v12);
}

- (BOOL)_shouldApplyLegibleContentInsetForState:(id)a3
{
  return [a3 isEqualToString:@"Showing playback in foreground"] ^ 1;
}

- (void)_configureLegibleContentInsetFromState:(id)a3 toState:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [(VUIBackgroundMediaController *)self _shouldApplyLegibleContentInsetForState:a3];
  BOOL v8 = [(VUIBackgroundMediaController *)self _shouldApplyLegibleContentInsetForState:v6];

  if (v7 != v8)
  {
    double v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = [(VUIBackgroundMediaController *)self name];
      int v11 = 134218242;
      double v12 = self;
      __int16 v13 = 2112;
      int v14 = v10;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) Video changes between background & foreground, update legibleContentInsets", (uint8_t *)&v11, 0x16u);
    }
    [(VUIBackgroundMediaController *)self _updateVideoPlayerLegibleContentInsets:v8];
  }
}

- (void)setShowsVideoControls:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsVideoControls = a3;
  [(VUIBackgroundMediaController *)self showAlphaImage:!a3 animated:1];
  id v8 = [(VUIBackgroundMediaController *)self avPlayerViewController];
  double v5 = [v8 view];
  [v5 setUserInteractionEnabled:v3];

  if (self->_keepVideoGravityUnchangedByVideoControlsVisibility || !v3)
  {
    id v6 = [(VUIBackgroundMediaController *)self videoGravity];
  }
  else
  {
    id v6 = (id)*MEMORY[0x1E4F15AF0];
  }
  BOOL v7 = v6;
  [v8 setVideoGravity:v6];

  [(VUIBackgroundMediaController *)self setControlsVisible:v3];
}

- (void)setUpdatesNowPlayingInfoCenter:(BOOL)a3
{
  BOOL v3 = a3;
  self->_updatesNowPlayingInfoCenter = a3;
  double v5 = [(VUIBackgroundMediaController *)self avPlayerViewController];
  [v5 setUpdatesNowPlayingInfoCenter:v3];

  id v6 = [(VUIBackgroundMediaController *)self prefetchPlayerViewController];
  [v6 setUpdatesNowPlayingInfoCenter:v3];
}

- (void)showAlphaImage:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(VUIBackgroundMediaController *)self alphaProxyImageView];
  if (v7)
  {
    id v15 = (id)v7;
    id v8 = [(VUIBackgroundMediaController *)self alphaProxyImageView];
    uint64_t v9 = [v8 superview];
    if (v9)
    {
      double v10 = (void *)v9;
      int v11 = [(VUIBackgroundMediaController *)self alphaProxyImageView];
      double v12 = [v11 image];

      if (v12)
      {
        __int16 v13 = (void *)MEMORY[0x1E4FB1EB0];
        if (v4)
        {
          int v14 = [(VUIBackgroundMediaController *)self view];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __56__VUIBackgroundMediaController_showAlphaImage_animated___block_invoke;
          v18[3] = &unk_1E6DF51F0;
          v18[4] = self;
          BOOL v19 = a3;
          objc_msgSend(v13, "vui_transitionWithView:duration:options:animations:completion:", v14, 5242880, v18, 0, 0.3);
        }
        else
        {
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __56__VUIBackgroundMediaController_showAlphaImage_animated___block_invoke_2;
          v16[3] = &unk_1E6DF51F0;
          v16[4] = self;
          BOOL v17 = a3;
          objc_msgSend(MEMORY[0x1E4FB1EB0], "vui_performWithoutAnimation:", v16);
        }
      }
    }
    else
    {
    }
  }
}

void __56__VUIBackgroundMediaController_showAlphaImage_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) alphaProxyImageView];
  BOOL v3 = v2;
  double v4 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v4 = 0.0;
  }
  [v2 setVuiAlpha:v4];

  id v6 = [*(id *)(a1 + 32) view];
  double v5 = [*(id *)(a1 + 32) alphaProxyImageView];
  objc_msgSend(v6, "vui_bringSubviewToFront:", v5);
}

void __56__VUIBackgroundMediaController_showAlphaImage_animated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) alphaProxyImageView];
  BOOL v3 = v2;
  double v4 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v4 = 0.0;
  }
  [v2 setVuiAlpha:v4];

  id v6 = [*(id *)(a1 + 32) view];
  double v5 = [*(id *)(a1 + 32) alphaProxyImageView];
  objc_msgSend(v6, "vui_bringSubviewToFront:", v5);
}

- (void)transitionToForeground:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)transitionToForeground:(BOOL)a3 withPlaybackControls:(BOOL)a4 animated:(BOOL)a5
{
}

- (void)transitionToFullScreenAnimated:(BOOL)a3
{
}

- (void)transitionToForeground:(BOOL)a3 withPlaybackControls:(BOOL)a4 fullScreenPlayer:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  v20[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v9 = a5;
    [(VUIBackgroundMediaController *)self foregroundVolume];
    if (v10 != -1.0)
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__updatePlayerVolume_ object:MEMORY[0x1E4F1CC28]];
      [(VUIBackgroundMediaController *)self _performPlayerVolumeAnimatedUpdate:1];
    }
    int v11 = [(VUIBackgroundMediaController *)self stateMachine];
    v19[0] = @"AnimatedKey";
    double v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
    v20[0] = v12;
    v19[1] = @"IsFullScreenPlayerKey";
    __int16 v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v9];
    v20[1] = v13;
    v19[2] = @"ShowsPlaybackControlsKey";
    int v14 = [MEMORY[0x1E4F28ED0] numberWithBool:v7];
    v20[2] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    [v11 postEvent:@"Transition to foreground" withContext:0 userInfo:v15];
  }
  else
  {
    if (![(VUIBackgroundMediaController *)self mutePlaybackInBackground])
    {
      [(VUIBackgroundMediaController *)self backgroundVolume];
      if (v16 != -1.0)
      {
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__updatePlayerVolume_ object:MEMORY[0x1E4F1CC38]];
        [(VUIBackgroundMediaController *)self _performPlayerVolumeAnimatedUpdate:0];
      }
    }
    int v11 = [(VUIBackgroundMediaController *)self stateMachine];
    v17[0] = @"AnimatedKey";
    double v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
    v17[1] = @"ShowsPlaybackControlsKey";
    v18[0] = v12;
    __int16 v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v7];
    v18[1] = v13;
    int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    [v11 postEvent:@"Transition background" withContext:0 userInfo:v14];
  }
}

- (void)setControlsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v5 = [(VUIBackgroundMediaController *)self avPlayerViewController];
  BOOL v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = [(VUIBackgroundMediaController *)self name];
    id v8 = VUIBoolLogString();
    [(VUIBackgroundMediaController *)self showsPlaybackControlsInForeground];
    BOOL v9 = VUIBoolLogString();
    int v11 = 134218754;
    double v12 = self;
    __int16 v13 = 2112;
    int v14 = v7;
    __int16 v15 = 2112;
    float v16 = v8;
    __int16 v17 = 2112;
    double v18 = v9;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) setControlsVisible %@ showsPlaybackControlsInForeground %@", (uint8_t *)&v11, 0x2Au);
  }
  if ([(VUIBackgroundMediaController *)self showsPlaybackControlsInForeground])
  {
    [v5 setShowsPlaybackControls:v3];
    if (v3) {
      [v5 flashPlaybackControlsWithDuration:5.0];
    }
  }
  float v10 = [v5 view];
  [v10 setUserInteractionEnabled:v3];
}

- (void)setPlaybackEnabled:(BOOL)a3
{
}

- (id)surrenderCurrentPlayer
{
  BOOL v3 = [(VUIBackgroundMediaController *)self player];
  if (v3)
  {
    [(VUIBackgroundMediaController *)self _cleanUpPlaybackTimers];
    [(VUIBackgroundMediaController *)self _unregisterPlayerNotifications];
    double v4 = [(VUIBackgroundMediaController *)self player];
    [v4 removeObserver:self forKeyPath:@"avPlayer" context:__PlayerAVPlayerKVOContext_1];

    double v5 = [(VUIBackgroundMediaController *)self player];
    [v5 removeObserver:self forKeyPath:@"preferredAudioLanguageCode" context:__PlayerPreferredAudioLanguageCode];

    BOOL v6 = [(VUIBackgroundMediaController *)self player];
    [v6 removeObserver:self forKeyPath:@"prefersAudioDescriptions" context:__PlayerPrefersAudioDescriptions];

    [(VUIBackgroundMediaController *)self setPlayer:0];
    BOOL v7 = +[VUIPlayerValidationManager sharedInstance];
    [v7 removeReferenceForPlayer:v3 stoppingIfNeeded:0];
  }
  id v8 = [(VUIBackgroundMediaController *)self prefetchPlayer];

  if (v8)
  {
    BOOL v9 = [(VUIBackgroundMediaController *)self prefetchPlayer];
    [v9 removeObserver:self forKeyPath:@"avPlayer" context:__PlayerAVPlayerKVOContext_1];

    [(VUIBackgroundMediaController *)self _cleanupPrefetchPlayback];
  }
  float v10 = [(VUIBackgroundMediaController *)self mediaInfos];
  int v11 = objc_msgSend(v10, "objectAtIndex:", -[VUIBackgroundMediaController mediaInfoIndex](self, "mediaInfoIndex"));

  -[VUIBackgroundMediaController setVpafPlaybackStopReason:](self, "setVpafPlaybackStopReason:", [v11 playbackStopReason]);
  [(VUIBackgroundMediaController *)self _postWillStopPlaybackNotification];

  return v3;
}

- (void)adoptAVPlayerViewController:(id)a3 player:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [(VUIBackgroundMediaController *)self name];
    float v10 = [(VUIBackgroundMediaController *)self stateMachine];
    int v11 = [v10 currentState];
    int v14 = 134219010;
    __int16 v15 = self;
    __int16 v16 = 2112;
    __int16 v17 = v9;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    double v23 = v11;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) adoptAVPlayerViewController avPlayerViewController = %@, player = %@ on state %@", (uint8_t *)&v14, 0x34u);
  }
  if (v6 && v7)
  {
    double v12 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v12, "vui_setObjectIfNotNil:forKey:", v7, @"PlayerKey");
    objc_msgSend(v12, "vui_setObjectIfNotNil:forKey:", v6, @"AVPlayerViewControllerKey");
    [(VUIBackgroundMediaController *)self _configurePlayerViewController:v6];
    __int16 v13 = [(VUIBackgroundMediaController *)self stateMachine];
    [v13 postEvent:@"Restore avPlayerViewController" withContext:0 userInfo:v12];
  }
}

- (void)setPlaybackEnabled:(BOOL)a3 imageVideoSwapBehavior:(unint64_t)a4
{
  BOOL v5 = a3;
  v59[2] = *MEMORY[0x1E4F143B8];
  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(VUIBackgroundMediaController *)self name];
    *(_DWORD *)buf = 134218754;
    v55 = self;
    __int16 v56 = 2112;
    v57 = v8;
    __int16 v58 = 1024;
    LODWORD(v59[0]) = v5;
    WORD2(v59[0]) = 2048;
    *(void *)((char *)v59 + 6) = a4;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) setPlaybackEnabled = %d, imageVideoSwapBehavior = %lu", buf, 0x26u);
  }
  BOOL v9 = [(VUIBackgroundMediaController *)self _autoPlayEnabled];
  if (!v9)
  {
    float v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(VUIBackgroundMediaController *)self name];
      *(_DWORD *)buf = 134218242;
      v55 = self;
      __int16 v56 = 2112;
      v57 = v11;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) accessibility video autoplay is disabled", buf, 0x16u);
    }
  }
  double v12 = +[VUIFeaturesConfiguration sharedInstance];
  __int16 v13 = [v12 autoPlayConfig];
  int v14 = [v13 disableBackgroundMediaPlayback];

  __int16 v15 = VUIDefaultLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = [(VUIBackgroundMediaController *)self name];
    *(_DWORD *)buf = 134218498;
    v55 = self;
    __int16 v56 = 2112;
    v57 = v16;
    __int16 v58 = 1024;
    LODWORD(v59[0]) = v14;
    _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) is playback disabled by defaults %d.", buf, 0x1Cu);
  }
  self->_playbackEnabled = v5 & (v14 ^ 1);
  __int16 v17 = [(VUIBackgroundMediaController *)self player];

  if (v17)
  {
    if (self->_playbackEnabled)
    {
LABEL_11:
      __int16 v18 = VUIDefaultLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = [(VUIBackgroundMediaController *)self name];
        __int16 v20 = [(VUIBackgroundMediaController *)self stateMachine];
        id v21 = [v20 currentState];
        *(_DWORD *)buf = 134218498;
        v55 = self;
        __int16 v56 = 2112;
        v57 = v19;
        __int16 v58 = 2112;
        v59[0] = v21;
        _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@, machine state: %@) playback is enabled and we have a stale player, perform cleanup and start reloading.", buf, 0x20u);
      }
      [(VUIBackgroundMediaController *)self _cleanUpEverythingPlaybackRelated];
      if (v9)
      {
        __int16 v22 = [(VUIBackgroundMediaController *)self stateMachine];
        [v22 postEvent:@"Replay"];
      }
      goto LABEL_39;
    }
    __int16 v27 = [(VUIBackgroundMediaController *)self player];
    objc_super v28 = [v27 state];
    id v29 = [MEMORY[0x1E4FA9D88] stopped];
    BOOL v30 = v28 == v29;

    if (v30)
    {
      if (self->_playbackEnabled) {
        goto LABEL_11;
      }
      v34 = VUIDefaultLogObject();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v35 = [(VUIBackgroundMediaController *)self name];
        *(_DWORD *)buf = 134218242;
        v55 = self;
        __int16 v56 = 2112;
        v57 = v35;
        _os_log_impl(&dword_1E2BD7000, v34, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) cleanup everything playback related in defensive case", buf, 0x16u);
      }
      [(VUIBackgroundMediaController *)self _cleanUpEverythingPlaybackRelated];
    }
    else if (a4 == 1)
    {
      int v31 = VUIDefaultLogObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v32 = [(VUIBackgroundMediaController *)self name];
        *(_DWORD *)buf = 134218242;
        v55 = self;
        __int16 v56 = 2112;
        v57 = v32;
        _os_log_impl(&dword_1E2BD7000, v31, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) pausing playback, will show image and then stop.", buf, 0x16u);
      }
      __int16 v33 = [(VUIBackgroundMediaController *)self stateMachine];
      [v33 postEvent:@"Pause show image and stop"];
    }
    else
    {
      v52[0] = @"PlaybackStopReasonKey";
      v52[1] = @"ImageVideoSwapBehaviorKey";
      v53[0] = &unk_1F3F3E0F0;
      v36 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
      v53[1] = v36;
      __int16 v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];

      LODWORD(v36) = a4 == 3;
      BOOL v38 = VUIDefaultLogObject();
      BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
      if (v36)
      {
        if (v39)
        {
          UIEdgeInsets v40 = [(VUIBackgroundMediaController *)self name];
          *(_DWORD *)buf = 134218242;
          v55 = self;
          __int16 v56 = 2112;
          v57 = v40;
          _os_log_impl(&dword_1E2BD7000, v38, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) showing image and then will stop playback.", buf, 0x16u);
        }
        objc_initWeak((id *)buf, self);
        uint64_t v46 = MEMORY[0x1E4F143A8];
        uint64_t v47 = 3221225472;
        v48 = __74__VUIBackgroundMediaController_setPlaybackEnabled_imageVideoSwapBehavior___block_invoke;
        v49 = &unk_1E6DF5490;
        objc_copyWeak(&v51, (id *)buf);
        id v50 = v37;
        [(VUIBackgroundMediaController *)self _swapActiveMedia:1 animated:1 completion:&v46];

        objc_destroyWeak(&v51);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (v39)
        {
          v41 = [(VUIBackgroundMediaController *)self name];
          *(_DWORD *)buf = 134218242;
          v55 = self;
          __int16 v56 = 2112;
          v57 = v41;
          _os_log_impl(&dword_1E2BD7000, v38, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) stopping playback.", buf, 0x16u);
        }
        v42 = [(VUIBackgroundMediaController *)self stateMachine];
        [v42 postEvent:@"Stop" withContext:0 userInfo:v37];
      }
    }
  }
  else
  {
    char v23 = !v9;
    if (!self->_playbackEnabled) {
      char v23 = 1;
    }
    if (v23)
    {
      [(VUIBackgroundMediaController *)self _cleanUpPlaybackTimers];
    }
    else
    {
      uint64_t v24 = VUIDefaultLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        double v25 = [(VUIBackgroundMediaController *)self name];
        *(_DWORD *)buf = 134218242;
        v55 = self;
        __int16 v56 = 2112;
        v57 = v25;
        _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playback is enabled but we don't have a player, start reloading.", buf, 0x16u);
      }
      double v26 = [(VUIBackgroundMediaController *)self stateMachine];
      [v26 postEvent:@"Replay"];
    }
  }
LABEL_39:
  if (!self->_playbackEnabled)
  {
    v43 = [(VUIBackgroundMediaController *)self prefetchPlayer];

    if (v43)
    {
      v44 = [(VUIBackgroundMediaController *)self prefetchPlayer];
      [v44 stop];

      v45 = [(VUIBackgroundMediaController *)self prefetchPlayer];
      [v45 invalidate];

      [(VUIBackgroundMediaController *)self setPrefetchPlayer:0];
    }
    -[VUIBackgroundMediaController setPrefetchPlayerViewController:](self, "setPrefetchPlayerViewController:", 0, v46, v47, v48, v49);
  }
}

void __74__VUIBackgroundMediaController_setPlaybackEnabled_imageVideoSwapBehavior___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained stateMachine];
  [v2 postEvent:@"Stop" withContext:0 userInfo:*(void *)(a1 + 32)];
}

- (BOOL)_autoPlayEnabled
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(VUIBackgroundMediaController *)self forceAutoPlay])
  {
    BOOL v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double v4 = [(VUIBackgroundMediaController *)self name];
      int v19 = 134218242;
      __int16 v20 = self;
      __int16 v21 = 2112;
      __int16 v22 = v4;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) auto play is enabled because forceAutoPlay is YES", (uint8_t *)&v19, 0x16u);
    }
    LOBYTE(v5) = 1;
  }
  else
  {
    id v6 = +[VUIInterfaceFactory sharedInstance];
    id v7 = [v6 groupActivitiesManager];
    int v8 = [v7 isSessionActive];

    int v9 = [MEMORY[0x1E4FB3C20] isFeatureEnabled:1];
    float v10 = [MEMORY[0x1E4F28F80] processInfo];
    int v11 = [v10 isLowPowerModeEnabled];

    BOOL v12 = [(VUIBackgroundMediaController *)self _isViewInTopMostVisibleView];
    BOOL IsVideoAutoplayEnabled = UIAccessibilityIsVideoAutoplayEnabled();
    int v14 = VUIDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = [(VUIBackgroundMediaController *)self name];
      int v19 = 134219010;
      __int16 v20 = self;
      __int16 v21 = 2112;
      __int16 v22 = v15;
      __int16 v23 = 1024;
      BOOL v24 = 0;
      __int16 v25 = 1024;
      BOOL v26 = 0;
      __int16 v27 = 1024;
      BOOL v28 = [(VUIBackgroundMediaController *)self loadsPlayerWithFullscreenPlayback];
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) isDisabledBecauseOfFullScreenPlayback=%d, isPlaybackUIBeingShown=%d, loadsPlayerWithFullscreenPlayback=%d", (uint8_t *)&v19, 0x28u);
    }
    BOOL v5 = ((!IsVideoAutoplayEnabled | v9 | v11) & 1) == 0
      && (!v8 || [(VUIBackgroundMediaController *)self autoPlayInSharePlay])
      && v12;
    BOOL v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [(VUIBackgroundMediaController *)self name];
      BOOL v17 = [(VUIBackgroundMediaController *)self autoPlayInSharePlay];
      int v19 = 134220034;
      __int16 v20 = self;
      __int16 v21 = 2112;
      __int16 v22 = v16;
      __int16 v23 = 1024;
      BOOL v24 = v5;
      __int16 v25 = 1024;
      BOOL v26 = IsVideoAutoplayEnabled;
      __int16 v27 = 1024;
      BOOL v28 = v9;
      __int16 v29 = 1024;
      int v30 = v11;
      __int16 v31 = 1024;
      int v32 = v8;
      __int16 v33 = 1024;
      BOOL v34 = v17;
      __int16 v35 = 1024;
      BOOL v36 = v12;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) check _autoPlayEnabled=%d, isVideoAutoPlayEnabled=%d, isReduceMotionEnabled=%d,            isLowPowerModeEnabled=%d, isSharePlay=%d, autoPlayInSharePlay=%d, isViewInTopMostVisibleView=%d", (uint8_t *)&v19, 0x40u);
    }
  }

  return v5;
}

- (void)_registerForApplicationStateNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleApplicationWillResignActiveNotification_ name:*MEMORY[0x1E4FB3D88] object:0];
  [v3 addObserver:self selector:sel__handleApplicationDidEnterBackgroundNotification_ name:*MEMORY[0x1E4FB3D78] object:0];
  [v3 addObserver:self selector:sel__handleApplicationDidBecomeActiveNotification_ name:*MEMORY[0x1E4FB3D70] object:0];
  [v3 addObserver:self selector:sel__applicationWillAddDeactivationReason_ name:*MEMORY[0x1E4FB31A0] object:0];
  [v3 addObserver:self selector:sel__applicationDidRemoveDeactivationReason_ name:*MEMORY[0x1E4FB3160] object:0];
}

- (void)_handleApplicationWillResignActiveNotification:(id)a3
{
  uint64_t v4 = [(VUIBackgroundMediaController *)self player];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    id v6 = [(VUIBackgroundMediaController *)self player];
    id v7 = [v6 state];
    uint64_t v8 = [MEMORY[0x1E4FA9D88] playing];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      int v9 = (void *)v8;
      float v10 = [(VUIBackgroundMediaController *)self player];
      int v11 = [v10 state];
      BOOL v12 = [MEMORY[0x1E4FA9D88] loading];

      if (v11 != v12) {
        return;
      }
    }
    if ([(VUIBackgroundMediaController *)self _shouldPausePlaybackDueToDeactivationReasons])
    {
      [(VUIBackgroundMediaController *)self setShouldPlayAfterAppBecomesActive:1];
      [(VUIBackgroundMediaController *)self pause];
    }
  }
}

- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(VUIBackgroundMediaController *)self stopsPlaybackWhenInactive])
  {
    uint64_t v4 = [(VUIBackgroundMediaController *)self player];

    if (v4)
    {
      BOOL v5 = VUIDefaultLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [(VUIBackgroundMediaController *)self name];
        int v7 = 134218242;
        uint64_t v8 = self;
        __int16 v9 = 2112;
        float v10 = v6;
        _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) AppDidEnterBackground: Try to show the image and stop the video", (uint8_t *)&v7, 0x16u);
      }
      [(VUIBackgroundMediaController *)self setShouldPlayAfterAppBecomesActive:0];
      [(VUIBackgroundMediaController *)self _swapActiveMedia:1 animated:0 completion:0];
      [(VUIBackgroundMediaController *)self stop];
    }
    [(VUIBackgroundMediaController *)self _clearPreloadPlayback];
  }
  else
  {
    [(VUIBackgroundMediaController *)self setShouldPlayAfterAppBecomesActive:1];
  }
}

- (void)_handleApplicationDidBecomeActiveNotification:(id)a3
{
  uint64_t v4 = [(VUIBackgroundMediaController *)self player];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    BOOL v6 = [(VUIBackgroundMediaController *)self shouldPlayAfterAppBecomesActive];

    if (v6)
    {
      [(VUIBackgroundMediaController *)self setShouldPlayAfterAppBecomesActive:0];
      [(VUIBackgroundMediaController *)self play];
    }
  }
  [(VUIBackgroundMediaController *)self _startPreloadPlaybackIfNeeded];
}

- (void)setPreloadPlaybackEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(VUIBackgroundMediaController *)self name];
    int v7 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
    int v9 = 134218754;
    float v10 = self;
    __int16 v11 = 2112;
    BOOL v12 = v6;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    __int16 v15 = 2048;
    __int16 v16 = v7;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) setPreloadPlaybackEnabled = %d, mediaInfoFetch: %p", (uint8_t *)&v9, 0x26u);
  }
  self->_preloadPlaybackEnabled = v3;
  uint64_t v8 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
  [v8 setPreloadPlaybackEnabled:v3];
}

- (void)_clearPreloadPlayback
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(VUIBackgroundMediaController *)self name];
    int v7 = 134218242;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    float v10 = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) clearPreloadPlayback", (uint8_t *)&v7, 0x16u);
  }
  BOOL v5 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
  [v5 setPreloadPlaybackEnabled:0];

  BOOL v6 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
  [v6 clearPreloadedPlayback];
}

- (void)_startPreloadPlaybackIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(VUIBackgroundMediaController *)self name];
    int v12 = 134218498;
    __int16 v13 = self;
    __int16 v14 = 2112;
    __int16 v15 = v4;
    __int16 v16 = 1024;
    BOOL v17 = [(VUIBackgroundMediaController *)self isPreloadPlaybackEnabled];
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) update preloadPlaybackEnabled = %d", (uint8_t *)&v12, 0x1Cu);
  }
  BOOL v5 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
  objc_msgSend(v5, "setPreloadPlaybackEnabled:", -[VUIBackgroundMediaController isPreloadPlaybackEnabled](self, "isPreloadPlaybackEnabled"));

  BOOL v6 = +[VUIPlaybackManager sharedInstance];
  int v7 = [v6 isFullscreenPlaybackUIBeingShown];

  if (v7)
  {
    uint64_t v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = [(VUIBackgroundMediaController *)self name];
      int v12 = 134218242;
      __int16 v13 = self;
      __int16 v14 = 2112;
      __int16 v15 = v9;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) skipped startPreloadPlayback due to full screen playback", (uint8_t *)&v12, 0x16u);
    }
LABEL_11:

    return;
  }
  if ([(VUIBackgroundMediaController *)self isPlaybackEnabled]
    && [(VUIBackgroundMediaController *)self isPreloadPlaybackEnabled])
  {
    float v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(VUIBackgroundMediaController *)self name];
      int v12 = 134218242;
      __int16 v13 = self;
      __int16 v14 = 2112;
      __int16 v15 = v11;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) startPreloadPlayback", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v8 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
    [v8 preloadPlayback];
    goto LABEL_11;
  }
}

- (BOOL)_shouldPausePlaybackDueToDeactivationReasons
{
  return ([(VUIBackgroundMediaController *)self deactivationReasons] & 0xFFFFEDEA) != 0;
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

- (void)_registerPlaybackManagerNotification
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_playBackManagerFullscreenPlaybackUIDidChangeNotification_ name:VUIPlaybackManagerFullscreenPlaybackUIDidChangeNotification[0] object:0];
  [v4 addObserver:self selector:sel_playbackManagerShowingExtrasDidChangeNotification_ name:VUIPlaybackManagerShowingExtrasDidChangeNotification[0] object:0];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_updateAudioMuteWithPIPingPlayback name:VUIPlaybackManagerIsPIPingDidChangeNotification[0] object:0];
}

- (void)playBackManagerFullscreenPlaybackUIDidChangeNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = +[VUIPlaybackManager sharedInstance];
  int v5 = [v4 isFullscreenPlaybackUIBeingShown];

  char v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(VUIBackgroundMediaController *)self name];
    *(_DWORD *)buf = 134218498;
    int v12 = self;
    __int16 v13 = 2112;
    __int16 v14 = v7;
    __int16 v15 = 1024;
    int v16 = v5;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playbackManagerFullScreenUIDidChange: %d", buf, 0x1Cu);
  }
  if (v5)
  {
    [(VUIBackgroundMediaController *)self _clearPreloadPlayback];
    [(VUIBackgroundMediaController *)self _handlePlaybackManagerUIDidChange];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__VUIBackgroundMediaController_playBackManagerFullscreenPlaybackUIDidChangeNotification___block_invoke;
    block[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __89__VUIBackgroundMediaController_playBackManagerFullscreenPlaybackUIDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePlaybackManagerUIDidChange];
}

- (void)playbackManagerShowingExtrasDidChangeNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(VUIBackgroundMediaController *)self name];
    int v6 = 134218242;
    int v7 = self;
    __int16 v8 = 2112;
    __int16 v9 = v5;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playbackManagerShowingExtrasDidChangeNotification", (uint8_t *)&v6, 0x16u);
  }
  [(VUIBackgroundMediaController *)self _handlePlaybackManagerUIDidChange];
}

- (void)_handlePlaybackManagerUIDidChange
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(VUIBackgroundMediaController *)self loadsPlayerWithFullscreenPlayback])
  {
    BOOL v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(VUIBackgroundMediaController *)self name];
      int v11 = 134218242;
      int v12 = self;
      __int16 v13 = 2112;
      __int16 v14 = v4;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) _handlePlaybackManagerUIDidChange: skip as loadsPlayerWithFullscreenPlayback=true", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    int v5 = +[VUIPlaybackManager sharedInstance];
    int v6 = [v5 isFullscreenPlaybackUIBeingShown];

    int v7 = +[VUIPlaybackManager sharedInstance];
    int v8 = [v7 isShowingExtras];

    __int16 v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(VUIBackgroundMediaController *)self name];
      int v11 = 134218754;
      int v12 = self;
      __int16 v13 = 2112;
      __int16 v14 = v10;
      __int16 v15 = 1024;
      int v16 = v6;
      __int16 v17 = 1024;
      int v18 = v8;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) _handlePlaybackManagerUIDidChange isFullscreenPlaybackUIBeingShown=%d, isShowingExtras=%d", (uint8_t *)&v11, 0x22u);
    }
    if ((v6 | v8) == 1) {
      [(VUIBackgroundMediaController *)self _disablePlaybackWhenShowingFullScreenUIIfNeeded];
    }
    else {
      [(VUIBackgroundMediaController *)self _enablePlaybackWhenFullScreenPlaybackEnd];
    }
  }
}

- (void)_disablePlaybackWhenShowingFullScreenUIIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VUIBackgroundMediaController *)self stateMachine];
  id v4 = [v3 currentState];
  int v5 = [v4 isEqualToString:@"waiting for timeout while paused"];

  int v6 = [(VUIBackgroundMediaController *)self player];
  if (v6)
  {
    int v7 = [(VUIBackgroundMediaController *)self player];
    int v8 = [v7 state];
    __int16 v9 = [MEMORY[0x1E4FA9D88] stopped];
    BOOL v10 = v8 == v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  if (((![(VUIBackgroundMediaController *)self isPlaybackEnabled] | v5) & 1) == 0 && !v10)
  {
    int v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(VUIBackgroundMediaController *)self name];
      int v13 = 134218242;
      __int16 v14 = self;
      __int16 v15 = 2112;
      int v16 = v12;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) fullscreenPlayback did shown, disable playback", (uint8_t *)&v13, 0x16u);
    }
    [(VUIBackgroundMediaController *)self setShouldPlayAfterFullplaybackUIDidEnd:1];
    [(VUIBackgroundMediaController *)self setPlaybackEnabled:0];
  }
}

- (void)_enablePlaybackWhenFullScreenPlaybackEnd
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(VUIBackgroundMediaController *)self shouldPlayAfterFullplaybackUIDidEnd]
    && [(VUIBackgroundMediaController *)self hasViewAppeared])
  {
    BOOL v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(VUIBackgroundMediaController *)self name];
      int v5 = 134218242;
      int v6 = self;
      __int16 v7 = 2112;
      int v8 = v4;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) fullscreenPlayback did end, enable playback", (uint8_t *)&v5, 0x16u);
    }
    [(VUIBackgroundMediaController *)self setShouldPlayAfterFullplaybackUIDidEnd:0];
    [(VUIBackgroundMediaController *)self setPlaybackEnabled:1];
  }
}

- (id)_activePIPPlayer
{
  id v2 = +[VUIPlaybackManager sharedInstance];
  BOOL v3 = [v2 backgroundMediaPlayer];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    int v6 = +[VUIPlaybackManager sharedInstance];
    id v5 = [v6 activePlayer];
  }
  return v5;
}

- (void)updateAudioMuteWithPIPingPlayback
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_27(&dword_1E2BD7000, v2, v3, "VUIBackgroundMediaController::(%p: %@) isPIPing is true, but no active player", v4, v5, v6, v7, v8);
}

- (void)setActivePIPingPlayer:(id)a3
{
  uint64_t v5 = (VUIPlayer *)a3;
  p_activePIPingPlayer = &self->_activePIPingPlayer;
  activePIPingPlayer = self->_activePIPingPlayer;
  if (activePIPingPlayer != v5)
  {
    int v11 = v5;
    uint8_t v8 = (void *)MEMORY[0x1E4FAA3C0];
    if (activePIPingPlayer)
    {
      uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 removeObserver:self name:*v8 object:*p_activePIPingPlayer];

      [(VUIPlayer *)*p_activePIPingPlayer removeObserver:self forKeyPath:@"muted" context:__PIPingPlayerMutedKVOContext];
    }
    objc_storeStrong((id *)&self->_activePIPingPlayer, a3);
    uint64_t v5 = v11;
    if (v11)
    {
      BOOL v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:self selector:sel__pipPlaybackStateChanged_ name:*v8 object:v11];

      [(VUIPlayer *)v11 addObserver:self forKeyPath:@"muted" options:0 context:__PIPingPlayerMutedKVOContext];
      uint64_t v5 = v11;
    }
  }
}

- (void)_pipPlaybackStateChanged:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4FAA3C8]];

  uint64_t v7 = [v4 userInfo];

  uint8_t v8 = [v7 objectForKey:*MEMORY[0x1E4FAA3D0]];

  uint64_t v9 = VUIDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = [(VUIBackgroundMediaController *)self name];
    int v12 = 134218754;
    int v13 = self;
    __int16 v14 = 2112;
    __int16 v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) PIP playback state changed, new state %@, old state %@", (uint8_t *)&v12, 0x2Au);
  }
  int v11 = [MEMORY[0x1E4FA9D88] playing];

  if (v6 == v11) {
    [(VUIBackgroundMediaController *)self setMutePlaybackInBackground:1];
  }
}

- (void)_pipPlaybackDidChangeMutedState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUIBackgroundMediaController *)self _activePIPPlayer];
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(VUIBackgroundMediaController *)self name];
    int v6 = 134218498;
    uint64_t v7 = self;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 1024;
    int v11 = [v3 muted];
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) PIP playback did change muted state: %d", (uint8_t *)&v6, 0x1Cu);
  }
  if (v3 && ([v3 muted] & 1) == 0) {
    [(VUIBackgroundMediaController *)self setMutePlaybackInBackground:1];
  }
}

- (void)_registerAudioSessionNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__audioSessionSilentSecondaryAudioDidChange_ name:*MEMORY[0x1E4F15188] object:0];
}

- (void)_registerPlayerNotifications
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(VUIBackgroundMediaController *)self name];
    int v15 = 134218242;
    __int16 v16 = self;
    __int16 v17 = 2112;
    __int16 v18 = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) register player notifications and add observers", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4FAA3C0];
  uint64_t v7 = [(VUIBackgroundMediaController *)self player];
  [v5 addObserver:self selector:sel__playbackStateChanged_ name:v6 object:v7];

  uint64_t v8 = *MEMORY[0x1E4FAA268];
  uint64_t v9 = [(VUIBackgroundMediaController *)self player];
  [v5 addObserver:self selector:sel__playbackErrorDidOccur_ name:v8 object:v9];

  uint64_t v10 = *MEMORY[0x1E4FAA3D8];
  int v11 = [(VUIBackgroundMediaController *)self player];
  [v5 addObserver:self selector:sel__playbackStateWillChange_ name:v10 object:v11];

  uint64_t v12 = *MEMORY[0x1E4FAA3F8];
  int v13 = [(VUIBackgroundMediaController *)self player];
  [v5 addObserver:self selector:sel__externalPlaybackStateChanged_ name:v12 object:v13];

  [v5 addObserver:self selector:sel__mediaControllerStartedPlayback_ name:@"VUIBackgroundMediaControllerWillStartPlaybackNotification" object:0];
  [v5 addObserver:self selector:sel__mediaControllerStartedPlayback_ name:@"VUIBackgroundMediaControllerDidStartPlaybackNotification" object:0];
  if (![(VUIBackgroundMediaController *)self observingInitialMediaItemHasCompletedInitialLoading])
  {
    __int16 v14 = [(VUIBackgroundMediaController *)self player];
    [v14 addObserver:self forKeyPath:@"initialMediaItemHasCompletedInitialLoading" options:0 context:__PlayerInitialMediaItemHasCompletedInitialLoadingKVOContext_0];

    [(VUIBackgroundMediaController *)self setObservingInitialMediaItemHasCompletedInitialLoading:1];
  }
}

- (void)_unregisterPlayerNotifications
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(VUIBackgroundMediaController *)self name];
    int v15 = 134218242;
    __int16 v16 = self;
    __int16 v17 = 2112;
    __int16 v18 = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) unregister player notifications and remove observers", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4FAA3C0];
  uint64_t v7 = [(VUIBackgroundMediaController *)self player];
  [v5 removeObserver:self name:v6 object:v7];

  uint64_t v8 = *MEMORY[0x1E4FAA268];
  uint64_t v9 = [(VUIBackgroundMediaController *)self player];
  [v5 removeObserver:self name:v8 object:v9];

  uint64_t v10 = *MEMORY[0x1E4FAA3D8];
  int v11 = [(VUIBackgroundMediaController *)self player];
  [v5 removeObserver:self name:v10 object:v11];

  uint64_t v12 = *MEMORY[0x1E4FAA3F8];
  int v13 = [(VUIBackgroundMediaController *)self player];
  [v5 removeObserver:self name:v12 object:v13];

  [v5 removeObserver:self name:@"VUIBackgroundMediaControllerWillStartPlaybackNotification" object:0];
  [v5 removeObserver:self name:@"VUIBackgroundMediaControllerDidStartPlaybackNotification" object:0];
  if ([(VUIBackgroundMediaController *)self observingInitialMediaItemHasCompletedInitialLoading])
  {
    __int16 v14 = [(VUIBackgroundMediaController *)self player];
    [v14 removeObserver:self forKeyPath:@"initialMediaItemHasCompletedInitialLoading" context:__PlayerInitialMediaItemHasCompletedInitialLoadingKVOContext_0];

    [(VUIBackgroundMediaController *)self setObservingInitialMediaItemHasCompletedInitialLoading:0];
  }
}

- (BOOL)_canPause
{
  uint64_t v2 = [(VUIBackgroundMediaController *)self player];
  [v2 duration];
  BOOL v4 = v3 != *MEMORY[0x1E4FA9DC0];

  return v4;
}

- (void)_updateWithMediaInfo:(id)a3 withDirection:(unint64_t)a4 imageVideoSwapBehavior:(unint64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  v32[4] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (v10)
  {
    [(VUIBackgroundMediaController *)self _addContentViewIfNeeded];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [v10 tvpPlaylist];
      -[VUIBackgroundMediaController setVpafPlaybackStartReason:](self, "setVpafPlaybackStartReason:", [v10 playbackStartReason]);
      -[VUIBackgroundMediaController setVpafPlaybackStopReason:](self, "setVpafPlaybackStopReason:", [v10 playbackStopReason]);
    }
    else
    {
      int v11 = 0;
    }
    uint64_t v12 = [(VUIBackgroundMediaController *)self titleForLogging];
    if ([v12 length])
    {
      int v13 = [(VUIBackgroundMediaController *)self name];
      uint64_t v14 = [v13 rangeOfString:v12];
      uint64_t v16 = v15;

      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        __int16 v17 = [(VUIBackgroundMediaController *)self name];
        objc_msgSend(v17, "stringByReplacingCharactersInRange:withString:", v14, v16, &stru_1F3E921E0);
        __int16 v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        name = self->_name;
        self->_name = v18;

        [(VUIBackgroundMediaController *)self setTitleForLogging:0];
      }
    }
    uint64_t v20 = [v11 currentMediaItem];
    __int16 v21 = [v20 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];

    if ([v21 length])
    {
      __int16 v22 = [NSString stringWithFormat:@"(%@)", v21];
      [(VUIBackgroundMediaController *)self setTitleForLogging:v22];
      __int16 v23 = [(NSString *)self->_name stringByAppendingString:v22];
      BOOL v24 = self->_name;
      self->_name = v23;
    }
    __int16 v25 = [v10 alphaImageProxy];
    [(VUIBackgroundMediaController *)self _setAlphaImageProxy:v25];

    v31[0] = @"DirectionKey";
    BOOL v26 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
    v32[0] = v26;
    v31[1] = @"AnimatedKey";
    __int16 v27 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
    v32[1] = v27;
    v31[2] = @"ImageVideoSwapBehaviorKey";
    BOOL v28 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a5];
    v31[3] = @"PlaybackStopReasonKey";
    v32[2] = v28;
    v32[3] = &unk_1F3F3E108;
    __int16 v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];

    int v30 = [(VUIBackgroundMediaController *)self stateMachine];
    [v30 postEvent:@"Set media info" withContext:0 userInfo:v29];
  }
}

- (BOOL)_playlist:(id)a3 contentMatchesPlaylist:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 currentMediaItem];
  uint64_t v8 = *MEMORY[0x1E4FAA0B8];
  uint64_t v9 = [v7 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0B8]];

  id v10 = [v5 currentMediaItem];
  uint64_t v11 = [v10 mediaItemMetadataForProperty:v8];

  uint64_t v12 = [v6 currentMediaItem];
  uint64_t v13 = [v12 mediaItemMetadataForProperty:@"VUIMediaItemMetadataClipId"];

  uint64_t v14 = [v5 currentMediaItem];
  uint64_t v15 = [v14 mediaItemMetadataForProperty:@"VUIMediaItemMetadataClipId"];

  int v16 = [v6 isEqualToPlaylist:v5];
  if (v9 | v11) {
    char v17 = [(id)v9 isEqualToDate:v11];
  }
  else {
    char v17 = 1;
  }
  if (!(v13 | v15))
  {
    char v18 = 1;
    if (!v16) {
      goto LABEL_6;
    }
LABEL_8:
    char v19 = v17 & v18;
    goto LABEL_9;
  }
  char v18 = [(id)v13 isEqualToString:v15];
  if (v16) {
    goto LABEL_8;
  }
LABEL_6:
  char v19 = 0;
LABEL_9:

  return v19;
}

- (BOOL)_mediaInfo:(id)a3 contentMatchesMediaInfo:(id)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    id v7 = a4;
    id v8 = a3;
    uint64_t v9 = [v8 imageProxies];
    uint64_t v10 = [v9 firstObject];

    uint64_t v11 = [v7 imageProxies];
    uint64_t v12 = [v11 firstObject];

    uint64_t v13 = [v8 tvpPlaylist];

    uint64_t v14 = [v7 tvpPlaylist];

    if (v10 | v12) {
      char v15 = [(id)v10 isEqual:v12];
    }
    else {
      char v15 = 1;
    }
    if (v13 | v14) {
      BOOL v16 = [(VUIBackgroundMediaController *)self _playlist:v13 contentMatchesPlaylist:v14];
    }
    else {
      BOOL v16 = 1;
    }
    BOOL v4 = v15 & v16;
  }
  return v4;
}

- (BOOL)_currentMediaInfoImagesMatchesNewMediaInfoImage:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIBackgroundMediaController *)self currentMediaInfo];
  id v6 = [v5 imageProxies];
  id v7 = [v6 firstObject];

  id v8 = [v4 imageProxies];

  uint64_t v9 = [v8 firstObject];

  char v10 = 0;
  if (v7 && v9) {
    char v10 = [v7 isEqual:v9];
  }

  return v10;
}

- (BOOL)_currentMediaInfoContentMatchesMediaInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIBackgroundMediaController *)self currentMediaInfo];
  LOBYTE(self) = [(VUIBackgroundMediaController *)self _mediaInfo:v5 contentMatchesMediaInfo:v4];

  return (char)self;
}

- (void)_setAlphaImageProxy:(id)a3
{
  p_alphaImageProxy = &self->_alphaImageProxy;
  id v7 = a3;
  if ((-[VUIImageProxy isEqual:](*p_alphaImageProxy, "isEqual:") & 1) == 0)
  {
    [(VUIImageProxy *)*p_alphaImageProxy cancel];
    id v6 = [(VUIBackgroundMediaController *)self alphaProxyImageView];
    [v6 setImage:0];

    objc_storeStrong((id *)&self->_alphaImageProxy, a3);
    [(VUIBackgroundMediaController *)self loadAlphaImageProxy];
    [(VUIBackgroundMediaController *)self _addAlphaProxyImageViewIfNeeded];
  }
}

- (void)loadAlphaImageProxy
{
  uint64_t v3 = [(VUIBackgroundMediaController *)self alphaImageProxy];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(VUIBackgroundMediaController *)self alphaProxyImageView];
    id v6 = [v5 image];

    if (!v6)
    {
      objc_initWeak(&location, self);
      id v7 = [(VUIBackgroundMediaController *)self alphaImageProxy];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      uint64_t v11 = __51__VUIBackgroundMediaController_loadAlphaImageProxy__block_invoke;
      uint64_t v12 = &unk_1E6DFC7B8;
      objc_copyWeak(&v13, &location);
      [v7 setCompletionHandler:&v9];

      id v8 = [(VUIBackgroundMediaController *)self alphaImageProxy];
      [v8 load];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __51__VUIBackgroundMediaController_loadAlphaImageProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 uiImage];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __51__VUIBackgroundMediaController_loadAlphaImageProxy__block_invoke_2;
  id v13 = &unk_1E6DF5490;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  id v8 = v7;
  id v14 = v8;
  uint64_t v9 = &v10;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v10, v11)) {
    v12((uint64_t)v9);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }

  objc_destroyWeak(&v15);
}

void __51__VUIBackgroundMediaController_loadAlphaImageProxy__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained alphaProxyImageView];
  [v2 setImage:*(void *)(a1 + 32)];

  uint64_t v3 = [WeakRetained proxyImageView];
  uint64_t v4 = [v3 image];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [WeakRetained proxyImageView];
    char v7 = [v6 isHidden];

    if ((v7 & 1) == 0) {
      [WeakRetained showAlphaImage:1 animated:1];
    }
  }
  else
  {
  }
}

- (void)_performPlayerVolumeAnimatedUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = [(VUIBackgroundMediaController *)self player];
  [v5 volume];
  float v7 = v6;

  if (v3) {
    [(VUIBackgroundMediaController *)self foregroundVolume];
  }
  else {
    [(VUIBackgroundMediaController *)self backgroundVolume];
  }
  float v9 = v8;
  if (v8 == -1.0)
  {
    uint64_t v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(VUIBackgroundMediaController *)self name];
      *(_DWORD *)buf = 134218242;
      __int16 v23 = self;
      __int16 v24 = 2112;
      __int16 v25 = v11;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) volume fading is not supported, returning without any volume changes.", buf, 0x16u);
    }
  }
  else
  {
    BOOL v12 = v7 < v8;
    if (!v3) {
      BOOL v12 = v7 > v8;
    }
    if (v12)
    {
      [(VUIBackgroundMediaController *)self fullscreenTransitionVolumeAnimationChanges];
      if (v13 == -1.0)
      {
        if (v3) {
          float v14 = v9 - v7;
        }
        else {
          float v14 = v7 - v9;
        }
        *(float *)&double v15 = v14
                       / (float)[(VUIBackgroundMediaController *)self numberOfVolumeIncrements];
        [(VUIBackgroundMediaController *)self setFullscreenTransitionVolumeAnimationChanges:v15];
      }
      [(VUIBackgroundMediaController *)self volumeTransitionAnimationDuration];
      double v17 = v16 / (double)[(VUIBackgroundMediaController *)self numberOfVolumeIncrements];
      id v21 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
      -[VUIBackgroundMediaController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updatePlayerVolume_, v17);
    }
    else
    {
      char v18 = VUIDefaultLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        char v19 = [(VUIBackgroundMediaController *)self name];
        *(_DWORD *)buf = 134218498;
        __int16 v23 = self;
        __int16 v24 = 2112;
        __int16 v25 = v19;
        __int16 v26 = 2048;
        double v27 = v9;
        _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) reached final volume: [%f].", buf, 0x20u);
      }
      LODWORD(v20) = -1.0;
      [(VUIBackgroundMediaController *)self setFullscreenTransitionVolumeAnimationChanges:v20];
    }
  }
}

- (void)_updatePlayerVolume:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 BOOLValue];
  }
  else {
    uint64_t v6 = 0;
  }
  float v7 = [(VUIBackgroundMediaController *)self player];
  [v7 volume];
  float v9 = v8;

  if (v6)
  {
    [(VUIBackgroundMediaController *)self foregroundVolume];
    float v11 = v10;
    [(VUIBackgroundMediaController *)self fullscreenTransitionVolumeAnimationChanges];
    float v13 = v12;
    if (v9 >= v11)
    {
LABEL_17:
      double v20 = VUIDefaultLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [(VUIBackgroundMediaController *)self name];
        int v23 = 134218754;
        __int16 v24 = self;
        __int16 v25 = 2112;
        __int16 v26 = v21;
        __int16 v27 = 2048;
        double v28 = v11;
        __int16 v29 = 2048;
        double v30 = v13;
        _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) either reached final volume: [%f] or volume changes are invalid: [%f]", (uint8_t *)&v23, 0x2Au);
      }
      LODWORD(v22) = -1.0;
      [(VUIBackgroundMediaController *)self setFullscreenTransitionVolumeAnimationChanges:v22];
      goto LABEL_20;
    }
  }
  else
  {
    [(VUIBackgroundMediaController *)self backgroundVolume];
    float v11 = v14;
    [(VUIBackgroundMediaController *)self fullscreenTransitionVolumeAnimationChanges];
    float v13 = v15;
  }
  if (((v9 <= v11) & ~v6) != 0 || v13 == -1.0) {
    goto LABEL_17;
  }
  float v16 = v11 - v9;
  if (!v6) {
    float v16 = v9 - v11;
  }
  if (v16 >= v13) {
    float v16 = v13;
  }
  if (!v6) {
    float v16 = -v16;
  }
  float v17 = v9 + v16;
  char v18 = [(VUIBackgroundMediaController *)self player];
  *(float *)&double v19 = v17;
  [v18 setVolume:v19];

  [(VUIBackgroundMediaController *)self _performPlayerVolumeAnimatedUpdate:v6];
LABEL_20:
}

- (void)_cleanUpPlaybackTimers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VUIBackgroundMediaController *)self playbackLoadingTimer];
  if (v3)
  {
    id v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(VUIBackgroundMediaController *)self name];
      int v9 = 134218242;
      float v10 = self;
      __int16 v11 = 2112;
      float v12 = v5;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) invalidating playlist loading timer.", (uint8_t *)&v9, 0x16u);
    }
    [v3 invalidate];
    [(VUIBackgroundMediaController *)self setPlaybackLoadingTimer:0];
    [(VUIBackgroundMediaController *)self setPlaybackLoadingStartDate:0];
  }
  uint64_t v6 = [(VUIBackgroundMediaController *)self playbackDelayTimer];
  if (v6)
  {
    float v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      float v8 = [(VUIBackgroundMediaController *)self name];
      int v9 = 134218242;
      float v10 = self;
      __int16 v11 = 2112;
      float v12 = v8;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) invalidating playback timer.", (uint8_t *)&v9, 0x16u);
    }
    [v6 invalidate];
    [(VUIBackgroundMediaController *)self setPlaybackDelayTimer:0];
    [(VUIBackgroundMediaController *)self setPlaybackLoadingStartDate:0];
  }
}

- (void)_cleanUpEverything
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(VUIBackgroundMediaController *)self name];
    int v8 = 134218242;
    int v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) cleaning up everything for", (uint8_t *)&v8, 0x16u);
  }
  id v5 = [(VUIBackgroundMediaController *)self proxyImageView];
  [v5 setImage:0];

  uint64_t v6 = [(VUIBackgroundMediaController *)self proxyImageView];
  [v6 setImageProxy:0];

  float v7 = [(VUIBackgroundMediaController *)self alphaImageProxy];
  [v7 cancel];

  [(VUIBackgroundMediaController *)self _cleanUpEverythingPlaybackRelated];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
}

- (void)_cleanUpEverythingPlaybackRelated
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  BOOL v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(VUIBackgroundMediaController *)self name];
    *(_DWORD *)buf = 134218242;
    __int16 v35 = self;
    __int16 v36 = 2112;
    uint64_t v37 = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) cleaning up player and playback view controller.", buf, 0x16u);
  }
  [(VUIBackgroundMediaController *)self _cleanUpPlaybackTimers];
  [(VUIBackgroundMediaController *)self _unregisterPlayerNotifications];
  [(VUIBackgroundMediaController *)self _removePlaybackViewController];
  id v5 = [(VUIBackgroundMediaController *)self secondaryVideoView];
  if (v5)
  {
    uint64_t v6 = [(VUIBackgroundMediaController *)self secondaryVideoView];
    float v7 = [v6 superview];
    BOOL v8 = v7 == 0;

    if (!v8)
    {
      int v9 = [(VUIBackgroundMediaController *)self secondaryVideoView];
      [v9 removeFromSuperview];
    }
  }
  [(VUIBackgroundMediaController *)self setSecondaryVideoView:0];
  [(VUIBackgroundMediaController *)self setAvPlayerViewController:0];
  [(VUIBackgroundMediaController *)self setPlaybackContainerController:0];
  if ([(VUIBackgroundMediaController *)self didWeCreatePlayer])
  {
    __int16 v10 = [(VUIBackgroundMediaController *)self player];
    [v10 removeObserver:self forKeyPath:@"avPlayer" context:__PlayerAVPlayerKVOContext_1];

    __int16 v11 = [(VUIBackgroundMediaController *)self player];
    [v11 removeObserver:self forKeyPath:@"preferredAudioLanguageCode" context:__PlayerPreferredAudioLanguageCode];

    uint64_t v12 = [(VUIBackgroundMediaController *)self player];
    [v12 removeObserver:self forKeyPath:@"prefersAudioDescriptions" context:__PlayerPrefersAudioDescriptions];

    [(VUIBackgroundMediaController *)self videoAudioRampDuration];
    double v14 = v13;
    if (v13 <= 0.0)
    {
      double v20 = [(VUIBackgroundMediaController *)self player];
      [v20 setElapsedTime:0.0];
    }
    else
    {
      objc_initWeak((id *)buf, self);
      float v15 = [(VUIBackgroundMediaController *)self player];
      float v16 = [(VUIBackgroundMediaController *)self rampDownPlayer];

      if (v16)
      {
        float v17 = +[VUIPlayerValidationManager sharedInstance];
        char v18 = [(VUIBackgroundMediaController *)self rampDownPlayer];
        [v17 removeReferenceForPlayer:v18];
      }
      [(VUIBackgroundMediaController *)self setRampDownPlayer:v15];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__VUIBackgroundMediaController__cleanUpEverythingPlaybackRelated__block_invoke;
      block[3] = &unk_1E6DFD870;
      id v32 = v15;
      v33[1] = *(id *)&v14;
      id v19 = v15;
      objc_copyWeak(v33, (id *)buf);
      dispatch_async(MEMORY[0x1E4F14428], block);
      objc_destroyWeak(v33);

      objc_destroyWeak((id *)buf);
    }
  }
  id v21 = [(VUIBackgroundMediaController *)self player];
  double v22 = [v21 state];
  int v23 = [MEMORY[0x1E4FA9D88] stopped];
  BOOL v24 = v22 == v23;

  if (!v24)
  {
    [(VUIBackgroundMediaController *)self videoAudioRampDuration];
    if (v25 == 0.0)
    {
      __int16 v26 = [(VUIBackgroundMediaController *)self player];
      [v26 stop];
    }
    __int16 v27 = [MEMORY[0x1E4FA9D88] stopped];
    [(VUIBackgroundMediaController *)self _recordBgAutoPlayMediaEventForPlaybackState:v27];
  }
  double v28 = [(VUIBackgroundMediaController *)self player];

  if (v28)
  {
    __int16 v29 = +[VUIPlayerValidationManager sharedInstance];
    double v30 = [(VUIBackgroundMediaController *)self player];
    [v29 removeReferenceForPlayer:v30];
  }
  [(VUIBackgroundMediaController *)self setPlayer:0];
}

void __65__VUIBackgroundMediaController__cleanUpEverythingPlaybackRelated__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  BOOL v3 = [MEMORY[0x1E4FA9D88] stopped];

  if (v2 != v3)
  {
    [*(id *)(a1 + 32) pauseWithVolumeRampDuration:*(double *)(a1 + 48)];
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__VUIBackgroundMediaController__cleanUpEverythingPlaybackRelated__block_invoke_2;
    block[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v6);
  }
}

void __65__VUIBackgroundMediaController__cleanUpEverythingPlaybackRelated__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanUpRampDownPlayer];
}

- (void)_cleanUpRampDownPlayer
{
  BOOL v3 = [(VUIBackgroundMediaController *)self rampDownPlayer];

  if (v3)
  {
    dispatch_time_t v4 = [(VUIBackgroundMediaController *)self rampDownPlayer];
    [v4 stop];

    id v5 = [(VUIBackgroundMediaController *)self rampDownPlayer];
    [v5 setElapsedTime:0.0];

    id v6 = +[VUIPlayerValidationManager sharedInstance];
    float v7 = [(VUIBackgroundMediaController *)self rampDownPlayer];
    [v6 removeReferenceForPlayer:v7];

    [(VUIBackgroundMediaController *)self setRampDownPlayer:0];
  }
}

- (void)_addOverlayViewAnimatedIfNeeded:(BOOL)a3 dismissAfter:(double)a4
{
  BOOL v5 = a3;
  float v7 = [(VUIBackgroundMediaController *)self currentMediaInfo];
  BOOL v8 = [v7 overlayView];

  if (v8)
  {
    int v9 = [v8 superview];

    if (!v9)
    {
      [v8 vuiAlpha];
      double v11 = v10;
      [v8 setVuiAlpha:0.0];
      uint64_t v12 = [(VUIBackgroundMediaController *)self view];
      objc_msgSend(v12, "vui_addSubview:oldView:", v8, 0);

      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke;
      aBlock[3] = &unk_1E6DF6248;
      v25[1] = *(id *)&a4;
      objc_copyWeak(v25, &location);
      id v13 = v8;
      id v24 = v13;
      BOOL v26 = v5;
      double v14 = (void (**)(void))_Block_copy(aBlock);
      if (v5)
      {
        float v15 = (void *)MEMORY[0x1E4FB1EB0];
        double imageAnimationDuration = self->_imageAnimationDuration;
        unint64_t imageAnimationOptions = self->_imageAnimationOptions;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_3;
        v20[3] = &unk_1E6DF6270;
        id v21 = v13;
        double v22 = v11;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        void v18[2] = __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_4;
        v18[3] = &unk_1E6DF3D80;
        id v19 = v14;
        objc_msgSend(v15, "vui_animateWithDuration:delay:options:animations:completion:", imageAnimationOptions, v20, v18, imageAnimationDuration, 0.0);
      }
      else
      {
        [v13 setVuiAlpha:v11];
        v14[2](v14);
      }

      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
    }
  }
}

void __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 48);
  if (v1 != 0.0)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CB00];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_2;
    v5[3] = &unk_1E6DF5C70;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    id v6 = *(id *)(a1 + 32);
    char v8 = *(unsigned char *)(a1 + 56);
    id v4 = (id)[v3 scheduledTimerWithTimeInterval:0 repeats:v5 block:v1];

    objc_destroyWeak(&v7);
  }
}

void __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeOverlayView:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVuiAlpha:*(double *)(a1 + 40)];
}

uint64_t __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_removeOverlayView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    [v6 setVuiAlpha:1.0];
    if (v4)
    {
      char v8 = (void *)MEMORY[0x1E4FB1EB0];
      double imageAnimationDuration = self->_imageAnimationDuration;
      unint64_t imageAnimationOptions = self->_imageAnimationOptions;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __60__VUIBackgroundMediaController__removeOverlayView_animated___block_invoke;
      v13[3] = &unk_1E6DF3D58;
      id v14 = v7;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __60__VUIBackgroundMediaController__removeOverlayView_animated___block_invoke_2;
      v11[3] = &unk_1E6DF5B20;
      id v12 = v14;
      objc_msgSend(v8, "vui_animateWithDuration:delay:options:animations:completion:", imageAnimationOptions, v13, v11, imageAnimationDuration, 0.0);
    }
    else
    {
      [v7 setVuiAlpha:0.0];
      [v7 removeFromSuperview];
    }
  }
}

uint64_t __60__VUIBackgroundMediaController__removeOverlayView_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVuiAlpha:0.0];
}

uint64_t __60__VUIBackgroundMediaController__removeOverlayView_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_animateTransitionFromView:(id)a3 toView:(id)a4 duration:(double)a5 direction:(unint64_t)a6 completion:(id)a7
{
  v58[4] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = (void (**)(void))a7;
  objc_initWeak(&location, self);
  if ([(VUIBackgroundMediaController *)self animateImageChange]
    && [(VUIBackgroundMediaController *)self imageSwappingAnimationType])
  {
    id v14 = [v12 constraints];
    [v12 removeConstraints:v14];

    float v15 = [(VUIBackgroundMediaController *)self view];
    [v15 bounds];
    double Width = CGRectGetWidth(v59);

    float v17 = [v12 widthAnchor];
    char v18 = [(VUIBackgroundMediaController *)self view];
    id v19 = [v18 widthAnchor];
    uint64_t v45 = [v17 constraintEqualToAnchor:v19];

    double v20 = [v12 heightAnchor];
    id v21 = [(VUIBackgroundMediaController *)self view];
    double v22 = [v21 heightAnchor];
    int v23 = [v20 constraintEqualToAnchor:v22];

    id v24 = [v12 centerXAnchor];
    double v25 = [(VUIBackgroundMediaController *)self view];
    BOOL v26 = [v25 centerXAnchor];
    __int16 v27 = [v24 constraintEqualToAnchor:v26];

    double v28 = [v12 centerYAnchor];
    __int16 v29 = [(VUIBackgroundMediaController *)self view];
    double v30 = [v29 centerYAnchor];
    uint64_t v31 = [v28 constraintEqualToAnchor:v30];

    unint64_t v32 = [(VUIBackgroundMediaController *)self imageSwappingAnimationType];
    switch(v32)
    {
      case 1uLL:
        BOOL v34 = [(VUIBackgroundMediaController *)self view];
        objc_msgSend(v34, "vui_bringSubviewToFront:", v12);

        [v11 setVuiAlpha:1.0];
        [v12 setVuiAlpha:0.0];
        break;
      case 2uLL:
        __int16 v35 = v27;
        double v36 = Width;
        if (a6 != 2)
        {
          if (a6 != 1) {
            break;
          }
          double v36 = -Width;
          __int16 v35 = v27;
        }
LABEL_17:
        objc_msgSend(v35, "setConstant:", v36, v45);
        break;
      case 3uLL:
        __int16 v33 = [(VUIBackgroundMediaController *)self view];
        objc_msgSend(v33, "vui_bringSubviewToFront:", v12);

        if (a6 == 2)
        {
          [v27 setConstant:Width * 0.5];
          goto LABEL_16;
        }
        if (a6 == 1)
        {
          [v27 setConstant:Width * -0.5];
LABEL_16:
          double v36 = -Width;
          __int16 v35 = (void *)v45;
          goto LABEL_17;
        }
        break;
    }
    uint64_t v37 = (void *)MEMORY[0x1E4F28DC8];
    v58[0] = v45;
    v58[1] = v23;
    v58[2] = v27;
    v58[3] = v31;
    uint64_t v38 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v58, 4, v45);
    [v37 activateConstraints:v38];

    BOOL v39 = [(VUIBackgroundMediaController *)self view];
    objc_msgSend(v39, "vui_setNeedsLayout");

    UIEdgeInsets v40 = [(VUIBackgroundMediaController *)self view];
    objc_msgSend(v40, "vui_layoutIfNeeded");

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__VUIBackgroundMediaController__animateTransitionFromView_toView_duration_direction_completion___block_invoke;
    block[3] = &unk_1E6DFD8C0;
    objc_copyWeak(v56, &location);
    v56[1] = (id)a6;
    id v49 = v27;
    id v50 = v46;
    v56[2] = *(id *)&Width;
    v56[3] = *(id *)&a5;
    id v51 = v11;
    id v52 = v12;
    id v53 = v23;
    id v54 = v31;
    v55 = v13;
    id v41 = v31;
    id v42 = v23;
    id v43 = v46;
    id v44 = v27;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(v56);
    goto LABEL_19;
  }
  if (v13) {
    v13[2](v13);
  }
LABEL_19:
  objc_destroyWeak(&location);
}

void __96__VUIBackgroundMediaController__animateTransitionFromView_toView_duration_direction_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 88);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v4 = [WeakRetained imageSwappingAnimationType];
  if (v4 == 3)
  {
    [*(id *)(a1 + 32) setConstant:0.0];
    [*(id *)(a1 + 40) setConstant:0.0];
    uint64_t v9 = *(void *)(a1 + 96);
    if (v9 == 2)
    {
      id v6 = [WeakRetained proxyImageCenterXConstraint];
      id v7 = v6;
      double v10 = *(double *)(a1 + 104);
      double v11 = -0.25;
    }
    else
    {
      if (v9 != 1) {
        goto LABEL_13;
      }
      id v6 = [WeakRetained proxyImageCenterXConstraint];
      id v7 = v6;
      double v10 = *(double *)(a1 + 104);
      double v11 = 0.25;
    }
    double v8 = v10 * v11;
    goto LABEL_12;
  }
  if (v4 == 2)
  {
    [*(id *)(a1 + 32) setConstant:0.0];
    uint64_t v5 = *(void *)(a1 + 96);
    if (v5 == 2)
    {
      id v6 = [WeakRetained proxyImageCenterXConstraint];
      id v7 = v6;
      double v8 = -*(double *)(a1 + 104);
      goto LABEL_12;
    }
    if (v5 == 1)
    {
      id v6 = [WeakRetained proxyImageCenterXConstraint];
      id v7 = v6;
      double v8 = *(double *)(a1 + 104);
LABEL_12:
      [v6 setConstant:v8];
    }
  }
LABEL_13:
  id v12 = (void *)MEMORY[0x1E4FB1EB0];
  double v13 = *(double *)(a1 + 112);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __96__VUIBackgroundMediaController__animateTransitionFromView_toView_duration_direction_completion___block_invoke_2;
  v21[3] = &unk_1E6DF3F90;
  objc_copyWeak(&v24, v2);
  id v22 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__VUIBackgroundMediaController__animateTransitionFromView_toView_duration_direction_completion___block_invoke_3;
  v14[3] = &unk_1E6DFD898;
  objc_copyWeak(&v20, v2);
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 64);
  id v17 = *(id *)(a1 + 32);
  id v18 = *(id *)(a1 + 72);
  id v19 = *(id *)(a1 + 80);
  objc_msgSend(v12, "vui_animateWithDuration:animations:completion:", v21, v14, v13);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v24);
}

void __96__VUIBackgroundMediaController__animateTransitionFromView_toView_duration_direction_completion___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if ([WeakRetained imageSwappingAnimationType] == 1)
  {
    [a1[4] setVuiAlpha:0.0];
    [a1[5] setVuiAlpha:1.0];
  }
  uint64_t v2 = [WeakRetained view];
  objc_msgSend(v2, "vui_setNeedsLayout");

  BOOL v3 = [WeakRetained view];
  objc_msgSend(v3, "vui_layoutIfNeeded");
}

void __96__VUIBackgroundMediaController__animateTransitionFromView_toView_duration_direction_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained setProxyImageWidthConstraint:*(void *)(a1 + 32)];
  [WeakRetained setProxyImageHeightConstraint:*(void *)(a1 + 40)];
  [WeakRetained setProxyImageCenterXConstraint:*(void *)(a1 + 48)];
  [WeakRetained setProxyImageCenterYConstraint:*(void *)(a1 + 56)];
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)_transitionToNewImage:(id)a3 animated:(BOOL)a4 direction:(unint64_t)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  double v11 = (void (**)(void))a6;
  objc_initWeak(&location, self);
  id v12 = [(VUIBackgroundMediaController *)self proxyImageView];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__VUIBackgroundMediaController__transitionToNewImage_animated_direction_completion___block_invoke;
  aBlock[3] = &unk_1E6DF5490;
  objc_copyWeak(&v34, &location);
  id v13 = v12;
  id v33 = v13;
  id v14 = (void (**)(void))_Block_copy(aBlock);
  if (v8 && [(VUIBackgroundMediaController *)self animateImageChange])
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4FB3CE0]);
    [(VUIBackgroundMediaController *)self _configMirroredImageForBackgroundImage:v15];
    id v16 = [v10 uiImage];
    [v15 setImage:v16];

    objc_msgSend(v15, "setVuiContentMode:", objc_msgSend(v13, "vuiContentMode"));
    id v17 = [(VUIBackgroundMediaController *)self view];
    objc_msgSend(v17, "vui_insertSubview:belowSubview:oldView:", v15, v13, 0);

    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v18 = [(VUIBackgroundMediaController *)self proxyImageView];
    [v18 setVuiAlpha:1.0];

    [(VUIBackgroundMediaController *)self setProxyImageView:v15];
    [(VUIBackgroundMediaController *)self imageTransitionAnimationDuration];
    double v20 = v19;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    __int16 v27 = __84__VUIBackgroundMediaController__transitionToNewImage_animated_direction_completion___block_invoke_315;
    double v28 = &unk_1E6DFD8E8;
    double v30 = v14;
    id v29 = v13;
    uint64_t v31 = v11;
    [(VUIBackgroundMediaController *)self _animateTransitionFromView:v29 toView:v15 duration:a5 direction:&v25 completion:v20];
  }
  else
  {
    id v21 = [(VUIBackgroundMediaController *)self proxyImageView];
    [(VUIBackgroundMediaController *)self _configMirroredImageForBackgroundImage:v21];

    id v22 = [(VUIBackgroundMediaController *)self proxyImageView];
    id v23 = [v10 uiImage];
    [v22 setImage:v23];

    v14[2](v14);
    if (v11) {
      v11[2](v11);
    }
  }
  id v24 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v25, v26, v27, v28);
  [v24 postNotificationName:@"VUIBackgroundMediaControllerImageLoadedNotification" object:self];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

void __84__VUIBackgroundMediaController__transitionToNewImage_animated_direction_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [WeakRetained name];
    int v9 = 134218242;
    id v10 = WeakRetained;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) showing background image now.", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) setVuiAlpha:1.0];
  uint64_t v5 = [WeakRetained playbackContainerController];
  id v6 = [v5 view];
  [v6 setVuiAlpha:0.0];

  id v7 = [WeakRetained currentMediaInfo];
  LODWORD(v6) = [v7 showsSecondaryVideoView];

  if (v6)
  {
    BOOL v8 = [WeakRetained secondaryVideoView];
    [v8 setVuiAlpha:0.0];
  }
}

uint64_t __84__VUIBackgroundMediaController__transitionToNewImage_animated_direction_completion___block_invoke_315(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "vui_removeFromSuperView");
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_swapActiveMedia:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (a3)
  {
    char v9 = 1;
  }
  else
  {
    id v10 = [(VUIBackgroundMediaController *)self currentMediaInfo];
    char v9 = [v10 isAudioOnly];
  }
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke;
  aBlock[3] = &unk_1E6DF73E8;
  objc_copyWeak(&v34, &location);
  char v35 = v9;
  BOOL v36 = v5;
  __int16 v11 = _Block_copy(aBlock);
  if (v5 && [(VUIBackgroundMediaController *)self animateVideoChange])
  {
    unint64_t v12 = [(VUIBackgroundMediaController *)self videoSwappingAnimationType];
    uint64_t v13 = (void *)MEMORY[0x1E4FB1EB0];
    if (v12)
    {
      id v14 = [(VUIBackgroundMediaController *)self view];
      [(VUIBackgroundMediaController *)self imageVideoTransitionAnimationDuration];
      double v16 = v15;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_3;
      v27[3] = &unk_1E6DF3DD0;
      id v28 = v11;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      id v25[2] = __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_4;
      v25[3] = &unk_1E6DF3D80;
      id v26 = v8;
      objc_msgSend(v13, "vui_transitionWithView:duration:options:animations:completion:", v14, 5242880, v27, v25, v16);
      id v17 = &v28;
      id v18 = &v26;
    }
    else
    {
      [(VUIBackgroundMediaController *)self imageVideoTransitionAnimationDuration];
      double v21 = v20;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_316;
      v31[3] = &unk_1E6DF3DD0;
      id v32 = v11;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_2;
      v29[3] = &unk_1E6DF3D80;
      id v30 = v8;
      objc_msgSend(v13, "vui_animateWithDuration:delay:options:animations:completion:", 5242912, v31, v29, v21, 0.0);
      id v17 = &v32;
      id v18 = &v30;
    }

    [(VUIBackgroundMediaController *)self showAlphaImage:1 animated:1];
  }
  else
  {
    double v19 = (void *)MEMORY[0x1E4FB1EB0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_5;
    v22[3] = &unk_1E6DF6298;
    id v23 = v11;
    id v24 = v8;
    objc_msgSend(v19, "vui_performWithoutAnimation:", v22);
    [(VUIBackgroundMediaController *)self showAlphaImage:1 animated:0];
  }
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

void __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v4 = VUIDefaultLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = [WeakRetained name];
      int v7 = *(unsigned __int8 *)(a1 + 41);
      int v21 = 134218498;
      id v22 = WeakRetained;
      __int16 v23 = 2112;
      id v24 = v6;
      __int16 v25 = 1024;
      int v26 = v7;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) showing background image now, animated %d", (uint8_t *)&v21, 0x1Cu);
    }
    id v8 = [WeakRetained proxyImageView];
    [v8 setVuiAlpha:1.0];

    char v9 = [WeakRetained playbackContainerController];
    id v10 = [v9 view];
    [v10 setVuiAlpha:0.0];

    __int16 v11 = [WeakRetained currentMediaInfo];
    LODWORD(v10) = [v11 showsSecondaryVideoView];

    if (v10)
    {
      unint64_t v12 = [WeakRetained secondaryVideoView];
      uint64_t v13 = v12;
      double v14 = 0.0;
LABEL_10:
      [v12 setVuiAlpha:v14];
    }
  }
  else
  {
    if (v5)
    {
      double v15 = [WeakRetained name];
      int v16 = *(unsigned __int8 *)(a1 + 41);
      int v21 = 134218498;
      id v22 = WeakRetained;
      __int16 v23 = 2112;
      id v24 = v15;
      __int16 v25 = 1024;
      int v26 = v16;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) showing playback view now, animated %d", (uint8_t *)&v21, 0x1Cu);
    }
    id v17 = [WeakRetained proxyImageView];
    [v17 setVuiAlpha:0.0];

    id v18 = [WeakRetained playbackContainerController];
    double v19 = [v18 view];
    [v19 setVuiAlpha:1.0];

    double v20 = [WeakRetained currentMediaInfo];
    LODWORD(v19) = [v20 showsSecondaryVideoView];

    if (v19)
    {
      unint64_t v12 = [WeakRetained secondaryVideoView];
      uint64_t v13 = v12;
      double v14 = 1.0;
      goto LABEL_10;
    }
  }
}

uint64_t __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_316(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_5(uint64_t a1)
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
  int v3 = [(VUIBackgroundMediaController *)self currentMediaInfo];
  id v5 = [v3 contentView];

  if (v5)
  {
    uint64_t v4 = [(VUIBackgroundMediaController *)self view];
    objc_msgSend(v4, "vui_insertSubview:aboveSubview:oldView:", v5, 0, 0);

    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VUIBackgroundMediaController *)self _constrainToView:v5];
  }
}

- (void)setImageContentMode:(unint64_t)a3
{
  self->_imageContentMode = a3;
  id v4 = [(VUIBackgroundMediaController *)self proxyImageView];
  [v4 setVuiContentMode:a3];
}

- (void)setVideoGravity:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_videoGravity, a3);
  if (self->_keepVideoGravityUnchangedByVideoControlsVisibility)
  {
    id v5 = [(VUIBackgroundMediaController *)self avPlayerViewController];
    [v5 setVideoGravity:v11];

    id v6 = [(VUIBackgroundMediaController *)self prefetchPlayerViewController];
    [v6 setVideoGravity:v11];
  }
  else
  {
    BOOL v7 = [(VUIBackgroundMediaController *)self showsVideoControls];
    id v8 = (void *)*MEMORY[0x1E4F15AF0];
    if (!v7) {
      id v8 = v11;
    }
    id v9 = v8;
    id v10 = [(VUIBackgroundMediaController *)self avPlayerViewController];
    [v10 setVideoGravity:v9];

    id v6 = [(VUIBackgroundMediaController *)self prefetchPlayerViewController];
    [v6 setVideoGravity:v9];
  }
}

- (void)setAllowsExternalPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  self->_allowsExternalPlayback = a3;
  id v5 = [(VUIBackgroundMediaController *)self player];
  [v5 setAllowsExternalPlayback:v3];

  id v6 = [(VUIBackgroundMediaController *)self prefetchPlayer];
  [v6 setAllowsExternalPlayback:v3];
}

- (void)_addProxyImageView:(id)a3
{
  id v9 = a3;
  objc_msgSend(v9, "setVuiContentMode:", -[VUIBackgroundMediaController imageContentMode](self, "imageContentMode"));
  id v4 = v9;
  if (v9)
  {
    id v5 = [(VUIBackgroundMediaController *)self currentMediaInfo];
    id v6 = [v5 overlayView];

    BOOL v7 = [(VUIBackgroundMediaController *)self view];
    id v8 = v7;
    if (v6) {
      objc_msgSend(v7, "vui_insertSubview:belowSubview:oldView:", v9, v6, 0);
    }
    else {
      objc_msgSend(v7, "vui_addSubview:oldView:", v9, 0);
    }

    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VUIBackgroundMediaController *)self _constrainToView:v9];
    [v9 setVuiAlpha:0.0];

    id v4 = v9;
  }
}

- (void)_removeProxyImageView
{
  uint64_t v3 = [(VUIBackgroundMediaController *)self proxyImageView];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(VUIBackgroundMediaController *)self proxyImageView];
    id v6 = [v5 superview];

    if (v6)
    {
      id v7 = [(VUIBackgroundMediaController *)self proxyImageView];
      [v7 removeFromSuperview];
    }
  }
}

- (void)_addAlphaProxyImageViewIfNeeded
{
  id v9 = [(VUIBackgroundMediaController *)self alphaProxyImageView];
  if ([(VUIBackgroundMediaController *)self isViewLoaded])
  {
    if (!v9
      || ([v9 superview], uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                         v3,
                                         id v4 = v9,
                                         !v3))
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4FB3CE0]);

      [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v5 setVuiAlpha:0.0];
      objc_msgSend(v5, "vui_isAccessibilityElement:", 1);
      id v6 = [(VUIBackgroundMediaController *)self currentMediaInfo];
      id v7 = [v6 alphaLayerAccessibilityText];
      [v5 setAccessibilityLabel:v7];

      id v8 = [(VUIBackgroundMediaController *)self view];
      objc_msgSend(v8, "vui_addSubview:oldView:", v5, 0);

      [(VUIBackgroundMediaController *)self _constrainToView:v5];
      [(VUIBackgroundMediaController *)self setAlphaProxyImageView:v5];
      id v4 = v5;
    }
  }
  else
  {
    id v4 = v9;
  }
}

- (void)_loadImage:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
  unint64_t v6 = [(VUIBackgroundMediaController *)self mediaInfoIndex];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__VUIBackgroundMediaController__loadImage___block_invoke;
  v8[3] = &unk_1E6DF84E8;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v5 loadImageAtIndex:v6 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __43__VUIBackgroundMediaController__loadImage___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = VUIDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = [WeakRetained name];
    uint64_t v13 = VUIBoolLogString();
    *(_DWORD *)buf = 134218754;
    id v31 = WeakRetained;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2112;
    id v35 = v7;
    __int16 v36 = 2112;
    uint64_t v37 = v13;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) completed loading image: [%@], finished: [%@]", buf, 0x2Au);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__VUIBackgroundMediaController__loadImage___block_invoke_317;
  aBlock[3] = &unk_1E6DFD910;
  id v29 = *(id *)(a1 + 32);
  double v14 = _Block_copy(aBlock);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  int v21 = __43__VUIBackgroundMediaController__loadImage___block_invoke_3;
  id v22 = &unk_1E6DFD938;
  char v27 = a4;
  objc_copyWeak(&v26, v9);
  id v15 = v8;
  id v23 = v15;
  id v16 = v7;
  id v24 = v16;
  id v17 = v14;
  id v25 = v17;
  id v18 = &v19;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v19, v20)) {
    v21((uint64_t)v18);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v18);
  }

  objc_destroyWeak(&v26);
}

void __43__VUIBackgroundMediaController__loadImage___block_invoke_317(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  id v10 = __43__VUIBackgroundMediaController__loadImage___block_invoke_2;
  id v11 = &unk_1E6DF7A98;
  id v6 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  char v14 = a3;
  id v7 = (void *)MEMORY[0x1E4F29060];
  id v8 = v5;
  if ([v7 isMainThread]) {
    v10((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __43__VUIBackgroundMediaController__loadImage___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

void __43__VUIBackgroundMediaController__loadImage___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v3 = WeakRetained;
    if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
    {
      id v4 = VUIDefaultLogObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __43__VUIBackgroundMediaController__loadImage___block_invoke_3_cold_1(v3, (uint64_t *)(a1 + 32), v4);
      }

      id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      uint64_t v7 = [WeakRetained alphaImageProxy];
      if (v7)
      {
        id v8 = (void *)v7;
        id v9 = [v3 alphaProxyImageView];
        id v10 = [v9 image];

        if (!v10)
        {
          dispatch_time_t v11 = dispatch_time(0, 100000000);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          void block[2] = __43__VUIBackgroundMediaController__loadImage___block_invoke_4;
          block[3] = &unk_1E6DFAA70;
          objc_copyWeak(&v15, (id *)(a1 + 56));
          id v14 = *(id *)(a1 + 48);
          id v13 = *(id *)(a1 + 40);
          dispatch_after(v11, MEMORY[0x1E4F14428], block);

          objc_destroyWeak(&v15);
          goto LABEL_7;
        }
      }
      id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v5();
LABEL_7:

    return;
  }
  id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  v6();
}

void __43__VUIBackgroundMediaController__loadImage___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

- (void)_playbackStateWillChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v10 = [v4 objectForKey:*MEMORY[0x1E4FAA3C8]];

  id v5 = [MEMORY[0x1E4FA9D88] stopped];

  id v6 = v10;
  if (v10 == v5)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28ED0];
    id v8 = [(VUIBackgroundMediaController *)self player];
    [v8 cachedElapsedTime];
    id v9 = objc_msgSend(v7, "numberWithDouble:");
    [(VUIBackgroundMediaController *)self setElapsedTimeWhenStopped:v9];

    id v6 = v10;
  }
}

- (void)_playbackStateChanged:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4FAA3C8]];

  uint64_t v7 = [v4 userInfo];

  id v8 = [v7 objectForKey:*MEMORY[0x1E4FAA3D0]];

  id v9 = VUIDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(VUIBackgroundMediaController *)self name];
    dispatch_time_t v11 = [(VUIBackgroundMediaController *)self player];
    *(_DWORD *)buf = 134219010;
    uint64_t v38 = self;
    __int16 v39 = 2112;
    UIEdgeInsets v40 = v10;
    __int16 v41 = 2048;
    id v42 = v11;
    __int16 v43 = 2112;
    id v44 = v6;
    __int16 v45 = 2112;
    uint64_t v46 = v8;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playback state changed (%p), new state %@, old state %@", buf, 0x34u);
  }
  id v12 = [MEMORY[0x1E4FA9D88] playing];

  if (v6 == v12)
  {
    v35[0] = @"VUIBackgroundMediaControllerIsForegroundedKey";
    id v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[VUIBackgroundMediaController isBackgrounded](self, "isBackgrounded") ^ 1);
    v36[0] = v16;
    v35[1] = @"VUIBackgroundMediaControllerIsAutomaticPlaybackStartKey";
    id v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUIBackgroundMediaController isAutomaticPlaybackStart](self, "isAutomaticPlaybackStart"));
    v36[1] = v17;
    v35[2] = @"VUIBackgroundMediaControllerPlaybackStartReasonKey";
    id v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIBackgroundMediaController vpafPlaybackStartReason](self, "vpafPlaybackStartReason"));
    v36[2] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];

    [(VUIBackgroundMediaController *)self _updateCurrentPlaybackViewFrameForPlaybackInBackground:[(VUIBackgroundMediaController *)self isBackgrounded] animated:0];
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
    [(VUIBackgroundMediaController *)self setPlaybackStartDate:v20];

    [(VUIBackgroundMediaController *)self _recordBgAutoPlayMediaEventForPlaybackState:v6];
    int v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 postNotificationName:@"VUIBackgroundMediaControllerDidStartPlaybackNotification" object:self userInfo:v19];

LABEL_16:
    goto LABEL_17;
  }
  uint64_t v13 = [MEMORY[0x1E4FA9D88] paused];
  if (v6 == (void *)v13)
  {
  }
  else
  {
    id v14 = (void *)v13;
    id v15 = [MEMORY[0x1E4FA9D88] stopped];

    if (v6 != v15) {
      goto LABEL_17;
    }
  }
  id v22 = [(VUIBackgroundMediaController *)self player];
  [v22 cachedElapsedTime];
  double v24 = v23;

  id v25 = [(VUIBackgroundMediaController *)self player];
  [v25 duration];
  double v27 = v26;
  double v28 = *MEMORY[0x1E4FA9DC0];

  if (v24 > 0.0 && [(VUIBackgroundMediaController *)self recordPausedMediaEventAsStop]
    || v27 == v28
    || ([MEMORY[0x1E4FA9D88] stopped],
        id v29 = objc_claimAutoreleasedReturnValue(),
        v29,
        v6 == v29))
  {
    [(VUIBackgroundMediaController *)self _recordBgAutoPlayMediaEventForPlaybackState:v6];
  }
  id v30 = [MEMORY[0x1E4FA9D88] paused];

  if (v6 == v30)
  {
    uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 postNotificationName:@"VUIBackgroundMediaControllerDidPausePlaybackNotification" object:self userInfo:0];
    goto LABEL_16;
  }
LABEL_17:
  id v31 = [(VUIBackgroundMediaController *)self stateMachine];
  id v33 = @"PlaybackStateKey";
  __int16 v34 = v6;
  __int16 v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  [v31 postEvent:@"Player state changed" withContext:0 userInfo:v32];
}

- (void)_playbackErrorDidOccur:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4FAA3E8]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v9 = [(VUIBackgroundMediaController *)self player];
    uint64_t v7 = [v9 currentMediaItem];
    id v8 = [v7 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
    [v8 addSingleShotEventWithName:*MEMORY[0x1E4FAA350] value:*MEMORY[0x1E4FAA398]];
  }
}

- (void)_mediaControllerStartedPlayback:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 object];
  if (v4 != self)
  {
    id v5 = [(VUIBackgroundMediaController *)self player];
    int v6 = [v5 state];
    uint64_t v7 = [MEMORY[0x1E4FA9D88] stopped];

    if (v6 != v7)
    {
      if ([(VUIBackgroundMediaController *)self shouldStopWhenAnotherMediaControllerStarts])
      {
        id v8 = VUIDefaultLogObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [(VUIBackgroundMediaController *)self name];
          id v10 = [(VUIBackgroundMediaController *)v4 name];
          int v11 = 134218498;
          id v12 = self;
          __int16 v13 = 2112;
          id v14 = v9;
          __int16 v15 = 2112;
          id v16 = v10;
          _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) received stop event because %@ will start playback.", (uint8_t *)&v11, 0x20u);
        }
        [(VUIBackgroundMediaController *)self setAutomaticPlaybackStop:1];
        [(VUIBackgroundMediaController *)self setVpafPlaybackStopReason:1];
        [(VUIBackgroundMediaController *)self stop];
      }
    }
  }
}

- (void)_updatePlayerMuteStateForBackgroundPlaybackWithReason:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VUIBackgroundMediaController *)self currentMediaInfo];
  if ([v5 intent]) {
    goto LABEL_2;
  }
  int v6 = [(VUIBackgroundMediaController *)self player];

  if (!v6) {
    goto LABEL_3;
  }
  BOOL v7 = [(VUIBackgroundMediaController *)self isBackgrounded];
  id v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(VUIBackgroundMediaController *)self name];
    id v10 = VUIBoolLogString();
    [(VUIBackgroundMediaController *)self mutePlaybackInBackground];
    int v11 = VUIBoolLogString();
    [(VUIBackgroundMediaController *)self isMuted];
    id v12 = VUIBoolLogString();
    int v20 = 134219010;
    int v21 = self;
    __int16 v22 = 2112;
    double v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    double v27 = v11;
    __int16 v28 = 2112;
    id v29 = v12;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) isBackgrounded:<%@>, mutePlaybackInBackground<%@>, isMuted:<%@>", (uint8_t *)&v20, 0x34u);
  }
  if (v7) {
    BOOL v7 = [(VUIBackgroundMediaController *)self mutePlaybackInBackground]
  }
      || [(VUIBackgroundMediaController *)self isMuted];
  __int16 v13 = [(VUIBackgroundMediaController *)self player];
  [v13 setMuted:v7];

  id v5 = +[VUIPlaybackManager sharedInstance];
  if (![v5 isPIPing]
    || [(VUIBackgroundMediaController *)self mutePlaybackInBackground])
  {
LABEL_2:
  }
  else
  {
    int v14 = [v4 isEqualToString:@"VUIBackgroundMediaControllerPlaybackMuteReasonAssigned"];

    if (v14)
    {
      __int16 v15 = +[VUIInterfaceFactory sharedInstance];
      id v16 = [v15 groupActivitiesManager];
      int v17 = [v16 isSessionActive];

      id v18 = [(VUIBackgroundMediaController *)self _activePIPPlayer];
      uint64_t v19 = v18;
      if (v17) {
        [v18 setMuted:1];
      }
      else {
        [v18 pause];
      }
    }
  }
LABEL_3:
}

- (BOOL)isForeground
{
  uint64_t v2 = [(VUIBackgroundMediaController *)self stateMachine];
  id v3 = [v2 currentState];
  char v4 = [v3 isEqualToString:@"Showing playback in foreground"];

  return v4;
}

- (BOOL)didAVPlayerControllerEnterFullscreen
{
  return self->_didAVPlayerControllerEnterFullscreen
      && [(VUIBackgroundMediaController *)self isForeground];
}

- (BOOL)isBackgrounded
{
  id v3 = [(VUIBackgroundMediaController *)self avPlayerViewController];

  if (v3) {
    return ![(VUIBackgroundMediaController *)self showsVideoControls];
  }
  id v5 = [(VUIBackgroundMediaController *)self currentMediaInfo];

  return v5 != 0;
}

- (CGRect)_playbackContainerViewFrame:(BOOL)a3 hasSecondaryVideoView:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(VUIBackgroundMediaController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  if (v5 && v4)
  {
    [(VUIBackgroundMediaController *)self _secondaryVideoViewHeight];
    double v15 = v15 - v16;
  }
  double v17 = v9;
  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)_hasSecondaryView
{
  uint64_t v2 = [(VUIBackgroundMediaController *)self secondaryVideoView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_shouldShowSecondaryView
{
  BOOL v3 = [(VUIBackgroundMediaController *)self currentMediaInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [(VUIBackgroundMediaController *)self currentMediaInfo];
    char v5 = [v4 showsSecondaryVideoView];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (double)_secondaryVideoViewHeight
{
  BOOL v3 = [(VUIBackgroundMediaController *)self currentMediaInfo];
  [v3 primaryVideoAspectRatio];
  double v5 = v4;

  if (v5 <= 0.0) {
    return 300.0;
  }
  int v6 = [(VUIBackgroundMediaController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(VUIBackgroundMediaController *)self currentMediaInfo];
  [v11 primaryVideoAspectRatio];
  double v13 = v8 / v12;

  return fmax(v10 - v13, 0.0);
}

- (CGRect)_secondaryVideoViewFrame:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(VUIBackgroundMediaController *)self view];
  [v5 bounds];
  double v7 = v6;
  [(VUIBackgroundMediaController *)self _secondaryVideoViewHeight];
  double v9 = v8;

  double v10 = [(VUIBackgroundMediaController *)self view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;

  if (v3)
  {
    [(VUIBackgroundMediaController *)self _secondaryVideoViewHeight];
    double v14 = v14 - v15;
  }
  double v16 = v7 - v9;
  double v17 = 0.0;
  double v18 = v14;
  double v19 = v12;
  result.size.height = v16;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_updateCurrentPlaybackViewFrameForPlaybackInBackground:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (![(VUIBackgroundMediaController *)self _hasSecondaryView]) {
    return;
  }
  double v7 = [(VUIBackgroundMediaController *)self avPlayerViewController];

  if (!v7) {
    return;
  }
  [(VUIBackgroundMediaController *)self _playbackContainerViewFrame:v5 hasSecondaryVideoView:[(VUIBackgroundMediaController *)self _hasSecondaryView]];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [(VUIBackgroundMediaController *)self player];
  [v16 currentMediaItemPresentationSize];
  double v18 = v17;
  double v20 = v19;

  long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v44.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v44.c = v21;
  *(_OWORD *)&v44.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  char v22 = 0;
  if (![MEMORY[0x1E4FB3C90] isTV] || v20 <= 0.0)
  {
LABEL_12:
    double v24 = *(double *)&v15;
    double v25 = *(double *)&v13;
    double v26 = *(double *)&v11;
    double v27 = *(double *)&v9;
    goto LABEL_18;
  }
  double v23 = v18;
  double v24 = *(double *)&v15;
  double v25 = *(double *)&v13;
  double v26 = *(double *)&v11;
  double v27 = *(double *)&v9;
  if (*(double *)&v15 > 0.0)
  {
    if (v5)
    {
      double v28 = v23 / v20;
      if (v28 >= *(double *)&v13 / *(double *)&v15)
      {
        double v30 = round(*(double *)&v15);
        double v32 = round(v30 * v28);
        if (v32 >= *(double *)&v13 * 3.0) {
          double v25 = *(double *)&v13 * 3.0;
        }
        else {
          double v25 = v32;
        }
        double v31 = v25 / *(double *)&v13;
      }
      else
      {
        double v25 = round(*(double *)&v13);
        double v29 = round(v25 / v28);
        if (v29 >= *(double *)&v15 * 3.0) {
          double v29 = *(double *)&v15 * 3.0;
        }
        double v30 = v29;
        double v31 = v29 / *(double *)&v15;
      }
      CGAffineTransformMakeScale(&v44, v31, v31);
      double v24 = v30;
      double v26 = (*(double *)&v15 - v30) * 0.5;
      double v27 = (*(double *)&v13 - v25) * 0.5;
      char v22 = 1;
      goto LABEL_18;
    }
    char v22 = 0;
    goto LABEL_12;
  }
LABEL_18:
  double v33 = v24;
  __int16 v34 = [(VUIBackgroundMediaController *)self view];
  objc_msgSend(v34, "vui_layoutIfNeeded");

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__VUIBackgroundMediaController__updateCurrentPlaybackViewFrameForPlaybackInBackground_animated___block_invoke;
  aBlock[3] = &unk_1E6DFD960;
  objc_copyWeak(v39, &location);
  v39[1] = v9;
  v39[2] = v11;
  v39[3] = v13;
  v39[4] = v15;
  BOOL v41 = v5;
  v39[5] = *(id *)&v27;
  v39[6] = *(id *)&v26;
  v39[7] = *(id *)&v25;
  v39[8] = *(id *)&v33;
  CGAffineTransform v40 = v44;
  char v42 = v22;
  id v35 = _Block_copy(aBlock);
  __int16 v36 = v35;
  if (v4)
  {
    if (v5) {
      uint64_t v37 = 0x10000;
    }
    else {
      uint64_t v37 = 0x20000;
    }
    objc_msgSend(MEMORY[0x1E4FB1EB0], "vui_animateWithDuration:delay:options:animations:completion:", v37, v35, 0, 0.25, 0.0);
  }
  else
  {
    (*((void (**)(void *))v35 + 2))(v35);
  }

  objc_destroyWeak(v39);
  objc_destroyWeak(&location);
}

void __96__VUIBackgroundMediaController__updateCurrentPlaybackViewFrameForPlaybackInBackground_animated___block_invoke(uint64_t a1)
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

    double v15 = [WeakRetained avPlayerViewController];
    double v16 = [v15 view];
    objc_msgSend(v16, "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  }
  else
  {
    double v15 = [WeakRetained avPlayerViewController];
    double v16 = [v15 view];
    long long v17 = *(_OWORD *)(a1 + 120);
    v19[0] = *(_OWORD *)(a1 + 104);
    v19[1] = v17;
    v19[2] = *(_OWORD *)(a1 + 136);
    [v16 setTransform:v19];
  }

  if (*(unsigned char *)(a1 + 153)) {
    [WeakRetained _updateVideoPlayerLegibleContentInsets:*(unsigned __int8 *)(a1 + 152)];
  }
  double v18 = [WeakRetained view];
  objc_msgSend(v18, "vui_layoutIfNeeded");
}

- (void)_addPlaybackViewControllerForPlayback:(BOOL)a3 restoringAVPlayerViewController:(BOOL)a4
{
  BOOL v5 = a3;
  double v7 = [(VUIBackgroundMediaController *)self playbackContainerController];
  double v8 = v7;
  if (v7)
  {
    double v9 = [v7 view];
    double v10 = [MEMORY[0x1E4FB1618] blackColor];
    [v9 setVuiBackgroundColor:v10];

    [(VUIBackgroundMediaController *)self vui_addChildViewController:v8];
    double v11 = [(VUIBackgroundMediaController *)self alphaProxyImageView];

    double v12 = [(VUIBackgroundMediaController *)self view];
    double v13 = [v8 view];
    if (v11)
    {
      double v14 = [(VUIBackgroundMediaController *)self alphaProxyImageView];
      objc_msgSend(v12, "vui_insertSubview:belowSubview:oldView:", v13, v14, 0);
    }
    else
    {
      objc_msgSend(v12, "vui_addSubview:oldView:", v13, 0);
    }

    if ([(VUIBackgroundMediaController *)self _shouldShowSecondaryView])
    {
      [(VUIBackgroundMediaController *)self _playbackContainerViewFrame:v5 hasSecondaryVideoView:1];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v23 = [v8 view];
      objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

      double v24 = [v8 view];
      [v24 setVuiClipsToBounds:1];

      [(VUIBackgroundMediaController *)self _secondaryVideoViewFrame:1];
      double v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA9DB8]), "initWithFrame:", v25, v26, v27, v28);
      CGAffineTransformMakeScale(&v59, 1.0, -1.0);
      [v29 setTransform:&v59];
      double v30 = [(VUIBackgroundMediaController *)self player];
      [v29 setPlayer:v30];

      [v29 setVuiAlpha:0.0];
      [v29 setVideoGravity:1];
      double v31 = [(VUIBackgroundMediaController *)self view];
      double v32 = [v8 view];
      objc_msgSend(v31, "vui_insertSubview:aboveSubview:oldView:", v29, v32, 0);

      [(VUIBackgroundMediaController *)self setSecondaryVideoView:v29];
    }
    else
    {
      [(VUIBackgroundMediaController *)self _playbackContainerViewFrame:v5 hasSecondaryVideoView:0];
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;
      double v29 = [v8 view];
      objc_msgSend(v29, "setFrame:", v34, v36, v38, v40);
    }

    if (!a4)
    {
      BOOL v41 = [v8 view];
      [v41 setVuiAlpha:0.0];
    }
    [v8 didMoveToParentViewController:self];
    avPlayerViewController = self->_avPlayerViewController;
    if (avPlayerViewController)
    {
      __int16 v43 = [(AVPlayerViewController *)avPlayerViewController view];
      CGAffineTransform v44 = [v8 view];
      [v8 addChildViewController:self->_avPlayerViewController];
      __int16 v45 = [(VUIBackgroundMediaController *)self currentMediaInfo];
      uint64_t v46 = [v45 overlayView];

      if (v46) {
        objc_msgSend(v44, "vui_insertSubview:belowSubview:oldView:", v43, v46, 0);
      }
      else {
        [v44 addSubview:v43];
      }
      uint64_t v47 = [v43 leadingAnchor];
      v48 = [v44 leadingAnchor];
      id v49 = [v47 constraintEqualToAnchor:v48];
      [v49 setActive:1];

      id v50 = [v43 trailingAnchor];
      id v51 = [v44 trailingAnchor];
      id v52 = [v50 constraintEqualToAnchor:v51];
      [v52 setActive:1];

      id v53 = [v43 topAnchor];
      id v54 = [v44 topAnchor];
      v55 = [v53 constraintEqualToAnchor:v54];
      [v55 setActive:1];

      __int16 v56 = [v43 bottomAnchor];
      v57 = [v44 bottomAnchor];
      __int16 v58 = [v56 constraintEqualToAnchor:v57];
      [v58 setActive:1];

      [v44 bounds];
      objc_msgSend(v43, "setFrame:");
      [(AVPlayerViewController *)self->_avPlayerViewController didMoveToParentViewController:v8];
    }
  }
}

- (void)_removePlaybackViewController
{
  id v9 = [(VUIBackgroundMediaController *)self avPlayerViewController];
  BOOL v3 = [v9 vuiParentViewController];
  BOOL v4 = [(VUIBackgroundMediaController *)self playbackContainerController];

  if (v3 == v4)
  {
    objc_msgSend(v9, "vui_willMoveToParentViewController:", 0);
    BOOL v5 = [v9 vuiView];
    objc_msgSend(v5, "vui_removeFromSuperView");

    objc_msgSend(v9, "vui_removeFromParentViewController");
  }
  double v6 = [(VUIBackgroundMediaController *)self playbackContainerController];
  double v7 = [v6 vuiParentViewController];

  if (v7 == self)
  {
    objc_msgSend(v6, "vui_willMoveToParentViewController:", 0);
    double v8 = [v6 vuiView];
    objc_msgSend(v8, "vui_removeFromSuperView");

    objc_msgSend(v6, "vui_removeFromParentViewController");
  }
}

- (void)_updateAVPlayerViewControllerWithAVPlayerForPlayer:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VUIBackgroundMediaController *)self player];

  if (v5 == v4)
  {
    double v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = [(VUIBackgroundMediaController *)self name];
      *(_DWORD *)buf = 134218498;
      double v23 = self;
      __int16 v24 = 2112;
      double v25 = v11;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) setting player on main %@", buf, 0x20u);
    }
    id v9 = [(VUIBackgroundMediaController *)self avPlayerViewController];
  }
  else
  {
    id v6 = [(VUIBackgroundMediaController *)self prefetchPlayer];

    if (v6 != v4) {
      goto LABEL_18;
    }
    double v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = [(VUIBackgroundMediaController *)self name];
      *(_DWORD *)buf = 134218498;
      double v23 = self;
      __int16 v24 = 2112;
      double v25 = v8;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) setting player on prefetch %@", buf, 0x20u);
    }
    id v9 = [(VUIBackgroundMediaController *)self prefetchPlayerViewController];
  }
  double v12 = v9;
  if (v9)
  {
    double v13 = [v9 player];

    if (v13)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      void block[2] = __83__VUIBackgroundMediaController__updateAVPlayerViewControllerWithAVPlayerForPlayer___block_invoke;
      block[3] = &unk_1E6DF3F68;
      id v19 = v12;
      id v20 = v4;
      dispatch_async(MEMORY[0x1E4F14428], block);

      double v14 = v19;
    }
    else
    {
      double v14 = [v4 avPlayer];
      [v12 setPlayer:v14];
    }

    double v15 = [v4 currentMediaItem];
    if ([(VUIBackgroundMediaController *)self supportsMediaSharing]
      && +[VUIMediaShareCoordinator shouldShowShareForMediaItem:v15])
    {
      double v16 = +[VUIMediaShareControlButton shareControlItemForMediaItem:v15 inPlayerViewController:v12];
      double v21 = v16;
      double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
      [v12 setCustomControlItems:v17];
    }
    else
    {
      [v12 setCustomControlItems:MEMORY[0x1E4F1CBF0]];
    }
  }
LABEL_18:
}

void __83__VUIBackgroundMediaController__updateAVPlayerViewControllerWithAVPlayerForPlayer___block_invoke(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 40) avPlayer];
    [v1 setPlayer:v2];
  }
}

- (void)_notifyAVPlayerViewControllerDisplaySize
{
  id v13 = [(VUIBackgroundMediaController *)self avPlayerViewController];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v13 videoDisplaySize];
  double v6 = v5;
  double v7 = v4;
  if (v5 != *MEMORY[0x1E4F1DB30] || v4 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [v13 videoDisplayScale];
    v15.height = round(v7) * v9;
    v15.width = round(v6) * v9;
    CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v15);
    objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", DictionaryRepresentation, @"VUIBackgroundMediaControllerDisplaySizeKey");
    double v11 = [(VUIBackgroundMediaController *)self player];
    objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v11, @"VUIBackgroundMediaControllerPlayerKey");

    double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"VUIBackgroundMediaControllerVideoDisplaySizeDidChangeNotification" object:self userInfo:v3];
  }
}

- (void)_showPlaybackIfPossible
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(VUIBackgroundMediaController *)self isPlaybackEnabled]
    && [(VUIBackgroundMediaController *)self _autoPlayEnabled])
  {
    id v3 = [(VUIBackgroundMediaController *)self playbackLoadingStartDate];
    [(VUIBackgroundMediaController *)self _computedPlaybackDelayInterval];
    double v5 = v4;
    if (v3)
    {
      double v6 = [MEMORY[0x1E4F1C9C8] date];
      [v6 timeIntervalSinceDate:v3];
      double v8 = v7;

      [(VUIBackgroundMediaController *)self setPlaybackLoadingStartDate:0];
    }
    else
    {
      double v8 = 0.0;
    }
    double v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = [(VUIBackgroundMediaController *)self name];
      *(_DWORD *)buf = 134218754;
      id v20 = self;
      __int16 v21 = 2112;
      double v22 = v11;
      __int16 v23 = 2048;
      double v24 = v8;
      __int16 v25 = 2048;
      double v26 = v5;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) timeTakenToLoad:[%f], playbackDelayInterval:[%f]", buf, 0x2Au);
    }
    if ([(VUIBackgroundMediaController *)self isBackgrounded] && (v5 == 0.0 || v8 < v5))
    {
      id v13 = [(VUIBackgroundMediaController *)self currentMediaInfo];
      objc_initWeak((id *)buf, self);
      double v14 = (void *)MEMORY[0x1E4F1CB00];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __55__VUIBackgroundMediaController__showPlaybackIfPossible__block_invoke;
      v16[3] = &unk_1E6DFD988;
      objc_copyWeak(&v18, (id *)buf);
      v16[4] = self;
      id v12 = v13;
      id v17 = v12;
      CGSize v15 = [v14 scheduledTimerWithTimeInterval:0 repeats:v16 block:v5 - v8];
      [(VUIBackgroundMediaController *)self setPlaybackDelayTimer:v15];

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
      goto LABEL_16;
    }
    if (v5 != -1.0)
    {
      id v12 = [(VUIBackgroundMediaController *)self stateMachine];
      [v12 postEvent:@"Play" withContext:0 userInfo:0];
LABEL_16:
    }
  }
  else
  {
    id v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = [(VUIBackgroundMediaController *)self name];
      *(_DWORD *)buf = 134218242;
      id v20 = self;
      __int16 v21 = 2112;
      double v22 = v9;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playback is not enabled yet. Will show playback when it gets enabled.", buf, 0x16u);
    }
  }
}

void __55__VUIBackgroundMediaController__showPlaybackIfPossible__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = [WeakRetained name];
    [WeakRetained isPlaybackEnabled];
    double v5 = VUIBoolLogString();
    int v7 = 134218498;
    id v8 = WeakRetained;
    __int16 v9 = 2112;
    double v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playback timer fired, isPlaybackEnabled: (%@)", (uint8_t *)&v7, 0x20u);
  }
  [WeakRetained setPlaybackDelayTimer:0];
  if ([WeakRetained isPlaybackEnabled]
    && [*(id *)(a1 + 32) _autoPlayEnabled]
    && [WeakRetained _currentMediaInfoContentMatchesMediaInfo:*(void *)(a1 + 40)])
  {
    double v6 = [WeakRetained stateMachine];
    [v6 postEvent:@"Play" withContext:0 userInfo:0];
  }
}

- (double)_computedPlaybackDelayInterval
{
  [(VUIBackgroundMediaController *)self playbackStartDelay];
  double v4 = v3;
  double result = -1.0;
  if (v4 != -1.0)
  {
    if (PlaybackDelayTimeIntervalOverride_onceToken_0 != -1) {
      dispatch_once(&PlaybackDelayTimeIntervalOverride_onceToken_0, &__block_literal_global_1223);
    }
    double v6 = *(double *)&PlaybackDelayTimeIntervalOverride_playbackDelayInterval_0;
    [(VUIBackgroundMediaController *)self playbackStartDelay];
    double v8 = v7;
    __int16 v9 = [(VUIBackgroundMediaController *)self currentMediaInfo];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      __int16 v11 = [(VUIBackgroundMediaController *)self currentMediaInfo];
      [v11 playbackDelayInterval];
      double v13 = v12;

      if (v13 != -1.0)
      {
        double v14 = [(VUIBackgroundMediaController *)self currentMediaInfo];
        [v14 playbackDelayInterval];
        double v8 = v15;
      }
    }
    if (v6 <= 0.0) {
      return v8;
    }
    else {
      return v6;
    }
  }
  return result;
}

- (void)setAvPlayerViewController:(id)a3
{
  id v7 = a3;
  avPlayerViewController = self->_avPlayerViewController;
  if (avPlayerViewController) {
    [(AVPlayerViewController *)avPlayerViewController removeObserver:self forKeyPath:@"videoBounds" context:__PlayerAVPlayerViewControllerDisplaySizeKVOContext_0];
  }
  objc_storeStrong((id *)&self->_avPlayerViewController, a3);
  double v6 = v7;
  if (v7)
  {
    [v7 addObserver:self forKeyPath:@"videoBounds" options:0 context:__PlayerAVPlayerViewControllerDisplaySizeKVOContext_0];
    double v6 = v7;
  }
}

- (id)_createPlayerViewController
{
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F16750]) initWithNibName:0 bundle:0];
  [(VUIBackgroundMediaController *)self _configurePlayerViewController:v3];
  return v3;
}

- (void)_configurePlayerViewController:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setUpdatesNowPlayingInfoCenter:", -[VUIBackgroundMediaController updatesNowPlayingInfoCenter](self, "updatesNowPlayingInfoCenter"));
  objc_msgSend(v4, "setAllowsPictureInPicturePlayback:", -[VUIBackgroundMediaController allowsPictureInPicturePlayback](self, "allowsPictureInPicturePlayback"));
  [v4 setCanIncludePlaybackControlsWhenInline:0];
  [v4 setCanPausePlaybackWhenExitingFullScreen:0];
  [v4 setShowsMinimalPlaybackControlsWhenEmbeddedInline:1];
  [v4 setDelegate:self];
  double v5 = [(VUIBackgroundMediaController *)self videoGravity];
  [v4 setVideoGravity:v5];

  objc_msgSend(v4, "setExitsFullScreenWhenPlaybackEnds:", -[VUIBackgroundMediaController exitsFullscreenWhenPlaybackEnds](self, "exitsFullscreenWhenPlaybackEnds"));
  [v4 setShowsPlaybackControls:0];
  if ([(VUIBackgroundMediaController *)self disableSupplementalSubtitle]) {
    [v4 setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:0];
  }
  [v4 setAllowsVideoFrameAnalysis:0];
  double v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v9 = 0;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::setAllowInfoMetadataSubpanel: NO", v9, 2u);
  }

  objc_msgSend(v4, "vui_setAllowInfoMetadataSubpanel:", 0);
  id v7 = [v4 view];
  double v8 = [(VUIBackgroundMediaController *)self view];
  [v8 bounds];
  objc_msgSend(v7, "setFrame:");
}

- (void)_cleanupPrefetchPlayback
{
  double v3 = [(VUIBackgroundMediaController *)self prefetchPlayer];

  if (v3)
  {
    id v4 = [(VUIBackgroundMediaController *)self prefetchPlayer];
    [v4 stop];

    double v5 = [(VUIBackgroundMediaController *)self prefetchPlayer];
    [v5 invalidate];

    [(VUIBackgroundMediaController *)self setPrefetchPlayer:0];
  }
  double v6 = [(VUIBackgroundMediaController *)self prefetchPlayerViewController];

  if (v6)
  {
    [(VUIBackgroundMediaController *)self setPrefetchPlayerViewController:0];
  }
}

- (void)_prefetchNextVideo
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = [(VUIBackgroundMediaController *)self player];
  if (v3)
  {
    id v4 = [(VUIBackgroundMediaController *)self player];
    uint64_t v5 = [v4 externalPlaybackType];

    if (v5)
    {
      double v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [(VUIBackgroundMediaController *)self name];
        *(_DWORD *)buf = 134218242;
        double v15 = self;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) Not prefetching player because external playback is not none", buf, 0x16u);
      }
LABEL_5:

      return;
    }
  }
  if (![(VUIBackgroundMediaController *)self prefetchesVideoFrame])
  {
    double v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = [(VUIBackgroundMediaController *)self name];
      *(_DWORD *)buf = 134218242;
      double v15 = self;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) Not prefetching next video because prefetchesVideoFrame is NO", buf, 0x16u);
    }
    goto LABEL_5;
  }
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  __int16 v11 = __50__VUIBackgroundMediaController__prefetchNextVideo__block_invoke;
  double v12 = &unk_1E6DF4A30;
  objc_copyWeak(&v13, (id *)buf);
  double v8 = v10;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v11((uint64_t)v8);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __50__VUIBackgroundMediaController__prefetchNextVideo__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanupPrefetchPlayback];
  id v2 = [WeakRetained mediaInfoFetchController];
  double v3 = objc_msgSend(v2, "loadPlayerAtIndex:", objc_msgSend(WeakRetained, "mediaInfoIndex") + 1);

  id v4 = [WeakRetained player];

  if (v4)
  {
    uint64_t v5 = [WeakRetained player];
    objc_msgSend(v3, "setMuted:", objc_msgSend(v5, "muted"));
  }
  double v6 = [WeakRetained playbackInitiatorForRTCReporting];
  [v3 setReportingValueWithString:v6 forKey:@"initiator"];

  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [WeakRetained name];
    int v10 = 134218498;
    id v11 = WeakRetained;
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2112;
    double v15 = v3;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) Created prefetch player %@", (uint8_t *)&v10, 0x20u);
  }
  [WeakRetained setPrefetchPlayer:v3];
  __int16 v9 = [WeakRetained _createPlayerViewController];
  [WeakRetained setPrefetchPlayerViewController:v9];

  [v3 addObserver:WeakRetained forKeyPath:@"avPlayer" options:0 context:__PlayerAVPlayerKVOContext_1];
  [v3 pause];
}

- (void)_recordBgAutoPlayMediaEventForPlaybackState:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(VUIBackgroundMediaController *)self player];
  double v6 = [v5 playlist];

  id v7 = [v6 currentMediaItem];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4FA9D88] playing];
    __int16 v9 = @"play";
    if (v8 != v4) {
      __int16 v9 = @"stop";
    }
    int v10 = v9;

    if (v10 == @"stop")
    {
      uint64_t v23 = [(VUIBackgroundMediaController *)self lastMediaEventActionType];
      if (!v23) {
        goto LABEL_32;
      }
      double v24 = (void *)v23;
      __int16 v25 = [(VUIBackgroundMediaController *)self lastMediaEventActionType];

      if (v25 == @"stop") {
        goto LABEL_32;
      }
    }
    [(VUIBackgroundMediaController *)self setLastMediaEventActionType:v10];
    id v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = [(VUIBackgroundMediaController *)self name];
      int v39 = 134218754;
      double v40 = self;
      __int16 v41 = 2112;
      char v42 = v12;
      __int16 v43 = 2112;
      CGAffineTransform v44 = v10;
      __int16 v45 = 1024;
      int v46 = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) record bg video media event, actionType %@, isAmbientVideo %i", (uint8_t *)&v39, 0x26u);
    }
    id v13 = [v7 mediaItemMetadataForProperty:@"VUIMediaItemMetadataClipId"];
    uint64_t v14 = [v13 length];

    double v15 = [(VUIBackgroundMediaController *)self player];
    uint64_t v16 = v15;
    if (v14)
    {
      id v17 = [v15 currentMediaItem];
      uint64_t v18 = [v17 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0B8]];

      id v19 = (void *)MEMORY[0x1E4F28ED0];
      id v20 = [(VUIBackgroundMediaController *)self player];
      __int16 v21 = [v20 playbackDate];
      [v21 timeIntervalSinceDate:v18];
      double v22 = objc_msgSend(v19, "numberWithDouble:");

LABEL_31:
      +[VUIMetricsMediaEvent recordBGVideoPlayOfTVPMediaItem:v7 contentPosition:v22 isAmbient:0 actionType:v10];

      goto LABEL_32;
    }
    [v15 duration];
    double v27 = v26;
    double v28 = *MEMORY[0x1E4FA9DC0];

    if (v27 == v28)
    {
      id v29 = [MEMORY[0x1E4FA9D88] playing];

      if (v29 == v4)
      {
        double v22 = &unk_1F3F3E778;
        goto LABEL_31;
      }
      id v30 = [MEMORY[0x1E4FA9D88] stopped];
      if (v30 != v4)
      {
        id v31 = [MEMORY[0x1E4FA9D88] paused];
        if (v31 != v4)
        {

LABEL_30:
          double v22 = 0;
          goto LABEL_31;
        }
      }
      double v35 = [(VUIBackgroundMediaController *)self playbackStartDate];

      if (v30 == v4)
      {
        if (!v35) {
          goto LABEL_30;
        }
      }
      else
      {

        if (!v35) {
          goto LABEL_30;
        }
      }
      double v36 = (void *)MEMORY[0x1E4F28ED0];
      double v34 = [MEMORY[0x1E4F1C9C8] date];
      double v37 = [(VUIBackgroundMediaController *)self playbackStartDate];
      [v34 timeIntervalSinceDate:v37];
      double v22 = objc_msgSend(v36, "numberWithDouble:");
    }
    else
    {
      id v32 = [MEMORY[0x1E4FA9D88] stopped];
      if (v32 == v4)
      {
        double v38 = [(VUIBackgroundMediaController *)self elapsedTimeWhenStopped];

        if (v38)
        {
          double v22 = [(VUIBackgroundMediaController *)self elapsedTimeWhenStopped];
          goto LABEL_31;
        }
      }
      else
      {
      }
      double v33 = (void *)MEMORY[0x1E4F28ED0];
      double v34 = [(VUIBackgroundMediaController *)self player];
      [v34 cachedElapsedTime];
      double v22 = objc_msgSend(v33, "numberWithDouble:");
    }

    goto LABEL_31;
  }
  VUIDefaultLogObject();
  int v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
    -[VUIBackgroundMediaController _recordBgAutoPlayMediaEventForPlaybackState:](self);
  }
LABEL_32:
}

- (void)_didPlayMediaItemToEnd:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(VUIBackgroundMediaController *)self player];
  double v6 = [v5 playlist];
  uint64_t v7 = [v6 count];

  if (v7 == 1)
  {
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    __int16 v9 = [(VUIBackgroundMediaController *)self player];
    [v8 removeObserver:self name:*MEMORY[0x1E4FAA258] object:v9];
  }
  if ([(VUIBackgroundMediaController *)self shouldPauseAtEnd])
  {
    int v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"VUIBackgroundMediaControllerDidPlayToEndNotification" object:self userInfo:0];

    if ([(VUIBackgroundMediaController *)self shouldShowImageAndStopAfterPausingAtEnd])
    {
      objc_initWeak((id *)location, self);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __55__VUIBackgroundMediaController__didPlayMediaItemToEnd___block_invoke;
      _OWORD v19[3] = &unk_1E6DF4A30;
      objc_copyWeak(&v20, (id *)location);
      [(VUIBackgroundMediaController *)self _swapActiveMedia:1 animated:1 completion:v19];
      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)location);
    }
  }
  else
  {
    id v11 = [(VUIBackgroundMediaController *)self player];
    __int16 v12 = [v11 playlist];
    id v13 = [v12 nextMediaItem];
    BOOL v14 = v13 == 0;

    double v15 = VUIDefaultLogObject();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        uint64_t v18 = [(VUIBackgroundMediaController *)self name];
        *(_DWORD *)id location = 134218242;
        *(void *)&location[4] = self;
        __int16 v22 = 2112;
        uint64_t v23 = v18;
        _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) DidPlayMediaItemToEnd, stop now", location, 0x16u);
      }
      [(VUIBackgroundMediaController *)self stop];
    }
    else
    {
      if (v16)
      {
        id v17 = [(VUIBackgroundMediaController *)self name];
        *(_DWORD *)id location = 134218242;
        *(void *)&location[4] = self;
        __int16 v22 = 2112;
        uint64_t v23 = v17;
        _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) DidPlayMediaItemToEnd, there is next item to play, keep playing", location, 0x16u);
      }
    }
  }
}

void __55__VUIBackgroundMediaController__didPlayMediaItemToEnd___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stop];
}

- (void)_populatePlayerWithMediaItemsIfNeeded:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 externalPlaybackType];
  uint64_t v5 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
  double v6 = [v8 playlist];
  unint64_t v7 = [(VUIBackgroundMediaController *)self mediaInfoIndex];
  if (v4)
  {
    [v5 populatePlaylistWithMediaItems:v6 atIndex:v7];

    [v8 setMediaItemEndAction:0];
    [(VUIBackgroundMediaController *)self _cleanupPrefetchPlayback];
  }
  else
  {
    [v5 removePopulatedMediaItems:v6 atIndex:v7];

    [v8 setMediaItemEndAction:1];
  }
}

- (void)_externalPlaybackStateChanged:(id)a3
{
  id v4 = [a3 object];
  if ([(VUIBackgroundMediaController *)self prefetchesVideoFrame]) {
    [(VUIBackgroundMediaController *)self _populatePlayerWithMediaItemsIfNeeded:v4];
  }
}

- (void)_postWillStartPlaybackNotification:(BOOL)a3
{
  BOOL v3 = a3;
  v11[3] = *MEMORY[0x1E4F143B8];
  [(VUIBackgroundMediaController *)self setAutomaticPlaybackStop:0];
  v10[0] = @"VUIBackgroundMediaControllerIsForegroundedKey";
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  v11[0] = v5;
  v10[1] = @"VUIBackgroundMediaControllerIsAutomaticPlaybackStartKey";
  double v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUIBackgroundMediaController isAutomaticPlaybackStart](self, "isAutomaticPlaybackStart"));
  v11[1] = v6;
  void v10[2] = @"VUIBackgroundMediaControllerPlaybackStartReasonKey";
  unint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIBackgroundMediaController vpafPlaybackStartReason](self, "vpafPlaybackStartReason"));
  v11[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  __int16 v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"VUIBackgroundMediaControllerWillStartPlaybackNotification" object:self userInfo:v8];
}

- (void)_postWillStopPlaybackNotification
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"VUIBackgroundMediaControllerIsAutomaticPlaybackStopKey";
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUIBackgroundMediaController isAutomaticPlaybackStop](self, "isAutomaticPlaybackStop"));
  v7[1] = @"VUIBackgroundMediaControllerPlaybackStopReasonKey";
  v8[0] = v3;
  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIBackgroundMediaController vpafPlaybackStopReason](self, "vpafPlaybackStopReason"));
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"VUIBackgroundMediaControllerWillStopPlaybackNotification" object:self userInfo:v5];
}

- (void)_postDidStopPlaybackNotification
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"VUIBackgroundMediaControllerIsAutomaticPlaybackStopKey";
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUIBackgroundMediaController isAutomaticPlaybackStop](self, "isAutomaticPlaybackStop"));
  v7[1] = @"VUIBackgroundMediaControllerPlaybackStopReasonKey";
  v8[0] = v3;
  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIBackgroundMediaController vpafPlaybackStopReason](self, "vpafPlaybackStopReason"));
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"VUIBackgroundMediaControllerDidStopPlaybackNotification" object:self userInfo:v5];
}

- (void)_stateDidChangeFromState:(id)a3 toState:(id)a4 onEvent:(id)a5 context:(id)a6 userInfo:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = VUIDefaultLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = [(VUIBackgroundMediaController *)self name];
    int v24 = 134219010;
    __int16 v25 = self;
    __int16 v26 = 2112;
    double v27 = v14;
    __int16 v28 = 2112;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v10;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) event:%@, fromState:%@, toState:%@", (uint8_t *)&v24, 0x34u);
  }
  if (v10 && v11)
  {
    if ([v10 isEqualToString:@"waiting for timeout while paused"])
    {
      double v15 = VUIDefaultLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v16 = [(VUIBackgroundMediaController *)self name];
        int v24 = 134218242;
        __int16 v25 = self;
        __int16 v26 = 2112;
        double v27 = v16;
        _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) invalidating waiting for timeout timer in paused state.", (uint8_t *)&v24, 0x16u);
      }
      id v17 = [(VUIBackgroundMediaController *)self pauseStateTimeoutTimer];
      [v17 invalidate];

      [(VUIBackgroundMediaController *)self setPauseStateTimeoutTimer:0];
      goto LABEL_23;
    }
    if ([v10 isEqualToString:@"Loading image"])
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
    }
    else
    {
      if (![v10 isEqualToString:@"Showing image"])
      {
        if ([v10 isEqualToString:@"waiting to stop playback"])
        {
          uint64_t v18 = VUIDefaultLogObject();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = [(VUIBackgroundMediaController *)self name];
            int v24 = 134218498;
            __int16 v25 = self;
            __int16 v26 = 2112;
            double v27 = v19;
            __int16 v28 = 2112;
            id v29 = v11;
          }
          id v20 = (void *)MEMORY[0x1E4FBA8A8];
          __int16 v21 = sel_stop;
          __int16 v22 = self;
          uint64_t v23 = 0;
        }
        else
        {
          if ([v10 isEqualToString:@"Showing playback in foreground"])
          {
            id v20 = (void *)MEMORY[0x1E4FBA8A8];
            __int16 v21 = sel__updatePlayerVolume_;
            uint64_t v23 = MEMORY[0x1E4F1CC38];
          }
          else
          {
            if (![v10 isEqualToString:@"Showing playback in background"]) {
              goto LABEL_23;
            }
            id v20 = (void *)MEMORY[0x1E4FBA8A8];
            __int16 v21 = sel__updatePlayerVolume_;
            uint64_t v23 = MEMORY[0x1E4F1CC28];
          }
          __int16 v22 = self;
        }
        [v20 cancelPreviousPerformRequestsWithTarget:v22 selector:v21 object:v23];
        goto LABEL_23;
      }
      [(VUIBackgroundMediaController *)self _cleanUpPlaybackTimers];
    }
LABEL_23:
    [(VUIBackgroundMediaController *)self _configureAudioSessionForState:v11];
    [(VUIBackgroundMediaController *)self _configureLegibleContentInsetFromState:v10 toState:v11];
  }
}

- (void)_configureAudioSession
{
  BOOL v3 = [(VUIBackgroundMediaController *)self stateMachine];
  id v4 = [v3 currentState];

  [(VUIBackgroundMediaController *)self _configureAudioSessionForState:v4];
}

- (void)_configureAudioSessionForState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isEqualToString:@"Showing playback in background"] & 1) != 0
    || ([v4 isEqualToString:@"Showing playback in foreground"] & 1) != 0)
  {
    uint64_t v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = [(VUIBackgroundMediaController *)self name];
      [(VUIBackgroundMediaController *)self isBackgrounded];
      unint64_t v7 = VUIBoolLogString();
      id v8 = VUIBoolLogString();
      int v11 = 134218754;
      id v12 = self;
      __int16 v13 = 2112;
      BOOL v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) isBackgrounded:[%@] usingPlaybackCategory:[%@]", (uint8_t *)&v11, 0x2Au);
    }
    __int16 v9 = +[VUIPlaybackManager sharedInstance];
    [v9 configureAudioSessionForBackgroundPlayback:[(VUIBackgroundMediaController *)self isBackgrounded] usingPlaybackCategory:self->_useForegroundAudioSessionInBackgroundMode isMultiview:0];
  }
  else
  {
    __int16 v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(VUIBackgroundMediaController *)self name];
      int v11 = 134218498;
      id v12 = self;
      __int16 v13 = 2112;
      BOOL v14 = v10;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) state = %@, video isn't playing, skip audio session configuration", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)_registerStateMachineHandlers
{
  v156[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke;
  aBlock[3] = &unk_1E6DFD9B0;
  objc_copyWeak(&v144, &location);
  BOOL v3 = _Block_copy(aBlock);
  v140[0] = MEMORY[0x1E4F143A8];
  v140[1] = 3221225472;
  v140[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_333;
  v140[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v142, &location);
  id v4 = v3;
  id v141 = v4;
  CGAffineTransform v59 = _Block_copy(v140);
  v138[0] = MEMORY[0x1E4F143A8];
  v138[1] = 3221225472;
  v138[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_334;
  v138[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v139, &location);
  uint64_t v5 = _Block_copy(v138);
  double v6 = [(VUIBackgroundMediaController *)self stateMachine];
  v156[0] = @"Showing playback in foreground";
  v156[1] = @"Showing playback in background";
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v156 count:2];
  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_336;
  v136[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v137, &location);
  [v6 registerHandlerForEvent:@"Set media info" onStates:v7 withBlock:v136];

  id v8 = [(VUIBackgroundMediaController *)self stateMachine];
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_341;
  v134[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v135, &location);
  [v8 registerDefaultHandlerForEvent:@"Set media info" withBlock:v134];

  __int16 v9 = [(VUIBackgroundMediaController *)self stateMachine];
  v155[0] = @"Not doing anything";
  v155[1] = @"Loading image";
  v155[2] = @"Showing image";
  v155[3] = @"Finished playback";
  v155[4] = @"Waiting to stop after showing image";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v155 count:5];
  v132[0] = MEMORY[0x1E4F143A8];
  v132[1] = 3221225472;
  v132[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_344;
  v132[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v133, &location);
  [v9 registerHandlerForEvent:@"Load image" onStates:v10 withBlock:v132];

  int v11 = [(VUIBackgroundMediaController *)self stateMachine];
  v154[0] = @"Showing playback in background";
  v154[1] = @"Showing playback in foreground";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v154 count:2];
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_345;
  v130[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v131, &location);
  [v11 registerHandlerForEvent:@"Load image" onStates:v12 withBlock:v130];

  __int16 v13 = [(VUIBackgroundMediaController *)self stateMachine];
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_347;
  v127[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v129, &location);
  id v58 = v5;
  id v128 = v58;
  [v13 registerHandlerForEvent:@"Show image" onState:@"Loading image" withBlock:v127];

  BOOL v14 = [(VUIBackgroundMediaController *)self stateMachine];
  v125[0] = MEMORY[0x1E4F143A8];
  v125[1] = 3221225472;
  v125[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_352;
  v125[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v126, &location);
  [v14 registerHandlerForEvent:@"Show image" onState:@"Finished playback" withBlock:v125];

  __int16 v15 = [(VUIBackgroundMediaController *)self stateMachine];
  v123[0] = MEMORY[0x1E4F143A8];
  v123[1] = 3221225472;
  v123[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_354;
  v123[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v124, &location);
  [v15 registerHandlerForEvent:@"Show image" onState:@"Waiting to stop after showing image" withBlock:v123];

  id v16 = [(VUIBackgroundMediaController *)self stateMachine];
  v153[0] = @"Showing playback in foreground";
  v153[1] = @"Showing playback in background";
  __int16 v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:2];
  v121[0] = MEMORY[0x1E4F143A8];
  v121[1] = 3221225472;
  v121[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_8;
  v121[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v122, &location);
  [v16 registerHandlerForEvent:@"Show image" onStates:v17 withBlock:v121];

  uint64_t v18 = [(VUIBackgroundMediaController *)self stateMachine];
  v152[0] = @"Not doing anything";
  v152[1] = @"Showing image";
  v152[2] = @"Loading image";
  v152[3] = @"Loading playback";
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:4];
  v118[0] = MEMORY[0x1E4F143A8];
  v118[1] = 3221225472;
  v118[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_9;
  v118[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v120, &location);
  id v20 = v4;
  id v119 = v20;
  [v18 registerHandlerForEvent:@"Load playback" onStates:v19 withBlock:v118];

  __int16 v21 = [(VUIBackgroundMediaController *)self stateMachine];
  v151[0] = @"Showing playback in foreground";
  v151[1] = @"Showing playback in background";
  __int16 v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:2];
  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_358;
  v115[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v117, &location);
  id v57 = v20;
  id v116 = v57;
  [v21 registerHandlerForEvent:@"Load playback" onStates:v22 withBlock:v115];

  uint64_t v23 = [(VUIBackgroundMediaController *)self stateMachine];
  v113[0] = MEMORY[0x1E4F143A8];
  v113[1] = 3221225472;
  v113[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_360;
  v113[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v114, &location);
  [v23 registerHandlerForEvent:@"Show playback" onState:@"Loading playback" withBlock:v113];

  int v24 = [(VUIBackgroundMediaController *)self stateMachine];
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_363;
  v111[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v112, &location);
  [v24 registerHandlerForEvent:@"Show playback" onState:@"Showing image" withBlock:v111];

  __int16 v25 = [(VUIBackgroundMediaController *)self stateMachine];
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_8_366;
  v109[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v110, &location);
  [v25 registerHandlerForEvent:@"Player state changed" onState:@"Waiting for player to start loading" withBlock:v109];

  __int16 v26 = [(VUIBackgroundMediaController *)self stateMachine];
  v107[0] = MEMORY[0x1E4F143A8];
  v107[1] = 3221225472;
  v107[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_368;
  v107[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v108, &location);
  [v26 registerHandlerForEvent:@"Player state changed" onState:@"Loading playback" withBlock:v107];

  double v27 = [(VUIBackgroundMediaController *)self stateMachine];
  v150[0] = @"waiting for timeout while paused";
  v150[1] = @"Showing playback in background";
  v150[2] = @"Showing playback in foreground";
  v150[3] = @"waiting to stop playback";
  __int16 v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:4];
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_369;
  v105[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v106, &location);
  [v27 registerHandlerForEvent:@"Player state changed" onStates:v28 withBlock:v105];

  id v29 = [(VUIBackgroundMediaController *)self stateMachine];
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_370;
  v103[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v104, &location);
  [v29 registerHandlerForEvent:@"Player state changed" onState:@"Waiting to stop after showing image" withBlock:v103];

  __int16 v30 = [(VUIBackgroundMediaController *)self stateMachine];
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_371;
  v101[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v102, &location);
  [v30 registerDefaultHandlerForEvent:@"Finished playback" withBlock:v101];

  id v31 = [(VUIBackgroundMediaController *)self stateMachine];
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_374;
  v99[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v100, &location);
  [v31 registerDefaultHandlerForEvent:@"Playback error occurred" withBlock:v99];

  __int16 v32 = [(VUIBackgroundMediaController *)self stateMachine];
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7_376;
  v97[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v98, &location);
  [v32 registerHandlerForEvent:@"Transition to foreground" onState:@"Loading image" withBlock:v97];

  id v33 = [(VUIBackgroundMediaController *)self stateMachine];
  v149[0] = @"Showing playback in background";
  v149[1] = @"waiting for timeout while paused";
  uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v149 count:2];
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_8_377;
  v95[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v96, &location);
  [v33 registerHandlerForEvent:@"Transition to foreground" onStates:v34 withBlock:v95];

  double v35 = [(VUIBackgroundMediaController *)self stateMachine];
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_380;
  v93[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v94, &location);
  [v35 registerHandlerForEvent:@"Transition background" onState:@"Loading image" withBlock:v93];

  double v36 = [(VUIBackgroundMediaController *)self stateMachine];
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_381;
  v91[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v92, &location);
  [v36 registerHandlerForEvent:@"Transition background" onState:@"Loading playback" withBlock:v91];

  double v37 = [(VUIBackgroundMediaController *)self stateMachine];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_382;
  v89[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v90, &location);
  [v37 registerHandlerForEvent:@"Transition background" onState:@"Showing playback in foreground" withBlock:v89];

  double v38 = [(VUIBackgroundMediaController *)self stateMachine];
  v148[0] = @"Showing playback in background";
  v148[1] = @"Showing playback in foreground";
  v148[2] = @"Loading playback";
  int v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:3];
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_384;
  v87[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v88, &location);
  [v38 registerHandlerForEvent:@"Play" onStates:v39 withBlock:v87];

  double v40 = [(VUIBackgroundMediaController *)self stateMachine];
  v147[0] = @"waiting for timeout while paused";
  v147[1] = @"waiting to stop playback";
  __int16 v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v147 count:2];
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_385;
  v85[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v86, &location);
  [v40 registerHandlerForEvent:@"Play" onStates:v41 withBlock:v85];

  char v42 = [(VUIBackgroundMediaController *)self stateMachine];
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_387;
  v83[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v84, &location);
  [v42 registerHandlerForEvent:@"Pause" onState:@"Showing playback in background" withBlock:v83];

  __int16 v43 = [(VUIBackgroundMediaController *)self stateMachine];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_390;
  v81[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v82, &location);
  [v43 registerHandlerForEvent:@"Pause show image and stop" onState:@"Showing playback in background" withBlock:v81];

  CGAffineTransform v44 = [(VUIBackgroundMediaController *)self stateMachine];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_392;
  v79[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v80, &location);
  [v44 registerDefaultHandlerForEvent:@"Stop" withBlock:v79];

  __int16 v45 = [(VUIBackgroundMediaController *)self stateMachine];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_393;
  v76[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v78, &location);
  id v46 = v58;
  id v77 = v46;
  [v45 registerHandlerForEvent:@"Replay" onState:@"Not doing anything" withBlock:v76];

  uint64_t v47 = [(VUIBackgroundMediaController *)self stateMachine];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_395;
  v72[3] = &unk_1E6DF6560;
  objc_copyWeak(&v75, &location);
  id v48 = v46;
  id v73 = v48;
  id v60 = v59;
  id v74 = v60;
  [v47 registerHandlerForEvent:@"Replay" onState:@"Showing image" withBlock:v72];

  id v49 = [(VUIBackgroundMediaController *)self stateMachine];
  v146[0] = @"Waiting for player to start loading";
  v146[1] = @"Loading playback";
  id v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v146 count:2];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_397;
  v69[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v71, &location);
  id v51 = v48;
  id v70 = v51;
  [v49 registerHandlerForEvent:@"Replay" onStates:v50 withBlock:v69];

  id v52 = [(VUIBackgroundMediaController *)self stateMachine];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_398;
  v66[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v68, &location);
  id v53 = v57;
  id v67 = v53;
  [v52 registerHandlerForEvent:@"Restore avPlayerViewController" onState:@"Not doing anything" withBlock:v66];

  id v54 = [(VUIBackgroundMediaController *)self stateMachine];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_400;
  v63[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v65, &location);
  id v55 = v53;
  id v64 = v55;
  [v54 registerDefaultHandlerForEvent:@"Restore avPlayerViewController" withBlock:v63];

  __int16 v56 = [(VUIBackgroundMediaController *)self stateMachine];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_402;
  v61[3] = &unk_1E6DF5E50;
  objc_copyWeak(&v62, &location);
  [v56 registerHandlerForEvent:@"AvPlayerViewController did exit fullscreen presentation" onState:@"Showing playback in foreground" withBlock:v61];

  objc_destroyWeak(&v62);
  objc_destroyWeak(&v65);

  objc_destroyWeak(&v68);
  objc_destroyWeak(&v71);

  objc_destroyWeak(&v75);
  objc_destroyWeak(&v78);
  objc_destroyWeak(&v80);
  objc_destroyWeak(&v82);
  objc_destroyWeak(&v84);
  objc_destroyWeak(&v86);
  objc_destroyWeak(&v88);
  objc_destroyWeak(&v90);
  objc_destroyWeak(&v92);
  objc_destroyWeak(&v94);
  objc_destroyWeak(&v96);
  objc_destroyWeak(&v98);
  objc_destroyWeak(&v100);
  objc_destroyWeak(&v102);
  objc_destroyWeak(&v104);
  objc_destroyWeak(&v106);
  objc_destroyWeak(&v108);
  objc_destroyWeak(&v110);
  objc_destroyWeak(&v112);
  objc_destroyWeak(&v114);

  objc_destroyWeak(&v117);
  objc_destroyWeak(&v120);
  objc_destroyWeak(&v122);
  objc_destroyWeak(&v124);
  objc_destroyWeak(&v126);

  objc_destroyWeak(&v129);
  objc_destroyWeak(&v131);
  objc_destroyWeak(&v133);
  objc_destroyWeak(&v135);
  objc_destroyWeak(&v137);

  objc_destroyWeak(&v139);
  objc_destroyWeak(&v142);

  objc_destroyWeak(&v144);
  objc_destroyWeak(&location);
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [WeakRetained name];
    __int16 v9 = [WeakRetained player];
    int v48 = 134218754;
    id v49 = WeakRetained;
    __int16 v50 = 2112;
    id v51 = v8;
    __int16 v52 = 2112;
    id v53 = v5;
    __int16 v54 = 2112;
    id v55 = v9;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) will create a new playback view controller with player [%@], replacing [%@]", (uint8_t *)&v48, 0x2Au);
  }
  if (v5)
  {
    [v5 setAllowsConstrainedNetworkUsage:0];
    objc_msgSend(v5, "setAllowsExternalPlayback:", objc_msgSend(WeakRetained, "allowsExternalPlayback"));
    id v10 = [WeakRetained preferredAudioLanguageCode];
    if (v10)
    {
    }
    else
    {
      int v11 = [WeakRetained prefersAudioDescriptions];

      if (!v11)
      {
LABEL_8:
        if ([WeakRetained mutePlaybackInBackground]) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = [WeakRetained isMuted];
        }
        [v5 setMuted:v14];
        if (([WeakRetained mutePlaybackInBackground] & 1) != 0
          || ([WeakRetained backgroundVolume], v15 == -1.0))
        {
          [WeakRetained player];
        }
        else
        {
          [WeakRetained backgroundVolume];
          objc_msgSend(v5, "setVolume:");
        }
        id v16 = +[VUIPlayerValidationManager sharedInstance];
        [v16 addReferenceForPlayer:v5];

        __int16 v17 = [WeakRetained player];

        if (v17)
        {
          [WeakRetained _unregisterPlayerNotifications];
          uint64_t v18 = +[VUIPlayerValidationManager sharedInstance];
          uint64_t v19 = [WeakRetained player];
          [v18 removeReferenceForPlayer:v19 stoppingIfNeeded:a3 ^ 1];
        }
        [WeakRetained setPlayer:v5];
        [WeakRetained setDidWeCreatePlayer:1];
        [WeakRetained _updatePlayerMuteStateForBackgroundPlaybackWithReason:@"VUIBackgroundMediaControllerPlaybackMuteReasonInitialSetting"];
        id v20 = [WeakRetained player];
        [v20 addObserver:WeakRetained forKeyPath:@"avPlayer" options:0 context:__PlayerAVPlayerKVOContext_1];

        __int16 v21 = [WeakRetained player];
        [v21 addObserver:WeakRetained forKeyPath:@"preferredAudioLanguageCode" options:0 context:__PlayerPreferredAudioLanguageCode];

        __int16 v22 = [WeakRetained player];
        [v22 addObserver:WeakRetained forKeyPath:@"prefersAudioDescriptions" options:0 context:__PlayerPrefersAudioDescriptions];

        if ([WeakRetained shouldPauseAtEnd]) {
          [v5 setMediaItemEndAction:1];
        }
        uint64_t v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v24 = *MEMORY[0x1E4FAA258];
        __int16 v25 = [WeakRetained player];
        [v23 addObserver:WeakRetained selector:sel__didPlayMediaItemToEnd_ name:v24 object:v25];

        goto LABEL_20;
      }
    }
    id v12 = [WeakRetained preferredAudioLanguageCode];
    [v5 setPreferredAudioLanguageCode:v12];

    __int16 v13 = [WeakRetained prefersAudioDescriptions];
    objc_msgSend(v5, "setPrefersAudioDescriptions:", objc_msgSend(v13, "BOOLValue"));

    [v5 updateAudioSelectionCriteria];
    goto LABEL_8;
  }
LABEL_20:
  [WeakRetained _registerPlayerNotifications];
  __int16 v26 = [WeakRetained playbackContainerController];

  if (!v26)
  {
    double v27 = objc_opt_new();
    __int16 v28 = [v27 view];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v29 = [v27 view];
    [v29 setVuiAutoresizingMask:18];

    [WeakRetained setPlaybackContainerController:v27];
    __int16 v30 = [WeakRetained avPlayerViewController];

    if (!v30)
    {
      id v31 = VUIDefaultLogObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v32 = [WeakRetained name];
        int v48 = 134218242;
        id v49 = WeakRetained;
        __int16 v50 = 2112;
        id v51 = v32;
        _os_log_impl(&dword_1E2BD7000, v31, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) creating avPlayerViewController because none was supplied.", (uint8_t *)&v48, 0x16u);
      }
      id v33 = [WeakRetained _createPlayerViewController];
      if ([WeakRetained didWeCreatePlayer])
      {
        uint64_t v34 = [WeakRetained player];
        [WeakRetained _updateAVPlayerViewControllerWithAVPlayerForPlayer:v34];
      }
      [WeakRetained setAvPlayerViewController:v33];
      [WeakRetained setShowsVideoControls:0];
    }
    double v35 = [WeakRetained avPlayerViewController];
    double v36 = [v35 vuiView];
    double v37 = [v36 superview];

    if (v37)
    {
      double v38 = [WeakRetained avPlayerViewController];
      int v39 = [v38 vuiView];
      objc_msgSend(v39, "vui_removeFromSuperView");

      double v40 = [WeakRetained avPlayerViewController];
      objc_msgSend(v40, "vui_removeFromParentViewController");

      __int16 v41 = [WeakRetained avPlayerViewController];
      objc_msgSend(v41, "vui_didMoveToParentViewController:", 0);
    }
    [WeakRetained _addPlaybackViewControllerForPlayback:1 restoringAVPlayerViewController:a3];
    [WeakRetained _updateVideoPlayerLegibleContentInsets:1];
  }
  char v42 = [WeakRetained player];
  __int16 v43 = [v42 currentMediaItem];
  CGAffineTransform v44 = [v43 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];

  __int16 v45 = [MEMORY[0x1E4F1C9C8] date];
  [v44 addSingleShotEventWithName:*MEMORY[0x1E4FAA348] value:@"Background"];
  [v44 addOrReplaceStartEventWithName:*MEMORY[0x1E4FAA370] date:v45];
  id v46 = (void *)MEMORY[0x1E4FAA388];
  [v44 addOrReplaceStartEventWithName:*MEMORY[0x1E4FAA388] date:v45];
  [v44 addEndEventWithName:*v46];
  if ((a3 & 1) == 0)
  {
    uint64_t v47 = [WeakRetained player];
    [v47 pause];
  }
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_333(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [WeakRetained name];
    int v9 = 134218242;
    id v10 = WeakRetained;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) starting to load the playlist", (uint8_t *)&v9, 0x16u);
  }
  id v5 = [WeakRetained player];

  if (v5)
  {
    [WeakRetained _postWillStopPlaybackNotification];
    double v6 = [WeakRetained player];
    [v6 stop];
  }
  else
  {
    unint64_t v7 = [WeakRetained mediaInfoFetchController];
    double v6 = objc_msgSend(v7, "loadPlayerAtIndex:", objc_msgSend(WeakRetained, "mediaInfoIndex"));

    id v8 = [WeakRetained playbackInitiatorForRTCReporting];
    [v6 setReportingValueWithString:v8 forKey:@"initiator"];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_334(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2;
  __int16 v17 = &unk_1E6DF5490;
  objc_copyWeak(&v19, v1);
  id v18 = WeakRetained;
  BOOL v3 = (void (**)(void))_Block_copy(&v14);
  if ((objc_msgSend(WeakRetained, "loadsPlayerWithFullscreenPlayback", v14, v15, v16, v17) & 1) == 0)
  {
    id v4 = +[VUIPlaybackManager sharedInstance];
    int v5 = [v4 isFullscreenPlaybackUIBeingShown];

    if (v5)
    {
      double v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v7 = [WeakRetained name];
        *(_DWORD *)buf = 134218242;
        id v21 = WeakRetained;
        __int16 v22 = 2112;
        uint64_t v23 = v7;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) FullScreenPlayback is showing, not loading playback", buf, 0x16u);
      }
LABEL_15:

      goto LABEL_16;
    }
  }
  if ([WeakRetained isBackgrounded])
  {
    if (![WeakRetained isPlaybackEnabled])
    {
      double v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [WeakRetained name];
        *(_DWORD *)buf = 134218242;
        id v21 = WeakRetained;
        __int16 v22 = 2112;
        uint64_t v23 = v13;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playback is not enabled, not setting loading timer.", buf, 0x16u);
      }
      goto LABEL_15;
    }
    [WeakRetained _cleanUpPlaybackTimers];
    id v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [WeakRetained name];
      *(_DWORD *)buf = 134218242;
      id v21 = WeakRetained;
      __int16 v22 = 2112;
      uint64_t v23 = v9;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playback is enabled, loading playback.", buf, 0x16u);
    }
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    [WeakRetained setPlaybackLoadingStartDate:v10];

    v3[2](v3);
  }
  else
  {
    __int16 v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [WeakRetained name];
      *(_DWORD *)buf = 134218242;
      id v21 = WeakRetained;
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) controller is not backgrounded, loading playback.", buf, 0x16u);
    }
    v3[2](v3);
  }
LABEL_16:

  objc_destroyWeak(&v19);
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([MEMORY[0x1E4FB1438] vuiIsActive])
  {
    BOOL v3 = [WeakRetained currentMediaInfo];
    id v4 = [v3 tvpPlaylist];

    if (v4)
    {
      int v5 = [WeakRetained stateMachine];
      [v5 postEvent:@"Load playback" withContext:0 userInfo:0];
    }
  }
  else
  {
    id v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = *(void **)(a1 + 32);
      unint64_t v7 = [v6 name];
      int v8 = 134218498;
      int v9 = v6;
      __int16 v10 = 2112;
      __int16 v11 = v7;
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) not loading playlist isAppActive:<%ld>.", (uint8_t *)&v8, 0x20u);
    }
  }
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_336(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v10 = [v8 objectForKeyedSubscript:@"AnimatedKey"];
  __int16 v11 = [v8 objectForKeyedSubscript:@"ImageVideoSwapBehaviorKey"];
  if (v11)
  {
    __int16 v12 = [v8 objectForKeyedSubscript:@"ImageVideoSwapBehaviorKey"];
    uint64_t v13 = [v12 integerValue];
  }
  else
  {
    uint64_t v13 = 0;
  }

  uint64_t v14 = [v7 currentState];
  uint64_t v15 = [WeakRetained player];
  id v16 = [v15 playlist];

  __int16 v17 = [WeakRetained currentMediaInfo];
  id v18 = [v17 tvpPlaylist];

  if ((v13 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    if ([WeakRetained prefetchesVideoFrame])
    {
      id v19 = [WeakRetained mediaInfoFetchController];
      int v20 = objc_msgSend(v19, "mediaInfoContainsPlayerAtIndex:", objc_msgSend(WeakRetained, "mediaInfoIndex"));

      if (v20)
      {
        v61 = v10;
        id v21 = [WeakRetained avPlayerViewController];
        char v62 = [v21 isPictureInPictureActive];

        __int16 v22 = [WeakRetained prefetchPlayer];
        uint64_t v23 = [v22 playlist];
        int v24 = [WeakRetained _playlist:v23 contentMatchesPlaylist:v18];

        LODWORD(v58) = v24;
        if ([WeakRetained isVideoFrameFallbackEnabled])
        {
          __int16 v25 = [WeakRetained prefetchPlayer];
          __int16 v26 = [v25 state];
          double v27 = [MEMORY[0x1E4FA9D88] paused];
          int v28 = v24 ^ 1;
          if (v26 != v27) {
            int v28 = 1;
          }
          HIDWORD(v58) = v28;
        }
        else
        {
          HIDWORD(v58) = 0;
        }
        v63 = v16;
        uint64_t v44 = objc_msgSend(WeakRetained, "player", v58);
        __int16 v10 = v61;
        if (v44)
        {
          __int16 v45 = (void *)v44;
          id v46 = [WeakRetained player];
          uint64_t v47 = [v46 externalPlaybackType];

          if (v47) {
            char v48 = 1;
          }
          else {
            char v48 = v62;
          }
          if (v48)
          {
LABEL_31:
            id v49 = [WeakRetained player];
            __int16 v50 = [v49 playlist];
            uint64_t v51 = [v50 activeListIndex];
            uint64_t v52 = [WeakRetained mediaInfoIndex];

            if (v51 != v52)
            {
              id v53 = [WeakRetained player];
              objc_msgSend(v53, "changeToMediaAtIndex:reason:", objc_msgSend(WeakRetained, "mediaInfoIndex"), 0);
            }
LABEL_41:
            id v16 = v63;
            goto LABEL_42;
          }
        }
        else if (v62)
        {
          goto LABEL_31;
        }

        if (v60)
        {
          [WeakRetained _cleanUpEverythingPlaybackRelated];
          if ((v59 & 1) == 0)
          {
            [WeakRetained _cleanupPrefetchPlayback];
            objc_msgSend(WeakRetained, "_swapActiveMedia:animated:completion:", 1, objc_msgSend(v61, "BOOLValue"), 0);
          }
          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3;
          v67[3] = &unk_1E6DF3F68;
          id v68 = v7;
          id v69 = v8;
          [v68 executeBlockAfterCurrentStateTransition:v67];

          uint64_t v14 = @"Loading image";
        }
        else
        {
          v70[0] = MEMORY[0x1E4F143A8];
          v70[1] = 3221225472;
          v70[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_337;
          v70[3] = &unk_1E6DFD340;
          uint64_t v73 = v13;
          v70[4] = WeakRetained;
          id v71 = v7;
          id v72 = v8;
          [v71 executeBlockAfterCurrentStateTransition:v70];

          uint64_t v14 = @"Loading playback";
        }
        goto LABEL_41;
      }
    }
  }
  if (v13 == 3)
  {
    id v33 = v16;
    uint64_t v34 = VUIDefaultLogObject();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      double v35 = [WeakRetained name];
      *(_DWORD *)buf = 134218498;
      id v79 = WeakRetained;
      __int16 v80 = 2112;
      v81 = v35;
      __int16 v82 = 2112;
      v83 = v10;
      _os_log_impl(&dword_1E2BD7000, v34, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) set media info SwapBehaviorShowImageAndStop, animated %@", buf, 0x20u);
    }
    objc_msgSend(WeakRetained, "_swapActiveMedia:animated:completion:", 1, objc_msgSend(v10, "BOOLValue"), 0);
    if (v8)
    {
      double v36 = [v8 objectForKeyedSubscript:@"DirectionKey"];
      uint64_t v37 = [v36 integerValue];
    }
    else
    {
      uint64_t v37 = 0;
    }
    double v38 = [WeakRetained currentMediaInfo];
    [WeakRetained setPendingMediaInfo:v38];

    [WeakRetained setPendingMediaInfoDirection:v37];
    int v39 = [v8 objectForKeyedSubscript:@"AnimatedKey"];
    [WeakRetained setPendingAnimated:v39];

    v76 = @"PlaybackStopReasonKey";
    id v77 = &unk_1F3F3E120;
    double v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
    [v7 postEvent:@"Stop" withContext:0 userInfo:v40];

    id v16 = v33;
  }
  else if (v13 == 1)
  {
    [WeakRetained currentMediaInfo];
    v30 = id v29 = v16;
    [WeakRetained setPendingMediaInfo:v30];

    id v31 = [v8 objectForKeyedSubscript:@"AnimatedKey"];
    [WeakRetained setPendingAnimated:v31];

    __int16 v32 = [WeakRetained player];
    [v32 pause];

    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4;
    v64[3] = &unk_1E6DF3F68;
    id v65 = v7;
    id v66 = v8;
    id v16 = v29;
    [v65 executeBlockAfterCurrentStateTransition:v64];

    uint64_t v14 = @"Waiting to stop after showing image";
  }
  else if (v18 && ![WeakRetained _playlist:v16 contentMatchesPlaylist:v18])
  {
    __int16 v41 = v16;
    if (v8)
    {
      char v42 = [v8 objectForKeyedSubscript:@"DirectionKey"];
      uint64_t v43 = [v42 integerValue];
    }
    else
    {
      uint64_t v43 = 0;
    }
    __int16 v54 = [WeakRetained currentMediaInfo];
    [WeakRetained setPendingMediaInfo:v54];

    [WeakRetained setPendingMediaInfoDirection:v43];
    id v55 = [v8 objectForKeyedSubscript:@"AnimatedKey"];
    [WeakRetained setPendingAnimated:v55];

    id v74 = @"PlaybackStopReasonKey";
    id v75 = &unk_1F3F3E120;
    uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    [v7 postEvent:@"Stop" withContext:0 userInfo:v56];

    id v16 = v41;
  }
  else
  {
    [v7 postEvent:@"Load image" withContext:0 userInfo:v8];
  }
LABEL_42:

  return v14;
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_337(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  BOOL v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 _cleanupPrefetchPlayback];
    id v4 = [*(id *)(a1 + 32) player];
    [v4 pause];
  }
  else
  {
    [v3 _cleanUpEverythingPlaybackRelated];
  }
  int v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  return [v5 postEvent:@"Load playback" withContext:0 userInfo:v6];
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Load image" withContext:0 userInfo:*(void *)(a1 + 40)];
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Load image" withContext:0 userInfo:*(void *)(a1 + 40)];
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_341(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v10 = [v7 currentState];
  __int16 v11 = [WeakRetained mediaInfoFetchController];
  if (objc_msgSend(v11, "mediaInfoContainsPlayerAtIndex:", objc_msgSend(WeakRetained, "mediaInfoIndex"))
    && [WeakRetained prefetchesVideoFrame])
  {
    __int16 v12 = [WeakRetained prefetchPlayer];
    uint64_t v13 = [v12 state];
    uint64_t v14 = [MEMORY[0x1E4FA9D88] paused];
    if (v13 == (void *)v14)
    {

LABEL_16:
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      id v33[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_342;
      v33[3] = &unk_1E6DF3F68;
      id v34 = v7;
      id v35 = v8;
      [v34 executeBlockAfterCurrentStateTransition:v33];

      __int16 v10 = @"Loading playback";
      id v26 = v34;
      goto LABEL_17;
    }
    uint64_t v15 = (void *)v14;
    char v16 = [WeakRetained isVideoFrameFallbackEnabled];

    if ((v16 & 1) == 0) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  uint64_t v17 = [WeakRetained player];
  if (!v17) {
    goto LABEL_11;
  }
  id v18 = (void *)v17;
  id v19 = [WeakRetained player];
  int v20 = [v19 state];
  id v21 = [MEMORY[0x1E4FA9D88] stopped];

  if (v20 == v21)
  {
LABEL_11:
    int v24 = [WeakRetained mediaInfoFetchController];
    int v25 = objc_msgSend(v24, "mediaInfoContainsImageAtIndex:", objc_msgSend(WeakRetained, "mediaInfoIndex"));

    if (!v25) {
      goto LABEL_18;
    }

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_343;
    v30[3] = &unk_1E6DF3F68;
    id v31 = v7;
    id v32 = v8;
    [v31 executeBlockAfterCurrentStateTransition:v30];

    __int16 v10 = @"Loading image";
    id v26 = v31;
  }
  else
  {
    if (v8)
    {
      __int16 v22 = [v8 objectForKeyedSubscript:@"DirectionKey"];
      uint64_t v23 = [v22 integerValue];
    }
    else
    {
      uint64_t v23 = 0;
    }
    double v27 = [WeakRetained currentMediaInfo];
    [WeakRetained setPendingMediaInfo:v27];

    [WeakRetained setPendingMediaInfoDirection:v23];
    int v28 = [v8 objectForKeyedSubscript:@"AnimatedKey"];
    [WeakRetained setPendingAnimated:v28];

    double v36 = @"PlaybackStopReasonKey";
    v37[0] = &unk_1F3F3E120;
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    [v7 postEvent:@"Stop" withContext:0 userInfo:v26];
  }
LABEL_17:

LABEL_18:
  return v10;
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_342(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Load playback" withContext:0 userInfo:*(void *)(a1 + 40)];
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_343(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Load image" withContext:0 userInfo:*(void *)(a1 + 40)];
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_344(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5;
  v18[3] = &unk_1E6DF3F90;
  objc_copyWeak(&v21, (id *)(a1 + 32));
  id v13 = v12;
  id v19 = v13;
  id v14 = v9;
  id v20 = v14;
  [v14 executeBlockAfterCurrentStateTransition:v18];
  uint64_t v15 = [v14 currentState];
  if ([v15 isEqualToString:@"Waiting to stop after showing image"])
  {
    char v16 = [v14 currentState];
  }
  else
  {
    char v16 = @"Loading image";
  }

  objc_destroyWeak(&v21);
  return v16;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = [WeakRetained currentMediaInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [WeakRetained currentMediaInfo];
    char v6 = [v5 shouldDelayLoadingImage];
  }
  else
  {
    char v6 = 0;
  }

  id v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [WeakRetained currentMediaInfo];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6;
  aBlock[3] = &unk_1E6DFDA00;
  objc_copyWeak(&v19, v2);
  id v9 = v8;
  id v14 = v9;
  id v15 = a1[4];
  id v10 = v7;
  id v16 = v10;
  char v20 = v6;
  id v17 = a1[5];
  id v18 = WeakRetained;
  id v11 = _Block_copy(aBlock);
  id v12 = [WeakRetained imageDelayTimer];
  [v12 invalidate];

  [WeakRetained setImageDelayTimer:0];
  [WeakRetained _loadImage:v11];

  objc_destroyWeak(&v19);
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6(uint64_t a1, void *a2, int a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int v5 = (id *)(a1 + 72);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  int v8 = [WeakRetained _currentMediaInfoImagesMatchesNewMediaInfoImage:*(void *)(a1 + 32)];
  id v9 = *(void **)(a1 + 40);
  if (v9)
  {
    id v10 = (void *)[v9 mutableCopy];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v11 = v10;
  [v10 setObject:v6 forKeyedSubscript:@"ImageKey"];

  id v12 = [WeakRetained proxyImageView];
  id v13 = [v12 image];

  if ((a3 & v8) == 1)
  {
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 48)];
    double v16 = v15;

    if (*(unsigned char *)(a1 + 80) && v13 && (double v17 = 5.0 - v16, v17 > 0.0))
    {
      id v18 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      int v28 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7;
      id v29 = &unk_1E6DFD9D8;
      id v30 = *(id *)(a1 + 56);
      id v31 = v11;
      id v19 = [v18 scheduledTimerWithTimeInterval:0 repeats:&v26 block:v17];
      char v20 = objc_msgSend(WeakRetained, "imageDelayTimer", v26, v27, v28, v29);
      [v20 invalidate];

      [WeakRetained setImageDelayTimer:0];
      [WeakRetained setImageDelayTimer:v19];
    }
    else
    {
      [*(id *)(a1 + 56) postEvent:@"Show image" withContext:0 userInfo:v11];
    }
  }
  else
  {
    id v21 = [*(id *)(a1 + 32) imageProxies];

    if (!v21)
    {
      __int16 v22 = [*(id *)(a1 + 32) tvpPlaylist];
      if (v22)
      {
        uint64_t v23 = VUIDefaultLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = *(void **)(a1 + 64);
          int v25 = [v24 name];
          *(_DWORD *)buf = 134218242;
          id v33 = v24;
          __int16 v34 = 2112;
          id v35 = v25;
          _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) there're no imageProxies but have playlist; loading it.",
            buf,
            0x16u);
        }
        [*(id *)(a1 + 56) postEvent:@"Show image" withContext:0 userInfo:v11];
      }
    }
  }
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Show image" withContext:0 userInfo:*(void *)(a1 + 40)];
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_345(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_346;
  aBlock[3] = &unk_1E6DFDA28;
  objc_copyWeak(&v19, v13);
  double v15 = _Block_copy(aBlock);
  [WeakRetained _loadImage:v15];
  double v16 = [v9 currentState];

  objc_destroyWeak(&v19);
  return v16;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_346(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    id v4 = [WeakRetained proxyImageView];
    int v5 = [v6 uiImage];
    [v4 setImage:v5];
  }
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_347(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v27 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 objectForKeyedSubscript:@"AnimatedKey"];
  uint64_t v26 = v9;
  if (v12)
  {
    id v13 = [v11 objectForKeyedSubscript:@"AnimatedKey"];
    char v14 = [v13 BOOLValue];
  }
  else
  {
    char v14 = 1;
  }

  double v15 = [v11 objectForKeyedSubscript:@"ImageKey"];
  double v16 = [v11 objectForKeyedSubscript:@"DirectionKey"];
  if (v16)
  {
    double v17 = [v11 objectForKeyedSubscript:@"DirectionKey"];
    id v18 = (void *)[v17 integerValue];
  }
  else
  {
    id v18 = 0;
  }

  id v19 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setState:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_348;
  aBlock[3] = &unk_1E6DF43D0;
  objc_copyWeak(v35, (id *)(a1 + 40));
  void aBlock[4] = WeakRetained;
  id v34 = *(id *)(a1 + 32);
  id v21 = _Block_copy(aBlock);
  __int16 v22 = v21;
  if (v15)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_350;
    v28[3] = &unk_1E6DFDA50;
    objc_copyWeak(v31, v19);
    id v23 = v15;
    char v32 = v14;
    id v29 = v23;
    v31[1] = v18;
    id v30 = v22;
    int v24 = v27;
    [v27 executeBlockAfterCurrentStateTransition:v28];

    objc_destroyWeak(v31);
  }
  else
  {
    (*((void (**)(void *))v21 + 2))(v21);
    int v24 = v27;
  }

  objc_destroyWeak(v35);
  return @"Showing image";
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_348(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_349;
  block[3] = &unk_1E6DF4510;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  void block[4] = WeakRetained;
  block[5] = v3;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_349(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) currentMediaInfo];
  uint64_t v3 = [v2 tvpPlaylist];
  if (v3)
  {
    id v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(void **)(a1 + 40);
      id v6 = [v5 name];
      int v7 = 134218242;
      int v8 = v5;
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) we have a pending playlist, starting loading timer.", (uint8_t *)&v7, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_350(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_351;
  v7[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v9, v2);
  id v8 = *(id *)(a1 + 40);
  [WeakRetained _transitionToNewImage:v4 animated:v5 direction:v6 completion:v7];

  objc_destroyWeak(&v9);
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_351(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = [WeakRetained alphaImageProxy];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = [WeakRetained alphaProxyImageView];
    uint64_t v5 = [v4 image];

    if (v5) {
      [WeakRetained showAlphaImage:1 animated:0];
    }
  }
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_352(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
  if (v13)
  {
    char v14 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
    char v15 = [v14 BOOLValue];
  }
  else
  {
    char v15 = 1;
  }

  double v16 = [v12 objectForKeyedSubscript:@"ImageKey"];
  double v17 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v19 = WeakRetained;
  if (v16)
  {
    char v20 = [WeakRetained proxyImageView];
    id v21 = [v16 uiImage];
    [v20 setImage:v21];
  }
  [v19 setState:1];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_353;
  v23[3] = &unk_1E6DF5330;
  objc_copyWeak(&v24, v17);
  char v25 = v15;
  [v9 executeBlockAfterCurrentStateTransition:v23];
  objc_destroyWeak(&v24);

  return @"Showing image";
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_353(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _swapActiveMedia:1 animated:*(unsigned __int8 *)(a1 + 40) completion:0];
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_354(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
  if (v13)
  {
    char v14 = [v12 objectForKeyedSubscript:@"AnimatedKey"];
    uint64_t v15 = [v14 BOOLValue];
  }
  else
  {
    uint64_t v15 = 1;
  }

  double v16 = [v12 objectForKeyedSubscript:@"ImageKey"];
  double v17 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v19 = WeakRetained;
  if (v16)
  {
    char v20 = [WeakRetained proxyImageView];
    id v21 = [v16 uiImage];
    [v20 setImage:v21];
  }
  [v19 setState:1];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  id v27 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_355;
  int v28 = &unk_1E6DF6510;
  id v22 = v9;
  id v29 = v22;
  objc_copyWeak(&v30, v17);
  [v19 _swapActiveMedia:1 animated:v15 completion:&v25];
  id v23 = objc_msgSend(v22, "currentState", v25, v26, v27, v28);
  objc_destroyWeak(&v30);

  return v23;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_355(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7_356;
  v2[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  [v1 executeBlockAfterCurrentStateTransition:v2];
  objc_destroyWeak(&v3);
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7_356(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v1 = [WeakRetained player];
  [v1 stop];
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKeyedSubscript:@"ImageKey"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (v8)
  {
    id v11 = [WeakRetained proxyImageView];
    id v12 = [v8 uiImage];
    [v11 setImage:v12];

    uint64_t v13 = [v10 alphaImageProxy];
    if (v13)
    {
      char v14 = (void *)v13;
      uint64_t v15 = [v10 alphaProxyImageView];
      double v16 = [v15 image];

      if (v16) {
        [v10 showAlphaImage:1 animated:1];
      }
    }
  }
  double v17 = [v7 currentState];

  return v17;
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = [WeakRetained prefetchPlayer];
  if (v11)
  {
    id v12 = [WeakRetained currentMediaInfo];
    uint64_t v13 = [v12 tvpPlaylist];
    char v14 = [WeakRetained prefetchPlayer];
    uint64_t v15 = [v14 playlist];
    if ([WeakRetained _playlist:v13 contentMatchesPlaylist:v15]) {
      int v16 = [WeakRetained prefetchesVideoFrame];
    }
    else {
      int v16 = 0;
    }
  }
  else
  {
    int v16 = 0;
  }

  double v17 = [WeakRetained prefetchPlayer];
  id v18 = [v17 state];
  id v19 = [MEMORY[0x1E4FA9D88] paused];
  if (v18 == v19) {
    int v20 = 0;
  }
  else {
    int v20 = [WeakRetained isVideoFrameFallbackEnabled];
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_10;
  v27[3] = &unk_1E6DFDA78;
  objc_copyWeak(&v29, (id *)(a1 + 40));
  char v30 = v16;
  void v27[4] = WeakRetained;
  id v28 = *(id *)(a1 + 32);
  char v31 = v20;
  [v9 executeBlockAfterCurrentStateTransition:v27];
  if ((v16 & (v20 ^ 1)) != 0) {
    id v21 = @"Loading playback";
  }
  else {
    id v21 = @"Waiting for player to start loading";
  }
  id v22 = v21;

  objc_destroyWeak(&v29);
  return v22;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_10(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = [WeakRetained prefetchPlayer];
    [v4 removeObserver:v3 forKeyPath:@"avPlayer" context:__PlayerAVPlayerKVOContext_1];

    uint64_t v5 = [v3 prefetchPlayer];
    uint64_t v6 = [v3 prefetchPlayerViewController];
    [v3 setAvPlayerViewController:v6];
    id v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(NSObject **)(a1 + 32);
      id v9 = [v8 name];
      *(_DWORD *)buf = 134218498;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) loading playback with prefetch player %@", buf, 0x20u);
    }
  }
  else
  {
    id v10 = [WeakRetained mediaInfoFetchController];
    uint64_t v5 = objc_msgSend(v10, "loadPlayerAtIndex:", objc_msgSend(v3, "mediaInfoIndex"));

    id v11 = [v3 playbackInitiatorForRTCReporting];
    [v5 setReportingValueWithString:v11 forKey:@"initiator"];

    uint64_t v6 = VUIDefaultLogObject();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v7 = [*(id *)(a1 + 32) name];
    *(_DWORD *)buf = 134218242;
    id v22 = v7;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) loading playback with new player", buf, 0x16u);
  }

LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 56))
  {
    if (!*(unsigned char *)(a1 + 57))
    {
      id v12 = *(void **)(a1 + 32);
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      double v17 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_357;
      id v18 = &unk_1E6DF3F68;
      id v13 = v5;
      uint64_t v14 = *(void *)(a1 + 32);
      id v19 = v13;
      uint64_t v20 = v14;
      [v12 _swapActiveMedia:0 animated:0 completion:&v15];
    }
    objc_msgSend(v3, "setPrefetchPlayer:", 0, v15, v16, v17, v18);
    [v3 setPrefetchPlayerViewController:0];
  }
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_357(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) videoAudioRampDuration];
  return objc_msgSend(v1, "playWithVolumeRampDuration:");
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_358(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _postWillStopPlaybackNotification];
  uint64_t v6 = [WeakRetained prefetchPlayer];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [WeakRetained currentMediaInfo];
    id v9 = [v8 tvpPlaylist];
    id v10 = [WeakRetained prefetchPlayer];
    id v11 = [v10 playlist];
    if ([WeakRetained _playlist:v9 contentMatchesPlaylist:v11])
    {
      int v12 = [WeakRetained prefetchesVideoFrame];

      if (v12)
      {
        id v13 = [WeakRetained prefetchPlayer];
        uint64_t v14 = [WeakRetained prefetchPlayerViewController];
        [WeakRetained setAvPlayerViewController:v14];
        uint64_t v15 = VUIDefaultLogObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = [WeakRetained name];
          *(_DWORD *)buf = 134218498;
          id v35 = WeakRetained;
          __int16 v36 = 2112;
          uint64_t v37 = v16;
          __int16 v38 = 2112;
          int v39 = v13;
          _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) loading playback with prefetch player %@", buf, 0x20u);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        double v17 = [WeakRetained prefetchPlayer];
        id v18 = [v17 state];
        uint64_t v19 = [MEMORY[0x1E4FA9D88] paused];
        if (v18 == (void *)v19)
        {
        }
        else
        {
          uint64_t v20 = (void *)v19;
          char v21 = [WeakRetained isVideoFrameFallbackEnabled];

          if (v21) {
            goto LABEL_18;
          }
        }
        uint64_t v28 = MEMORY[0x1E4F143A8];
        uint64_t v29 = 3221225472;
        char v30 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_359;
        char v31 = &unk_1E6DF3F68;
        id v32 = v13;
        id v33 = WeakRetained;
        [WeakRetained _swapActiveMedia:0 animated:0 completion:&v28];

LABEL_18:
        objc_msgSend(WeakRetained, "setPrefetchPlayer:", 0, v28, v29, v30, v31);
        [WeakRetained setPrefetchPlayerViewController:0];

        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  id v22 = [WeakRetained mediaInfoFetchController];
  id v13 = objc_msgSend(v22, "loadPlayerAtIndex:", objc_msgSend(WeakRetained, "mediaInfoIndex"));

  __int16 v23 = [WeakRetained playbackInitiatorForRTCReporting];
  [v13 setReportingValueWithString:v23 forKey:@"initiator"];

  id v24 = VUIDefaultLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v25 = [WeakRetained name];
    *(_DWORD *)buf = 134218242;
    id v35 = v25;
    __int16 v36 = 2112;
    uint64_t v37 = v13;
    _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) loading playback with new player", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_13:
  id v26 = [v4 currentState];

  return v26;
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_359(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) videoAudioRampDuration];
  return objc_msgSend(v1, "playWithVolumeRampDuration:");
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_360(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id v9 = [v8 objectForKeyedSubscript:@"AnimatedKey"];
  if (v9)
  {
    id v10 = [v8 objectForKeyedSubscript:@"AnimatedKey"];
    uint64_t v11 = [v10 BOOLValue];
  }
  else
  {
    uint64_t v11 = 1;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isBackgrounded])
  {
    [WeakRetained _postWillStartPlaybackNotification:0];
    if ((v11 & 1) == 0)
    {
      id v13 = [WeakRetained player];
      [WeakRetained videoAudioRampDuration];
      objc_msgSend(v13, "playWithVolumeRampDuration:");
    }
    char v14 = v11 ^ 1;
    [WeakRetained setState:3];
  }
  else
  {
    char v14 = 0;
  }
  [WeakRetained _disableSubtitleIfNeeded];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_361;
  _OWORD v19[3] = &unk_1E6DF6B68;
  char v21 = v14;
  void v19[4] = WeakRetained;
  id v20 = v7;
  id v15 = v7;
  [WeakRetained _swapActiveMedia:0 animated:v11 completion:v19];
  if ([WeakRetained isBackgrounded]) {
    uint64_t v16 = @"Showing playback in background";
  }
  else {
    uint64_t v16 = @"Showing playback in foreground";
  }
  double v17 = v16;

  return v17;
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_361(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48) && [*(id *)(a1 + 32) isBackgrounded])
  {
    uint64_t v2 = [*(id *)(a1 + 32) player];
    [*(id *)(a1 + 32) videoAudioRampDuration];
    objc_msgSend(v2, "playWithVolumeRampDuration:");
  }
  id v3 = *(void **)(a1 + 40);
  return [v3 executeBlockAfterCurrentStateTransition:&__block_literal_global_162];
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_363(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v26 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = [v11 objectForKeyedSubscript:@"AnimatedKey"];
  if (v12)
  {
    id v13 = [v11 objectForKeyedSubscript:@"AnimatedKey"];
    int v14 = [v13 BOOLValue] ^ 1;
  }
  else
  {
    int v14 = 0;
  }

  id v15 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v17 = [WeakRetained player];
  id v18 = [v17 state];
  uint64_t v19 = [MEMORY[0x1E4FA9D88] playing];
  BOOL v20 = v18 == v19;

  [WeakRetained _disableSubtitleIfNeeded];
  if (![WeakRetained isBackgrounded]) {
    goto LABEL_10;
  }
  if (v18 == v19) {
    goto LABEL_8;
  }
  [WeakRetained _postWillStartPlaybackNotification:0];
  BOOL v20 = 0;
  if (v14)
  {
    char v21 = [WeakRetained player];
    [WeakRetained videoAudioRampDuration];
    objc_msgSend(v21, "playWithVolumeRampDuration:");

LABEL_8:
    BOOL v20 = 1;
  }
  [WeakRetained setState:3];
LABEL_10:
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_364;
  v27[3] = &unk_1E6DFDAA0;
  id v22 = v9;
  id v28 = v22;
  objc_copyWeak(&v30, v15);
  BOOL v31 = v20;
  id v29 = WeakRetained;
  [WeakRetained _swapActiveMedia:0 animated:0 completion:v27];
  if ([WeakRetained isBackgrounded]) {
    __int16 v23 = @"Showing playback in background";
  }
  else {
    __int16 v23 = @"Showing playback in foreground";
  }
  id v24 = v23;
  objc_destroyWeak(&v30);

  return v24;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_364(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7_365;
  v3[3] = &unk_1E6DF7118;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  char v5 = *(unsigned char *)(a1 + 56);
  v3[4] = *(void *)(a1 + 40);
  [v2 executeBlockAfterCurrentStateTransition:v3];
  objc_destroyWeak(&v4);
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7_365(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = WeakRetained;
    int v4 = [WeakRetained isBackgrounded];
    id v3 = v6;
    if (v4)
    {
      char v5 = [v6 player];
      [*(id *)(a1 + 32) videoAudioRampDuration];
      objc_msgSend(v5, "playWithVolumeRampDuration:");

      id v3 = v6;
    }
  }
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_8_366(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 objectForKeyedSubscript:@"PlaybackStateKey"];
  int v14 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v16 = VUIDefaultLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    double v17 = [WeakRetained name];
    *(_DWORD *)buf = 134218754;
    id v34 = WeakRetained;
    __int16 v35 = 2112;
    __int16 v36 = v17;
    __int16 v37 = 2112;
    id v38 = v10;
    __int16 v39 = 2112;
    uint64_t v40 = v13;
    _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) event %@, newPlaybackState: %@", buf, 0x2Au);
  }
  id v18 = [v9 currentState];
  uint64_t v19 = [MEMORY[0x1E4FA9D88] loading];
  BOOL v20 = v13 == v19;

  if (v20)
  {

LABEL_11:
    id v18 = @"Loading playback";
    goto LABEL_12;
  }
  char v21 = [MEMORY[0x1E4FA9D88] paused];
  BOOL v22 = v13 == v21;

  if (v22)
  {

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_367;
    v29[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v30, v14);
    [v9 executeBlockAfterCurrentStateTransition:v29];
    objc_destroyWeak(&v30);
    goto LABEL_11;
  }
  __int16 v23 = [MEMORY[0x1E4FA9D88] stopped];
  BOOL v24 = v13 == v23;

  if (v24)
  {
    BOOL v31 = @"AnimatedKey";
    uint64_t v32 = MEMORY[0x1E4F1CC38];
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    [v9 postEvent:@"Finished playback" withContext:0 userInfo:v28];
  }
  else
  {
    __int16 v25 = VUIDefaultLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [WeakRetained name];
      *(_DWORD *)buf = 134218498;
      id v34 = WeakRetained;
      __int16 v35 = 2112;
      __int16 v36 = v26;
      __int16 v37 = 2112;
      id v38 = v13;
      _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) StateWaitingForPlayerToStartLoading unhandled newPlaybackState: %@", buf, 0x20u);
    }
  }
LABEL_12:

  return v18;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_367(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showPlaybackIfPossible];
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_368(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = [a5 objectForKeyedSubscript:@"PlaybackStateKey"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = [v7 currentState];
  id v11 = [MEMORY[0x1E4FA9D88] paused];

  if (v8 == v11)
  {
    [WeakRetained _showPlaybackIfPossible];
  }
  else
  {
    id v12 = [MEMORY[0x1E4FA9D88] playing];

    if (v8 == v12)
    {
      [v7 postEvent:@"Show playback"];
      [WeakRetained _prefetchNextVideo];
    }
    else
    {
      id v13 = [MEMORY[0x1E4FA9D88] stopped];

      if (v8 == v13)
      {
        __int16 v23 = @"AnimatedKey";
        v24[0] = MEMORY[0x1E4F1CC38];
        int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
        [v7 postEvent:@"Finished playback" withContext:0 userInfo:v14];
      }
      else
      {
        int v14 = VUIDefaultLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [WeakRetained name];
          int v17 = 134218498;
          id v18 = WeakRetained;
          __int16 v19 = 2112;
          BOOL v20 = v15;
          __int16 v21 = 2112;
          BOOL v22 = v8;
          _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) StateLoadingPlayback unhandled newPlaybackState: %@", (uint8_t *)&v17, 0x20u);
        }
      }
    }
  }

  return v10;
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_369(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a5;
  id v9 = [v8 objectForKeyedSubscript:@"PlaybackStateKey"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = [v7 currentState];
  id v12 = [MEMORY[0x1E4FA9D88] stopped];

  if (v9 == v12)
  {
    int v17 = [v8 objectForKeyedSubscript:@"AnimatedKey"];
    if (v17)
    {
      id v18 = [v8 objectForKeyedSubscript:@"AnimatedKey"];
      uint64_t v19 = [v18 BOOLValue];
    }
    else
    {
      uint64_t v19 = 1;
    }

    __int16 v23 = @"AnimatedKey";
    BOOL v20 = [MEMORY[0x1E4F28ED0] numberWithBool:v19];
    v24[0] = v20;
    __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    [v7 postEvent:@"Finished playback" withContext:0 userInfo:v21];
  }
  else
  {
    id v13 = [MEMORY[0x1E4FA9D88] paused];

    if (v9 != v13)
    {
      int v14 = [WeakRetained isBackgrounded];
      id v15 = @"Showing playback in foreground";
      if (v14) {
        id v15 = @"Showing playback in background";
      }
      uint64_t v16 = v15;

      id v11 = v16;
    }
  }

  return v11;
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_370(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = [a5 objectForKeyedSubscript:@"PlaybackStateKey"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = [v7 currentState];
  id v11 = [MEMORY[0x1E4FA9D88] stopped];

  if (v8 == v11)
  {
    [WeakRetained setPendingAnimated:0];
    id v18 = @"AnimatedKey";
    v19[0] = MEMORY[0x1E4F1CC28];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [v7 postEvent:@"Finished playback" withContext:0 userInfo:v16];
  }
  else
  {
    id v12 = [MEMORY[0x1E4FA9D88] paused];

    if (v8 != v12)
    {
      int v13 = [WeakRetained isBackgrounded];
      int v14 = @"Showing playback in foreground";
      if (v13) {
        int v14 = @"Showing playback in background";
      }
      id v15 = v14;

      id v10 = v15;
    }
  }

  return v10;
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_371(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_372;
  v16[3] = &unk_1E6DF3F90;
  objc_copyWeak(&v19, (id *)(a1 + 32));
  id v13 = v12;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  [v14 executeBlockAfterCurrentStateTransition:v16];

  objc_destroyWeak(&v19);
  return @"Finished playback";
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_372(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained pendingMediaInfoDirection];
  id v3 = (void *)[*(id *)(a1 + 32) mutableCopy];
  int v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v2];
  [v3 setObject:v4 forKey:@"DirectionKey"];

  char v5 = [WeakRetained pendingAnimated];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"AnimatedKey"];
  }
  if (([WeakRetained prefetchesVideoFrame] & 1) == 0)
  {
    [WeakRetained _postDidStopPlaybackNotification];
    [WeakRetained _cleanUpEverythingPlaybackRelated];
  }
  if ([WeakRetained popWhenPlayerStops])
  {
    uint64_t v6 = [WeakRetained vuiNavigationController];
    id v7 = [v6 topViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [WeakRetained vuiNavigationController];
      id v9 = (id)[v8 popViewControllerAnimated:1];
    }
    else
    {
      id v13 = [WeakRetained pendingMediaInfo];

      if (v13)
      {
        [WeakRetained setPendingMediaInfo:0];
        [WeakRetained setPendingMediaInfoDirection:0];
        [WeakRetained setPendingAnimated:0];
        id v14 = *(void **)(a1 + 40);
        id v15 = @"Set media info";
      }
      else
      {
        id v14 = *(void **)(a1 + 40);
        id v15 = @"Show image";
      }
      [v14 postEvent:v15 withContext:0 userInfo:v3];
    }
  }
  else
  {
    id v10 = [WeakRetained pendingMediaInfo];

    if (v10)
    {
      [WeakRetained setPendingMediaInfo:0];
      [WeakRetained setPendingMediaInfoDirection:0];
      [WeakRetained setPendingAnimated:0];
      id v11 = *(void **)(a1 + 40);
      id v12 = @"Set media info";
    }
    else
    {
      id v11 = *(void **)(a1 + 40);
      id v12 = @"Show image";
    }
    [v11 postEvent:v12 withContext:0 userInfo:v3];
  }
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_374(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setState:1];
  [WeakRetained _cleanUpEverythingPlaybackRelated];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_375;
  v13[3] = &unk_1E6DF3F68;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  [v11 executeBlockAfterCurrentStateTransition:v13];

  return @"Finished playback";
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_375(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Show image" withContext:0 userInfo:*(void *)(a1 + 40)];
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7_376(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = [WeakRetained currentMediaInfo];
  uint64_t v6 = [v5 tvpPlaylist];

  if (v6)
  {
    [v3 postEvent:@"Load playback"];
    id v7 = [v3 currentState];
  }
  else
  {
    id v7 = @"Showing playback in foreground";
  }

  return v7;
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_8_377(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
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

  uint64_t v16 = [v12 objectForKeyedSubscript:@"ShowsPlaybackControlsKey"];
  if (v16)
  {
    id v17 = [v12 objectForKeyedSubscript:@"ShowsPlaybackControlsKey"];
    uint64_t v18 = [v17 BOOLValue];
  }
  else
  {
    uint64_t v18 = 1;
  }

  id v19 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v21 = [WeakRetained player];
  [v21 setPreventsSleepDuringVideoPlayback:1];

  [WeakRetained setShowsVideoControls:v18];
  [WeakRetained _updateCurrentPlaybackViewFrameForPlaybackInBackground:0 animated:v15];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_9_378;
  v24[3] = &unk_1E6DF5490;
  objc_copyWeak(&v26, v19);
  id v22 = v12;
  id v25 = v22;
  [v9 executeBlockAfterCurrentStateTransition:v24];

  objc_destroyWeak(&v26);
  return @"Showing playback in foreground";
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_9_378(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updatePlayerMuteStateForBackgroundPlaybackWithReason:@"VUIBackgroundMediaControllerPlaybackMuteReasonForegrounded"];
  int v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"IsFullScreenPlayerKey"];
  if (v4)
  {
    char v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"IsFullScreenPlayerKey"];
    int v6 = [v5 BOOLValue];
  }
  else
  {
    int v6 = 0;
  }

  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [WeakRetained name];
    *(_DWORD *)buf = 134218498;
    id v25 = WeakRetained;
    __int16 v26 = 2112;
    uint64_t v27 = v8;
    __int16 v28 = 1024;
    int v29 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) handle showPlaybackInForeground: isFullScreenPlayer = %d", buf, 0x1Cu);
  }
  if (v6)
  {
    id v9 = [WeakRetained avPlayerViewController];
    id v10 = [v9 view];
    [v10 layoutIfNeeded];

    id v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [WeakRetained name];
      *(_DWORD *)buf = 134218242;
      id v25 = WeakRetained;
      __int16 v26 = 2112;
      uint64_t v27 = v12;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) handle showPlaybackInForeground: enterFullScreenWithCompletion", buf, 0x16u);
    }
    id v13 = [WeakRetained avPlayerViewController];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_379;
    id v19 = &unk_1E6DF6510;
    id v20 = WeakRetained;
    objc_copyWeak(&v21, v2);
    [v13 enterFullScreenWithCompletion:&v16];

    objc_destroyWeak(&v21);
  }
  id v22 = @"VUIBackgroundMediaControllerIsForegroundedKey";
  uint64_t v23 = MEMORY[0x1E4F1CC38];
  id v14 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1, v16, v17, v18, v19, v20);
  uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 postNotificationName:@"VUIBackgroundMediaControllerForegroundStateDidChangeNotification" object:WeakRetained userInfo:v14];
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_379(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = VUIDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    int v4 = [v3 name];
    int v6 = 134218242;
    id v7 = v3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playback did enterFullScreen", (uint8_t *)&v6, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDidAVPlayerControllerEnterFullscreen:1];
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_380(uint64_t a1, void *a2)
{
  id v3 = [a2 currentState];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained player];
  if (v5)
  {
    int v6 = (void *)v5;
    id v7 = [WeakRetained avPlayerViewController];

    if (v7)
    {

      id v3 = @"Showing playback in background";
    }
  }

  return v3;
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_381(uint64_t a1, void *a2)
{
  id v3 = [a2 currentState];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShowsVideoControls:0];

  return v3;
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_382(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
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

  uint64_t v16 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v18 = [WeakRetained player];
  [v18 setPreventsSleepDuringVideoPlayback:0];

  [WeakRetained setShowsVideoControls:0];
  [WeakRetained _updateCurrentPlaybackViewFrameForPlaybackInBackground:1 animated:v15];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_383;
  v20[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v21, v16);
  [v9 executeBlockAfterCurrentStateTransition:v20];
  objc_destroyWeak(&v21);

  return @"Showing playback in background";
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_383(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePlayerMuteStateForBackgroundPlaybackWithReason:@"VUIBackgroundMediaControllerPlaybackMuteReasonBackgrounded"];
  int v4 = @"VUIBackgroundMediaControllerIsForegroundedKey";
  v5[0] = MEMORY[0x1E4F1CC28];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"VUIBackgroundMediaControllerForegroundStateDidChangeNotification" object:WeakRetained userInfo:v2];
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_384(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained player];
  int v6 = [v5 state];
  id v7 = [MEMORY[0x1E4FA9D88] playing];

  if (v6 != v7)
  {
    [WeakRetained _postWillStartPlaybackNotification:0];
    __int16 v8 = [v3 currentState];
    id v9 = v8;
    if (([(__CFString *)v8 isEqualToString:@"Showing playback in background"] & 1) == 0)
    {
      id v9 = v8;
      if (([(__CFString *)v8 isEqualToString:@"Showing playback in foreground"] & 1) == 0)
      {
        if ([WeakRetained isBackgrounded]) {
          id v10 = @"Showing playback in background";
        }
        else {
          id v10 = @"Showing playback in foreground";
        }
        id v9 = v10;
      }
    }
    id v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [WeakRetained name];
      int v16 = 134218754;
      id v17 = WeakRetained;
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2112;
      uint64_t v23 = v9;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) configure audioSession before playing video, current: %@, future: %@", (uint8_t *)&v16, 0x2Au);
    }
    [WeakRetained _configureAudioSessionForState:v9];
    id v13 = [WeakRetained player];
    [WeakRetained videoAudioRampDuration];
    objc_msgSend(v13, "playWithVolumeRampDuration:");

    if ([WeakRetained prefetchesVideoFrame]) {
      [WeakRetained _updateVideoPlayerLegibleContentInsets:1];
    }
  }
  id v14 = [v3 currentState];

  return v14;
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_385(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_386;
  v14[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  [v9 executeBlockAfterCurrentStateTransition:v14];
  objc_destroyWeak(&v15);

  return @"Showing playback in background";
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_386(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v1 = [WeakRetained player];
  uint64_t v2 = [v1 state];
  id v3 = [MEMORY[0x1E4FA9D88] playing];

  if (v2 != v3)
  {
    int v4 = [WeakRetained player];
    [WeakRetained videoAudioRampDuration];
    objc_msgSend(v4, "playWithVolumeRampDuration:");
  }
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_387(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  __int16 v22 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_388;
  uint64_t v23 = &unk_1E6DF5490;
  objc_copyWeak(&v25, (id *)(a1 + 32));
  id v14 = v9;
  id v24 = v14;
  [v14 executeBlockAfterCurrentStateTransition:&v20];
  if (objc_msgSend(WeakRetained, "prefetchesVideoFrame", v20, v21, v22, v23))
  {
    id v15 = VUIDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [WeakRetained name];
      id v17 = [v14 currentState];
      *(_DWORD *)buf = 134218498;
      id v27 = WeakRetained;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 2112;
      BOOL v31 = v17;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) remaining at %@ for paused state", buf, 0x20u);
    }
    __int16 v18 = [v14 currentState];
  }
  else
  {
    __int16 v18 = @"waiting for timeout while paused";
  }

  objc_destroyWeak(&v25);
  return v18;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_388(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained player];
  uint64_t v5 = [v4 state];
  int v6 = [MEMORY[0x1E4FA9D88] paused];

  if (v5 != v6)
  {
    id v7 = [WeakRetained player];
    [v7 pause];

    if (([WeakRetained prefetchesVideoFrame] & 1) == 0)
    {
      __int16 v8 = [WeakRetained pauseStateTimeoutTimer];
      [v8 invalidate];

      [WeakRetained setPauseStateTimeoutTimer:0];
      id v9 = (void *)MEMORY[0x1E4F1CB00];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_389;
      v11[3] = &unk_1E6DFD988;
      objc_copyWeak(&v13, v2);
      void v11[4] = WeakRetained;
      id v12 = *(id *)(a1 + 32);
      id v10 = [v9 scheduledTimerWithTimeInterval:0 repeats:v11 block:480.0];
      [WeakRetained setPauseStateTimeoutTimer:v10];

      objc_destroyWeak(&v13);
    }
  }
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_389(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v4 name];
    int v6 = [*(id *)(a1 + 40) currentState];
    int v9 = 134218498;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) timedout while waiting in pause state, current state %@", (uint8_t *)&v9, 0x20u);
  }
  id v7 = [*(id *)(a1 + 40) currentState];
  int v8 = [v7 isEqualToString:@"waiting for timeout while paused"];

  if (v8)
  {
    [WeakRetained setAutomaticPlaybackStop:1];
    [WeakRetained setVpafPlaybackStopReason:4];
    [*(id *)(a1 + 40) postEvent:@"Stop"];
  }
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_390(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = [WeakRetained player];
  [v10 pause];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_391;
  v14[3] = &unk_1E6DF3F68;
  id v15 = v7;
  id v16 = v8;
  id v11 = v8;
  id v12 = v7;
  [v12 executeBlockAfterCurrentStateTransition:v14];

  return @"Waiting to stop after showing image";
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_391(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Show image" withContext:0 userInfo:*(void *)(a1 + 40)];
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_392(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = [v7 currentState];
  if (v8
    && ([v8 objectForKeyedSubscript:@"PlaybackStopReasonKey"],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    id v12 = [v8 objectForKeyedSubscript:@"PlaybackStopReasonKey"];
    uint64_t v13 = [v12 unsignedIntValue];
  }
  else
  {
    uint64_t v13 = 0;
  }
  int v14 = [WeakRetained playbackStopDelayReasons];
  if ((v14 & v13) <= 4 && ((1 << (v14 & v13)) & 0x16) != 0)
  {

    [WeakRetained playbackStopDelay];
    objc_msgSend(WeakRetained, "performSelector:withObject:afterDelay:", sel_stop, 0);
    id v10 = @"waiting to stop playback";
    goto LABEL_17;
  }
  id v16 = [WeakRetained player];

  if (!v16)
  {
    id v25 = @"AnimatedKey";
    uint64_t v26 = MEMORY[0x1E4F1CC38];
    uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
    __int16 v22 = &v26;
    uint64_t v23 = &v25;
LABEL_15:
    uint64_t v20 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];
    [v7 postEvent:@"Finished playback" withContext:0 userInfo:v20];
    goto LABEL_16;
  }
  id v17 = [WeakRetained player];
  __int16 v18 = [v17 state];
  id v19 = [MEMORY[0x1E4FA9D88] stopped];

  if (v18 == v19)
  {
    id v27 = @"AnimatedKey";
    v28[0] = MEMORY[0x1E4F1CC38];
    uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
    __int16 v22 = v28;
    uint64_t v23 = &v27;
    goto LABEL_15;
  }
  [WeakRetained setAutomaticPlaybackStop:v13 == 0];
  [WeakRetained _postWillStopPlaybackNotification];
  uint64_t v20 = [WeakRetained player];
  [v20 stop];
LABEL_16:

LABEL_17:
  return v10;
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_393(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  int v6 = [WeakRetained currentMediaInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [WeakRetained currentMediaInfo];
    id v8 = [v7 tvpPlaylist];

    if (v8)
    {
      if ([WeakRetained isBackgrounded])
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      else
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_394;
        v12[3] = &unk_1E6DF3D58;
        v12[4] = WeakRetained;
        [v4 executeBlockAfterCurrentStateTransition:v12];
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [WeakRetained name];
    *(_DWORD *)buf = 134218242;
    id v14 = WeakRetained;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) No playlist has been set; ignoring replay event",
      buf,
      0x16u);
  }
LABEL_9:

  id v10 = [v4 currentState];

  return v10;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_394(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 postEvent:@"Load playback"];
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_395(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = [v3 currentState];
  int v6 = [WeakRetained currentMediaInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [WeakRetained currentMediaInfo];
    id v8 = [v7 tvpPlaylist];

    if (v8)
    {
      if ([WeakRetained isBackgrounded])
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      else
      {

        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_396;
        v11[3] = &unk_1E6DF3DD0;
        id v12 = *(id *)(a1 + 40);
        [v3 executeBlockAfterCurrentStateTransition:v11];

        uint64_t v5 = @"Waiting for player to start loading";
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [WeakRetained name];
    *(_DWORD *)buf = 134218242;
    id v14 = WeakRetained;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) No playlist has been set; ignoring replay event",
      buf,
      0x16u);
  }
LABEL_9:

  return v5;
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_396(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_397(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained currentMediaInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [WeakRetained currentMediaInfo];
    uint64_t v5 = [v4 tvpPlaylist];

    if (v5)
    {
      if ([WeakRetained isBackgrounded]) {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  int v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [WeakRetained name];
    int v9 = 134218242;
    id v10 = WeakRetained;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) No playlist has been set; ignoring replay event",
      (uint8_t *)&v9,
      0x16u);
  }
  uint64_t v5 = 0;
LABEL_9:

  return @"Showing image";
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_398(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = (id *)(a1 + 40);
  id v8 = a5;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  __int16 v11 = [v8 objectForKey:@"AVPlayerViewControllerKey"];
  [WeakRetained setAvPlayerViewController:v11];
  id v12 = [v8 objectForKeyedSubscript:@"PlayerKey"];

  [WeakRetained setPlayer:v12];
  uint64_t v13 = [WeakRetained player];
  [v13 setPreventsSleepDuringVideoPlayback:0];

  [WeakRetained setShowsVideoControls:0];
  [WeakRetained transitionToForeground:0 animated:0];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  __int16 v18 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_399;
  id v19 = &unk_1E6DF41E8;
  id v14 = *(id *)(a1 + 32);
  id v20 = WeakRetained;
  id v21 = v14;
  [v9 executeBlockAfterCurrentStateTransition:&v16];

  if (objc_msgSend(WeakRetained, "prefetchesVideoFrame", v16, v17, v18, v19))
  {
    [WeakRetained _prefetchNextVideo];
    [WeakRetained _populatePlayerWithMediaItemsIfNeeded:v12];
  }

  return @"Showing playback in background";
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_399(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) player];
  (*(void (**)(uint64_t, id, uint64_t))(v1 + 16))(v1, v2, 1);
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_400(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = (id *)(a1 + 40);
  id v8 = a5;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained _cleanUpEverythingPlaybackRelated];
  __int16 v11 = [v8 objectForKey:@"AVPlayerViewControllerKey"];
  [WeakRetained setAvPlayerViewController:v11];
  id v12 = [v8 objectForKeyedSubscript:@"PlayerKey"];

  uint64_t v13 = [WeakRetained player];
  [v13 setPreventsSleepDuringVideoPlayback:0];

  [WeakRetained setShowsVideoControls:0];
  [WeakRetained transitionToForeground:0 animated:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_401;
  v16[3] = &unk_1E6DF3F68;
  void v16[4] = WeakRetained;
  id v17 = v12;
  id v14 = v12;
  [v9 executeBlockAfterCurrentStateTransition:v16];

  return @"Showing playback in background";
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_401(uint64_t a1)
{
  [*(id *)(a1 + 32) _prefetchNextVideo];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _populatePlayerWithMediaItemsIfNeeded:v3];
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_402(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_403;
  v14[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  [v9 executeBlockAfterCurrentStateTransition:v14];
  objc_destroyWeak(&v15);

  return @"Showing playback in foreground";
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_403(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (![WeakRetained shouldStopPlayerWhenExitingFullScreen])
  {
    uint64_t v3 = [WeakRetained player];
    id v4 = [v3 state];

    uint64_t v5 = [MEMORY[0x1E4FA9D88] playing];
    if (v4 == (void *)v5)
    {
    }
    else
    {
      int v6 = (void *)v5;
      id v7 = [MEMORY[0x1E4FA9D88] loading];

      if (v4 != v7)
      {
        [WeakRetained stop];
        uint64_t v2 = 1;
LABEL_8:

        goto LABEL_9;
      }
    }
    [WeakRetained transitionToForeground:0 animated:1];
    uint64_t v2 = 0;
    goto LABEL_8;
  }
  [WeakRetained stop];
  uint64_t v2 = 1;
LABEL_9:
  [WeakRetained setDidAVPlayerControllerEnterFullscreen:0];
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v11 = @"VUIBackgroundMediaControllerInfoHasVideoStopped";
  id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v2];
  v12[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v8 postNotificationName:@"VUIBackgroundMediaControllerDidEndFullscreenPresentationNotification" object:WeakRetained userInfo:v10];
}

- (void)setState:(unint64_t)a3
{
  [(VUIBackgroundMediaController *)self willChangeValueForKey:@"state"];
  self->_state = a3;
  [(VUIBackgroundMediaController *)self didChangeValueForKey:@"state"];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"VUIBackgroundMediaControllerDidChangeStateNotification" object:self];
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(VUIBackgroundMediaController *)self name];
    *(_DWORD *)buf = 134218242;
    id v15 = self;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playerViewController willEndFullScreenPresentationWithAnimationCoordinator", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __107__VUIBackgroundMediaController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2;
  v11[3] = &unk_1E6DF7028;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = v6;
  id v12 = v10;
  [v7 animateAlongsideTransition:&__block_literal_global_409 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __107__VUIBackgroundMediaController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v3 = [WeakRetained stateMachine];
    [v3 postEvent:@"AvPlayerViewController did exit fullscreen presentation" withContext:*(void *)(a1 + 32)];
  }
}

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v9 = @"VUIBackgroundMediaControllerControlVisibilityKey";
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:a4];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"VUIBackgroundMediaControllerControlVisibilityChangedNotification" object:self userInfo:v7];
}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(VUIBackgroundMediaController *)self name];
    int v16 = 134218242;
    id v17 = self;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) did start picture in picture", (uint8_t *)&v16, 0x16u);
  }
  id v7 = [v4 presentedViewController];

  if (v7) {
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = [(VUIBackgroundMediaController *)self player];
  objc_msgSend(v8, "vui_setObjectIfNotNil:forKey:", v9, @"VUIBackgroundMediaControllerPlayerKey");

  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v11 = (void *)[v8 copy];
  [v10 postNotificationName:@"VUIBackgroundMediaControllerDidEnterPIPNotification" object:self userInfo:v11];

  if ([(VUIBackgroundMediaController *)self prefetchesVideoFrame])
  {
    id v12 = [(VUIBackgroundMediaController *)self player];
    id v13 = [v12 playlist];

    if (v13)
    {
      id v14 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
      id v15 = [v12 playlist];
      objc_msgSend(v14, "populatePlaylistWithMediaItems:atIndex:", v15, -[VUIBackgroundMediaController mediaInfoIndex](self, "mediaInfoIndex"));

      [v12 setMediaItemEndAction:0];
      [(VUIBackgroundMediaController *)self _cleanupPrefetchPlayback];
    }
  }
}

- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(VUIBackgroundMediaController *)self name];
    int v9 = 134218498;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) failed to start picture in picture with error %@", (uint8_t *)&v9, 0x20u);
  }
  id v8 = +[VUIPlaybackManager sharedInstance];
  [v8 setBackgroundMediaControllerForPIP:0];
}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(VUIBackgroundMediaController *)self name];
    id v6 = [(VUIBackgroundMediaController *)self player];
    id v7 = [v6 state];
    int v18 = 134218498;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    uint64_t v23 = v7;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) did stop picture in picture %@", (uint8_t *)&v18, 0x20u);
  }
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  int v9 = [(VUIBackgroundMediaController *)self player];
  objc_msgSend(v8, "vui_setObjectIfNotNil:forKey:", v9, @"VUIBackgroundMediaControllerPlayerKey");

  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  __int16 v11 = (void *)[v8 copy];
  [v10 postNotificationName:@"VUIBackgroundMediaControllerDidStopPIPNotification" object:self userInfo:v11];

  if ([(VUIBackgroundMediaController *)self prefetchesVideoFrame])
  {
    id v12 = [(VUIBackgroundMediaController *)self player];
    __int16 v13 = [v12 playlist];

    if (v13)
    {
      id v14 = [v12 playlist];
      uint64_t v15 = [v14 activeListIndex];

      int v16 = [(VUIBackgroundMediaController *)self mediaInfoFetchController];
      id v17 = [v12 playlist];
      [v16 removePopulatedMediaItems:v17 atIndex:v15];

      [v12 setMediaItemEndAction:1];
    }
  }
  [(VUIBackgroundMediaController *)self performSelector:sel__cleanupPIPPlayback withObject:0 afterDelay:1.0];
}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void))a4;
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(VUIBackgroundMediaController *)self name];
    id v8 = [(VUIBackgroundMediaController *)self player];
    int v9 = [v8 state];
    *(_DWORD *)buf = 134218498;
    id v17 = self;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) restore picture in picture %@", buf, 0x20u);
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__cleanupPIPPlayback object:0];
  id v10 = [(VUIBackgroundMediaController *)self player];
  __int16 v11 = [v10 state];
  id v12 = [MEMORY[0x1E4FA9D88] stopped];

  if (v11 == v12)
  {
    [(VUIBackgroundMediaController *)self _cleanupPIPPlayback];
    v5[2](v5, 0);
  }
  else
  {
    __int16 v13 = +[VUIPlaybackManager sharedInstance];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __118__VUIBackgroundMediaController_playerViewController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E6DF3DD0;
    uint64_t v15 = v5;
    [v13 restoreBackgroundMediaControllerFromPIP:v14];
  }
}

uint64_t __118__VUIBackgroundMediaController_playerViewController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_cleanupPIPPlayback
{
  id v2 = +[VUIPlaybackManager sharedInstance];
  [v2 setBackgroundMediaControllerForPIP:0];
}

- (TVPPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (VUIImageView)proxyImageView
{
  return self->_proxyImageView;
}

- (void)setProxyImageView:(id)a3
{
}

- (AVPlayerViewController)avPlayerViewController
{
  return self->_avPlayerViewController;
}

- (NSString)videoGravity
{
  return self->_videoGravity;
}

- (unint64_t)mediaInfoIndex
{
  return self->_mediaInfoIndex;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setDidAVPlayerControllerEnterFullscreen:(BOOL)a3
{
  self->_didAVPlayerControllerEnterFullscreen = a3;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isPlaybackEnabled
{
  return self->_playbackEnabled;
}

- (BOOL)forceAutoPlay
{
  return self->_forceAutoPlay;
}

- (void)setForceAutoPlay:(BOOL)a3
{
  self->_forceAutoPlay = a3;
}

- (BOOL)autoPlayInSharePlay
{
  return self->_autoPlayInSharePlay;
}

- (void)setAutoPlayInSharePlay:(BOOL)a3
{
  self->_autoPlayInSharePlay = a3;
}

- (BOOL)prefetchesVideoFrame
{
  return self->_prefetchesVideoFrame;
}

- (void)setPrefetchesVideoFrame:(BOOL)a3
{
  self->_prefetchesVideoFrame = a3;
}

- (double)videoAudioRampDuration
{
  return self->_videoAudioRampDuration;
}

- (void)setVideoAudioRampDuration:(double)a3
{
  self->_videoAudioRampDuration = a3;
}

- (BOOL)recordPausedMediaEventAsStop
{
  return self->_recordPausedMediaEventAsStop;
}

- (void)setRecordPausedMediaEventAsStop:(BOOL)a3
{
  self->_recordPausedMediaEventAsSCGFloat top = a3;
}

- (BOOL)isVideoFrameFallbackEnabled
{
  return self->_videoFrameFallbackEnabled;
}

- (void)setVideoFrameFallbackEnabled:(BOOL)a3
{
  self->_videoFrameFallbackEnabled = a3;
}

- (BOOL)allowsExternalPlayback
{
  return self->_allowsExternalPlayback;
}

- (BOOL)supportsMediaSharing
{
  return self->_supportsMediaSharing;
}

- (void)setSupportsMediaSharing:(BOOL)a3
{
  self->_supportsMediaSharing = a3;
}

- (BOOL)updatesNowPlayingInfoCenter
{
  return self->_updatesNowPlayingInfoCenter;
}

- (BOOL)stopsPlaybackWhenInactive
{
  return self->_stopsPlaybackWhenInactive;
}

- (void)setStopsPlaybackWhenInactive:(BOOL)a3
{
  self->_stopsPlaybackWhenInactive = a3;
}

- (BOOL)loadsPlayerWithFullscreenPlayback
{
  return self->_loadsPlayerWithFullscreenPlayback;
}

- (void)setLoadsPlayerWithFullscreenPlayback:(BOOL)a3
{
  self->_loadsPlayerWithFullscreenPlayback = a3;
}

- (BOOL)shouldStopPlayerWhenViewDisappears
{
  return self->_stopPlayerWhenViewDisappears;
}

- (void)setStopPlayerWhenViewDisappears:(BOOL)a3
{
  self->_stopPlayerWhenViewDisappears = a3;
}

- (BOOL)shouldStopPlayerWhenExitingFullScreen
{
  return self->_stopPlayerWhenExitingFullScreen;
}

- (void)setStopPlayerWhenExitingFullScreen:(BOOL)a3
{
  self->_stopPlayerWhenExitingFullScreen = a3;
}

- (BOOL)exitsFullscreenWhenPlaybackEnds
{
  return self->_exitsFullscreenWhenPlaybackEnds;
}

- (BOOL)clearPreviousImageBeforeLoading
{
  return self->_clearPreviousImageBeforeLoading;
}

- (void)setClearPreviousImageBeforeLoading:(BOOL)a3
{
  self->_clearPreviousImageBeforeLoading = a3;
}

- (BOOL)animateImageChange
{
  return self->_animateImageChange;
}

- (void)setAnimateImageChange:(BOOL)a3
{
  self->_animateImageChange = a3;
}

- (BOOL)animateVideoChange
{
  return self->_animateVideoChange;
}

- (void)setAnimateVideoChange:(BOOL)a3
{
  self->_animateVideoChange = a3;
}

- (unint64_t)imageContentMode
{
  return self->_imageContentMode;
}

- (BOOL)popWhenPlayerStops
{
  return self->_popWhenPlayerStops;
}

- (void)setPopWhenPlayerStops:(BOOL)a3
{
  self->_popWhenPlayerStops = a3;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (BOOL)mutePlaybackInBackground
{
  return self->_mutePlaybackInBackground;
}

- (BOOL)prefersAudioOverPictureInPicture
{
  return self->_prefersAudioOverPictureInPicture;
}

- (void)setPrefersAudioOverPictureInPicture:(BOOL)a3
{
  self->_prefersAudioOverPictureInPicture = a3;
}

- (BOOL)shouldUseForegroundAudioSessionInBackgroundMode
{
  return self->_useForegroundAudioSessionInBackgroundMode;
}

- (BOOL)shouldShowFullScreenButton
{
  return self->_shouldShowFullScreenButton;
}

- (float)backgroundVolume
{
  return self->_backgroundVolume;
}

- (void)setBackgroundVolume:(float)a3
{
  self->_backgroundVolume = a3;
}

- (float)foregroundVolume
{
  return self->_foregroundVolume;
}

- (void)setForegroundVolume:(float)a3
{
  self->_foregroundVolume = a3;
}

- (double)volumeTransitionAnimationDuration
{
  return self->_volumeTransitionAnimationDuration;
}

- (void)setVolumeTransitionAnimationDuration:(double)a3
{
  self->_volumeTransitionAnimationDuration = a3;
}

- (unint64_t)numberOfVolumeIncrements
{
  return self->_numberOfVolumeIncrements;
}

- (void)setNumberOfVolumeIncrements:(unint64_t)a3
{
  self->_numberOfVolumeIncrements = a3;
}

- (BOOL)shouldStopWhenAnotherMediaControllerStarts
{
  return self->_stopWhenAnotherMediaControllerStarts;
}

- (void)setStopWhenAnotherMediaControllerStarts:(BOOL)a3
{
  self->_stopWhenAnotherMediaControllerStarts = a3;
}

- (unint64_t)playbackStopDelayReasons
{
  return self->_playbackStopDelayReasons;
}

- (void)setPlaybackStopDelayReasons:(unint64_t)a3
{
  self->_playbackStopDelayReasons = a3;
}

- (double)playbackStopDelay
{
  return self->_playbackStopDelay;
}

- (void)setPlaybackStopDelay:(double)a3
{
  self->_playbackStopDelay = a3;
}

- (double)playbackStartDelay
{
  return self->_playbackStartDelay;
}

- (void)setPlaybackStartDelay:(double)a3
{
  self->_playbackStartDelay = a3;
}

- (unint64_t)imageSwappingAnimationType
{
  return self->_imageSwappingAnimationType;
}

- (void)setImageSwappingAnimationType:(unint64_t)a3
{
  self->_imageSwappingAnimationType = a3;
}

- (unint64_t)videoSwappingAnimationType
{
  return self->_videoSwappingAnimationType;
}

- (void)setVideoSwappingAnimationType:(unint64_t)a3
{
  self->_videoSwappingAnimationType = a3;
}

- (BOOL)shouldPauseAtEnd
{
  return self->_shouldPauseAtEnd;
}

- (void)setShouldPauseAtEnd:(BOOL)a3
{
  self->_shouldPauseAtEnd = a3;
}

- (BOOL)shouldShowImageAndStopAfterPausingAtEnd
{
  return self->_shouldShowImageAndStopAfterPausingAtEnd;
}

- (void)setShouldShowImageAndStopAfterPausingAtEnd:(BOOL)a3
{
  self->_shouldShowImageAndStopAfterPausingAtEnd = a3;
}

- (double)imageTransitionAnimationDuration
{
  return self->_imageTransitionAnimationDuration;
}

- (void)setImageTransitionAnimationDuration:(double)a3
{
  self->_imageTransitionAnimationDuration = a3;
}

- (double)imageVideoTransitionAnimationDuration
{
  return self->_imageVideoTransitionAnimationDuration;
}

- (void)setImageVideoTransitionAnimationDuration:(double)a3
{
  self->_imageVideoTransitionAnimationDuration = a3;
}

- (BOOL)showsPlaybackControlsInForeground
{
  return self->_showsPlaybackControlsInForeground;
}

- (void)setShowsPlaybackControlsInForeground:(BOOL)a3
{
  self->_showsPlaybackControlsInForeground = a3;
}

- (BOOL)allowsPictureInPicturePlayback
{
  return self->_allowsPictureInPicturePlayback;
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)a3
{
  self->_allowsPictureInPicturePlayback = a3;
}

- (UIEdgeInsets)legibleContentInsets
{
  double top = self->_legibleContentInsets.top;
  double left = self->_legibleContentInsets.left;
  double bottom = self->_legibleContentInsets.bottom;
  double right = self->_legibleContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)keepVideoGravityUnchangedByVideoControlsVisibility
{
  return self->_keepVideoGravityUnchangedByVideoControlsVisibility;
}

- (void)setKeepVideoGravityUnchangedByVideoControlsVisibility:(BOOL)a3
{
  self->_keepVideoGravityUnchangedByVideoControlsVisibility = a3;
}

- (BOOL)shouldDisableSubtitle
{
  return self->_shouldDisableSubtitle;
}

- (void)setShouldDisableSubtitle:(BOOL)a3
{
  self->_shouldDisableSubtitle = a3;
}

- (BOOL)disableSupplementalSubtitle
{
  return self->_disableSupplementalSubtitle;
}

- (void)setDisableSupplementalSubtitle:(BOOL)a3
{
  self->_disableSupplementalSubtitle = a3;
}

- (BOOL)isAutomaticPlaybackStart
{
  return self->_automaticPlaybackStart;
}

- (void)setAutomaticPlaybackStart:(BOOL)a3
{
  self->_automaticPlaybackStart = a3;
}

- (BOOL)isPreloadPlaybackEnabled
{
  return self->_preloadPlaybackEnabled;
}

- (NSString)playbackInitiatorForRTCReporting
{
  return self->_playbackInitiatorForRTCReporting;
}

- (void)setPlaybackInitiatorForRTCReporting:(id)a3
{
}

- (VUIImageView)alphaProxyImageView
{
  return self->_alphaProxyImageView;
}

- (void)setAlphaProxyImageView:(id)a3
{
}

- (VUIImageProxy)alphaImageProxy
{
  return self->_alphaImageProxy;
}

- (void)setAlphaImageProxy:(id)a3
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

- (NSDate)playbackStartDate
{
  return self->_playbackStartDate;
}

- (void)setPlaybackStartDate:(id)a3
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

- (NSTimer)playbackDelayTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackDelayTimer);
  return (NSTimer *)WeakRetained;
}

- (void)setPlaybackDelayTimer:(id)a3
{
}

- (NSTimer)imageDelayTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageDelayTimer);
  return (NSTimer *)WeakRetained;
}

- (void)setImageDelayTimer:(id)a3
{
}

- (VUIMediaInfo)pendingMediaInfo
{
  return self->_pendingMediaInfo;
}

- (void)setPendingMediaInfo:(id)a3
{
}

- (unint64_t)pendingMediaInfoDirection
{
  return self->_pendingMediaInfoDirection;
}

- (void)setPendingMediaInfoDirection:(unint64_t)a3
{
  self->_pendingMediaInfoDirection = a3;
}

- (NSNumber)pendingAnimated
{
  return self->_pendingAnimated;
}

- (void)setPendingAnimated:(id)a3
{
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (VUIMediaInfoFetchController)mediaInfoFetchController
{
  return self->_mediaInfoFetchController;
}

- (void)setMediaInfoFetchController:(id)a3
{
}

- (unint64_t)imageAnimationOptions
{
  return self->_imageAnimationOptions;
}

- (void)setImageAnimationOptions:(unint64_t)a3
{
  self->_unint64_t imageAnimationOptions = a3;
}

- (double)imageAnimationDuration
{
  return self->_imageAnimationDuration;
}

- (void)setImageAnimationDuration:(double)a3
{
  self->_double imageAnimationDuration = a3;
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

- (unint64_t)vpafPlaybackStartReason
{
  return self->_vpafPlaybackStartReason;
}

- (void)setVpafPlaybackStartReason:(unint64_t)a3
{
  self->_vpafPlaybackStartReason = a3;
}

- (BOOL)isAutomaticPlaybackStop
{
  return self->_automaticPlaybackStop;
}

- (void)setAutomaticPlaybackStop:(BOOL)a3
{
  self->_automaticPlaybackSdouble top = a3;
}

- (unint64_t)vpafPlaybackStopReason
{
  return self->_vpafPlaybackStopReason;
}

- (void)setVpafPlaybackStopReason:(unint64_t)a3
{
  self->_vpafPlaybackStopReason = a3;
}

- (BOOL)shouldPlayAfterAppBecomesActive
{
  return self->_shouldPlayAfterAppBecomesActive;
}

- (void)setShouldPlayAfterAppBecomesActive:(BOOL)a3
{
  self->_shouldPlayAfterAppBecomesActive = a3;
}

- (BOOL)shouldPlayAfterFullplaybackUIDidEnd
{
  return self->_shouldPlayAfterFullplaybackUIDidEnd;
}

- (void)setShouldPlayAfterFullplaybackUIDidEnd:(BOOL)a3
{
  self->_shouldPlayAfterFullplaybackUIDidEnd = a3;
}

- (BOOL)hasViewAppeared
{
  return self->_hasViewAppeared;
}

- (void)setHasViewAppeared:(BOOL)a3
{
  self->_hasViewAppeared = a3;
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

- (BOOL)showsVideoControls
{
  return self->_showsVideoControls;
}

- (NSNumber)elapsedTimeWhenStopped
{
  return self->_elapsedTimeWhenStopped;
}

- (void)setElapsedTimeWhenStopped:(id)a3
{
}

- (float)fullscreenTransitionVolumeAnimationChanges
{
  return self->_fullscreenTransitionVolumeAnimationChanges;
}

- (void)setFullscreenTransitionVolumeAnimationChanges:(float)a3
{
  self->_fullscreenTransitionVolumeAnimationChanges = a3;
}

- (NSLayoutConstraint)proxyImageWidthConstraint
{
  return self->_proxyImageWidthConstraint;
}

- (void)setProxyImageWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)proxyImageHeightConstraint
{
  return self->_proxyImageHeightConstraint;
}

- (void)setProxyImageHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)proxyImageCenterXConstraint
{
  return self->_proxyImageCenterXConstraint;
}

- (void)setProxyImageCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)proxyImageCenterYConstraint
{
  return self->_proxyImageCenterYConstraint;
}

- (void)setProxyImageCenterYConstraint:(id)a3
{
}

- (VUIPlayer)activePIPingPlayer
{
  return self->_activePIPingPlayer;
}

- (TVPPlayer)prefetchPlayer
{
  return self->_prefetchPlayer;
}

- (void)setPrefetchPlayer:(id)a3
{
}

- (TVPPlayer)rampDownPlayer
{
  return self->_rampDownPlayer;
}

- (void)setRampDownPlayer:(id)a3
{
}

- (NSString)preferredAudioLanguageCode
{
  return self->_preferredAudioLanguageCode;
}

- (void)setPreferredAudioLanguageCode:(id)a3
{
}

- (NSNumber)prefersAudioDescriptions
{
  return self->_prefersAudioDescriptions;
}

- (void)setPrefersAudioDescriptions:(id)a3
{
}

- (AVPlayerViewController)prefetchPlayerViewController
{
  return self->_prefetchPlayerViewController;
}

- (void)setPrefetchPlayerViewController:(id)a3
{
}

- (unint64_t)lastMediaInfoIndex
{
  return self->_lastMediaInfoIndex;
}

- (void)setLastMediaInfoIndex:(unint64_t)a3
{
  self->_unint64_t lastMediaInfoIndex = a3;
}

- (BOOL)observingInitialMediaItemHasCompletedInitialLoading
{
  return self->_observingInitialMediaItemHasCompletedInitialLoading;
}

- (void)setObservingInitialMediaItemHasCompletedInitialLoading:(BOOL)a3
{
  self->_observingInitialMediaItemHasCompletedInitialLoading = a3;
}

- (NSString)lastMediaEventActionType
{
  return self->_lastMediaEventActionType;
}

- (void)setLastMediaEventActionType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMediaEventActionType, 0);
  objc_storeStrong((id *)&self->_prefetchPlayerViewController, 0);
  objc_storeStrong((id *)&self->_prefersAudioDescriptions, 0);
  objc_storeStrong((id *)&self->_preferredAudioLanguageCode, 0);
  objc_storeStrong((id *)&self->_rampDownPlayer, 0);
  objc_storeStrong((id *)&self->_prefetchPlayer, 0);
  objc_storeStrong((id *)&self->_activePIPingPlayer, 0);
  objc_storeStrong((id *)&self->_proxyImageCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_proxyImageCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_proxyImageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_proxyImageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_elapsedTimeWhenStopped, 0);
  objc_storeStrong((id *)&self->_titleForLogging, 0);
  objc_destroyWeak((id *)&self->_pauseStateTimeoutTimer);
  objc_storeStrong((id *)&self->_secondaryVideoView, 0);
  objc_storeStrong((id *)&self->_mediaInfoFetchController, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_pendingAnimated, 0);
  objc_storeStrong((id *)&self->_pendingMediaInfo, 0);
  objc_destroyWeak((id *)&self->_imageDelayTimer);
  objc_destroyWeak((id *)&self->_playbackDelayTimer);
  objc_destroyWeak((id *)&self->_playbackLoadingTimer);
  objc_storeStrong((id *)&self->_playbackStartDate, 0);
  objc_storeStrong((id *)&self->_playbackLoadingStartDate, 0);
  objc_storeStrong((id *)&self->_playbackContainerController, 0);
  objc_storeStrong((id *)&self->_alphaImageProxy, 0);
  objc_storeStrong((id *)&self->_alphaProxyImageView, 0);
  objc_storeStrong((id *)&self->_playbackInitiatorForRTCReporting, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_videoGravity, 0);
  objc_storeStrong((id *)&self->_avPlayerViewController, 0);
  objc_storeStrong((id *)&self->_proxyImageView, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

void __43__VUIBackgroundMediaController__loadImage___block_invoke_3_cold_1(void *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = [a1 name];
  uint64_t v7 = *a2;
  int v8 = 134218498;
  int v9 = a1;
  __int16 v10 = 2112;
  __int16 v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  _os_log_error_impl(&dword_1E2BD7000, a3, OS_LOG_TYPE_ERROR, "VUIBackgroundMediaController::(%p: %@) failed to load image proxy with error: [%@]", (uint8_t *)&v8, 0x20u);
}

- (void)_recordBgAutoPlayMediaEventForPlaybackState:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_27(&dword_1E2BD7000, v2, v3, "VUIBackgroundMediaController::(%p: %@) No media item to record media event", v4, v5, v6, v7, v8);
}

@end